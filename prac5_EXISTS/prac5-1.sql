SELECT
    DISTINCT key
FROM
    ArrayTbl2 AT1
WHERE
    NOT EXISTS (
        SELECT *
        FROM ArrayTbl2 AT2
        WHERE
            AT1.key = AT2.key
        AND
            (AT2.val <> 1 OR AT2.val IS NULL) 
    )

-- use ALL
SELECT
    DISTINCT key
FROM
    ArrayTbl2 AT1
WHERE
    1 = ALL(
        SELECT
            val
        FROM
            ArrayTbl2 AT2
        WHERRE
            AT2.key = AT1.key)
    )

-- use CASE
SELECT
    DISTINCT key
FROM
    ArrayTbl2 AT1
GROUP BY
    key
HAVING
    SUM(CASE AT1.val=1 THEN 1 ELSE 0 END) = 10;

--training
SELECT
    DISTINCT key
FROM
    ArrayTbl2 T1
WHERE
    NOT EXISTS(
        SELECT
            *
        FROM
            ArrayTbl2 T2
        WHERE
            T2.key = T1.key
        AND
            T2.val <> 1 OR T2.val IS NULL
    )