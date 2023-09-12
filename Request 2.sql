with cte1 AS 	
	(
    select 
		count(distinct product_code) AS product_count_2020
	FROM gdb023.fact_sales_monthly
	where fiscal_year=2020
    ),
cte2 AS (
	select 
		count(distinct product_code) AS product_count_2021
	FROM gdb023.fact_sales_monthly 
	where fiscal_year=2021
    )
select 	
		product_count_2020,
		product_count_2021,
        abs(product_count_2020-product_count_2021)/product_count_2020*100 AS increase_product_count_in_2021 
from cte1,cte2;
