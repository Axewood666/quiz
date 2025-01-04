from app.users.models import User
from sqlalchemy import select
from app.db import session_maker
from app.dao.base import BaseDAO


class UsersDAO(BaseDAO):
    model = User

    @classmethod
    async def check_uniq(cls, column, new_value):
        if column is None:
            return False

        async with session_maker() as session:
            query = select(column).filter(column == new_value)
            result = await session.execute(query)
            uniq = result.scalar_one_or_none()
            return uniq
