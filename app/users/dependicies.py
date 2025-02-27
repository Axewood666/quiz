from typing import Optional

from fastapi import Request, HTTPException, Depends
from jose import jwt, JWTError
from app.config import get_auth_data
from app.users.dao import UsersDAO
from app.users.models import User
from fastapi.responses import RedirectResponse


def get_token(request: Request):
    token = request.cookies.get('users_access_token')
    if not token:
        redirect_response = RedirectResponse(url='/', status_code=302)
        raise HTTPException(status_code=302, headers=redirect_response.headers)
    return token

def try_get_token(request: Request):
    return request.cookies.get('users_access_token')

async def try_get_current_user(token: Optional[str] = Depends(try_get_token)) -> Optional[User]:
    if not token:
        return None

    try:
        auth_data = get_auth_data()
        payload = jwt.decode(token, auth_data['secret_key'], algorithms=[auth_data['algorithm']])
    except JWTError:
        return None

    user_id = payload.get('sub')
    if not user_id:
        return None

    user = await UsersDAO.find_one_or_none(id=int(user_id))
    if not user:
        return None

    return user

async def get_current_user(token: str = Depends(get_token)):
    try:
        auth_data = get_auth_data()
        payload = jwt.decode(token, auth_data['secret_key'], algorithms=[auth_data['algorithm']])
    except JWTError:
        redirect_response = RedirectResponse(url='/', status_code=302)
        raise HTTPException(status_code=302, headers=redirect_response.headers)

    user_id = payload.get('sub')
    if not user_id:
        raise HTTPException(status_code=401, detail='Id not found')

    user = await UsersDAO.find_one_or_none(id=int(user_id))
    if not user:
        raise HTTPException(status_code=401, detail='User not found')

    return user

async def current_user_is_admin(current_user: User = Depends(get_current_user)):
    if current_user.is_admin:
        return current_user
    raise HTTPException(status_code=403, detail='Not allowed!')
