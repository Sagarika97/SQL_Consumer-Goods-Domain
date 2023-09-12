select 
	MC.product_code, DM.product, MC.manufacturing_cost
from dim_product DM
join fact_manufacturing_cost MC
using(product_code)
where MC.manufacturing_cost 
in (
	select min(manufacturing_cost) from fact_manufacturing_cost
    union
    select max(manufacturing_cost) from fact_manufacturing_cost
	)
;
 