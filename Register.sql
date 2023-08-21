/*Creating table*/
create table Register(username text,password varchar(15));

/*Altering the table*/
alter table register add Name text;

/*Inserting nthe values*/
insert into Register values('Bodhini','Bodhini@678','Goli'),('Ajay','Ajay@900','Ajju'),('Sahith','Sah@345','SAH');

/*Adding two Columns*/
alter table register add Age smallint,Gender char;

/*Changing the Datatype*/
ALTER TABLE Register ALTER COLUMN Age int;


/*Dropping the specified Column*/
alter table register drop column Gender;

/*Retriving the details*/
select * from register;



