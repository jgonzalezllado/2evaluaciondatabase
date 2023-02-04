8. no me coincide la imágen.

SELECT e.surname
FROM employees e
JOIN departments d ON e.dept_num = d.num
WHERE d.name = 'SALES'
ORDER BY e.surname;

---------------------------------------

9. select SUM(e.salary)
from employees e
join departments d ON e.dept_num = d.num
where d.name = 'SALES';

---------------------------------------------------
10. SELECT d.name, COUNT(e.num) as count_employees
FROM departments d
JOIN employees e ON d.num = e.dept_num
JOIN occupations o ON e.occu_code = o.code
WHERE o.name = 'EMPLOYEE'
GROUP BY d.name
ORDER BY count_employees DESC;

-------------------------------------------------------
13(no estaba, pero indirectamente tenía que resolverlo)
SELECT name,code FROM occupations
UNION
SELECT name, code FROM towns
ORDER BY name;
------------------------------------------------------

14.(no estaba, pero indirectamente tenía que resolverlo)  SELECT o.name
FROM employees e
JOIN departments d ON e.dept_num = d.num
JOIN occupations o ON e.occu_code = o.code
WHERE d.name = 'RESEARCH'
UNION
SELECT o.name
FROM employees e
JOIN departments d ON e.dept_num = d.num
JOIN occupations o ON e.occu_code = o.code
WHERE d.name = 'SALES';

---------------------------------------------------------

15. SELECT o.name
FROM employees e
JOIN departments d ON e.dept_num = d.num
JOIN occupations o ON e.occu_code = o.code
WHERE d.name = 'RESEARCH'
UNION ALL
SELECT o.name
FROM employees e
JOIN departments d ON e.dept_num = d.num
JOIN occupations o ON e.occu_code = o.code
WHERE d.name = 'SALES';




17. SELECT COUNT(*) number_of_salesmen
FROM employees
JOIN departments ON employees.dept_num = departments.num
JOIN occupations ON employees.occu_code = occupations.code
WHERE departments.name = 'SALES' AND occupations.name = 'SALESMAN';

P06

Title and year of premiere of all those films that we do not know the director. 
order the results by film title. The title of the movie must begin with 'W'. 
Order the results by title of the movie. (clue: NOT IN (subselect)).

SELECT name as title, year as premiere_year
FROM movies
WHERE name LIKE 'W%' AND id NOT IN (
  SELECT movie_id
  FROM movies_directors
)
ORDER BY name;
P06_Northwind

.- Show the total sales by year.

SELECT YEAR(O.OrderDate)
AS OrderYear, SUM(UnitPrice*quantity * (1-discount)) AS Subtotal
FROM Orders O, `Order Details` od 
WHERE od.OrderID = O.OrderID
GROUP BY OrderYear;


Total sales by country.

select ShipCountry, SUM(UnitPrice*quantity*(1-discount)) AS Subtotal
FROM Orders O, `Order Details` od 
WHERE od.OrderID = O.OrderID 
Group by ShipCountry;



Show employee sales order by sales amount descendent.




select E.LastName, E.FirstName, E.employeeID,
SUM(od.UnitPrice* od.quantity * (1-od.discount)) AS Subtotal
FROM `Order Details` od, Orders O, Employees E 
WHERE od.OrderID = O.OrderID AND O.EmployeeID = E.EmployeeID
GROUP BY E.LastName, E.FirstName, E.employeeID
ORDER by Subtotal DESC;




5.- Show employee sales by country order by country
 ascendent and sales amount descendent.

select E.LastName, E.FirstName, E.EmployeeID, O.ShipCountry,
SUM(od.UnitPrice* od.Quantity * (1-od.Discount)) AS Subtotal
FROM `Order Details` od, Orders O, Employees E 
WHERE od.OrderID = O.OrderID AND O.EmployeeID = E.EmployeeID
GROUP BY E.LastName, E.FirstName, E.EmployeeID, O.ShipCountry
ORDER BY O.ShipCountry ASC ,Subtotal DESC;


6.- Sales per category.

select c.CategoryID, c.CategoryName,
SUM(od.UnitPrice* od.Quantity * (1-od.Discount)) AS Subtotal
FROM `Order Details` od, Products P, Categories c 
WHERE od.ProductID = P.ProductID AND P.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName;



7.- Number of products by category.

select c.CategoryID, c.CategoryName, COUNT(p.QuantityPerUnit)
from Categories c, Products p
WHERE p.CategoryID = c.CategoryID
GROUP BY CategoryID;

8.- Order details of the order number 10248.

select od.OrderID, od.ProductID, p.ProductName, p.UnitPrice, od.Quantity,
od.Discount, SUM(od.UnitPrice* od.Quantity *(1-od.Discount)) AS ExtendedPrice
FROM `Order Details` od, Products p
WHERE od.ProductID = p.ProductID  AND od.OrderID = '10248'
GROUP BY od.OrderID, od.ProductID
;

