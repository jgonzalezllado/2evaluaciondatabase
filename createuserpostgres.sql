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