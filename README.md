# 💊 Kimia Farma Business Performance Analytics (2020–2023)

**Rakamin Academy | Business Analytics Project**

![Kimia Farma Performance Dashboard](documentation/dashboard_overview.png)

## 📌 Project Overview

An analysis of Kimia Farma's business performance from 2020 to 2023, focusing on sales, estimated profitability, provincial contributions, and customer ratings.

Using SQL in Google BigQuery, four business datasets were prepared and analyzed to identify performance patterns and potential areas for improvement. The findings are presented through an interactive Looker Studio dashboard.

## 🎯 Business Objective

To evaluate Kimia Farma's business performance from 2020 to 2023 and identify opportunities to improve sales performance, profitability, regional performance, and customer experience.

## 🗂️ Dataset & Tools

| Detail | Description |
|---|---|
| Data source | Kimia Farma business datasets |
| Study period | 2020–2023 |
| Source tables | 4 datasets |
| Total transactions | 672,458 |
| Data processing | Google BigQuery (SQL) |
| Visualization | Looker Studio |

**Source datasets:**
- `kf_final_transaction` – Transaction details, prices, discounts, and ratings.
- `kf_inventory` – Inventory and stock information by branch and product.
- `kf_kantor_cabang` – Branch details, locations, and ratings.
- `kf_product` – Product details, categories, and prices.

## ⚙️ Data Preparation & Analysis

The analysis table, `tabel_analisa`, was created in BigQuery through the following steps:

1. **Data Integration:** Joined transaction records with branch and product information using `LEFT JOIN`.
2. **Data Transformation:** Calculated net sales after discounts and assigned gross profit rates based on transaction price tiers.
3. **Estimated Profit Calculation:** Derived estimated net profit by deducting discount amounts from estimated gross profit.
4. **Data Validation:** Checked transaction uniqueness, row counts, price consistency, discount values, and calculated metrics.
5. **Dashboard Development:** Connected the final analysis table to Looker Studio for interactive reporting.

**SQL Calculation Definitions:**

| Metric | Calculation |
|---|---|
| Net Sales | Actual Price × (1 − Discount Percentage) |
| Estimated Gross Profit | Actual Price × Gross Profit Rate |
| Estimated Net Profit | Estimated Gross Profit − Discount Amount |
| Estimated Profit Margin | Total Estimated Net Profit ÷ Total Net Sales |

Gross profit rate assumptions range from 10% to 30%, depending on transaction price tiers.

## 📊 Dashboard

**[View the Interactive Kimia Farma Performance Dashboard on Looker Studio](https://datastudio.google.com/reporting/390aeeaa-2f51-4d1e-a92b-5389a639af68)**

The dashboard provides an overview of business performance through:

- **KPIs:** Net Sales, Estimated Net Profit, Estimated Profit Margin, and transaction metrics.
- **Charts:** Annual sales trends, quarterly estimated profitability, provincial contributions, and customer ratings.
- **Analysis:** Regional performance, branch-level ratings, and profitability patterns.

## 🔍 Key Business Insights

1. **Stagnant Sales Growth**

   Annual net sales remained stable at approximately Rp80 billion throughout 2020–2023, with year-over-year changes of -0.50% in 2021, +0.68% in 2022, and -0.57% in 2023. This reflects limited and inconsistent sales growth.

2. **Quarterly Profitability Fluctuations**

   Quarterly estimated net profit fluctuated across the reporting period. Q1 recorded the lowest quarterly profit in 2021–2023, while Q4 and Q3 recorded the highest in 2020 and 2022, and 2021 and 2023, respectively.

3. **Provincial Sales Concentration**

   Jawa Barat contributed 29.54% of total net sales, followed by Sumatera Utara at 7.15% and Jawa Tengah at 6.93%. These three provinces accounted for 43.62% of total net sales, indicating a concentration of revenue in key regional markets.

4. **Customer Rating Discrepancies**

   A total of 96 branches with a perfect branch rating of 5.00 recorded transaction ratings below 4.00. This highlights a discrepancy between overall branch ratings and transaction-level customer feedback.

## 💡 Business Recommendations

1. **Strengthen Sales Performance**

   Implement targeted promotions, product bundles, and customer loyalty initiatives to support sales growth. Monitor annual net sales growth, average transaction value, and repeat purchase rate to evaluate effectiveness.

2. **Optimize Quarterly Profitability**

   Review quarterly sales, discount patterns, and inventory allocation, particularly ahead of Q1. Use historical demand patterns to refine promotional and inventory planning while monitoring estimated net profit and profit margin.

3. **Expand Regional Market Opportunities**

   Maintain market performance in Jawa Barat while identifying growth opportunities in Sumatera Utara, Jawa Tengah, and other provinces. Prioritize regional initiatives based on sales potential and monitor provincial net sales growth and contribution.

4. **Improve Customer Experience**

   Review transaction-level feedback from the 96 identified branches to investigate rating discrepancies. Strengthen service standards, staff training, and complaint resolution, while monitoring transaction ratings and customer feedback.

## 📁 Repository Structure

```text
kimia-farma-performance-analytics/
├── README.md
├── documentation/
├── presentation/
└── sql/
```

## 👩‍💻 Author

**Dinda Laura Putri Permadi** · [LinkedIn](https://www.linkedin.com/in/dindalaura) · [GitHub](https://github.com/dindalauraa)