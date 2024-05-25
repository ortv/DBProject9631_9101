CREATE TABLE Device1--
(
  DeviceId varchar2(50) NOT NULL,
  DeviceType INT NOT NULL,
  SeriesNum INT NOT NULL,
  VersionD INT NOT NULL,
  Manufacturer varchar2(50),
  PurchaseDate DATE,
  LastMaintenanceDate DATE,
  LocationD varchar2(50),
  PRIMARY KEY (DeviceId)
);

CREATE TABLE Test_Tube1--
(
  TestTubeID varchar2(50) NOT NULL,
  Material INT,
  VolumeCapacity INT,
  PurchaseDate DATE,
  ExpiryDate DATE,
  LocationTestTube varchar2(50),
  PRIMARY KEY (TestTubeID)
);

CREATE TABLE Test_1--
(
  TestID varchar2(50) NOT NULL,
  MainTestType INT NOT NULL,
  SubTestType INT NOT NULL,
  TestDate DATE NOT NULL,
  ResultT varchar2(50) NOT NULL,
  BloodDonationID varchar2(50) NOT NULL,
  PRIMARY KEY (TestID),
  UNIQUE (TestDate),
  UNIQUE (BloodDonationID)
);

CREATE TABLE Test_Device1--
(
  TestID varchar2(50) NOT NULL,
  DeviceId varchar2(50) NOT NULL,
  PRIMARY KEY (TestID, DeviceId),
  FOREIGN KEY (TestID) REFERENCES Test_1(TestID),
  FOREIGN KEY (DeviceId) REFERENCES Device1(DeviceId)) ;

CREATE TABLE DeviceTest_Tube1--
(
  DeviceId varchar2(50) NOT NULL,
  TestTubeID varchar2(50) NOT NULL,
  PRIMARY KEY (DeviceId, TestTubeID),
  FOREIGN KEY (DeviceId) REFERENCES Device1(DeviceId),
  FOREIGN KEY (TestTubeID) REFERENCES Test_Tube1(TestTubeID)
);

CREATE TABLE Blood_Donation1
(
  DonationID varchar2(50) NOT NULL,
  DonorID varchar2(50) NOT NULL,
  BloodType varchar2(50) NOT NULL,
  DonationDate DATE,
  VolumeDonated INT,
  TestResultID varchar2(50),
  TestID varchar2(50) NOT NULL,
  PRIMARY KEY (DonationID),
  FOREIGN KEY (TestID) REFERENCES Test_1(TestID),
  UNIQUE (DonorID)
);

CREATE TABLE Stove1--
(
  StoveId varchar2(50) NOT NULL,
  SeriesNum INT NOT NULL,
  VersionStove INT NOT NULL,
  Manufacturer INT,
  PurchaseDate DATE NOT NULL,
  LastMaintenanceDate DATE NOT NULL,
  LocationStove varchar2(50) NOT NULL,
  DeviceId varchar2(50) NOT NULL,
  PRIMARY KEY (StoveId),
  FOREIGN KEY (DeviceId) REFERENCES Device1(DeviceId)
);

CREATE TABLE Refrigerator1--
(
  RefrigeratorId varchar2(50) NOT NULL,
  ModelR INT,
  PurchaseDate DATE,
  LastMaintenanceDate DATE,
  LocationR varchar2(50),
  TestTubeID varchar2(50) NOT NULL,
  DonationID varchar2(50) NOT NULL,
  PRIMARY KEY (RefrigeratorId),
  FOREIGN KEY (TestTubeID) REFERENCES Test_Tube1(TestTubeID),
  FOREIGN KEY (DonationID) REFERENCES Blood_Donation1(DonationID)
);
