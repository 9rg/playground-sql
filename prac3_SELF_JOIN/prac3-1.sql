SELECT
    P1.name AS name_1
,   P2.name AS name_2
FROM
    Products P1
INNER JOIN
    Products P2
ON
    P2.name > P1.name;