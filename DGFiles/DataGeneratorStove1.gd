
[General]
Version=1

[Preferences]
Username=
Password=2671
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=STOVE1
Count=100

[Record]
Name=STOVEID
Type=VARCHAR2
Size=50
Data=[aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019@@] 
Master=

[Record]
Name=SERIESNUM
Type=NUMBER
Size=
Data=Random(1, 1234)
Master=

[Record]
Name=VERSIONSTOVE
Type=NUMBER
Size=
Data=Random(2, 100)
Master=

[Record]
Name=MANUFACTURER
Type=NUMBER
Size=
Data=Random(2, 2345)
Master=

[Record]
Name=PURCHASEDATE
Type=DATE
Size=
Data=Random(02-MAR-2020, 31-DEC-2024)
Master=

[Record]
Name=LASTMAINTENANCEDATE
Type=DATE
Size=
Data=Random(01-JAN-2023, 31-JAN-2024)
Master=

[Record]
Name=LOCATIONSTOVE
Type=VARCHAR2
Size=50
Data=[aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019@@] 
Master=

[Record]
Name=DEVICEID
Type=VARCHAR2
Size=50
Data=list(select DeviceId from Device1)
Master=

