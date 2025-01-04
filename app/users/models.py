from sqlalchemy.orm import Mapped, mapped_column
from app.db import Base, str_uniq, int_pk
from sqlalchemy import text

class User(Base):
    id: Mapped[int_pk]
    _login: Mapped[str_uniq] = mapped_column("login")
    phone_number: Mapped[str_uniq] = mapped_column("phone_number")
    _email: Mapped[str_uniq] = mapped_column("email")
    first_name: Mapped[str]
    last_name: Mapped[str]
    password: Mapped[str]

    is_user: Mapped[bool] = mapped_column(default=True, server_default=text('true'), nullable=False)
    is_admin: Mapped[bool] = mapped_column(default=False, server_default=text('false'), nullable=False)


    @property
    def login(self) -> str:
        return self._login

    @login.setter
    def login(self, value: str):
        self._login = value.lower() if value else value

    @property
    def email(self) -> str:
        return self._email

    @email.setter
    def email(self, value: str):
        self._email = value.lower() if value else value

    unique_fields = {
        'email': _email,
        'login': _login,
        'phone_number': phone_number
    }