from typing import Optional

from fastapi import FastAPI, Request, Depends
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

from app.questions.routes import router_questions
from app.users.dependicies import try_get_current_user
from app.users.models import User
from app.users.routers import router_auth
from app.pages.routes import router_pages

app = FastAPI()
app.mount('/static', StaticFiles(directory='app/static'), 'static')
templates = Jinja2Templates(directory='app/templates')
@app.get("/")
async def root(request: Request, current_user: Optional[User] = Depends(try_get_current_user)):
    return templates.TemplateResponse("index.html", {"request": request, "user": current_user})

app.include_router(router_questions)
app.include_router(router_auth)
app.include_router(router_pages)
