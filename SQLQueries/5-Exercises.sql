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

-- 4. find the names of the customers who live in the same city as the
--    boss employee (the one who reports to nobody)

-- 5. how many audio tracks were bought by German customers, and what was
--    the total price paid for them?

-- 6. list the names and countries of the customers supported by an employee
--    who was hired younger than 35.