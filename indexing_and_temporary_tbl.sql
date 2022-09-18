-- Indexing
-- """"""""
-- SQL Query Index
-- Indexing Reduces aggregation time for quering large dataset
-- Syntax for Creaating index on one more than one column

/*Syntax
--"""""""
CREATE INDEX index_name
ON Student_tbl (sid, name);
*/
-- Creating index on Student Table
CREATE INDEX index_name
ON Student(sid, name);

-- Temporary Table
-- """""""""""""""
-- Temporary table start with # in the table name
-- and other functionalities are the same as normal table
-- Temporary Table Created in Temporary database
-- Called (tempDB) and Deleted as soon as Session is terminated.

CREATE Table #my_temp_tbl
(
ID INT NOT NULL IDENTITY(1, 1),
Name VARCHAR(20) NOT NULL,
Age INT NOT NULL,
Address VARCHAR(20),

Primary Key (ID)
);
-- Query from the temporary table

SELECT * FROM #my_temp_tbl;

INSERT into #tmpstdtbl(Name, Age, Address)
VALUES('Khairul Alam', 27, 'kushtia),
       ('Karman Clore', 28, 'Pabna');



