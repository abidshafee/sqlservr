-- SQL Interview QUESTION

-- WHERE vs HAVING
-- """""""""""""""
/*
WHERE clause is used to filter the records based on the specified condition;
Whereas HAVING caluse is used to filter the records from groups based on specified conditions.

WHERE Clause can not have aggregate functions (SUM, COUNT, MIN, MAX, etc);
Whereas HAVING clause can operate on aggregate functions.

WHERE clause is Implemented on rows;
On the other hand HAVING clause is implemented on columns.
*/

-- Difference between DROP and TRUNCATE
--"""""""""""""""""""""""""""""""""""""
/*
DROP removes thable definition and its contents;
Whereas TRUNCATE deletes all rows from the table.

DROP remove evrything of the table including The VIEWS of the table and the Integrity constraints;
Whereas TRUNCATE doesn't remove the VIEW of the table and Integrity constraints will also not be removed.
*/
USE Abid;

CREATE TABLE Employee
(
	ID INT NOT NULL IDENTITY(25371, 1),
	Name VARCHAR(20) NOT NULL,
	AGE INT,
	Gender VARCHAR(10),
	DOJ DATE,
	DEPT VARCHAR(20),
	City VARCHAR(20)

	Primary Key (ID)
);

-- Inserting Salary Column in Employee table
ALTER TABLE Employee ADD Salary REAL;

-- DROP TABLE Eployee;
SELECT * FROM Employee;

INSERT INTO Employee (Name, AGE, Gender, DOJ, DEPT, City, Salary)
VALUES('Moniruzzaman', 25, 'Male', GETDATE(), 'Accounts', 'Gopalgonj', 10000),
('Jahidul Islam', 35, 'Male', GETDATE(), 'Marketing', 'Barisal', 31000),
('Saiful Islam', 31, 'Male', GETDATE(), 'Sales', 'Tangail', 32000);

-- Q: Find the Lowest salary of the employees in each department.
-- Table Name: Employee
-- Table Structure:
-- Emp_Id | Emp_Name | Age | Gender | DOJ | DEPT | City
-- Ans:
SELECT dept, min(salary) AS lowest_salary FROM employee
GROUP BY dept;

-- Q: Which query will help you fetch unique values from a column in a table?




