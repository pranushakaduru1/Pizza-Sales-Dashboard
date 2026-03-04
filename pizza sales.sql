SELECT * FROM pizza_sales

SELECT SUM(total_price) from pizza_sales
SELECT SUM(total_price) As Total_Revenue from pizza_sales

SELECT SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value from pizza_sales

SELECT SUM(quantity) from pizza_sales
SELECT SUM(quantity) As Total_pizza_sold from pizza_sales

SELECT COUNT(DISTINCT order_id) As Total_orders from pizza_sales

SELECT SUM(quantity) / COUNT(DISTINCT order_id) from pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) from pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_pizzas_per_order from pizza_sales

PROBLEM STATEMENT:
 SELECT * FROM pizza_sales 

1.-- Orders by Day of Week
  SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders 
  from pizza_sales
  GROUP BY DATENAME(DW, order_date)

2.-- Orders by Month
  SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_orders
  FROM pizza_sales
  GROUP BY DATENAME(MONTH, order_date)
  ORDER BY Total_orders DESC 

3. -- Revenue % by Pizza Category
  SELECT pizza_category, sum(total_price) * 100 / (SELECT sum(total_price) from pizza_sales) AS PCT
  from pizza_sales
  GROUP BY pizza_category

  -- Revenue % for January Only
  SELECT pizza_category, sum(total_price) as Total_sales, sum(total_price) * 100 / (SELECT sum(total_price) from pizza_sales) AS PCT
  from pizza_sales
  WHERE MONTH(order_date) = 1
  GROUP BY pizza_category

4. -- Revenue % by Pizza Size
  SELECT pizza_size, sum(total_price) * 100 / (SELECT sum(total_price) from pizza_sales) AS PCT
  from pizza_sales
  GROUP BY pizza_size
  ORDER BY PCT DESC

  SELECT pizza_size, sum(total_price) as Total_sales,CAST(sum(total_price) * 100 / 
  (SELECT sum(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
  from pizza_sales
  GROUP BY pizza_size
  ORDER BY PCT DESC

  -- Quarter 1 Revenue by Size
  SELECT pizza_size, CAST(sum(total_price) AS DECIMAL(10,2)) as Total_sales,CAST(sum(total_price) * 100 / 
  (SELECT sum(total_price) from pizza_sales WHERE DATEPART(quarter, order_date)=1) AS DECIMAL(10,2)) AS PCT
  from pizza_sales
  WHERE DATEPART(quarter, order_date)=1
  GROUP BY pizza_size
  ORDER BY PCT DESC

5. -- Revenue by Pizza Name
  SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
  GROUP BY pizza_name
  ORDER BY Total_Revenue DESC

6. -- Top 5 Highest Revenue Pizzas
  SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
  GROUP BY pizza_name
  ORDER BY Total_Revenue DESC

  -- Bottom 5 Lowest Revenue Pizzas
  SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
  GROUP BY pizza_name
  ORDER BY Total_Revenue ASC

  -- Top 5 by Quantity Sold
  SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
  GROUP BY pizza_name
  ORDER BY Total_Quantity DESC

  -- Bottom 5 Sold in August
  SELECT TOP 5 pizza_name, SUM(quantity) as Total_pizzas_sold
  from pizza_sales
  WHERE MONTH(order_date) = 8
  GROUP BY pizza_name
  ORDER BY sum(quantity) ASC













