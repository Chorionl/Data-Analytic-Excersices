--NOTES: CREATE TABLE AND INSERT DATA


--Create a Students table and insert sample data

CREATE TABLE Students (
 student_id integer primary key , --integer primary key 
 first_name nvarchar(100), --text
 last_name nvarchar(100), --text
 age integer, --integer
 grade nvarchar(100), --text
 city nvarchar(100) --text
 )
 Insert into Students (
 student_id,
 first_name,
 last_name,
 age,
 grade,
 city
 )
 values
 (01,'Stella','Ifi',17,'A','Patisia'),
 (02,'Dimitris','Vranas',16,'A','Athens'),
 (03,'Dimitra','Zara',19,'A','Athens'),
 (04,'Nasia','Vrana',20,'B','Naxos'),
 (05,'Panos','Kara',18,'A','Stanos')