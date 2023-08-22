/*Creating the Book Table*/
create table Book(
bookId int not null primary key,
Title varchar(50),
ISBN int unique,
Genre text,
TypeOfBook text,
publication_year text,
price decimal(10,2),
Condition text);

Alter table Book add Author_ID int,publisher_Id int;
alter table Book add foreign key(Author_ID) references Authors(A_id);
alter table Book add foreign key(publisher_Id) references publishers(pub_id);
select * from Book;

/*Inserting the data*/
insert into book(bookId,Title,ISBN,Genre,TypeOfBook,publication_year,price,Condition) values(1,'DBMS',567,'Basic','Study type','2020',100.00,'Good');
insert into book(bookId,Title,ISBN,Genre,TypeOfBook,publication_year,price,Condition) values(2,'C',568,'Intermediate','Study type','2022',500.00,'Good');

/*Creating Publishers table*/
create table publishers(
pub_id int not null primary key,
B_id int foreign key references Book(bookId),
Country text);

insert into publishers values(30,1,'India');
insert into publishers values(40,2,'US');

select * from publishers;

/*Creating the Authors*/
create table Authors(
A_id int not null primary key,
firstName varchar(50),
Lastname varchar(50),B_id int foreign key references Book(bookId));

insert into Authors values(20,'Var','Sharma',1);
insert into Authors values(50,'Bodhs','Ravuri',2);
select * from authors;
update book set Author_ID=50,publisher_Id=40 where bookId=2;

/*Creating table Inventory*/
create table Inventory(
B_Id int foreign key references Book(bookId),
stockLevelUsed text,
stockLevelNew text);

insert into Inventory values(1,'Used','New');
insert into Inventory values(2,'not used','New');
select * from Inventory;

/*Creating Orderitem table*/

create table Orderitem(
orderId int primary key,
B_Id int foreign key references Book(bookId),
Quantity int,price decimal(10,2));

insert into Orderitem values(78,1,45,900.00);
insert into Orderitem values(80,2,50,2000.00);
select * from Orderitem
/*creating Orders table*/
create table Orders(
orderId int foreign key references Orderitem(orderId),
customerId int foreign key references Customers(customerId),
OrderDate date,
SubTotal decimal(10,2),
Shipping text,
Total Decimal(10,2));
select * from Orders;

insert into Orders values(78,111,SYSDATETIME(),1900.00,'11,Andhra Pradesh',2500.00);
insert into Orders values(80,222,SYSDATETIME(),2500.00,'13-Delhi',5000.00);

/*Creating Customers*/
create table Customers(
CustomerId int primary key,
firstName varchar(50),
lastName varchar(50),
Streetnumber int,
postal_code bigint,
province text,
Country text,
mobile bigint);

insert into customers values(111,'Bodhini','Goli',11,547267,'Andhra Pradesh','India',7649679767);
insert into customers values(222,'Ajay','Ravurui',13,747242,'Delhi','India',73867387683);
select * from Book;
select * from publishers;
select * from authors;
select * from Inventory;
select * from Orderitem;
select * from Orders;
select * from Customers;
