----------August 28----------------------------------------------------------------
create database aug28;
--------------------------------------------- Adding 3 values------------------------------------------------------
/*Custimized logic*/
create function getsum(@FN int,@SN int,@Month int) returns 
int as
begin
return @FN+@SN+@Month end

select dbo.getsum(5,8,22)

-------------------------------------------------------------------------------------------------------------------
create table  car(car_id int primary key,car_name varchar(50),Myear varchar(50));

insert into car values(101,'Audi','2020'),(102,'benz','2021'),(103,'Ferrari','2020'),(104,'Rolls royce','2023');
select * from car;

create function getcar(@Myear varchar(50)) returns table 
as return select * from car where Myear=@Myear;

select * from getcar('2020');
select * from getcar('2023');
select * from getcar('2024');
-----------------------------------------------------------------------------------------------------------------------------
/*Joining two tables using Functions*/
create table firstbatch(f_id int,f_name varchar(50),passedyear varchar(10));
create table Secondbatch(s_id int,s_name varchar(50),passedyear varchar(10));
insert into firstbatch values(101,'Bodhini','2023'),(102,'Ajay','2021'),(103,'Sahith','2022');
insert into Secondbatch values(11,'Akash','2017'),(12,'Bhuvan','2018'),(13,'Chetak','2016');
select * from firstbatch;
select * from Secondbatch;
create function FS1()
returns @new TABLE (
        nid int,
        nname VARCHAR(50),
       npassedyear varchar(10)
    )
AS
BEGIN
    INSERT INTO @new
    SELECT 
        f_id, 
        f_name, 
        passedyear
    FROM
        firstbatch;

    INSERT INTO @new
    SELECT 
        s_id, 
        s_name, 
        passedyear
    FROM
       Secondbatch
    RETURN;
END;
select * from FS1();


create function FS2()
returns @new TABLE (
        nid int,
        nname VARCHAR(50),
       npassedyear varchar(10)
    ) AS
BEGIN
    INSERT INTO @new
    SELECT *
    FROM
        firstbatch;
		
    INSERT INTO @new
    SELECT 
      *
    FROM
       Secondbatch
    RETURN;
END;
select * from FS2();
-------------------------------------------------------------------------------------------------------------------------------
/*using Group by clause and add the amount of customers that they paid*/

create table customers(cust_id int primary key,cust_name varchar(50));
create table orders(ord_id int,ord_name varchar(50),cust_id int foreign key references customers(cust_id),amount money);
insert into customers values(101,'Bodhini'),(102,'Ajay');
select * from customers;
insert into orders values(11,'Handwash',101,80),(12,'Sanitizer',102,100);
insert into orders values(13,'Soap',102,35);
select * from orders;

/*group by using cust_name*/
select customers.cust_name,sum(orders.amount) from customers inner join orders on customers.cust_id=orders.cust_id group by cust_name

/*group by using cust_id*/
select customers.cust_id,sum(orders.amount) from customers inner join orders on customers.cust_id=orders.cust_id group by customers.cust_id

/*Breaking into smaller parts*/
/*With CTE*/
with customersTotalAmount  as(select cust_id,sum(amount) as Totalamount from orders group by cust_id)
select customers.cust_name,CustomersTotalamount.Totalamount from customers inner join customersTotalamount on customers.cust_id=customersTotalAmount.cust_id
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Using of ROW_Number() which gives us unique values*/
create table batch1(b_id int primary key ,b_name varchar(50),batchno int);

insert into batch1 values(11,'Bodhini',1),(12,'Ajay',1),(13,'sahith',1);
insert into batch1 values(14,'Ram',2),(15,'Akash',2);
select  * from batch1;
select b_name,batchno,ROW_NUMBER() over(partition by batchno order by batchno) from batch1;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*using of Rank number and Dense Number */
select b_name,batchno,ROW_NUMBER() over(partition by batchno order by batchno)as RowNumber,RANK() over(order by batchno) as RankNumber,DENSE_RANK() over(order by batchno) as DenseNumber from batch1;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*printing 10 numbers using while loop*/
declare @counter int;
set @counter=1
while(@counter<10)
begin 
print @counter
if(@counter>6)
begin 
 break
 end

set @counter=@counter+1
end
-------------------------------------------------------------------------------------------------------
/*Using of while loop*/
create table manyentries(
id int Identity(1,1)  primary key,
name varchar(200));
select * from manyentries;


Declare @counter int;
set @counter=1
while(@counter<=500)
BEGIN
    insert into manyentries values('Bodhini')
    set @counter=@counter+1
END
-----------------------------------------------------------------------------------------------------------
------------------------------task-----------------------------------------------------------------------------------
create table stddetails(id int primary key,name varchar(50),marks int,status varchar(50));
insert into stddetails(id,name,marks) values(101,'Bodhini',50),(102,'Ajay',70),(103,'Chetana',90);
insert into stddetails(id,name,marks) values(104,'Sahithi',40);
select * from stddetails;
SELECT ID,NAME,MARKS, IIF (MARKS>60,'PASS','FAIL') AS STATUS FROM stddetails;
(OR)
SELECT id,name,marks,
CASE
    WHEN marks <= 50.00 THEN 'FAIL'
    WHEN marks > 50.00 THEN 'PASS'
    ELSE 'ABSENT'
END AS RESULT
FROM stddetails;
------------------------------------------------------------------------------

declare @c int
declare @marks int
declare @total_rows int
set @c=101
select @total_rows = count(id) from stddetails;

while(@c<=@total_rows+100)
begin
print @c
select @marks = marks from stddetails where id=@c;
print @marks

if(@marks>50)

update stddetails set status='pass' where id=@c;
else
update stddetails set status='fail' where id=@c;
set @c=@c+1
end
select * from stddetails
-------------------------------------------------------------------------------------------------------------------------
/* Using Continue*/
declare @counter int;
set @counter=0;
while(@counter<15)
begin
set @counter=@counter+1
if @counter>6 and @counter<10 continue;
print @counter
end
------------------------------------------------------------------------------------------------------------------------------------------------------------

create table stdetails3
(
    id int identity(1,1),
    Name varchar(50),
    Marks1 int,
    status varchar(10)
);

 
insert into stdetails3(Name,Marks1) values('Monika',90),('Gopal',50),('Nites',70),
('Meena',60),('Prabakar',45),('Mitesh',35),('Magie',80),('Gayi',50),('Naresh',70)
,('Chaitu',100),('Maha',45),('Bhavani',35);

 SELECT id,Name,Marks1, IIF (Marks1>35,'PASS','FAIL') AS STATUS FROM stdetails3;

declare @cd int
declare @marks1 decimal
declare @total_rows1 int 
set @cd=1
select @total_rows1 = count(id) from stdetails3; 
while(@cd<=10)
begin
select @marks1=Marks1 from stdetails3 where id=@cd; 
if(@marks1>35) update stdetails3 set status='pass' where id=@cd; 
else update stdetails3 set status='fail' where id=@cd;
set @cd=@cd+1 
end
select * from stdetails3