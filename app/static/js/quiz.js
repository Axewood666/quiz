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

            // Добавляем кнопку для отправки ответов
            const submitButton = document.createElement('button');
            submitButton.textContent = 'Submit Answers';
            submitButton.addEventListener('click', () => submitAnswers(quizData));
            quizContainer.appendChild(submitButton);
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
    const resultsContainer = document.getElementById('results');
    resultsContainer.innerHTML = ''; // Очистить предыдущие результаты, если они есть

    results.forEach(result => {
        const resultElement = document.createElement('div');
        resultElement.classList.add('result');

        const questionElement = document.createElement('h3');
        questionElement.textContent = result.question;
        resultElement.appendChild(questionElement);

        const userChoiceElement = document.createElement('p');
        userChoiceElement.textContent = `Ваш выбор: ${result.user_choice.join(', ')}`;
        resultElement.appendChild(userChoiceElement);

        const correctChoiceElement = document.createElement('p');
        correctChoiceElement.textContent = `Правильный ответ: ${result.correct_choice.join(', ')}`;
        resultElement.appendChild(correctChoiceElement);

        const isCorrectElement = document.createElement('p');
        isCorrectElement.textContent = result.is_correct ? 'Ваш ответ правильный!' : 'Ваш ответ неверный.';
        isCorrectElement.style.color = result.is_correct ? 'green' : 'red';
        resultElement.appendChild(isCorrectElement);

        resultsContainer.appendChild(resultElement);
    });
}
