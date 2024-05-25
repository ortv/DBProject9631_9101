
[General]
Version=1

[Preferences]
Username=
Password=2251
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=BLOOD_DONATION1
Count=100

[Record]
Name=DONATIONID
Type=VARCHAR2
Size=50
Data=[aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019@@] 
Master=

[Record]
Name=DONORID
Type=VARCHAR2
Size=50
Data=[aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019@@] 
Master=

[Record]
Name=BLOODTYPE
Type=VARCHAR2
Size=50
Data=[aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019@@] 
Master=

[Record]
Name=DONATIONDATE
Type=DATE
Size=
Data=Random(11-JAN-2021, 31-DEC-2024)
Master=

[Record]
Name=VOLUMEDONATED
Type=NUMBER
Size=
Data=Random(2, 22)
Master=

[Record]
Name=TESTRESULTID
Type=VARCHAR2
Size=50
Data=[aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019@@] 
Master=

[Record]
Name=TESTID
Type=VARCHAR2
Size=50
Data=list(select TestID from Test_1)
Master=

