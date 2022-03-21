SELECT
    class
FROM
    TestResults T
WHERE
    T.score >= 50
GROUP BY
    T.class
HAVING
    COUNT(*) * 0.5 < SUM(CASE WHEN sex = '男' THEN 1
                              ELSE 0 END);