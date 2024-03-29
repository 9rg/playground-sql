SELECT
   dpt 
FROM
    Students
GROUP BY
    dpt
HAVING
    COUNT(*) = SUM(
        CASE WHEN sbmt_date IS NOT NULL
             AND sbmt_date BETWEEN '2018-09-01' AND '2018-09-30'
             THEN 1
             ELSE 0 END
    )

-- BETWEEN はUNNOWNをFALSE同様に扱うため、NULL判定は不要。