# **Marketing Campaign Performance & Customer Behavior Analysis**

## **Project Overview**

This project analyzes customer data to evaluate marketing campaign performance, customer spending patterns, purchasing behavior, and campaign response rates. The analysis aims to identify valuable customer segments, purchasing preferences, and factors associated with campaign acceptance to support more effective marketing strategies.

## **Project Details**

- **Tools:** PostgreSQL, DBeaver, SQL, Microsoft Excel, Google Looker Studio
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

### **2. Dashboard Data Preparation**

The original dataset was transformed into a long-format structure using SQL to support Google Looker Studio dashboard development.

- **Original Dataset:** 2,240 rows
- **Transformed Dataset:** 33,600 rows
- **Transformation Method:** PostgreSQL View (`CROSS JOIN LATERAL`)

The transformed dataset combines campaign performance, product spending, and purchase channel data into a single source for consistent demographic filtering.

*Note: The original dataset was used for SQL analysis, while the transformed dataset was used for dashboard visualization.*

### **3. Marketing Campaign Performance**

Evaluated customer acceptance rates across five previous campaigns and the latest campaign.

**Business Question:**

- How do customer acceptance rates differ across marketing campaigns?

**Key Findings:**

- Campaign 4 recorded the highest acceptance among previous campaigns, with 167 customers (7.46% acceptance rate).
- The latest campaign achieved a 14.91% response rate, outperforming the previous campaigns.

### **4. Customer Spending & Product Preferences**

Analyzed customer spending patterns across product categories, education levels, and marital status groups.

**Business Questions:**

- Which customer segments have the highest average spending?
- Which product categories contribute the most to customer spending?

**Key Findings:**

- Wines generated the highest spending of 680,816, contributing approximately 50.17% of total product spending.
- Meat Products ranked second with 373,968 in total spending.
- Customer spending patterns were also compared across education and marital status groups.

### **5. Purchase Channel & Customer Behavior**

Analyzed customer purchasing activity across Web, Catalog, and Store channels to identify purchasing preferences and behavioral patterns.

**Business Questions:**

- Which purchasing channels are most frequently used?
- How does online purchasing behavior relate to website visits?
- How does purchasing behavior differ by household composition?

**Key Findings:**

- Store purchases ranked first with 12,970 purchases, followed by Web (9,150) and Catalog (5,963).
- Customers with 10 monthly web visits recorded the highest average online purchases (5.33), based on 3 customers.
- Households with 0 children and 2 teenagers recorded the highest average Web (5.97) and Store (7.37) purchases.
- Households without children or teenagers recorded the highest average Catalog purchases (4.76).

### **6. Customer Characteristics & Campaign Response**

Analyzed campaign response patterns across customer income groups and education levels to identify demographic segments with higher campaign engagement.

**Business Questions:**

- How does customer income relate to marketing campaign response rates?
- How do campaign response rates differ across education levels?

**Key Findings:**

- High-income customers recorded the highest number of campaign responses (181).
- PhD customers recorded the highest number of campaign responses among education groups (101).
- Campaign response rates were also compared across income and education groups using Google Looker Studio.

## **Key Business Recommendations**

- Review successful campaign strategies to improve future campaign performance.
- Prioritize high-spending product categories, particularly Wines and Meat Products, when planning product promotions.
- Optimize marketing activities across purchasing channels, especially the Store channel.
- Develop targeted marketing campaigns for high-income and PhD customer segments, which recorded the highest campaign response rates in the dashboard analysis.
- Use customer purchasing behavior and demographic characteristics to support more relevant marketing strategies.

## **Dashboard**

An interactive Google Looker Studio dashboard was developed to visualize marketing campaign performance, customer spending, purchasing behavior, and customer response patterns.

**Dashboard Features:**

- Campaign acceptance and response rate comparison.
- Product category spending distribution.
- Purchase channel performance.
- Campaign response by income group and education level.
- Average product spending per customer by income group.
- Interactive demographic filters for Education, Marital Status, and Income Group.
- Campaign Selection filter for campaign-related visualizations.

**Interactive Dashboard:**

[**View Live Dashboard – Google Looker Studio**](https://datastudio.google.com/reporting/a91d5dbf-9be3-4d74-b919-e5e91cc6ef84)

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

- `marketing_campaign_dataset.csv` – Original dataset used for marketing campaign and customer behavior analysis.
-  `marketing_campaign_analysis.sql` – SQL queries used for data exploration, validation, and business analysis.
- `marketing_campaign_dashboard.jpg` – Dashboard preview.
- `README.md` – Project documentation.

## **Conclusion**

This project demonstrates the use of SQL to explore customer data, validate data quality, analyze marketing campaign performance, and understand customer purchasing behavior. The findings highlight differences in campaign responses, product spending, and purchasing preferences across customer groups. These insights can support more targeted marketing campaigns and improve data-driven decision-making.
