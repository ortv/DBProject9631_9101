--view for the original db
CREATE VIEW Original11 AS
SELECT 
    d.DeviceId,
    d.SeriesNum,
    d.VersionD AS Version,
    d.LocationD AS Location,
    tt.TestTubeID,
    tt.Material,
    tt.VolumeCapacity,
    tt.PurchaseDate AS TestTubePurchaseDate,
    tt.ExpiryDate AS TestTubeExpiryDate,
    tt.LocationTestTube AS TestTubeLocation,
    t.TestID,
    t.TestDate,
    t.ResultT AS TestResult   
FROM 
    Device1 d
LEFT JOIN 
    DeviceTest_Tube1 dt ON d.DeviceId = dt.DeviceId
LEFT JOIN 
    Test_Tube1 tt ON dt.TestTubeID = tt.TestTubeID
LEFT JOIN 
    Test_Device1 td ON d.DeviceId = td.DeviceId
LEFT JOIN 
    Test_1 t ON td.TestID = t.TestID;





--queires for original db
select DeviceId,TestDate,TestResult
       from Original11
       where TestResult is not null;


SELECT 
    DeviceId,
    TestTubeID,
    TestTubeExpiryDate
FROM 
    Original11
WHERE 
    TestTubeExpiryDate < SYSDATE;



--view for the received db
CREATE VIEW Received AS
SELECT 
    r.ResearcherID,
    r.Department,
    r.RName AS ResearcherName,
    r.YearsOfExperience,
    r.RDegree,
    r.Phone,
    r.Email,
    s.StudyID,
    s.StartDate,
    s.publication,
    s.Title,
    s.Cnclousions,
    s.EndDate,
    p.ParticipantID,
    p.PName AS ParticipantName,
    p.Age,
    p.Gender,
    p.Address,
    p.PEmail AS ParticipantEmail
   
FROM 
    RRESEARCHER r
LEFT JOIN 
    conducts c ON r.ResearcherID = c.ResearcherID
LEFT JOIN 
    Study s ON c.StudyID = s.StudyID
LEFT JOIN 
    CCONTAINING cn ON s.StudyID = cn.StudyID
LEFT JOIN 
    Sample sm ON cn.SampleID = sm.SampleID
LEFT JOIN 
    Participant p ON sm.SampleID = p.ParticipantID;

select * from Received;
select * from PARTICIPANT;


--queires for view
SELECT count(*)
FROM 
    Received
WHERE 
    Title IS  NULL;
    
    
    
SELECT 
    ResearcherName
FROM 
    Received
WHERE 
    Department = 5; 
