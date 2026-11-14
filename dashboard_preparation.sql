CREATE OR REPLACE VIEW public.marketing_campaign_long AS

SELECT
    mc.id,
    mc.education,
    mc.income::NUMERIC(15,2) AS income,

    CASE
        WHEN mc.income < 30000 THEN 'Low Income'
        WHEN mc.income < 60000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,

    mc.marital_status,
    v.analysis_type,
    v.category,
    v.metric_value::NUMERIC(15,2) AS metric_value

FROM public.marketing_campaign mc

CROSS JOIN LATERAL (
    VALUES

    -- CAMPAIGN ACCEPTANCE
    ('Campaign', 'Latest Campaign',
        mc.response::NUMERIC(15,2)),

    ('Campaign', 'Campaign 1',
        mc.acceptedcmp1::NUMERIC(15,2)),

    ('Campaign', 'Campaign 2',
        mc.acceptedcmp2::NUMERIC(15,2)),

    ('Campaign', 'Campaign 3',
        mc.acceptedcmp3::NUMERIC(15,2)),

    ('Campaign', 'Campaign 4',
        mc.acceptedcmp4::NUMERIC(15,2)),

    ('Campaign', 'Campaign 5',
        mc.acceptedcmp5::NUMERIC(15,2)),

    -- PRODUCT SPENDING
    ('Product Spending', 'Wines',
        mc.mntwines::NUMERIC(15,2)),

    ('Product Spending', 'Fruits',
        mc.mntfruits::NUMERIC(15,2)),

    ('Product Spending', 'Meat',
        mc.mntmeatproducts::NUMERIC(15,2)),

    ('Product Spending', 'Fish',
        mc.mntfishproducts::NUMERIC(15,2)),

    ('Product Spending', 'Sweet',
        mc.mntsweetproducts::NUMERIC(15,2)),

    ('Product Spending', 'Gold',
        mc.mntgoldprods::NUMERIC(15,2)),

    -- PURCHASE CHANNEL
    ('Purchase Channel', 'Web',
        mc.numwebpurchases::NUMERIC(15,2)),

    ('Purchase Channel', 'Catalog',
        mc.numcatalogpurchases::NUMERIC(15,2)),

    ('Purchase Channel', 'Store',
        mc.numstorepurchases::NUMERIC(15,2))

) AS v(analysis_type, category, metric_value);


SELECT *
FROM marketing_campaign_long;

SELECT
    analysis_type,
    COUNT(*) AS total_rows,
    COUNT(DISTINCT id) AS total_customers
FROM marketing_campaign_long
GROUP BY analysis_type
ORDER BY analysis_type;

SELECT COUNT(*)
FROM marketing_campaign_long;