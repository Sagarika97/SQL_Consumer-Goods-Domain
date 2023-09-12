with cte1 AS(SELECT 
	customer_code ,	
    round(avg(pre_invoice_discount_pct),3)  AS average_discount_percentage
    FROM gdb023.fact_pre_invoice_deductions where fiscal_year= 2021
    group by customer_code),
 cte2 AS	(select 
    customer_code,
    customer,market 
    from dim_customer where market = "India")
select 
	cte1.customer_code,cte1.average_discount_percentage , cte2.customer_code
from cte1
join cte2
using(customer_code)
order by average_discount_percentage desc
limit 5;