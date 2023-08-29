---------------------------August 29------------------------------
create database aug29
/* using of Rollback*/
create table sample1
(id int identity(1,1) primary key,
name varchar(20))

truncate table sample1;
select * from sample1
/*Rollback will not work because we are not using begin transaction*/
insert into sample1 values('Bodhini');

/*By using of Begin transaction we can roll back the data*/
begin transaction
insert into sample1 values('Ajay');
/*Rollback means deletes the data*/
rollback;

/*Commit saves the data*/
commit;
----------------------------------------------------------------------------
create table sample2(
id int identity(1,1) primary key,
name varchar(50))

select * from sample2

begin transaction
insert into sample2 values('Bodhini')
save transaction s1
insert into sample2 values('Ajay')
save transaction s2
insert into sample2 values('Nitesh');
save transaction s3

/*Rollback transaction till s2*/
rollback transaction s2;
 -----------------------------------------------------------------------------------------------------------
 CREATE TABLE EMPLOYEE1
(
EMP_ID INT IDENTITY,
EMP_NAME VARCHAR(30),
EMP_SAL DECIMAL(10,2)
)

 

INSERT INTO EMPLOYEE1 VALUES('NITESH',60000.00),('RAVI',40000.00),('LAKSHMI',30000.00),('KARTHIK',50000.00);

 select * from EMPLOYEE1;

create table  employee_test_audit(
	EMP_ID INT,
	EMP_NAME VARCHAR(30),
	EMP_SAL DECIMAL(10,2),
	AUDIT_ACTION varchar(50),
	AUDIT_TIMESTAMP date
)


ALTER TRIGGER TRGAFTERINSERT3 ON [DBO].[EMPLOYEE1]
FOR INSERT
AS
BEGIN
DECLARE @EMPID INT;
DECLARE @EMPNAME VARCHAR(100);
DECLARE @EMPSAL DECIMAL(10,2);
DECLARE @AUDIT_ACTION VARCHAR(100);

 

SELECT @EMPID=I.EMP_ID FROM INSERTED I;
SELECT @EMPNAME=I.EMP_NAME FROM INSERTED I;
SELECT @EMPSAL=I.EMP_SAL FROM INSERTED I;
SET @AUDIT_ACTION='INSERTED RECORD --AFTER INSERT TRIGGER.';

 

INSERT INTO EMPLOYEE_TEST_AUDIT (EMP_NAME,EMP_SAL,AUDIT_ACTION,AUDIT_TIMESTAMP)
VALUES(@EMPNAME,@EMPSAL,@AUDIT_ACTION,GETDATE());

 
 
PRINT 'AFTER INSERT TRIGGER FIRED.'
END

select * from EMPLOYEE_TEST_AUDIT
DELETE FROM EMPLOYEE_TEST_AUDIT;
insert into EMPLOYEE1 values('GOPAADNSJKF',4121);
 
---------------------------------------------------------------------------------------------
/* ------ Triggers----------*/
/*----------------------------------------------------Inserting using Triggers--------------------------------*/
create table one(
name1 varchar(40)
)
create table one_copy(
name2 varchar(40)
)

 
create trigger tgInsert1 on [dbo].[one]
for insert
as
declare @name varchar(40);
select @name=i.name1 from inserted i;
insert into one_copy values(@name);

 

insert into one values('BODHINI');
insert into one values('anu');
INSERT INTO ONE VALUES('CHETANA')


select * from one;
select * from one_copy;
--------------------------------------------------------------------------------------------------------------------------------
/* ------------------------------------------Inserting and deleting using triggers------------------------------------*/
create table one1(
name1 varchar(40)
)
create table one_copy1(
name2 varchar(40)
)


select * from one1;
select * from one_copy1;
/*----------------------------------------------Inserting---------------------------------------------*/
create trigger tgInsert4 on [dbo].[one1]
for insert
as
declare @name varchar(40);
select @name=i.name1 from inserted i;

insert into one_copy1 values(@name);
insert into one1 values('Bodhini')
insert into one1 values('Ajay');

/*-----------------------------------------Deleting----------------------------------------*/
create trigger tgDelete3 on [dbo].[one1]
for delete
as
declare @name varchar(40);
select @name=d.name1 from deleted d;
delete from one_copy1 where name2=@name;

delete from one1 where name1='ajay';
select * from one1;
select * from one_copy1;

/*--------------------------------------------------------Updating ------------------------------------------------------------------*/
create trigger tgupdate3 on [dbo].[one1]
for update
as
declare @name varchar(40);
select @name=d.name1 from inserted d;
update one_copy1 set name2=@name where name2='Bodhini';
go

update one1 set name1='gopal' where name1='Chetan';

---------------------------------------------------------------------------------------------------------------------------------------------
-----Monthly salary table
create table monthlysalary(
emp_id int,
salary_amount int
)

 

select * from monthlysalary

 

--Create table for reporttable

 

create table reportsalary(
emp_id int,
totalAmountpaid int
)

 

select * from reportsalary

 

--Trigger to udate the salary
create trigger Totalsalaryupdate on dbo.monthlysalary
for insert
as 
begin
-- Take the emp id and amount which inserted into monthlysalary table
    Declare @emp_id int;
    Declare @amount money;
    Declare @total_amount money;

 

    --Take the value from inserted memory table and give to variable
     Select @emp_id = emp_id from inserted;
     Select @amount = salary_amount from inserted;

 

     -- Find if salary is present or not in report table so that we can know two things
     --1 . IF that emp id record exist or not
     --2. IF record exist take this existing salary

 

      Select @total_amount = totalAmountpaid from reportsalary where emp_id = @emp_id;  

      If(@total_amount is not null)
        BEGIN
            SET @total_amount = @amount + @total_amount;
            Update reportsalary set totalAmountpaid = @total_amount where emp_id = @emp_id;
            PRINT 'Updated';
        END
      else
        BEGIN
            Insert into reportsalary values(@emp_id, @amount);
        PRINT 'Inserted';
    END
end

insert into monthlysalary values(101,90000);
insert into monthlysalary values(101,90000);
select * from monthlysalary;
select * from reportsalary;