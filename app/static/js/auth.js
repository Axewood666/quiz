document.addEventListener('DOMContentLoaded', () => {

    const registerForm = document.getElementById('registerForm');
    if (registerForm) {
        registerForm.addEventListener('submit', async (event) => {
            event.preventDefault();

            const login = document.getElementById('login').value;
            const email = document.getElementById('email').value;
            const phone_number = document.getElementById('phone_number').value;
            const first_name = document.getElementById('first_name').value;
            const last_name = document.getElementById('last_name').value;
            const password = document.getElementById('password').value;

            const response = await fetch('/auth/register/', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    login,
                    email,
                    phone_number,
                    first_name,
                    last_name,
                    password
                }),
            });

            if(response.ok){
                window.location.href = "/";
            }else{
                const errorData = await response.json();
                alert(errorData.detail);
            }
        });
    }

    const loginForm = document.getElementById('loginForm');
    if (loginForm) {
        loginForm.addEventListener('submit', async (event) => {
            event.preventDefault();

            const identifier = document.getElementById('identifier').value;
            const password = document.getElementById('loginPassword').value;

            const response = await fetch('/auth/login/', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    identifier,
                    password,
                }),
            });
           const data = await response.json();
            if (response.ok) {
                window.location.href = "/";
            } else {
                alert(data.detail);
            }
        });
    }

    const logoutButton = document.getElementById('logoutButton');
    if (logoutButton) {
        logoutButton.addEventListener('click', async () => {
            const response = await fetch('/auth/logout/', {
                method: 'POST',
            });

            const data = await response.json();
            alert(data.message);
        });
    }
});
