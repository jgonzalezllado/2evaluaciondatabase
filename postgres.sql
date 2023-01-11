
-- postgresql
create table customers (
    "e-mail" varchar(150),
    fname varchar(50) not null,
    mname varchar(50),
    lname varchar(50) not null,
    address varchar(200) unique,
    date_of_birth date default '1900-1-1',
    constraint pk_customers primary key ("e-mail")
);
create table orders (
    number serial primary key,
    date timestamp default now(),
    "e-mail" varchar(150),
    constraint fk_orders foreign key ("e-mail") references customers ("e-mail")
);
insert into customers ("e-mail", fname, lname, address)
values ('s@noemail.org', 'Sergi', 'G.', 'Carcas, 6');
insert into orders ("e-mail")
values ('s@noemail.org');
create table product(
    code varchar(5) primary key,
    name varchar(20),
    price money
);
create table order_items(
    order_number int,
    -- cambia ya que no aumenta solo
    line_number serial,
    product_code varchar (5),
    quantity int default 1,
    price money,
    constraint pk_order_items primary key (order_number, line_number),
    constraint fk_order_items foreign key (order_number) references orders (number),
    constraint fk_2_order_items foreign key (product_code) references product (code)
);

insert INTO order_items (order_number, product_code, quantity, price) VALUES
(1,'PLAY5', 5, 400.99),
(1, 'PLAY4',1,200.99),
(1, 'PLAY1' ,10, 100.99);

insert into product
values ('PLAY1', 'Playstation 1', 100.99);


ALTER TABLE product
ADD COLUMN description varchar(150);

ALTER TABLE product
delete COLUMN description varchar(150);


ALTER TABLE product
alter COLUMN description SET NOT NULL;