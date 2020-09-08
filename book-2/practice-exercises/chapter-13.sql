


-- Converting Your Practice Queries into Views

CREATE VIEW dealership_purchase_sales AS
    SELECT
        d.business_name,
        SUM(s.price) as income
    FROM
        dealerships d
    JOIN sales s ON s.dealership_id = d.dealership_id

-- Write a query that shows the total purchase sales income per dealership.
SELECT 
    *
FROM    
    dealership_purchase_sales
WHERE
    s.sales_type_id = 1
GROUP BY
    d.dealership_id


-- Write a query that shows the purchase sales income per dealership for the current month.
SELECT 
    *
FROM    
    dealership_purchase_sales
WHERE
  s.sales_type_id = 1 AND date_part('month', s.purchase_date) = 9
GROUP BY
  d.dealership_id


-- Write a query that shows the purchase sales income per dealership for the current year.
SELECT 
    *
FROM    
    dealership_purchase_sales
WHERE
  s.sales_type_id = 1 AND date_part('year', s.purchase_date) = 2020
GROUP BY
  d.dealership_id


  -- Write a query that shows the total purchase sales income per dealership.
SELECT 
    *
FROM    
    dealership_purchase_sales
WHERE
  s.sales_type_id = 2
GROUP BY
  d.dealership_id


-- Write a query that shows the lease sales income per dealership for the current month.
SELECT 
    *
FROM    
    dealership_purchase_sales
WHERE
  s.sales_type_id = 2 AND date_part('month', s.purchase_date) = 9
GROUP BY
  d.dealership_id


-- Write a query that shows the lease sales income per dealership for the current year.
SELECT 
    *
FROM    
    dealership_purchase_sales
WHERE
  s.sales_type_id = 2 AND date_part('year', s.purchase_date) = 2020
GROUP BY
  d.dealership_id

