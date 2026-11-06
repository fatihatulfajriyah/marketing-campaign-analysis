/*
=========================================================
PROJECT: MARKETING CAMPAIGN PERFORMANCE & CUSTOMER BEHAVIOR ANALYSIS
TOOLS: PostgreSQL, DBeaver, SQL
DATABASE: marketing_analysis
SCHEMA: public
TABLE: marketing_campaign

OBJECTIVE:
Analyze customer purchasing behavior, evaluate marketing campaign performance,
identify customer spending patterns, and generate data-driven insights
to support marketing strategy and customer engagement.
=========================================================
*/


/* =====================================================
   1. DATA OVERVIEW
   ===================================================== */

-- 1.1 Retrieve sample records
SELECT *
FROM marketing_campaign
LIMIT 10;


-- 1.2 Check Total Records and Unique Customers
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT id) AS unique_customers
FROM marketing_campaign;
-- Result:
-- The dataset contains 2,240 records, representing 2,240 unique customers.



/* =====================================================
   2. DATA VALIDATION
   ===================================================== */

-- 2.1 Check missing values in key columns
SELECT
    COUNT(*) FILTER (
        WHERE income IS NULL
    ) AS missing_income,

    COUNT(*) FILTER (
        WHERE dt_customer IS NULL
    ) AS missing_customer_date,

    COUNT(*) FILTER (
        WHERE response IS NULL
    ) AS missing_response,

    COUNT(*) AS total_records
FROM marketing_campaign;
-- Result:
-- Identified 24 missing values in the income column.


-- 2.2 Check Duplicate Customer IDs
SELECT
    id,
    COUNT(*) AS duplicate_count
FROM marketing_campaign
GROUP BY id
HAVING COUNT(*) > 1;
-- Result:
-- No duplicate customer IDs were found.


-- 2.3 Explore Customer Income
SELECT
    MIN(income) AS minimum_income,
    MAX(income) AS maximum_income,
    ROUND(AVG(income), 2) AS average_income,
    COUNT(income) AS valid_income_records
FROM marketing_campaign;
-- Result:
-- Analyzed customer income, identifying an average income of 52,247.25 across 2,216 valid records.


-- 2.4 Check Potentially Invalid Customer Data
SELECT
    COUNT(*) FILTER (
        WHERE income < 0
    ) AS negative_income,

    COUNT(*) FILTER (
        WHERE year_birth < 1900
           OR year_birth > 2026
    ) AS unusual_birth_year
FROM marketing_campaign;
-- Result:
-- Identified 2 unusual birth-year records and found no negative income values.



/* =====================================================
   3. MARKETING CAMPAIGN PERFORMANCE
   ===================================================== */

-- 3.1 Campaign Acceptance Rate Comparison
-- Business Question: How do customer acceptance rates differ across marketing campaigns?
SELECT
    campaign,
    accepted_customers,
    ROUND(
        accepted_customers * 100.0 / total_customers,
        2
    ) AS acceptance_rate_pct
FROM (
    SELECT
        'Campaign 1' AS campaign,
        SUM(acceptedcmp1) AS accepted_customers,
        COUNT(*) AS total_customers
    FROM marketing_campaign

    UNION ALL

    SELECT
        'Campaign 2',
        SUM(acceptedcmp2),
        COUNT(*)
    FROM marketing_campaign

    UNION ALL

    SELECT
        'Campaign 3',
        SUM(acceptedcmp3),
        COUNT(*)
    FROM marketing_campaign

    UNION ALL

    SELECT
        'Campaign 4',
        SUM(acceptedcmp4),
        COUNT(*)
    FROM marketing_campaign

    UNION ALL

    SELECT
        'Campaign 5',
        SUM(acceptedcmp5),
        COUNT(*)
    FROM marketing_campaign

    UNION ALL

    SELECT
        'Latest Campaign',
        SUM(response),
        COUNT(*)
    FROM marketing_campaign
) AS campaign_results
ORDER BY acceptance_rate_pct DESC;
-- Result:
-- Campaign 4 recorded the highest acceptance,
-- with 167 customers (7.46% acceptance rate).



/* =====================================================
   4. CUSTOMER SPENDING & PRODUCT PREFERENCES
   ===================================================== */

-- 4.1 Average Spending by Customer Segment
-- Business Question: Which customer segments have the highest average spending?
WITH customer_spending AS (
    SELECT
        id,
        education,
        marital_status,

        COALESCE(mntwines, 0)
        + COALESCE(mntfruits, 0)
        + COALESCE(mntmeatproducts, 0)
        + COALESCE(mntfishproducts, 0)
        + COALESCE(mntsweetproducts, 0)
        + COALESCE(mntgoldprods, 0)
        AS total_spending

    FROM marketing_campaign
)

SELECT
    education,
    marital_status,
    COUNT(*) AS total_customers,

    ROUND(
        AVG(total_spending),
        2
    ) AS avg_spending,

    SUM(total_spending) AS total_segment_spending

FROM customer_spending

GROUP BY
    education,
    marital_status

