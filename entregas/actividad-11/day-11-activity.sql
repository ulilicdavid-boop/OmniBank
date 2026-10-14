SELECT a.account_id,a.account_number,c.email,a.is_active,
 UPPER(c.first_name || ' ' || c.last_name) || ' / ' || RIGHT(a.account_number,4) AS etiqueta
FROM core.accounts a JOIN core.customers c ON c.customer_id=a.customer_id
ORDER BY a.account_number;
SELECT t.transaction_id,t.tx_timestamp,EXTRACT(YEAR FROM t.tx_timestamp) AS anio,
 EXTRACT(MONTH FROM t.tx_timestamp) AS mes,
 ROUND(t.amount::NUMERIC,2) AS importe_presentado,
 TIMESTAMPTZ '2026-10-01 00:00+00' AS corte,
 t.tx_timestamp+INTERVAL '15 days' AS fecha_revision
FROM core.transactions t WHERE t.tx_timestamp<TIMESTAMPTZ '2026-09-10 00:00+00'
ORDER BY t.tx_timestamp,t.transaction_id;
SELECT (SELECT COUNT(*) FROM core.accounts) AS cuentas,
 (SELECT COUNT(*) FROM core.transactions WHERE tx_timestamp<TIMESTAMPTZ '2026-09-10 00:00+00') AS eventos;
