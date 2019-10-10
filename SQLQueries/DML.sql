SELECT * FROM Genre;

-- the rest of DML... INSERT, UPDATE, DELETE
INSERT INTO Genre VALUES (100, 'Misc')
INSERT INTO Genre VALUES (101, 'Misc 2'), (103, 'Misc 3')
-- best practice, name the columns you'll insert in the order you want
-- necessary if some of the columns don't allow inserting
-- helpful if some of the columns have default values that you want
INSERT INTO Genre (GenreId, Name) VALUES (101, 'Misc 2'), (103, 'Misc 3')

-- you can insert values parsed from a CSV file
-- can insert based on query
INSERT INTO Genre (GenreId, Name) VALUES (
	(SELECT MAX(GenreId) FROM Genre) + 1, 'Misc 4'
)

INSERT INTO Genre
	SELECT GenreId + 10, Name + '!'
	FROM Genre
	WHERE Name LIKE '%Misc%'