CREATE OR ALTER PROCEDURE store_sales_proc
@country_code nvarchar(10)
as
BEGIN
SELECT 
	ter.CountryCode,
	prdCat.Name as CategoryName,
	sum(Amount) as Total_sales_amount,
	sum(Quantity) as Total_Quantity FROM 
	Product as prd JOIN 
	ProductCategory as prdCat ON prd.ProductCategoryID= prdCat.ProductCategoryID
	JOIN StoreSales as ss on ss.ProductID=prd.ProductID
	JOIN store as stor on stor.StoreID =ss.StoreID
	JOIN Territory as ter on ter.TerritoryID=stor.TerritoryID
	GROUP BY ter.CountryCode,prdCat.Name
	HAVING CountryCode=@country_code; 
END;

EXEC store_sales_proc @country_code='US';
