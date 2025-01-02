import json
from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy import select, func
from sqlalchemy.orm import joinedload
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.exc import SQLAlchemyError
from app.db import session_maker
from app.Questions.models import Question, Choice
from pydantic import BaseModel
from typing import List


class ChoiceData(BaseModel):
    choice: str
    true_answer: bool


class QuestionData(BaseModel):
    question: str
    choices: List[ChoiceData]


class AnswerData(BaseModel):
    question: str
    choice: str


router_questions = APIRouter(prefix='/quiz')


@router_questions.get("/")
async def get_rand_quiz():
    async with session_maker() as session:
        query = select(Question).options(joinedload(
            Question.choices)).order_by(func.random()).limit(10)
        result = await session.execute(query)
        quiz = result.scalars().unique().all()
        quiz = [{"Question": el.question,
                 "Choices": [answer.choice for answer in el.choices]}
                for el in quiz]
        return quiz


@router_questions.post("/check")
async def check_answers(questions: List[AnswerData]):
    async with session_maker() as session:
        for q_data in questions:
            query = select(Question.id).where(Question.question == q_data.question)
            result = await session.execute(query)
            question_id = result.scalars().first()
            if question_id is None:
                raise HTTPException(
                    status_code=404, detail=f"Question '{q_data.question}' not found")
            query = select(Choice.true_answer).where(
                (Choice.question_id == question_id) & (Choice.choice == q_data.choice))
            result = await session.execute(query)
            verdict = result.scalars().first()

            if verdict is None:
                raise HTTPException(status_code=404, detail=f"Choice for the question '{q_data.question}' not found")

            if not verdict:
                return {"status": "fail", "message": f"Incorrect choice for '{q_data.question}'"}
    return {"test": "all good"}


@router_questions.post("/add")
async def add_questions_from_json(questions: List[QuestionData]):
    async with session_maker() as session:
        try:
            for q_data in questions:
                question = Question(question=q_data.question)
                choices = [
                    Choice(choice=c.choice, true_answer=c.true_answer, question=question)
                    for c in q_data.choices
                ]
                session.add(question)
                session.add_all(choices)
            await session.commit()
            return {"message": "Questions added successfully"}
        except SQLAlchemyError as e:
            await session.rollback()
            raise HTTPException(status_code=500, detail="Internal Server Error")
