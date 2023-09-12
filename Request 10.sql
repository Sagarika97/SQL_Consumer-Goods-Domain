with cte1 as ( SELECT
		DM.division,
        DM.product_code,
        DM.product,
        sum(FS.sold_quantity) AS total_sold_quantity
FROM gdb023.dim_product DM
join fact_sales_monthly FS using(product_code)
where FS.fiscal_year = 2021 
group by DM.product_code,DM.product,DM.division
) ,
cte2 as (
		select * ,
        dense_rank() over (partition by division order by total_sold_quantity desc) as rank_order 
        from cte1
        )
select 
	* from cte2 
    where rank_order <=3
        ;
