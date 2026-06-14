-- Utworzenie tabeli wymiarów DimDate --

create table DimDate (
	DateKey 		int primary key
	, FullDate 		date not null
	, Year 			int not null 
	, Quarter 		int not null
	, QuarterName	nvarchar (2) not null
	, Month			int not null
	, MonthName		nvarchar (20) not null
	, DayOfWeek		int not null
	, IsWeekend		bit not null
);

-- Utworzenie tabeli wymiarów DimProduct --

create table DimProduct (
	ProductKey		int identity (1,1) primary key
	, ProductName	nvarchar (100) not null
	, Category		nvarchar (50) not null 
);

-- Utworzenie tabeli wymiarów DimRegion --

create table DimRegion (
	RegionKey		int identity (1,1) primary key 
	, RegionName	nvarchar (50) not null
);

-- Utworzenie tabeli faktów FactSales --

create table FactSales (
	SalesID			int identity (1,1) primary key 
	, DateKey		int references DimDate(DateKey)
	, ProductKey	int references DimProduct(ProductKey)
	, RegionKey 	int references DimRegion(RegionKey)
	, Quantity		int not null 
	, Sales			decimal (10,2) not null 
	, Profit		decimal (10,2) not null 
);
