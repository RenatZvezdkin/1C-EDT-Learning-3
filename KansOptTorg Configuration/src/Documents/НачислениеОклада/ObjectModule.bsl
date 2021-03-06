Процедура ОбработкаПроведения(Отказ,Режим)
	
	Движения.Начисления.Записывать = Истина;
	Движение = Движения.Начисления.Добавить();
	Движение.Сторно = Ложь;
	Движение.ВидРасчета = ПланыВидовРасчета.Начисления.ОкладПоТарифу;
	Движение.ПериодРегистрации = Дата;
	Движение.ПериодДействияНачало = НачалоМесяца(Дата);
	Движение.ПериодДействияКонец = КонецМесяца(Дата);
	Движение.Сотрудник = Сотрудник;
	Движение.РасчетныеДанные = Сумма;
	
	Движения.Записать();
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	НачисленияДанныеГрафика.РабочийДеньФактическийПериодДействия как Отработал,
		|	НачисленияДанныеГрафика.РасчетныеДанные как Оклад
		|ИЗ
		|	РегистрРасчета.Начисления.ДанныеГрафика(Регистратор = &Регист) КАК НачисленияДанныеГрафика";
	
	Запрос.УстановитьПараметр("Регист", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Если не РезультатЗапроса.Пустой() тогда
		
		ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
		ВыборкаДетальныеЗаписи.Следующий();
		ИтоговыйОклад = ВыборкаДетальныеЗаписи.Оклад * ВыборкаДетальныеЗаписи.Отработал;
			
		Движение.Сумма=ИтоговыйОклад;
		Движения.Начисления.Записать();
		
		Движения.ЗадолженностиПередСотрудниками.Записывать = Истина;
		Движение = Движения.ЗадолженностиПередСотрудниками.Добавить();
		Движение.Сотрудник = Сотрудник;
		Движение.СуммаДолга = ИтоговыйОклад;
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		
		Движения.Начисления.Записать();
			
		
	КонецЕсли;

КонецПроцедуры