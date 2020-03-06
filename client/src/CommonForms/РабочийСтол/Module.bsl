

&НаКлиенте
Процедура ПодключениеЧерезСтатическуюСсылку(Команда)
	
	ПодключениеЧерезСтатическуюСсылкуНаСервере();
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ПодключениеЧерезСтатическуюСсылкуНаСервере()
	
	Соединение = WSСсылки.CalculatingFunctions.СоздатьWSПрокси("CalculatingFunctions", "CalculatingFunctions", "CalculatingFunctionsSoap");
	Операция   = Соединение.ТочкаПодключения.Интерфейс.Операции.Получить("getTheAverage");
	
	DataStructure = Соединение.ФабрикаXDTO.Создать(Операция.Параметры.Получить("DataStructure").Тип);
	DataStructure.CountOfElementsInArray = 2;
	DataStructure.ArrayOfNumbers.Добавить(2);
	DataStructure.ArrayOfNumbers.Добавить(3);
	DataStructure.Comment = "Тест";
	DataStructure.Проверить();
	
	Ответ = Соединение.getTheAverage(DataStructure);
	Сообщить(Ответ);
	
КонецПроцедуры