ORDER BY avg_spending DESC;
-- Result:
-- Graduation customers with Absurd marital status recorded
-- the highest average spending of 1,216, based on 1 customer.


-- 4.2 Product Category Spending Contribution
-- Business Question: Which product categories contribute the most to customer spending?
WITH product_spending AS (
    SELECT 'Wines' AS product_category,
           SUM(mntwines) AS total_spending
    FROM marketing_campaign

    UNION ALL

    SELECT 'Fruits',
           SUM(mntfruits)
    FROM marketing_campaign

    UNION ALL

    SELECT 'Meat Products',
           SUM(mntmeatproducts)
    FROM marketing_campaign

    UNION ALL

    SELECT 'Fish Products',
           SUM(mntfishproducts)
    FROM marketing_campaign

    UNION ALL

    SELECT 'Sweet Products',
           SUM(mntsweetproducts)
    FROM marketing_campaign

    UNION ALL

    SELECT 'Gold Products',
           SUM(mntgoldprods)
    FROM marketing_campaign
)

SELECT
    product_category,
    total_spending,

    ROUND(
        total_spending * 100.0
        / SUM(total_spending) OVER (),
        2
    ) AS spending_contribution_pct

FROM product_spending
ORDER BY total_spending DESC;
-- Result:
-- Wines generated the highest spending of 680,816,
-- contributing approximately 50.17% of total spending.



/* =====================================================
   5. PURCHASE CHANNEL & CUSTOMER BEHAVIOR
   ===================================================== */

-- 5.1 Purchase Channel Performance
-- Business Question: Which purchasing channels are most frequently used?
SELECT
    channel,
    total_purchases

FROM (
    SELECT
        'Web' AS channel,
        SUM(numwebpurchases) AS total_purchases
    FROM marketing_campaign

    UNION ALL

    SELECT
        'Catalog',
        SUM(numcatalogpurchases)
    FROM marketing_campaign

    UNION ALL

    SELECT
        'Store',
        SUM(numstorepurchases)
    FROM marketing_campaign
) AS channel_analysis

ORDER BY total_purchases DESC;
-- Result:
-- Store purchases ranked first with 12,970 purchases,
-- followed by Web (9,150) and Catalog (5,963).


-- 5.2 Web Visits and Online Purchase Behavior
-- Business Question: How does online purchasing behavior relate to website visits?
SELECT
    numwebvisitsmonth,
    COUNT(*) AS total_customers,

    ROUND(
        AVG(numwebpurchases),
        2
    ) AS avg_web_purchases

FROM marketing_campaign
GROUP BY numwebvisitsmonth
ORDER BY numwebvisitsmonth;
-- Result:
-- Customers with 10 monthly web visits had the highest
-- average online purchases (5.33), based on 3 customers.

-- 5.3 Purchase Behavior by Household Composition
-- Business Question: How does purchasing behavior differ by household composition?
SELECT
    kidhome,
    teenhome,
    COUNT(*) AS total_customers,

    ROUND(
        AVG(numwebpurchases),
        2
    ) AS avg_web_purchases,

    ROUND(
        AVG(numcatalogpurchases),
        2
    ) AS avg_catalog_purchases,

    ROUND(
        AVG(numstorepurchases),
        2
    ) AS avg_store_purchases

FROM marketing_campaign

GROUP BY
    kidhome,
    teenhome

ORDER BY total_customers DESC;
-- Result:
-- Households with 0 children and 2 teenagers recorded
-- the highest average Web (5.97) and Store (7.37) purchases,
-- while households without children or teenagers led Catalog purchases (4.76).



/* =====================================================
   6. CUSTOMER CHARACTERISTICS & CAMPAIGN RESPONSE
   ===================================================== */

-- 6.1 Campaign Response by Income Group
-- Business Question: How does customer income relate to marketing campaign response rates?
WITH customer_segments AS (
    SELECT
        CASE
            WHEN income < 30000 THEN 'Low Income'
            WHEN income < 60000 THEN 'Medium Income'
            ELSE 'High Income'
        END AS income_group,
        response
    FROM marketing_campaign
    WHERE income IS NOT NULL
)

SELECT
    income_group,
    COUNT(*) AS total_customers,
    SUM(response) AS accepted_responses,

    ROUND(
        AVG(response) * 100.0,
        2
    ) AS response_rate_pct

FROM customer_segments
GROUP BY income_group
ORDER BY response_rate_pct DESC;
-- Result:
-- High Income recorded the highest response rate
-- at 21,5%, with 181 accepted responses.


-- 6.2 Campaign Response by Education
-- Business Question: How do campaign response rates differ across education levels?
SELECT
    education,
    COUNT(*) AS total_customers,
    SUM(response) AS accepted_responses,

    ROUND(
        AVG(response) * 100.0,
        2
    ) AS response_rate_pct

FROM marketing_campaign
WHERE response IS NOT NULL
GROUP BY education
ORDER BY response_rate_pct DESC;
-- Result:
-- PhD recorded the highest response rate
-- at 20,78%, with 101 accepted responses.


/* =====================================================
   END OF ANALYSIS
   ===================================================== */