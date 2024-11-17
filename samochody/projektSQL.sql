SELECT * 
FROM Car_Sales;

--Preaparing data

--UPDATE dbo.Car_Sales
--SET Engine = 'Double Overhead Camshaft'
--WHERE Engine = 'DoubleÃ‚Â Overhead Camshaft';


--UPDATE dbo.Car_Sales
--SET Engine = 'Double Overhead Camshaft'
--WHERE Engine LIKE '%Double%Overhead%Camshaft%';

SELECT 
    COUNT(*) AS TotalRows,

    SUM(CASE WHEN Car_id IS NULL THEN 1 ELSE 0 END) AS CarIdNulls,
    SUM(CASE WHEN Car_id = '' THEN 1 ELSE 0 END) AS CarIdEmpty,

    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS DateNulls,

    SUM(CASE WHEN [Customer Name] IS NULL THEN 1 ELSE 0 END) AS CustomerNameNulls,
    SUM(CASE WHEN [Customer Name] = '' THEN 1 ELSE 0 END) AS CustomerNameEmpty,

    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS GenderNulls,
    SUM(CASE WHEN Gender = '' THEN 1 ELSE 0 END) AS GenderEmpty,

    SUM(CASE WHEN [Annual Income] IS NULL THEN 1 ELSE 0 END) AS AnnualIncomeNulls,

    SUM(CASE WHEN Dealer_Name IS NULL THEN 1 ELSE 0 END) AS DealerNameNulls,
    SUM(CASE WHEN Dealer_Name = '' THEN 1 ELSE 0 END) AS DealerNameEmpty,

    SUM(CASE WHEN Company IS NULL THEN 1 ELSE 0 END) AS CompanyNulls,
    SUM(CASE WHEN Company = '' THEN 1 ELSE 0 END) AS CompanyEmpty,

    SUM(CASE WHEN Model IS NULL THEN 1 ELSE 0 END) AS ModelNulls,
    SUM(CASE WHEN Model = '' THEN 1 ELSE 0 END) AS ModelEmpty,

    SUM(CASE WHEN Engine IS NULL THEN 1 ELSE 0 END) AS EngineNulls,
    SUM(CASE WHEN Engine = '' THEN 1 ELSE 0 END) AS EngineEmpty,

    SUM(CASE WHEN Transmission IS NULL THEN 1 ELSE 0 END) AS TransmissionNulls,
    SUM(CASE WHEN Transmission = '' THEN 1 ELSE 0 END) AS TransmissionEmpty,

    SUM(CASE WHEN Color IS NULL THEN 1 ELSE 0 END) AS ColorNulls,
    SUM(CASE WHEN Color = '' THEN 1 ELSE 0 END) AS ColorEmpty,

    SUM(CASE WHEN [Price ($)] IS NULL THEN 1 ELSE 0 END) AS PriceNulls,

    SUM(CASE WHEN [Dealer_No ] IS NULL THEN 1 ELSE 0 END) AS DealerNoNulls,
    SUM(CASE WHEN [Dealer_No ] = '' THEN 1 ELSE 0 END) AS DealerNoEmpty,

    SUM(CASE WHEN [Body Style] IS NULL THEN 1 ELSE 0 END) AS BodyStyleNulls,
    SUM(CASE WHEN [Body Style] = '' THEN 1 ELSE 0 END) AS BodyStyleEmpty,

    SUM(CASE WHEN Phone IS NULL THEN 1 ELSE 0 END) AS PhoneNulls,
    SUM(CASE WHEN Phone = '' THEN 1 ELSE 0 END) AS PhoneEmpty,

    SUM(CASE WHEN Dealer_Region IS NULL THEN 1 ELSE 0 END) AS DealerRegionNulls,
    SUM(CASE WHEN Dealer_Region = '' THEN 1 ELSE 0 END) AS DealerRegionEmpty

FROM dbo.Car_Sales;



/*
CREATE PROCEDURE dbo.Check_For_NaN
    @tableName NVARCHAR(128)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    
    SET @sql = N'SELECT * FROM ' + QUOTENAME(@tableName) + ' WHERE ';
    
    -- Pobierz kolumny tekstowe z INFORMATION_SCHEMA
    SELECT @sql = @sql + '(' + QUOTENAME(COLUMN_NAME) + N' = ''NaN'') OR '
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @tableName
    AND (DATA_TYPE = 'varchar' OR DATA_TYPE = 'nvarchar' OR DATA_TYPE = 'char' OR DATA_TYPE = 'nchar');

    -- Usuñ ostatnie "OR"
    SET @sql = LEFT(@sql, LEN(@sql) - 3);
    
    -- Wykonaj dynamiczne zapytanie
    EXEC sp_executesql @sql;
END;
*/


--EXEC dbo.Check_For_NaN 'Car_Sales';



SELECT Car_id, COUNT(*)
FROM dbo.Car_Sales
GROUP BY Car_id
HAVING COUNT(*) > 1;


SELECT DISTINCT Gender
FROM dbo.Car_Sales;


SELECT DISTINCT Transmission
FROM dbo.Car_Sales;


SELECT DISTINCT Color
FROM dbo.Car_Sales;


SELECT 
    MIN([Annual Income]) AS MinIncome,
    MAX([Annual Income]) AS MaxIncome,
    AVG([Annual Income]) AS AvgIncome,
    MIN([Price ($)]) AS MinPrice,
    MAX([Price ($)]) AS MaxPrice,
    AVG([Price ($)]) AS AvgPrice
FROM dbo.Car_Sales;


SELECT Model, COUNT(*) AS SalesCount
FROM dbo.Car_Sales
GROUP BY Model
ORDER BY SalesCount DESC;


SELECT Model, COUNT(*) AS SalesCount
FROM dbo.Car_Sales
GROUP BY Model
ORDER BY SalesCount DESC;




--Groupping data

--Top charts 

--Total number of cars sold
SELECT COUNT(*) AS TotalSales
FROM dbo.Car_Sales;






--Total sales by copany and model

SELECT 
    Company,
    Model,
    COUNT(*) AS TotalSales
FROM 
    dbo.Car_Sales
GROUP BY 
    Company, Model
ORDER BY 
    TotalSales DESC;



SELECT 
    DATEPART(YEAR, Date) AS Year, 
    DATEPART(MONTH, Date) AS Month,
    COUNT(*) AS TotalSales
FROM 
    dbo.Car_Sales
GROUP BY 
    DATEPART(YEAR, Date), DATEPART(MONTH, Date)
ORDER BY 
    Year, Month;




SELECT 
    DATEPART(YEAR, Date) AS Year, 
    DATEPART(MONTH, Date) AS Month,
    SUM([Price ($)]) AS TotalRevenue
FROM 
    dbo.Car_Sales
GROUP BY 
    DATEPART(YEAR, Date), DATEPART(MONTH, Date)
ORDER BY 
    Year, Month;


















