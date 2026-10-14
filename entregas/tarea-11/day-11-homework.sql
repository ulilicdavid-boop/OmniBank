SELECT COUNT(*) AS total_cuentas,
 COUNT(*) FILTER(WHERE NOT is_active) AS desactivadas,
 ROUND(100.0*COUNT(*) FILTER(WHERE NOT is_active)/NULLIF(COUNT(*),0),2) AS porcentaje_desactivadas
FROM core.accounts;
SELECT transaction_id,tx_timestamp,
 TIMESTAMPTZ '2026-10-01 00:00+00' AS corte,
 tx_timestamp+INTERVAL '15 days' AS fecha_revision,
 AGE(TIMESTAMPTZ '2026-10-01 00:00+00',tx_timestamp) AS antiguedad
FROM core.transactions WHERE tx_timestamp<TIMESTAMPTZ '2026-09-10 00:00+00'
ORDER BY tx_timestamp,transaction_id;
