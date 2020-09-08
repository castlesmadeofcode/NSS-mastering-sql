
-- Purchase Income by Dealership

-- Write a query that shows the total purchase sales income per dealership.
SELECT
  d.business_name,
  SUM(s.price) as income
FROM
  dealerships d
  JOIN sales s ON s.dealership_id = d.dealership_id
WHERE
  s.sales_type_id = 1
GROUP BY
  d.dealership_id


-- Write a query that shows the purchase sales income per dealership for the current month.
SELECT
  d.business_name,
  SUM(s.price) as income
FROM
  dealerships d
  JOIN sales s ON s.dealership_id = d.dealership_id
WHERE
  s.sales_type_id = 1 AND date_part('month', s.purchase_date) = 9
GROUP BY
  d.dealership_id


-- Write a query that shows the purchase sales income per dealership for the current year.
SELECT
  d.business_name,
  SUM(s.price) as income
FROM
  dealerships d
  JOIN sales s ON s.dealership_id = d.dealership_id
WHERE
  s.sales_type_id = 1 AND date_part('year', s.purchase_date) = 2020
GROUP BY
  d.dealership_id


  -- Write a query that shows the total purchase sales income per dealership.
SELECT
  d.business_name,
  SUM(s.price) as income
FROM
  dealerships d
  JOIN sales s ON s.dealership_id = d.dealership_id
WHERE
  s.sales_type_id = 2
GROUP BY
  d.dealership_id


-- Write a query that shows the lease sales income per dealership for the current month.
SELECT
  d.business_name,
  SUM(s.price) as income
FROM
  dealerships d
  JOIN sales s ON s.dealership_id = d.dealership_id
WHERE
  s.sales_type_id = 2 AND date_part('month', s.purchase_date) = 9
GROUP BY
  d.dealership_id


-- Write a query that shows the lease sales income per dealership for the current year.
SELECT
  d.business_name,
  SUM(s.price) as income
FROM
  dealerships d
  JOIN sales s ON s.dealership_id = d.dealership_id
WHERE
  s.sales_type_id = 2 AND date_part('year', s.purchase_date) = 2020
GROUP BY
  d.dealership_id


-- Write a query that shows the total income (purchase and lease) per employee.
SELECT
  e.first_name,
  e.last_name,
  SUM(s.price) as income
FROM
  employees e
  JOIN sales s ON s.employee_id = e.employee_id
WHERE
  s.sales_type_id = 1 OR s.sales_type_id = 2
GROUP BY
  e.employee_id