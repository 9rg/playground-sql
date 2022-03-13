MERGE INTO Class_A A
    USING (SELECT * FROM Class_B) B
ON (A.id = B.id)

WHEN MATCHED THEN
    UPDATE SET A.name = B.name

WHEN NOT MATCHED THEN
    INSERT(id, name)
    VALUES(B.id, B.name);