-- The file Contains TSQL Code:
/*
"""
T-SQL (Transact-SQL) is a set of programming extensions from Sybase and Microsoft that add several features to the Structured Query Language (SQL), including transaction control, exception and error handling, row processing and declared variables. All applications that communicate with SQL Server do so by sending T-SQL statements to the server.

The most popular T-SQL statement is the stored procedure, which is a compiled and stored T-SQL code. Similar to views, stored procedures generate an execution plan when called the first time. The difference is stored procedures can select data and execute any T-SQL code within any parameters.

User-defined functions are another example of T-SQL statements. User-defined functions take input parameters, perform an action and return the results to the call.
"""
Fome more>>
""""""""""'
Ref: https://www.techtarget.com/searchdatamanagement/definition/T-SQL
*/
-- SQL is not case sensitive; For Identity we've wrote the keyword in CAPs

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
ADD dob DATE;

-- Delete Col from Student Table
ALTER table Student
DROP COLUMN dob;


-- Creating Course table
CREATE TABLE Course 
(
	cid VARCHAR(20) NOT NULL,
	name VARCHAR(50) NOT NULL,

	PRIMARY KEY(cid)
);

-- To make sid in Student table auto increament -
-- use the keyword IDENTITY(1, 1).
-- Means start from 1 and automatically increament by 1.

SELECT * FROM Course;

INSERT INTO Course VALUES(
	'15-447', 'SQL Server Management Studio'
);

-- Creating table enrolled with foreign table constrint
CREATE Table enrolled
(
	sid INT,
	cid VARCHAR(20),
	grade VARCHAR(20)

	Foreign key (sid) REFERENCES student(sid),
	Foreign key (cid) REFERENCES course(cid)
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

-- Seecting destinct items in the course table
-- """""""""""""""""""""""""""""""""""""""""""
SELECT DISTINCT(grade) FROM enrolled;

-- Querying from multiple table (INNER JOIN)
--"""""""""""""""""""""""""""""""""""""""
SELECT s.sid, s.name, c.Subject, e.grade FROM enrolled e 
INNER JOIN student s on s.sid=e.sid 
INNER JOIN course c on c.cid=e.cid;

-- INNER JOIN returns the Records those are common from the both(or every) Tables
/*-- LEFT JOIN returns all the records from the left Table and only the matched records from the Joined Table (right). 
whenever a record in the left table doesn't presnt in the right table the query returns the null value for the record in the right table.*/
/*-- RIGHR JOIN just do the Opposite of the LEFT JOIN; 
It returns all the records from the Right Table and just the matched records in the Left Table.*/
-- FULL JOIN returns all the Records from All the Tables

-- Nested Query
--""""""""""""""
SELECT * FROM Student
WHERE age = (SELECT MAX(age) FROM Student)

SELECT * FROM Student
WHERE age = (SELECT MIN(age) FROM Student)

SELECT * FROM Student
WHERE gpa = (SELECT MIN(gpa) FROM Student)

-- UNION Operator (Combine Avoid Duplicates)
-- """""""""""""""""""""""""""""""""""""""""
/*-- UNION operator is used to combine the result-set of two or more SELECT Statement Avoiding Duplicates
The both select command should be run on similar tables of two virsions; meaning: both table should have similar columns*/

-- UNION ALL operator includes the duplicate records as well
-- """""""""

-- Example: 
SELECT * FROM Student_tbl1 UNION SELECT * FROM Student_tbl2 

-- EXCEPT Operator
-- """""""""""""""
-- EXCEPT Operator returns Unique Record from the left query which are not part of the Right Query. 
-- Similar to Set operation (A - B)

-- Example: 
SELECT * FROM Student_tbl1 EXCEPT SELECT * FROM Student_tbl2

-- INTERSECT Operator
-- """"""""""""""""""
-- INTERSECT Operator returns the records that are common to both select statement

-- Example: 
SELECT * FROM Student_tbl1 INTERSECT SELECT * FROM Student_tbl2

-- VIEW
-- """""
-- VIEW is a virtual table based on the result of an sql statement
-- Syntax for creating VIEW
/*
CREATE VIEW v_name AS
SELECT * FROM tbl_name
WHERE condition;
*/

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
-- Required Identical Columns in both tables
/*
MERGE Student_tbl1 AS T -- Target
USING Student_tbl2 AS S -- Source
	ON T.sid = S.sid
WHEN MATCHED
	THEN update set T.age = S.age, T.gpa = S.gpa
WHEN NOT MATCHED BY TARGET -- insert record from source table
	THEN insert (sid, name, age, gpa)
	values(S.sid, S.name, S.age, S.gpa)
WHEN NOT MATCHED BY SOURCE -- When Target has record that Source doesn't have
	THEN delete; -- Then DELETE that record from the Target Table
*/

-- Scalar Valued Function
-- """"""""""""""""""""""
-- Always returns a scalar value, such as: 1, 2, 9, etc.
/* Syntax:
-- """""""
CREATE FUNCTION fun_name(@param1 AS datatype, @param2 AS datatype)
RETURNS return_datatype
AS
BEGIN
-- Function Body
RETURN value
END;
*/

-- Example of Scalar Valued Function
CREATE FUNCTION addfive(@num as int)
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

-- It will returns all the records of the student with the gpa -> 3.21

-- SQL Query Index
-- Indexing Reduces query time for quering on the large dataset
-- Syntax for Creaating index on more than one column

CREATE INDEX index_name
ON Student_tbl (Sid, Name);

-- Temporary Table: name table including #
-- Temporary table created in temporary database (tempDB) and Deleted as soon as session is terminated

-- Syntax For Creating Temporary table:
CREATE TABLE #tblName
(
	
);

-- Example of Tamporary Table:
--""""""""""""""""""""""""""""""
CREATE TABLE #tmpstdtbl(
sid int Primary Key,
Name varchar(20)
);

SELECT * FROM #tmpstdtbl;

INSERT into #tmpstdtbl VALUES(1, 'Khairul Alam');
INSERT into #tmpstdtbl VALUES(2, 'Sanaul Haq');

-- Case Statement
-- """""""""""""""
-- Case Statement helps in multi-way decision making
-- Like:
/* If 1 --> Then Tea
   If 2 --> Then Coffee
..
*/

-- Syntax For Case Statement: 
/* CASE
      WHEN condition1 THEN result1
      WHEN condition2 THEN result2
      ..
      ELSE result
  END;
*/
-- Example of Case Statement:
SELECT *, grade = 
case
when gpa=4 then 'A+'
when gpa>3.5 then 'A'
when gpa<3.5 then 'A-'
else 'Missing'
END
FROM Student
GO

-- IIF() Function:
-- """""""""""""""
-- IIF() function is an alternative for the case statement
-- Syntax For Case Statement:
/*
IIF(boolean_expression, true_value, false_value)
*/

-- Example of IIF() Function:
SELECT * , 
IIF(gpa>3.0, 'Pass', 'Fail') as PassFail 
FROM Student
GO;
