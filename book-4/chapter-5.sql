-- chapter 5 Indexes
-- Practice: Database Performance

--     EXPLAIN ANALYZE SELECT * from Employees WHERE employee_type_id = 1

CREATE INDEX idx_emp_type_id ON employees 
(
    employee_type_id 
);

--     EXPLAIN ANALYZE SELECT * from Sales WHERE dealership_id = 500;

CREATE INDEX idx_deal_id ON sales
(
    dealership_id
);

--     EXPLAIN ANALYZE SELECT * from customers WHERE state = 'CA';

CREATE INDEX idx_state ON customers
(
    state
);

--     EXPLAIN ANALYZE SELECT * from vehicles where year_of_car BETWEEN 2018 AND 2020;

CREATE INDEX idx_year_of_car ON vehicles
(
    year_of_car
);

-- EXPLAIN ANALYZE SELECT * from vehicles where floor_price < 30000;
-- does not use index ^ bc of operator

-- EXPLAIN ANALYZE SELECT * from vehicles where floor_price = 30000;
-- uses index ^


CREATE INDEX idx_floor_price ON vehicles
(
    floor_price DESC
);

