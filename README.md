# **Marketing Campaign Performance & Customer Behavior Analysis**

## **Project Overview**

This project analyzes customer data to evaluate marketing campaign performance, customer spending patterns, purchasing behavior, and campaign response rates. The analysis aims to identify valuable customer segments, purchasing preferences, and factors associated with campaign acceptance to support more effective marketing strategies.

## **Project Details**

- **Tools:** PostgreSQL, DBeaver, SQL, Microsoft Excel, Google Data Studio
- **Database:** `marketing_analysis`
- **Schema:** `public`
- **Table:** `marketing_campaign`
- **Dataset:** Marketing Campaign Dataset
- **Total Records:** 2,240
- **Unique Customers:** 2,240
- **Analysis Period:** 2012–2014

## **Objectives**

- Evaluate marketing campaign acceptance rates.
- Identify customer segments with the highest spending.
- Analyze customer purchasing behavior across different channels.
- Identify customer characteristics associated with campaign acceptance.
- Generate data-driven recommendations to improve marketing effectiveness.

## **Analysis Process**

### **1. Data Overview & Validation**

Performed initial data exploration and validation to assess dataset completeness, consistency, and reliability.

**Key Findings:**

- 2,240 records representing 2,240 unique customers.
- Identified 24 missing values in the income column.
- No duplicate customer IDs were found.
- Average customer income was 52,247.25 across 2,216 valid records.
- Identified 2 unusual birth-year records and no negative income values.

### **2. Marketing Campaign Performance**

Evaluated customer acceptance rates across five previous campaigns and the latest campaign.

**Business Question:**

- How do customer acceptance rates differ across marketing campaigns?

**Key Findings:**

- Campaign 4 recorded the highest acceptance among previous campaigns, with 167 customers (7.46% acceptance rate).
- The latest campaign achieved a 14.91% response rate, as shown in the dashboard.

### **3. Customer Spending & Product Preferences**

Analyzed customer spending patterns across product categories, education levels, and marital status groups.

**Business Questions:**

- Which customer segments have the highest average spending?
- Which product categories contribute the most to customer spending?

**Key Findings:**

- Wines generated the highest spending of 680,816, contributing approximately 50.17% of total product spending.
- Meat Products ranked second with 373,968 in total spending.
- Customer spending patterns were also compared across education and marital status groups.

### **4. Purchase Channel & Customer Behavior**

Examined purchasing activity across Web, Catalog, and Store channels, including customer behavior based on website visits and household composition.

**Business Questions:**

- Which purchasing channels are most frequently used?
- How does online purchasing behavior relate to website visits?
- How does purchasing behavior differ by household composition?

**Key Findings:**

- Store purchases ranked first with 12,970 purchases, followed by Web (9,150) and Catalog (5,963).
- Customers with 10 monthly web visits recorded the highest average online purchases (5.33), based on 3 customers.
- Households with 0 children and 2 teenagers recorded the highest average Web (5.97) and Store (7.37) purchases.
- Households without children or teenagers recorded the highest average Catalog purchases (4.76).

### **5. Customer Characteristics & Campaign Response**

Analyzed campaign response rates across customer income groups and education levels.

**Business Questions:**

- How does customer income relate to marketing campaign response rates?
- How do campaign response rates differ across education levels?

**Key Findings:**

- High Income customers recorded the highest response, with 181 accepted customers.
- PhD customers recorded the highest response among education groups, with 101 accepted customers.
- Campaign responses were also compared across Medium Income, Low Income, Graduation, Master, 2n Cycle, and Basic education groups.

## **Key Business Recommendations**

- Review successful campaign strategies to improve future campaign performance.
- Prioritize high-spending product categories, particularly Wines and Meat Products, when planning product promotions.
- Optimize marketing activities across purchasing channels, especially the Store channel.
- Develop targeted campaigns for customer groups with higher response rates, particularly High Income and PhD customers.
- Use customer purchasing behavior and demographic characteristics to support more relevant marketing strategies.

## **Dashboard**

An interactive Google Data Studio dashboard was developed to visualize marketing campaign performance, customer spending, purchasing behavior, and customer response patterns.

**Dashboard Features:**

- Campaign acceptance and response rate comparison.
- Product category spending distribution.
- Purchase channel performance.
- Campaign response by income group and education level.
- Household purchasing behavior.
- Interactive filters for Education, Marital Status, Income Group, and Campaign Selection.

**Interactive Dashboard:**

[**View Live Dashboard – Google Data Studio**](https://datastudio.google.com/reporting/a91d5dbf-9be3-4d74-b919-e5e91cc6ef84)

## **SQL Skills Applied**

- Data Exploration
- Data Validation
- Aggregate Functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`)
- Conditional Aggregation (`FILTER`)
- Data Grouping and Sorting (`GROUP BY`, `ORDER BY`)
- Common Table Expressions (CTE)
- Subqueries
- `UNION ALL`
- `CASE WHEN`
- Window Functions
- Data Segmentation
- Percentage and Response Rate Calculations
- Customer Behavior Analysis

## **Project Files**

- `marketing_campaign_dataset.xlsx` – Dataset used for retail sales analysis.
-  `marketing_campaign_analysis.sql` – SQL queries used for data exploration, validation, and business analysis.
- `marketing_campaign_dashboard.jpg` – Dashboard preview.
- `README.md` – Project documentation, including objectives, analysis process, key findings, and business recommendations.

## **Conclusion**

This project demonstrates the use of SQL to explore customer data, validate data quality, analyze marketing campaign performance, and understand customer purchasing behavior. The findings highlight differences in campaign responses, product spending, and purchasing preferences across customer groups. These insights can support more targeted marketing campaigns and improve data-driven decision-making.
