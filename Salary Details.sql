/* creating the Employee table*/
create table EmployeeDetails(emp_id int not null primary key,emp_name text,Mobile bigint,Hours_worked int,position text);


/* inserting the data in Employee table*/
insert into EmployeeDetails values(101,'Bodhini',95735783957,9,'Trainee Software Engineer');
insert into EmployeeDetails values(102,'Ajay',956848646857,9,'HR');
insert into EmployeeDetails values(103,'Sahith',9491239986,8,'Resource Manager');
insert into EmployeeDetails values(104,'Rupali',7657365724,8,'Learning & development');
insert into EmployeeDetails values(105,'Venu',9867867333,7,'Testing');

/*Creating the Salary Table*/
create table Salary(Salary_id int not null primary key,AccountNumber bigint,Salary_amount money, BankName text, CreditedAt date);

/* Adding the  Foreign key using Alter*/
Alter table Salary add e_id int foreign key references EmployeeDetails(emp_id);

/*Inserting the data*/
insert into Salary values(001,94388734,30000.0,'Axis',SYSDATETIMEOFFSET(),101);
insert into Salary values(002,785487747,40000.0,'Hdfc',SYSDATETIMEOFFSET(),102);
insert into Salary values(03,57395783,35000.0,'ICICI',SYSDATETIMEOFFSET(),103);
insert into Salary values(04,57395783,5000.0,'union Bank',SYSDATETIMEOFFSET(),103);
insert into Salary values(05,985789437,30000.0,'Axis',SYSDATETIME(),104);
insert into Salary values(06,876586,15000.0,'Indian Bank',SYSDATETIME(),104);
insert into Salary values(07,43524,20000.0,'Punjab Bank',SYSDATETIME(),105);
insert into Salary values(08,34244,12000.0,'Bank of baroda',SYSDATETIME(),105);


/*Retriving the data*/
select * from Salary;
Select * from EmployeeDetails;


