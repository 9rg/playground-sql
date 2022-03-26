-- original
SELECT
    shop
,   SUM(CASE WHEN item EXISTS (SELECT item FROM items) THEN 1 ELSE 0 END) AS my_item_cnt
,   SUM(CASE WHEN item NOT EXISTS (SELECT item FROM items) THEN 1 ELSE 0 END) AS my_item_cnt
FROM
    ShopItems
GROUP BY
    shop

-- model answer
SELECT
    SI.shop
,   COUNT(SI.item) AS my_item_cnt
,   (SELECT COUNT(item) FROM Items) - COUNT(SI.item) AS my_item_cnt
FROM
    ShopItems SI
INNER JOIN
    Items I
ON
    I.item = SI.item
GROUP BY
    SI.shop