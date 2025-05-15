
use AdventureWorks2012

--- 1 --- 
 Select * from Sales.SalesOrderHeader
 Select SalesOrderID,ShipDate from Sales.SalesOrderHeader
 where ShipDate between '7/28/2002' and '7/29/2024'


--- 2 ---
 Select ProductID , Name from Production.Product where 
 StandardCost<110


--- 3 ---
 Select ProductID from Production.Product where Weight Is null


--- 4 --- 
Select * from Production.Product where Color in('Black','Silver','Red')


--- 5 ---
 Select * from Production.Product where Name like 'B%'


--- 6 ---
 update Production.ProductDescription
 set Description = 'Chromoly steel_High of defects'
 where ProductDescriptionID = 3

 Select * from Production.ProductDescription 
 where Description like '%[_]%'


--- 7 ---
 Select sum(TotalDue) from Sales.SalesOrderHeader 
 where OrderDate between '7/1/2001' and '7/31/2014'


--- 8 ---
  Select distinct HireDate from HumanResources.Employee


 --- 9 ---
Select avg(ListPrice)
from (
    Select distinct ListPrice
    from production.product
) as distinct_prices;


--- 10 ---
Select concat('The ', name, ' is only! ', listprice) as product_info
from production.product
where listprice between 100 and 120
order by listprice;


--- 11 ---
Select rowguid, name, salespersonid, demographics
into store_archive
from sales.store;

-- Just to check it
Select count(*) from store_archive;

Select rowguid, name, salespersonid, demographics
into store_archive2
from sales.store
where 1 = 2;


--- 12 ---
Select format(getdate(),'yyyy-MM-dd') as 'Date Today'
union 
Select format(getdate(),'dd-MM-yyyy')
union 
Select format(getdate(),'hh:mm')


--- Bonus ---
 select @@VERSION -- display the name of the version of sql server
 select @@SERVERNAME --- display the name of the server
