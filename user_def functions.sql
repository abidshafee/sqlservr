-- Scalar Valued Function
-- """"""""""""""""""""""
-- Scalar valued function returns scalar value such as 1, 2, 9, etc.
/* Syntax:
-- """""""
CREATE FUNCTION fname(@param1 AS DATATYPE, @param2 AS DATATYPE)
RETURNS RETURN_DATATYPE
AS
BEGIN
-- Function Body
RETURN value
END;
*/

-- Example of Scalar Valued Function
-- """""""""""""""""""""""""""""""""
CREATE FUNCTION addfive(@num AS INT)
RETURN INT
AS
BEGIN
-- pass
RETURN(
@num+5)
END;

-- Calling the addfive function
SELECT dbo.addfive(1);

-- Table Valued Function
-- """""""""""""""""""""
-- Returns table
/* Syntax
CREATE FUNCTION f_name(@param1 AS DATATYPE, @param2 AS DATATYPE)
RETURN table
AS
RETURN (SELECT * FROM tbl_name WHERE <Condition>)
*/

-- Example of Table Valued Function
CREATE FUNCTION select_gpa(@gpa AS FLOAT)
RETURN Table
AS
RETURN (SELECT * FROM Student WHERE gpa = @gpa);

-- Calling the table vlued function: select_gpa()
SELECT * FROM dbo.select_gpa(3.40);

-- this will return all the records of the students have gpa 3.4

