# language: ru
# encoding: utf-8
#parent uf:
@UF6_текстовые_и_видео_инструкции
#parent ua:
@UA31_описание_настроек_и_инструкции

@IgnoreOnCIMainBuild
@DocumentationBuild


Функциональность: Как понять где разошлись данные при сравнении отчета или таблицы с эталоном

 
Контекст:
	Дано Я открываю Vanessa-Automation в TestClient для записи автодокументации "TestManager"
	И затем я выполняю код встроенного языка
		| 'Ванесса.Объект.ЗаписьВидеоЭмулироватьВводСКлавиатуры = Ложь; ' |
	
	И я перехожу к закладке с именем "ГруппаНастройки"
	И я перехожу к закладке с именем "СтраницаСервисОсновные"
	И я устанавливаю флаг 'Обновлять состояние дерева при выполнении шагов'
	И я перехожу к закладке "Запуск сценариев"
	

Сценарий: Как понять где разошлись макеты

	Дано текст субтитров "Привет! Я - Ванесса."
	Дано текст субтитров "В этом видео я расскажу, как понять где разошлись макеты при сравнении таблиц или отчетов с эталоном."
	
	
	*Давайте смоделируем такую ситуацию. Допустим, у нас есть сценарий, создающий два элемента справочника.
		Дано клик на картинку "Работа с UI"
		И в поле 'СгенерированныйСценарий' я ввожу текст
			| 'Дано Я открыл новый сеанс TestClient или подключил уже существующий'       |
			| ''       |
			| 'Когда я удаляю все элементы Справочника "Справочник1"'       |
			| 'И В командном интерфейсе я выбираю "Основная" "Справочник1"' |
			| 'Тогда открылось окно "Справочник1"' |
			| ''       |
			| '//Создаём первый элемент'       |
			| 'И я нажимаю на кнопку с именем "ФормаСоздать"' |
			| 'Тогда открылось окно "Справочник1 (создание)"' |
			| 'И в поле с именем "Наименование" я ввожу текст "Первый элемент"' |
			| 'И в поле с именем "РеквизитСтрока" я ввожу текст "Строка1"' |
			| 'И я меняю значение переключателя "Реквизит переключатель" на "Первое значение"' |
			| 'И я нажимаю на кнопку "Записать и закрыть"' |
			| 'И я жду закрытия окна "Справочник1 (создание)" в течение 20 секунд' |
			| ''       |
			| '//Создаём второй элемент'       |
			| 'Тогда открылось окно "Справочник1"' |
			| 'И я нажимаю на кнопку с именем "ФормаСоздать"' |
			| 'Тогда открылось окно "Справочник1 (создание)"' |
			| 'И в поле с именем "Наименование" я ввожу текст "Второй элемент"' |
			| 'И в поле с именем "РеквизитСтрока" я ввожу текст "Строка2"' |
			| 'И я меняю значение переключателя "Реквизит переключатель" на "Второе значение"' |
			| 'И я нажимаю на кнопку "Записать и закрыть"' |
			| 'И я жду закрытия окна "Справочник1 (создание)" в течение 20 секунд' |
	
	//* Эти блоки сценария создают элементы справочника, и заполняют несколько реквизитов.
		//И я рисую рамку вокруг картинки "Создаём первый элемент"
		//И пауза 2
		//И я рисую рамку вокруг картинки "Создаём второй элемент"
		//И пауза 2

	*Загрузим сценарий во временную фичу и выполним его.
		Дано клик на картинку "Подготовить сценарий к выполнению"
		Затем я жду, что в сообщениях пользователю будет подстрока "Фичи загружены" в течение 30 секунд
		Дано клик на картинку "Выполнить"
			
	
	*Теперь у нас появилось два элемента в форме списка.
		Затем я жду, что в сообщениях пользователю будет подстрока "Выполнение сценариев закончено." в течение 30 секунд
	
	*Теперь давайте напишем шаг, который выполнит проверку нашей формы списка, причём при проверке будет вызвано исключение.
		Дано клик на картинку "Основной сеанс"
		Дано клик на картинку "Работа с UI"
		И в поле 'СгенерированныйСценарий' я ввожу текст
			| 'Тогда таблица "Список" стала равной по шаблону:'  |
			| ' \| "Реквизит строка"   \| "Наименование"  \|'    |
			| ' \| "СтрокаКоторойНет"  \| "Первый *"      \|'    |
			| ' \| "Строка2"           \| "Второй *"      \|'    |
	
		Дано клик на картинку "Подготовить сценарий к выполнению"
		Затем я жду, что в сообщениях пользователю будет подстрока "Фичи загружены" в течение 30 секунд
		
	Дано текст субтитров "В данном случае мы использовали шаг: таблица стала равной по шаблону"	
		
	*видеовставка, что эти две ячейки таблицы мы будем проверять с использованием маски.
		И я рисую стрелку в автоинструкции от "" до "ДвеПроэкранированныеЯчейки"
			|'Цвет'          | 'Зеленый'       |
			|'Длительность'  | '2000'          |
			|'ТочкаКуда'     | 'СерединаПраво' |
			
	*А в этой ячейке специально указано значение, которое не пройдёт проверку.
		И я рисую стрелку в автоинструкции от "" до "ЗначениеЯчейкиКотороеНеПройдётПроверку"
			|'Цвет'          | 'Зеленый'       |
			|'Длительность'  | '2000'          |
			|'ТочкаКуда'     | 'СерединаПраво' |
		
	*Давайте убедимся в этом и выполним наш сценарий.
		Дано клик на картинку "Выполнить"
		Затем я жду, что в сообщениях пользователю будет подстрока "Выполнение сценариев закончено." в течение 30 секунд

			
	*Теперь посмотрим на подробный текст ошибки. Сделаем двойной клик по красной строке.
		Дано двойной клик на картинку "СтрокаУпавшегоШагаВСценарииПроверкиЭталонов"
		Тогда открылось окно "Детали ошибки"
		
	*В тексте ошибки видно, что в одной из ячеек таблицы значение не совпало с эталоном.
		И я рисую стрелку в автоинструкции от "" до "ЗначениеЯчейкиНеСовпалоСЭталоном1"
			|'Цвет'          | 'Зеленый'       |
			|'Длительность'  | '2000'          |
			|'ТочкаКуда'     | 'СерединаПраво' |
		
	Дано текст субтитров "Но когда расхождений много, смотреть их в тексте неудобно."
	Дано текст субтитров "Давайте сравним таблицы более наглядно."
	
	*Для этого нажимаем на кнопку "Сравнить таблицы".
		Дано клик на картинку "Сравнить таблицы"
		И я жду картинки "Различие между" в течение 20 секунд
		И я вращаю колесо мышки "Вниз" 3 раз с зажатой клавишей ctrl
	
	Дано текст субтитров "При этом открылся платформенный диалог сравнения файлов."
	*Сейчас диалог сравнения показывает три различия, хотя в реальности оно одно.
			И я рисую стрелку в автоинструкции от "" до "КраснаяСтрокаСтрокаКоторойНет"
			|'Цвет'          | 'Зеленый'     |
			|'Длительность'  | '2000'        |
			|'ТочкаКуда'     | 'СерединаНиз' |

			
	*Давайте это исправим.
		И я выполняю скрипт SikuliX "DoAltF4"
	
	#[autodoc.ignorestep]
	*Переход к основному сеансу
		Если есть картинка "ПанельОткрытыхСправочник1" Тогда
			Дано клик на картинку "Основной сеанс"
		И пауза 1
	
	*В настройках формы есть флаг "Только текст ячеек".
		И я рисую стрелку в автоинструкции от "" до "Только текст ячеек"
			|'Цвет'          | 'Зеленый'       |
			|'Длительность'  | '2000'          |
			|'ТочкаКуда'     | 'СерединаПраво' |
	Дано текст субтитров "Он полезен, когда нужно сравнить макеты без учета оформления."
	Дано текст субтитров "В данном случае он не решит проблему."
	
	*В данном случае нам поможет флаг "Сравнение с учетом символа звёздочка".
		И я рисую стрелку в автоинструкции от "" до "Сравнение с учетом символа звёздочка"
			|'Цвет'          | 'Зеленый'       |
			|'Длительность'  | '2000'          |
			|'ТочкаКуда'     | 'СерединаПраво' |
			
	*Установим его и проверим результат.
		Дано клик на картинку "Сравнение с учетом символа звёздочка"
		Дано клик на картинку "Сравнить таблицы"
		И я жду картинки "Различие между" в течение 20 секунд
		И я вращаю колесо мышки "Вниз" 3 раз с зажатой клавишей ctrl
			
	*Теперь результат сравнения показывается корректно. Только одно различие.
		И я рисую стрелку в автоинструкции от "" до "КраснаяСтрокаСтрокаКоторойНет"
			|'Цвет'          | 'Зеленый'     |
			|'Длительность'  | '2000'        |
			|'ТочкаКуда'     | 'СерединаНиз' |
			
	Дано текст субтитров "На этом всё. Подписывайтесь, ставьте лайки, до новых встреч!"
	Дано видеовставка "Ванесса! Тесты - есть!"

	#[autodoc.ignorestep]
	*Закроем за собой окна
		И я выполняю скрипт SikuliX "DoAltF4"
		И Я закрываю окно 'Детали ошибки'
		Если есть картинка "ПанельОткрытыхСправочник1" Тогда
			Дано клик на картинку "Основной сеанс"
		И пауза 1

		Тогда открылось окно '*Vanessa Automation'
		И я перехожу к закладке "Работа с UI"
		И в поле 'СгенерированныйСценарий' я ввожу текст
			| 'И я закрываю сеанс TESTCLIENT'  |
		И я перехожу к закладке "Запуск сценариев"
		И я нажимаю на кнопку 'Подготовить сценарий к выполнению'
		Затем я жду, что в сообщениях пользователю будет подстрока "Фичи загружены" в течение 30 секунд
		И я нажимаю на кнопку 'Выполнить'
		Затем я жду, что в сообщениях пользователю будет подстрока "Выполнение сценариев закончено." в течение 30 секунд
		И я закрываю сеанс TESTCLIENT
	