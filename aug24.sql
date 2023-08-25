/*Inner Join*/
create database aug24
create table customer(cust_id int primary key,cust_name varchar(50));
create table ordertable(order_id int primary key,order_items varchar(50),order_amount money,cust_id int foreign key references customer(cust_id));
insert into customer values(101,'Bodhini'),(102,'Ajay'),(103,'Charan'),(104,'Dinesh');

insert into ordertable values(11,'lotion',70,101);
insert into ordertable values(22,'Shampoo',100,102);
insert into ordertable values(33,'Hand Cream',120,103),(44,'Soap',50,104),(55,'Face Cream',60,101);
select * from customer;
select * from ordertable;
select * from customer inner join ordertable on customer.cust_id=ordertable.cust_id;
select customer.cust_id,customer.cust_name,ordertable.order_id,ordertable.order_items,ordertable.order_amount from customer inner join ordertable on customer.cust_id=ordertable.cust_id;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Left  join*/
create table students(stud_id  int primary key, stud_name varchar(50));
create table Courses(c_id int,c_name varchar(50),stud_id int foreign key references Students(stud_id));
insert into students values(101,'Ajay'),(102,'Bodhini'),(103,'Charan'),(104,'Dinesh');
insert into students values(105,'Eshwar');
select * from students;
insert into Courses values(11,'Soft Skills',101),(22,'Java',101),(33,'DBMS',101);
insert into Courses values(11,'Soft Skills',102),(22,'Java',102),(33,'DBMS',102);
insert into Courses values(11,'Soft Skills',103),(22,'Java',103),(33,'DBMS',103);
insert into Courses values(11,'Soft Skills',104),(22,'Java',104),(33,'DBMS',104);
select * from Courses;
select students.stud_id,students.stud_name,Courses.c_id,Courses.c_name from students left join Courses on students.stud_id=Courses.stud_id;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Right Join*/
create table Courses1(c_id int primary key,c_name varchar(50),stud_id int);
insert into Courses1 values(11,'Soft Skills',101),(22,'Java',101),(33,'DBMS',101);
select * from courses1;
select students.stud_id,students.stud_name,Courses1.c_id,Courses1.c_name from students right join Courses1 on students.stud_id=Courses1.stud_id;
-----------------------------------------------------------------------------------------------------------------------------------
/*You are working for an online store that sells various products. The store has two main tables in their database: products and orders.

products Table:

Columns: product_id (unique identifier), product_name, category, price

orders Table:

Columns: order_id (unique identifier), product_id (references product_id in products), customer_name, order_date*/

create table products(product_id int primary key,product_name varchar(50),prod_category varchar(50),product_price money,created_at date);
create table orders(order_id int primary key,product_id int foreign key references Products(product_id),cust_name varchar(50),order_date date);

insert into products values(101,'Nivea','Beauty',120,getdate()),(102,'Vaseline','Beauty',100,GETDATE()),(103,'Lays','crunchies',45,GETDATE());
insert into products values(104,'Soch','Fashion',3500,GETDATE());
select * from products;

insert into orders values(11,101,'Bodhini',getdate()),(12,102,'Chetana',GETDATE()),(13,103,'Ajay',GETDATE());

select * from orders;

/*Task 1:  Find out which products have been ordered by customers. 
Retrieve the product name, category, price, customer name, and order date for all the products that have been ordered. 
Include only the records where there are matching orders for the products.*/

select products.product_name,products.prod_category,products.product_price,orders.cust_name,orders.order_date from products inner join  orders on products.product_id=orders.product_id;

/*Task 2: List all products, along with their product name, category, price, and any available order information. Retrieve all product records,
including those that have not been ordered yet. Include order information if available.*/

select products.product_id,products.product_name,products.prod_category,products.product_price,orders.order_id,orders.cust_name,orders.order_date from products left join orders on products.product_id=orders.product_id;

/*Task 3:  Display all orders made by customers, including those for products that are no longer available in the store. 
Retrieve the order ID, customer name, order date, product name, category, and price. Include all orders, and display product information if available.*/

select orders.order_id,orders.cust_name,orders.order_date,products.product_name,products.prod_category,products.product_price from products right join orders on products.product_id=orders.product_id;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*creating Tables*/
create table customer1(cust_id int primary key,store_id int ,name varchar(50),created_At date);
create table staff(staff_id int primary key,name varchar(50),email text,store_id int);
create table payment(pay_id int primary key,cust_id int foreign key references customer1(cust_id),staff_id int foreign key references Staff(staff_id),rental_id int not null unique,amount money,pay_date datetime);

/*inserting the data in customers*/
insert into customer1 values(101,11,'Ajay',getdate()),(102,11,'Bodhini',GETDATE());
insert into customer1 values(103,12,'Charan',GETDATE()),(104,13,'Dinesh',GETDATE());
select * from customer1;

/*inserting the data in staff*/
insert into staff values(20,'Manoj','Manoj@store.com',11);
insert into staff values(30,'Rahul','Rahul@store.com',11);
insert into staff values(35,'Ravali','Ravali@store.com',12);
insert into staff values(39,'Anand','Anand@store.com',13);
select * from staff;

