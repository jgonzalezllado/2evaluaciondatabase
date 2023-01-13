sudo su postgres //volver admin
cd // va al directorio home
pwd//
man// saber los comandos /manual

//-P (salta un promp)

-S // no super user
-s // super user
reset // limpiar consola

\du // listar usuarios

createuser -P -s frank

orden grant para dar permisos

-O // definir el propietario


createdb janedb -O jane
createdb frankdb -O frank

conectar a base de datos 

\l ver base de datos


psql -h (ip) localhost 

psql -h localhost -U jane -p 5432 janedb  //conecta el usuario con la base de datos directamente
psql -h localhost -U jane -p 5432 frankdb
)

ipa

// base de datos divididas en schema  
// tambien tener permiso usage
//permisos sobre la tabla, ejemplo select


dropdb "janedb"
dropdb "frankdb"

dropuser janed
dropuser frank

//te los crea sin permisos
CREATE USER frank WITH SUPERUSER PASSWORD 'alualualu';
CREATE ROLE jane WITH NOSUPERUSER PASSWORD 'alualualu'; // EQUIVALENTE CREAR USUARIO CON COMANDO DE LINUX ROLE HACE REFERENCOA AL USER Y GRUPOS
CREATE DATABASE janedb WITH OWNER jane; // CREAR ESPECIFICANDO DUEÑO
vi // es un editor de texto mas primitivo que lo tiene cualquier sistema unix y LINUX
:wq! quitar 

hay que dar permiso de conecta
alter user jane with login;//permisos login

\i //importa archivo \i /home/julia/jane.sql 

cat // te enseña el contenido de una archivo

dump // como usuario postgres pg_dump // o nombre de archivo// janedb > kk.sql ( pasarlo aotro archivo)// vuelca por pantalla toda la base de datos  

psql algo ( conecta como posrtgres a la base de datos)

AS user postgres in the OS:
pg_dump frankdb > frankdb.sql
createdb frankies -O jane
psql frankies < frankdb.sql

EXAMEN //

5.12 
//MODELO ENTIDAD RELACION Y CREAR DBEJERCICIO P05 CREATING DATABASE ORDER ITEMS postgres
IR CRENADO TABLAS
CREATE DATABASE DROP DATABASE CREAT TABLE DROP TABLE INSERT UPDATE DELETE 
ON DELETE CASCADE , ON DELETE RESTRICT UPDATE CASCADE 

DELETE FROM ALUMNOS WHERE NIF='111111A';

create index index_asignaturas_alumnos on asignaturas (codigo);


//tema 6

querying tables

cp ~/ (copia directorio home al usuario)

ostgres@AURA04:~$ pwd
/var/lib/postgresql
postgres@AURA04:~$ ls
14  kk.sql  q  samplecompany_postgresql.sql
postgres@AURA04:~$ psql
psql (14.5 (Ubuntu 14.5-0ubuntu0.22.04.1))
Type "help" for help.

postgres=# \i samplecompany_postgresql.sql


select name, surname, salary, salary *1.20 as ‘salary20’ from employees;

select * from employees as E, departments as D where E.dept_num = D.num;
select name, surname from employees order by surname asc, name desc;
select E.name, E.surname, E.start_date, E.salary, D.name as dept_name from employees as E, departments as D where E.dept_num = D.num;

