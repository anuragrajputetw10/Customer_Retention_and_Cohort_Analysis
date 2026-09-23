use online_retail_analysis;

select *
from online_retail LIMIT 5 ;

-- 1. Overall Business KPIs

select round(sum(revenue),2) as total_revenue,
		count(DISTINCT CustomerID) as total_customers,
        count(distinct InvoiceNo) as total_orders,
        count(distinct StockCode) as total_products,
        round(sum(revenue)/count(distinct InvoiceNo),2) as avg_order_value
from online_retail ;

-- 2. Monthly Revenue Analysis

SELECT `Year_Month`,round(sum(revenue),2) as monthly_revenue
FROM online_retail
group by `Year_Month`
order by `Year_Month` ;

-- 3. Monthly Sales Growth

WITH monthly_sales as (
	SELECT `Year_Month`, sum(Revenue) as monthly_revenue
	FROM online_retail
GROUP BY `Year_Month` )

SELECT `year_month`, round(monthly_revenue, 2) as monthly_revenue,
round(( monthly_revenue - lag(monthly_revenue) 
over(order by `year_month`)) / lag (monthly_revenue) 
over(order by `year_month`) * 100 , 2) as growth_percentage
FROM monthly_sales ;


-- 4. Running Total of Revenue

WITH monthly_sales as (
			SELECT `year_month`, sum(revenue) as monthly_revenue
			FROM online_retail 
			GROUP BY `year_month`
)

SELECT	round(monthly_revenue,2) AS monthly_revenue,
		round(sum(monthly_revenue) over(order by `year_month`),2) as running_total
FROM monthly_sales;

-- 5.Top 10 Customers by Revenue

SELECT CustomerID, count(DISTINCT InvoiceNo) as total_orders,
		round(sum(revenue),2) as total_revenue
FROM online_retail
GROUP BY CustomerID
ORDER BY total_revenue DESC LIMIT 10 ;

-- 6.Rank Customers by Revenue

SELECT *
FROM (
    SELECT
        CustomerID,
        ROUND(SUM(revenue), 2) AS total_revenue,
        ROW_NUMBER() OVER (ORDER BY SUM(revenue) DESC) AS customer_rank
    FROM online_retail
    GROUP BY CustomerID
) AS t1
WHERE customer_rank <= 10
ORDER BY customer_rank;

-- 7. Customer Purchase Frequency

SELECT CustomerID, count(DISTINCT InvoiceNo) as total_orders
FROM online_retail
GROUP BY CustomerID
ORDER BY total_orders DESC ;


-- 8. Identify Repeat Customers

WITH customer_order as (
		SELECT CustomerID, count(DISTINCT InvoiceNo) as order_count
		FROM online_retail
        GROUP BY CustomerID 
        )
SELECT 
		CASE
			WHEN order_count = 1
				THEN 'One-Time-Customer'
			ELSE 'Repeat-Customer'
		END AS customer_type,
		count(*) as total_customer
FROM customer_order
GROUP BY customer_type ;

-- 9. Calculate Repeat Customer Rate

WITH customer_order as (
		SELECT CustomerID, count(DISTINCT InvoiceNo) as order_count
        FROM online_retail
        GROUP BY CustomerID
        )
SELECT count(*) as total_customer,
		sum(CASE WHEN order_count >1 THEN 1
            END ) AS repeat_customers ,
		round(sum( case when order_count > 1 then 1
				  end) / count(*) * 100 , 2 ) as repeat_customer_rate 
FROM customer_order ;


-- 10. Top 10 Products by Revenue

SELECT StockCode, `Description`, round(sum(Revenue),2) as total_revenue,
		sum(Quantity) as total_quantity
FROM online_retail
GROUP BY StockCode, `Description`
ORDER BY total_revenue DESC 
LIMIT 10;


-- 11.Rank Products Within Each Country

WITH product_sales as (
		SELECT country, `description`, sum(revenue) as total_revenue
        FROM online_retail
        GROUP BY Country, Description
        ) ,
ranked_product as (
		SELECT country, `description`, total_revenue,
        DENSE_RANK() OVER( PARTITION BY country ORDER BY total_revenue DESC) as product_rank
        FROM product_sales
)

SELECT *
FROM ranked_product
WHERE product_rank <= 3;
        
-- 12.Revenue by Country

SELECT Country, round(sum(revenue),2) as total_revenue,
		count(DISTINCT CustomerID) as customers,
        count(DISTINCT InvoiceNo) as orders
FROM online_retail
GROUP BY Country
ORDER BY total_revenue DESC ;

-- 13.Top Countries Excluding United Kingdom

SELECT Country, round(sum(revenue),2) as total_revenue,
		count(DISTINCT CustomerID) as customers,
        count(DISTINCT InvoiceNo) as orders
FROM online_retail
WHERE Country != 'United Kingdom'
GROUP BY Country
ORDER BY total_revenue DESC 
LIMIT 10;


-- 14.Revenue by Day of Week

SELECT Day_Name, round(sum(revenue),2) as total_revenue,
		count(DISTINCT InvoiceNo) as total_orders
FROM online_retail
GROUP BY Day_Name
ORDER BY total_revenue DESC;


-- 15.Revenue by Hour

SELECT `Hour`, round(sum(revenue),2) as total_revenue,
		count(DISTINCT InvoiceNo) as total_orders
FROM online_retail
GROUP BY `Hour`
ORDER BY total_revenue DESC;


--  16.Find Each Customer's First and Last Purchase


SELECT CustomerID, min(InvoiceDate) as first_purchase,
		max(InvoiceDate) as last_purchase,
        count(DISTINCT InvoiceNo) as total_orders,
        round(sum(revenue),2) as lifetime_purchase
FROM online_retail
GROUP BY CustomerID
ORDER BY lifetime_purchase DESC;

-- 17.Customer Lifetime Value Analysis

WITH customer_value AS (
    SELECT CustomerID, SUM(Revenue) AS lifetime_value
    FROM online_retail
    GROUP BY CustomerID)

SELECT
    CASE
        WHEN lifetime_value >= 5000
            THEN 'High Value'
        WHEN lifetime_value >= 1000
            THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment,
    
    COUNT(*) AS customers,
    ROUND(SUM(lifetime_value),2) AS revenue
FROM customer_value
GROUP BY customer_segment
ORDER BY revenue DESC;

-- 18.Pareto Analysis — Revenue Contribution

WITH customer_revenue AS (

    SELECT CustomerID, SUM(Revenue) AS total_revenue
    FROM online_retail
    GROUP BY CustomerID
),

customer_pareto AS (

    SELECT
        CustomerID,total_revenue,
        SUM(total_revenue)
        OVER (ORDER BY total_revenue DESC) AS cumulative_revenue,
        SUM(total_revenue)
        OVER () AS overall_revenue
    FROM customer_revenue
)

SELECT
    CustomerID,
    ROUND(total_revenue,2) AS customer_revenue,
    ROUND(cumulative_revenue /overall_revenue * 100,2) AS cumulative_revenue_percentage
FROM customer_pareto
ORDER BY customer_revenue DESC ;





