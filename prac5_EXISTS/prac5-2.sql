SELECT
    *
FROM
    Projects P1
WHERE '◯' = ALL(
    SELECT
        CASE WHEN P2.step_nbr <= 1
              AND P2.status = '完了'
             THEN '◯'
             WHEN P2.step_nbr > 1
              AND P2.status = '待機'
             THEN '◯'
        ELSE 'x' END 
    FROM
        Projects P2
    WHERE P1.project_id = P2.project_id
)