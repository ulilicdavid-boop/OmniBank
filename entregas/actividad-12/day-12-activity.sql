SELECT t.transaction_id,t.account_id,t.amount,
 (SELECT AVG(t2.amount) FROM core.transactions t2 WHERE t2.account_id=t.account_id) AS promedio_cuenta
FROM core.transactions t
WHERE t.amount>(SELECT AVG(t3.amount) FROM core.transactions t3 WHERE t3.account_id=t.account_id)
ORDER BY t.account_id,t.transaction_id;
SELECT account_id,COUNT(*) AS eventos,AVG(amount) AS promedio
FROM core.transactions GROUP BY account_id ORDER BY account_id;
SELECT a.account_number,a.is_active FROM core.accounts a
WHERE NOT EXISTS(SELECT 1 FROM core.transactions t WHERE t.account_id=a.account_id)
ORDER BY a.account_number;
