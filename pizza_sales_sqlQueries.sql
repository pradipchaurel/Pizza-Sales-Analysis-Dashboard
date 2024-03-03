use pizzadb;

select * from pizza_sales;

-- KPI's Requirements
-- 1. Total Revenue:
SELECT SUM(total_price) as Total_Revenue from pizza_sales;

-- 2. Average Order Value --> dividing total revenue by total number of order

SELECT SUM(total_price) / count(distinct order_id) as Average_Order_Value from pizza_sales;

-- 3. Total Pizzas sold --> sum of all the quantities of pizza sold

SELECT sum(quantity) as Total_Pizza_Sold FROM pizza_sales;

-- 4. Total orders 

SELECT count(distinct order_id) as Total_orders from pizza_sales;

-- 5. Average pizzas per order --> total pizzas sold / total orders

SELECT sum(quantity) / count(distinct order_id) as Average_pizza_per_order from pizza_sales;


-- Chart Requirements
-- 1. Daily trends for total orders

SELECT DAYNAME(order_date) as order_day, count(distinct order_id) as Total_Orders
FROM pizza_sales
GROUP BY order_day;

-- 2. Monthly trends for total orders

SELECT MonthName(order_date) as order_day, count(distinct order_id) as Total_Orders
FROM pizza_sales
GROUP BY order_day;

-- 3. % of sales by pizza category
SELECT pizza_category, sum(total_price)*100 / (SELECT sum(total_price) from pizza_sales) as Percentage_of_sales
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Percentage_of_sales DESC;

-- 4. % of sales by pizza size
SELECT pizza_size, sum(total_price)*100 / (SELECT sum(total_price) from pizza_sales) as Percentage_of_sales_by_pizzaSize
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage_of_sales_by_pizzaSize DESC;

-- 5. total pizza sold by category

SELECT pizza_category, sum(quantity) as total_pizza_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_pizza_sold DESC;

-- 6. Top 5 pizzas by revenue

SELECT pizza_name, sum(total_price) as total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC LIMIT 5;

-- 6. Bottom 5 pizzas by revenue

SELECT pizza_name, sum(total_price) as total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC LIMIT 5;

-- 6. Top 5 pizzas by quantity

SELECT pizza_name, sum(quantity) as total_quantity_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity_sold DESC LIMIT 5;

-- 6. Bottom 5 pizzas by quantity

SELECT pizza_name, sum(quantity) as total_quantity_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity_sold ASC LIMIT 5;

-- 7. Top 5 pizzas by total_orders

SELECT pizza_name, count(distinct order_id) as total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC LIMIT 5;

-- 7. Bottom 5 pizzas by total_orders

SELECT pizza_name, count(distinct order_id) as total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC LIMIT 5;