/*Inserting the data in payments*/
insert into payment values(67,101,20,98,1000,GETDATE());
insert into payment values(45,102,30,59,7500,GETDATE());
insert into payment values(78,103,35,29,9000,GETDATE());
insert into payment values(49,104,39,69,6000,GETDATE());
select * from payment;

/*Retriving the customer information and payement_id and payment_date*/
select customer1.cust_id,customer1.store_id,customer1.name,payment.pay_id,payment.staff_id,payment.rental_id,payment.amount,payment.pay_date from customer1 left join payment on customer1.cust_id=payment.cust_id;

/*Retriving the staff information with payment_id and payment_date*/
select staff.staff_id,staff.name,staff.email,staff.store_id,payment.pay_id,payment.pay_date from staff left join payment on staff.staff_id=payment.staff_id;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* using Group by and Hvaing Clause */
create table tourist(id int identity(1,1) primary  key,Name varchar(200),country varchar(200));
insert into tourist values('Bodhini','Canada'),('Ajay','Canada'),('Charan','India'),('Dinesh','Italy');
insert into tourist values('Eshwar','India'),('Fathima','Italy'),('Gnaneswari','Europe');
insert into tourist values('Sahith','Canada');
select * from tourist;
select count(*) as noOfPeople from tourist where country='Canada';
select count(id) as CountOFCountry,country from tourist group by country
select count(country) as NoOfPeople,country from tourist group by country having count(country)>2;
------------------------------------------------------------------------------------------------------------------
/*Nested Query or Sub queries*/
create table supplier(id int Identity(1,1) primary key,sup_name varchar(100));
create table product(id int identity(1,1)primary key,product_name varchar(50),sup_id int foreign key references supplier(id),prod_price money);
insert into supplier values('Ajay'),('Bodhini'),('chetana');
select * from supplier;

insert into product values('Lotion',1,90),('Body soap',2,45),('Lays',3,60);
select * from product;

select sup_name from supplier where Exists(select product_name from product where product.id=supplier.id and prod_price>60);
------------------------------------------------------------------------------------------------------------------------------------------------
/*Copying the table into another table*/
create table BodhTour(toursist_id int primary key,toursist_name varchar(50),country varchar(50));
insert into BodhTour values(101,'Ajay','Canada'),(102,'Bodhini','Canada'),(103,'Charan','France');
insert into BodhTour values(104,'Sahith','Italy');
insert into BodhTour values(105,'Ravuri','Europe');
select * from BodhTour;

SELECT * INTO AjayTour FROM BodhTour;
select * from AjayTour;

insert into AjayTour(toursist_id,toursist_name,country) select toursist_id,toursist_name,country from BodhTour where toursist_id=104;
insert into AjayTour(toursist_id,toursist_name,country) select toursist_id,toursist_name,country from BodhTour where toursist_id=105;
--------------------------------------------------------------------------------------------------------------------------------------------
/*Using "Case" to validate the conditions*/
create table person(id int primary key,p_name varchar(50))
insert into person values(101,'Bodhini'),(102,'Chetana'),(103,'Mallika'),(104,'Akshara');
select * from person;
select p_name,Case when p_name='Bodhini' Then 'It is me' when p_name='Chetana' then 'It is my sister'else 'dont know' End AS result from person;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Assignments*/

/*Create two tables, Customer and Order, with appropriate columns. Perform an inner join to retrieve the following details for all ordered products:

Product name
Category
Price
Customer name
Order date*/

create table Customer2(cust_id int primary key,cust_name varchar(50),created_At datetime);
create table Orderdtable(order_id int primary key,product_name varchar(50),prod_category varchar(50),prod_price money,cust_id int foreign key references Customer2(cust_id),order_date datetime);

insert into customer2 values(101,'Bodhini',getdate()),(102,'Ajay',GETDATE()),(103,'Charan',GETDATE());
insert into Customer2 values(104,'Dinesh',GETDATE());
select * from customer2;


insert into Orderdtable values(11,'Lotion','Beauty',100,101,GETDATE()),(12,'Lays','crunchies',60,102,GETDATE()),(13,'SOCH','Fashion',4500,103,GETDATE());
select * from Orderdtable;

select Orderdtable.product_name,Orderdtable.prod_category,Orderdtable.prod_price,Customer2.cust_name,Orderdtable.order_date from Customer2 inner join Orderdtable on Customer2.cust_id=Orderdtable.cust_id;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Task2*/

/*Display All Products with Order Information

Create a table to store product  information and order  information. Retrieve all product records along with:

Product name
Category
Price
Order information (if available)*/
create table pro(prod_id int primary key,product_name varchar(50),prod_category varchar(50),prod_price money,created_at datetime);
insert into pro values(11,'Biscuits','Cookies',80,GETDATE()),(12,'Chocolates','Candies',100,GETDATE())
insert into pro values(13,'Nivea','Beauty',100,GETDATE());
select * from pro;

create table Orderdtables(order_id int primary key,prod_id int foreign key references pro(prod_id),order_date datetime);
insert into Orderdtables values(101,11,GETDATE()),(102,12,GETDATE());
select * from Orderdtables;
select pro.product_name,pro.prod_category,pro.prod_price,Orderdtables.order_date from pro left join Orderdtables on pro.prod_id=Orderdtables.prod_id;
