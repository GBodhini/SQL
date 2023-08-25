--------------tasks--------------

--creating customer table--
create table customers(customer_id int primary key,cust_name varchar(40),createdAt date);

--creating products table--
create table products(product_id int primary key,product_name varchar(40),category varchar(40),price money);

--creating orders table--
create table order1(order_id int primary key,customer_id int foreign key references customers(customer_id) ,product_id int foreign key references products(product_id),order_date date);
insert into customers values(101,'deepika',GETDATE()),(102,'vennela',GETDATE()),(103,'ananshi',GETDATE()),(104,'riya',GETDATE());
insert into products VALUES(11,'soaps','Body',100 ),(22,'handwash','Body',200);
insert into products values(33,'Induction stove','electrical',300),(55,'Electrical cooker','electrical',500);
insert into products values(44,'chocolates','choco',50);

insert into order1 values(201,101,11,GETDATE()),(202,102,22,GETDATE()),(203,103,33,GETDATE()),(204,104,55,GETDATE());

--creating view--
--insering is not possible in view--
--it is a virtual table--

create view test as
select order1.order_id,customers.cust_name,products.product_name from (order1 inner join products on order1.product_id=products.product_id) inner join customers on order1.customer_id =customers.customer_id;

select * from test;

--creating stored procedure--
--insertion can be done using stored procedure--
create table book(bookid int,bookName varchar(30),author varchar(20));


--inserting into using stored procedure--
create procedure sprocedures as 
insert into book values(1,'c++','john');
exec sprocedures;

--for selecting---
create procedure sproceduress as 
select * from book
exec sproceduress;

--create variable--
declare @varname varchar(30);

--set the value--
set @varname='custid'

--charindex func--
select CHARINDEX('c',@varname) as resultString;
select CHARINDEX('u',@varname) as resultString;
select CHARINDEX('s',@varname) as resultString;


--aggregate functions--
--concat--
select CONCAT('Deepika','Kara');
--lower--
select LOWER('DEEPIKA WORKING AS');
--trim--
select TRIM('                   deepika !!            ') as trimmedString;
--replace--
select REPLACE('good','g','h');
--length--
select LEN('deepika');
--numeric--
--floor--
select  FLOOR(25.99) as floorvalue;
--ceiling--
select CEILING(25.99) as ceilvalue;
--square--
select SQRT(64);
--Datediff--
SELECT DATEDIFF(year, '2017/08/25', '2011/08/25') AS DateDiff;
SELECT DATEDIFF(day, '2017/08/25', '2011/08/25') AS DateDiff;
--Date format--
--datename--
select DATENAME(year,'2023/05/12') as datepart;
--getdays--
select DAY('2023/05/12') as dayOfMonth;
--get date--
SELECT FORMAT (getdate(), 'hh:mm:ss') as time;
--other date functions--
SELECT CURRENT_TIMESTAMP;
SELECT DATEADD(year, 1, '2017/08/25') AS DateAdd;
SELECT DATEFROMPARTS(2018, 10, 31) AS DateFromParts;
SELECT GETDATE();
 

----------------------------------------------------------------------------------------------------------------
--primary key --index table--
Create Table Employees27

(
Id int primary key identity,

[Name] nvarchar(50),
Email nvarchar(50),
Department nvarchar(50)
)
 

Go
SET NOCOUNT ON
Declare @counter int = 1
While(@counter <= 1000000)
Begin
Declare @Name nvarchar(50) = 'ABC ' + RTRIM(@counter)
Declare @Email nvarchar(50) = 'abc' + RTRIM(@counter) + '@pragimtech.com'
Declare @Dept nvarchar(10) = 'Dept ' + RTRIM(@counter)
Insert into Employees27 values (@Name, @Email, @Dept)
Set @counter = @counter +1
If(@Counter%100000 = 0)
Print RTRIM(@Counter) + ' rows inserted'
End


select * from Employees27 where id=12;

/*Casting the float into int*/
SELECT CAST(25.65 AS int);

SELECT CAST(65.99 AS int);

select CAST('hdgfhdgfhsdgfhdgfgfgf' AS varchar(5));

/*Casting the text into varchar*/
 create table example(emp_id int primary key,emp_name text);
 insert into example values(101,'Bodhini'),(102,'Ajay');
 select * from example;

