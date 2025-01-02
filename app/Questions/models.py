from sqlalchemy import ForeignKey, text, Text
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
    
    question = relationship("Question", back_populates="choices")
