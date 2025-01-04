document.addEventListener('DOMContentLoaded', async () => {
    const quizContainer = document.getElementById('quiz');

    try {
        const response = await fetch('/quiz/get-quiz/', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            },
        });

        if (response.ok) {
            const quizData = await response.json();
            renderQuiz(quizData, quizContainer);

        addButtons(quizData)
        } else {
            quizContainer.innerHTML = '<p class="error">Error fetching quiz data.</p>';
        }
    } catch (error) {
        quizContainer.innerHTML = `<p class="error">Error: ${error.message}</p>`;
    }
});

function renderQuiz(quizData, container) {
    quizData.forEach(item => {
        const questionElement = document.createElement('div');
        questionElement.classList.add('question');

        const questionText = document.createElement('h3');
        questionText.textContent = `Question ${item.question_num}: ${item.Question}`;
        questionElement.appendChild(questionText);

        const choicesList = document.createElement('ul');
        choicesList.classList.add('choices');
        item.Choices.forEach(choice => {
            const choiceItem = document.createElement('li');
            choiceItem.textContent = choice;
            choicesList.classList.add('choices');

            choiceItem.addEventListener('click', () => {
                const siblings = choiceItem.parentNode.children;
                for (let sibling of siblings) {
                    sibling.classList.remove('active');
                }
                choiceItem.classList.add('active');
            });

            choicesList.appendChild(choiceItem);
        });

        questionElement.appendChild(choicesList);
        container.appendChild(questionElement);
    });
}

function submitAnswers(quizData) {
    const answers = quizData.map(item => {
        const selectedChoice = Array.from(document.querySelectorAll(`.question:nth-child(${item.question_num}) .choices .active`));

        return {
            session_id: item.session_id,
            question_num: item.question_num,
            choice: selectedChoice.map(choice => choice.textContent)
        };
    });

    fetch('/quiz/check', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(answers),
    })
    .then(response => response.json())
    .then(data => {
        renderResults(data);

    })
    .catch(error => {
        console.error('Error submitting answers:', error);
    });
}

function renderResults(results) {
    const resultsContainer = document.getElementById('quiz');
    resultsContainer.innerHTML = '';


    results.forEach(result => {
        const resultElement = document.createElement('div');
        resultElement.classList.add('result');

        const iconElement = document.createElement('span');
        iconElement.classList.add('result-icon');
        iconElement.textContent = result.is_correct ? '✔️' : '❌';
        resultElement.appendChild(iconElement);

        const contentElement = document.createElement('div');

        const questionElement = document.createElement('h3');
        questionElement.textContent = result.question;
        contentElement.appendChild(questionElement);

        const userChoiceElement = document.createElement('p');
        userChoiceElement.textContent = `Ваш выбор: ${result.user_choice.join(', ')}`;
        contentElement.appendChild(userChoiceElement);

        const correctChoiceElement = document.createElement('p');
        correctChoiceElement.textContent = `Правильный ответ: ${result.correct_choice.join(', ')}`;
        contentElement.appendChild(correctChoiceElement);

        const isCorrectElement = document.createElement('p');
        isCorrectElement.textContent = result.is_correct ? 'Ваш ответ правильный!' : 'Ваш ответ неверный.';
        isCorrectElement.classList.add(result.is_correct ? 'correct' : 'incorrect');
        contentElement.appendChild(isCorrectElement);

        resultElement.appendChild(contentElement);
        resultsContainer.appendChild(resultElement);
    });

    addButtons()
}


function refresh_quiz() {
    fetch('/quiz/get-quiz?refresh_session=true')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log(data);
            const quizContainer = document.getElementById('quiz');
            quizContainer.innerHTML = '';
            renderQuiz(data, quizContainer);
            addButtons(data)

        })
        .catch(error => console.error('Ошибка при обновлении вопросов:', error));
}

function addButtons(data = null){
    const quizContainer = document.getElementById('quiz');
    if (data) {
        const submitButton = document.createElement('button');
        submitButton.textContent = 'Submit Answers';
        submitButton.classList.add('button');
        submitButton.addEventListener('click', () => submitAnswers(data));
        quizContainer.appendChild(submitButton);
    }
    const refreshButton = document.createElement('button');
    refreshButton.textContent = 'Refresh Answers';
    refreshButton.classList.add('button');
    refreshButton.classList.add('refresh-btn');
    refreshButton.addEventListener('click', () => refresh_quiz());
    quizContainer.appendChild(refreshButton);
}