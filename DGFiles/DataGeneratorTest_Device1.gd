
[General]
Version=1

[Preferences]
Username=
Password=2916
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=TEST_DEVICE1
Count=100

[Record]
Name=TESTID
Type=VARCHAR2
Size=50
Data=list(select TestID from Test_1)
Master=

[Record]
Name=DEVICEID
Type=VARCHAR2
Size=50
Data=list(select DeviceId from Device1)
Master=

