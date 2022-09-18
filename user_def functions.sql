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