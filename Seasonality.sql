SELECT
	YEAR(created_at) AS yr,
    MONTH(created_at) AS mo,
    COUNT(DISTINCT order_id) AS number_of_sales,
    SUM(price_usd) AS total_revenue,
    SUM(price_usd - cogs_usd) AS total_margin
FROM orders 
WHERE created_at < '2013-01-04'
GROUP BY 1, 2;

SELECT
	YEAR(website_sessions.created_at) AS yr,
    MONTH(website_sessions.created_at) AS mo,
    COUNT(DISTINCT order_id) AS orders,
    COUNT(DISTINCT order_id) / COUNT(DISTINCT website_sessions.website_session_id) AS conv_rate,
    SUM(price_usd) / COUNT(DISTINCT website_sessions.website_session_id) AS revenue_per_session,
    COUNT(DISTINCT CASE WHEN primary_product_id = 1 THEN order_id ELSE 0 END) AS product_one_orders,
    COUNT(DISTINCT CASE WHEN primary_product_id  = 2 THEN order_id ELSE 0 END) AS product_two_orders
FROM website_sessions
LEFT JOIN orders
	USING (website_session_id)
WHERE website_sessions.created_at BETWEEN '2012-04-01' AND '2013-04-05'
GROUP BY 1, 2;