
/*Creating the database*/
create database registration;

/*BackingUp the Data*/
backup database registration to disk='C:\Backup\registration.BAK';

/*Restoring the Data*/
Restore database registration from disk='C:\Backup\registration.BAK';


/*Creating the Table*/
create table registration(id int primary key,name text,age int);

/*Inserting the data*/
insert into registration values(1,'Ajay',23),(2,'Bodhini',21),(3,'AB',13);

/*Deleting the table*/
delete table registraion where id='1';

/*Truncating the table*/
truncate table registration


/*Retriving the data*/
select * from registration;

