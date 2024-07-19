--command for intergarion



commit;

--adding columns for blood_donamtion1
alter table blood_donation1 add PARTICIPANTID int;
--for changing types
--and fixing blooddonation table to match blooddonation1 table
alter table blood_donation1 add BLOODDONATIONID number;
alter table blooddonation add BLOODDONATIONID_temp varchar2(50);
update blooddonation set BLOODDONATIONID_temp = CAST(BLOODDONATIONID as varchar2(50));
alter table blooddonation drop column BLOODDONATIONID;
alter table blooddonation rename column BLOODDONATIONID_temp to BLOODDONATIONID;


alter table blooddonation rename column BLOODQUANTITY to VOLUMEDONATED;
ALTER TABLE BLOODDONATION ADD CONSTRAINT pk_blooddonation PRIMARY KEY (BLOODDONATIONID);


--check values in blooddonation and blooddonation1 tables
SELECT* from Blood_Donation1;
select * from blooddonation;
select count(*) from blood_donation1;
select count(*) from blooddonation;


--at first blooddontaion1 has only 91 values while blooddonation has 350
--need to add the data carefully, because blooddonation1 has also forign key. need to check that it can be null. changed to be nullable.
--all the changes for nullable and constriants were done in the "edit" option....
commit;

INSERT INTO blood_donation1 (
  DONATIONID, DONORID, BLOODTYPE, DONATIONDATE, 
  VOLUMEDONATED, TESTRESULTID, TESTID, PARTICIPANTID
)
SELECT 
  DONATIONID,            
  NULL AS DONORID,       
  BLOODTYPE,              
  NULL AS DONATIONDATE,  
  VOLUMEDONATED,         
  NULL AS TESTRESULTID,  
  NULL AS TESTID,         
  PARTICIPANTID          
FROM blooddonation;
--now blooddonation1 was 441 values inserted.



