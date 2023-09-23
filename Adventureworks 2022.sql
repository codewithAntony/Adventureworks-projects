--Ordering the Number of Employees According to Job Title in Ascending Order
SELECT *
FROM humanresources.employee
ORDER BY jobtitle;


--Ordering the top 500 Number of Employees According to Last Name in Ascending Order
SELECT TOP 500 e.*
FROM Person.Person AS e
ORDER BY lastname;



--Finding Firstname, Lastname and employee ID from the Persons table
SELECT FirstName, LastName, BusinessEntityID AS employee_id
FROM Person.Person 
ORDER BY LastName


--Finding productid, productnumber, name from production
SELECT productid, productnumber, name AS producName
FROM Production.Product
WHERE sellstartdate IS NOT NULL
AND Production.Product.ProductLine = 'T'
ORDER BY name;


--Finding the tax percentage of the subtotal
SELECT salesorderid, customerid, OrderDate, subtotal, (TaxAmt/SubTotal) * 100 AS TaxPercent
FROM sales.SalesOrderHeader
ORDER BY SubTotal DESC;


--Finding unique jobtitles from the employees table
SELECT DISTINCT jobtitle
FROM HumanResources.Employee
ORDER BY JobTitle


--Finding the SUM Of Freight from Sales Table and Grouping them by Customer ID
SELECT CustomerID, SUM(freight) AS totalFreight
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY CustomerID ASC


--Finding the SUM and AVG Of SubTotal from Sales Table and Grouping them by Customer ID, SalesOrderHeader
SELECT CustomerID, salespersonID, SUM(SubTotal) AS sumSubtotal, AVG(SubTotal) AS avgSubTotal
FROM Sales.SalesOrderHeader
GROUP BY CustomerID, SalesPersonID
ORDER BY CustomerID DESC


--Finding total quantity of each product ID In shelf A, C, H and sum of quantity should be > 500
SELECT ProductID, SUM(quantity) AS totalQuantity
FROM Production.ProductInventory
WHERE shelf IN ('A','C','H')
GROUP BY ProductID
HAVING SUM(quantity) > 500
ORDER BY productid


--Finding the total quantity for a group of locationid * 10
SELECT SUM(Quantity) AS totalQuantity
FROM Production.ProductInventory
GROUP BY (LocationID * 10)


--Using JOIN to find people who last name start with L
SELECT p.BusinessEntityID, firstname, lastname, PhoneNumber
FROM Person.Person AS p
JOIN Person.PersonPhone AS ph
ON p.BusinessEntityID = ph.BusinessEntityID
WHERE lastname LIKE 'L%'
ORDER BY lastname, firstname



