-- orginal
SELECT
    T.key
,   T.x
,   T.y
,   T.z
FROM
    (SELECT
        key
    ,   x
    ,   y
    ,   z
    ,   CASE key
            WHEN 'B' THEN 1
            WHEN 'A' THEN 2
            WHEN 'D' THEN 3
            WHEN 'C' THEN 4
            ELSE NULL END AS sort_num
    FROM
        Greatest
    ) T
ORDER BY
    T.sort_num;

-- based on textbook
SELECT
    *
FROM
    Greatest
ORDER BY
    CASE key
        WHEN 'B' THEN 1
        WHEN 'A' THEN 2
        WHEN 'D' THEN 3
        WHEN 'C' THEN 4
        ELSE NULL END;
