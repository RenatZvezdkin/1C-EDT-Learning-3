
&НаКлиенте
Процедура ТоварыИтогоПриИзменении(Элемент)
	Элементы.Товары.ТекущиеДанные.Цена = Элементы.Товары.ТекущиеДанные.Итого/ Элементы.Товары.ТекущиеДанные.Количество;
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	Элементы.Товары.ТекущиеДанные.Итого = Элементы.Товары.ТекущиеДанные.Цена * Элементы.Товары.ТекущиеДанные.Количество;
КонецПроцедуры

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	Элементы.Товары.ТекущиеДанные.Итого = Элементы.Товары.ТекущиеДанные.Цена * Элементы.Товары.ТекущиеДанные.Количество;
КонецПроцедуры


