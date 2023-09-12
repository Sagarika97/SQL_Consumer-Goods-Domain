with cte1 as (SELECT 
			dp.segment, count( distinct product_code) AS product_count_2020
			FROM gdb023.dim_product dp
			join fact_sales_monthly fs using(product_code)
			where fiscal_year = 2020
			group by segment),
cte2 as (SELECT 
		dp.segment, count( distinct product_code) AS product_count_2021
		FROM gdb023.dim_product dp
		join fact_sales_monthly fs using(product_code)
		where fiscal_year = 2021
		group by segment)
SELECT  
	cte1.segment,product_count_2020,product_count_2021,
	abs(product_count_2020-product_count_2021)AS difference 
from cte1,cte2 where cte1.segment= cte2.segment;