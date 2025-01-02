from sqlalchemy import ForeignKey, text, Text, Boolean
from sqlalchemy.orm import relationship, Mapped, mapped_column
from app.db import Base, str_uniq, int_pk


class User(Base):
    id: Mapped[int_pk]
    login: Mapped[str_uniq]
    phone_number: Mapped[str_uniq]
    email: Mapped[str_uniq]
    first_name: Mapped[str]
    last_name: Mapped[str]
    password: Mapped[str]

    is_user: Mapped[bool] = mapped_column(default=True, server_default=text('true'), nullable=False)
    is_admin: Mapped[bool] = mapped_column(default=False, server_default=text('false'), nullable=False)

    extend_existing = True
