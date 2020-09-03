
-- Practice: Carnival

-- Get a list of sales records where the sale was a lease.
SELECT
	*
FROM
	sales
WHERE
	sales_type_id = 2;


-- Get a list of sales where the purchase date is within the last two years.
SELECT
	*
FROM
	sales
WHERE
	purchase_date >= '2018-02-09' AND purchase_date <= '2020-02-09';


-- Get a list of sales where the deposit was above 5000 or the customer payed with American Express.
SELECT
	*
FROM
	sales
WHERE
	deposit > '5000' OR payment_method = 'americanexpress';


-- Get a list of employees whose first names start with "M" or ends with "e".
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE 'M%' OR first_name LIKE '%e'


-- Get a list of employees whose phone numbers have the 600 area code.
SELECT 
    *
FROM
    employees
WHERE
    phone LIKE '600%'