select emp_id,CAST(emp_name AS varchar(50)) as employee_name from example;
select CAST(emp_name as varchar(10)) as newname from example;

/*creating marks table to validate whether he/she is passed*/
create table marks(id int Identity(1,1) primary key,marks int)
insert into marks values(90),(80),(40);
select * from marks;
select id,IIF(marks>=80,'pass','fail') from marks;


 select ISNUMERIC(4567);
 select ISNUMERIC('8397');
/*Checking for the whole column*/
 select ISNUMERIC(marks) from marks;

 /*Adding the numbers and columns*/
create table student(id int identity(1,1),stud_name varchar(50),his_marks int,chem_marks int);

create function getsum(@FirstNum int,@SecondNum int)
Returns varchar(50) as
begin
return @FirstNum+@SecondNum
End

insert into student values('Bodhini',90,90),('Ajay',80,80);
select stud_name,dbo.getsum(his_marks,chem_marks)as result from student;

/*Multiplying the numbers using alter*/
Alter Function getsum(@a int , @b int) 
Returns Int As
Begin
Return @a * @b
End

Select dbo.getsum(5,3) as Multiplied;
drop function dbo.getsum;

-------------------------------------------------------------------------------------------------------------
/*-------Assignments-----------------------*/
/

/*You are given a database schema with the following tables:

students table:
Columns: student_id, student_name
courses table:
Columns: course_id, course_name
enrollments table:
Columns: enrollment_id, student_id, course_id, grade

Write an SQL function named calculate_gpa that takes a student_id as input and calculates the Grade Point Average (GPA) for that student. The GPA is calculated as follows:

Each course has a grade associated with it (e.g., 'A', 'B', 'C', 'D', 'F').
The GPA is calculated on a 4.0 scale: 'A' is 4.0, 'B' is 3.0, 'C' is 2.0, 'D' is 1.0, and 'F' is 0.0.
The GPA is calculated by taking the average of the course GPAs, weighted by the number of credits each course carries. All courses are assumed to have the same number of credits.

You need to implement the following steps in your function:

Calculate the total GPA points earned by the student.
Calculate the total credits earned by the student.
Calculate the GPA by dividing the total GPA points by the total credits.

Your function should return the GPA as a decimal value rounded to two decimal places
*/
create table stud(stud_id int primary key,stud_name varchar(50));
insert into stud values(101,'Ajay'),(102,'Bodhini');
insert into stud values(103,'Sahith');
insert into stud values(104,'Ravuri');
select * from stud;
create table courses(course_id int primary key,course_name varchar(50),stud_id int foreign key references stud(stud_id));
insert into courses values(11,'DBMS',101),(22,'Java',102)
insert into courses values(13,'Soft Skills',101),(14,'SQL',103);
insert into courses values(15,'P',104);
select * from courses;
create table enrollments(enroll_id int primary key,stud_id int foreign key references stud(stud_id),course_id int foreign key references courses(course_id),grade varchar(50));
drop table enrollments
insert into enrollments values(120,101,11,'A'),(130,102,22,'B');
insert into enrollments values(140,101,13,'C'),(14,103,14,'D');
insert into enrollments values(142,101,22,'B');
select * from enrollments;


CREATE FUNCTION calculate_gpa(@stud_id INT) RETURNS DECIMAL(4, 2)

BEGIN

    DECLARE @total_points DECIMAL(10, 2);

    DECLARE @total_credits INT;

    DECLARE @gpa DECIMAL(4, 2);

 

    SELECT @total_points = COALESCE(SUM(

        CASE grade

            WHEN 'A' THEN 4.0

            WHEN 'B' THEN 3.0

            WHEN 'C' THEN 2.0

            WHEN 'D' THEN 1.0

            WHEN 'F' THEN 0.0

            ELSE 0.0

        END), 0)

    FROM enrollments

    WHERE stud_id = @stud_id;

 

    SELECT @total_credits = COUNT(*)

    FROM enrollments

    WHERE stud_id = @stud_id;

 

    IF @total_credits > 0

        SET @gpa = @total_points / @total_credits;

    ELSE

        SET @gpa = 0.0;

 

    RETURN @gpa;

END;

select stud_id,stud_name,dbo.calculate_gpa(stud_id) as result from stud;