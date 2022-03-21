SELECT
    *
FROM
    Numbers N1
WHERE
    N1.num > 1
    NOT EXISTS(
        SELECT
            *
        FROM
            Numbers N2
        WHERE
            N2.num > 1
        AND
            N2.num <= N1.num / 2
        AND
            N2.num <> 1 
        AND
            MOD(N1.num, N2.num) = 0
    )
ORDER BY
    N1.num ASC;