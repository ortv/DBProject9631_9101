
--בוחר את כל המכשירים עם הטסטים שלהםץ כולל את מספר הטסטים שנעשו על כל מכשיר
SELECT 
    d.DeviceId, 
    d.DeviceType, 
    t.TestID, 
    t.TestDate, 
    t.ResultT, 
    (SELECT COUNT(*) FROM Test_Device1 td WHERE td.DeviceId = d.DeviceId) AS TotalTests
FROM 
    Device1 d
JOIN 
    Test_Device1 td ON d.DeviceId = td.DeviceId
JOIN 
    Test_1 t ON td.TestID = t.TestID
ORDER BY 
    d.DeviceId, t.TestDate;
