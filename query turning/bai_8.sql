USE AdventureWorks2019;
--------------------1--------------------
select Title,FirstName,MiddleName,LastName
from Person.Person;
--------------------2--------------------
select CONCAT(Title,' ',FirstName,' ',MiddleName,' ',LastName) PersonName
from Person.Person
WHERE MiddleName IS NOT NULL
UNION
select CONCAT(Title,' ',FirstName,' ',LastName) PersonName
from Person.Person
WHERE MiddleName IS NULL;
--------------------3--------------------
select AddressID,AddressLine1,AddressLine2,City,StateProvinceID,PostalCode from Person.Address;
--------------------4--------------------
select distinct City from Person.Address;
------------------- 5 -------------------
select top(10) * from Person.Address;

------------------- 6 -------------------
select AVG(Rate) as Average_Rate from HumanResources.EmployeePayHistory;

------------------- 7 -------------------
select COUNT(BusinessEntityID) as Number_of_Employee from HumanResources.Employee;

------------------- 8 -------------------
with foo as (
    select CustomerID, count(CustomerID) as order_number 
    from Sales.SalesOrderHeader group by CustomerID)
select * from foo where order_number >= 10
--------------------9--------------------
select ProductID,Name from Production.Product
Where ProductID NOT IN(Select ProductID From Sales.SalesOrderDetail);
-------------------10----------------
---thông số thấp câu truy vấn chạy nhanh
select *
into Sales.Customer_NoIndex
From Sales.Customer

Select * 
into Sales.Cutomer_Index
From Sales.Customer 
go
create  index  Idx_Customer_Index_CustomerID on Sales.Customer
Select CustomerID, AccountNumber
From Sales.Customer_Index
Where CustomerID = 11001
