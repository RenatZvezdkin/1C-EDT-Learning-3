Процедура ОбработкаПроведения(Отказ,Режим)
	
	ТекущаяДатаДня = ДатаНачала;
	
	Движения.ГрафикРаботы.Записывать = Истина;
	Пока ТекущаяДатаДня<=ДатаКонца цикл
		
		Движение = Движения.ГрафикРаботы.Добавить();
		Движение.Дата = ТекущаяДатаДня;
	
	//Увы и ах, мой грандиозный план с записью булева, вместо 0 и 1 провалился, карету мне, карету
		Если ДеньНедели(ТекущаяДатаДня)<6 тогда
			Движение.РабочийДень = 1;
		Иначе
			Движение.РабочийДень = 0;
		КонецЕсли;
		
		ТекущаяДатаДня= ТекущаяДатаДня + 86399+1;
	
	КонецЦикла;

КонецПроцедуры