﻿
Перем юТест;

////////////////////////////////////////////////////////////////////
// Программный интерфейс

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоСоздаетсяБуферДвоичныхДанных");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоМожноЗаписатьБайты");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоМожноПрочитатьБайты");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоМожноЗаписатьБуфер");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоМожноЗаписатьЦелое16");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоМожноЗаписатьЦелое16BigEndian");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоМожноЗаписатьЦелое32");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоМожноЗаписатьЦелое32BigEndian");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоМожноЗаписатьЦелое64");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоМожноЗаписатьЦелое64BigEndian");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоДоступноЧтениеПоИндексу");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоДоступнаЗаписьПоИндексу");
	
	Возврат ВсеТесты;
	
КонецФункции

Функция ПолучитьБуферСДанными()

	Буфер = Новый БуферДвоичныхДанных(10);
	Для Сч = 0 По 9 Цикл
		Буфер[Сч] = Сч=1;
	КонецЦикла;

	Возврат Буфер;
	
КонецФункции

Процедура ТестДолжен_ПроверитьЧтоСоздаетсяБуферДвоичныхДанных() Экспорт
	
	Б = ПолучитьБуферСДанными();
	юТест.ПроверитьРавенство(10, Б.Количество());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоМожноЗаписатьБайты() Экспорт
	
	Б = ПолучитьБуферСДанными();
	Чистый = Новый БуферДвоичныхДанных(Б.Количество());
	
	Чистый.Записать(0, Б);
	Для Сч = 0 По Чистый.Размер-1 Цикл
		юТест.ПроверитьРавенство(Б[Сч], Чистый[Сч], "Сверка в индексе " + Сч);
	КонецЦикла
	
	Чистый = Новый БуферДвоичныхДанных(5);
	Чистый.Записать(0, Б, 5);
	Для Сч = 0 По Чистый.Размер-1 Цикл
		юТест.ПроверитьРавенство(Б[Сч], Чистый[Сч], "Сверка частичной записи в индексе " + Сч);
	КонецЦикла
	
КонецПроцедуры
