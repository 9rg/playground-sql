-- 複数列(2列)から最大値を抽出
SELECT
    key
,   CASE WHEN x > y THEN x
    ELSE y END AS greatest
FROM
    Greatest;

-- 複数列(3列)から最大値を抽出
SELECT
    key
,   CASE WHEN CASE WHEN x > y THEN x ELSE y END < z THEN z
    ELSE CASE WHEN x > y THEN x ELSE y END
    END AS greatest