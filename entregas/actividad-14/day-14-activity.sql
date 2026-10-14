SELECT a.account_number,t1.transaction_id AS evento_1,t2.transaction_id AS evento_2,
 t1.tx_timestamp AS fecha_1,t2.tx_timestamp AS fecha_2
FROM core.transactions t1 JOIN core.transactions t2
 ON t1.account_id=t2.account_id AND
 (t1.tx_timestamp<t2.tx_timestamp OR (t1.tx_timestamp=t2.tx_timestamp AND t1.transaction_id<t2.transaction_id))
 AND t2.tx_timestamp<=t1.tx_timestamp+INTERVAL '48 hours'
JOIN core.accounts a ON a.account_id=t1.account_id
ORDER BY a.account_number,t1.tx_timestamp,t2.tx_timestamp;
WITH tipos AS (SELECT unnest(enum_range(NULL::core.tipo_cuenta)) AS account_type),
 matriz AS (SELECT c.customer_id,c.email,t.account_type FROM core.customers c CROSS JOIN tipos t)
SELECT m.email,m.account_type FROM matriz m
WHERE NOT EXISTS(SELECT 1 FROM core.accounts a WHERE a.customer_id=m.customer_id AND a.account_type=m.account_type)
ORDER BY m.email,m.account_type;
SELECT COUNT(*) AS eventos_john FROM core.transactions t JOIN core.accounts a ON a.account_id=t.account_id
WHERE a.account_number='ACCT-1001';
SELECT COUNT(*) AS combinaciones_posibles FROM core.customers c
CROSS JOIN unnest(enum_range(NULL::core.tipo_cuenta)) AS t(tipo);
