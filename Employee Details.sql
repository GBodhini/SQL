/*Creating the database*/
create database EmployeeDetails;

/*Creating the employees table*/
create table employee(emp_id int not null primary key,emp_name text,position text, working_hours int,leave int);

/*adding dateOfCreation*/
alter table employee add dateOfCreation date;

/*Inserting the data*/
insert into employee values(101,'Ajay','Resource Manager',9,0,SYSDATETIMEOFFSET()),(102,'Bodhini','Trainee',9,1,SYSDATETIMEOFFSET()),(103,'Swapna','HR',8,1,SYSDATETIMEOFFSET());

/*Retriving the data*/
select * from employee;

/*Creating the salary Table*/
create table salary(sal_id int not null primary key,sal_amount money,Account_no bigint,Bank_name text,E_id int foreign key references employee(emp_id));

/*adding dateOfCreation*/
alter table salary add dateOfCreation date;

/*Inserting the data*/
insert into salary values(01,50000,983542972,'Axis',101,SYSDATETIMEOFFSET()),(02,'40000',8573676623,'ICICI',102,SYSDATETIMEOFFSET()),(03,'45000',578638365,'Kotak',103,SYSDATETIMEOFFSET());

/*Retriving the data*/
select * from salary;

/*creating attendence table*/
create table attendence (employee_id int foreign key references employee(emp_id),attendence_percentage decimal(10,2),salary_id int foreign key references salary(sal_id));

/*inserting the data*/
insert into attendence values(101,90.9,01),(102,91.9,02),(103,80.7,03);

/*Retriving the data*/
select * from employee;
select * from salary;
select * from attendence;
