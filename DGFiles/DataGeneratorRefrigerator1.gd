
[General]
Version=1

[Preferences]
Username=
Password=2628
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=REFRIGERATOR1
Count=100

[Record]
Name=REFRIGERATORID
Type=VARCHAR2
Size=50
Data=[aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019@@] 
Master=

[Record]
Name=MODELR
Type=NUMBER
Size=
Data=Random(3, 333)
Master=

[Record]
Name=PURCHASEDATE
Type=DATE
Size=
Data=Random(11-JAN-2001, 31-DEC-2014)
Master=

[Record]
Name=LASTMAINTENANCEDATE
Type=DATE
Size=
Data=Random(11-JAN-2021, 31-DEC-2024)
Master=

[Record]
Name=LOCATIONR
Type=VARCHAR2
Size=50
Data=[aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019aA@019@@] 
Master=

[Record]
Name=TESTTUBEID
Type=VARCHAR2
Size=50
Data=list(select TestTubeID from Test_Tube1)
Master=

[Record]
Name=DONATIONID
Type=VARCHAR2
Size=50
Data=list(select DonationID from Blood_Donation1)
Master=

