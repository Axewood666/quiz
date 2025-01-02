from fastapi import FastAPI
from app.Questions.routes import router_questions

app = FastAPI()


@app.get("/")
async def root():
    return {"hello": "world"}

app.include_router(router_questions)