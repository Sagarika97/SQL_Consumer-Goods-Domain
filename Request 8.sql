SELECT  
    quarter(date_add(date, INTERVAL 4 MONTH)) AS quarter,
    sum(sold_quantity) AS total_sold_quantity
FROM gdb023.fact_sales_monthly 
where fiscal_year=2020
group by quarter
order by total_sold_quantity desc;