SELECT 
    TestTubeID, 
    Material, 
    VolumeCapacity, 
    ExpiryDate, 
    LocationTestTube 
FROM 
    Test_Tube1
WHERE 
    VolumeCapacity > &<name="volumeCapacity"> 
    AND ExpiryDate < &<name="Expdate" type="date" required=true>
ORDER BY 
    VolumeCapacity DESC;
