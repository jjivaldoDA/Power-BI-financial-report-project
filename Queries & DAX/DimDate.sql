SELECT [DateKey]
      ,[FullDateAlternateKey] AS Date
      --,[DayNumberOfWeek]
      ,[EnglishDayNameOfWeek] AS DayOfWeek
      --,[SpanishDayNameOfWeek]
      --,[FrenchDayNameOfWeek]
      ,[DayNumberOfMonth] AS DayOfMonth
      --,[DayNumberOfYear]
      --,[WeekNumberOfYear]
      ,[EnglishMonthName] AS Month
      --,[SpanishMonthName]
      --,[FrenchMonthName]
      ,[MonthNumberOfYear] AS MonthNumber
      ,CASE 
		WHEN [CalendarQuarter]=1 THEN 'Q1' 
		WHEN [CalendarQuarter]=2 THEN 'Q2'
		WHEN [CalendarQuarter]=3 THEN 'Q3'
		ELSE 'Q4'
		END AS Quarter 
      ,[CalendarYear] AS Year
      --,[CalendarSemester]
      --,[FiscalQuarter]
      --,[FiscalYear]
      --,[FiscalSemester]
  FROM [AdventureWorksDW2022].[dbo].[DimDate]
  WHERE CalendarYear in (2011,2012,2013)