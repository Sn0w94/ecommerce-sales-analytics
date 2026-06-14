/* 
 * Uzupełniami danymi tabele faktów.
 * Aby mieć możliwość połączenia między danymi z tabeli DimDate z FactSales 
 * potrzebujemu przekonwertować kolumnę z datami z NVARCHAR na INT w formacie YYYYMMDD -> jest to format dopasowany do DataKey
 */

INSERT INTO FactSales (
	DateKey 
	, ProductKey
	, RegionKey
	, Quantity
	, Sales
	, Profit
)
SELECT 
	dd.DateKey 
	, dp.ProductKey
	, dr.RegionKey 
	, CAST (sr.Quantity AS int)
	, CAST (sr.Sales AS decimal(10,2))
	, CAST (sr.Profit AS decimal(10,2))
FROM
	StagingRaw sr 
		JOIN DimDate dd  	ON CAST (FORMAT(CAST(sr.OrderDate AS date), 'yyyyMMdd') AS int) = dd.DateKey
		JOIN DimProduct dp 	ON sr.ProductName = dp.ProductName 
		JOIN DimRegion dr 	ON sr.Region = dr.RegionName 