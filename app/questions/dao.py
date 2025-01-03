import uuid
from typing import List

from app.questions.schemas import SQuizAdd
from sqlalchemy.exc import SQLAlchemyError
from fastapi import HTTPException
from sqlalchemy import select, func
from app.db import session_maker
from app.dao.base import BaseDAO
from app.users.models import User
from app.questions.models import UserQuizSession, Choice, Question, UserAnswer
from sqlalchemy.orm import joinedload, selectinload


class QuizSessionDAO(BaseDAO):
    model = UserQuizSession

    @classmethod
    async def get_user_session(cls, current_user: User):
        session = await cls.find_all(user_id=current_user.id)
        return session

    @classmethod
    async def add_quiz_session(cls, quiz_questions: List[SQuizAdd], current_user: User):
        async with session_maker() as session:
            session_id = str(uuid.uuid4())
            try:
                for i, question in enumerate(quiz_questions):
                    quiz_session = UserQuizSession(question_id=question.id, session_id=session_id,
                                                   user_id=current_user.id, question_num=i + 1)
                    session.add(quiz_session)
                await session.commit()
                return session_id
            except SQLAlchemyError as e:
                await session.rollback()
                raise HTTPException(status_code=500, detail="Internal Server Error")

    @classmethod
    async def get_id_by_num(cls, question_num: int, session_id: str):
        question = await cls.find_one_or_none(question_num=question_num, session_id=session_id)
        if question:
            return question.question_id
        raise HTTPException(status_code=404, detail="Invalid question")

    @classmethod
    async def recover_session(cls, user_session: List[UserQuizSession]):
        async with session_maker() as session:
            quiz = []
            for el in user_session:
                query = select(Question).options(selectinload(Question.choices)).where(Question.id == el.question_id)
                result = await session.execute(query)
                quiz_question = result.scalar_one_or_none()
                if quiz_question:
                    quiz.append({"session_id": el.session_id,
                                 "question_num": el.question_num,
                                 "Question": quiz_question.question,
                                 "Choices": [choice.choice for choice in quiz_question.choices]})
                else:
                    return None
            return quiz

    @classmethod
    async def get_rand_quiz(cls, current_user: User):
        async with session_maker() as session:
            query = select(UserAnswer.question_id).where(UserAnswer.user_id == current_user.id)
            result = await session.execute(query)
            not_in = result.scalars().all()
            not_in = list(not_in)
            query = select(Question).where(Question.id.notin_(not_in)).options(joinedload(Question.choices)).order_by(func.random()).limit(10)
            result = await session.execute(query)
            quiz_questions = result.scalars().unique().all()
            session_id = await QuizSessionDAO.add_quiz_session(current_user=current_user, quiz_questions=quiz_questions)
            if session_id:
                quiz = [{"session_id": session_id,
                         "question_num": i + 1,
                         "Question": question.question,
                         "Choices": [choice.choice for choice in question.choices]}
                        for i, question in enumerate(quiz_questions)]
                return quiz
            return None

    @classmethod
    async def remove_session(cls, current_user: User):
        return await QuizSessionDAO.delete_all(user_id=current_user.id)


class ChoiceDAO(BaseDAO):
    model = Choice

    @classmethod
    async def get_correct_answers(cls, question_id: int):
        answer = await cls.find_all(question_id=question_id, true_answer=True)
        if answer:
            return answer
        raise HTTPException(status_code=404, detail="Invalid question")


class QuestionDAO(BaseDAO):
    model = Question
