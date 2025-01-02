from pydantic import BaseModel, EmailStr, Field
import re


class SUserRegister(BaseModel):
    login: str = Field(..., description="Логин пользователя")
    email: EmailStr = Field(..., description="Электронная почта")
    password: str = Field(..., min_length=5, max_length=50, description="Пароль, от 5 до 50 знаков")
    phone_number: str = Field(..., description="Номер телефона в международном формате, начинающийся с '+'")
    first_name: str = Field(..., min_length=3, max_length=50, description="Имя, от 3 до 50 символов")
    last_name: str = Field(..., min_length=3, max_length=50, description="Фамилия, от 3 до 50 символов")


class SUserAuth(BaseModel):
    identifier: str = Field(..., description="Логин или Номер телефона или Электронная почта")
    password: str = Field(..., min_length=5, max_length=50, description="Пароль, от 5 до 50 знаков")
