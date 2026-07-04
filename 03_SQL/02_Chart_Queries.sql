-- KPI CARDS FOR PIZZA SALES
select sum(total_price) as 'Total_Revenue' from pizza_sales_excel_file

select sum(total_price) / count(distinct order_id) as 'Avg_Order_Value' from pizza_sales_excel_file

select sum(quantity) as 'Total_Pizza_Sold' from pizza_sales_excel_file

select count(distinct order_id) as 'Total_Order' from pizza_sales_excel_file

-- this query gives output like 2.3219672131147
select cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as 'Avg_Pizza_per_Order' from pizza_sales_excel_file

-- but if you want above query answer in 2 decimal digits like (2.32) make a outer CAST Function
select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as 'Avg_Pizza_per_Order' from pizza_sales_excel_file

