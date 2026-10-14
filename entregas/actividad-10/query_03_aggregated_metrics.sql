SELECT account_type,COUNT(*) AS cantidad_cuentas,
 SUM(balance) AS saldo_total_almacenado,MIN(balance) AS saldo_minimo_almacenado,
 MAX(balance) AS saldo_maximo_almacenado,ROUND(AVG(balance),2) AS saldo_promedio_almacenado
FROM core.accounts WHERE is_active GROUP BY account_type
ORDER BY saldo_total_almacenado DESC,account_type;
SELECT c.customer_id,c.email,COUNT(t.transaction_id) AS numero_movimientos,
 COALESCE(SUM(t.amount),0) AS volumen_bruto_registrado
FROM core.customers c LEFT JOIN core.accounts a ON a.customer_id=c.customer_id
LEFT JOIN core.transactions t ON t.account_id=a.account_id
GROUP BY c.customer_id,c.email
HAVING COUNT(t.transaction_id)>=2 OR COALESCE(SUM(t.amount),0)>100
ORDER BY volumen_bruto_registrado DESC,c.email;
SELECT COUNT(*) AS cuentas_activas,SUM(balance) AS saldo_total_almacenado
FROM core.accounts WHERE is_active;
SELECT account_id,COUNT(*) AS eventos,SUM(amount) AS volumen_bruto
FROM core.transactions GROUP BY account_id ORDER BY account_id;
