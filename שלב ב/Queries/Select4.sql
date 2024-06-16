
--חיבור של כמה טבלאות
--לחישוב פרטי מכשיר ותאריך שימוש אחרון. כולל גם את מספר הטסטים שנעשו ןממוצע הזמן בין בדיקות עוקבות
-- קודם כל מחשב את הטסט האחרון לכל מכשיר על ידי שימוש בפונקצית LAG
--הוא כולל את הטורים של Device1,Test_Device1,Test_1 ביחד עם תאירך הטסט האחרון.
--ובשאילתא החיצונית מקבץ את כולם ומחשב את התוצאות
--סופר את מספר הטסטים ומחשב את השמן הממוצע בין טסטים עבור כל מכזיר

WITH TestIntervals AS (
    SELECT
        d.DeviceId,
        d.DeviceType,
        d.LastMaintenanceDate,
        t.TestID,
        t.TestDate,
        LAG(t.TestDate) OVER (PARTITION BY d.DeviceId ORDER BY t.TestDate) AS PrevTestDate
    FROM 
        Device1 d
    LEFT JOIN 
        Test_Device1 td ON d.DeviceId = td.DeviceId
    LEFT JOIN 
        Test_1 t ON td.TestID = t.TestID
)
SELECT
    DeviceId,
    DeviceType,
    LastMaintenanceDate,
    COUNT(TestID) AS NumberOfTests,
    AVG(TestDate - PrevTestDate) AS AvgTimeBetweenTests
FROM
    TestIntervals
GROUP BY
    DeviceId,
    DeviceType,
    LastMaintenanceDate
ORDER BY
    NumberOfTests DESC;
