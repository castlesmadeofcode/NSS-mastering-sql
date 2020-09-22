-- Write a transaction to:
-- Add a new role for employees called Automotive Mechanic
-- Add five new mechanics, their data is up to you
-- Each new mechanic will be working at all three of these dealerships:
--  Sollowaye Autos of New York, Hrishchenko Autos of New York and Cadreman Autos of New York


-- Write a transaction to:
-- Add a new role for employees called Automotive Mechanic
-- Add five new mechanics, their data is up to you
-- Each new mechanic will be working at all three of these dealerships: Sollowaye Autos of New York, Hrishchenko Autos of New York and Cadreman Autos of New York

BEGIN;

SELECT * FROM employeetypes;

INSERT INTO public.employeetypes(name)
	VALUES ('Automotive Mechanic');
	
INSERT INTO employees(
	first_name, last_name, email_address, phone, employee_type_id)
	VALUES 
	('Andy', 'Ab', 'andy@google.com', '111-111-1111', 9),
	('Bob', 'Bak', 'bob@google.com', '222-222-2222', 9),
	('Clay', 'Cool', 'clay@google.com', '333-333-3333', 9),
	('Dan', 'Dan', 'dan@google.com', '444-444-4444', 9),
	('Eric', 'Elroy', 'eric@google.com', '555-555-5555', 9);
	
SELECT * FROM employees ORDER BY employee_id DESC;

SELECT * FROM dealerships
WHERE business_name LIKE 'Sollowaye%' OR business_name LIKE 'Hrishchenko%' OR business_name LIKE 'Cadreman%';

INSERT INTO dealershipemployees(dealership_id, employee_id)
VALUES
(50,1009),
(128,1009),
(322,1009),
(50,1010),
(128,1010),
(322,1010),
(50,1011),
(128,1011),
(322,1011),
(50,1012),
(128,1012),
(322,1012),
(50,1013),
(128,1013),
(322,1013);

ROLLBACK;
COMMIT;