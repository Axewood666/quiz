from fastapi import APIRouter, HTTPException, Depends

from sqlalchemy import select, delete
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm import joinedload

from app.db import session_maker
from app.questions.models import Question, Choice, UserQuizSession, UserAnswer
from app.questions.schemas import SAnswerCheck, SQuizAdd, SVerifiableAnswer, SAnswer, SQuizWithSession
from app.users.dependicies import current_user_is_admin, get_current_user
from app.users.models import User
from app.questions.dao import QuizSessionDAO, ChoiceDAO, QuestionDAO
from typing import List, Optional

router_questions = APIRouter(prefix='/quiz', tags=['Quiz'])


@router_questions.get("/get-quiz")
async def get_rand_quiz(current_user: User = Depends(get_current_user), refresh_session: Optional[str] = None) -> List[
    SQuizWithSession]:
    user_session = await QuizSessionDAO.get_user_session(current_user)
    if refresh_session == "true" and user_session:
        if not await QuizSessionDAO.remove_session(current_user):
            raise HTTPException(
                status_code=404,
                detail=f"You don't have active session")
        else:
            user_session = await QuizSessionDAO.get_user_session(current_user)
    if not user_session:
        quiz = await QuizSessionDAO.get_rand_quiz(current_user)
    else:
        quiz = await QuizSessionDAO.recover_session(user_session)
    if not quiz:
        raise HTTPException(
            status_code=404,
            detail=f"Invalid quiz session")
    return quiz


@router_questions.post("/check")
async def check_answers(questions: List[SAnswerCheck], current_user: User = Depends(get_current_user)) -> List[
    SVerifiableAnswer]:
    async with session_maker() as session:
        query = (
            select(UserQuizSession)
            .options(
                joinedload(UserQuizSession.question).joinedload(Question.choices)
            )
            .where(UserQuizSession.session_id == questions[0].session_id)
        )
        result = await session.execute(query)
        session_data = result.unique().scalars().all()
        if not session_data or not session_data[0].user_id == current_user.id:
            raise HTTPException(
                status_code=404, detail=f"Session with id '{questions[0].session_id}' not found or you not authorized")
        if len(session_data) != len(questions):
            raise HTTPException(
                status_code=404, detail=f"Incorrect session")
        answers_dict = {
            str(answer.question_id): [choice.choice for choice in answer.question.choices if choice.true_answer]
            for answer in session_data
        }

        user_choice_dict = {
            str(await QuizSessionDAO.get_id_by_num(
                session_id=question.session_id,
                question_num=question.question_num
            )): question.choice for question in questions
        }

        response = []
        user_answers = []
        for question_id, user_choice in user_choice_dict.items():
            question = await QuestionDAO.find_one_or_none(id=int(question_id))
            choices = await ChoiceDAO.find_all(question_id=int(question_id))
            if not question or not choices:
                raise HTTPException(
                    status_code=404, detail=f"Question not found")
            is_correct = set(user_choice) == set(answers_dict[f"{question_id}"])
            response.append(SVerifiableAnswer(
                question=question.question,
                user_choice=user_choice,
                choices=[obj.choice for obj in choices],
                correct_choice=answers_dict[f"{question_id}"],
                is_correct=is_correct))
            if is_correct:
                user_answers.append(UserAnswer(question_id=int(question_id), user_id=current_user.id))
        try:
            query = delete(UserQuizSession).filter_by(session_id=questions[0].session_id)
            remove = await session.execute(query)
            if remove:
                session.add_all(user_answers)
                await session.commit()
            else:
                session.rollback()
                HTTPException(status_code=404, detail="Failed to process your answers, try again")
        except SQLAlchemyError:
            HTTPException(status_code=404, detail="Failed on validate answers, try again")

        return response


@router_questions.post("/get-user-answers")
async def get_user_answers(current_user: User = Depends(get_current_user)) -> List[SAnswer]:
    async with session_maker() as session:
        query = select(UserAnswer).filter_by(user_id=current_user.id)
        result = await session.execute(query)
        user_answers = result.scalars().all()
        if not user_answers:
            raise HTTPException(status_code=404, detail=f"User answers not found")
        answers = []
        for answer in user_answers:
            question = await QuestionDAO.find_one_or_none(id=int(answer.question_id))
            correct_answer = await ChoiceDAO.find_all(question_id=int(answer.question_id), true_answer=True)
            answers.append(SAnswer(question=question.question, correct_answers=[el.choice for el in correct_answer]))
        return answers


@router_questions.post("/admin/add")
async def add_questions_from_json(questions: List[SQuizAdd], current_user=Depends(current_user_is_admin)):
    async with session_maker() as session:
        try:
            for q_data in questions:
                question = Question(question=q_data.question)
                try:
                    session.add(question)
                    await session.flush()
                    choices = [
                        Choice(choice=c.choice, true_answer=c.true_answer, question_id=question.id)
                        for c in q_data.choices
                    ]
                    session.add_all(choices)
                    await session.commit()
                except SQLAlchemyError:
                    continue
            return {"message": "Questions added successfully"}
        except SQLAlchemyError as e:
            await session.rollback()
            raise HTTPException(status_code=500, detail=str(e))
