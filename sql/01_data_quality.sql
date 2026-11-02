SELECT
  COUNT(*)                 AS jumlah_baris,
  MIN(date)                AS tanggal_awal,
  MAX(date)                AS tanggal_akhir,
  MIN(price)               AS harga_min,
  MAX(price)               AS harga_max,
  MIN(discount_percentage) AS diskon_min,
  MAX(discount_percentage) AS diskon_max,
  MIN(rating)              AS rating_min,
  MAX(rating)              AS rating_max
FROM `rakamin-kf-analytics-511307.kimia_farma.kf_final_transaction`;