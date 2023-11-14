SELECT
	MIN(DATE(created_at)) AS week_start_date,
    COUNT(DISTINCT CASE WHEN utm_source = 'gsearch' THEN website_session_id ELSE 0 END) AS gsearch_sessions,
    COUNT(DISTINCT CASE WHEN utm_source = 'bsearch' THEN website_session_id ELSE 0 END) AS bsearch_sessions
FROM website_sessions
WHERE created_at BETWEEN '2012-08-22' AND '2012-11-29'
	AND utm_campaign = 'nonbrand'
GROUP BY WEEK(created_at);

SELECT
	utm_source, 
	COUNT(DISTINCT website_session_id) AS sessions,
    COUNT(DISTINCT CASE WHEN device_type = 'mobile' THEN website_session_id ELSE 0 END) AS mobile_sessions,
    COUNT(DISTINCT CASE WHEN device_type = 'mobile' THEN website_session_id ELSE 0 END) / 
		COUNT(DISTINCT website_session_id) AS pct_mobile
FROM website_sessions
WHERE created_at BETWEEN '2012-08-22' AND '2012-11-30'
	AND utm_campaign = 'nonbrand'
GROUP BY 1;

SELECT
	device_type,
    utm_source,
    COUNT(website_sessions.website_session_id) AS sessions,
    COUNT(order_id) AS orders,
    COUNT(order_id) / COUNT(website_sessions.website_session_id) AS conv_rate
FROM website_sessions
LEFT JOIN orders
	USING (website_session_id)
WHERE website_sessions.created_at BETWEEN '2012-08-22' AND '2012-09-18'
	AND utm_campaign = 'nonbrand'
GROUP BY 1, 2;

-- channel portfolio optimization
-- pivot
SELECT
	MIN(DATE(created_at)) AS week_start_date,
    COUNT(DISTINCT CASE WHEN utm_source = 'gsearch' AND device_type = 'desktop'
			THEN website_session_id ELSE 0 END) AS g_dtop_sessions,
	COUNT(DISTINCT CASE WHEN utm_source = 'bsearch' AND device_type = 'desktop'
			THEN website_session_id ELSE 0 END) AS b_dtop_sessions,
	COUNT(DISTINCT CASE WHEN utm_source = 'bsearch' AND device_type = 'desktop'
			THEN website_session_id ELSE 0 END) / 
            COUNT(DISTINCT CASE WHEN utm_source = 'gsearch' AND device_type = 'desktop'
			THEN website_session_id ELSE 0 END) AS b_pct_of_g_dtop,
	COUNT(DISTINCT CASE WHEN utm_source = 'gsearch' AND device_type = 'mobile'
			THEN website_session_id ELSE 0 END) AS g_mob_sessions,
	COUNT(DISTINCT CASE WHEN utm_source = 'bsearch' AND device_type = 'mobile'
			THEN website_session_id ELSE 0 END) AS b_mob_sessions,
	COUNT(DISTINCT CASE WHEN utm_source = 'bsearch' AND device_type = 'mobile'
			THEN website_session_id ELSE 0 END) / 
            COUNT(DISTINCT CASE WHEN utm_source = 'gsearch' AND device_type = 'mobile'
			THEN website_session_id ELSE 0 END) AS b_pct_if_g_mob
FROM website_sessions
WHERE created_at BETWEEN '2012-11-04' AND '2012-12-22'
	AND utm_campaign = 'nonbrand'
GROUP BY WEEK(created_at);

-- brand effect
SELECT
	YEAR(created_at) AS yr,
    MONTH(created_at) AS mo,
    COUNT(DISTINCT CASE WHEN utm_campaign = 'nonbrand' THEN website_session_id ELSE 0 END) AS nonbrand,
    COUNT(DISTINCT CASE WHEN utm_campaign = 'brand' THEN website_session_id ELSE 0 END) AS brand,
    COUNT(DISTINCT CASE WHEN utm_campaign = 'brand' THEN website_session_id ELSE 0 END) / 
		COUNT(DISTINCT CASE WHEN utm_campaign = 'nonbrand' THEN website_session_id ELSE 0 END) AS brand_pct_of_nonbrand,
	COUNT(DISTINCT CASE WHEN http_referer IS NULL THEN website_session_id ELSE 0 END) AS direct,
    COUNT(DISTINCT CASE WHEN http_referer IS NULL THEN website_session_id ELSE 0 END) / 
		COUNT(DISTINCT CASE WHEN utm_campaign = 'nonbrand' THEN website_session_id ELSE 0 END) AS direct_pct_of_nonbrand,
	COUNT(DISTINCT CASE WHEN http_referer IN ('https://www.gsearch.com', 'https://www.bsearch.com') AND utm_campaign IS NULL AND utm_source IS NULL THEN website_session_id ELSE 0 END) AS organic,
    COUNT(DISTINCT CASE WHEN http_referer IN ('https://www.gsearch.com', 'https://www.bsearch.com') AND utm_campaign IS NULL AND utm_source IS NULL THEN website_session_id ELSE 0 END) / 
		COUNT(DISTINCT CASE WHEN utm_campaign = 'nonbrand' THEN website_session_id ELSE 0 END) AS organic_pct_of_nonbrand
FROM website_sessions
WHERE created_at < '2012-12-23'
GROUP BY 1, 2;

SELECT
	YEAR(website_sessions.created_at) AS yr,
    MONTH(website_sessions.created_at) AS mo,
    COUNT(website_sessions.website_session_id) AS sessions,
    COUNT(order_id) AS orders
FROM website_sessions
LEFT JOIN orders
	USING (website_session_id)
WHERE YEAR(website_sessions.created_at) = 2012
GROUP BY 1, 2;

SELECT 
	MIN(DATE(website_sessions.created_at)) AS week_start_date,
    COUNT(website_sessions.website_session_id) AS sessions,
    COUNT(order_id) AS orders
FROM website_sessions
LEFT JOIN orders
	USING (website_session_id)
WHERE YEAR(website_sessions.created_at) = 2012
GROUP BY WEEK(website_sessions.created_at);

SELECT
	hr,
	AVG(CASE WHEN wkday = 0 THEN sessions ELSE NULL END) AS mon,
	AVG(CASE WHEN wkday = 1 THEN sessions ELSE NULL END) AS tue,
	AVG(CASE WHEN wkday = 2 THEN sessions ELSE NULL END) AS wed,
	AVG(CASE WHEN wkday = 3 THEN sessions ELSE NULL END) AS thu,
	AVG(CASE WHEN wkday = 4 THEN sessions ELSE NULL END) AS fri,
	AVG(CASE WHEN wkday = 5 THEN sessions ELSE NULL END) AS sat,
	AVG(CASE WHEN wkday = 6 THEN sessions ELSE NULL END) AS sun
FROM(
	SELECT
		DATE(created_at) AS date,
		WEEKDAY(created_at) AS wkday,
		HOUR(created_at) AS hr,
        COUNT(website_session_id) AS sessions
	FROM website_sessions
	WHERE created_at BETWEEN '2012-09-15' AND '2012-11-15'
    GROUP BY 1, 2, 3
) AS wkday_hr
GROUP BY 1;










