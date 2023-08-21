/*Creating the table*/
create table Registration1(User_name TEXT,Password  VARCHAR(20),Aadhar_NO BIGINT NOT NULL UNIQUE);

/*Adding the Columns with unique Constraint*/
ALTER TABLE Registration1 ADD Employee_id INT NOT NULL UNIQUE;

/*Altering Columns*/
ALTER TABLE Registration1 ALTER COLUMN Aadhar_NO BIGINT;

/*Inserting the values*/
insert into Registration1 values('Bodhini','Bodh@321',6375652526526726,1),('Ajay','Ajay@987',95635655658676856,2);

/*Retriving th details*/
select * from registration1;