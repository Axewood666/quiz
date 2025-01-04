from fastapi import APIRouter, Request, Depends
from app.users.dependicies import current_user_is_admin
from app.users.models import User
from fastapi.templating import Jinja2Templates

templates = Jinja2Templates(directory='app/templates')
router_admin = APIRouter(prefix='/admin', tags=['Admin'])

@router_admin.get("/add-questions/")
async def add_new_questions_page(request: Request, current_user: User = Depends(current_user_is_admin)):
    return templates.TemplateResponse("add_page.html", {"request": request, "user": current_user})