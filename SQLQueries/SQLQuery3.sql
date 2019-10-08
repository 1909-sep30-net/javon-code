-- basic exercises (Chinook database)

-- 1. list all customers (full names, customer ID, and country) who are not in the US
SELECT CustomerId, FirstName, LastName, Country
FROM Customer
WHERE Country != 'USA';

-- 2. list all customers from brazil
SELECT *
FROM Customer
WHERE Country = 'Brazil';

-- 3. list all sales agents

-- 4. show a list of all countries in billing addresses on invoices.

-- 5. how many invoices were there in 2009, and what was the sales total for that year?
--    (extra challenge: find the invoice count sales total for every year, using one query)

-- 6. how many line items were there for invoice #37?

-- 7. how many invoices per country?

-- 8. show total sales per country, ordered by highest sales first.