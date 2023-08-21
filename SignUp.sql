/*Altering the Tables*/
ALTER TABLE SignUp ADD dateofcreation date;

/*Inserting the values*/
insert into SignUp values('venu','Venu@321','18-Aug-2023');

/*Retrieving the values*/
 select * from SignUp;

 /*Updating*/
update SignUp set dateofcreation='18-Aug-2023' where username='Bodh@gmail.com';

/*Deleting the table*/
delete from SignUp where username='Venu';  