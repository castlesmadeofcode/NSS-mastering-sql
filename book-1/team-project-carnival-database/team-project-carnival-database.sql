-- 1 Adding new tables for Carnival

CREATE TABLE VehicleBodyType (
    vehicle_body_type_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(20)
); 

CREATE TABLE VehicleModel (
    vehicle_model_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(20)
); 

CREATE TABLE VehicleMake (
    vehicle_make_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(20)
); 

-- 2 Running a data migration

UPDATE vehicleTypes 
SET body_type =  CASE  
					WHEN body_type = 'Car' THEN '1' 
					WHEN body_type = 'Truck' THEN '2'
					WHEN body_type = 'Van' THEN '3'
					WHEN body_type = 'SUV' THEN '4'
					ELSE null
                 END ;
				 
UPDATE vehicleTypes 				 
SET      make = CASE  
					WHEN make = 'Chevrolet' THEN '1' 
					WHEN make = 'Mazda' THEN '2'
					WHEN make = 'Nissan' THEN '3'
					WHEN make = 'Ford' THEN '4'
					WHEN make = 'Volkswagen' THEN '5'
					ELSE null
				  END ;
				  
UPDATE vehicleTypes 
SET     model =  CASE  
					WHEN model = 'Corvette' THEN '1' 
					WHEN model = 'Blazer' THEN '2'
					WHEN model = 'Silverado' THEN '3'
					WHEN model = 'MX-5 Miata' THEN '4'
					WHEN model = 'CX-5' THEN '5'
					WHEN model = 'CX-9' THEN '6' 
					WHEN model = 'Maxima' THEN '7'
					WHEN model = 'Altima' THEN '8'
					WHEN model = 'Titan' THEN '9'
					WHEN model = 'Fusion' THEN '10'
					WHEN model = 'EcoSport' THEN '11'
					WHEN model = 'F-250' THEN '12'
					WHEN model = 'Beetle' THEN '13'
					WHEN model = 'Passat' THEN '14'
					WHEN model = 'Atlas' THEN '15'
					WHEN model = 'Transit-150 Cargo' THEN '16'
					ELSE null
				 END ;


--3 renaming the columns

ALTER TABLE VehicleTypes
RENAME COLUMN make TO make_id;

ALTER TABLE VehicleTypes
RENAME COLUMN model TO model_id;

ALTER TABLE VehicleTypes
RENAME COLUMN body_type TO body_type_id;				 


--4 Altering a Table (changing type to int)

ALTER TABLE vehicletypes
ALTER COLUMN body_type TYPE int USING body_type::int,
ALTER COLUMN make TYPE int USING make::int,
ALTER COLUMN model TYPE int USING model::int;

-- 5 Import CSV files

-- 6 Altering a Table (adding foreign key constraints)
 ALTER TABLE VehicleTypes
  ADD CONSTRAINT fk_body_type 
  FOREIGN KEY (body_type) 
  REFERENCES VehicleBodyTypes(vehicle_body_type_id);

     ALTER TABLE VehicleTypes
  ADD CONSTRAINT fk_make
  FOREIGN KEY (make) 
  REFERENCES VehicleMake(vehicle_make_id);

   ALTER TABLE VehicleTypes
  ADD CONSTRAINT fk_model
  FOREIGN KEY (model) 
  REFERENCES VehicleModel(vehicle_model_id);

