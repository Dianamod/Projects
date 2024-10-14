-- 1. Total revenue by product type. 
use sql_project;
select
round(sum(f.revenue_generated),0),
p.product_type
from fct_supply_chain_data f
join dim_products p using(product_id)
group by p.product_type
order by p.product_type desc;
 
 -- comment for testing testing branch

-- 2. Total products sold by supplier
use sql_project;
select
supplier_name,
count(*) as nr_of_products_supplied
from fct_supply_chain_data
join dim_supplier d using (supplier_id)
group by supplier_id
order by supplier_name asc;



-- 3. Total products sold for each location
select
count(*) as nr_of_products_supplied,
d1.location
from fct_supply_chain_data
join dim_supplier d using (supplier_id)
join dim_location d1 using(location_id)
group by 2
order by 1 desc;

-- 4. Shipping costs by carrier
use sql_project;
select
round(sum(f.shipping_costs),0) as costs,
c.shipping_carriers
from fct_supply_chain_data f 
join dim_shipping_carriers c using(shipping_id)
group by 2;



-- 5. Inspection results by supplier. Total items that failed inspection

use sql_project;
select
d.supplier_name,
count(*) as total_supplied_products,
count(case when d1.inspection_results = 'fail' then 1 end ) as failed_inspection,
round(count(case when d1.inspection_results = 'fail' then 1 end ) *100/count(*), 1) as fail_rate
from fct_supply_chain_data s
join dim_supplier d using (supplier_id)
join dim_inspection_results d1 using(inspection_id) 
group by s.supplier_id
order by supplier_name;

-- 6. lead time by supplier
use sql_project;
select
s.supplier_name,
round(avg(f.lead_time),0) as avg_lead_time
from fct_supply_chain_data f
join dim_supplier s using(supplier_id)
group by 1;

-- 7.  Top 3 SKU by shipping_costs
use sql_project;
with cte as (select
c.shipping_carriers as carrier,
o.sku as sku,
f.shipping_costs as shipping_cost,
row_number() over(partition by c.shipping_carriers order by f.shipping_costs desc) as rn
from fct_supply_chain_data f
join dim_shipping_carriers c using(shipping_id)
join dim_orders o using(order_id)
)

select
carrier,
sku,
shipping_cost
from cte 
where cte.rn in (1,2,3);


