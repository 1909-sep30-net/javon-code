-- exercises

-- solve these with a mixture of joins, subqueries, CTE, and set operators.
-- solve at least one of them in two different ways, and see if the execution
-- plan for them is the same, or different.

-- 1. which artists did not make any albums at all?
SELECT art.Name
FROM Artist art
LEFT JOIN Album alb
ON art.ArtistId = alb.ArtistId
WHERE alb.AlbumId IS NULL;

SELECT *
FROM Artist art
WHERE art.ArtistId NOT IN (
	SELECT alb.ArtistId
	FROM Album alb
)

SELECT art.ArtistId
FROM Artist art
EXCEPT
SELECT alb.ArtistID
FROM Album alb

-- 2. which artists did not record any tracks of the Latin genre?
SELECT art.ArtistId, art.Name
FROM Artist art
WHERE art.ArtistId
NOT IN(
SELECT DISTINCT art.ArtistId
FROM Artist art
LEFT JOIN Album alb
ON alb.ArtistId = art.ArtistId
JOIN Track trk
ON trk.AlbumId = alb.AlbumId
JOIN Genre gen
ON trk.GenreId = gen.GenreId
WHERE gen.Name = 'Latin'
)

SELECT art.ArtistId, art.Name
FROM Artist art
EXCEPT
SELECT DISTINCT art.ArtistId, art.Name
FROM Artist art
LEFT JOIN Album alb
ON alb.ArtistId = art.ArtistId
JOIN Track trk
ON trk.AlbumId = alb.AlbumId
JOIN Genre gen
ON trk.GenreId = gen.GenreId
WHERE gen.Name = 'Latin'


-- 3. which video track has the longest length? (use media type table)
SELECT TOP 1 trk.*
FROM Track trk
JOIN Mediatype mt
ON trk.MediaTypeId = mt.MediaTypeId
WHERE mt.Name LIKE '%video%'
ORDER BY trk.Milliseconds DESC


SELECT TOP 1 trk.*
FROM Track trk
WHERE trk.MediaTypeId IN (
SELECT mt.MediaTypeId
FROM MediaType mt
WHERE mt.Name LIKE '%video%'
)
ORDER BY trk.Milliseconds DESC

-- 4. find the names of the customers who live in the same city as the
--    boss employee (the one who reports to nobody)
SELECT cust.FirstName, cust.LastName
FROM Customer cust
WHERE cust.City IN (
SELECT emp.City
FROM Employee emp
WHERE emp.ReportsTo IS NULL
)

SELECT cust.FirstName, cust.LastName
FROM Employee emp
JOIN Customer cust
ON emp.City = cust.City
WHERE emp.ReportsTo IS NULL

-- 5. how many audio tracks were bought by German customers, and what was
--    the total price paid for them?
SELECT COUNT(*) [Audio Tracks Bought By German Customers], SUM(il.Quantity * il.UnitPrice) [Total Price Paid]
FROM InvoiceLine il
JOIN Invoice i
ON il.InvoiceId = i.InvoiceId
JOIN Customer cust
ON i.CustomerId = cust.CustomerId
JOIN Track trk
ON trk.TrackId = il.TrackId
JOIN MediaType mt
ON mt.MediaTypeId = trk.MediaTypeId
WHERE cust.Country = 'Germany'
AND mt.Name LIKE '%audio%'

-- 6. list the names and countries of the customers supported by an employee
--    who was hired younger than 35.
SELECT cust.FirstName, cust.LastName, cust.Country
FROM Customer cust
JOIN Employee emp
ON cust.SupportRepId = emp.EmployeeId
WHERE DATEDIFF(YEAR, emp.BirthDate, emp.HireDate) < 35