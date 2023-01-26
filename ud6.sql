hemos visto inner join el 25 de enero

union/

dos tablas son compatibles si tienen dos columnas con los mismos tipo de datos.
year no funciona en postgres


select name, surname, start_date
from employees

select name from departments
union select name 
from towns;


select name from departments
union select name 
from towns;

intersect


select distinct manager from employees; // muestra todos los empleados que son managers



select num
from employees 
where year(start_date) = 2010
 and num in 
(select  distinct manager 
from employees);


select * from departments where num in (10,15,25);

union