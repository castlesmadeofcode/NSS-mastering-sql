
-- Creating Carnival Reports:
-- Carnival would like to harness the full power of reporting. Let's begin to look further at querying the data in our tables. Carnival would like to understand more about thier business and needs you to help them build some reports.

-- Goal:
-- Below are some desired reports that Carnival would like to see. Use your query knowledge to find the following metrics.

-- Employee Reports:
-- Best Sellers

-- Who are the top 5 employees for generating sales income?

SELECT
  e.first_name,
  e.last_name,
  SUM(s.price) as income
FROM
  employees e
  JOIN sales s ON s.employee_id = e.employee_id
GROUP BY
  e.employee_id
ORDER BY
  SUM(s.price) DESC
LIMIT
  5;


--   Who are the top 5 dealership for generating sales income?

SELECT
  d.business_name,
  SUM(s.price) as income
FROM
  dealerships d
  JOIN sales s ON s.dealership_id = d.dealership_id
GROUP BY
  d.dealership_id
ORDER BY
  SUM(s.price) DESC
LIMIT
  5;

--   Which vehicle model generated the most sales income?

SELECT
  vm.name,
  SUM(s.price) as income
FROM
  vehicles v
  JOIN sales s ON s.vehicle_id = v.vehicle_id
  JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
  JOIN vehiclemodels vm ON vt.model_id = vm.vehicle_model_id
GROUP BY
  vm.name
ORDER BY
  SUM(s.price) DESC
LIMIT
  1;

-- Top Performance

-- Which employees generate the most income per dealership?


  SELECT
  e.first_name,
  e.last_name,
  d.business_name,
  SUM(s.price) as income
FROM
  employees e
  JOIN sales s ON s.employee_id = e.employee_id
  JOIN dealerships d ON d.dealership_id = s.dealership_id
GROUP BY
  e.employee_id,
  d.business_name
ORDER BY
  SUM(s.price) DESC
LIMIT
  5;

--   Vehicle Reports
-- Inventory

-- In our Vehicle inventory, show the count of each Model that is in stock.

SELECT
  mo.name,
  COUNT(v.vehicle_id)
FROM
  vehicles v
  JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
  JOIN vehiclemodels mo ON vt.model_id = mo.vehicle_model_id
GROUP BY
  mo.vehicle_model_id
ORDER BY
  COUNT(v.vehicle_id) DESC;

--   In our Vehicle inventory, show the count of each Make that is in stock.

SELECT
  vm.name,
  COUNT(v.vehicle_id)
FROM
  vehicles v
  JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
  JOIN vehiclemakes vm ON vt.make_id = vm.vehicle_make_id
GROUP BY
  vm.vehicle_make_id
ORDER BY
  COUNT(v.vehicle_id) DESC;


-- In our Vehicle inventory, show the count of each BodyType that is in stock.

SELECT
  bt.name,
  COUNT(v.vehicle_id)
FROM
  vehicles v
  JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
  JOIN vehiclebodytypes bt ON vt.body_type_id = bt.vehicle_body_type_id
GROUP BY
  bt.vehicle_body_type_id
ORDER BY
  COUNT(v.vehicle_id) DESC;

--   Purchasing Power

-- Which US state's customers have the highest average purchase price for a vehicle?

SELECT
  c.state,
  ROUND(AVG(s.price))
FROM
  customers c
  JOIN sales s ON s.customer_id = c.customer_id
GROUP BY
  c.state
ORDER BY
  AVG(s.price) DESC
LIMIT
  5;

--   Now using the data determined above, which 5 states have the customers with the highest average purchase price for a vehicle?

SELECT
  c.state,
  c.first_name,
  c.last_name,
  ROUND(AVG(s.price))
FROM
  customers c
  JOIN sales s ON s.customer_id = c.customer_id
WHERE
	s.sales_type_id = 2
GROUP BY
  c.state,
  c.first_name,
  c.last_name
ORDER BY
  AVG(s.price) DESC
LIMIT
  5;



