--La siguiente es la sintaxis parcial general para agregar una restricción "foreign key":

 alter table NOMBRETABLA1
  add constraint NOMBRERESTRICCION
  foreign key (CAMPOCLAVEFORANEA)
  references NOMBRETABLA2 (CAMPOCLAVEPRIMARIA);


  -- FOREIGN KEY

 add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo);
  
  CREATE TABLE orders (
    order_id integer PRIMARY KEY,
    product_no integer REFERENCES products (product_no),
    quantity integer
);

CREATE TABLE orders (
    order_id integer PRIMARY KEY,
    product_no integer REFERENCES products,
    quantity integer
);

  -- creat tablas

  CREATE TABLE products (
    product_no integer,
    name text,
    price numeric CHECK (price > 0)
);

--ejemplo de precio superior/rebajado

CREATE TABLE products (
    product_no integer,
    name text,
    price numeric CHECK (price > 0),
    discounted_price numeric CHECK (discounted_price > 0),
    CHECK (price > discounted_price)
);

-- RESTRICCIÓN NO NULL

CREATE TABLE products (
    product_no integer NOT NULL,
    name text NOT NULL,
    price numeric
);

--RESTRICCION NOT NULL CHECK

CREATE TABLE products (
    product_no integer NOT NULL,
    name text NOT NULL,
    price numeric NOT NULL CHECK (price > 0)
);

--RESTRICCION  UNIQUE

CREATE TABLE products (
    product_no integer UNIQUE,
    name text,
    price numeric
);

--RESTRICCION UNIQUE

CREATE TABLE example (
    a integer,
    b integer,
    c integer,
    UNIQUE (a, c)
);

-- PRIMARY KEY

CREATE TABLE products (
    product_no integer PRIMARY KEY,
    name text,
    price numeric
);

CREATE TABLE example (
    a integer,
    b integer,
    c integer,
    PRIMARY KEY (a, c)
);


--ON DELETE CASCADE

CREATE TABLE order_items (
    product_no integer REFERENCES products ON DELETE RESTRICT,
    order_id integer REFERENCES orders ON DELETE CASCADE,
    quantity integer,
    PRIMARY KEY (product_no, order_id)
);


--ON UPDATE

CREATE TABLE concert
(
    key SERIAL PRIMARY KEY,
    club_name TEXT REFERENCES club(name) ON UPDATE CASCADE,
    band_name TEXT REFERENCES band(name) ON UPDATE CASCADE,
    concert_date DATE
);



CREATE DATABASE TEATHER;

c\TEATHER


CREATE TABLE CLIENTS(
    Number_Client SERIAL
);

CREATE TABLE MOVIES(
   ID_Movie integer PRIMARY KEY,
   Duration TIME,
   
);

CREATE TABLE HALL(
    
);
CREATE TABLE THEATERS(
    
);
CREATE TABLE TICKETS(
    
);

CREATE TABLE SHOW_TIME(
    
);



