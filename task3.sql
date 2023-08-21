/*Creating employee table*/
create table employee8(emp_id int not null primary key,emp_name varchar(50),age smallint check(age>18 and age<60),createdAt date,company_name varchar(20) default 'prolifics');

/*inserting the data*/
insert into employee8 values(101,'Ajay',23,GETDATE(),'Wipro');

/*fetching Default values*/
insert into employee8  values(102,'Bodhini',21,GETDATE(),default);
insert into employee8(emp_id,emp_name,age,createdAt) values(103,'Charan',45,GETDATE());

/* Error Occurs since age is not greater than 18*/
insert into employee8 values(104,'Dinesh',16,GETDATE(),'TCS');

/*Creating the salary table*/
create table salary8(sal_id int not null primary key,salary_amount money check(salary_amount>50000) default 75000,createdAt date,E_id int foreign key references employee8(emp_id));

/*inserting the values*/
insert into salary8 values(01,51000,GETDATE(),101);
insert into salary8 values(02,60000,GETDATE(),102);

/*fetching default value*/
insert into salary8(sal_id,createdAt,E_id) values(03,GETDATE(),103);


select * from salary8;
select * from employee8;