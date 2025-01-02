from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy import select, func
from sqlalchemy.orm import joinedload
from sqlalchemy.exc import SQLAlchemyError
from app.db import session_maker
from app.questions.models import Question, Choice, UserQuizSession
from typing import List
from app.questions.schemas import SAnswerCheck, SQuizAdd
from app.users.dependicies import current_user_is_admin, get_current_user
from app.users.models import User
from app.questions.dao import QuizSessionDAO, ChoiceDAO, QuestionDAO

router_questions = APIRouter(prefix='/quiz')

@router_questions.get("/get-quiz")
async def get_rand_quiz(current_user: User = Depends(get_current_user)):
    async with session_maker() as session:
        query = select(Question).options(joinedload(Question.choices)).order_by(func.random()).limit(10)
        result = await session.execute(query)
        quiz_questions = result.scalars().unique().all()
        session_id = await QuizSessionDAO.add_quiz_session(current_user=current_user, quiz_questions=quiz_questions)
        quiz = [{"session_id": session_id,
                 "question_num": i + 1,
                 "Question": question.question,
                 "Choices": [choice.choice for choice in question.choices]}
                for i, question in enumerate(quiz_questions)]

        return quiz


@router_questions.post("/check")
async def check_answers(questions: List[SAnswerCheck], current_user: User = Depends(get_current_user)):
    async with session_maker() as session:
        query = select(UserQuizSession).where(UserQuizSession.session_id == questions[0].session_id)
        result = await session.execute(query)
        session_data = result.scalars().all()
        if not session_data or not session_data[0].user_id == current_user.id:
            raise HTTPException(
                status_code=404, detail=f"Session with id '{questions[0].session_id}' not found or not authorized")
        #len(session_data) != len(questions) error
        answers_dict = dict()
        user_choice_dict = dict()
        for answer in session_data:
            choice = await ChoiceDAO.get_correct_answers(question_id=answer.question_id)
            answers_dict[f"{answer.question_id}"] = [correct.choice for correct in choice]
        for answer in questions:
            quest_id = await QuizSessionDAO.get_id_by_num(session_id=questions[0].session_id, question_num=answer.question_num)
            user_choice_dict[f"{quest_id}"] = [user_choice for user_choice in answer.choice]
        response = []
        for question_id, user_choice in user_choice_dict.items():
            question = await QuestionDAO.find_one_or_none(id=int(question_id))
            choices = await ChoiceDAO.find_all(question_id=int(question_id))
            if not question:
                raise HTTPException(
                    status_code=404, detail=f"Question not found")
            if set(user_choice) != set(answers_dict[f"{question_id}"]):
                response.append({
                    "question": question.question,
                    "user_choice": user_choice,
                    "choices": [obj.choice for obj in choices],
                    "correct_choice": answers_dict[f"{question_id}"],
                    "is_correct": False
                })
            else:
                response.append({
                    "question": question.question,
                    "user_choice": user_choice,
                    "choices": [obj.choice for obj in choices],
                    "correct_choice": answers_dict[f"{question_id}"],
                    "is_correct": True
                })
        return response


@router_questions.post("/add")
async def add_questions_from_json(questions: List[SQuizAdd], current_user=Depends(current_user_is_admin)):
    async with session_maker() as session:
        try:
            for q_data in questions:
                question = Question(question=q_data.question)
                choices = [
                    Choice(choice=c.choice, true_answer=c.true_answer, question=question)
                    for c in q_data.Choices
                ]
                session.add(question)
                session.add_all(choices)
            await session.commit()
            return {"message": "Questions added successfully"}
        except SQLAlchemyError as e:
            await session.rollback()
            raise HTTPException(status_code=500, detail="Internal Server Error")
