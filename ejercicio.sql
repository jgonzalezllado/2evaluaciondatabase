
CREATE TABLE MOVIES (
title VARCHAR(255) PRIMARY KEY,
date_movie TIMESTAMP NOT NULL,
running_time INTEGER NOT NULL
);

CREATE TABLE GENRE_MOVIES(
    
    id_genre INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    PRIMARY KEY(title,id_genre),
    FOREIGN KEY(id_genre) REFERENCES GENRES (id_genre) ON DELETE SET NULL,
    FOREIGN KEY(title) REFERENCES MOVIES(title) ON DELETE SET NULL

);


CREATE TABLE GENRES(
id_genre INTEGER PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE SHOW_TIME(
id_show INTEGER PRIMARY KEY,
start_time TIME,
end_time TIME,
date_show TIMESTAMP NOT NULL

);

CREATE TABLE TIME_THEATERS(
id_show INTEGER NOT NULL,
number_theater INTEGER NOT NULL,
PRIMARY KEY(id_show, number_theater),
FOREIGN KEY(id_show) REFERENCES SHOW_TIME(id_show) ON UPDATE SET NULL,
FOREIGN KEY(number_theater) REFERENCES THEATERS(number_theater) ON DELETE CASCADE
);

CREATE TABLE THEATERS(
number_theater INTEGER,
id_movtheater INTEGER NOT NULL,
capacity INTEGER,
location_seats VARCHAR(255)NOT NULL,
projection_type VARCHAR(40),
PRIMARY KEY(id_movtheater,number_theater),
FOREIGN KEY(id_movtheater) REFERENCES MOVIE_THEATERS(id_movtheater) ON DELETE SET NULL
);

CREATE TABLE MOVIE_THEATERS(
id_movtheater INTEGER PRIMARY KEY,
name_T VARCHAR(255) NOT NULL,
address_T VARCHAR(255) NOT NULL
);

CREATE TABLE TICKETS(
id_ticket INTEGER PRIMARY KEY,
id_show INTEGER NOT NULL,
number_seat VARCHAR(2) NOT NULL DEFAULT '0A',
price NUMERIC(5,2),
method_payment VARCHAR(30),
number_client INTEGER NOT NULL,
CHECK(price >= 10),
FOREIGN KEY(id_show) REFERENCES SHOW_TIME(id_show) ON DELETE SET DEFAULT
);

CREATE TABLE CLIENTS(
number_client INTEGER PRIMARY KEY,
email VARCHAR(100),
UNIQUE(email)

);


--AÑADIR INFO A LA TABLA CLIENTS--
INSERT INTO CLIENTS (number_client,email) VALUES
(1, '1@gmail.com'),(2, '2@gmail.com'),(3, '3@gmail.com'),(4, '4@gmail.com'),(5, '5@gmail.com'),(6, '6@gmail.com');

--AÑADIR INFO A LA TABLA TICKETES--

INSERT INTO TICKETS(id_ticket,id_show, number_seat,price,method_payment,number_client) VALUES

(1, 1, 'B1', 10, 'TARJETA', 2),(2, 2, 'A1', 10, 'TARJETA', 2),(3, 3, 'A', 15, 'TARJETA', 2),(4, 4, 'A6', 15, 'TARJETA', 2),(5, 5, 'A7', 15, 'TARJETA', 2),(6, 6, 'A6', 10, 'EFECTIVO', 3)  ;


--AÑADIENDO INFO A SHOW_TIME--

INSERT INTO SHOW_TIME (id_show,start_time, end_time,date_show) VALUES
(1, '16:00', '18:00' , '10/10/2022' ),
(2, '16:00', '18:00' , '10/10/2022' ),
(3, '19:00', '22:00' , '10/10/2022' ),
(4, '18:30', '19:30' , '10/10/2022' ),
(5, '19:30', '21:00' , '10/10/2022' ),
(6, '17:00', '19:00' , '10/10/2022' );




--AÑADIENDO INFO A MOVIE_THEATERS--

INSERT INTO MOVIE_THEATERS (id_movtheater, name_T, address_T) VALUES
(1,'CHAPLIN', 'C:\PLAZA DE ESPAÑA');

--AÑADIENDO INFOO A THEATERS(CINE)--


INSERT INTO THEATERS(number_theater, id_movtheater, capacity, location_seats, projection_type) VALUES
(3,1,400,'1B','2D'),(4,1,400,'1C','2D'),(5,1,400,'1K','3D'),(7,1,400,'PL','3D');


--INSERTAR DATOS A MOVIES--
CREATE TABLE MOVIES (
title VARCHAR(255) PRIMARY KEY,
date_movie TIMESTAMP NOT NULL,
running_time INTEGER NOT NULL
);

INSERT INTO MOVIES(title, date_movie, running_time) VALUES
('Matrix', '30-01-2005', 130),('El pastor','30-01-2008', 230),('El padrino', '30-01-20021', 130),('La abeja que rie', '2-01-2005', 90);
--ME EQUIVOQUE CON EL TIPO DE DATO--
INSERT INTO MOVIES(date_movie) VALUES
(2005),(2004),(1995),(2000);

--MODIFICACIONES REALIZADAS, NO TENER EN CUENTA, PARA ACLARARME--

ALTER TABLE MOVIES
DROP COLUMN date_movie;

ALTER TABLE MOVIES
add date_movie DATE;

ALTER TABLE SHOW_TIME 
DROP COLUMN start_time;
;

ALTER TABLE SHOW_TIME 
add start_time TIME;
;

ALTER TABLE SHOW_TIME 
add end_time TIME;
;