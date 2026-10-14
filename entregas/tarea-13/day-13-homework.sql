WITH por_cuenta AS (
 SELECT account_id,COUNT(*) AS eventos,SUM(amount) AS volumen_bruto
 FROM core.transactions GROUP BY account_id
), activas AS (
 SELECT a.account_id,a.currency,COALESCE(p.eventos,0) AS eventos,
 COALESCE(p.volumen_bruto,0) AS volumen_bruto
 FROM core.accounts a LEFT JOIN por_cuenta p ON p.account_id=a.account_id WHERE a.is_active
), por_moneda AS (
 SELECT currency,COUNT(*) AS numero_cuentas,SUM(volumen_bruto) AS volumen_bruto,
 ROUND(AVG(volumen_bruto),2) AS promedio_por_cuenta
 FROM activas GROUP BY currency
)
SELECT currency,numero_cuentas,volumen_bruto,promedio_por_cuenta
FROM por_moneda ORDER BY currency;
SELECT COUNT(*) AS cuentas_activas FROM core.accounts WHERE is_active;
SELECT COALESCE(SUM(t.amount),0) AS volumen_bruto FROM core.transactions t
JOIN core.accounts a ON a.account_id=t.account_id WHERE a.is_active;
