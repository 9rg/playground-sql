-- original
SELECT
    TA.age_range
,   TS.sex
,   SUM() AS '東北'
,  SUM() AS '関東'
FROM
    TblAge TA
LEFT OUTER JOIN
    TblSex TS
LEFT OUTER JOIN
    TblPop TP
ON
    TP.age_class = TA.age_class
AND
    TP.sex_cd = TA.sex_cd
GROUP BY
    TA.age_class
,   TS.sex_cd
ORDER BY
    TA.age_class ASC
,   TS.sex_cd ASC

-- based on textbook
SELECT
    MASTER.age_class
,   MASTER.sex_cd
,   SUM(CASE TP.pref_name IN ('秋田', '青森', '岩手') THEN TP.population ELSE 0 END) AS '東北'
,   SUM(CASE TP.pref_name IN ('東京', '千葉', '神奈川') THEN TP.population ELSE 0 END) AS '関東'

FROM (
    SELECT
        age_class, sex_cd
    FROM
        TblAge CROSS JOIN TblSex
) MASTER
LEFT OUTER JOIN
    TblPop TP
ON
    TP.age_class = MASTER.age_class
AND
    TP.sex_cd = MASTER.sex_cd
GROUP BY
    MASTER.age_class
,   MASTER.sex_cd