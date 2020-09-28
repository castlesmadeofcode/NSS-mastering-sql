

-- Times (normalized tables w/ joins)
-- Pl: 0.355
-- Ex: 2.343

EXPLAIN ANALYZE SELECT 
	v.msr_price, vbt.name bodytype, 
	vma.name make, vmo.name model 
FROM vehicles v
JOIN vehicletypes vt on v.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclebodytypes vbt 
ON vt.body_type_id = vbt.vehicle_body_type_id
JOIN vehiclemakes vma
ON vt.make_id = vma.vehicle_make_id
JOIN vehiclemodels vmo
ON vt.model_id = vmo.vehicle_model_id
WHERE msr_price > 15000
ORDER BY msr_price;
CREATE TABLE denormvehicletypes AS SELECT vbt.name bodytype, vma.name make, vmo.name model 
FROM vehicletypes vt 
JOIN vehiclebodytypes vbt 
ON vt.body_type_id = vbt.vehicle_body_type_id
JOIN vehiclemakes vma
ON vt.make_id = vma.vehicle_make_id
JOIN vehiclemodels vmo
ON vt.model_id = vmo.vehicle_model_id;
ALTER TABLE denormvehicletypes ADD COLUMN vehicle_type_id SERIAL PRIMARY KEY;
select * from denormvehicletypes;
ALTER TABLE vehicles
DROP CONSTRAINT vehicles_vehicle_type_id_fkey;
ALTER TABLE vehicles 
ADD CONSTRAINT vehicles_vehicle_type_id_fkey 
FOREIGN KEY (vehicle_type_id) 
REFERENCES denormvehicletypes (vehicle_type_id);


-- Times (denormalized tables no joins)
-- PT: 0.219 ms
-- ET: 1.9 ms
-- PT: 0.143 ms
-- ET: 1.127 ms

EXPLAIN ANALYZE SELECT v.msr_price,  dvt.*
FROM vehicles v
JOIN denormvehicletypes dvt
ON v.vehicle_type_id = dvt.vehicle_type_id
WHERE v.msr_price > 15000
ORDER BY msr_price;




CREATE or REPLACE PROCEDURE insert_new_vehicle(vin integer, engine_type varchar, vehicle_type_id integer,
                          exterior_color varchar, interior_color varchar, floor_price integer,
                          msr_price integer, miles_count integer, year_of_car integer, is_sold boolean)
LANGUAGE SQL
AS $$
    INSERT INTO vehicles(vin, engine_type, vehicle_type_id, exterior_color, interior_color,floor_price, msr_price, miles_count, year_of_car, is_sold)
    VALUES(vin, engine_type, vehicle_type_id, exterior_color, interior_color, floor_price, msr_price, miles_count, year_of_car, is_sold);  
    Select vin WHERE not exists(SELECT * FROM vehicles WHERE vin = vin) 

$$;

CALL insert_new_vehicle(2,'2',2,'2','2', 2, 2, 2 ,2, false);