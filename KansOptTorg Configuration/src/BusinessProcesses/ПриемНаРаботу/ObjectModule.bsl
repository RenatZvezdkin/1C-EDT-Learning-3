
Процедура ТестНаАдминистрированиеПроверкаУсловия(ТочкаМаршрутаБизнесПроцесса, Результат)
	Результат = ПрохождениеТестаАдминистрирования;
КонецПроцедуры

Процедура ТестНаПрограммированиеПроверкаУсловия(ТочкаМаршрутаБизнесПроцесса, Результат)
	Результат = ПрохождениеТестаПрограммирования;
КонецПроцедуры

Процедура ВакансияОператораПриВыполнении(ТочкаМаршрутаБизнесПроцесса, Задача, Отказ)
	Вакансия = Перечисления.Вакансии.Оператор;
КонецПроцедуры

Процедура ВакансияАдминистратораПриВыполнении(ТочкаМаршрутаБизнесПроцесса, Задача, Отказ)
	Вакансия = Перечисления.Вакансии.Администратор;
КонецПроцедуры

Процедура ВакансияПрограммистаПриВыполнении(ТочкаМаршрутаБизнесПроцесса, Задача, Отказ)
	Вакансия = Перечисления.Вакансии.Программист;
КонецПроцедуры

//Процедура ЗавершениеПриЗавершении(ТочкаМаршрутаБизнесПроцесса, Отказ)
//	 
//	Если ПрохождениеТестаПрограммирования тогда
//		
//		Вакансия = Перечисления.Вакансии.Программист;
//		
//	ИначеЕсли ПрохождениеТестаАдминистрирования тогда
//		
//		Вакансия = Перечисления.Вакансии.Администратор;
//		
//	Иначе
//		
//		Вакансия = Перечисления.Вакансии.Оператор;
//		
//	КонецЕсли;
//	
//КонецПроцедуры

 
