# End-to-End-Analytics-Project
<div align="center">
 Business Requirements Document (BRD) 
</div>
<div align="center">
Project: Pizza Metasales Analysis
  </div>
  
# Project Overview
 
The Pizza Metasales Analysis project is designed to analyse and visualize transactional sales data from a pizza store. The goal is to identify key business insights, trends, and KPIs that will help management make informed decisions related to sales, marketing, and operations.

# Business Objectives

•	Identify overall revenue, total pizzas sold, and total number of orders.

•	Determine sales distribution by pizza category, size, and type.

•	Analyse time-based trends in sales (daily, monthly, and yearly).

•	Highlight best-selling and least-selling pizzas by revenue and quantity.

•	Understand customer purchasing behaviour through Average Order Value (AOV) and Average Pizza per Order.

•	Provide visualization dashboards for effective decision-making.

# Data Source & Description

Dataset: pizza_sales.csv <br>
Key fields:

•	order_id → Unique identifier for each order <br>
•	pizza_id → Unique identifier for each pizza <br>
•	pizza_name → Name of the pizza sold <br>
•	quantity → Number of pizzas sold per order <br>
•	total_price → Total revenue for each transaction <br>
•	date, time → Order timestamp for time-based analysis <br>
•	pizza_category, pizza_size → Attributes for pizza classification <br>

# Tools & Technologies Used
* Python (Pandas, Matplotlib, Seaborn, Plotly) → Data cleaning, KPI calculation, and exploratory data analysis (EDA). <br>
* MySQL → Data storage, querying, aggregation, and answering structured business questions using SQL. <br>
* Power BI → Interactive dashboard creation and KPI visualization for business decision-making. <br>
* Jupyter Notebook → Development environment for analysis and reporting.
  
# Role & Responsibilities
🔹 MySQL Role (Data Querying & Business Question Analysis) <br>
* Imported raw transactional dataset into MySQL database. <br>
* Performed data cleaning and validation using SQL queries. <br>
* Used GROUP BY, JOIN, Aggregate Functions, Subqueries to calculate KPIs. <br>
* Created SQL queries to support dashboard-ready datasets. <br>

 Answered structured business questions such as: <br>
* What is total revenue ? <br>
* Which pizza category generates highest revenue ? <br>
* What are monthly and hourly sales trends ? <br>
* Which are top 5 and bottom 5 pizzas ?

🔹 Power BI Role (Dashboard & Business Visualization) <br>
* Connected Power BI to cleaned dataset. <br>
* Created calculated measures (Total Revenue, AOV, Total Orders). <br>
* Built interactive dashboards including: <br>
 • Implemented slicers and filters for dynamic business insights. <br>
 • Designed a management-level dashboard for strategic decision-making.
# KPI Cards (Revenue, Orders, AOV)
Category-wise Sales Analysis
Size-wise Performance <br>
Time-based Trend Analysis <br>
Top & Bottom Performing Products <br>





# Key Performance Indicators (KPIs)
•	Total Revenue = Sum of total_price <br>
•	Total Pizzas Sold = Sum of quantity <br>
•	Total Orders = Count of unique order_id <br>
•	Average Order Value (AOV) = Total Revenue ÷ Total Orders <br>
•	Average Pizza per Order = Total Pizzas Sold ÷ Total Orders <br>

# Analysis & Visualizations
Ingredient Analysis:
The pizza business aims to understand which ingredients are most frequently used across different pizza types by identifying the most common ingredients, etc.

# Daily Trend:
A line/bar chart showing sales by day of the week. <br>
•	Useful for staffing and operations planning.

# Hourly Trend:
A line/bar chart showing sales by hour of the day. <br>
• Useful for staffing, ingredients, customer rush and operations planning

# Monthly Trend:
A line chart depicting monthly revenue and orders. <br>
•	Helps track seasonality and identify peak sales months. <br>
•	Summer months show higher sales due to promotional campaigns.

# % of Sales by Category:
A bar chart representing revenue and quantity sold for each pizza category (Classic, Supreme, Veggie, Chicken). <br>
•	Helps identify customer preferences. <br>
•	Classic pizzas dominate sales, while Veggie has lower demand.

# % Sales by Pizza Size & Category:
A bar/ donut chart comparing sales revenue and quantity by pizza size (S, M, L, XL). <br>
•	Highlights demand distribution by size and assist inventory planning. <br>
•	Large (L) pizzas contribute the highest revenue.

# Total Pizzas Sold by Pizza Category:
•	Manage inventory by stocking ingredients used in the most popular categories. <br>
•	Evaluate if low-performing categories should be optimized, redesigned, or discontinued.

# Top 5 Best-Selling Pizzas:
A horizontal bar chart showing pizzas with the highest sales (by revenue, orders or quantity). <br>
•	Supports promotional and menu strategy.

# Bottom 5 Least-Selling Pizzas:
A horizontal bar chart of pizzas with the lowest sales. <br>
•	Identifies products for improvement or possible removal from the menu.


# Business Questions Answered
•	What is the total revenue generated ? <br>
•	How many pizzas were sold in total ? <br>
•	Which category and size of pizzas perform best ? <br>
•	Which pizzas are the top and bottom performers ? <br>
•	What is the average order value and average pizzas per order ? <br>
•	What are the sales trends by day, month, and time of day ?


# Deliverables
•	Jupyter Notebook with complete Python analysis. <br>
•	Visualizations (bar charts, line charts, trend charts). <br>
• MySQL queries answering key business questions. <br>
• Power BI interactive dashboard. <br>
•	Business Requirements Document (BRD). <br>
•	Insights and recommendations for management.



# Conclusion & Recommendations
The analysis provides a comprehensive view of pizza sales performance. Management can leverage these insights to: <br>
•	Focus marketing on high-performing categories. <br>
•	Optimize the menu by reconsidering least-selling pizzas. <br>
•	Plan inventory and staffing based on sales peaks. <br>
•	Monitor KPIs regularly through dashboards for continuous improvement.

