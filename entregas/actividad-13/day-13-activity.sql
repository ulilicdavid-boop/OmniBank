WITH por_cuenta AS (
 SELECT account_id,COUNT(*) AS eventos,SUM(amount) AS volumen_bruto
 FROM core.transactions GROUP BY account_id
), activas AS (
 SELECT a.account_id,a.account_number,a.customer_id,a.currency,
 COALESCE(p.eventos,0) AS eventos,COALESCE(p.volumen_bruto,0) AS volumen_bruto
 FROM core.accounts a LEFT JOIN por_cuenta p ON p.account_id=a.account_id
 WHERE a.is_active
), titulares AS (
 SELECT ac.*,c.first_name,c.last_name,c.email FROM activas ac
 JOIN core.customers c ON c.customer_id=ac.customer_id
)
SELECT account_id,account_number,email,first_name,last_name,currency,eventos,volumen_bruto,
 CASE WHEN eventos=0 THEN 'SIN ACTIVIDAD' WHEN eventos>=2 THEN 'ALTA' ELSE 'BAJA' END AS banda_actividad
FROM titulares ORDER BY account_number;
SELECT COUNT(*) AS cuentas_activas FROM core.accounts WHERE is_active;
SELECT COALESCE(SUM(t.amount),0) AS volumen_bruto_activo
FROM core.transactions t JOIN core.accounts a ON a.account_id=t.account_id WHERE a.is_active;
