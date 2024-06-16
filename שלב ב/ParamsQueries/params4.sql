SELECT 
    DonationID, 
    DonorID, 
    BloodType, 
    DonationDate, 
    VolumeDonated, 
    TestResultID 
FROM 
    Blood_Donation1
WHERE 
    DonorID IN &<name="donorIds" list="'4vBdG7waNm9gJnMXKQLx','lCB675rNb061bRN689iPf743jMj288lMQ733nBi871sFR059vA','lQC458wWb454lIk918eKK867mXJ138cTQ765yBq713qKp529eA'">
    AND BloodType = &<name="bloodType" type="string">
ORDER BY 
    DonationDate DESC;
