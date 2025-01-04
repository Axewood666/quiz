document.getElementById("logout-link").addEventListener("click", function(event) {
    event.preventDefault();

    fetch("/auth/logout/", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        }
    })
    .then(response => response.json())
    .then(data => {
        console.log(data.message);
        window.location.href = "/";
    })
    .catch(error => console.error("Ошибка:", error));
});