-- Creating Database Abid
CREATE database Abid;

-- Using Database Abid
USE [Abid]
GO

--Inserting data into Student Table
insert into Student values
(3456330,'Shafekul Abid','Abid@',31,3.41);

-- Inserting multiple Values
insert into Student values
(3456331,'Rasibul Karim','Rasib@kst',32,3.21),
(3456332,'Abid Shafee','Shafee@29',29,3.61);

select * from Student;

-- Deleting Duplicated item in student table
DELETE FROM [dbo].[Student]
      WHERE name='Rafiq Alam'
GO

-- Updating data in student table
UPDATE dbo.student set login='nobin@'
where login='nobin@g'

--Setting sid col as Primary key of the Student table
ALTER table Student add primary key (sid);

/*
ALTER Command is used to add, delete, modify the attributes of the relations (tables) in the database. 
UPDATE Command is used to update existing records in a database.
*/

-- Insert new column to Student table
ALTER table Student  
ADD dob date;

-- Delete Col from Student Table
ALTER table Student
DROP COLUMN dob;


-- Creating Course table
create table Course 
(
	cid varchar(20) not null,
	name varchar(50) not null,

	primary key(cid)
);
select * from Course;

insert into Course values(
	'15-447', 'SQL Server Management Studio'
);

-- Creating table enrolled with foreign table contrint
Create Table enrolled
(
	sid int,
	cid varchar(20),
	grade varchar(20)

	Foreign key (sid) references student(sid),
	Foreign key (cid) references course(cid)
);
select * from enrolled;
select * from Student;
select * from Course;

insert into enrolled values(3456330, '15-447', 'A');
insert into enrolled values(3456329, '15-447', 'A-');
insert into enrolled values(3456329, '15-446', 'B+');
insert into enrolled values(3456329, '15-445', 'A-');
insert into enrolled values(3456327, '15-445', 'B-');
insert into enrolled values(3456327, '15-446', 'A-');
insert into enrolled values(3456327, '15-447', 'A+');

-- Seecting destinct items in course table
select distinct(grade) from enrolled;

-- query from multiple table (INNER JOIN)
select s.sid, s.name, c.Subject, e.grade from enrolled e 
inner join student s on s.sid=e.sid 
inner join course c on c.cid=e.cid;

-- INNER JOIN returns the Records those are common from the both(or every) Tables
/*-- LEFT JOIN returns all the records from the left Table and only the matched records from the Joined Table (right). 
whenever a record in the left table doesn't presnt in the right table the query returns the null value for the record in the right table.*/
/*-- RIGHR JOIN is just the Opposite of the LEFT JOIN; 
It returns all the records from the Right Table and just the matched records in the Left Table.*/
-- FULL JOIN returns all the Records from All the Tables

-- Nested Query
select * from Student
where age = (select max(age) from Student)

select * from Student
where age = (select min(age) from Student)

select * from Student
where gpa = (select min(gpa) from Student)

/*-- UNION operator is used to combine the result-set of two or more SELECT Statement Avoiding Duplicates
The both select command should be run on similar tables of two virsions; meaning: both table should have similar columns*/
-- UNION ALL operator includes the duplicate records as well

-- Example: SELECT * FROM Student_tbl1 UNION SELECT * FROM Student_tbl2 

/*-- EXCEPT Operator returns Unique Record from the left query which are not part of the Right Query. Similar to Set operation A - B*/
-- Example: SELECT * FROM Student_tbl1 EXCEPT SELECT * FROM Student_tbl2

-- INTERSECT Operator returns the records that are common to both select statement
-- Example: SELECT * FROM Student_tbl1 INTERSECT SELECT * FROM Student_tbl2

-- VIEW is a virtual table based on the result of an sql statement
/*-- CREATE VIEW v_name AS
SELECT * FROM tbl_name
WHERE condition;*/
-- Qureying from the VIEW: SELECT * FROM v_name;
-- Droping VIEW: DROP VIEW v_name;

-- MERGE is the combination of INSERT, DELETE, and UPDATE statements
-- Implementing the MARGE Statement
/*MERGE [Target] AS T
USING [Source] AS S
	ON [JOIN Condition]
WHEN MATCHED
	THEN [UPDATE Statement]
WHEN NOT MATCHED BY TARGET
	THEN [INSERT Statement]
WHEN NOT MATCHED BY SOURCE
	THEN [DELETE Statement];*/

-- Example of Merge Statement
-- """"""""""""""""""""""""""
-- Require Same Types of Column in both tables
/*
MERGE Student_tbl1 AS T -- Target
USING Student_tbl2 AS S -- Source
	ON T.sid = S.sid
WHEN MATCHED
	THEN update set T.age = S.age, T.gpa = S.gpa
WHEN NOT MATCHED BY TARGET -- insert record from source table
	THEN insert (sid, name, age, gpa)
	values(S.sid, S.name, S.age, S.gpa)
WHEN NOT MATCHED BY SOURCE -- When Target Table has record that Source Table doesn't have
	THEN delete; -- Then DELETE that record from the Target Table
*/

-- Scalar Valued Function
-- """"""""""""""""""""""
-- Always returns a scalar value, such as: 1, 2, 9, etc.
/* Syntax:
CREATE FUNCTION fun_name(@param1 AS datatype, @param2 AS datatype)
RETURNS return_datatype
AS
BEGIN
-- Function Body
RETURN value
END*/

-- Example of Scalar Valued Function
CREATE FUNCTIOON addfive(@num as int)
RETURNS int
AS
BEGIN
-- pass
RETURN(
@num+5
)
end;

-- Calling the addfive() function
SELECT dbo.addfive(1);

-- Table valued function | returns a table
-- Syntax for table valued Function:
--""""""""""""""""""""""""""""""""""
/* 
CREATE FUNCTION func_name(@param1 datatype, @param2 datatype)
RETURNS table
AS
RETURN (SELECT * FROM tbl_name WHERE [Condition])
*/

-- Example of Table Valued Function:

CREATE function selgpa(@gpa as float)
RETURN table
AS
RETURN
(
SELECT * FROM Student WHERE gpa = @gpa
)

-- Calling selgpa Function:
SELECT * FROM dbo.selgpa(3.21);

-- It will returns all the records of the stident with the gpa -> 3.21


