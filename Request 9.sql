with cte1 as 
	(SELECT 
	DC.channel,
    sum(FC.sold_quantity*GP.gross_price) AS total_gross_sales
FROM gdb023.fact_sales_monthly FC
JOIN gdb023.fact_gross_price GP
using(product_code)
JOIN dim_customer DC
using (customer_code)
where GP.fiscal_year=2021
group by DC.channel),
cte2 as(
	select sum(cte1.total_gross_sales) AS gross_sales_Sum from cte1
)
select 
	cte1.channel,
	cte1.total_gross_sales AS gross_sales_mln ,
    round(cte1.total_gross_sales*100/cte2.gross_sales_Sum,2) AS contribution_percentage 
from cte1,cte2;
