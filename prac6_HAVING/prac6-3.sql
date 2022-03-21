-- original
SELECT
    class
FROM
    TestResults T
GROUP BY
    T.class
HAVING
    (SUM(CASE WHEN sex = '男' THEN score ELSE 0 END) / SUM(CASE WHEN sex = '男' THEN 1 ELSE 0 END)) <
    (SUM(CASE WHEN sex = '女' THEN score ELSE 0 END) / SUM(CASE WHEN sex = '女' THEN 1 ELSE 0 END)); 

-- based on textbook
SELECT
    class
FROM
    TestResults T
GROUP BY
    T.class
HAVING
    AVG(CASE WHEN sex = '男' THEN score ELSE NULL END) 
    < AVG(CASE WHEN sex = '女' THEN score ELSE NULL END); 
    