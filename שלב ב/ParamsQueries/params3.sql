SELECT 
    TestID, 
    MainTestType, 
    SubTestType, 
    TestDate, 
    ResultT, 
    BloodDonationID 
FROM 
    Test_1
WHERE 
    ResultT = &<name="result" type ="string"> 
    AND TestDate BETWEEN &<name="startDate" type="date" required=true> AND &<name="endDate" type="date" default="01/01/2030">
ORDER BY 
    TestDate DESC;
