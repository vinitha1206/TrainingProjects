--Write SQL query to join Store, Territory, Product, 
--ProductCategory, and StoreSales table, select CountryCode, 
--ProductCategory Name and summarize StoreSales Amount and Quantity.
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
	GROUP BY ter.CountryCode,prdCat.Name; 



