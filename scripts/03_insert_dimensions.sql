-- Uzupełniemy tabele DimProduct o dane z tabeli StagingRaw --

INSERT INTO DimProduct (
	ProductName
	, Category
)
SELECT DISTINCT 
	ProductName
	, Category
FROM 
	StagingRaw sr 
ORDER BY
	ProductName 
ASC 


-- Uzupełniemy tabele DimRegion o dane z tabeli StagingRaw --

INSERT INTO DimRegion (
	RegionName
)
SELECT DISTINCT 
	Region
FROM 
	StagingRaw sr 
ORDER BY 
	Region 
ASC 