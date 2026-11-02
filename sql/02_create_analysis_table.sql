
-- ============================================================
-- File    : 02_create_analysis_table.sql
-- Purpose : Build the analysis table by integrating source data
-- Output  : kimia_farma.tabel_analisa
-- ============================================================

CREATE OR REPLACE TABLE `rakamin-kf-analytics-511307.kimia_farma.tabel_analisa` AS

-- Step 1. Data integration
WITH joined AS (
  SELECT
    t.transaction_id,
    t.date,
    t.branch_id,
    b.branch_name,
    b.kota,
    b.provinsi,
    b.rating AS rating_cabang,
    t.customer_name,
    t.product_id,
    p.product_name,
    t.price AS actual_price,
    t.discount_percentage,
    t.rating AS rating_transaksi
  FROM `rakamin-kf-analytics-511307.kimia_farma.kf_final_transaction` AS t
  LEFT JOIN `rakamin-kf-analytics-511307.kimia_farma.kf_kantor_cabang` AS b
    ON t.branch_id = b.branch_id
  LEFT JOIN `rakamin-kf-analytics-511307.kimia_farma.kf_product` AS p
    ON t.product_id = p.product_id
),

-- Step 2. Metric calculation
calculated AS (
  SELECT
    *,
    CASE
      WHEN actual_price <= 50000  THEN 0.10
      WHEN actual_price <= 100000 THEN 0.15
      WHEN actual_price <= 300000 THEN 0.20
      WHEN actual_price <= 500000 THEN 0.25
      ELSE 0.30
    END AS persentase_gross_laba,
    actual_price * (1 - discount_percentage) AS nett_sales
  FROM joined
)

-- Step 3. Final analysis table
SELECT
  transaction_id,
  date,
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang,
  customer_name,
  product_id,
  product_name,
  actual_price,
  discount_percentage,
  persentase_gross_laba,
  nett_sales,
  (actual_price * persentase_gross_laba)
    - (actual_price - nett_sales) AS nett_profit,
  rating_transaksi
FROM calculated;