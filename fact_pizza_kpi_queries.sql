CREATE DATABASE project;
use project;
SELECT * FROM fact_pizza_sales;

-- Date data type correction and manipulation 

ALTER TABLE fact_pizza_sales modify order_date DATE;
SELECT order_time FROM fact_pizza_sales limit 10;
UPDATE fact_pizza_sales
SET order_time = REPLACE(order_time,'.', ':') WHERE order_time LIKE '%.%.%';
UPDATE fact_pizza_sales
SET order_time = STR_TO_DATE(order_time, '%H:%i:%s');
ALTER TABLE fact_pizza_sales modify order_time TIME;

-- Setting Primary Key

SELECT pizza_id,COUNT(*) FROM fact_pizza_sales group by pizza_id having COUNT(*)>1;
ALTER TABLE fact_pizza_sales MODIFY pizza_id int not null,add primary key(pizza_id);

-- Data manipulation and index insertion

set sql_safe_updates=0;
ALTER TABLE fact_pizza_sales
MODIFY pizza_category VARCHAR(255);
CREATE INDEX idx_order_date on fact_pizza_sales(order_date);
CREATE INDEX idx_pizza_name on fact_pizza_sales(pizza_name);
CREATE INDEX idx_pizza_category on fact_pizza_sales(pizza_category);
desc fact_pizza_sales;

-- Total pizza revenue & quantity

SELECT round(SUM(total_price),2) as total_revenue, 
SUM(quantity) as total_qty 
from 
fact_pizza_sales;

-- Total orders placed

SELECT COUNT(*) AS total_rows
FROM fact_pizza_sales;

-- Rank by category using rank()

SELECT 
pizza_category,
round(SUM(total_price),2) AS revenue,
ROUND(SUM(total_price)*100 /
SUM(SUM(total_price)) OVER(),2) AS revenue_pct,
RANK() OVER(ORDER BY SUM(total_price) DESC) AS category_rank
FROM fact_pizza_sales
GROUP BY pizza_category;

-- Total qty pizza name

SELECT pizza_name,SUM(quantity) as total_qty 
from fact_pizza_sales 
group by pizza_name 
order by total_qty 
desc limit 3;

-- Date-wise average

SELECT order_date,round(avg(total_price),2) as avg_rev
FROM fact_pizza_sales 
group by order_date 
order by avg_rev desc; 

-- monthly revenue

SELECT 
MONTHNAME(order_date) AS month_name,
ROUND(SUM(total_price),0) AS total_revenue
FROM fact_pizza_sales
GROUP BY month_name
ORDER BY total_revenue DESC;

-- Best month by revenue

SELECT date_format(order_date,'%y-%m') as month,
round(SUM(total_price),0) as total_rev 
FROM fact_pizza_sales
group by month 
order by total_rev desc limit 3;

-- Best pizza per category using CTE with rank()

SELECT *
FROM (
    SELECT 
        pizza_category,
        pizza_name,
        SUM(quantity) AS total_qty,
        RANK() OVER(PARTITION BY pizza_category ORDER BY SUM(quantity) DESC) rnk
    FROM fact_pizza_sales
    GROUP BY pizza_category,pizza_name
) ranked
WHERE rnk = 2;

-- Total orders

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM fact_pizza_sales;

-- Average pizza per order

SELECT 
ROUND(SUM(quantity) / COUNT(DISTINCT order_id),2) AS avg_pizzas_per_order
FROM fact_pizza_sales;

-- Average Order Value (AOV)

SELECT pizza_category,
ROUND(SUM(total_price) / COUNT(DISTINCT order_id),2) AS average_order_value
FROM fact_pizza_sales group by pizza_category;

-- total revenue by size

SELECT pizza_size,
round(SUM(total_price),2) AS total_revenue
FROM fact_pizza_sales
GROUP BY pizza_size
ORDER BY total_revenue DESC;

-- Avg revenue by weekdays

SELECT 
DAYNAME(order_date) AS day_name,
round(avg(total_price),2) AS revenue
FROM fact_pizza_sales
GROUP BY day_name
ORDER BY revenue DESC;

-- Total Contibution by category

SELECT 
    pizza_category, 
    SUM(total_price) * 100 / (SELECT SUM(total_price) FROM fact_pizza_sales) AS PCT
FROM fact_pizza_sales GROUP BY pizza_category;

-- Revenue by Date-wise

SELECT 
order_date,
SUM(total_price) AS daily_revenue,
SUM(SUM(total_price)) OVER (ORDER BY order_date) AS running_revenue
FROM fact_pizza_sales
GROUP BY order_date
ORDER BY order_date;

-- TOP 5 Pizza by revenue using CTE with rank()

SELECT pizza_name, orders_count,
revenue, revenue_rank
FROM (
    SELECT 
        pizza_name,
        COUNT(DISTINCT order_id) AS orders_count,
        ROUND(SUM(total_price), 2) AS revenue,
        RANK() OVER (ORDER BY SUM(total_price) DESC) AS revenue_rank
    FROM fact_pizza_sales
    GROUP BY pizza_name
) ranked_pizzas
WHERE revenue_rank <= 5;
