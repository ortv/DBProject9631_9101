

ALTER TABLE Test_Tube1
ADD CONSTRAINT chk_VolumeCapacity CHECK (VolumeCapacity > 0);

INSERT INTO Test_Tube1 (TestTubeID, Material, VolumeCapacity, PurchaseDate, ExpiryDate, LocationTestTube)
VALUES ('TT001', 1, -10, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'), 'Lab1');



ALTER TABLE Device1
MODIFY Manufacturer DEFAULT 'Unknown';

INSERT INTO Device1 (DeviceId, DeviceType, SeriesNum, VersionD, PurchaseDate, LastMaintenanceDate, LocationD)
VALUES ('D0001', 1, 100, 1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Lab1');


ALTER TABLE Blood_Donation1
ADD CONSTRAINT unique_DonorID UNIQUE (DonorID);

INSERT INTO Blood_Donation1 (DonationID, DonorID, BloodType, DonationDate, VolumeDonated, TestResultID, TestID)
VALUES ('BD001', 'DON001', 'A+', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 500, 'TR001', 'T001');

-- Attempt to insert a duplicate DonorID
INSERT INTO Blood_Donation1 (DonationID, DonorID, BloodType, DonationDate, VolumeDonated, TestResultID, TestID)
VALUES ('BD002', 'DON001', 'B+', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 450, 'TR002', 'T002');
