-- SQL VIEW & MERGE
-- """"""""""""""""

-- VIEW is Virtual table based on the result of SQL Statement
-- Syntax For Creating View
/*
CREATE VIEW v_name
AS
SELECT * FROM tbl_name 
WHERE <condition>;
*/
-- Query from the View
-- """""""""""""""""""
SELECT * FROM the v_name;

-- Drop the VIEW
-- """""""""""""
DROP VIEW v_name;

-- MERGE
--"""""""
-- Merge is the combination of INSERT, DELETE, and UPDATE statements
-- Syntax for Merge Statement
-- """"""""""""""""""""""""""
/*
MERGE Target_tbl AS T
USING Source_tbl AS S
	ON <Join Condition>
WHEN MATCHED
	THEN <UPDATE Statement>
WHEN NOT MATCHED BY TARGET
	THEN <INSER Statement>
WHEN NOT MATCHED BY SOURCE
	THEN <DELETE Statement>
;
*/

-- Example of Merge Statement:
-- """"""""""""""""""""""""""
- For merging records both should have identical columns:
MERGE Student_tbl AS T
USING Student_tbl2 AS S
	ON T.sid = S.sid
WHEN MATCHED
	THEN UPDATE SET T.age = S.age, T.gpa = S.gpa
WHEN NOT MATCHED BY TARGET
	THEN insert (sid, name, age, gpa)
	VALUES(S.sid, S.name, S.age, S.gpa)
WHEN NOT MATCHED BY SOURCE
	THEN DELETE;

