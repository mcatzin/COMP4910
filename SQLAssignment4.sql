CREATE DATABASE  IF NOT EXISTS  myData;
use myData;

CREATE TABLE IF NOT EXISTS Clients (
		ClientNo INT NOT NULL,
        First_name VARCHAR(45) NULL,
        Last_Name VARCHAR(45) NULL);
        
INSERT INTO Clients
VALUES (16, 'Fohn', 'Havis'), (12, 'Rohn', 'Wavis'), (16,
'Pohn','Qavis'), (14, 'Gohn','Tavis');

CREATE VIEW ourView AS
			SELECT *
            FROM clients
				WHERE ClientNo =12;
                
select * from clients;
select * from ourView;
SET SQL_SAFE_UPDATES = 0;

# Case 1: Insert a new row in the base table that satisfies the view's condition.
Insert into Clients values (12, 'Dillo', 'Tanks');
# Case 2: Insert a new row in the table that does not satisfy the view's condition
insert into Clients values (18, 'Fillo', 'Uanks');


update Clients
set ClientNo = 15 where ClientNo = 12;
# Case 4: Update the rows of the base table that do not satisfy the view’s condition.
update Clients
set ClientNo = 12 where ClientNo = 14;

# Case 5: Delete the rows of the base table that satisfy the view’s condition.
delete from Clients where ClientNo = 12;

drop view ourView;
Drop table Clients;
#Then recreate the view and table again following steps 1-4.
# step 1
CREATE TABLE IF NOT EXISTS Clients (
		ClientNo INT NOT NULL,
        First_name VARCHAR(45) NULL,
        Last_Name VARCHAR(45) NULL);
 # step 2       
INSERT INTO Clients
VALUES (16, 'Fohn', 'Havis'), (12, 'Rohn', 'Wavis'), (16,
'Pohn','Qavis'), (14, 'Gohn','Tavis');

#step 3
CREATE VIEW ourView AS
			SELECT *
            FROM Clients
				WHERE ClientNo =12;
# step 4                
select *from ourView;
select * from Clients;
# Case 1: Insert a new row in the view that satisfies the view's condition.
insert into ourView values (12,'Dillo', 'Tanks');
#Case 2: Insert a new row in the view that does not satisfy the view's condition
insert into ourView values (18,'Fillo', 'Uanks');
# Case 3: Update the rows of the view that satisfy the view’s condition.
update ourView
set ClientNo = 15 where ClientNo = 12;
# Case 4: Update the rows of the view that do not satisfy the view’s condition.
update Clients
set ClientNo = 12 where ClientNo = 14;
# Case 5: Delete the rows from the view that satisfy the view’s condition
delete from ourView where ClientNo = 12;
# Case 6: Delete the rows from the view that do not satisfy the view’s condition.
delete from ourView where ClientNo = 14;

#Problem C: Repeat problem B after adding WITH CHECK OPTION as below.

create view ourView as
select *
From Clients
where ClientNo = 12 WITH CHECK OPTION;

# Case 1: Drop a column of the table that is accessed by the view.
ALTER TABLE Clients
Drop First_name;

#Case 2: Add a new column to the base Table and then display the contents of the view. 
#What could be the reason for the rejection in viewing the display? 
#Can you prevent this by specifying the column names for the view instead of taking all columns?
ALTER TABLE Clients
add myCol varchar(10);
#Case 3: Show an example how you can ALTER a view and how that would reflect on the base Table.
alter view ourView as
select *
From Clients
where ClientNo = 12 WITH CHECK OPTION;
