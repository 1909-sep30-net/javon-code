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
SELECT *
FROM Employee
WHERE Title LIKE '%Sales%';

-- 4. show a list of all countries in billing addresses on invoices.
SELECT DISTINCT BillingCountry
FROM Invoice;

-- 5. how many invoices were there in 2009, and what was the sales total for that year?
--    (extra challenge: find the invoice count sales total for every year, using one query)
SELECT YEAR(InvoiceDate) [Invoice Year], COUNT(*) AS [Number of Invoices], SUM(Total) AS [Sales Total]
FROM Invoice
GROUP BY YEAR(InvoiceDate);

-- 6. how many line items were there for invoice #37?
SELECT COUNT(*) AS [Line Items with Invoice #37]
FROM InvoiceLine
WHERE InvoiceId = 37;

-- 7. how many invoices per country?
SELECT BillingCountry, COUNT(*) [Number of invoices]
FROM Invoice
GROUP BY BillingCountry;

-- 8. show total sales per country, ordered by highest sales first.
SELECT BillingCountry, SUM(Total) [Total Sales]
FROM Invoice
GROUP BY BillingCountry
ORDER BY SUM(Total) DESC;