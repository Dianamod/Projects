USE sql_project;

CREATE TABLE dim_products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(50)
	);

INSERT INTO dim_products (product_name)
VALUES 
	('haircare'),
	('skincare'),
	('cosmetics');

CREATE TABLE dim_customer_demoghraphics (
	customer_id INT PRIMARY KEY,
	customer_demographics VARCHAR(50)
	);

INSERT INTO dim_customer_demoghraphics (customer_demographics)
VALUES
	('Male'),
	('Non-binary'),
	('Unknown');

CREATE TABLE dim_orders (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	sku VARCHAR(50)
	);

INSERT INTO dim_orders (sku)
SELECT sku
FROM supply_chain_data;

CREATE TABLE dim_supplier (
	supplier_id INT PRIMARY KEY AUTO_INCREMENT,
	supplier_name VARCHAR(50)
	);

INSERT INTO dim_supplier (supplier_name)
VALUES 
	('supplier_1'),
	('supplier_2'),
	('supplier_3'),
	('supplier_4'),
	('supplier_5');

CREATE TABLE dim_shipping (
	shipping_id INT PRIMARY KEY AUTO_INCREMENT,
	Shipping_carriers VARCHAR(50)
	);

INSERT INTO dim_shipping (shipping_carriers)
SELECT DISTINCT shipping_carriers
FROM supply_chain_data;

CREATE TABLE dim_transportation (
	transportation_id INT PRIMARY KEY AUTO_INCREMENT,
	transportation_mode VARCHAR(50)
	);

INSERT INTO dim_transportation (transportation_mode)
VALUES 
	('Road'),
	('Air'),
	('Rail'),
	('Sea');

CREATE TABLE dim_location (
	location_id INT PRIMARY KEY AUTO_INCREMENT,
	location VARCHAR(50)
	);

INSERT INTO dim_location (location)
SELECT DISTINCT location
FROM supply_chain_data;

CREATE TABLE dim_inspection_results (
	inspection_id INT PRIMARY KEY AUTO_INCREMENT,
	inspection_results VARCHAR(50)
	);

INSERT INTO dim_inspection_results (inspection_results)
SELECT DISTINCT inspection_results
FROM supply_chain_data;

CREATE TABLE dim_routes (
	route_id INT PRIMARY KEY AUTO_INCREMENT,
	route_name VARCHAR(50)
	);

INSERT INTO dim_routes (route_name)
SELECT DISTINCT routes
FROM supply_chain_data;

CREATE TABLE fct_supply_chain_data AS (
	SELECT t1.product_id AS product_id,
	t2.order_id AS order_id,
	t3.supplier_id AS supplier_id,
	t4.customer_id AS customer_id,
	t5.transportation_id AS transportation_id,
	t6.shipping_id AS shipping_id,
	t7.location_id AS location_id,
	t8.inspection_id AS inspection_id,
	t9.route_id AS route_id,
	s.Price AS price,
	s.Availability AS availibility,
	s.Number_of_products_sold AS number_of_products_sold,
	s.Revenue_generated AS revenue_generated,
	s.Stock_levels AS stock_level,
	s.Lead_times AS lead_times,
	s.Order_quantities AS order_quantities,
	s.Shipping_times AS shipping_times,
	s.Shipping_costs AS shipping_costs,
	s.Lead_time AS lead_time,
	s.Production_volumes AS production_volumes,
	s.Manufacturing_lead_time AS manufacturing_lead_time,
	s.Manufacturing_costs AS manufacturing_costs,
	s.Defect_rates AS defact_rates,
	s.Costs AS costs 
    FROM supply_chain_data s
    JOIN dim_products t1 ON s.product_type = t1.product_type 
    JOIN dim_orders t2 ON s.sku = t2.sku 
    JOIN dim_supplier t3 ON s.supplier_name = t3.supplier_name 
    JOIN dim_customer_demoghraphics t4 ON s.customer_demographics = t4.customer_demographics 
    JOIN dim_transportation t5 ON s.transportation_mode = t5.transportation_mode
    JOIN dim_shipping_carriers t6 ON s.shipping_carriers = t6.shipping_carriers 
    JOIN dim_location t7 ON s.location = t7.location 
    JOIN dim_inspection_results t8 ON s.inspection_results = t8.inspection_results 
    JOIN dim_routes t9 ON s.routes = t9.route_name
	);

ALTER TABLE fct_supply_chain_data ADD FOREIGN KEY (customer_id) REFERENCES dim_customer_demoghraphics (customer_id);

ALTER TABLE fct_supply_chain_data ADD FOREIGN KEY (product_id) REFERENCES dim_products (product_id);
