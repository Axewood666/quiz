from sqlalchemy import ForeignKey, text, Text, Boolean
from sqlalchemy.orm import relationship, Mapped, mapped_column
from app.db import Base, str_uniq, int_pk


class Question(Base):
    id: Mapped[int_pk]
    question: Mapped[str_uniq]

    choices = relationship("Choice", back_populates="question")


class Choice(Base):
    id: Mapped[int_pk]
    question_id: Mapped[int] = mapped_column(ForeignKey("questions.id"))
    choice: Mapped[str] = mapped_column(nullable=False)
    true_answer: Mapped[bool] = mapped_column(Boolean, default=False)
    question = relationship("Question", back_populates="choices")


class UserQuizSession(Base):
    id: Mapped[int_pk]
    user_id: Mapped[int] = mapped_column(ForeignKey("users.id"))
    question_id: Mapped[int] = mapped_column(ForeignKey("questions.id"))
    question_num: Mapped[int]
    session_id: Mapped[str]

    user = relationship("User")
    question = relationship("Question")
