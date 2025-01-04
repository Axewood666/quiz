from fastapi import APIRouter, Request, Depends
from fastapi.templating import Jinja2Templates

from app.users.dependicies import get_current_user
from app.users.models import User
from app.pages.routes_admin import router_admin
router_pages = APIRouter(prefix='/pages', tags=['Pages'])
templates = Jinja2Templates(directory='app/templates')

@router_pages.get("/register/")
async def register_page(request: Request):
    return templates.TemplateResponse("register.html", {"request": request})


@router_pages.get("/login/")
async def login_page(request: Request):
    return templates.TemplateResponse("login.html", {"request": request})

@router_pages.get("/quiz/")
async def quiz_page(request: Request, current_user: User = Depends(get_current_user)):
    return templates.TemplateResponse("quiz.html", {"request": request, "user": current_user})

@router_pages.get("/user-profile/")
async def profile_page(request: Request, current_user: User = Depends(get_current_user)):
    return templates.TemplateResponse("user_profile.html", {"request": request, "user": current_user})
router_pages.include_router(router_admin)