Процедура ОбработкаПроведения(Отказ,Режим)
	
	КонецПериода = КонецМесяца(Дата)+1;
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	РегистрБухОстатки.Счет,
		|	РегистрБухОстатки.СуммаОстатокДт,
		|	РегистрБухОстатки.СуммаОстатокКт
		|ИЗ
		|	РегистрБухгалтерии.РегистрБух.Остатки(&Период, Счет В (&СчетВыручка, &СчетСебестоимость),) КАК РегистрБухОстатки";
	
	Запрос.УстановитьПараметр("СчетВыручка", ПланыСчетов.БухУчет.Выручка);
	Запрос.УстановитьПараметр("СчетСебестоимость", ПланыСчетов.БухУчет.Себестоимость);
	Запрос.УстановитьПараметр("Период", КонецПериода);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	ОстатокВыручки =0;
	ОстатокСебестоимости =0;
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		
		Если ВыборкаДетальныеЗаписи.Счет = ПланыСчетов.БухУчет.Выручка тогда
			ОстатокВыручки = ВыборкаДетальныеЗаписи.СуммаОстатокКт;
		ИначеЕсли ВыборкаДетальныеЗаписи.Счет = ПланыСчетов.БухУчет.Себестоимость тогда
			ОстатокСебестоимости = ВыборкаДетальныеЗаписи.СуммаОстатокДт;
		КонецЕсли;
		
	КонецЦикла;
	
	Движения.РегистрБух.Записывать = истина;
	
	Проводка = Движения.РегистрБух.Добавить();
	
	Проводка.Период = Дата;
	Проводка.Сумма = ОстатокВыручки;
	Проводка.СчетДт = ПланыСчетов.БухУчет.Выручка;
	//Не уверен, почему нельзя было использловать расчеты с покупателями, так как это тоже своего рода прибыль
	Проводка.СчетКт = ПланыСчетов.БухУчет.ПрибыльИУбытки; 
	
	Проводка = Движения.РегистрБух.Добавить();
	
	Проводка.Период = Дата;
	Проводка.Сумма = ОстатокСебестоимости;
	Проводка.СчетДт = ПланыСчетов.БухУчет.ПрибыльИУбытки;
	Проводка.СчетКт = ПланыСчетов.БухУчет.Себестоимость;
	
КонецПроцедуры