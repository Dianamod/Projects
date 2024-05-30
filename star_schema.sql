use sql_project;
create table dim_products( 
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50)
 );
 INSERT INTO dim_products(product_name)
 values 
 ('haircare'),
('skincare'),
('cosmetics');


create table dim_customer_demoghraphics( 
customer_id INT PRIMARY KEY,
customer_demographics VARCHAR(50)
 );
 INSERT INTO dim_customer_demoghraphics(customer_demographics)
 values 
 ('Male'),
('Non-binary'),
('Unknown');

CREATE TABLE dim_orders 
(order_id INT PRIMARY KEY AUTO_INCREMENT,
 sku varchar(50));
 insert into dim_orders  (sku)
 select
 sku
 from supply_chain_data;

create table dim_supplier( 
supplier_id INT PRIMARY KEY AUTO_INCREMENT,
supplier_name VARCHAR(50)
 );
 INSERT INTO dim_supplier(supplier_name)
 values 
 ('supplier_1'),
('supplier_2'),
('supplier_3'),
('supplier_4'),
('supplier_5');

create table dim_shipping( 
shipping_id INT PRIMARY KEY AUTO_INCREMENT,
Shipping_carriers VARCHAR(50) );

 insert into dim_shipping  (shipping_carriers)
 select
 distinct shipping_carriers
 from supply_chain_data;

create table dim_transportation( 
transportation_id INT PRIMARY KEY AUTO_INCREMENT,
transportation_mode VARCHAR(50)
 );
 INSERT INTO dim_transportation(transportation_mode)
 values 
('Road'),
('Air'),
('Rail'),
('Sea');

create table dim_location( 
location_id INT PRIMARY KEY AUTO_INCREMENT,
location VARCHAR(50)
 );
 insert into dim_location  (location)
 select
 distinct location
 from supply_chain_data;
 
 create table dim_inspection_results( 
inspection_id INT PRIMARY KEY AUTO_INCREMENT,
inspection_results VARCHAR(50)
 );
 insert into dim_inspection_results (inspection_results)
 select
 distinct inspection_results
 from supply_chain_data;
 
create table dim_routes( 
route_id INT PRIMARY KEY AUTO_INCREMENT,
route_name VARCHAR(50)
 );
 insert into dim_routes (route_name)
 select
 distinct routes
 from supply_chain_data;
 
create table fct_supply_chain_data as (
select
t1.product_id as product_id,
t2.order_id as order_id,
t3.supplier_id as supplier_id,
t4.customer_id as customer_id,
t5.transportation_id as transportation_id,
t6.shipping_id as shipping_id,
t7.location_id as location_id,
t8.inspection_id as inspection_id,
t9.route_id as route_id,
s.Price as price,
s.Availability as availibility,
s.Number_of_products_sold as number_of_products_sold,
s.Revenue_generated as revenue_generated,
s.Stock_levels as stock_level,
s.Lead_times as lead_times,
s.Order_quantities as order_quantities,
s.Shipping_times as shipping_times,
s.Shipping_costs as shipping_costs,
s.Lead_time as lead_time,
s.Production_volumes as production_volumes,
s.Manufacturing_lead_time as manufacturing_lead_time,
s.Manufacturing_costs as manufacturing_costs,
s.Defect_rates as defact_rates,
s.Costs as costs
from supply_chain_data s
join dim_products t1 on s.product_type = t1.product_type
join dim_orders t2 on s.sku = t2.sku
join dim_supplier t3 on s.supplier_name= t3.supplier_name
join dim_customer_demoghraphics t4 on s.customer_demographics =t4.customer_demographics
join dim_transportation t5 on s.transportation_mode=t5.transportation_mode
join dim_shipping_carriers t6 on s.shipping_carriers = t6.shipping_carriers
join dim_location t7 on s.location = t7.location
join dim_inspection_results t8 on s.inspection_results = t8.inspection_results
join dim_routes t9 on s.routes = t9.route_name
);

alter table fct_supply_chain_data
add foreign key (customer_id)
references dim_customer_demoghraphics ( customer_id);
alter table fct_supply_chain_data
add foreign key (product_id)
references dim_products(product_id);
