SELECT a.account_number,a.is_active FROM core.accounts a
WHERE a.is_active AND NOT EXISTS(SELECT 1 FROM core.transactions t WHERE t.account_id=a.account_id)
ORDER BY a.account_number;
SELECT a.account_number,a.is_active FROM core.accounts a
WHERE NOT EXISTS(SELECT 1 FROM core.transactions t
 WHERE t.account_id=a.account_id AND t.tx_type='DEPOSIT')
ORDER BY a.account_number;
SELECT 99 NOT IN (1,2,NULL) AS not_in_con_null,
 NOT EXISTS(SELECT 1 FROM (VALUES(1),(2),(NULL)) AS v(n) WHERE v.n=99) AS not_exists_seguro;
SELECT COUNT(*) AS activas_sin_eventos FROM core.accounts a WHERE a.is_active
AND NOT EXISTS(SELECT 1 FROM core.transactions t WHERE t.account_id=a.account_id);
SELECT COUNT(*) AS cuentas_sin_depositos FROM core.accounts a
WHERE NOT EXISTS(SELECT 1 FROM core.transactions t WHERE t.account_id=a.account_id AND t.tx_type='DEPOSIT');
