-- STORED PROCEDURE
-- """"""""""""""""
-- STORED PROCEDURE is a prepared SQL code which saved and reused
-- Syntax For Stored Procedure:
/*
CREATE PROCEDURE precedure_name
AS
sql_statement
GO:
*/

-- Example of Stored Procedure:
CREATE PROCEDURE stdgpa
AS
SELECT sid, gpa FROM Student
GO;

-- Execute Stored Procedure
EXEC stdgpa;

-- Ex2: Stored Procedure
CREATE PROCEDURE bestPerformer
AS
SELECT sid, name, gpa FROM Student
WHERE gpa>=3.50
GO;

EXEC bestperformer;

-- Stored Procedure with parameterSyntax
/*
CREATE PROCEDURE proc_name
@param1 data-type, @param2 data-type
AS
sql_statement
GO;
*/

-- Example of Stored procedure with params
CREATE PROCEDURE Stdudentgpa
@gpa float
AS
SELECT sid, name, gpa from student
WHERE gpa >= @gpa 
GO;

-- Execute gpa with param
EXEC Studentgpa @gpa = 3.5;
EXEC Studentgpa @gpa = 3.0;


