from fastapi import APIRouter, HTTPException, Response, Depends

from app.users.auth import get_password_hash, authenticate_user, create_access_token
from app.users.dependicies import get_current_user
from app.users.schemas import SUserRegister, SUserAuth
from app.users.dao import UsersDAO
from app.users.models import User

router_auth = APIRouter(prefix='/auth', tags=['Auth'])


@router_auth.post("/register/")
async def register_user(user_data: SUserRegister, response: Response) -> dict:
    for field_name, column in User.unique_fields.items():
        value = getattr(user_data, field_name, None)
        if value:
            value = str(value).lower()
            is_not_uniq = await UsersDAO.check_uniq(column, value)
            if is_not_uniq:
                raise HTTPException(
                    status_code=404, detail=f"This {field_name} has already been registered")
    user_dict = user_data.dict()
    user_dict['password'] = get_password_hash(user_data.password)
    await UsersDAO.add(**user_dict)
    user = SUserAuth(identifier=user_data.login, password=user_data.password)
    await auth_user(response, user)
    return {"message": "Successful"}


@router_auth.post("/login/")
async def auth_user(response: Response, user_data: SUserAuth):
    check = await authenticate_user(identifier=user_data.identifier, password=user_data.password)
    if check is None:
        raise HTTPException(status_code=401,
                            detail='Неверный логин или пароль')
    access_token = create_access_token({"sub": str(check.id)})
    response.set_cookie(key="users_access_token", value=access_token, httponly=True)
    return {'access_token': access_token, 'refresh_token': None}


@router_auth.post("/logout/")
async def logout_user(response: Response):
    response.delete_cookie(key="users_access_token")
    return {'message': 'Пользователь успешно вышел из системы'}
