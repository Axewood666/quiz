from app.users.models import User
from sqlalchemy import select
from app.db import session_maker
from app.dao.base import BaseDAO


class UsersDAO(BaseDAO):
    model = User
    unique_fields = {
        'email': User.email,
        'login': User.login,
        'phone_number': User.phone_number
    }

    @classmethod
    async def check_uniq(cls, column, new_value):
        async with session_maker() as session:
            if column is not None:
                query = select(column).where(column == new_value)
                result = await session.execute(query)
                uniq = result.scalar_one_or_none()
                if uniq is not None:
                    return uniq
            return None
