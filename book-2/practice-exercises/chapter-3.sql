
-- Practice: Carnival

-- Get a list of the sales that was made for each sales type.
SELECT
s
FROM
    sales AS s
INNER JOIN salestypes AS st
    ON s.sales_type_id = st.sales_type_id;


-- Get a list of sales with the VIN of the vehicle, the first name and
--  last name of the customer, first name and last name of the employee
--   who made the sale and the name, city and state of the dealership.
SELECT
    v.vin,
    c.first_name,
    c.last_name,
    e.first_name,
    e.last_name,
    d.business_name,
    d.city,
    d.state
FROM
    sales AS s
INNER JOIN vehicles AS v
    ON s.vehicle_id = v.vehicle_id
INNER JOIN customers AS c
    ON s.customer_id = c.customer_id
INNER JOIN employees AS e
    ON s.employee_id = e.employee_id
INNER JOIN dealerships AS d
    ON s.dealership_id = d.dealership_id


-- Get a list of all the dealerships and the employees, if any, working at each one.
SELECT
  d,
  e
FROM
    dealershipemployees AS de
INNER JOIN dealerships as d
    ON de.dealership_id = d.dealership_id
INNER JOIN employees as e
    ON de.employee_id = e.employee_id


-- Get a list of vehicles with the names of the body type, make, model and color.
SELECT
 v.exterior_color,
 v.interior_color,
 vbt.name,
 vmo.name,
 vma.name
FROM
    vehicletypes AS vt
INNER JOIN vehiclebodytype AS vbt
    ON vt.body_type_id = vbt.vehicle_body_type_id
INNER JOIN vehiclemodel AS vmo
    ON vt.model_id = vmo.vehicle_model_id
INNER JOIN vehiclemake AS vma
    ON vt.make_id = vma.vehicle_make_id
INNER JOIN vehicles AS v
    ON vt.vehicle_type_id = v.vehicle_type_id


