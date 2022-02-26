# Тестовое задание - экран FAQ в условном приложении
Экран состоящий из списка вопросов, разделённых на секции, и строки поиска.
___
## Оглавление
- **[Загрузка](#Download)**
- **[Список вопросов/ответов](#ListQuestionsAnswers)**
- **[Строка поиска](#SearchBar)**
- **[Требования к коду](#CodeRequirements)**
- **[Формат данных в JSON](#JSONDataFormat)**
- **[Требования к дизайну](#DesignRequirements)**
- **[Презентация реализации](#Presentation)**
___
## <a id="Download"></a>Загрузка
- При запуске приложения на экране появляется произвольный индикатор загрузки.
- Список вопросов в формате JSON должен загружаться по url-адресу.
- В случае ошибки загрузки должен появляться попап с текстом ошибки и кнопкой “Повторить”, по нажатию на которую начинается новая попытка загрузить данные.
___
## <a id="ListQuestionsAnswers"></a>Список вопросов/ответов
- По нажатию на текст вопроса он раскрывается с анимацией и показывает ответ.
- По нажатию на уже раскрытый вопрос ответ скрывается с анимацией.
- Справа от текста вопроса есть disclosure стрелка, которая должна показывать состояние скрыто/раскрыто (Направления стрелок не важны, но должны быть консистентны).
___
## <a id="SearchBar"></a>Строка поиска
- Стандартная строка поиска с кнопкой “Отмена”, скрытая при появлении экрана и выезжающая при скролле.
- При активации строки поиска она должна "переезжать" на место навбара (Стандартное поведение для iOS).
- При вводе текста в строку поиска на экране должны оставаться только те элементы, в тексте вопроса или ответа которых встречается введённая строка. Это должно происходить с какой-нибудь анимацией.
- Заголовки разделов, в которых не осталось элементов после поиска должны скрываться.
- По нажатию на кнопку “Отмена” введённый в строку поиска текст стирается, клавиатура стирается и строка поиска “переезжает” обратно под строку навигации (Стандартное поведение для iOS).
___
## <a id="CodeRequirements"></a>Требования к коду
- Swift или SwiftUI
- Можно использовать самые последние версии языков, API и технологий, доступных на сегодня, включая Swift 5.5 и iOS 15.
- Не должны использоваться third-party библиотеки.
- На экранах не должно быть артефактов.
- Анимация элементов должна быть плавной и без явных подёргиваний.
___
## <a id="JSONDataFormat"></a>Формат данных в JSON
[{
"name":string, "items":[{
"question":string,
"answer":string }]
}]
___
## <a id="DesignRequirements"></a>Требования к дизайну
Особых требований к шрифтам, цветам и размерам нет
___
## <a id="Presentation"></a>Презентация реализации
![imgonline-com-ua-Resize-ASt9cyBfkrgt3y6V](https://user-images.githubusercontent.com/87443364/155848778-e8bfaef3-e02b-4938-97d3-d143b3e2a6e6.jpg)
![imgonline-com-ua-Resize-GdtyqdEvnMu](https://user-images.githubusercontent.com/87443364/155848785-bd385e26-50a4-49a9-b0a2-44599ce86b6a.jpg)
![imgonline-com-ua-Resize-X98dCa22MHwqer](https://user-images.githubusercontent.com/87443364/155848795-12ebe583-fbf1-4547-a2e7-26dc695563ec.jpg)
![imgonline-com-ua-Resize-DuihG43IaVePbI](https://user-images.githubusercontent.com/87443364/155848851-98e167be-4a27-435e-9cbf-60553d1c088e.jpg)
