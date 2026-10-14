WITH muestra(valor) AS (VALUES (10000::NUMERIC),(0::NUMERIC),(0::NUMERIC),(NULL::NUMERIC))
SELECT COUNT(valor) AS denominador_sin_null,ROUND(AVG(valor),2) AS promedio_sin_null,
 COUNT(*) AS denominador_con_cero,ROUND(AVG(COALESCE(valor,0)),2) AS promedio_con_cero
FROM muestra;
SELECT a.account_number,a.balance AS saldo_almacenado,
 COUNT(t.transaction_id) AS eventos,COALESCE(SUM(t.amount),0) AS volumen_bruto
FROM core.accounts a LEFT JOIN core.transactions t ON t.account_id=a.account_id
WHERE a.is_active AND a.account_type='CREDIT'
GROUP BY a.account_id,a.account_number,a.balance
HAVING COUNT(t.transaction_id)=0 OR COALESCE(SUM(t.amount),0)>=300
ORDER BY a.account_number;
