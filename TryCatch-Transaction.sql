-- Try/Catch - Transaction

-- TRY CATCH
"""""""""""""
-- Exception Handling 
-- An Error condition during a program execution is called as exception;
-- So the mechanism for handing such as exception is exception handling

-- Syntax for exception Handling
/*
BEGIN TRY

SQL Statement

END TRY

BEGIN CATCH
 - Print ERROR OR
 - Rollback Transaction
END CATCH
*/

-- Example of TRY - CATCH
-- """"""""""""""""""""""
--Declaring variable in SQL using the keyword "DECLARE"

DECLARE @myvar1 int;
DECLARE @myvar2 int;

-- Assign value to the variables using SET:
SET @myvar1 = 7;
SET @myvar2 = 0;

BEGIN TRY
@myvar1/@myvar2
END TRY

BEGIN CATCH
PRINT ERROR_MESSAGE() -- Builtin Function
END CATCH

-- Ex2: On Table:
BEGIN TRY
SELECT sid, (gpa/0) FROM Student
END TRY

BEGIN CATCH
PRINT "Zero Division Error!"
END CATCH

-- TRANSACTION
-- """""""""""
-- Transaction is a group of command that change stored in a database.
-- IF (any) Command/(s) Fails the Transaction will ROLLBACK.
-- Must COMMIT for Transaction Change Data in the Database.
-- Syntax for transaction
/*
BEGIN TRY
    BEGIN TRANSACTION
	UPDATE student SET gpa=4.0
	WHERE name = 'Abid'
	UPDATE student SET gpa = 5.0/0
	WHERE name = 'Shafekul'
    COMMIT TRANSACTION
    PRINT 'Transaction Commited!'
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    PRINT 'Transaction Rolled Back'
END CATCH
*/

-- Example of Transaction
-- """"""""""""""""""""""
BEGIN TRANSACTION
    UPADTE Student SET gpa = 3.77
    WHERE sid=3062137
COMMIT TRANSACTION
ROLLBACK TRANSACTION;
-- Here if the command doesn't find the given sid-
-- The Command will be cancelled -
--and Transaction willbe Rolledback


