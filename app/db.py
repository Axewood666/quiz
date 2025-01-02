from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker, AsyncAttrs
from sqlalchemy.orm import DeclarativeBase, declared_attr, Mapped, mapped_column
from app.config import get_db_url
from typing import Annotated

DB_URL = get_db_url()
engine = create_async_engine(DB_URL)
session_maker = async_sessionmaker(autocommit=False, autoflush=False, bind=engine)

str_uniq = Annotated[str, mapped_column(unique=True, nullable=False)]
int_pk = Annotated[int, mapped_column(primary_key=True)]


class Base(AsyncAttrs, DeclarativeBase):
    __abstract__ = True

    @declared_attr.directive
    def __tablename__(cls) -> str:
        return f"{cls.__name__.lower()}s"
