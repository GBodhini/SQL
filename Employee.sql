create table employee(id int primary key,name varchar(50));

create table account(id int primary key,E_id int foreign key references employee(id));

insert into employee values(1,'Bodhini');

insert into account values(1,1);

select * from employee;

select * from account;

insert into employee values(3,'Ajay');

insert into account values(4,3);