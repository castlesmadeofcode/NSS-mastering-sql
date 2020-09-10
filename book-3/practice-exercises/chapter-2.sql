
-- Practice - Employees

-- A sales employee at carnival creates a new sales record for a sale they are trying
-- to close. The customer, last minute decided not to purchase the vehicle. Help delete
-- the Sales record with an invoice number of '7628231837'.

DELETE FROM sales s WHERE s.invoice_number = '7628231837'

SELECT * FROM sales s WHERE s.invoice_number = '7628231837';


-- An employee was recently fired so we must delete them from our database.
-- Delete the employee with employee_id of 35. What problems might you run into 
-- when deleting? How would you recommend fixing it?

DELETE FROM employees e WHERE e.employee_id = 35

-- Change table to ON DELETE CASCADE