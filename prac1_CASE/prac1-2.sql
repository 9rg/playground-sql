SELECT
    CASE WHEN sex=1 THEN '男' ELSE '女' END AS '性別'
,   SUM(population) AS '全国'
,   SUM(CASE WHEN pref_name = '徳島' THEN population ELSE 0 END) AS '徳島'
,   SUM(CASE WHEN pref_name = '香川' THEN population ELSE 0 END) AS '香川'
,   SUM(CASE WHEN pref_name = '愛媛' THEN population ELSE 0 END) AS '愛媛'
,   SUM(CASE WHEN pref_name = '高知' THEN population ELSE 0 END) AS '高知'
,   SUM(CASE WHEN pref_name IN ('徳島', '香川', '愛媛', '高知') THEN population ELSE 0 END) AS '四国(再掲)'
FROM
    PopTbl2
GROUP BY
    sex;