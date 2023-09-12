 SELECT 
		concat(  (year(FS.date)) , " ", date_format(FS.date, '%M') ) AS Month,
        round(sum(sold_quantity * gross_price),2) AS Gross_sales_Amount
FROM gdb023.fact_sales_monthly FS
join fact_gross_price GP
using(product_code)
where customer_code 
	in (
    SELECT customer_code FROM gdb023.dim_customer where customer like "%Atliq Exclusive%"
    )
group by FS.date
order by FS.date desc
  ;