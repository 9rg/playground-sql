-- original
SELECT
    CASE WHEN COUNT(*) <> MAX(seq) THEN '歯抜けあり'
         ELSE '歯抜けなし' END AS JUDGE
FROM
    SeqTbl

-- another solution
SELECT
    '歯抜けあり' AS gap
FROM
    SeqTbl
HAVING
   COUNT(*) <> MAX(seq)
UNION ALL
SELECT
    '歯抜けなし' AS gap
FROM
    SeqTbl
HAVING
   COUNT(*) = MAX(seq)