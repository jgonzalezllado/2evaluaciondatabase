-- mariadb
create table customers (
    `e-mail` varchar(150),primary key,
    fname varchar(50) not null,
    mname varchar(50),
    lname varchar(50) not null,
    address varchar(200) unique,
    date_of_birth date default '1900-1-1',
    constraint pk_customers primary key (`e-mail`)
);
create table orders (
    num int auto_increment primary key,
    date timestamp default now(),
    `e-mail` varchar(150),
    constraint fk_orders foreign key (`e-mail`) references customers (`e-mail`)
);
insert into customers (`e-mail`, fname, lname, address)
values ('s@noemail.org', 'Sergi', 'G.', 'Carcas, 6');
insert into orders (`e-mail`)
values ('s@noemail.org');
create table product(
    code varchar(5) primary key,
    name varchar(20),
    price decimal (7,2)
);
create table order_items(
    order_num int,
    -- cambia ya que no aumenta solo
    line_number int,
    product_code varchar (5),
    quantity int default 1,
    price decimal(7,2),
    constraint pk_order_items primary key (order_num, line_number),
    constraint fk_order_items foreign key (order_num) references orders (num),
    constraint fk_2_order_items foreign key (product_code) references product (code)
);

insert INTO order_items (order_number, product_code, quantity, price) VALUES
(1,'PLAY5', 5, 400.99),
(1, 'PLAY4',1,200.99),
(1, 'PLAY1' ,10, 100.99);

insert into product
values ('PLAY1', 'Playstation 1', 100.99);
values ('PLAY4', 'Playstation 4', 200.99);
values ('PLAY5', 'Playstation 5', 500.99);
--enseña el sql de creacion de la tabla
SHOW CREATE TABLE customers; 





update product set description = 'a classic of my 441140' where code ='PLAY4';

insert into product
values ('PLAY4', 'Playstation 4', 200.99);
values ('PLAY5', 'Playstation 5', 500.99);