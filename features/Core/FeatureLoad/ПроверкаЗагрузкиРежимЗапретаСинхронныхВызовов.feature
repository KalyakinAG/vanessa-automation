# language: ru
# encoding: utf-8
#parent uf:
@UF1_загрузка_и_обработка_features
#parent ua:
@UA9_загружать_features

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb
@IgnoreOn836
@IgnoreOn837
@IgnoreOn838
@IgnoreOn839

//т.к. это специальная проверка в режиме синхронных вызовов, сценарий не надо запускать когда синхронные вызовы запрещены
@IgnoreOnNoSyncBuilds

@tree

Функционал: Проверка загрузки фич в режиме запрета синхронных вызовов
 
Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: Проверка загрузки фич через меню недавно загруженные фичи. Невозможна оптимизация работы с файлами.
	Когда Я открываю VanessaAutomation в режиме TestClient со стандартной библиотекой
	
	И я перехожу к закладке с именем "ГруппаСлужебная"
	И я перехожу к закладке с именем "ГруппаСлужебноеВыполнитьКод"

	И в поле с именем 'РеквизитПроизвольныйКод' я ввожу текст 
		|'ВозможнаОптимизацияРаботыСФайлами = Ложь;'|
		|'ЗапрещеныСинхронныеВызовы = Истина;'|
		
	И я нажимаю на кнопку с именем 'ВыполнитьПроизвольныйКод'


	И в поле с именем 'РеквизитПроизвольныйКод' я ввожу текст 
		|'Сообщить(ВозможнаОптимизацияРаботыСФайлами);'|
		
	И я очищаю окно сообщений пользователю	
	И я нажимаю на кнопку с именем 'ВыполнитьПроизвольныйКод'
	Затем я жду, что в сообщениях пользователю будет подстрока "Нет" в течение 30 секунд


	И в поле с именем 'РеквизитПроизвольныйКод' я ввожу текст 
		|'Сообщить(ЗапрещеныСинхронныеВызовы);'|
		
	И я очищаю окно сообщений пользователю	
	И я нажимаю на кнопку с именем 'ВыполнитьПроизвольныйКод'
	Затем я жду, что в сообщениях пользователю будет подстрока "Да" в течение 30 секунд



	И я перехожу к закладке с именем "ГруппаНастройки"
	И я нажимаю кнопку выбора у поля с именем "СписокТеговОтбор1"
	Тогда открылось окно 'Список значений'
	И я нажимаю на кнопку с именем 'Add'
	И в таблице "ValueList" в поле с именем 'Value' я ввожу текст 'Video'
	И в таблице "ValueList" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'OK'

	И Я запоминаю значение выражения '$КаталогИнструментов$\features' в переменную "ПутьКФичам"
	//И я буду выбирать внешний файл "$ПутьКФичам$"
	//И я нажимаю на кнопку с именем 'ФормаЗагрузитьФичиИзКаталога'
	
	И я перехожу к закладке с именем "ГруппаСлужебная"
	И в поле с именем 'КаталогФичСлужебный' я ввожу текст '$ПутьКФичам$'
	И я нажимаю на кнопку с именем 'Перезагрузить'

	
	И у элемента с именем "ФлагСценарииЗагружены" я жду значения "Да" в течение 200 секунд
	И я перехожу к закладке с именем "ГруппаЗапускТестов"
	И я выбираю пункт контекстного меню с именем 'ДеревоТестовКонтекстноеМенюСвернутьДоФич' на элементе формы с именем "ДеревоТестов"


	Тогда таблица "ДеревоТестов" содержит строки
		| 'Наименование'                                                        |
		| 'features'                                                            |
		| 'Core'                                                                |
		| 'Video'                                                               |
		| 'Проверка формирования файла видео'                                   |
		| 'Проверка возможности сгенерировать mp3, чтобы тут же его прослушать' |
		| 'Проверка, что видео будет собираться'                                |


//У серверных баз нет такой возможности в общем случае.
@IgnoreOnServer
Сценарий: Проверка загрузки фич через меню недавно загруженные фичи. Возможна оптимизация работы с файлами.
	Когда Я открываю VanessaAutomation в режиме TestClient со стандартной библиотекой
	
	И я перехожу к закладке с именем "ГруппаСлужебная"
	И я перехожу к закладке с именем "ГруппаСлужебноеВыполнитьКод"

	И в поле с именем 'РеквизитПроизвольныйКод' я ввожу текст 
		|'ВозможнаОптимизацияРаботыСФайлами = Истина;'|
		|'ЗапрещеныСинхронныеВызовы = Истина;'|
		
	И я нажимаю на кнопку с именем 'ВыполнитьПроизвольныйКод'


	И в поле с именем 'РеквизитПроизвольныйКод' я ввожу текст 
		|'Сообщить(ВозможнаОптимизацияРаботыСФайлами);'|
		
	И я очищаю окно сообщений пользователю	
	И я нажимаю на кнопку с именем 'ВыполнитьПроизвольныйКод'
	Затем я жду, что в сообщениях пользователю будет подстрока "Да" в течение 30 секунд


	И в поле с именем 'РеквизитПроизвольныйКод' я ввожу текст 
		|'Сообщить(ЗапрещеныСинхронныеВызовы);'|
		
	И я очищаю окно сообщений пользователю	
	И я нажимаю на кнопку с именем 'ВыполнитьПроизвольныйКод'
	Затем я жду, что в сообщениях пользователю будет подстрока "Да" в течение 30 секунд



	И я перехожу к закладке с именем "ГруппаНастройки"
	И я нажимаю кнопку выбора у поля с именем "СписокТеговОтбор1"
	Тогда открылось окно 'Список значений'
	И я нажимаю на кнопку с именем 'Add'
	И в таблице "ValueList" в поле с именем 'Value' я ввожу текст 'Video'
	И в таблице "ValueList" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'OK'

	И Я запоминаю значение выражения '$КаталогИнструментов$\features' в переменную "ПутьКФичам"
	//И я буду выбирать внешний файл "$ПутьКФичам$"
	//И я нажимаю на кнопку с именем 'ФормаЗагрузитьФичиИзКаталога'

	И я перехожу к закладке с именем "ГруппаСлужебная"
	И в поле с именем 'КаталогФичСлужебный' я ввожу текст '$ПутьКФичам$'
	И я нажимаю на кнопку с именем 'Перезагрузить'
	


	
	И у элемента с именем "ФлагСценарииЗагружены" я жду значения "Да" в течение 120 секунд
	И я перехожу к закладке с именем "ГруппаЗапускТестов"
	И я выбираю пункт контекстного меню с именем 'ДеревоТестовКонтекстноеМенюСвернутьДоФич' на элементе формы с именем "ДеревоТестов"


	Тогда таблица "ДеревоТестов" содержит строки
		| 'Наименование'                                                        |
		| 'features'                                                            |
		| 'Core'                                                                |
		| 'Video'                                                               |
		| 'Проверка формирования файла видео'                                   |
		| 'Проверка возможности сгенерировать mp3, чтобы тут же его прослушать' |
		| 'Проверка, что видео будет собираться'                                |

	