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

-- Q: Find the Lowest salary of the employees in each department.
-- Table Name: Employee
-- Table Structure:
-- Emp_Id | Emp_Name | Age | Gender | DOJ | DEPT | City
-- Ans:
SELECT dept min(salary) AS lowest_salary FROM employees
GROUP BY dept;




