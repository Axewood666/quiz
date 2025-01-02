from fastapi import FastAPI, Request
from app.questions.routes import router_questions
from app.users.routers import router_auth
from app.pages.routes import router_pages, templates
from fastapi.staticfiles import StaticFiles

app = FastAPI()
app.mount('/static', StaticFiles(directory='app/static'), 'static')

@app.get("/")
async def root(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})

app.include_router(router_questions)
app.include_router(router_auth)
app.include_router(router_pages)
