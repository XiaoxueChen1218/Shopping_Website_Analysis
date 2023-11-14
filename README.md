# Shopping_Website_Analysis
This is a business intelligence project using SQL to analyse the shopping website conversion funnel and customer behaviours. I find this project on Udemy just after finishing my SQL and A/B Testing courses. Here is the link: https://www.udemy.com/course/advanced-sql-mysql-for-analytics-business-intelligence/. It's a very suitable project combining the basic SQL queries and E-commerce domain knowledge for data analysis learner. A simple report of the results is as follows:
## Analysing Traffic Source
Firstly we need to analyse the paths to our website. We use different methods to lead our potential customers to our website and spend money. Each way belongs to different utm_source, utm_campaign and utm_content. We need to test the conversion rate and the traffic of each path. To understand the value of segments of paid traffic and the optimize marketing budget(*Bid Opitimization*).

Using SQL queries, we know that gsearch(source) and nonbrand(campaign) combination is the bulk of the website sessions coming from, however, the session-to-order conversion rate is only 2.8%. 

We also explore the sessions for desktop users and mobile users. The result shows that the desktop users' sessions to the website and the conversion rate to payment is 5 times of that of mobile users'.
## Analysing for Channel Management
Analysing a portfolio of marketing channels is about bidding efficiently and using data to maximize the effectiveness of your marketing budget. We found that desktop + gsearch obtained the most sessions(3011) and the highest conversion rate(0.045). But the mobile + bsearch obtained the least sessions(130) and the highest conversion rate(0.008) in a certain time period. We need take actions to solve this underperformance.

We also analyse the unpaid traffic like organic search(direct type in) and compare it with the paid traffic to test the brand effect. And it seems that not only are our brand, direct, and organic volumes growing, but they are growing as a percentage of our paid traffic volume.
## Analysing Website Performance
To understand the customer behaviour on our website, we built a funnel: landing page -> products -> certain_product -> cart -> shipping -> billing -> thankyou. We have two landing pages in the dataset. We find the lander-1 bounce rate is 0.58 and lander-2 bounce rate is 0.53. Therefore, lander-2 performed better than lander-1. And for the conversion funnel, the CVRs are: 0.47 -> 0.74 -> 0.43 -> 0.67 -> 0.79 -> 0.43. It's clear that we should focus on the lander, certain_product and the billing page, which have the lowest click rates. We can make a new version page and run a A/B Test to optimize the *pain points* where users are abandoning.
## Seasonality
Analyzing business patterns is about generating insights to help you maximize efficiency and anticipate future trends.
After generating the orders, revenue, pageviews and etc. trends, we found that we grew fairly steadily all year, and saw significant volume around the *holiday* months (especially the weeks of Black Friday and Cyber Monday).
## Product Analysis
Product-focused website analysis is about learning how customers interact with each of your products, and how well each product converts customers.
And Cross-sell analysis is about understanding which products users are most likely to purchase together, and offering smart product recommendations. We found that people are likely to buy product1 and product3 simutanously. The combined selling method helps increase the orders about 10.9%.

Lastly, we calculate the refund rate of each product monthly.
Looks like the refund rates for the certain_product did go down after the initial improvements in September 2013, but refund rates were terrible in August and September, as expected (13-14%).After changing the supplier on Sep.16, 2014, the new supplier is doing much better so far.


