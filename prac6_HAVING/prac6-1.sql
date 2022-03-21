SELECT
    class
FROM
    TestResults T
GROUP BY
    T.class
HAVING
    COUNT(*) * 0.75 <= SUM(CASE WHEN score >= 80 THEN 1
                                ELSE 0 END)