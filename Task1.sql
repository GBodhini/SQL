/*Creating the employee tables*/
create table employee9(emp_id int not null,emp_code varchar(10) not null unique,emp_name varchar(50) not null,dateOfcreation date,primary key(emp_id,emp_name));

/*inserting the data*/
insert into employee9 values(101,'AR1','Ajay',SYSDATETIMEOFFSET()),(102,'BG2','Bodhini',SYSDATETIMEOFFSET()),(103,'CR3','Chetana',SYSDATETIMEOFFSET());

insert into employee9 values(104,'SE4','Sohel',SYSDATETIME());

insert into employee9 values(105,'RH5','Rahul',SYSDATETIMEOFFSET());
/*creating salary table*/
create table salary(salary_id INT PRIMARY KEY,sal_Amount DECIMAL(10,2) NOT NULL,BankName text,AccountNo bigint,E_id int,E_name varchar(50),constraint fk_employee_salary  foreign key(E_id,E_name) references employee9(emp_id,emp_name),dateOfCreation date);


/*Inserting the data*/
insert into salary values(01,45000,'Axis',635863,101,'Ajay',SYSDATETIMEOFFSET()),(02,40000,'ICICI',8365356,102,'Bodhini',SYSDATETIMEOFFSET()),(03,50000,'Union',653465,103,'Chetana',SYSDATETIMEOFFSET());

insert into salary values(04,60000,'HDFC',68436,104,'Sohel',SYSDATETIMEOFFSET());

/*Error Occurs*/
insert into salary values(05,650000,'Union',8365836,105,'Mohith',SYSDATETIMEOFFSET()); ---emp_name is not unique--

/*Retriving the data*/
select * from employee;
select * from salary;


/*Alter table salary drop constraint  fk_employee_salary*/