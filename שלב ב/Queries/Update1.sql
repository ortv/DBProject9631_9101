
commit
--מעדכן מיקום למכשיר מסוג 83 שלא השתמשו בו מעל שנה
UPDATE 
    Device1
SET 
    LocationD = 'Israel'
WHERE 
    DeviceType = 83
    AND LastMaintenanceDate < ADD_MONTHS(SYSDATE, -12);

rollback
