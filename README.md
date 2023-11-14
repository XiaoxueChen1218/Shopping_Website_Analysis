# Shopping_Website_Analysis
This is a business intelligence project using SQL to analyse the shopping website conversion funnel and customer behaviours. I find this project on Udemy just after finishing my SQL and A/B Testing courses. Here is the link: https://www.udemy.com/course/advanced-sql-mysql-for-analytics-business-intelligence/. It's a very suitable project combining the basic SQL queries and E-commerce domain knowledge for data analysis learner. A simple report of the results is as follows:
## Analysing Traffic Source
Firstly we need to analyse the paths to our website. We use different methods to lead our potential customers to our website and spend money. Each way belongs to different utm_source, utm_campaign and utm_content. We need to test the conversion rate and the traffic of each path. To understand the value of segments of paid traffic and the optimize marketing budget(*Bid Opitimization*).

Using SQL queries, we know that gsearch(source) and nonbrand(campaign) combination is the bulk of the website sessions coming from, however, the session-to-order conversion rate is only 2.8%. 

We also explore the sessions for desktop users and mobile users. The result shows that the desktop users' sessions to the website and the conversion rate to payment is 5 times of that of mobile users'.
## Analysing Website Performance
To understand the customer behaviour on our website, we built a funnel: landing page -> products -> certain_product -> cart -> shipping -> billing -> thankyou. We have two landing pages in the dataset. We find the lander-1 bounce rate is 0.58 and lander-2 bounce rate is 0.53. Therefore, lander-2 performed better than lander-1. And for the conversion funnel, the CVRs are: 0.47 -> 0.74 -> 0.43 -> 0.67 -> 0.79 -> 0.43. It's clear that we should focus on the lander, certain_product and the billing page, which have the lowest click rates. We can make a new version page and run a A/B Test to optimize the pain points where users are abandoning.

