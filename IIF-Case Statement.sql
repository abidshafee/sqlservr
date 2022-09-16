-- Case Statement
-- """""""""""""""
-- Case Statement helps in multi-way decision making
-- Like:
/* If 1 --> Then Tea
   If 2 --> Then Coffee
   If 3 --> Water
   ...
   etc.
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
