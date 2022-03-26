SELECT
    prc_date
,   prc_amt
,   CASE
         WHEN prc_cnt < 3 THEN NULL
         ELSE prc_avg END AS prc_avg
FROM(
    SELECT
        prc_date
,       prc_amt
,       AVG(prc_amt) OVER(
            ORDER BY prc_date
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS prc_avg
,       COUNT(*) OVER(
            ORDER BY prc_date
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS prc_cnt
    FROM
        Accounts
) TMP
ORDER BY
    prc_date