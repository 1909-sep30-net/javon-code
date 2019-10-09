-- SQL has some operators that combine entire queries (SELECT) into one query
-- the set operators:
--	UNION
--		gives you all rows that are found in either query, without duplicates
--	UNION ALL
--		gives you all rows that are found in either query, including duplicates
--		faster to run but have potentially more data
--	INTERSECT
--		all rows that are in both queries, without duplicates
--	EXCEPT
--		"set difference"
--		all rows that are in the first query but are not in the second query

-- to use any of them, the two queries must have the same number and type
-- of columns

-- all first names of employees and customers
SELECT FirstName
FROM Employee
UNION ALL
SELECT FirstName
From Customer;

-- INTERSECT
-- names that a customer has and also an employee has
SELECT FirstName
FROM Employee
INTERSECT
SELECT FirstName
From Customer;

-- EXCEPT
-- names that employees have but customers do not have
SELECT FirstName
FROM Employee
EXCEPT
SELECT FirstName
From Customer;

-- SELF JOIN
-- join a table with itself

-- show me every employee with manager
SELECT *
FROM Employee AS e1
LEFT JOIN Employee AS e2
ON e1.ReportsTo = e2.EmployeeId