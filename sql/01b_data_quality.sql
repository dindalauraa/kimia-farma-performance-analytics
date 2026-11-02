-- ============================================================
-- File    : 01b_data_quality.sql
-- Purpose: Check duplicates, NULL values, ID matching, and price comparison
-- ============================================================

-- 1. Duplicate transaction_id
SELECT
  COUNT(*)                       AS total_rows,
  COUNT(DISTINCT transaction_id) AS unique_ids
FROM `rakamin-kf-analytics-511307.kimia_farma.kf_final_transaction`;

-- 2. NULL counts in key columns
SELECT
  COUNTIF(transaction_id IS NULL)      AS null_transaction_id,
  COUNTIF(branch_id IS NULL)           AS null_branch_id,
  COUNTIF(product_id IS NULL)          AS null_product_id,
  COUNTIF(price IS NULL)               AS null_price,
  COUNTIF(discount_percentage IS NULL) AS null_discount,
  COUNTIF(rating IS NULL)              AS null_rating,
  COUNTIF(customer_name IS NULL)       AS null_customer
FROM `rakamin-kf-analytics-511307.kimia_farma.kf_final_transaction`;

-- 3. Unique IDs in reference tables
SELECT branch_id, COUNT(*) AS n
FROM `rakamin-kf-analytics-511307.kimia_farma.kf_kantor_cabang`
GROUP BY branch_id HAVING COUNT(*) > 1;

SELECT product_id, COUNT(*) AS n
FROM `rakamin-kf-analytics-511307.kimia_farma.kf_product`
GROUP BY product_id HAVING COUNT(*) > 1;

-- 4. Transactions without matching branch/product records
SELECT
  COUNTIF(b.branch_id IS NULL)  AS missing_branch,
  COUNTIF(p.product_id IS NULL) AS missing_product
FROM `rakamin-kf-analytics-511307.kimia_farma.kf_final_transaction` AS t
LEFT JOIN `rakamin-kf-analytics-511307.kimia_farma.kf_kantor_cabang` AS b ON t.branch_id = b.branch_id
LEFT JOIN `rakamin-kf-analytics-511307.kimia_farma.kf_product` AS p ON t.product_id = p.product_id;

-- 5. Transaction price vs. product master price
SELECT
  COUNT(*)                    AS total,
  COUNTIF(t.price = p.price)  AS matching_prices,
  COUNTIF(t.price != p.price) AS mismatched_prices
FROM `rakamin-kf-analytics-511307.kimia_farma.kf_final_transaction` AS t
JOIN `rakamin-kf-analytics-511307.kimia_farma.kf_product` AS p ON t.product_id = p.product_id;

-- 6. Province list
SELECT provinsi, COUNT(*) AS branch_count
FROM `rakamin-kf-analytics-511307.kimia_farma.kf_kantor_cabang`
GROUP BY provinsi ORDER BY provinsi;