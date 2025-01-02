from sqlalchemy.orm import Session
from app.db import session_maker
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy import or_, select


class BaseDAO:
    model = None

    @classmethod
    async def add(cls, **values):
        async with session_maker() as session:
            async with session.begin():
                new_instance = cls.model(**values)
                session.add(new_instance)
                try:
                    await session.commit()
                except SQLAlchemyError as e:
                    await session.rollback()
                    raise e
                return new_instance
    @classmethod
    async def find_all(cls, **filter_by):
        async with session_maker() as session:
            query = select(cls.model).filter_by(**filter_by)
            result = await session.execute(query)
            return result.scalars().all()
    @classmethod
    async def find_one_or_none(cls, **filter_by):
        async with session_maker() as session:
            query = select(cls.model).filter_by(**filter_by)
            result = await session.execute(query)
            return result.scalar_one_or_none()

    @classmethod
    async def find_one_or_none_or(cls, **filter_by):
        conditions = [
            getattr(cls.model, key) == value
            for key, value in filter_by.items()
        ]
        async with session_maker() as session:
            query = select(cls.model).where(or_(*conditions))
            result = await session.execute(query)
            return result.scalar_one_or_none()
