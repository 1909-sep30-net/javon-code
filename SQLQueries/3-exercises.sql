-- exercises

-- 1. insert two new records into the employee table.
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City,
State, Country, PostalCode, Phone, Email) VALUES 
	(100, 'Negahban', 'Javon', 'IT Staff', 3, '1995-12-15 00:00:00', '2003-05-14 00:00:00', 'Danta', 'RSM',
	'CA', 'USA', '92688', '9492579913', 'javon.negahban@cox.net'),
	(101, 'Negahban', 'Ojan', 'Sales Support Agent', 1, '1993-07-03 00:00:00', '2001-02-27 00:00:00',
	'Winding Street', 'Winding City', 'OH', 'USA', '72324', '9492018842', 'oja.negahban@cox.net')

SELECT *
FROM Employee

-- 2. insert two new records into the tracks table.
SELECT * FROM Track

INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
	(10000, 'Drive By', 1, 2, 3, 'Deaffy', 385622, 8146652, 0.99),
	(10001, 'Starships', 2, 1, 2, 'Nicki Minaj', 175615, 8256623, 0.89)

-- 3. update customer Aaron Mitchell's name to Robert Walter
SELECT * FROM Customer

UPDATE Customer
SET FirstName = 'Robert', LastName = 'Walter'
WHERE FirstName = 'Aaron' AND LastName = 'Mitchell'

-- 4. delete one of the employees you inserted.
DELETE FROM Employee
WHERE FirstName = 'Ojan'

SELECT * FROM Employee

-- 5. delete customer Robert Walter.
-- also delete invoice lines

DELETE FROM Invoice WHERE CustomerId = (
	SELECT CustomerId FROM Customer
	WHERE FirstName = 'Robert' AND LastName = 'Walter'
)
DELETE FROM Customer
WHERE FirstName = 'Robert' AND LastName = 'Walter'