
-- Selling a Vehicle

-- Carnival would like to create a stored procedure that handles the case of updating their
-- vehicle inventory when a sale occurs. They plan to do this by flagging the vehicle as
-- is_sold which is a field on the Vehicles table. When set to True this flag will indicate
-- that the vehicle is no longer available in the inventory. Why not delete this vehicle? 
-- We don't want to delete it because it is attached to a sales record.

ALTER TABLE vehicles
ADD COLUMN is_sold bool NOT NULL
SET DEFAULT false


CREATE PROCEDURE sell_vehicle(a int)
LANGUAGE plpgsql
AS $$

BEGIN
UPDATE vehicles
SET is_sold = 'True';
WHERE vehicle_id = a

END
$$;

CALL insert_data();

-- Returning a Vehicle

-- Carnival would also like to handle the case for when a car gets returned by a customer. 
-- When this occurs they must add the car back to the inventory and mark the original sales
-- record as returned = True.

-- Carnival staff are required to do an oil change on the returned car before putting it back
-- on the sales floor. In our stored procedure, we must also log the oil change within the 
-- OilChangeLog table.


-- add return boolean to sales table and create oilchangelog table and other tables
-- try to write tables on own but they exist in book-1

CREATE PROCEDURE return_vehicle(a int)
LANGUAGE plpgsql
AS $$

BEGIN
UPDATE vehicles
SET is_sold = 'False';
WHERE vehicle_id = a

UPDATE sales
SET is_returned = 'True';
WHERE vehicle_id = a

UPDATE oilchangelog
SET oil_change = 'True'
WHERE vehicle_id = a

END
$$;

CALL insert_data();




