from typing import List

from pydantic import BaseModel, Field


class Choice(BaseModel):
    id: int = Field(..., description="ID варианта ответа")
    choice: str = Field(..., description="Вариант ответа")
    true_answer: bool = Field(..., description="Правильный ответ: true или false", exclude=True)


class SQuizAdd(BaseModel):
    question: str = Field(..., description="Текст вопроса")
    Choices: List[Choice] = Field(..., description="Список вариантов ответа")


class SQuizWithSession(BaseModel):
    session_id: str = Field(..., description="ID сессии квиза")
    question_id: int = Field(..., description="ID вопроса")
    question_num: int
    question: str = Field(..., description="Текст вопроса")
    choices: List[Choice] = Field(..., description="Список вариантов ответа")


class SAnswerCheck(BaseModel):
    session_id: str = Field(..., description="ID сессии квиза")
    question_num: int = Field(..., description="ID вопроса")
    choice: List[str] = Field(..., description="ID выбранного ответа")
