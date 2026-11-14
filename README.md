# Giftora-Customer-Analytics
An end-to-end customer analytics project for Giftora, a fictional gifting company, built with MySQL, Python and Power BI. It uses RFM segmentation to find the customers who bring the most revenue and the ones about to leave.

📌 Project Overview

Giftora is a fictional gifting company that sells to customers in several countries. This project analyses its customer and sales data to answer three things:

❗Business Problem

Who are our most valuable customers, and how much revenue do they actually contribute?
Which customers have gone quiet and are at risk of churning?
How does customer value and retention trend across time, by month, quarter, and year?
How does customer value and churn differ across geographic markets?
What specific, concrete actions should the business take for each customer segment?

The data is cleaned and scored with MySQL and Python, then presented in an interactive two-page Power BI dashboard:

🗂️ Data Source
The project uses the Online Retail II dataset from the UCI Machine Learning Repository, donated by Daqing Chen. It is a real, anonymized transactional dataset from a UK-based, non-store online retailer that sells all-occasion giftware. It covers December 2009 to December 2011 and holds 1,067,371 raw transaction rows across two sheets. The dataset is licensed under Creative Commons Attribution 4.0 International (CC BY 4.0). "Giftora" is a fictional brand name used for this portfolio project, while the data itself is real.

🛠️ Tools and Tech Stack
Tool	Purpose in this project
MySQL Server / MySQL Workbench	Data import, cleaning, deduplication, and exploratory querying on the full 1M+ row dataset
Python (pandas)	RFM calculation, customer scoring, segmentation logic, and churn flagging
Jupyter Notebook	Interactive development environment for the Python analysis
Power BI Desktop	Two-page interactive dashboard: Business Overview and RFM Analysis
DAX	Measures for customer counts, revenue totals, churn percentage, and average customer value

💡 Core Concepts Demonstrated

The project demonstrates RFM analysis, where each customer is scored on Recency (how recently they bought), Frequency (how often they buy) and Monetary value (how much they spend). These scores are used for customer segmentation, which sorts customers into six groups: Champions, Loyal Customers, At Risk, Potential / Other Customers, Lost Customers and New / Promising Customers.

It also covers churn analysis, tracking the share of customers who stopped buying by month, quarter and year, and customer value analysis, comparing average revenue per customer across segments and countries. On the Power BI side, it uses DAX measures for customers, revenue, churn and customer value, and interactive dashboard design with slicers for Month, Quarter, Year, Country and Segment, a "Clear all slicers" button and page navigation. Bookmarks and the Selection pane let one page switch between Customer and Revenue views, and the RFM page switches between Segment and Country views. The design uses rounded cards, shadows, a consistent colour theme and a custom logo.


🔄Project Workflow
Step 1 — Business Requirements Document. Defined a general scope, business questions before any data work began.

Step 2 — SQL, Data Cleaning and Exploration. Imported both raw sheets into MYSQL Server, corrected data types, resolved a mixed date format issue affecting over half the dataset, removed 32,907 exact duplicate rows, and validated row counts at every step against the published UCI total.

Step 3 — Python, RFM Segmentation. Loaded the cleaned data into pandas, calculated Recency, Frequency, and Monetary value per customer, scored each customer on a 1 to 5 scale per dimension, and assigned each of the 5,881 customers to one of six segments. Added a 90 day churn flag.

Step 4 — Power BI, Dashboard Build. The final scored table was loaded into Power BI, and DAX measures were created for Total Customers, Total Revenue, Churned % and Avg Customer Value. Two interactive dashboards were built: Business Overview, which tracks customers and revenue with a Customer / Revenue toggle, and RFM Analysis, which shows segment and country performance and churn trends with a Segment / Country toggle. Both pages share slicers, a "Clear all slicers" button and custom styling with the Giftora logo.

🔍 Project Walkthrough

🧮 Sample SQL
  ![Sample SQL](Images/sql sample.png)
   
🐍 Sample Python
  ![Sample Python](Images/python sample.png)

📊 Dashboard Screenshots

<img src="Images/customer_BO.png" width="600" alt="Business Overview - Customer view">
     Business Overview by  Customer 

![Business Overview - Revenue view](Images/revenue_BO.png)
     Business Overview by Revenue

![RFM Analysis - Segment view](Images/segment_RFM.png)
     RFM Analysis by Segment

![RFM Analysis - Country view](Images/country_RFM.png)
     RFM Analysis by Country
