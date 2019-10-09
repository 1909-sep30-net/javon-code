-- basics of SQL

-- SQL is declarative - we say what we want, not how to implement that
-- we don't specify exactly how SQL Server will iterate through
-- the data, check caches, etc. - that is its job

-- with SQL we send commands or queries to a database

-- DML, Data Manipulation Language
-- contains all operations individual rows
-- SELECT is for read access
-- the rest of DML and eveything else too is for modifications

-- DDL, Data Definition Language
-- all operations on whole tables, table structure, most all other
-- objects in the DB like functions, procedures, triggers, etc

-- DCL, Data Control Language
-- database administration, allow users to have different permissions

-----------

-- just give me the number 1
SELECT 1;
SELECT 1;

SELECT 2 + 3; -- 5
SELECT 'str1' + ' ' + 'str' + CONVERT(varchar, 2 + 3);
-- single quotes for string literals
-- the semicolons aren't required

-- all employee data
SELECT * -- every column
FROM Employee;

-- fetching only some of the columns
-- the names of all employees
SELECT FirstName, LastName
FROM Employee;

-- fetch only some of the rows
-- all data on employees with first names 5 letters long or shorter
SELECT *
FROM Employee
WHERE LEN(FirstName) <= 5;

-- In SQL, often, string comparison is case insensitive
-- this is based on the "collation"
-- the collation is a per-database setting determining
-- the rules for string comparison, standard date/time format
-- number format, currency format, VARCHAR (non-Unicode) string encoding
SELECT *
FROM Employee
WHERE FirstName = 'STEVE' AND LastName = 'Johnson';

-- get the full name of each employee as one column
-- with column aliases - if they have spaces, surround with [] or ""
SELECT
	FirstName + ' ' + LastName AS [Full Name],
	LEN(FirstName + ' ' + LastName) AS [Length]
FROM Employee;