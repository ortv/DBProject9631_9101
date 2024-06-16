
--מחזיר פרטי מבחנות הדם. שכולל מיקום האיחסון ומחשב את מספר הימים שנותרו עד לתאריך התפוגה

SELECT 
    tt.TestTubeID, 
    tt.LocationTestTube, 
    tt.ExpiryDate, 
    r.RefrigeratorId, 
    r.LocationR,
    tt.ExpiryDate - SYSDATE AS DaysToExpiry
FROM 
    Test_Tube1 tt
JOIN 
    Refrigerator1 r ON tt.TestTubeID = r.TestTubeID
ORDER BY 
    tt.ExpiryDate;
