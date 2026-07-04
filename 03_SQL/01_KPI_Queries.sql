-- CHARTS REQUIREMENT

-- 1] how many total order is placed in each wweek including every day
-- Daily trends on total order
select DATENAME(DW, order_date) as 'Order_Date', COUNT(distinct order_id) as 'Total_Orders'  from pizza_sales_excel_file
group by DATENAME(DW, order_date)


--2] Monthly trends for total orders
 select DATENAME(MONTH, order_date) as 'Month_name', count(distinct order_id) as 'Total_orders' from pizza_sales_excel_file
 group by DATENAME(MONTH, order_date)
 order by Total_orders desc


 --3] percentage of sales by pizza category
select pizza_category, sum(total_price) as 'total_sales', sum(total_price) * 100 / (select sum(total_price) from pizza_sales_excel_file) as 'Percentage_of_total_sales'
from pizza_sales_excel_file
group by pizza_category

-- if i want to know percentage of sales from a particular month [eg: 1= jan , 2= feb and so on]
select pizza_category, sum(total_price) as 'total_price', sum(total_price) * 100 / (select sum(total_price) from pizza_sales_excel_file where MONTH(order_date) = 1) as 'Percentage_of_total_sales'
from pizza_sales_excel_file 
where MONTH(order_date) = 1
group by pizza_category


--4] percentage of sales by pizza size and cast function is also used in this query
select pizza_size, sum(total_price) as 'total price', cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales_excel_file where MONTH(order_date) = 2) as decimal(10,2)) as 'Percentage_of_total_sales'
from pizza_sales_excel_file
where MONTH(order_date) = 2  -- to see orders from specific month
group by pizza_size
order by Percentage_of_total_sales desc


--5] top 5 best sellers by revenue, total quantity and total orders
select * from pizza_sales_excel_file
select top 5 pizza_name, sum(total_price) as 'total revenue' from pizza_sales_excel_file
group by pizza_name
order by [total revenue] desc

-- bottom 5 pizza sellers by revenue
select top 5 pizza_name as 'bottom 5 pizza', sum(total_price) as 'total revenue' from pizza_sales_excel_file
group by pizza_name
order by [total revenue] asc

-- top 5 pizza seller by quantity
select top 5 pizza_name, sum(quantity) as 'total quantity'  from pizza_sales_excel_file
group by pizza_name
order by [total quantity] desc

-- bottom 5 pizzza seller by quantity
select top 5 pizza_name as 'bottom 5 pizza', sum(quantity) as 'total quantity' from pizza_sales_excel_file
group by pizza_name
order by [total quantity] asc

-- top 5 pizza seller by total orders
select top 5 pizza_name, COUNT(distinct order_id) as 'total orders' from pizza_sales_excel_file
group by pizza_name
order by [total orders] desc

-- bottom 5 pizza seller by total orders
select top 5 pizza_name as 'bottom 5 pizza', COUNT(distinct order_id) as 'total orders' from pizza_sales_excel_file
group by pizza_name
order by [total orders] 