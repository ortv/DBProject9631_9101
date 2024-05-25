
[General]
Version=1

[Preferences]
Username=
Password=2823
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=DEVICETEST_TUBE1
Count=100

[Record]
Name=DEVICEID
Type=VARCHAR2
Size=50
Data=list(select DeviceId from Device1)
Master=

[Record]
Name=TESTTUBEID
Type=VARCHAR2
Size=50
Data=list(select TestTubeID from Test_Tube1)
Master=

