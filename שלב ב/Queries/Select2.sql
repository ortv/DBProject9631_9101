
--מחזירה פרטים של תרומת דם ביחד עם תוצאות הטסט ומחשבת את גיל כל תרומת דם בימים מהתאריך הנוכחי
--מחזיר בסדר יורד של תאריכיםי
SELECT 
    bd.DonationID, 
    bd.DonorID, 
    bd.BloodType, 
    bd.DonationDate, 
    t.ResultT,
    TRUNC(SYSDATE - bd.DonationDate) AS AgeInDays
FROM 
    Blood_Donation1 bd
JOIN 
    Test_1 t ON bd.TestID = t.TestID
ORDER BY 
    bd.DonationDate DESC;
