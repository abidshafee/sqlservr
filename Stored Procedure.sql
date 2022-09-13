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


