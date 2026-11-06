# **Marketing Campaign Performance & Customer Behavior Analysis**

## **Project Overview**

This project analyzes customer data to evaluate marketing campaign performance, customer spending patterns, purchasing behavior, and campaign response rates. The analysis aims to identify valuable customer segments, purchasing preferences, and factors associated with campaign acceptance to support more effective marketing strategies.

## **Project Details**

- **Tools:** PostgreSQL, DBeaver, SQL
- **Database:** `marketing_analysis`
- **Schema:** `public`
- **Table:** `marketing_campaign`
- **Dataset:** Marketing Campaign Dataset
- **Total Records:** 2,240
- **Unique Customers:** 2,240

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

**Key Finding:**

- Campaign 4 recorded the highest acceptance, with 167 customers (7.46% acceptance rate).

### **3. Customer Spending & Product Preferences**

Analyzed customer spending patterns across product categories, education levels, and marital status groups.

**Business Questions:**

- Which customer segments have the highest average spending?
- Which product categories contribute the most to customer spending?

**Key Findings:**

- Wines generated the highest spending of 680,816, contributing approximately 50.17% of total product spending.
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
- Households with 0 children and 2 teenagers recorded the highest average Web (5.97) and Store (7.37) purchases, while households without children or teenagers led Catalog purchases (4.76).

### **5. Customer Characteristics & Campaign Response**

Analyzed campaign response rates across customer income groups and education levels.

**Business Questions:**

- How does customer income relate to marketing campaign response rates?
- How do campaign response rates differ across education levels?

**Key Findings:**

- High Income customers recorded the highest response rate at 21.50%, with 181 accepted responses.
- PhD customers recorded the highest response rate at 20.78%, with 101 accepted responses.

## **Key Business Recommendations**

- Review successful campaign strategies to improve future campaign performance.
- Prioritize high-spending product categories, particularly Wines, when planning product promotions.
- Optimize marketing activities across purchasing channels, especially the Store channel.
- Develop targeted campaigns for customer groups with higher response rates.
- Use customer purchasing behavior and demographic characteristics to support more relevant marketing strategies.

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

- `marketing_campaign_datatset.csv` – Dataset used for marketing campaign analysis.
- `marketing_campaign_analysis.sql` – SQL queries used for data exploration, validation, and business analysis.
- `marketing_campaign_dashboard.jpg` – Dashboard preview.
- `README.md` – Project documentation.

## **Conclusion**

The analysis identified differences in campaign acceptance, customer spending, and purchasing behavior across customer groups. These findings provide insights that can support more targeted marketing campaigns, improve customer engagement, and strengthen marketing decision-making.