9.- Total amount for order 10248.
SELECT 
SUM(od.UnitPrice* od.Quantity * (1-od.Discount)) AS `Total Price`
FROM `Order Details` od 
WHERE od.OrderID = '10248';

10.- Order heading for order 10248.

select od.OrderID, o.OrderDate, o.RequiredDate, c.CustomerID, c.Address,
c.City, c.Region, c.PostalCode, c.Country, o.ShippedDate, c.CompanyName,
o.Freight, o.ShipAddress, o.ShipCity, o.ShipRegion, o.ShipPostalCode, o.ShipCountry,
CONCAT(e.FirstName, ' ', e.LastName) AS `Sales Person`
FROM `Order Details` od, Orders o, Customers c, Employees e
WHERE od.OrderID = o.OrderID AND o.EmployeeID = e.EmployeeID AND
od.OrderID = '10248'
GROUP BY od.OrderID
;

11.- Top 10 products with more units sold.

select p.ProductName,
SUM(od.Quantity) AS Units
FROM Products p, `Order Details` od
WHERE p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY Units DESC
limit 10
;

12.- List of products with its price and 
its prices in orders. In the table Products 
UnitPrice is the cost price of the products 
(what we paid to the providers), 
in Order Details we have the price 
that we sold the products
 to the customers.






12- Listado de productos con su precio y sus precios en pedidos. 
En la tabla Products UnitPrice es el precio de coste de los productos
 (lo que pagamos a los proveedores), 
en Order Details tenemos el precio al que vendimos 
los productos a los clientes.


SELECT DISTINCT
p.ProductID, p.UnitPrice, od.UnitPrice as UnitPriceSold
from Products p, `Order Details` od 
where p.ProductID = od.ProductID
order by ProductID;



p06 

1.- Show total cost of every order in May 1998 (also called “subtotal”). Clue: price*quantity*(1-discount), date format : 'yyyy-mm-dd'.

SELECT od.OrderID, o.OrderDate, SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS `Sub total`
FROM `Order Details` od, Orders o
WHERE od.OrderID = o.OrderID 
SELECT * FROM orders
WHERE TO_CHAR(order_date, 'YYYY-MM') = '2022-02';
GROUP BY od.OrderID
ORDER BY od.OrderID;







6. Name of the director, premiere year and full name and roles of the actors 
in the movie "Lost in Translation". 
Sort the result by actors' full name.

select  
CONCAT(D.first_name,' ', D.last_name) AS director_name,
m.name AS movie_title, m.year,
CONCAT(A.first_name,' ', A.last_name) AS actor_name,  r.role
FROM directors D, movies_directors md, movies m, roles r, actors A
WHERE D.id = md.director_id AND md.movie_id = m.id AND m.id = r.movie_id AND r.actor_id = A.id
AND m.name = 'Lost in Translation'
GROUP BY actor_name;

-----------------------------------------------------------

7. Full name of the actors with whom Uma Thurman worked. 
Also indicate the full name and the year of the premiere of the film 
in the movie with title 'Kill Bill: Vol. 1'.
 Order the results by movie name and actor full name. 
Obviously, Uma Thurman must not be in the results.


SELECT DISTINCT
CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
m.name AS movie_title,
 m.year
FROM actors a, roles r, movies m
WHERE m.id = r.movie_id
AND r.actor_id = a.id
AND m.name = 'Kill Bill: Vol. 1'
AND a.id NOT IN (
    SELECT id
    FROM actors
    WHERE CONCAT(a.first_name, ' ', a.last_name) = 'Uma Thurman'
  )
ORDER BY  actor_name, movie_title;
-----------------------------------------------------------
Title of the movies directed by Quentin Tarantino. 
Sort the result by year and title.


SELECT DISTINCT
 m.year, m.name
FROM movies m, movies_directors md, directors d
WHERE m.id = md.movie_id AND md.director_id = d.id
AND d.id IN (
    select director_id
    from movies_directors
    WHERE CONCAT(d.first_name, ' ', d.last_name) = 'Quentin Tarantino'

)
Order by year, m.name;

-----------------------------------------------------

SELECT
CONCAT(d.first_name, ' ', d.last_name) AS director_name,
COUNT(md.movie_id) AS num_movies
from directors d, movies_directors md
WHERE d.id = md.director_id AND d.id IN (
    select director_id
    from movies_directors
    WHERE CONCAT(d.first_name, ' ', d.last_name) = 'Quentin Tarantino'
);


------------------------------------------------
10. List of actors with surname starting with a ‘Puent’, 
indicating the number of films in which they have participated, 
ordered by the number of films descendent. 


SELECT a.first_name, a.last_name,
COUNT(r.movie_id) AS num_movies
FROM actors a, roles r
WHERE a.id = r.actor_id  AND
a.last_name like 'Puent%'
group by a.first_name, a.last_name
Order by num_movies DESC;

---------------------------


