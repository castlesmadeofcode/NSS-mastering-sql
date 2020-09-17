
-- TRIGGERS: example

CREATE FUNCTION set_pickup_date() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
  -- trigger function logic
  UPDATE sales
  SET pickup_date = NEW.purchase_date + integer '7'
  WHERE sales.sale_id = NEW.sale_id;
  
  RETURN NULL;
END;
$$

CREATE TRIGGER new_sale_made
  AFTER INSERT
  ON sales
  FOR EACH ROW
  EXECUTE PROCEDURE set_pickup_date();
  
  INSERT INTO sales(sales_type_id, vehicle_id, employee_id, dealership_id, price, invoice_number, purchase_date)
VALUES(1, 11, 111, 111, 10111, 101010101, CURRENT_DATE);
  
  SELECT * FROM sales
ORDER BY sale_id DESC;


-- Practice: Carnival

-- Create a trigger for when a new Sales record is added, set
-- the purchase date to 3 days from the current date.



CREATE FUNCTION set_purchase_date() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
  -- trigger function logic
  UPDATE sales
  SET purchase_date = CURRENT_DATE + 3
  WHERE sales.sale_id = NEW.sale_id;
  
  RETURN NULL;
END;
$$

CREATE TRIGGER new_purchase_made
  AFTER INSERT
  ON sales
  FOR EACH ROW
  EXECUTE PROCEDURE set_purchase_date();

  INSERT INTO sales(sales_type_id, vehicle_id, employee_id, dealership_id, price, invoice_number)
VALUES(1, 11, 111, 111, 10111, 101010101);

  SELECT * FROM sales
ORDER BY sale_id DESC;


-- Create a trigger for updates to the Sales table. If the pickup date is on or before
--  the purchase date, set the pickup date to 7 days after the purchase date. 
--  If the pickup date is after the purchase date but less than 7 days out from 
--  the purchase date, add 4 additional days to the pickup date.

CREATE FUNCTION set_conditional_pickup_date() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN

  IF NEW.pickup_date <= NEW.purchase_date
  THEN NEW.pickup_date := NEW.purchase_date + 7;
  ELSIF NEW.pickup_date > NEW.purchase_date AND NEW.pickup_date <= NEW.purchase_date + 7
  THEN NEW.pickup_date := NEW.pickup_date + integer '4'; 
  END IF;
  
  RETURN NEW;
END;
$$

CREATE TRIGGER update_conditional_pickup_date
  AFTER INSERT
  ON sales
  FOR EACH ROW
  EXECUTE PROCEDURE set_conditional_pickup_date();

UPDATE sales
SET pickup_date = purchase_date + 1
WHERE sale_id > 1007;

  SELECT * FROM sales
ORDER BY sale_id DESC;

