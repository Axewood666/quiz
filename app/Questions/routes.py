from fastapi import APIRouter
from sqlalchemy import select
from sqlalchemy.orm import joinedload
from app.db import session_maker
from app.Questions.models import Question, Choice

router_questions = APIRouter(prefix='/quiz')


@router_questions.get("/")
async def get_rand_quiz():
    async with session_maker() as session:
        query = select(Question).options(joinedload(Question.choices))
        result = await session.execute(query)
        quiz = result.scalars().unique().all()
        quiz = [{"Question": el.question,
                 "Choices": [answer.choice for answer in el.choices]}
                for el in quiz]
        return quiz
