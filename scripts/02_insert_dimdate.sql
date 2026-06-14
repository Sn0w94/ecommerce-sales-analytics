-- Generowanie każdego dnia z przedziału (Zakres: 2022-01-01 do 2024-12-31) --

-- KROK 1: Ustawiamy bazę --

USE ecommerce_analytics;

-- KROK 2: Generuje zakres dat przez CTE --

WITH DateCTE AS (
	SELECT 
		CAST('2022-01-01' AS date) AS FullDate
	UNION ALL 
	SELECT 
		DATEADD(DAY, 1, FullDate)
	FROM 
		DateCTE
	WHERE
		FullDate < '2024-12-31'
)

-- KROK 3: Wstaw dane do DimDate --

INSERT INTO DimDate (
	DateKey 
	, FullDate 
	, [Year] 
	, Quarter 
	, QuarterName
	, [Month] 
	, MonthName 
	, DayOfWeek 
	, IsWeekend
)

-- KROK 4: Przekształcamy każdą datę w wiersz z kolumnami

SELECT 
	CAST(format(FullDate, 'yyyyMMdd') AS int)			AS DateKey
	, FullDate											AS FullDate
	, YEAR(FullDate)									AS Year 
	, DATEPART(quarter, FullDate)						AS Quarter
	, CASE DATEPART(quarter, FullDate)
		WHEN 1 THEN 'Q1'
		WHEN 2 THEN 'Q2'
		WHEN 3 THEN 'Q3'
		WHEN 4 THEN 'Q4'
	  END 												AS QuarterName
	, MONTH(FullDate)									AS Month
	, DATENAME(MONTH, FullDate)							AS MonthName
	, DATEPART(weekday, FullDate)						AS DayOfWeek
	, CASE 
		WHEN DATEPART(weekday, FullDate) IN (1,7) THEN 1
		ELSE 0
	  END												AS IsWeekend
FROM DateCTE

-- KROK 5: Limit rekurencji powyżej domyślnych 100

OPTION (MAXRECURSION 1500);