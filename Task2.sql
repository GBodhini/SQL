/*Creating the tables*/
create table employee2(emp_id int not null primary key,emp_name varchar(50),age smallint check(age>=18 and age<=60),CreatedAt date);

/*inserting the data*/
insert into employee2 values(101,'Ajay',25,GETDATE()),(102,'Bodhini',21,GETDATE());

/*Retriving the data*/
select * from employee2;

/*Error Occurs*/
insert into employee2 values(103,'Charan',65,GETDATE());

-----------------------------------------------------------------------------------------------------------------------------------------------------------
/*creating the table*/
create table employee3(emp_id int not null primary key,emp_name varchar(50),salary money,CreatedAt date);


/*Check constraint using alter*/
alter table employee3 add constraint amount  check(salary>50000);

/*inserting the values*/
insert into employee3 values(101,'Ajay',51000,GETDATE());
insert into employee3 values(102,'Bodhini',45000,GETDATE());

/*Fetching the data*/
select * from employee3;



---------------------------------------------------------------------------------------------------------------------------
/*Creating the Person table*/
create table person(p_id int not null primary key,p_name text,age smallint,company_name varchar(50) default 'prolifics',createdAt date);



/*Inserting the data*/
insert into  person values(101,'Bodhini',21,'Google',GETDATE());
insert into  person values(104,'Dinesh',21,'Wipro',GETDATE());
insert into  person values(102,'Ajay',23,default,GETDATE());
insert into person(p_id,p_name,age,createdAt) values(103,'Chetana',26,GETDATE());
/*fetching the data*/
select * from  person;

/*creating the table*/
create table employee4(emp_id int not null primary key,emp_name varchar(50),age smallint,createdAt date,salary float check(salary>50000) default 70000);


/*Inserting the data*/
insert into employee4 values(101,'Bodhini',21,GETDATE(),51000);

insert into employee4(emp_id,emp_name,age,createdAt) values(102,'Ajay',23,GETDATE());

/*Error Occurs*/
insert into employee4 values(103,'Charan',26,GETDATE(),35000);



/*Fetching the data*/
select * from employee4;







