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