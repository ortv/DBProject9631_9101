

--מעדכן שימוש אחרון ומיקום למכשירים שנעשה בהם שימוש בשלוש השנים האחרונות
commit
UPDATE 
    Device1
SET 
    LastMaintenanceDate = SYSDATE,
    LocationD='USA'
WHERE 
    DeviceId IN (
        SELECT td.DeviceId 
        FROM Test_Device1 td 
        JOIN Test_1 t ON td.TestID = t.TestID 
        WHERE t.TestDate > SYSDATE
    );

rollback
