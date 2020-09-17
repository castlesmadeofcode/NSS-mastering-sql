
-- Carnival Dealerships

-- Because Carnival is a single company, 
-- we want to ensure that there is consistency in the data provided to the user. 
-- Each dealership has it's own website but we want to make sure the website URL are consistent and easy to remember. 
-- Therefore, any time a new dealership is added or an existing dealership is updated, 
-- we want to ensure that the website URL has the following format: 
-- http://www.carnivalcars.com/{name of the dealership with underscores separating words}.

CREATE OR REPLACE FUNCTION format_dealership_webiste() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
-- 	NEW.website := CONCAT('http://www.carnivalcars.com/', REGEXP_REPLACE(LOWER(NEW.business_name), '( ){1,}', '_', 'g'));
	NEW.website := CONCAT('http://www.carnivalcars.com/', REPLACE(LOWER(NEW.business_name), ' ', '_'));
	
	RETURN NEW;
END;
$$

CREATE TRIGGER dealership_website
BEFORE INSERT OR UPDATE
ON dealerships
FOR EACH ROW EXECUTE PROCEDURE format_dealership_webiste();

INSERT INTO dealerships(business_name, phone, city, state, website, tax_id)
VALUES ('New Dealership in Music City', '615-200-2000', 'Nashville', 'Tennessee', 'www.test.com', 'ab-200-2000');

SELECT * FROM dealerships ORDER BY dealership_id DESC;


-- If a phone number is not provided for a new dealership, 
-- set the phone number to the default customer care number 777-111-0305.

CREATE OR replace FUNCTION default_phone_num()
	RETURNS trigger
	LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE dealerships
	SET phone = '777-111-0305'
	WHERE phone IS NULL AND dealership_id = NEW.dealership_id;
	RETURN NULL;
END;
$$

CREATE trigger add_phone
	AFTER INSERT
	ON dealerships
	for each row
  EXECUTE PROCEDURE default_phone_num();
  
INSERT INTO dealerships(business_name, city, state, website, tax_id)
VALUES ('New Dealership in Music City', 'Nashville', 'Tennessee', 'www.test.com', 'ab-200-2000');

SELECT * FROM dealerships ORDER BY dealership_id DESC;


-- OR

create or replace function set_default_dealer_phone()
returns trigger
language PlPGSQL
AS $$
begin
	if new.phone is NULL then
		update dealerships
		set phone = '777-111-0305'
		where dealership_id = new.dealership_id;
	end if;
	
	return null;
end;
$$

create trigger default_dealer_phone
after insert
on dealerships
for each row execute procedure set_default_dealer_phone();

-- OR

CREATE OR REPLACE FUNCTION set_default_phone() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
	IF NEW.phone IS NULL THEN
  		NEW.phone := '777-111-0305';
	END IF;
	RETURN NEW;
END;
$$

CREATE TRIGGER dealership_phone_number 
BEFORE INSERT
ON dealerships
FOR EACH ROW EXECUTE PROCEDURE set_default_phone();

-- For accounting purposes, the name of the state needs to be part of the dealership's tax id. 
-- For example, if the tax id provided is bv-832-2h-se8w for a dealership in Virginia, 
-- then it needs to be put into the database as bv-832-2h-se8w--virginia.

CREATE OR REPLACE FUNCTION set_state_in_tax_id() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
 	IF OLD.tax_id NOT LIKE '%-%-%-%--%' AND NEW.tax_id NOT LIKE '%-%-%-%--%' THEN
		NEW.tax_id := 	CONCAT(NEW.tax_id, '--', LOWER(NEW.state));
   	END IF;
	RETURN NEW;
END;
$$

CREATE TRIGGER dealership_tax_id
BEFORE INSERT OR UPDATE
ON dealerships
FOR EACH ROW EXECUTE PROCEDURE set_state_in_tax_id();

UPDATE dealerships
SET business_name = 'The Last Dealership'
-- 	tax_id = 'wv-353-xu-18ff--alabama'
WHERE dealership_id = 1000;

INSERT INTO dealerships(business_name, city, state, website, tax_id)
VALUES ('New Dealership in Music City', 'Nashville', 'Tennessee', 'www.test.com', 'ab-200-2000');

SELECT * FROM dealerships ORDER BY dealership_id DESC;