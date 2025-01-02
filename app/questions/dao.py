import uuid
from typing import List

from app.questions.models import UserQuizSession
from app.questions.schemas import SQuizAdd
from sqlalchemy.exc import SQLAlchemyError
from fastapi import HTTPException
from sqlalchemy.orm import Session
from app.db import session_maker
from app.dao.base import BaseDAO
from app.users.models import User
from app.questions.models import UserQuizSession, Choice, Question


class QuizSessionDAO(BaseDAO):
    model = UserQuizSession

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
