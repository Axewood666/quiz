from typing import List

from pydantic import BaseModel, Field


class Choice(BaseModel):
    choice: str = Field(..., description="Вариант ответа")
    true_answer: bool = Field(..., description="Правильный ответ: true или false")


class SQuizAdd(BaseModel):
    question: str = Field(..., description="Текст вопроса")
    choices: List[Choice] = Field(..., description="Список вариантов ответа")


class SQuizWithSession(BaseModel):
    session_id: str = Field(..., description="ID сессии квиза")
    question_num: int
    question: str = Field(..., description="Текст вопроса")
    choices: List[str] = Field(..., description="Список вариантов ответа")


class SAnswerCheck(BaseModel):
    session_id: str = Field(..., description="ID сессии квиза")
    question_num: int = Field(..., description="ID вопроса")
    choice: List[str] = Field(..., description="ID выбранного ответа")

class SVerifiableAnswer(BaseModel):
    question: str = Field(..., description="Вопрос")
    user_choice: List[str] = Field(..., description="Ответ пользователя")
    choices: List[str] = Field(..., description="Варианты ответа")
    correct_choice: List[str] = Field(..., description="Правильный ответ")
    is_correct: bool = Field(..., description="Верно ли ответил пользователь")

class SAnswer(BaseModel):
    question: str = Field(..., description="Вопрос")
    correct_answers: List[str] = Field(..., description="Ответ")