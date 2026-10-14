SELECT a.account_number,a.account_type,c.first_name,c.last_name,c.email
FROM core.accounts a JOIN core.customers c ON c.customer_id=a.customer_id
WHERE a.is_active AND NOT EXISTS (
 SELECT 1 FROM core.transactions t WHERE t.account_id=a.account_id AND t.tx_type='DEPOSIT')
ORDER BY a.account_number;
SELECT DISTINCT a.account_number FROM core.accounts a
JOIN core.transactions t ON t.account_id=a.account_id WHERE a.is_active
ORDER BY a.account_number;
SELECT COUNT(*) AS activas_sin_depositos FROM core.accounts a
WHERE a.is_active AND NOT EXISTS(SELECT 1 FROM core.transactions t
 WHERE t.account_id=a.account_id AND t.tx_type='DEPOSIT');
