SELECT
    EMP.employee AS employee
,   COUNT(Children.child) AS child_count
FROM
    Personal EMP
LEFT OUTER JOIN
    Children.child
ON
    Children.child IN (EMP.child_1, EMP_child_2, EMP_child_3)
GROUP BY
    EMP.employee