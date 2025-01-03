FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow

# Установка необходимых пакетов
RUN apt-get -yqq update && \
    apt-get -yqq install python3-pip python3-dev libpq-dev build-essential postgresql-client

# Копирование приложения в контейнер
ADD ./ /opt/quiz
WORKDIR /opt/quiz

# Установка зависимостей Python
RUN pip install --no-cache-dir -r requirements.txt --break-system-packages

# Открытие порта
EXPOSE 8000

# Команда запуска приложения
CMD sh -c '\
    echo "Waiting for the PostgreSQL server to be ready..." && \
    until pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER"; do \
    echo "Database is unavailable - sleeping"; \
    sleep 2; \
    done; \
    echo "Database is up - continuing"; \
    alembic upgrade head && \
    PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -U $DB_USER -d $DB_NAME -p $DB_PORT -f ./docker_utils/data_only_backup.sql && \
    uvicorn app.main:app --host 0.0.0.0 --port 8000'
