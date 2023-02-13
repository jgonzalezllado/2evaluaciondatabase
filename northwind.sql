13.- Ten most expensive products.
productid product name unit price
price*quantity*(1-discount

SELECT 
p.ProductID, p.ProductName,p.UnitPrice
from Products p 
order by p.UnitPrice desc
limit 10;

25.

SELECT p.ProductID, p.ProductName, s.CompanyName
FROM Products p, Suppliers s 
where p.SupplierID = s.SupplierID
and p.UnitsInStock = 0 AND p.Discontinued = 0;


nº 27.

SELECT od.OrderID, o.OrderDate,
SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) + SUM(od.UnitPrice * od.Quantity * od.Discount) as Subtotal,
SUM(od.UnitPrice * od.Quantity * od.Discount) as TotalDiscount,
SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) as SubtotalWithDiscount
FROM `Order Details` od, Orders o
where od.OrderID = o.OrderID
GROUP BY od.OrderID
ORDER BY TotalDiscount DESC
LIMIT 10;

26.
 s.CompanyName 
where p.SupplierID = s.SupplierID




24. 

SELECT p.ProductID, p.ProductName
FROM Products p
WHERE p.UnitsInStock = 0;



22.



SELECT s.CompanyName, 
COUNT(o.OrderID) as NumOrders
FROM Shippers s, Orders o
WHERE s.ShipperID = o.ShipVia
GROUP BY s.CompanyName
ORDER BY NumOrders DESC;

19.

select
count(City) as NumberBCN
from Customers
where City = 'Barcelona';