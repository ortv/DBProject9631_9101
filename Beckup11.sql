prompt Creating TEST_1...
create table TEST_1
(
  testid          VARCHAR2(50) not null,
  maintesttype    INTEGER not null,
  subtesttype     INTEGER not null,
  testdate        DATE not null,
  resultt         VARCHAR2(50) not null,
  blooddonationid VARCHAR2(50) not null
);
alter table TEST_1
  add primary key (TESTID);
alter table TEST_1
  add unique (TESTDATE);
alter table TEST_1
  add unique (BLOODDONATIONID);

prompt Creating BLOOD_DONATION1...
create table BLOOD_DONATION1
(
  donationid    VARCHAR2(50) not null,
  donorid       VARCHAR2(50) not null,
  bloodtype     VARCHAR2(50) not null,
  donationdate  DATE,
  volumedonated INTEGER,
  testresultid  VARCHAR2(50),
  testid        VARCHAR2(50) not null
);
alter table BLOOD_DONATION1
  add primary key (DONATIONID);
alter table BLOOD_DONATION1
  add unique (DONORID);
alter table BLOOD_DONATION1
  add foreign key (TESTID)
  references TEST_1 (TESTID);

prompt Creating DEVICE1...
create table DEVICE1
(
  deviceid            VARCHAR2(50) not null,
  devicetype          INTEGER not null,
  seriesnum           INTEGER not null,
  versiond            INTEGER not null,
  manufacturer        VARCHAR2(50),
  purchasedate        DATE,
  lastmaintenancedate DATE,
  locationd           VARCHAR2(50)
);
alter table DEVICE1
  add primary key (DEVICEID);

prompt Creating TEST_TUBE1...
create table TEST_TUBE1
(
  testtubeid       VARCHAR2(50) not null,
  material         INTEGER,
  volumecapacity   INTEGER,
  purchasedate     DATE,
  expirydate       DATE,
  locationtesttube VARCHAR2(50)
);
alter table TEST_TUBE1
  add primary key (TESTTUBEID);

prompt Creating DEVICETEST_TUBE1...
create table DEVICETEST_TUBE1
(
  deviceid   VARCHAR2(50) not null,
  testtubeid VARCHAR2(50) not null
);
alter table DEVICETEST_TUBE1
  add primary key (DEVICEID, TESTTUBEID);
alter table DEVICETEST_TUBE1
  add foreign key (DEVICEID)
  references DEVICE1 (DEVICEID);
alter table DEVICETEST_TUBE1
  add foreign key (TESTTUBEID)
  references TEST_TUBE1 (TESTTUBEID);

prompt Creating REFRIGERATOR1...
create table REFRIGERATOR1
(
  refrigeratorid      VARCHAR2(50) not null,
  modelr              INTEGER,
  purchasedate        DATE,
  lastmaintenancedate DATE,
  locationr           VARCHAR2(50),
  testtubeid          VARCHAR2(50) not null,
  donationid          VARCHAR2(50) not null
);
alter table REFRIGERATOR1
  add primary key (REFRIGERATORID);
alter table REFRIGERATOR1
  add foreign key (TESTTUBEID)
  references TEST_TUBE1 (TESTTUBEID);
alter table REFRIGERATOR1
  add foreign key (DONATIONID)
  references BLOOD_DONATION1 (DONATIONID);

prompt Creating STOVE1...
create table STOVE1
(
  stoveid             VARCHAR2(50) not null,
  seriesnum           INTEGER not null,
  versionstove        INTEGER not null,
  manufacturer        INTEGER,
  purchasedate        DATE not null,
  lastmaintenancedate DATE not null,
  locationstove       VARCHAR2(50) not null,
  deviceid            VARCHAR2(50) not null
);
alter table STOVE1
  add primary key (STOVEID);
alter table STOVE1
  add foreign key (DEVICEID)
  references DEVICE1 (DEVICEID);

prompt Creating TEST_DEVICE1...
create table TEST_DEVICE1
(
  testid   VARCHAR2(50) not null,
  deviceid VARCHAR2(50) not null
);
alter table TEST_DEVICE1
  add primary key (TESTID, DEVICEID);
alter table TEST_DEVICE1
  add foreign key (TESTID)
  references TEST_1 (TESTID);
alter table TEST_DEVICE1
  add foreign key (DEVICEID)
  references DEVICE1 (DEVICEID);

prompt Disabling triggers for TEST_1...
alter table TEST_1 disable all triggers;
prompt Disabling triggers for BLOOD_DONATION1...
alter table BLOOD_DONATION1 disable all triggers;
prompt Disabling triggers for DEVICE1...
alter table DEVICE1 disable all triggers;
prompt Disabling triggers for TEST_TUBE1...
alter table TEST_TUBE1 disable all triggers;
prompt Disabling triggers for DEVICETEST_TUBE1...
alter table DEVICETEST_TUBE1 disable all triggers;
prompt Disabling triggers for REFRIGERATOR1...
alter table REFRIGERATOR1 disable all triggers;
prompt Disabling triggers for STOVE1...
alter table STOVE1 disable all triggers;
prompt Disabling triggers for TEST_DEVICE1...
alter table TEST_DEVICE1 disable all triggers;
prompt Disabling foreign key constraints for BLOOD_DONATION1...
alter table BLOOD_DONATION1 disable constraint SYS_C00708277;
prompt Disabling foreign key constraints for DEVICETEST_TUBE1...
alter table DEVICETEST_TUBE1 disable constraint SYS_C00708269;
alter table DEVICETEST_TUBE1 disable constraint SYS_C00708270;
prompt Disabling foreign key constraints for REFRIGERATOR1...
alter table REFRIGERATOR1 disable constraint SYS_C00708291;
alter table REFRIGERATOR1 disable constraint SYS_C00708292;
prompt Disabling foreign key constraints for STOVE1...
alter table STOVE1 disable constraint SYS_C00708286;
prompt Disabling foreign key constraints for TEST_DEVICE1...
alter table TEST_DEVICE1 disable constraint SYS_C00708264;
alter table TEST_DEVICE1 disable constraint SYS_C00708265;
prompt Deleting TEST_DEVICE1...
delete from TEST_DEVICE1;
commit;
prompt Deleting STOVE1...
delete from STOVE1;
commit;
prompt Deleting REFRIGERATOR1...
delete from REFRIGERATOR1;
commit;
prompt Deleting DEVICETEST_TUBE1...
delete from DEVICETEST_TUBE1;
commit;
prompt Deleting TEST_TUBE1...
delete from TEST_TUBE1;
commit;
prompt Deleting DEVICE1...
delete from DEVICE1;
commit;
prompt Deleting BLOOD_DONATION1...
delete from BLOOD_DONATION1;
commit;
prompt Deleting TEST_1...
delete from TEST_1;
commit;
prompt Loading TEST_1...
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('zvNfeYtv874ZZC41zFb8', 58, 20, to_date('05-05-2023', 'dd-mm-yyyy'), 'hnE78PQv7QobzbW4iO1l', 'YmaKL0uccyxotGXSxRCU');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('18RTRkg0B8pDhIgju9bM', 26, 86, to_date('04-08-2014', 'dd-mm-yyyy'), 'dlDfrsMAczfuZv2KOGnE', 'QxIDoxSQ3ABV2CYy4G5Y');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('NydbRf4WHAPWDVy3Fque', 35, 88, to_date('21-06-2013', 'dd-mm-yyyy'), 'Jetje0GNcu2VAtcmc2iO', 'k3FeIHqg43G1lIfcBLMZ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('kezX82Vtplhs3b6hwl8t', 11, 99, to_date('01-12-2010', 'dd-mm-yyyy'), 'trIt4PKJVT58T43ZGdHc', '3xyaYzRdYE1EokUhYWUT');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('moMcsEeqlxRagCZfTZPS', 67, 37, to_date('25-12-2012', 'dd-mm-yyyy'), 't8vwILTJ4nwMQ0FXswy5', 'exlwJ334CAHS9MImM8D2');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('50Mn6wVWpSgehfbORrfR', 58, 45, to_date('19-08-2011', 'dd-mm-yyyy'), '1OqN2DSwK0vhCW83z0bn', '4XPx2pIEIQoZeiJykfBz');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('IsmhwpSX9dYJY35YR0pN', 77, 46, to_date('03-10-2017', 'dd-mm-yyyy'), 'cBrpNLt8QD6Ma6YmcNCR', 'KdpBabc0MkxXPkhLph2n');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('Rzt3bGcSxJO2arUWnxxZ', 70, 26, to_date('02-01-2006', 'dd-mm-yyyy'), 'eDm85ZPd7d4KDWwzOrYI', 'b5zodvd2LTSdMc9UsvL3');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('QoQLKJfyWahUIxFd7YEY', 83, 45, to_date('10-10-2015', 'dd-mm-yyyy'), 'dpoan8D9W5OXoK2tZ6Px', 'AEiIwHDTc4riXg7j82Un');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('ITpqcFDYJqrDXVpKcBvT', 91, 19, to_date('04-11-2017', 'dd-mm-yyyy'), '33SgUchGxgL4WvNLzqhh', 'OEFjnnE0Hp65hSzuBG2z');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('qcinQy2C2ygVvxsptXEx', 24, 61, to_date('07-05-2019', 'dd-mm-yyyy'), 'E5YRwKcwNgAQY4Rw1zcH', '2s4GYT9HV62BzAfq7tES');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('xaMhHod5u1PQqG5Zm6th', 74, 82, to_date('13-12-2007', 'dd-mm-yyyy'), '8XC5O25MKl78yNM8HZud', 'qYVPJCU8VWuV2hu5J9xs');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('OYnT2H4xJ27ZG6BDqvp7', 53, 12, to_date('11-01-2016', 'dd-mm-yyyy'), 'yCBymBnpgy4pwT8Hz2C2', 'wBc48bhrNqS6vuP0bm9J');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('sC3X1HBttQSQHTBu9tiA', 19, 11, to_date('26-04-2003', 'dd-mm-yyyy'), '97PLkZUbb0e9BCQVgBco', 'ZctcVQV9m9ccg7wC2LDa');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('8Lx1IPHISZWmsG2MRvar', 60, 88, to_date('18-10-2000', 'dd-mm-yyyy'), 'YlSZqqsMOemhEOXaGSSn', 'd4aOHxCB17DIxKoBgJDb');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('MBdvCpldkY49Ki9Ht263', 44, 43, to_date('05-09-2015', 'dd-mm-yyyy'), 'ObAW9eNNLJSxgloQFvid', 'lkg1X5ppow6y7ZpEzUMv');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('IXEKcaZYooEx8JwuWaAj', 42, 43, to_date('21-04-2021', 'dd-mm-yyyy'), '2LHzIyNyZeIRa5qqWOqJ', '2Y7JAC6FHCP1Jvlvvq3A');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('eXtToBKJQLTouEceHUMn', 73, 47, to_date('17-09-2002', 'dd-mm-yyyy'), 'dTdwnbV3BPdfvUQJCCJf', 'PJZz33eSqGWA5n3GpZvZ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('tgQi68p4TUxmCPvrNts0', 2, 69, to_date('06-12-2019', 'dd-mm-yyyy'), 'I8ygui1IGwOd2OZiR5YR', '3NRPDZwgKpTFczVmUSC6');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('mpLiJODLo4U9pyoUSRLL', 37, 10, to_date('22-08-2018', 'dd-mm-yyyy'), 'G1GW4zu1LxiTNMmWntZc', '2ZyIkS1ZNs5FBRScqEkx');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('GTfQHzPapKdGFpAwrugN', 31, 18, to_date('06-11-2023', 'dd-mm-yyyy'), 'SsJqGB9UHuyo0Wfl8xx6', 'DnoBUwnujxzoXn0T0en1');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('8MnVrtbkPQJRN3wGJ7VM', 89, 45, to_date('18-11-2015', 'dd-mm-yyyy'), 'ezVL5nNzFznWkLZUXoOy', '60eFlVN93KkZ5wTCL7C7');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('Q0MUkzYW5Kwe1qWPcjqt', 91, 33, to_date('09-11-2018', 'dd-mm-yyyy'), 'SIUnPgVziGj4lbsVAQ8t', 'O8h4yyVG4CYGThgfy5SF');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('rrHjZDjvwycCkonpQnUn', 47, 17, to_date('19-04-2006', 'dd-mm-yyyy'), 'EDFgJ0BcqfJtSyjj3pvh', 'waCBBtGk2j7NG6h8nSUT');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('HxmvSqyySUxZTJGiKmCf', 11, 52, to_date('15-06-2014', 'dd-mm-yyyy'), 'peX2sYsyAbRyHvVoMhQ0', 'sEPDCScya5EYtiD77Vd8');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('PdtmS2Y3ivOfXaWkjSaf', 96, 47, to_date('14-11-2020', 'dd-mm-yyyy'), 'PAEJfSkGlNFPUjUKxJAH', 'yBX1VjutQnfAm0dHURCp');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('l6NsA2DVVbHsHRddrKOc', 84, 44, to_date('10-06-2021', 'dd-mm-yyyy'), 'VdgE46FtQAMcsA4DsNn2', 'EpEnqyeddUpj4gwmiz8N');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('rjA816KlpPM2spvwpYRC', 95, 91, to_date('21-04-2003', 'dd-mm-yyyy'), 'Cgn9BBLXIJhAdeiLQdD6', '5vyV88RXbXbBIs41K1vm');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('b8XrBN7QTOHUxOUjjC8F', 80, 16, to_date('27-05-2006', 'dd-mm-yyyy'), 'hdOOrDwVDS5TuTjHFcYX', 'UVU1KoXQ9lxJ9CggOffR');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('McgbcC2b3m8ny1Qg1cx9', 51, 47, to_date('16-12-2004', 'dd-mm-yyyy'), 'EFrLJcuFmsxQClkt34ZY', 'zo3UyRZLifK2qnrRY9Tf');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('SKIGq0fAQzTRJaymzoJK', 88, 52, to_date('02-12-2015', 'dd-mm-yyyy'), 'Q0vHkpKLWA3RyKWcQTwM', 'GPdRHMVIN83teO5p3hcq');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('twGEzJsyNpmvaNcNyWaR', 65, 22, to_date('01-11-2022', 'dd-mm-yyyy'), 'SAwoODakOqv4FNcfAmGs', 'zWSMxIauJXUMWUuxJWLF');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('0KCquUr0vk66Rucr5rbA', 1, 54, to_date('13-09-2010', 'dd-mm-yyyy'), 'NOWwH9VB9fZYQ9WsT7uT', '7yjh4MJBz0En73DJxkV7');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('OsA69lD7HuWxGrewBf6X', 69, 86, to_date('17-01-2016', 'dd-mm-yyyy'), 'UraGUaLYtCUOYz334PHi', 'FAFViuJB4qT7DQwjZVFD');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('Asm9Aeyf8XSavFLLlkbz', 51, 72, to_date('23-10-2000', 'dd-mm-yyyy'), '1AbGQxO7zZDOtwy283nG', 'EPVxj2Bd14P9P9Pes2hA');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('3Y8kEqNG0EVwLKqPjNig', 69, 47, to_date('25-09-2017', 'dd-mm-yyyy'), 'ISuHok7f1fTASIgdD9kh', 'LgeduFIqPClmAJ0xT6Gb');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('KvU4KecbJukpZwE13Giw', 14, 67, to_date('23-05-2008', 'dd-mm-yyyy'), 'n56yQrjPiv8LtOgwFhdQ', 'y6dlwxdTtprTWxqBM57j');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('952jyjjWt0tcBgJ6I9TJ', 91, 76, to_date('12-09-2019', 'dd-mm-yyyy'), 'D9E3bvwYXmXtqI8LpKEU', 'N3AXFw2BIFJLYPcfzzAc');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('zIfbsWsMXxCoyVCimug4', 34, 59, to_date('19-08-2002', 'dd-mm-yyyy'), 'O9vLFehuNndvlyy8Ig8H', 'xS5479SPHeq4kSVdpESv');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('jS04QfwRgHO1KIg6Eaub', 87, 67, to_date('09-01-2005', 'dd-mm-yyyy'), 'XeMSHKMw2FnbqrNrrZOe', 'fq4FYwa3DpZkeZsWpUHU');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('Dwa3vW6Td91Aa7Ncu7H5', 23, 2, to_date('15-07-2012', 'dd-mm-yyyy'), 'Yb2svTjUctcwWVY991he', 'M8dn25PTtLyLKqB5qLvi');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('r1pTidWF7ujWgd2GGr8I', 84, 29, to_date('02-06-2000', 'dd-mm-yyyy'), 'sjeE4EcoKogDHBe4DuxQ', 'tNeurwAKxpzyPAsr1C73');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('aOoutjM5tTIldA68ti7j', 3, 18, to_date('11-10-2010', 'dd-mm-yyyy'), 'Z9EkF6j2TCw9HFiopQal', 'md1fTmjCNGTh7N81iEzr');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('9kjynS4NYMYtT3lHpJKA', 29, 91, to_date('11-06-2019', 'dd-mm-yyyy'), 'bcJHSyBcwSt83DNn8bMP', 'W2P6Wt6UbWbvv1JZ7tbG');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('p4EboI4uOwCeVTbhiSpy', 24, 3, to_date('26-03-2001', 'dd-mm-yyyy'), 'sr5rQeYZGyowxgLs25cq', 'rrBMNTlBbEfAa4BeGq7q');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('XopsLOir619dpBGxmJ5D', 21, 87, to_date('24-03-2018', 'dd-mm-yyyy'), 'DfIAblTc8407pnEfbxrA', 'ynZWM4QPTF1EmgOrMtK2');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('3tQw4wxwfAocdGMFokum', 30, 66, to_date('21-05-2018', 'dd-mm-yyyy'), 'nRaTZLXMVA37BY0GGcPT', 'HaNZWWPQmYWeSh8iTZgZ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('USeVj7cdAiNI8XaFC0jg', 51, 37, to_date('23-01-2006', 'dd-mm-yyyy'), 'ImNT5GMMySdMrrFcrloj', '8H8yuHVchIa9eLf15MCV');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('ghPXY3iqhvGcLgGO5W1q', 76, 64, to_date('12-04-2005', 'dd-mm-yyyy'), '8klrnADrBArWHuqe9j0E', 'mN0FVJP6Aq8azFSjgb8c');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('dCYCOs8yJrBtnL6Qksvd', 63, 0, to_date('14-09-2012', 'dd-mm-yyyy'), 'Fybu0KOOm0Z1P1Fkh83C', 'oyTIiWbVM3ZnlsyY5lzD');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('5iF3SkOKEWWocH5DGa6p', 40, 74, to_date('18-01-2021', 'dd-mm-yyyy'), 'rRZolyTHpMd9ReSvX8cl', 'Wn7N4MOKJxlhjebIbnUy');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('BACPd7YA7pRV9OXP67Tj', 35, 17, to_date('01-08-2021', 'dd-mm-yyyy'), 'pZspiaFBxQlifVrk9Klz', 'b8cwk9i1rbtBHC4XIAbP');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('bk10XGnAhcCEt2JyAlRr', 8, 93, to_date('03-06-2005', 'dd-mm-yyyy'), 'P93xcV58PdfJGlecvdyb', 'L7EPuj53qK6ATYFTpsZ4');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('MoHL0y9B4cDsGFu1SbiI', 55, 97, to_date('06-03-2003', 'dd-mm-yyyy'), 'tjsi6rXMPqqRanEitpix', 'kKDWndChpeKIZd3izbjQ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('3COaGnfiv7vbCQhUlgwn', 18, 29, to_date('04-05-2010', 'dd-mm-yyyy'), 'uHmq5RpU6oT3XzFLBdO5', 'KJ3e4ZAsk5ojuYMsi0dE');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('gq5V3GEX8J6umx7ILxt0', 59, 56, to_date('15-02-2016', 'dd-mm-yyyy'), 'oRoYQ7Vzy1cTcMYtGu4f', 'aOjVHzJWRuuSj1EI9r9S');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('5mpdI59GcbPTHIFQZXEL', 38, 19, to_date('27-08-2001', 'dd-mm-yyyy'), 'cmJIiKrrz1SacI1JRGOe', 'clqf98OjgjyWj0Z3IqwI');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('j2WrRgkdCQERmSRkOLsY', 77, 75, to_date('10-08-2009', 'dd-mm-yyyy'), 'MCAS9mj5D27peThB5vQY', 'Ajot71SYXLjFMwwLVqMi');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('lvMmmZRiy4S0zehljpGC', 73, 62, to_date('04-09-2012', 'dd-mm-yyyy'), 'FpNK29jRbDZNKb6As1LB', 'XZhKIu7QkK6kclBidvoL');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('IMluwoEHDbChatIYiM0B', 92, 92, to_date('20-09-2017', 'dd-mm-yyyy'), 'LDVlMcdi5A3SxvM6IKju', '0n0N9Imc1Zr2DgiUtKMr');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('DrCqoarhKq902sjpxgEs', 31, 41, to_date('17-12-2010', 'dd-mm-yyyy'), 'YaGsdXkhAwxR5nkwa2Ex', 'iDfyfCcMd7Mi21Nvmf52');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('ia2FrzjRAAO43uhzy6mJ', 3, 65, to_date('14-02-2003', 'dd-mm-yyyy'), 'C5zV8jot9hyILgmT291f', 'DoO83fYdF2UeuUO1LgfK');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('lxCN8JR9L3kFVadvK13H', 1, 87, to_date('28-07-2017', 'dd-mm-yyyy'), 'bj6c3NQvkH28V05xX28Z', 'iDqRvbWeExhOmyXGciNe');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('twE4EaUzTV4g2lj6tM2O', 16, 96, to_date('13-02-2006', 'dd-mm-yyyy'), 'r8yn7aoWEUZbxHkY5r23', 'TAEKlc2vMXFSXgUd2luH');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('1lmRNBDuXqJL5wQycTPX', 78, 28, to_date('23-07-2017', 'dd-mm-yyyy'), '2PIXt8aX6j6HA63VL8hx', 'iX1VtJG6OxwGVN9EExLI');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('30C5xntrDaV1oY1PC1yi', 60, 6, to_date('13-01-2013', 'dd-mm-yyyy'), 'PfqjvIdd3NNYxjspBKEs', 'hx6AiBu9pS2HWu9Bxbmv');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('mVikNh7YuoBJQ7edY3Jk', 96, 19, to_date('23-02-2002', 'dd-mm-yyyy'), 'B170nDU5XpZ4O2nCp2nM', 'G0QeNgTpxV4INOKMmHxp');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('70okJpRvnXjo1wvZbLy5', 46, 83, to_date('18-12-2004', 'dd-mm-yyyy'), 'ItuO9PHS5YLkZTwqxqqs', '0TpnAlH8ZCFGK7pLrzAU');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('0dzyAnYjiZBHdwMf8zQP', 11, 81, to_date('08-01-2009', 'dd-mm-yyyy'), 'cQjBKCGk70eqMTJGdmUY', 'I95nABRNgGYWjHWp51wR');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('PwldAw8e3HhLs13FYwCI', 32, 4, to_date('26-02-2012', 'dd-mm-yyyy'), '68FyGLDb1EuCar04XzuB', 'LDF9HYqLuQsdsJj8Qvp8');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('ftPSVoWEbJybMpXDVmsJ', 80, 72, to_date('21-07-2002', 'dd-mm-yyyy'), 'ExIaHb7YPcUlPxmD3Z8K', 'Lzpby6kXsxT4RNfcfQVV');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('ORmNGCoMw7FPoWlHB2fO', 72, 31, to_date('28-04-2005', 'dd-mm-yyyy'), 'JU0UITbIYRo5f8ecISmQ', 'BcQM3ej67jWNLWciF031');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('UVVmOp2bdEW35j9lJHRW', 39, 3, to_date('04-12-2007', 'dd-mm-yyyy'), '2i3wJLnY5mKRGVpYefdq', 'hkAqeM4ya9NPocH3N7mT');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('kWt0XtaBhEqEtGcTMnxE', 10, 5, to_date('18-09-2004', 'dd-mm-yyyy'), 'YstSEWD6SGo2765yAQbS', 'M6O1V1Nz7tdpgsM5HR8p');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('qsgQNS5WNHpHUWZIgIYi', 88, 88, to_date('25-08-2019', 'dd-mm-yyyy'), '3q1UOr3Ln2748tShSPZl', '7pp1ORcNgKh1kOLMXuub');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('lMmHzzsz9vE0ZJn5doVs', 25, 70, to_date('24-11-2020', 'dd-mm-yyyy'), 'cqYV5bjbBMGKiNzAVRjQ', '3NyPUQZh2DAOC7TJ1pjo');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('h42FE7PVrCA6nGDoQF3G', 71, 0, to_date('06-12-2009', 'dd-mm-yyyy'), '19oineYYtmq3GRkIFGRD', 'hl395dC6UMY1AuHRDNab');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('YuWzvCfhX8fltWSDKI9T', 89, 21, to_date('24-03-2003', 'dd-mm-yyyy'), 'hOqqsKg6V69rk80t9OD7', 'v1kZFAWr4iLQlCNRyKFH');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('sKYiehFHn7j7ks4lObBf', 39, 3, to_date('16-10-2013', 'dd-mm-yyyy'), '8JFyopc1nUCN0YVMEEAK', 'Hv4Jnerb9y9ramb96XRf');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('zb4Mu6Ao0z5Mekurxzvu', 52, 64, to_date('28-09-2001', 'dd-mm-yyyy'), 'ilhA3KCKp4zJfYje7f4X', 'V0X72NQptnmhs4Ie94HY');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('TvcKZG1g4F58koXnWiij', 31, 23, to_date('20-11-2022', 'dd-mm-yyyy'), 'q5IfqfL8SXilfka4ezHb', 'ZIpSyHXqarYbx711SQHm');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('QUKjMchilrRlmxzECduY', 72, 65, to_date('15-07-2014', 'dd-mm-yyyy'), 'urgYlIBAB92k9kvRCi4E', 'IQUyhEOUBwCcTUlX6kvx');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('IPNyVtyZwOKutAHrpwVC', 41, 61, to_date('12-09-2017', 'dd-mm-yyyy'), 'kub6MRgPLTTU7PZWJTdx', '8RyufEkYKcBY5p74EVBa');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('PcvkK6qH35Uwe8uffNgt', 37, 94, to_date('24-04-2009', 'dd-mm-yyyy'), 'Lq2QBJMAilWqLL3njGSR', 'rourtK40Z0HashHIOSCM');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('FiJLe1boabrZSnmFInSD', 55, 15, to_date('11-02-2012', 'dd-mm-yyyy'), 'viAsYVqFllPQpeatoCYZ', '2yXew4S2ElWoVTigyf7M');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('9J0OlsEWYhnfj3X8P8bp', 84, 95, to_date('23-11-2018', 'dd-mm-yyyy'), 'x0GBWJGNUU3otSLir061', '5E0ZbyBAQ9o4fXmbpDGE');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('8eoUoervnsxf4AY6cGcR', 10, 56, to_date('16-03-2005', 'dd-mm-yyyy'), 'dpiLjhlC4rqeqA8sUGqz', '8iw1Z0ywXmc4YnzES1nu');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('pEuugs2eElJFUvGMrXJd', 23, 43, to_date('13-04-2008', 'dd-mm-yyyy'), 'Lwf4ksfKljVSiYtT7JCH', 'm1OUiViwshepZ2hOTL4t');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('9uL80wbwkdhdtT4kPeVb', 53, 24, to_date('04-08-2007', 'dd-mm-yyyy'), 'MuTMpPitWmnb9sExXTuy', '3ZlGLssY3fcEtnNBBDuL');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('hZU476sCP683nCr729nPO690zFX216oWb616tJM193dEs085jS', 18, 19, to_date('26-02-2803 23:51:04', 'dd-mm-yyyy hh24:mi:ss'), 'eIk770mUq798oOh410tJO460vCi946rXW084mWf687aUk947zJ', 'rNF584eAd380jHX166fUm547nIF562kZO244mWU388sPx986eN');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('dEd996iRf463qKc326fDU679yGC539wZp546tFd284vZm276gP', 10, 30, to_date('20-02-2381 00:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'oCk973pKJ954wJa270nRm480wKu583lIM264nDH021fPJ780hZ', 'qMY245yVI830aLR382kBg886rRp731kSX222tHW048rOD099sM');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('iHj779vSu112aWA230vLe628vWg569tBI052iIW939rJt777qK', 9, 20, to_date('07-05-1954 06:01:52', 'dd-mm-yyyy hh24:mi:ss'), 'dBk484xGW420cZw797vSl678pMX352kST539pRB396dBg081wP', 'aKQ343oYr748zZT165lDW681bDP844iEI051cKh357dMr799wZ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('yQK315zSj896sCp964sDB854yZp559wHK025qYU618pFr967yM', 3, 21, to_date('29-02-2992 10:53:11', 'dd-mm-yyyy hh24:mi:ss'), 'bML628xDp781gPl976jYH381kKC222cPF226iKY823sUc470lB', 'xTk011wQD724gKe691nTV590kIH897mMN770vPU581vVp978hH');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('yKo653gJx798iWU496gEB329mVc586qGA866bCV559nGB363eS', 17, 29, to_date('30-12-2555 12:46:56', 'dd-mm-yyyy hh24:mi:ss'), 'cWi290sNG362sIA971dDt052lHp143qCZ313aBl272xXi031tS', 'hWM386lAz918xMG582cVU144xNL261rMA136oUh681mVn278uU');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('pCs368fRL684dGm519dLU016wRx459vNI760rEr299gUV238yM', 14, 33, to_date('22-04-2810 22:02:55', 'dd-mm-yyyy hh24:mi:ss'), 'rWm790oOi915oUH223gTx442zVr999bVH236sJS922gYI637yC', 'bVa482mAm625aOn552qGR910zCY635uEu839xQI593aKe722qZ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('wZY639pJX437aHK987oLW065wMz118fAl599wUO774aXz091dO', 12, 15, to_date('03-10-2692 09:42:46', 'dd-mm-yyyy hh24:mi:ss'), 'zRf094sJW293xXp674fGQ362xEV330cAM919dLp132eCI388jC', 'zDe612qQA778qWJ660fPp377jGx011yTc513zRl796bSj454rH');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('xIQ267zWF373tKs922kYt560uVU921dTq561hEm839lHw424rX', 9, 4, to_date('24-08-2854 15:21:10', 'dd-mm-yyyy hh24:mi:ss'), 'uKS573aJt810mTK088yOA790fTI268rNQ154ePp565rEd233cT', 'gHj467vAW875uYp688vEs671fPz550fPi678lUC775iFo484kN');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('xGg350lFI180sPL282sNw853jUi349xLq496lXO072gFC066rX', 2, 7, to_date('18-10-2223 09:30:14', 'dd-mm-yyyy hh24:mi:ss'), 'zGr731pXz695tKv969wAY313uJv219jKp671aEG439dWj843pD', 'lSl080pDD597dPH856tWV625wEl329aCE483mKR136sFA064wM');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('hSs544gAO780tLT910lBF056uWJ448rPw474vJy337vJh783mN', 4, 24, to_date('18-10-2752 12:46:30', 'dd-mm-yyyy hh24:mi:ss'), 'oEB180yKa440oFc526gDH516uIk344hHZ033aBB494aBF622hT', 'gZA360oGL957lRR095qOo097jJv851eHJ090sYu461fQG769oX');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('cJM769rHp586wWM356xYl364xJu899hVv016bVE277pWS111qP', 12, 25, to_date('06-04-3074 11:35:13', 'dd-mm-yyyy hh24:mi:ss'), 'sNi191fSg694zCj936bER480xKV644vAJ410fFC610tXe244jI', 'wYD330lBs097iEO681rII073jCV051nBx368aCN020zXg016uV');
commit;
prompt 100 records committed...
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('kXg275rBi519kTv739mMC881oOD587jGV688rAf288sNd514mQ', 17, 12, to_date('18-08-2621 20:05:34', 'dd-mm-yyyy hh24:mi:ss'), 'lPL371pUQ943aMZ145kGY527kUV394vMm365iDz676rKH229kR', 'kVZ521kEa755fVM664rSe841mCE711bNA426rKC492fHP593bS');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('nFn987dYo376dKS314gHI182sDb875eBU420kEN580qTV469eE', 14, 9, to_date('08-12-2403 21:34:16', 'dd-mm-yyyy hh24:mi:ss'), 'vSv660gFN851rUX976gRd424mRz514yFN667dKM198rPH717uJ', 'uLV542xBP828oME740iOk410qEf060lIY240rWL267fKy159qT');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('iBL478tYA422zHi734aFk442xCN510kGa275iSN474sZv254wW', 9, 32, to_date('16-02-2005 08:21:07', 'dd-mm-yyyy hh24:mi:ss'), 'fUq951hKj881bBE978bSM357iKF999xPe110bTt949nTa125mX', 'rBW627jPU497eFD423bHs240cUN482xQK357hSb844eRJ921cB');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('tZj770wXE646qSO858cYQ766rFt154oZk786wFH393eJz648yU', 8, 10, to_date('12-04-2881 09:55:09', 'dd-mm-yyyy hh24:mi:ss'), 'nXf563vMx614mIX945gDE745dCT579sZC332lFv910jTt178gY', 'gPD310lQV951eAM093hHj049hDo623rOH874gAX250cGS581bI');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('fKC142ySu558nQw114cNM849nWq238hKh589wXn812wNa438fM', 22, 26, to_date('06-02-1985 01:28:50', 'dd-mm-yyyy hh24:mi:ss'), 'pVU923uUI826yAO991mDm954vPy596pDk215uGc314gTO410yT', 'nWb144vMK364oCo036fAp671gWS785jXb314dUx999tTg983nG');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('fNi799gNg626qPK815lFO935dXa160aLN937fYZ939uVq481tV', 5, 3, to_date('17-08-3006 05:53:57', 'dd-mm-yyyy hh24:mi:ss'), 'kEn571rNQ086rSS741kUw874sIo645xNV767cWm439ePP982wO', 'yHI759qFi682ySQ585pTP824dPU746fSg971qRH930eQn293yJ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('yEc280kAP573bZM113dHk275gYP712rMm834iYd275zNr858oM', 8, 31, to_date('16-09-2107 05:44:26', 'dd-mm-yyyy hh24:mi:ss'), 'gOK466tMk323aBJ810xHm924uNG420wGC855rMN850eUe382tR', 'xWA964kMZ286tVb636gBr097wTR441qMB133pSJ939lRs824bD');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('aEz787bWB792fJs739oDK627zUD232zWJ845tJQ475oOM111eO', 3, 15, to_date('19-11-2031 23:21:41', 'dd-mm-yyyy hh24:mi:ss'), 'kNb747nYZ264uRl740tOU676tGS311fXx486xNC195yCo513hR', 'eAo250xGs270qRI892oLG867dVH018uLe372qHh146oNq761vY');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('eUj552oWk057pOz129iLn784gIi327lNr561sLl613lCL296cI', 2, 10, to_date('25-03-1900 19:25:06', 'dd-mm-yyyy hh24:mi:ss'), 'uZm370sUe430jZL398pEh448xOB645tGh386bWZ274aHK727nO', 'lLO023zBi899bXn445fFL269oVP381iXg125zOP815xZY916gR');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('iTm526vOz354iCE660iCV166gUB889pKc014bVE318rGW892qQ', 5, 3, to_date('25-11-2826 01:54:54', 'dd-mm-yyyy hh24:mi:ss'), 'tFS875aEr879lPX312oOH829jIQ098mEo598xBa698kBS025iK', 'jSN552kSX789vMy049oKj018fNZ836yDU532sFF223zHx548gC');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('wUJ593vQA026fPy248iMY743gOB936oMV273yRj530aQu352nG', 8, 28, to_date('30-01-2004 22:37:12', 'dd-mm-yyyy hh24:mi:ss'), 'oWW669qZj181rRU388kER768uZD449tBb557qPe512uQx229rN', 'oWc411jFK961xFS838yYB299zHL546lMU962tFB969iMM812aU');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('jYw846qUW922gAQ235nGs258lBu398oXz381tRD512pNJ812pF', 14, 6, to_date('30-05-2033 23:33:38', 'dd-mm-yyyy hh24:mi:ss'), 'cPd587tZc564jOz971oMS433sQF027eGv899vDR312qKi696zS', 'yFC542dHc775rFm966pBm076fDe996rCi799nUj744bKV869pY');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('tQj610yDq458xZF538mTX412cTN744gHb420qAf348hQe643sW', 12, 3, to_date('17-12-2665 10:10:33', 'dd-mm-yyyy hh24:mi:ss'), 'bRb540nXn971rQv965uJC713oTH962fNx037xNp443bGt698sK', 'zMS376aOZ018kOF896gVs665sWz620qAq460vNi567kPA422tC');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('bIl922wRj648wHi083dMN956fCK082yED929lFJ554aDG716qS', 6, 15, to_date('19-10-3049 00:14:15', 'dd-mm-yyyy hh24:mi:ss'), 'mPp977vCj677gLk417rZC151xRV887eSA833lYs238nPG931jX', 'vQs561wZe439rEm537pSo663rVa290pRk728dYK035oUd812dL');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('aUU144lTX217nBR859yGN923vSE049rBe979hZx378uFS568rU', 6, 23, to_date('05-09-2589 22:12:25', 'dd-mm-yyyy hh24:mi:ss'), 'qXJ627sQx969hYj216vZL517zKs296bRK421vAK487bER150aT', 'bYj154cHK881mGp479wDX051rRZ114vUc315aHa095mYG480xN');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('mTA119nSq691iYe153sEW757lUa467pEw845nBs375yBa513cO', 11, 26, to_date('06-07-2191 00:56:00', 'dd-mm-yyyy hh24:mi:ss'), 'yHg722bNb869xHz558eIv693hXY416nDd342kOP290nVy270qQ', 'dOQ489bNx538wZg788ySA643cMr630lPS915qXP566gXz476qJ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('pXS872hGL992dFI076dFw866yRw040oJg781nFq349iYU056qR', 20, 12, to_date('11-07-2856 08:45:18', 'dd-mm-yyyy hh24:mi:ss'), 'tGE185zTP049kVP814eDw196rMz447mWH921rJf379bHA763bI', 'bEx893cFU340wEr446lQG847jJF274tMO819lPg274xJt717oC');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('nTF181oPm469vXJ543lJF675gWh315hSz850ySy444vWa968nF', 21, 32, to_date('06-05-2286 05:46:19', 'dd-mm-yyyy hh24:mi:ss'), 'vAD422eYf239sPK781tFH525aKG935dMd041uXG236tQh433mO', 'eAG345pSj280mLR760yER314dZL173zZL834fYL682aKb451bY');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('gUd496oAO135qFU627uFS436yRb550nCA691fAy558uAI421dA', 14, 11, to_date('17-07-2676 07:37:37', 'dd-mm-yyyy hh24:mi:ss'), 'nMM788pCn388zVg230cZO734uDx393qVk366kUq866lUJ497xE', 'qZi414hZC533eGo665fRR215tGd292kOx389mCj864tQQ030hN');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('qOA633hLq820hKv968cUv530uMo540pIe131dQL299hYy597jO', 2, 15, to_date('13-09-2425 03:00:34', 'dd-mm-yyyy hh24:mi:ss'), 'oQp258wJV147gXi893nIT475eIO134nYO623oQB938eZv596iP', 'yTV420gTw688qMs256hYF623rKA940uPn910rTJ270qUn929fB');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('kSW343vYv391nVH099cPr860eES421gJJ954kGs524yMg326cP', 17, 9, to_date('12-01-2944 11:41:08', 'dd-mm-yyyy hh24:mi:ss'), 'qMA726zZr817gYi692yNX574fLN438dXF952yQv679aBG119oY', 'aWC429wWQ249jXP326sBx483wRU017oBr068mHL511fLR426aW');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('lRn698pAD836yJt458fJg172sGm890jGN435kXB583rSr442wR', 15, 13, to_date('14-12-2781 03:58:45', 'dd-mm-yyyy hh24:mi:ss'), 'pGW775aZu984yGA549mJM763jQj759kTK588nTc121oCb847aO', 'uAs733qZV261dPc117dIZ393jNL696nBY219kPC670uFn096jJ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('cDZ443tNF154gBX334bGy591fPM332nDX273nMf566yDN856cF', 18, 7, to_date('14-05-2120 23:53:31', 'dd-mm-yyyy hh24:mi:ss'), 'dFf414hMU814uAl696xOM679iTd395sVM049vVE242iEZ734nT', 'lSC742aOK676aYC792qVh239qTQ110eMt128xRo879zRY915rR');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('nVR656kAU756fYk229wGM665eWg917pDr094rLE370aDd265zJ', 17, 19, to_date('07-01-2494 11:10:45', 'dd-mm-yyyy hh24:mi:ss'), 'kMo966oYH061yJg798gEO227rHk636yXW377mLT720wZJ870vS', 'wHP491uQu910rXY786uRp596aHq667kMT886tCK680qZT379dM');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('aKV090iCW862pQm379gNt321cTR033aSe655oOP529tVy452fS', 11, 18, to_date('11-03-2459 16:38:21', 'dd-mm-yyyy hh24:mi:ss'), 'iPf389zSl438yLK939lWL326yOW457bKZ249lLP568nMT075iE', 'aRg024vEG058rBx099aRc577xWs917tVM276uUW540qJk813uD');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('rVM887oGj122xUc872jKC125yWc596xEj459rXG668cEx313iY', 9, 22, to_date('30-09-3047 19:48:43', 'dd-mm-yyyy hh24:mi:ss'), 'wKf325tUw713lBJ611gXv835jDR649aLJ216hNH115cXH327nH', 'hGj567rPn069hDr616nUe662yGA395mLa476eSR570zDa550zC');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('tKX766gHH478iTq644kNz441jCX762eOP048tHV975zUf818qA', 7, 6, to_date('12-12-2279 22:30:00', 'dd-mm-yyyy hh24:mi:ss'), 'hVC659bRU777jGz257fXS653qOK961yGU891gYP935nWI157wS', 'mHu990pGU410bNO840bRy497iPU027hVv591vFU646wVS836wQ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('yUV587tKs975lMr085qXy145aNm657oTY785sFM747wBq284hR', 6, 21, to_date('05-04-3010 04:24:48', 'dd-mm-yyyy hh24:mi:ss'), 'uVw823iRJ892zSw789eIN554mNn940mYh564dKS199uXF120xU', 'iCG391kNI685qMD259iHy392qYo875zIP357mIS080kNE883gE');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('eEL273sHL079lPC377hHJ313zKY944vAF943qGi513tTx098qH', 10, 25, to_date('17-11-2173 13:07:40', 'dd-mm-yyyy hh24:mi:ss'), 'cRC386sEU333jYs359wZO747jVt633tEc278vOq121gST961iI', 'oLy058iVF173aHW157qQw191hQX732eUL842oRr641jJp666uY');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('bIV121nLX348qAw877dHE353jCX478rRE722tZr466nRD070iP', 22, 27, to_date('17-12-3023 20:57:24', 'dd-mm-yyyy hh24:mi:ss'), 'kZB856xRg491aGs360xTU987nMP427xZE819vUt062rLu329xY', 'zAd917tCZ862aGR425oPL040xYb157vEd998bTu695hPc592dM');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('rBE543qGR695cKa139sEu854lSZ473lMj492tGW413pIx019tX', 3, 19, to_date('24-09-2977 13:22:22', 'dd-mm-yyyy hh24:mi:ss'), 'uTT884cEa861nCh588nGN592zWb047xPz423lPQ087zDJ134aO', 'eBt473cMh677fUu565eDC871wOb182aDC959kPM626vXl081vQ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('uPw776pBJ941hWR473qJy751hAt166zOA179cNY845rCD321aG', 5, 32, to_date('23-07-2079 22:16:36', 'dd-mm-yyyy hh24:mi:ss'), 'oJr964cLy992zTJ525bKS623eWq249rRx339wRp885yXV433bH', 'gTH630kNy945yAM567eQv854zAd692dMz875tJW775gHX487eX');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('lGG027rYc329jUy764tIF768gRS127yBS536hPA880lEE546rX', 12, 10, to_date('12-08-2600 07:42:31', 'dd-mm-yyyy hh24:mi:ss'), 'eNz370jXM686iTB596bWv011tTS815fOf178wHG446eNU091fK', 'vYd837tCV040eDM347aFX286hJo548iVg850cLQ287sQa014tN');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('vBn388oQg748aXw243jDn088jWa637cZr816vBt415hJM219bT', 6, 23, to_date('14-11-2522 04:59:22', 'dd-mm-yyyy hh24:mi:ss'), 'zVj855pAt282oYl624kPx953jZP230aUR914kTq239vSv239jA', 'lET394eHp010vGn658yAP641oTq622vGA690sSU699nNz320rX');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('vDb336qUn774kEM112jDX768kFd519mFq214bLB047yRW839oY', 5, 33, to_date('14-04-1962 00:39:10', 'dd-mm-yyyy hh24:mi:ss'), 'jWY366qTR566kQM369oKn772xVa533lPE431cCb052fYL267eZ', 'uEk145wET347iFl219vSK868hEy491cIN690qDi080hVc753mM');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('sDb743wKq149jSQ115rOl994uGs944yXL094wYF848tZx843nW', 10, 26, to_date('23-09-2980 00:42:20', 'dd-mm-yyyy hh24:mi:ss'), 'oZx976yJN773qLI830zLS660nHc922uIw476rNh468xWu770hM', 'nCz335jGN451xPl049gEZ757jHn566wEf817hFs240dMO455nN');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('jSd281nRY860uKp961nTt513yMD069pYn283sRv113uSF816fD', 20, 24, to_date('16-11-2702 23:29:28', 'dd-mm-yyyy hh24:mi:ss'), 'zJI227mBl855aFP554tVq750eIi526rRQ974pBP059tQR131fB', 'aKZ617oKl545jEn394qGG254uWd490kCN135wSO745xCD117gU');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('aWD944yOT751aIW090zVc787tDT825mIK819oEu214eCq531uZ', 20, 29, to_date('02-12-2242 15:59:19', 'dd-mm-yyyy hh24:mi:ss'), 'tMA411nCC317aWV694gYf848lYr290uVu418eKa883wIz771wU', 'gHw859dXG285yWO742qME416vRL941gTF196rCZ318gCU226xC');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('qTL830bLI072gHq919tSy655xKS271hGk335cOo088uFC355jD', 4, 30, to_date('23-11-2938 22:36:11', 'dd-mm-yyyy hh24:mi:ss'), 'rKP533xEb957eRj458aIk794lXJ116qRW352lSV713dGA715dL', 'nTe247aEX591pNp923oJF184mRa364aAd759eCq482cDb380gK');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('yLV044jNO816bKE095gRF412uON550iEP538hXR517yEy825lM', 19, 14, to_date('20-06-2303 07:03:04', 'dd-mm-yyyy hh24:mi:ss'), 'jGM414wMa654mER292sXj935tAH890zTN034fKQ218vCe348kW', 'aTG569yIs657gOq013dPY181uZm549tTM751cRU463wJb334kM');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('hLx511wTn753gAv290iGA669iNb934eEz473tJa830xRM561aS', 12, 22, to_date('20-07-1905 09:44:29', 'dd-mm-yyyy hh24:mi:ss'), 'nCY868qXJ748xYK553pHQ011bQH910cFD145yRI287hEC268aY', 'wYu823bEy729oGd232eRR170hQe421vPk795oJc852rHQ281wI');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('eDd819sQT191eFi861iFf067hVg329dWS219rGT690xPz545dG', 13, 3, to_date('14-02-2563 08:44:09', 'dd-mm-yyyy hh24:mi:ss'), 'cIo983yWu067pWr992lSD824jKt379zFJ864fPS457nFf864jA', 'pQU681iUv146eDn911kNG928vSm636pHW987kEW669fWZ052hW');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('mQI092lHJ513oHK477wYp139nHG374qTV213yYm964yUc129pL', 14, 16, to_date('05-12-2094 01:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'rBl237bLM060uDF360tSE579xLW357sQj268bRh650aZp558aZ', 'pVU419iJW115mIk474nJp040lLg264rPx121hLr158vUV898oQ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('yWY881kHm974lDd474lWn536lOA258rYA933yTm772wZO439sS', 21, 6, to_date('24-09-2000 20:47:54', 'dd-mm-yyyy hh24:mi:ss'), 'bGV325pMB769lRJ222hNz243nQv883vMp276cWC195hEy242qS', 'sCG142bWz773sWo598eXe922gLk679oDB845gYw637wHu751fB');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('yCi371cXr984vQR149dHV240vEp553zKp999sZA625yXC694iY', 10, 8, to_date('08-07-2599 11:36:57', 'dd-mm-yyyy hh24:mi:ss'), 'mCA630dYe674yWw851fBW064zZZ382iUH295nBP732vXq180oX', 'yBs022aZK042pJt841lZg996rFZ558mSV433tXx759xNl592aV');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('mOU566iBz387bMx689pKA555sUo286cYg725mZb089xVB713jH', 17, 11, to_date('14-08-2916 02:13:29', 'dd-mm-yyyy hh24:mi:ss'), 'cQe739dUb146kPK358iNX067zNV457oGC857qEJ276yCF616tD', 'fBi182qFD451jHw374nWn824cRE564tHB326jYe658mSy388gK');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('bZS072dCY574yCa323cDi557nLp782kLZ110uFm922wTf357dT', 4, 19, to_date('27-04-2740 18:15:15', 'dd-mm-yyyy hh24:mi:ss'), 'fJG756kDi173bAL561hNR368oKf887hCx357lRN845yOt296nM', 'iQR652hND866sLy484rFu858qLZ421cRn957vLW340nIM279aJ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('wRj679rDl354zKC256rJV176cGE942rOy644aKe932qLO284uF', 13, 15, to_date('02-09-2521 22:43:40', 'dd-mm-yyyy hh24:mi:ss'), 'tTf234pNm029zWL549yWN236mXe161jBN273tMi923iZS046hG', 'iQy188dQP490lDq796qMs791jMP023qCz896gBv998aOs181dS');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('yZd379aJg431pEO130nQV126oJW424oKj922uXy810nFt022yM', 13, 8, to_date('23-03-2156 20:04:50', 'dd-mm-yyyy hh24:mi:ss'), 'iTf953wPi620yUe516uTt499eNw872dUX753qWy422mRD079xZ', 'aSh474wUR148yNi556hDs839xGT778xDJ221rWT333qUT735xX');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('bIk349uQP577pOM242bSZ942bVE551dAN688bME254qRi568wH', 19, 12, to_date('11-08-2911 06:39:27', 'dd-mm-yyyy hh24:mi:ss'), 'cHA932xDH535eBT752kZB618vCR187gRo627lVX252zSj926hX', 'yXf775jWv711oLy152uKJ498eFC085oBt954oIV471sFN661wC');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('bXg420bZv057pSF334eRl614wGx197dUg975pSB275mCE610jJ', 2, 21, to_date('22-04-2394 23:21:24', 'dd-mm-yyyy hh24:mi:ss'), 'qJB323mPb995hCW594oXy872bPL761tGd071fTc914cBI448yG', 'vHv675yOl682fWe533iOv288nXP374fZr373uME591cIJ714dZ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('hDr922tOO766pYj794lDw357rNZ614iQn563yKj792dWI089nL', 17, 24, to_date('05-03-2237 01:44:41', 'dd-mm-yyyy hh24:mi:ss'), 'iAb235aUw286jAC988iNt630mUw816tZS182lGU190bGs414xH', 'dHp641pFw848mMe770sLX350pGs477aFn492cNf578xCC861mR');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('eXk555oYq752pQr482fXA060kIP727nNJ697qIx677cXF882yG', 13, 32, to_date('07-06-2336 20:53:48', 'dd-mm-yyyy hh24:mi:ss'), 'fET757aQw097eWZ485bXM944nPT211jCI098zGD289nKY491yK', 'cYx380bDE442tTw675wQC872yDL492mPq117nJU978zQX618nK');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('xQc268wQg946yZY783tNo823vGp497dRB644fAI626tRP817oR', 18, 33, to_date('19-08-2329 23:40:24', 'dd-mm-yyyy hh24:mi:ss'), 'uFf866qFF422wVV862uXv949mZg352uSs574oCg999xHl374aQ', 'iOO378xUm432zBZ121oPG433uZB358rNN927hOw756fPK276nK');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('tYo113tTe356fFe544kPM560lYY056rHu751tKQ326vKv282mM', 19, 31, to_date('12-03-2425 19:48:25', 'dd-mm-yyyy hh24:mi:ss'), 'hSD992zXv793aQf151pTF261mLb622jQE162fXY460tSj919yZ', 'gXk647eMG122xCg632dSu752qVB333kDZ983qCI946bWy020pA');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('cJT396yDC652aNC326hCM110cTY084lEs675cSa063nWE845yS', 2, 22, to_date('06-09-2356 12:51:59', 'dd-mm-yyyy hh24:mi:ss'), 'tFc618cJS020nLh549nTu563cEW824tQw552qHS198xZC857pI', 'cRn811aBa993gNa797rYJ731cGZ624qMJ145sRG620vVZ381cB');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('dKa797zTc512kLg331aQa622kWP895gBj935mRg158mFN485vS', 2, 18, to_date('30-11-2255 16:24:14', 'dd-mm-yyyy hh24:mi:ss'), 'gMI653rGC339fNF743qCg617yOu823eQb165aOh224wSD336yU', 'pBG388ePS276rJh652fAc053oOm345jHr347vNr480zNP585tT');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('fOL967iIy884gEW736rKE526iGx283aQS795oGz922gDm038uI', 16, 21, to_date('17-07-3013 10:44:15', 'dd-mm-yyyy hh24:mi:ss'), 'zMt577aRe341vOx376pTU415xFW271aWu393oPH821cZS061nW', 'iNq187fSk554oMu533dLT560gZG952xVa892hPW657qFO319uN');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('uGv357yBv088tRM351tOO527iGO844dBa599bKA689gTL873sS', 9, 11, to_date('23-10-2239 14:47:28', 'dd-mm-yyyy hh24:mi:ss'), 'yED420iPE038cMt434tLs913yZa042pJB712kGp426zKy895mO', 'iHt860gSV079nMk477nJV555pMT864mFG099vWW213fRY355cU');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('pPy935yQc218sJa436sQW728wXw268oHs829fCu489wTf198bN', 12, 16, to_date('28-04-2721 19:44:41', 'dd-mm-yyyy hh24:mi:ss'), 'nMG433xFa780jFU526vKQ895bQo944xCn348iNo014wYU974hQ', 'oQq393uCb158qIO823lOm425lHV428wUQ153uSh937gSO262dL');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('vZV095nWz732bBI456iSz381mGN315iUd936bEw262gAM915mE', 7, 17, to_date('23-09-2857 21:51:15', 'dd-mm-yyyy hh24:mi:ss'), 'zLr968bQU871gVk529bGw647kAU770zOv827aQD895vSD546uB', 'oHz246cMb574vAX271mTr215vPI925zFo587iTN878bUP948qI');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('tUW597iPG060vAL394mPA315nIP825tZj144vAS287iMy899mE', 10, 10, to_date('14-03-2036 22:22:04', 'dd-mm-yyyy hh24:mi:ss'), 'cKQ383hRt249nGM517bWu192kOF815vWL949kEF010bSi895dZ', 'mOC980nFM343cDh053xEm388wLt363sPM173qQY280rYr925oX');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('yVQ977uZs978lTc615qBn022tQE619aMb683oXA178wBL136vX', 17, 3, to_date('12-05-2149 08:27:53', 'dd-mm-yyyy hh24:mi:ss'), 'hMJ974kHM194rDH646sAw446eRE421uDB323cEQ357oFy675wE', 'jRy687dRE837rOi949zWg752nFc865iOj872xLg459yNM253cP');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('xZO095pOq287yCM315wOE296lZq434pMb422mRT587nVu637hG', 8, 25, to_date('11-01-1946 04:24:05', 'dd-mm-yyyy hh24:mi:ss'), 'eIZ085mPO412hEB535iPY565wCp729qTd022jXm467mOF283iV', 'qIZ548aMz042mIl645lVf040fNT763pDg988iPU319cMR370pU');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('lOR013hKQ880fJh274nXG198tSO984oQl843qIw593eJZ314bB', 5, 8, to_date('19-02-2929 12:32:58', 'dd-mm-yyyy hh24:mi:ss'), 'bGB299hBa642gHL822bZI161mXI788qIT643uGr854pOI097nA', 'jAi824wYp168oYV393oHK542lQM651aLl379tLQ599hUK592mL');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('wOE054jIT734pXv660aON754nZK293kVb655rSW150hMi612bV', 17, 4, to_date('28-11-2071 18:51:15', 'dd-mm-yyyy hh24:mi:ss'), 'fCo451cHO329kUP390fSu799cBA680uGE328vIo683jUx128sB', 'jEY219dZN231zMr893xQc849hCO989pJa358kJG615tKm096uM');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('dRS916zNh475aIj351rZa120yPs752yHd533rBU627gNF578nZ', 5, 9, to_date('31-01-2650 20:13:20', 'dd-mm-yyyy hh24:mi:ss'), 'oUe466mEn098gVV170zAh934vJf836kOl179vFY622bUK626kG', 'rDv738zIF628uDg229aGg025nEW650lQD177fNP867lRP930tH');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('iIU364jCD772fWX196tXr069oEX667yDu453aMj137nCt315hT', 16, 32, to_date('25-06-2579 07:26:41', 'dd-mm-yyyy hh24:mi:ss'), 'tQZ414eOE113bTZ569sPk468yXp187pXh271mEP021yGc112jL', 'jHW898qOb734xFm620rPK798rSy598eCS332qSJ419tQJ845kL');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('eJD821eWI585cLw347sKM240kWA880fFv157aBl598lAV721dL', 13, 19, to_date('28-11-2911 23:21:50', 'dd-mm-yyyy hh24:mi:ss'), 'rIr594iTk167xRG394tSV245jQZ541lBv243qWI592yEM516yN', 'kXr124iGS740vNQ923zCJ510qXV039tVo810pSn094fUK373xK');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('uLC568kDZ554eCB698mCN656gWU934qCT744tSA921kXm724mF', 22, 11, to_date('25-04-3022 14:29:02', 'dd-mm-yyyy hh24:mi:ss'), 'iSN854aDh994iGw195uAL941zWj313iNJ072vHQ640eRZ561kF', 'rVR044aGx052aFO769rFH696vTB032bRM355tZY226mTx746wJ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('bQK664xSL473nDC630gML453bBT610yZB669iRF678fDX935fD', 20, 17, to_date('26-04-2221 04:41:57', 'dd-mm-yyyy hh24:mi:ss'), 'rGg166xEa590rIV495xZO517pRx375aSz782mAF683rVq363eF', 'hGj678cEO840zGI724aHV624iCu779vIw165xDs551tOg453iK');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('fGP388xQE025tKU286zAt089cVK812gEx064pBN826rBF179wP', 21, 30, to_date('17-02-2448 08:38:24', 'dd-mm-yyyy hh24:mi:ss'), 'bMA399cOu269hDR914kSI255tEi471tKJ026cSZ669uPM056iV', 'lHg116iCb831lFb870vXy426ePy613jMz089sHX711vQD689qY');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('C7dzReqMKmVp3i5oE56s', 54, 89, to_date('15-11-2006', 'dd-mm-yyyy'), 'nOjYhQf2b1gMyCNKnVnz', 'b8NuM9Qe5zBwKRSqlgqh');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('wUn9d5lN9gM8yl62t98D', 32, 62, to_date('10-09-2016', 'dd-mm-yyyy'), '2Ki1Rinne2Nc98mQL02K', '8UIKmSmBFUqNMO6qpv4n');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('JBM5UuSAYs3oPMpjuRmh', 65, 70, to_date('24-09-2017', 'dd-mm-yyyy'), 'ohhQxdyOXfxYojMPbjoW', 'qpA2lwuv3UiGHVrebFNQ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('Z8IBS1xEVvRtuX7HcDYU', 66, 32, to_date('26-08-2008', 'dd-mm-yyyy'), 'hDpWaxfIsR7EFMRsjQIs', 'f2Rns0nU0RuEKvhAOASk');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('nL0rpQ69YntMSLvgutii', 5, 98, to_date('06-06-2008', 'dd-mm-yyyy'), 'pspwqF7UEqPgvvIYDjKf', 'rnDbyw9Ist2byLdysCfu');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('z3lmdGvaamY3vjPUH5bg', 5, 84, to_date('02-05-2000', 'dd-mm-yyyy'), '0VlVZAgEyBbH79t1pdvH', 'bPrXcgWXTH968l70mXHI');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('j9cWdEMHA2YANrq7Ts4n', 49, 19, to_date('17-09-2012', 'dd-mm-yyyy'), 'TM2rkPAS4MSYwEOs1KDf', 'ZgfPQZmklSkO6nF1rVYb');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('engIgxZTgU4kL4za0KKQ', 13, 31, to_date('04-01-2004', 'dd-mm-yyyy'), 'Hja0qPYuVhvQIDswSoU7', 'Kc5WaAXbrVjuAZVMtKYi');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('VzdCjuL34RyM4lqlCVdB', 68, 82, to_date('17-08-2012', 'dd-mm-yyyy'), 'ERFv9EktVlb31Z7DyNBF', 'rgoTzN4rnPh8g61zPeXE');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('6GMI1cVmKVEz2rdEFXzG', 61, 77, to_date('09-05-2018', 'dd-mm-yyyy'), 'uaMojP7cIjFAzVgNqDj8', 'WwrJ4kFH4mPbN27LH2fM');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('aazLUdsyTxCh7qhkYlHF', 54, 17, to_date('22-04-2002', 'dd-mm-yyyy'), 'Q55WQz2WLpCtomQ9snRc', 'FfTCU4nzAuVhvsuYOlPg');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('mrzK3eAs1XqUX96oTR7m', 95, 3, to_date('03-06-2003', 'dd-mm-yyyy'), 'I6KBXJHljqQbdM0mYfJN', '6UNuHZzN2zNvYwDuYhXb');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('rzLshY2s1kyhcwtF1SSM', 85, 93, to_date('01-12-2014', 'dd-mm-yyyy'), 'Fdf9WSqhCVNXHtcd7XVf', 'A1BkFRBpaYlL0GWMXxJw');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('654lFb4IEosiQzgBEb5A', 44, 99, to_date('02-04-2006', 'dd-mm-yyyy'), 'bWZ8Y5PD9SVokcbr2N8h', '5vofspvv6JdK2ldnL1DT');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('X6JwVnMkA7H1DRoe1DrX', 47, 19, to_date('24-06-2008', 'dd-mm-yyyy'), 'MugTkbASV9l725x6BS9m', 'R2DC0CMtuMxdPecD8XXw');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('kV3wxV0wjuwOx4jnYdQE', 87, 53, to_date('18-07-2012', 'dd-mm-yyyy'), '6TuqDcpOHiMwWkjMsObH', 'Dz5BH1a9lqtRvtQGWwmY');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('nHMgExHkS98xQfCikSy9', 13, 64, to_date('14-06-2023', 'dd-mm-yyyy'), '2F51MqoPSW6VHkZKzEHt', 'qWY3H2OHct5lmxHWcKHs');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('3UQKI6UVMnM0yI2hcQT7', 12, 81, to_date('13-07-2006', 'dd-mm-yyyy'), 'gX0uu5P1SZSu8kYJhWMt', '85cltj6eTqAh8qAEYwBX');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('jooxV0uXzMkLubienmxm', 65, 70, to_date('18-12-2015', 'dd-mm-yyyy'), 'ws46woIC60BB31uDmBzr', 'ysL2Vg5jxwnTKHDCnshn');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('GuASbGP3QMnZiLY72T6D', 68, 74, to_date('03-03-2007', 'dd-mm-yyyy'), 'AOJiQmam3QQQSAEA9iti', 'wd5ojn1OcxHpVDlORh9w');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('AM2otR6CCW5TJ58VXVGc', 55, 11, to_date('18-10-2003', 'dd-mm-yyyy'), 'Bg4pnBpDkc2ne1ToSfyg', 'WwXiSNPzL5lgg0U1UyHr');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('GiwtLyAUYWidDNcFGAaI', 52, 47, to_date('25-04-2002', 'dd-mm-yyyy'), '2PqtqLvwHKoDXGSoMjE7', 'ljKvBz3OBjxFu6aFiuTm');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('448anVd5h1XF4ctrNTJs', 86, 9, to_date('05-12-2022', 'dd-mm-yyyy'), 'MWPa5mahTwvUOe8OfUms', 'mXqUt7Dbd9qh0pO3FJ8Y');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('RhrOAJb8j16myZZ8cvXB', 15, 22, to_date('26-03-2019', 'dd-mm-yyyy'), 'fsGZCXuNu8sseXxmYAxE', 'W6AZhhAcseNifeSyMnnB');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('RAOpQqBvsZCu6us9IgmG', 64, 14, to_date('23-06-2016', 'dd-mm-yyyy'), '8x8pqfkAxwZYsyFI7NzF', 'qIHbZNX0ag1ItbUuwiXQ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('h7RBnMPZfOO58pvr5nM9', 98, 37, to_date('24-10-2007', 'dd-mm-yyyy'), 'wk2JVzyDd1eF83rlk9QS', 'h2Ke20AodQerywR1vZXR');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('igzgToqb48KmvZjH8xjx', 49, 47, to_date('10-07-2022', 'dd-mm-yyyy'), 'GUYgGHyBYS0rs7zU01Yx', 'XheBRhExBwUjklkq5L4T');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('W0TcQjOG9v5RRq3vVb9N', 97, 17, to_date('06-08-2016', 'dd-mm-yyyy'), '3rlYHcajIlLghuEiCZQI', 'iSdxh38qZuK4N4cAg6Yc');
commit;
prompt 200 records committed...
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('BvYrxmG8B4mdqv8oygar', 20, 46, to_date('01-07-2016', 'dd-mm-yyyy'), 'LzUzi2sDtVCxsp6R6BXf', 'CtvYAvgFbTL2AAZgFmxA');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('VLw3FWZDVAX8furq3imB', 65, 20, to_date('02-10-2022', 'dd-mm-yyyy'), 's067Y40TWM4XRHxXZl6o', 'lTrFogukbCGWcM9vGhtR');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('oGk4KBJs4mtodOv4vxx8', 68, 80, to_date('11-06-2016', 'dd-mm-yyyy'), 'm6uL6DOKPLHx3A2gDHRH', 'VzC3eFFu3qIMLCOrm1DV');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('81DBQ5TCBV92Sjm4KCSh', 24, 36, to_date('03-06-2006', 'dd-mm-yyyy'), 'BuOY8icGRA04pTKrkUG8', '2E7ahpr4HTZ5gbfwV4Ed');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('BTs2qnWO8CxFzxG201xb', 10, 67, to_date('01-12-2000', 'dd-mm-yyyy'), 'kPEKLIdF8w9qVbxmbhjM', 'EnHwO7ApkerBGW30z38f');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('nrVB7jGgDcJgBNSAtaEW', 96, 86, to_date('04-09-2002', 'dd-mm-yyyy'), 'Oj5M40sGvvRVs0thwS6M', 'WEueA0W3DFYMYrPgGAlx');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('Q1uRKtKHvt2DXGlthVQn', 23, 24, to_date('07-10-2001', 'dd-mm-yyyy'), 'pSbL4gwJCZ6iDPPx9543', 'DK1AU76gWO66nR9P7yva');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('6dXTBxc00Ycbob45y5UK', 75, 39, to_date('21-10-2022', 'dd-mm-yyyy'), 'kjqIqmn6xgw6p8bTRVvk', 'aBaHcqik1wlXT7p22T6v');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('9ugEkJptTBCmjiKwAwdJ', 39, 45, to_date('02-11-2008', 'dd-mm-yyyy'), '2RshfiyWPeNwZNnXap8u', '66HqUBjX6PXjZ2lx6wUY');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('pds551YlSg3TPkPWUorW', 7, 66, to_date('26-04-2001', 'dd-mm-yyyy'), 'qGNiCuUeCZI5bFRznMEv', 'gAkSmWoYcU6jNsUXQVBI');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('mH8T0FeDfIPyQBIC95w4', 67, 47, to_date('07-12-2019', 'dd-mm-yyyy'), 'gGnAln3dNdKmhZcYgE62', 'rdyMQv1lLGatE8JVx76r');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('GIITU8WYsLSfKvteQhBd', 39, 40, to_date('26-09-2001', 'dd-mm-yyyy'), 'T2C89zpJ2jEIUAaAqK4z', '0zbTDwRG9Mssdcz5ADpx');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('F3m2SAPRJdX4UebXIMhI', 22, 24, to_date('07-09-2020', 'dd-mm-yyyy'), 'oENX7rbGQTPb1d3lV0Uc', 'CNzm3UEQ3OgzUrpuRsjs');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('X9sbgetf7tTvn1qwPW8B', 51, 88, to_date('17-04-2018', 'dd-mm-yyyy'), 'sYcJ4GLnKASuiswrH01X', 'N2zpXtWsjhTgswCmUgMk');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('UGnsttShlqLOAX5RMdfo', 51, 69, to_date('01-11-2006', 'dd-mm-yyyy'), '4sDWU43IRTgYNXn5ySiS', 'stTujbKUlYA2MbSsCZ0v');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('jXHSJUwVBAHb2TnBMR4M', 95, 13, to_date('09-03-2009', 'dd-mm-yyyy'), '0iZKR3htj39d0WtXSiI5', 'sRjP67QU0h7pRXzshIuW');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('YhVoJ8eJ0X4233h74uTx', 82, 87, to_date('21-03-2019', 'dd-mm-yyyy'), 'Rnxmx3t7tkqYxMblgHy0', 'xLu9F7gpI8rIGXb9v67o');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('AtGmLZFITbw4ZvVpuquC', 58, 31, to_date('03-01-2014', 'dd-mm-yyyy'), '3P6gfXhQpaZIyqP64Z7T', 'rsEROvGfq6V90yXPtmZ0');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('FLwOIHdgURyQ4JGus2Fr', 30, 21, to_date('27-08-2022', 'dd-mm-yyyy'), 'OiN4jN4ecoxt9fAYgMkc', 'HVCmZKKja9w5LqWU1KDP');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('x5q9vvyjRTTb7hZoJ8l5', 58, 12, to_date('28-04-2013', 'dd-mm-yyyy'), '7vY6kRDRec5j1pNsWhEp', 'MCZfF23W2gFKfJl7l7XC');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('ozjzovceamkj9h0Sheld', 8, 66, to_date('03-10-2022', 'dd-mm-yyyy'), '1fXfVELJkFRomRwj5XQz', 'TLZ1HrMmcCJvWO3QlS0u');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('tLWhMATUhzkwQgP9gc4T', 52, 13, to_date('17-11-2009', 'dd-mm-yyyy'), 'CekPDKj0KSTTPwoK9mpl', 'uNRnOqgkvPHEpZ1Po0Qr');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('3HDr949pZQb6ltnD36tt', 27, 44, to_date('03-09-2006', 'dd-mm-yyyy'), 'LLavB5q1jncgergvqWUJ', 'OUc8xpraTeggi2dy6jyh');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('oklbQJ1wtxpwrmrgpLbo', 29, 56, to_date('10-04-2016', 'dd-mm-yyyy'), 'ZgoRKvkrpeOfkaSI0wrD', 'OwruXxBbhuthhE3RKWLu');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('w6nAvprRWz7Vz0tbj8dl', 79, 56, to_date('04-02-2019', 'dd-mm-yyyy'), '9eK8CFoIIRk3G64y47gf', 'n6fuIPCICd21jPt5Znci');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('kkEE7H8690n1lK2HPfm5', 12, 71, to_date('05-06-2019', 'dd-mm-yyyy'), 'QuxLvDkyUxahxtpcrs4u', 'ZTHtlrdZozCQAe1udCfl');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('EIgyQIGB1SIUrSSXUGy3', 90, 7, to_date('16-11-2021', 'dd-mm-yyyy'), 'QyI0ywsQ6VZuAj2fbcJp', 'nh1PQbIb4lMhaSeBgDxm');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('JVFm0HiKvPL8TxuwCRaG', 54, 42, to_date('28-12-2011', 'dd-mm-yyyy'), 'cjvlNVPkbs07d7MT1D5L', '0ApXMvsWOq7JyXWtzQBt');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('AW6YD5tuFB2QjAeLjNnd', 81, 33, to_date('16-10-2019', 'dd-mm-yyyy'), '7s1LWJg0KdAfISJodtbm', 'cF2pirMduIHsBxpNTv2O');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('7pXMsMrQdfQyCsdOJ4Qw', 87, 17, to_date('26-10-2002', 'dd-mm-yyyy'), 'JrKNLS3NOWnJIiDpTHMt', 'ba9iwKCqqbjr4o3CIu9f');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('hkHzC0oXSne8mMj3cJhI', 91, 45, to_date('23-04-2009', 'dd-mm-yyyy'), 'DdmqNoF76geOzGFLOIjd', 'UEflRXCeBpAgMMuKNdzg');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('lEVYo43VBxNAzEUDxxwP', 19, 21, to_date('28-04-2010', 'dd-mm-yyyy'), 'kgUT9PwcFY6EgCJ7Temu', 'EemwwHIAHsrjzfIBrfXO');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('omsS22iNMYcHhpvh7J34', 48, 21, to_date('04-03-2016', 'dd-mm-yyyy'), 'm94gZh1fUyH0dnwQvkB4', 'O8LM6gxM3PVmpjjW4CEm');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('QLRM7i243UCBt1hjY5IL', 12, 40, to_date('01-07-2003', 'dd-mm-yyyy'), '2DDCyTpCGiQKdczY1vsS', 'FOXzQgeWRxPytBaEv4hJ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('NPQAOwV0LUxO4JD5k8h9', 47, 38, to_date('11-11-2017', 'dd-mm-yyyy'), 'js19Sy84M0FI3EJo0a7m', 'byTsFRLkbmsJUH3iysVe');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('soIrFQoX81DKge5WbhA4', 3, 70, to_date('27-12-2005', 'dd-mm-yyyy'), 'yUJ8x5hoxAZ3Vh4YMO9j', 'rKAIJJuGVfGJ4ajGMud1');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('SNXmE5fPhWLhPx9x26OD', 72, 56, to_date('10-03-2003', 'dd-mm-yyyy'), 'JoxUyBOo4Q1uzzP44WHE', 'c9E5VjxyeFagCUXwbTpR');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('3Wd8m2lVBQy4tek98FB7', 71, 15, to_date('05-01-2001', 'dd-mm-yyyy'), 'G7U3rhlidkDhZhQfpzJf', 'ygoDIwMtbTZxi38S6S9f');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('iBdwkwjt6NXHkDCArTSi', 98, 81, to_date('17-03-2023', 'dd-mm-yyyy'), '37pGXObj92aVHHxgu4xx', 'YoVwnVjHRTjtwI4iujsG');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('VsWdxtX95tovv9vfhkIa', 44, 4, to_date('14-04-2016', 'dd-mm-yyyy'), 'nUCWOxxyi8GlJzZjFKG1', 'eCDmbib6r5kURIEsX11x');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('rdoXmH7v1PSaBnrKFgRT', 27, 94, to_date('24-08-2013', 'dd-mm-yyyy'), '2DxIInBo92YR2b0LJkQc', 'LRwVi4QwskFrkpoiD97l');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('A3eQ0pZViHGlWtzTIiMU', 25, 62, to_date('21-07-2020', 'dd-mm-yyyy'), '7xorX08coCo6CT4g1RoE', 'D4OHSbAg7ZdGxRbt1M2m');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('WY7tGrjfCj10TaDsjVxY', 51, 95, to_date('28-06-2022', 'dd-mm-yyyy'), 'LU8gQIKmbKVZcRVSS1xK', 'hcjoVnLLV2SGir6FlvpV');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('ksnGSIRhTxv1oxLDz7z7', 44, 16, to_date('19-03-2013', 'dd-mm-yyyy'), '4OUA7mQs9k4keZg7qJMb', 'LesMmy9r6DjLrkFCKT6w');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('0vpD3RUIijlXVQ15a0YH', 94, 38, to_date('01-06-2012', 'dd-mm-yyyy'), '6ygghROCbtojvXLYrAKS', 'rC5qOWi9czGiyfjT59fV');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('emmcL5gk56xr3JLj6H3q', 63, 14, to_date('05-09-2013', 'dd-mm-yyyy'), 'tDHAoGc7y6OrfFDPkf6w', 'YKRBgtkWUio6pFqJF8fe');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('8XrZDSkxmxluTZ6R69Iz', 19, 12, to_date('20-11-2008', 'dd-mm-yyyy'), 'jYOhKJZR77QRjfVy8fEw', 'YnD5SeXu8mmvp5Yip3Ih');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('bNmO5f0iEHUgKZXfFAi5', 29, 55, to_date('21-05-2017', 'dd-mm-yyyy'), 'mP8CRxk6etSSwUvYnFAQ', 'PZ0Dv1gizPopCv9UQGVN');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('3PKN9A7e8SnPk6ooAiqk', 94, 87, to_date('19-09-2017', 'dd-mm-yyyy'), 'ynmu5W3yKaJttOPNtFqS', '4NFrZzS34cJsKN8Iwrxx');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('6YogdvPqm0qv47UhBQbF', 6, 81, to_date('22-03-2017', 'dd-mm-yyyy'), 'cft0BEJ1xw32x1YivWwo', 'SrX3l2M9FC3NUyUVmjzn');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('JDRrKuieBUkBSHR5Q15U', 40, 29, to_date('18-05-2012', 'dd-mm-yyyy'), 'iHRQ9g0wDkTwwE0HN39D', '7hagv2kK0xzK0UqYMF93');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('3LyIIj1UL2uQqoC7ZKrs', 27, 19, to_date('08-08-2020', 'dd-mm-yyyy'), 'FSdZmadpXXQu2N13IhML', 'RzfKSIEe1nUycbjhZaZ8');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('6y0zf6LjtRNezxaZShYX', 75, 76, to_date('14-06-2016', 'dd-mm-yyyy'), 'JUT7ox8EFEVq8j2sEtb3', 'uviFM5BUBHrNDcsbnJT8');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('UPfWJMhglvMP6b8GDDh3', 80, 40, to_date('02-08-2013', 'dd-mm-yyyy'), 'PdvSxItRuUKrAyFsXE3f', 'qlIKoyGlJQanEHf93oeU');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('iDbsx4R4PQidkYhPteoB', 68, 51, to_date('19-01-2014', 'dd-mm-yyyy'), '4A5YDrfItLtLldTkHlOe', 'xhpWcaxu7kGNXQLGhZfp');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('oMGlM4NQ2rHoR3YK5gxP', 15, 42, to_date('06-08-2013', 'dd-mm-yyyy'), '7TL1fkyXamXd18nZESkz', 'sD4ytOAC8HZ1BoDP5PUN');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('d8Dt9pqcy1rdI730DOzP', 64, 85, to_date('28-11-2015', 'dd-mm-yyyy'), 'AhcejEvtsGTce7AHQpqu', '89dtxQApjdN6htR8w81Q');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('yvC0RFv1ZCgDMJcIzQKf', 69, 50, to_date('23-11-2017', 'dd-mm-yyyy'), 'FfqwgLwFoTOfysOhJgBR', 'aR2nlkYIaxTxW5viRjxw');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('p8lQWKfvrwHlcNSXzpzQ', 41, 74, to_date('20-02-2015', 'dd-mm-yyyy'), 'WZPbL7hh4ZUIIPps1qHZ', 'U2mWwNriwzC6LsLs6m12');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('CFjkZLKg0k7i31Vb0cXq', 66, 61, to_date('07-10-2013', 'dd-mm-yyyy'), 'PTbiYKiv8DMCNETWFVvd', 'qYHyZ4Z9xuN0fp7aAuzB');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('2alYgFjgcM86bBymVDHG', 16, 65, to_date('24-04-2010', 'dd-mm-yyyy'), 'fSSdxsSmgdhaTl92EKV9', '0OLALSkVCMZmp9KbXmC0');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('SC0dOG4An6i1Z5BkUc6u', 77, 43, to_date('02-09-2023', 'dd-mm-yyyy'), 'ntVeRrT0J65uCdbrfsvG', 'QIwpObT1GoLH7EOcNUkY');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('NqtHNVNNBPqRc9JATlFv', 6, 62, to_date('02-12-2022', 'dd-mm-yyyy'), 'Z4kSZx0uRBgRv0xWQNFD', 'JwR9r01bHqr0y2cNdbqQ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('mpdr4zrasOIZmKkIyAYx', 54, 34, to_date('25-03-2010', 'dd-mm-yyyy'), 'SngEBGd4ucuDhSpwv4sc', 'RJJtRe6DSWzxHihwd2DF');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('fvk50GKblvduh1EjeL5r', 26, 21, to_date('21-05-2014', 'dd-mm-yyyy'), '99IOcS24KpTlxDYp7iET', 'M9pO3l9cR1qfMzRF6Ivo');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('tt9hJgoIIHBazDIPaqcA', 96, 14, to_date('07-12-2006', 'dd-mm-yyyy'), '7x2hdfEAZu4o37VWLspj', 'C1ifqLU2I3xk9wUl3muW');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('o4319U2hhwOyufSq7NWj', 73, 98, to_date('25-03-2007', 'dd-mm-yyyy'), '5po8Y9kNTHfyi9CZ2VJk', 'eX8oJY2li9rKWiyZzPWp');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('SKc0qLftJozhdWOzHS7L', 85, 88, to_date('23-04-2015', 'dd-mm-yyyy'), 'GZ9SPvdOFtshFG0wpJLZ', 'hOwMTKdIXsRSXUEV0P0c');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('1cjqlv29gmm9ZmMjq7qC', 87, 4, to_date('13-06-2013', 'dd-mm-yyyy'), 'mCUIoXb6breU6T7o4mOp', '6DzicKudj6mlh614sdBs');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('GaFBV74iQ5VLIoLh3tv9', 53, 62, to_date('23-02-2018', 'dd-mm-yyyy'), '0RqFWoCfLSoMZlFma1Gg', 'LSPK2UB8jK1t4wJwGwt2');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('6UcgpSngEiqUGXrxHeoH', 79, 50, to_date('02-05-2011', 'dd-mm-yyyy'), 'usrlUhhxCRv9veK3b8JM', 'nY8kgjYz9ezh1enizph2');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('nQQ7u54fVnfHxOga9QJ6', 72, 39, to_date('27-09-2018', 'dd-mm-yyyy'), 'vzgqSc4iKvFGJsjTnuyH', 'I16PWgl2EDN9jxXeDkse');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('B1knVMXshql0bl81OlLM', 99, 16, to_date('21-06-2002', 'dd-mm-yyyy'), 'FzLczK6gGFqmoPnMdivb', '86qaSBX8YgY09YVjvOHE');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('1dEC7GbGLoJ30UzrfKwM', 43, 51, to_date('06-08-2015', 'dd-mm-yyyy'), '5f2icjR4CpnJcvguJzet', 'urgbBxRCVffMIPREbf7c');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('WZ4a1gVhJGYTzbDNVxLe', 71, 39, to_date('26-01-2008', 'dd-mm-yyyy'), 'IqQ2gojylQkeWNujVOXy', 'epXsqzdtA4nZR4tj1jsq');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('QlJCs7gMYhzBgbSiXijj', 57, 30, to_date('10-10-2014', 'dd-mm-yyyy'), 'QRWnGteOwJXRn2lkzR08', 'nyD0M5kzRvvvdRLJZ2p9');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('EYVg8sLWEbPjtFwAB08y', 1, 73, to_date('26-12-2013', 'dd-mm-yyyy'), 'RCCzvZANt6oZUrFtpvwa', 'NIUQy9Nh3CwM7eIXcvPZ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('MKqk3sqn7DWFoTUFa6pK', 17, 72, to_date('22-04-2014', 'dd-mm-yyyy'), 'OiR0nrVdqX2enEn7xUzR', 'X7G4QDUavKlugs9sr1kz');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('pPyFpOA5R74yqP5I7iMQ', 83, 24, to_date('01-05-2019', 'dd-mm-yyyy'), 'xoSAQNQ5joD2l8zXTUab', 'PjIDjGmPfb2BLILa7t0Q');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('a0moKtMAJToJ9DiuxH4Y', 84, 51, to_date('25-02-2003', 'dd-mm-yyyy'), '5TneGxpllarb6OMFtYMg', 'vsOMg8imN3geVko4ueIt');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('OfCZKwhcMeubnCRdPgJy', 1, 82, to_date('16-01-2009', 'dd-mm-yyyy'), 'QUxCbPn0RDl7VsWCGzzB', 'nzmfM9mnAQ27dVTxSpaq');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('E6E0g6KNYRxsrS2n8JVZ', 45, 16, to_date('28-05-2007', 'dd-mm-yyyy'), 'N9x2qfsCs1OklB9xtd6G', 'uRtQlUvNvwjlOBRjEfoT');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('ODj7jzvqMe5URGEXFWX0', 47, 11, to_date('03-02-2003', 'dd-mm-yyyy'), 'Ba9u2V2KtLqzPoXgfWjk', '2nbMxzRv6AcQLWyrv4Fg');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('uUS759eOh182aPh861oVf352aVO261oDA950aNj389nKW947oF', 14, 5, to_date('20-11-2645 18:08:47', 'dd-mm-yyyy hh24:mi:ss'), 'xTg623bJi120nGL682gXI951zEq323aWl280mAh597gYG650hU', 'wQj156bRb038wYq213iED148fIN594gNT935xPa852fGA810vV');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('fAt222jSl121vAr136pCq963hOO955rRR050bEv513oWW646xF', 6, 13, to_date('04-08-2692 01:40:39', 'dd-mm-yyyy hh24:mi:ss'), 'yVi310mBO775xGU616nRM676wRw162lEH213nDV238lIQ260hU', 'tFx919nRE772jXr310gYq865nCz923sWz464zUq360eWB977kX');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('cGg990qNg883oDu794rXD113eOy741xGa665oHU751dTg285qY', 18, 32, to_date('02-11-2478 18:37:09', 'dd-mm-yyyy hh24:mi:ss'), 'wLq957kVF565yJW754eEm418fTZ186hKZ719sDE632qSK757pC', 'bWa649zFt190cDC453oIX966yYf466aHT276tUV273tQA728jJ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('rCq662eOA729pXN443jMH127mBZ734iRh238qUq974bFb935mX', 10, 9, to_date('11-02-2703 13:18:37', 'dd-mm-yyyy hh24:mi:ss'), 'kNi960rRr067nMV298pJu434tCE136rEC945gSG393mKN078sQ', 'dPm569jAz321uXC874qVY273aTV033mEq655sXS642jPD441lN');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('iWq174uAt229pDk067cEl776rVA763xDB312wQq497bDK263oY', 11, 6, to_date('05-07-2030 12:09:04', 'dd-mm-yyyy hh24:mi:ss'), 'nDF954iQH777oYd638bHL479wAV492gIt322sYl248fIc468yX', 'yJz761lLE655iTM916vWW487qEL430qKD481tKF515aMN041yA');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('hLB866gCF479dZy146vWk125jSp135pNe747cBH610eEJ218fX', 14, 6, to_date('29-12-2493 11:29:45', 'dd-mm-yyyy hh24:mi:ss'), 'iVw637mWA119zZw153vNy461jEn931jDg117yTB329mCt220yT', 'lRX174hDK794hDF616cRz189lSe018iLq616oKU580nIY065qE');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('gEe997tQj255xUu792tIz468uQd534fYQ169tYA231qNj678mN', 13, 20, to_date('18-01-2769 23:56:58', 'dd-mm-yyyy hh24:mi:ss'), 'bXR360mRZ242lXU336bOT989sSD310xQJ395hRp255uYL034bM', 'hOI455aTz442nRp420mMn056bMF146gLQ953xEd528aOS394sK');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('dXk659wOE111zJl537cIV572wRP471nCt896hZc515nJk590pO', 12, 10, to_date('25-12-2234 23:37:32', 'dd-mm-yyyy hh24:mi:ss'), 'bJh667ePV838pDt249dDV139dBR877vHp472tWh769yAb242wS', 'kKb540lXK140bFp595jLb740uXM977vDa422uEY216kBw411qJ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('gNF327yNr398zAe141xXr151oPy375nTg531hVX758gCd881iZ', 11, 30, to_date('10-11-2123 01:40:30', 'dd-mm-yyyy hh24:mi:ss'), 'xNm113zNN286cCD765bML238yDJ236mId634dGs990gLJ270xK', 'dDU012bWF674rEK567qUh110kBM245vBB352fAu822aPG314pF');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('kYY697nCG081vKl929jOf959dLb591iDD881iLA431jZL582oO', 2, 10, to_date('06-09-2683 06:02:44', 'dd-mm-yyyy hh24:mi:ss'), 'xXD215aBn015pSz977mXg531uGP564mZX249qSQ288fOO052gZ', 'dUg260wQM381pNr885rKJ466ePS961jUf180uSK616uFX634zE');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('zLg067pEe549qWF869gZO878lSm019uQz423oYd180sEv226hZ', 19, 21, to_date('20-01-3037 20:46:27', 'dd-mm-yyyy hh24:mi:ss'), 'rUH483rIW158xGI683zCX567pYN321zTp433fCW216eHe311gT', 'rUM915sXp242vZF767iLq773nBC378cGx575cWH422vTk622zC');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('xGf776oOr284jXV547gPd440qMo850rPh316iNl733lLS926zE', 12, 18, to_date('14-07-2507 01:30:51', 'dd-mm-yyyy hh24:mi:ss'), 'eKv999pIh882uSB588oVW393tWr470jTa727uEG091xXX189lV', 'eOV361sLa421eNO177vPI922iPg259mMG733pLs446oUc346iE');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('eQu011nGC029lVl468jCa894wPp483eNB844tLW845kQe872kP', 10, 30, to_date('30-11-2140 18:10:56', 'dd-mm-yyyy hh24:mi:ss'), 'dGY234fME349tJe291mWK197fMj730vEt315pNF525oCs388uY', 'xSf168wYQ132kNH655qSU599bOZ641nVA876pTL622nEp428nL');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('vEY315yYE650zRv040aOh648kVx995cZO740bQY337eIk470zN', 21, 12, to_date('29-08-2520 19:44:49', 'dd-mm-yyyy hh24:mi:ss'), 'vLa178zWk213gMK341bFE155sTe974tQx331bXI095fBQ033iF', 'aHL949fXk075zFT466pMZ246jYY084fTp713gGx150aNU443qI');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('tXn376bPK475nOY092xBz664cAT959eDl161gOT917iFk843mH', 18, 9, to_date('08-12-2345 17:41:08', 'dd-mm-yyyy hh24:mi:ss'), 'bZo737xTk094pQm346tRq981nRy131fZm511uEy527xFi946jL', 'fJk891gDI915cSY666oJv468qSx645lVy346qJW279qUq994mV');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('zFi114dDf475nVm128mQY423hLS049zSZ174dTV674hGW312jI', 6, 11, to_date('22-11-2470 02:35:31', 'dd-mm-yyyy hh24:mi:ss'), 'jTx354yCc359xNl116cFL525mAy992aJr299jMW057xAa273dW', 'eCj120dWd330zLp750dAv659eNa429dRu547uGy958bVb459gC');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('tKf590tBW025uYj829uPe739hYT097hAA884fMi792eWV237wS', 15, 15, to_date('02-10-2217 10:26:49', 'dd-mm-yyyy hh24:mi:ss'), 'zGH768sNV993rNn737xMH631vYj023lSy930sXS257dTl741yT', 'cSO336aHU193iLj485gAI277dMN379jJm951bGD722lXZ429hQ');
commit;
prompt 300 records committed...
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('uVU648dJU599dTf852dOQ763pXd599nTA772sYV757vQi063aL', 11, 22, to_date('31-12-2195 10:19:12', 'dd-mm-yyyy hh24:mi:ss'), 'xCS544bUw761dOR125kBT877hKN734pSJ572qCb056bXl666bG', 'kSX980aIL884kHy660gPN128zXY574yPo779wQa721nCZ714sH');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('bHa742tCb433vKK962vVu851aEC110kHj815yLd157cDh560iS', 15, 18, to_date('15-11-3060 01:16:01', 'dd-mm-yyyy hh24:mi:ss'), 'pUL536oGF792hQt788bWZ367bVt574gJB233yXH462cMt316lQ', 'gQL482nRA086gXy219uDA077oOn070oJA367hQd965hXh393pG');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('hYY185zIM319lZq144dYl486mXh324eJL667rHq780eMj476mF', 18, 22, to_date('11-08-2313 09:29:39', 'dd-mm-yyyy hh24:mi:ss'), 'dHA454bOy123bSv869gCu579yVp697eOs063yOK764eMD852rE', 'yLv985lYy360lTh576wXi162wVt383vHg910uLU799pTH669eL');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('kGB259fBI285wOA332rZB460wRf132aEW597xDz217hDJ246eP', 11, 17, to_date('21-08-2111 13:41:39', 'dd-mm-yyyy hh24:mi:ss'), 'lDD050qVA710nMm771rUC180gSx298eMp210xHF674jTU710cI', 'vYf046lOE528zES443kDN889rNC610eDy298oPI872qRq657aC');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('mSe824aVo081bDc186jSo660kLx915rRG024lPZ256lDJ013eG', 15, 20, to_date('03-05-2513 19:57:56', 'dd-mm-yyyy hh24:mi:ss'), 'fIM219zZL073mPm572rHF082uQZ819mVz119kXD575tIN515cN', 'oIz797wRI321lOG161uRP081hXH211uOJ628dMI326eKE121sD');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('vLr873tNL079kUU728fQg530aJU881kAp985sCk441eOK442sK', 10, 33, to_date('14-09-2783 10:09:07', 'dd-mm-yyyy hh24:mi:ss'), 'dWs258dNh083sKL298nQe970wHR019qPy038dGj030vTS174hL', 'zQk017gQX278dUB725yZg462fYs416vQM370sZM659uUZ965yL');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('lFm462yGv452kZQ298dXe688vDK799cGM817pHV940sFl070fZ', 6, 12, to_date('30-05-2181 22:51:53', 'dd-mm-yyyy hh24:mi:ss'), 'pMR537gJU581fOw741sVm560zJY236yGC679iXo515mZc285uD', 'wLa650kGL651tHY318pMM827hIh651xNn187zNT059xMk339rR');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('fGM368xEW331mPp856mPS195rJA762nDx488gEG038iMz817cH', 14, 3, to_date('16-01-2764 04:00:37', 'dd-mm-yyyy hh24:mi:ss'), 'eZq781oJq947uMS940jSM113sEz216dRv815vTI698dAL769gP', 'yKE417vAB859aRu673dRN762jCF617sHa549dQf457dAu244nM');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('yKc872iFy494hNd329zMb831qNH165tWD873bIk740kXY545aF', 10, 19, to_date('10-09-2117 04:59:22', 'dd-mm-yyyy hh24:mi:ss'), 'yKs547eTc792tAG478kAV583cVO947pOE915wTi393gIW852kV', 'aXx167rQj923jZA258tNs899bUM138lXl654aFo760yDd935oD');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('uIK495fIV366gZq752wNk325rNs923rFY113cOv469rPt563aO', 18, 4, to_date('27-05-2278 11:10:01', 'dd-mm-yyyy hh24:mi:ss'), 'gQC167gAS910cBE795sCK425mNt361kQd361yGd184zOk098kD', 'yPa053xGY832xGN051iYk062wIo926yTu262hGX757hTO960qA');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('dEM712dWe717nFj036uEW323wWT247kGz540uOs676yYG781gM', 14, 29, to_date('15-03-2275 05:00:48', 'dd-mm-yyyy hh24:mi:ss'), 'hLF643rVT610lSS863sTM115cSd945vFV774zYd837bQT265uP', 'eNb989eLR988kTb838rXL696jRS669ePR451vUt223tTF687uT');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('iOW542wJm877zIZ763kJp499gSn839iLS582dYc257dEh329qL', 2, 30, to_date('25-05-2660 17:44:26', 'dd-mm-yyyy hh24:mi:ss'), 'nQA174bFd274tTo577jNu776oAn133gDC045nZB241hWz465yZ', 'bZD515mML998vBY314jHU667pUF296kOK729cXA811bZY978pB');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('nGJ946cFc182vLB284sKR537pCw931yIi289cII230iHr364tI', 9, 26, to_date('27-08-2947 20:39:07', 'dd-mm-yyyy hh24:mi:ss'), 'nON782eWy559tHc591sJw287wFd457oIU536qKR928hVH094eH', 'uIu574fBY717gQg822lSL691eYs476sVm680bNb867hXK572nX');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('cKb141wXD558wXi578oVj689zPq693kGH257dLH870lFA088yN', 4, 9, to_date('30-08-2653 15:11:48', 'dd-mm-yyyy hh24:mi:ss'), 'sTs076nNn771dFM666cRr377nNP149mCV523kBb468gIt617sH', 'mNt461aBw668gVE148mPh834nRb983kDd492mYS967eGa440zY');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('gMG575hUG787fLL574vBq010wMl212lLi739vOe424fXE892rH', 12, 22, to_date('20-05-2504 23:18:57', 'dd-mm-yyyy hh24:mi:ss'), 'xFQ341hNp861oAj656mSG569nWi838kJm930bAO699zDo444sH', 'sEL445yND668hOK369bSr220mZg093aNQ286xSn613cHf345mW');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('tBK460mKU379aJz281sLL230kOB029uBO393kDy245sSE130iC', 20, 29, to_date('19-01-2172 13:35:02', 'dd-mm-yyyy hh24:mi:ss'), 'bSa377bKy942mBp426jPl427hHl956nSK414aTw681xWP724mG', 'mHs659iOl962oSG796yRN979lTE834kDb748jFx567bId932gY');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('bLU1i0XCM7XCygarkBOZ', 31, 99, to_date('12-12-2012', 'dd-mm-yyyy'), 'O0ivDJrG17IieMjjMqI7', 'ganZP8csTjzt6svTVjFw');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('HsT95znINGQTrpLxT1fa', 85, 20, to_date('29-03-2010', 'dd-mm-yyyy'), 'oeyUVZI23yHoYgcCYCrI', '1yfwtuRkGfwHVkOmDd7J');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('VDy9ai99wTWrR6Lqrta3', 7, 32, to_date('25-02-2009', 'dd-mm-yyyy'), 'Vlcn0mUJkGTLIQe6Vv0c', 'NIKNQnE1O0CI40TE9aZN');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('xDfXY8IO8tVpiCVniAeV', 10, 24, to_date('25-10-2007', 'dd-mm-yyyy'), '36PVdsSShiXXWiXeUvwk', 'vvTBz79GFu2TAgTutgZy');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('JeNJ01D39WaozRMfchiW', 33, 97, to_date('07-05-2001', 'dd-mm-yyyy'), 'EAPC8YzATpbX2irmX8KB', 'a6LkzOMLFj7TNvDNpvL8');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('Dc6dzUi7qkJXBRTQ2Lja', 64, 26, to_date('04-11-2019', 'dd-mm-yyyy'), '0l1Qt91RjBnXz5bOFJSj', 'SQ3JQhzyCsgKseoakzDm');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('h9jfoIVpzzHIHNYkrtSp', 61, 58, to_date('28-06-2009', 'dd-mm-yyyy'), 'suxKQY7tGiUEvzyjeFTN', 'Ka4jR84CP46Ynpaf7Imi');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('zwCSOd7POioMLeekIWvo', 53, 9, to_date('15-07-2010', 'dd-mm-yyyy'), 'OP4LwvXTJyL8TxCdqG4n', 'E5rH3m1Fec2I7YAjvLQC');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('Q6HOKOdYzMeJhoR4vfS8', 90, 61, to_date('11-12-2004', 'dd-mm-yyyy'), 'xTC5Rtq5uV66fV9p3Q9s', 'yMobYJ50BsGGDlHOwPqS');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('qDDhN5Wst4Tw0ydBgELC', 4, 65, to_date('16-07-2002', 'dd-mm-yyyy'), 'NBqKbrBtiRGCRT7Dzoij', '4l3Gs8KWozBY3Ynftmq3');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('gSTyTjimzh4ttwGpU5ij', 16, 50, to_date('25-04-2008', 'dd-mm-yyyy'), 'PdVr98NIkBWSPLRICfd8', '8SY7O8NYFiksY6LSYo9l');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('vummW3KL41jxKfGGvagj', 79, 39, to_date('18-01-2010', 'dd-mm-yyyy'), 'e05SOAHGzXgoDXoO1Jdw', '4afPGXTQmez1kdKk7b3X');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('VIaQ2dYXuvnXnZEUgY87', 16, 27, to_date('05-04-2019', 'dd-mm-yyyy'), '8yZGjtJ8iFQ6MkZwbJSs', 'RfDP912BeYWBC1L8rrk3');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('DhGilVUhiMPQS09Tm8EP', 8, 84, to_date('19-01-2020', 'dd-mm-yyyy'), 'JFoPfC8WdzLGZd4QuBEf', '2jChueqxVbogJs1BKrOd');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('6Q5kRLteTmJl8NHEzHrK', 91, 33, to_date('03-10-2021', 'dd-mm-yyyy'), 'DDoQleB9cy9CEpol0IS3', 'HxrsH3QXNeC0mYQK4uDU');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('uIPX3Sxzi11yOopkogpM', 35, 15, to_date('16-07-2006', 'dd-mm-yyyy'), 'p8AiE4Ybrc1IMOcw5QSM', 'YwhQBPnvFtwESihIfhLI');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('l1cfGMG6ALa9Mlvc0vmd', 54, 32, to_date('27-01-2011', 'dd-mm-yyyy'), 'gRxNEb7ZNaC9IzyVXpsC', 'FbPLRn9nGKXe6jSomIZP');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('6MuA97VatgftQMWyEbUj', 52, 100, to_date('01-01-2004', 'dd-mm-yyyy'), 'BOVStfOpQiC6GZPf7dFk', 'SAoHJaOt0IasQ13IE55E');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('VphpCGV017omjmfBMyWw', 32, 35, to_date('06-08-2007', 'dd-mm-yyyy'), 'fKcmN20iPhnne4Obtho4', 'OMQdSHyGia5shOoUiVTi');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('MG8jBBvMFQunOPZmAWqO', 59, 81, to_date('09-04-2000', 'dd-mm-yyyy'), 'Vp1M0M1Kt5CQhMtDY9Oc', 'MddNDNWnzLHDwU99t9CV');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('bcC2rcFCghaUmFXxbSLz', 57, 12, to_date('08-04-2003', 'dd-mm-yyyy'), 'EMwmKJBzdymvoRJtWDlk', 'fWlKWQemtcMJl04JeSFT');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('2ngNlu02O4Ww2Jor3dO5', 11, 100, to_date('14-07-2014', 'dd-mm-yyyy'), 'OngYqqOim3AHSlc5oa6M', '0wfjevWE8l6LhBqeSflW');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('4X0b6fRK4EvsPRqzzDOA', 29, 54, to_date('08-03-2004', 'dd-mm-yyyy'), 'mP7BviVfMkSFb69fUPIN', 'ut5Cka5SXyNNzNJNxk5x');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('VYOirutYbEqWCHLcnHec', 2, 51, to_date('29-07-2019', 'dd-mm-yyyy'), 'JHpgftjXVJpROlelG7Hn', 'eeWlLNQH94LG72GScszW');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('9zGC1XJc9f5gEtLkQndp', 97, 62, to_date('21-06-2014', 'dd-mm-yyyy'), 'g4Olq8uqQqJwLpY8TfRC', 'QFoVwWpmlolokUx3yZkb');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('tf2RFDmtoPjno4RLDELt', 85, 36, to_date('05-08-2013', 'dd-mm-yyyy'), 'dtGhHxqbC2ghEcKh9HJ2', '2bU7OooCIp0aU9V4D5rv');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('eo6xiXDNyKzkcyndDNAI', 100, 28, to_date('17-12-2022', 'dd-mm-yyyy'), 'kkBCz0IdgO5ycyZxlYwX', 'z7tPZWWBPxShC1HyssOJ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('FzxE89aQmNlLnAh75poz', 29, 26, to_date('28-11-2001', 'dd-mm-yyyy'), 'GeRevoA1kPBupbXwsAcX', 'bh3fc3Nf2it4PUSBaEUi');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('886AKSq63LfkPkQQEkb6', 15, 46, to_date('04-02-2013', 'dd-mm-yyyy'), 'maH4OFAokWSbwYDadDRV', 'o15TSt7qc8NacfPkDAro');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('me7mm5K2vCM9SmjgHzSh', 67, 67, to_date('06-04-2009', 'dd-mm-yyyy'), '42b671TsV83HzdPgXnye', 'PaLqUsAOrhWZuj5rCJFP');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('cpJqQxA6NgQbqvsJcW1U', 33, 44, to_date('22-05-2003', 'dd-mm-yyyy'), '25t5hG7RQZheUVCfdvef', 'U2ahLjQ2d8j8j5qIUnP1');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('qa9xRNalA8qCqXaiDUB6', 23, 32, to_date('27-07-2018', 'dd-mm-yyyy'), 'V6CCfLrnmwCUlF5BJxba', 'c5erro8KNWfZ3miqZp1y');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('9dRQTXfeb2EHG8AIfdo4', 69, 88, to_date('25-07-2016', 'dd-mm-yyyy'), 'VuHTxrbYoSFBB5oaTrSY', '5GJBoi4kf7LxqaKdK6tz');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('QckJiAWA7hmQbQzjdxcG', 97, 36, to_date('03-02-2001', 'dd-mm-yyyy'), 'Wab1EqE5aV7TQS0H4bOy', 'tt1MxP6zfpA8CHbqhoyh');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('7BCMLWZJjirwrHqafm9D', 73, 74, to_date('19-06-2012', 'dd-mm-yyyy'), 'Np3B970y11YpUnORDYo6', '0xLGx6FAlumieFMdWppa');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('VGkSlvk9OV5Mv0uf1tl2', 50, 19, to_date('14-04-2015', 'dd-mm-yyyy'), 'wFSPqUGLXxDhc5H2GQYT', 'bwaFCjdCOu6KDnBJyr4R');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('0M5gMQS58Fn9TjjHxeJI', 24, 73, to_date('21-07-2017', 'dd-mm-yyyy'), 'IEEFPQ24uGivRAHZhwOz', 'sXx7ZCSCsoTtwDhJzffx');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('0FPKhgiq2Au3lX3JAJEC', 89, 56, to_date('30-06-2015', 'dd-mm-yyyy'), 'deUBhHUUx5yNwGjMudRQ', 'DiIgbLPuFRTDpBRPdpLg');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('fLOzvnQH2EjEsOZJ9Gnw', 86, 59, to_date('22-12-2008', 'dd-mm-yyyy'), 'PGwx5yeh5pWenQXw1rpN', 'Cb0TXZwDza8FpIeevL1b');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('y4a3OlWwasDYPhbbFLK9', 9, 53, to_date('15-03-2011', 'dd-mm-yyyy'), 'LduuaaTa877oWVNrJlTL', '11W1pkqMXOiNWQrZfx6S');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('71TaVgQySnneP1wsEsmb', 13, 15, to_date('16-04-2007', 'dd-mm-yyyy'), 'BKb0wtObsE2sejQwa5iT', 'fAS97SggS2YLfnDVcH0J');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('F9O3TZNVkcQnmlUmlQFJ', 89, 21, to_date('29-01-2014', 'dd-mm-yyyy'), '4qNp1EbXYYkrj4Sf6wyy', 'Vn4uvqulh2WExROuvjuX');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('GBJCwPuTCVHeyBZgNMHK', 43, 66, to_date('02-02-2022', 'dd-mm-yyyy'), 'TqBrQ90ebC6J9ilIienR', 'VItMq1hgmNG7v4xzilxJ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('g2x0z7vnTqCVyunzM3sf', 73, 41, to_date('25-01-2014', 'dd-mm-yyyy'), '4S8dk7HXdY04fJcJwsIN', 'TkKAKNeVewT4PHED0GlJ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('D5MvnOmYa9fx4vr9dmYA', 39, 38, to_date('16-04-2008', 'dd-mm-yyyy'), 'Z6UxP6ozOFS11qjb4WVi', 'GhzbjpslGCI9Dy8TD8B1');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('JIOGEgQ5407vc15Af3Cj', 85, 29, to_date('10-06-2013', 'dd-mm-yyyy'), 'f7Q7TwdK8H47WSnbmYng', 'YnFytZD2c29oQefbf7YZ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('I4UWhXP1PJjq7lIyvvnE', 55, 9, to_date('11-09-2006', 'dd-mm-yyyy'), 'QF4vslWCBdla6DMcZpVR', 'bahewWxNfcTA7ZCCXWHn');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('OGlPakdkl9a4GVzyiRH6', 36, 70, to_date('20-06-2018', 'dd-mm-yyyy'), 'Pgl2d0Za9fPx48yuXGnQ', 'x30JbiMqQr2O1y0ogtFZ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('bxyyeq59EsoMvggiEWbF', 24, 40, to_date('30-12-2008', 'dd-mm-yyyy'), 'cwDpHdfpwBdHV0DTxgUV', 'q4fcc64X09ik5R3nHG7U');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('y7J4JMJGSQiPZHSo2Tws', 88, 28, to_date('15-03-2006', 'dd-mm-yyyy'), '1FMJwvBiWkZIkYWX3MzL', 'DCyfvBbhc6xiGq9n3XUb');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('IUL6NCHf6JM0f07q192W', 25, 39, to_date('25-04-2021', 'dd-mm-yyyy'), 'YdF6WtCdMP7xK6BWy7cl', '4cYKt9IXgI6JrWZx8s9C');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('vxB2y0FC2OEOtt77znit', 36, 4, to_date('06-11-2016', 'dd-mm-yyyy'), 'icPPwhGI7RiZKGNV1G6b', 'AvcDrhc6un0mR002QuHj');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('mmzfrTby8UmEM7ehK0WD', 57, 84, to_date('29-04-2000', 'dd-mm-yyyy'), 'dZSdgjS0gzLi08KIxCv5', 'pXA8k50C9ZB9DfLAVmOE');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('YTWWjJjczCRZChgN1tAz', 58, 82, to_date('20-03-2021', 'dd-mm-yyyy'), 'IbEmpPxjCGmEuCWWIed3', 'VEmmTtqsPrT9H6IRtIgJ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('SqUis6DpHKvCAeSYFh3p', 46, 15, to_date('18-09-2022', 'dd-mm-yyyy'), 'gNdtOdrVQaTIgZYgDGzJ', 'OuV64zRr5jWxtG9JTHrk');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('DYz13d2b4Zg4SJ5oAf7o', 74, 56, to_date('11-02-2018', 'dd-mm-yyyy'), '9NrftviV8y8t3HC4F1oV', 'J3hwYocxsdPGs6bwKKXB');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('3SGNeDZLuUrVm6XAnZRl', 28, 94, to_date('20-10-2020', 'dd-mm-yyyy'), 'LkPNNhPqrbgvH8zbB4uP', '9AwZNFjyBYNbuN5FuXuD');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('xFWXKrP0iXclNiwaNm71', 15, 2, to_date('27-12-2019', 'dd-mm-yyyy'), 'cVDhxdUqSbpg81srFqxB', 'S4ZOZYpSC9dabnYwBeiZ');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('4tLTZkUsfYSEeIUde6Kk', 80, 92, to_date('09-06-2003', 'dd-mm-yyyy'), '7Dl6s6kAZxKJcPGt7woR', 'aZ0PzXDK6lsrAhxsMVyb');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('vMfDoz33kG8se56D3S5V', 14, 18, to_date('08-12-2000', 'dd-mm-yyyy'), 'PLnlXiEdQ6vm2VOqW4sR', 'inN3XTZTJzLaRGxOpTgu');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('cwJ7zbeecHGWLP96oBqP', 85, 19, to_date('05-02-2010', 'dd-mm-yyyy'), 'nvfVfNaxlUJsL3WkckA5', 'FZHemT1xkrOiCrSsvf6P');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('8yudrGJkL1hg17Ozg3qF', 8, 38, to_date('13-02-2001', 'dd-mm-yyyy'), 'lKALMSkmECDd4ErUOyqi', 'cPqe0wvhctfqA1GI3xiS');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('7mJujEEDTy34CuRnaBVC', 93, 48, to_date('31-08-2001', 'dd-mm-yyyy'), 'R6zsJPs99fIzle2dCTZT', 'J4bHnPChYkaGx8Ec6E43');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('bVM5AEx8J7hjbrjk6BTw', 6, 29, to_date('12-11-2013', 'dd-mm-yyyy'), 'k5N5CpZaOnjmeDLUP5d4', '5D3n6kNlKHpBFwzm7YV4');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('tD5BQy0T2RUaYE4mVxk3', 47, 60, to_date('09-06-2023', 'dd-mm-yyyy'), 'WPbUxd3hxmtXf3bbv5Ww', 'downfKFbdjKqdGAyN6rL');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('rAPZaY9C1Z3X23nVVhC5', 12, 16, to_date('22-10-2023', 'dd-mm-yyyy'), 'DbIiY1ToiN6C7yv4l7ae', 'MGXjxIO3s1ZdHKpH8qsz');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('vfAO3ByH7navfLaXNLC8', 78, 38, to_date('28-06-2020', 'dd-mm-yyyy'), '9gTLhXK9RYWxBOJnmevZ', 'oko9WavpEcinHAC1A0Cx');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('AKKPS3buU7lWdVyTZ5g3', 38, 40, to_date('13-07-2022', 'dd-mm-yyyy'), 'eUmgXtpGcHbFJSycUI69', 'OmYbnjvQbgwvvyPhKwj0');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('cOKXWB4ccA73zsRo9B57', 47, 51, to_date('29-12-2021', 'dd-mm-yyyy'), '4uys4ZJ91welGkJbRfIf', 'u2luyWkYeDgsqyfBZbvk');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('liZ2wqBkSrEc3tdAXv0O', 66, 49, to_date('19-02-2002', 'dd-mm-yyyy'), 'A8sdnl9RVokOA2lzrNXz', 'rNn9gWwFctZLFY7flwLF');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('uWmu6rBhfV0AAQluCh1K', 57, 46, to_date('11-10-2008', 'dd-mm-yyyy'), 'YrVkYGLWC06eyj0tj2KX', '9qwLaa1CBVSYbsga33Fx');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('fnCtyistu3Vwf53DcSzN', 51, 70, to_date('09-05-2015', 'dd-mm-yyyy'), 'hyJWjYcL8aIIjOXBAPHk', 'j3u0npeMIWNfRWnXW7di');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('EkexWvZLcnk7vmDXKfQX', 13, 97, to_date('19-02-2016', 'dd-mm-yyyy'), 'XORpSKwlRIUYbHSddeON', '9L80XgGIdgULE8XHa6e1');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('5kuH1JL6TRBGs5R20i26', 15, 36, to_date('20-10-2018', 'dd-mm-yyyy'), '8hfXVY6torUpR8B8yeu3', 'stEQUcdUliojWZDlN5oM');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('GPzZGvWXkGUZMwJpKqh6', 42, 11, to_date('18-05-2009', 'dd-mm-yyyy'), 'zrbpIM3gLmlxVLJ6ArJN', '5zgGMA5eq5hEUtfehAJj');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('BKuJ4yQblmTGSVAFzmMq', 34, 23, to_date('06-11-2014', 'dd-mm-yyyy'), 'dinXssKfRpsuGrcYlbPh', 'ZZ3ONjgmu6QOKb0E2U2B');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('WkVYauOUfI4EhM5QHbNb', 14, 88, to_date('13-10-2009', 'dd-mm-yyyy'), 'gkykXBCVShGbYcnsJz3q', 'bRhk7gYBcjLYnwpfvlE3');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('LD95e9KwAb1xKQx6OczP', 24, 13, to_date('08-02-2000', 'dd-mm-yyyy'), 'lqpvzmMocIhNpNulXkbQ', 'zJyyny0ozLNQ7CHxxDP2');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('yNTVnukv1qUnuxeG5Sum', 11, 43, to_date('03-09-2011', 'dd-mm-yyyy'), '6uMZnXDkY5LKvaKVj6bD', 'O8wnXNz00b7z75NPlMVV');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('3X8AtPc2jlXSjiJKZIHy', 84, 85, to_date('08-07-2005', 'dd-mm-yyyy'), 'vDLLT3pFE3vbfNA2uvZB', 'epPcgmljIm6MYI7iQFsf');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('x99F1QtzkPJRkNS0tm8B', 71, 37, to_date('28-02-2014', 'dd-mm-yyyy'), 'C5d1h3W8OoLes6uKO5JE', '8QRRzN4XjNKM5KVxwGP3');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('jmhdtpvTtSZ0bMe7BS08', 11, 65, to_date('01-09-2020', 'dd-mm-yyyy'), 'hepqNmeR8kgCbxjle7YR', 'Ycoj4VcdnGHntTNvT195');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('3u2XjktzIRl35UzpxuM4', 68, 83, to_date('25-06-2010', 'dd-mm-yyyy'), 'RQoIPSF1gsNqdUXWVjq0', '3OrCnAQ0AM25lqsaNTjX');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('dMZKTBzODrAWAs9mw3T2', 82, 36, to_date('27-03-2005', 'dd-mm-yyyy'), 'hHQHgcYOFQZN2zcazAUm', '5giZ38C3UhvcWTcNef1V');
commit;
prompt 400 records committed...
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('rQA9xVsyIzvLDWiTA9b2', 64, 42, to_date('18-06-2012', 'dd-mm-yyyy'), 'AR69tejtvAqa2GNGffiW', 'Al7C9Rys6o65Upmrhqwz');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('rNPkSTh5gZoMvGftkox1', 91, 18, to_date('15-10-2008', 'dd-mm-yyyy'), 'lcN34GutRZKV1bSnUGqD', 'tKPrcUcTmXKMjNY1K2IM');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('H2p9fAr9BIZ7CwKD6GEq', 86, 60, to_date('13-05-2017', 'dd-mm-yyyy'), 'Y2Y7Tu4ioWqArbUCplvT', 'oCheh0ckEVKwmG2KJYa8');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('8A1R3gez5DK04BhQenpP', 51, 85, to_date('24-01-2021', 'dd-mm-yyyy'), '3kq89cwoFQHRS5lcKjXI', 'ZcBsuu8aQHIiWyez8E11');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('F2TMWrdQvgJwm43nVVyB', 13, 17, to_date('09-02-2015', 'dd-mm-yyyy'), 'bI8mmbgHkruEbCwJHU5t', 'U1wWKAca3hie3qlxrvlN');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('W9N7JCIeXA9UlXgYUZ8g', 77, 73, to_date('09-06-2019', 'dd-mm-yyyy'), 'JgeCdAaz0Ul3MXWMMkgh', 'su6Z8jQ1X6HlwP0SKmLl');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('ndXGXUhstPC1EeeqbH1l', 95, 61, to_date('04-06-2011', 'dd-mm-yyyy'), 'noQTmD0RnD8mm7QK3472', 'rTXmbrnYnAV6m7xToGrX');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('zaRbFpvvJo59GxMNxfHC', 36, 90, to_date('09-10-2020', 'dd-mm-yyyy'), '69bCRYS1E02N8lZ5ZOAY', 'QCGeLokz0qQWz5yEDLI7');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('6frcU4LsrmBgXfd0saU6', 60, 56, to_date('04-06-2021', 'dd-mm-yyyy'), 'J9ixZvgMkfD3dXiL0j0r', '3riKvdDkR1E0x6XziCU9');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('K8iMJSc2pekfUs5xfVYz', 97, 64, to_date('28-05-2004', 'dd-mm-yyyy'), 'nlZS18Y97GISVvw0HiU2', 'g6FIvXbUj4lK5RQWRsXq');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('Wp0iFrqohIG6himb6fJV', 69, 10, to_date('30-01-2000', 'dd-mm-yyyy'), 'rA9sFy3TVwHqkYAUMAeq', 'i3dTIgZQVIYJB2qNg3S4');
insert into TEST_1 (testid, maintesttype, subtesttype, testdate, resultt, blooddonationid)
values ('roaSfIM6oxPgfXW8E8uY', 29, 32, to_date('14-04-2018', 'dd-mm-yyyy'), 'C4dWX2rH7w2HQXh4fzA7', 'uco3fMTPZQ6UZJnvVXYO');
commit;
prompt 412 records loaded
prompt Loading BLOOD_DONATION1...
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Sc258kh5fYbrkUyWvq3N', '9vjm80v3MkwUiNXXBujl', 'CHA20Zjm3Tx2Ku2JP4Zj', to_date('24-06-2003', 'dd-mm-yyyy'), 274, '6Ue0d6KGM4qM96xjbei7', 'b8XrBN7QTOHUxOUjjC8F');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('L1TBmMtz0yeqP8OJX15d', 'nghEUacokM0Zvdr89WXe', 'OKHDQt3quHyx5UFec0N4', to_date('10-04-2001', 'dd-mm-yyyy'), 406, 'tNG5uxdrUt28yZhiT2Ex', 'aOoutjM5tTIldA68ti7j');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('khfw65juHe5S6cO4DzHT', 'Hp1M0RBTetGZh1pt9SKT', 'CA6OgyVveLN41hwajHPe', to_date('09-09-2004', 'dd-mm-yyyy'), 86, 'i82uQJuWOPjzw0xyFmxT', 'QoQLKJfyWahUIxFd7YEY');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('ITw06nJJ1vDPqTSbg9gw', 'E316ar1DodvuvJVljeks', 'gyCbsj4OglwfNZGvBtCT', to_date('27-06-2003', 'dd-mm-yyyy'), 169, '5GbfGakqalynmehP54UY', 'twE4EaUzTV4g2lj6tM2O');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('05YPJmd5WtPo6n3LVgtv', 'sUh2SsAJQmJSRI71TuVG', 'bUisoyzMhL5Wv1G0fflO', to_date('27-06-2007', 'dd-mm-yyyy'), 70, 'LkBRnQcQbgXdMjkhE8zs', 'McgbcC2b3m8ny1Qg1cx9');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('WbS858YFNGISImiGShXo', 'o87Jzlb1P83iH01ZChbt', 'xOaMLPURvBQng8Tsri9p', to_date('19-07-2021', 'dd-mm-yyyy'), 299, 'MYFy5s3upFlQGTdWzAJW', 'VzdCjuL34RyM4lqlCVdB');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('eUGmTPixKekVw4AsyzZp', 'XISUMZh5WpDzlcHSdG6Y', 'f0dIclqeoBkUC1SQRQnO', to_date('12-10-2001', 'dd-mm-yyyy'), 372, 'xwJov0gIlXt4iaWY51qf', 'lxCN8JR9L3kFVadvK13H');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('CrYzxCNfDiXDeqZsLYdP', 'bARbdyi1XPSLvtJk1OH8', 'ngUx8uCdL41IfjimMPnH', to_date('02-12-2015', 'dd-mm-yyyy'), 174, 'm39ugOZqORxZsBSaUTQ8', 'kWt0XtaBhEqEtGcTMnxE');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('u3YgnTv1nZbeH6eZK275', 'MrN0nMpdHNVFdMJLQwXl', 'XwaKF94WQC1Mi9eLZB90', to_date('05-07-2022', 'dd-mm-yyyy'), 353, 'rHG1ytdFXRj2UpCTPonY', 'OsA69lD7HuWxGrewBf6X');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('n8lMS3mxSGlCiEHMYeED', '3OrsAa0gwwvBmVrc0DUX', '9eVkMH1vB0aWveHaifrf', to_date('24-04-2000', 'dd-mm-yyyy'), 415, 'YQKLvY2UX9vGggdl05L1', '9uL80wbwkdhdtT4kPeVb');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('i8AYNusN4ehCS0c0BkUB', 'dR2PPHMIC9M6YiQG5gP6', '1wTgft9OsK3CUBRV7dyL', to_date('16-03-2006', 'dd-mm-yyyy'), 111, 'K9ZvcHQjBJv54ZgwAM0A', 'sC3X1HBttQSQHTBu9tiA');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('qTjAfgw3KSKPVbgl2Ae1', 'x0waM0nGr1htG66hHUvi', 'DMFqhKAisS0kS9Ldd5qa', to_date('15-05-2018', 'dd-mm-yyyy'), 443, 'VztPmc5DEvhPXw0BriDg', 'j2WrRgkdCQERmSRkOLsY');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('VLavrGF349D9K9Ko9JfE', 'fB5kOrojuSTOZ4kyv1aD', '3LP2NidxWwZjf4XxVQfp', to_date('10-03-2017', 'dd-mm-yyyy'), 418, 'g9NZtG5AYn22TdjBVLRs', 'wUn9d5lN9gM8yl62t98D');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Od6RsocR6se0iBg0y0qt', 'gfl4kBKeRiRo2y7gTimc', 'BgXXuNv4OIbgDCueCneM', to_date('09-10-2007', 'dd-mm-yyyy'), 104, 'apkUMs4xghWauY2v1YdO', 'twE4EaUzTV4g2lj6tM2O');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('enoL3FtJZlkvgh0LfQKa', 'zxpNJRY695JhKSBogfnS', 'mntjEThevs9DO3CW88Tg', to_date('15-12-2005', 'dd-mm-yyyy'), 252, '6T32ZJSViI6NM4L5y8TY', '30C5xntrDaV1oY1PC1yi');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Q2ZZoK3e27KjeiAKzZRa', 'nT4Am4sbYPvjYRjWlkGG', 'FCxUt39IsjF3vFDTqIsz', to_date('01-04-2020', 'dd-mm-yyyy'), 44, 'LOksS27ZCSN1i4hw5nuj', 'sKYiehFHn7j7ks4lObBf');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('F3jumtpMPqf3BQVUYFxT', 'JP1rnHUYQxhjLXgyAjie', '5qiMQSfZg0SUXOXcscth', to_date('01-01-2017', 'dd-mm-yyyy'), 216, 'zQGuqokN5kwKYjdbyzod', 'lMmHzzsz9vE0ZJn5doVs');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('hf0UhEjys2flCW13Pv1s', 'g5PLSbbSb1dDCO5xornv', 'roGEeoVOzGJ35ZRPYkgJ', to_date('12-11-2020', 'dd-mm-yyyy'), 234, 'me97VJRYxBG7JcQnNAaG', 'dCYCOs8yJrBtnL6Qksvd');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('VBfH9Cm5oXepOYvYJcil', 'zkCSDFyYXll9FDN1OY92', 'quYmxsOVHc5uWSpCyozO', to_date('02-08-2006', 'dd-mm-yyyy'), 410, 'pY7fUKMK6Sk5fm8Dr9eU', 'jS04QfwRgHO1KIg6Eaub');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('oQo3NkLUysRUdo5uEpBZ', 'tqBn3JmuJkffqVxHYxub', '7MNfFBAZed2tJAX1BgXT', to_date('01-01-2012', 'dd-mm-yyyy'), 44, 'E9TfPg1FxoD0XqLL4NgU', 'moMcsEeqlxRagCZfTZPS');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('TdcFbcnuUTWoXxTJnh7A', 'MErd91Ycn6SJny7VwRJU', 'uRs0PM850vG1EynSqhVa', to_date('21-04-2007', 'dd-mm-yyyy'), 73, 'z4eJi7B0ykBwZnHxLEH0', 'YuWzvCfhX8fltWSDKI9T');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('gYtTntvphoslwEhV7HV6', '6wNQCGyfffBWw6guIxdi', 'DO09espv5ASei2fyJd8f', to_date('20-03-2000', 'dd-mm-yyyy'), 392, '55StinxOhDk0F0VDVZfg', 'zb4Mu6Ao0z5Mekurxzvu');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('rpjW9nNcMkOBOFw3Vkt3', 'OUUK09fa0sANi4s5lDdl', 'STVaazvoBSQohM9SGsAo', to_date('11-04-2020', 'dd-mm-yyyy'), 217, 'O85V8Y6M1gkvPz2aFjEP', 'PdtmS2Y3ivOfXaWkjSaf');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('WmGXMgQGczr51f07MIVH', 'AsYNvItDq9v1vbM50jTY', 'YMW0IUdmY3J1JEeeOYnS', to_date('20-04-2018', 'dd-mm-yyyy'), 226, 'w4t8nSCknmCmeU9NSWRu', 'mpLiJODLo4U9pyoUSRLL');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Cd7O0vNlVhBr00LN1ApU', 'LkzVC7Plh3YemeqI8qFq', 'zXSp4spYihVjzXgMis1c', to_date('07-05-2000', 'dd-mm-yyyy'), 115, 'z9dqniKhB3TOGBcjMMcT', 'QUKjMchilrRlmxzECduY');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('SJpExbTkS10XuTidcNKJ', 'AV0M9GTvVo4lttizFkGj', 'erX4p3QAkWJ8cvT2UGUN', to_date('07-01-2007', 'dd-mm-yyyy'), 434, 'jlTLsDhe8ZLvAlSgkQQZ', 'PdtmS2Y3ivOfXaWkjSaf');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('PXiO09JQEAYQn8CfUUd9', 'WJyShbqqeXYNlnDAMuOD', 'fontIv3IIg8S6zdSCYde', to_date('28-03-2008', 'dd-mm-yyyy'), 248, 'YlcYCPMX4b26WDRgTjQo', 'MBdvCpldkY49Ki9Ht263');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('bxEkTpTdaOP1IvJlQX12', 'MU2CyaVgx9WmTXXXp6TJ', 'T3s6jOFqroerFeeTpehA', to_date('13-08-2000', 'dd-mm-yyyy'), 259, 'Z6TV0ORfqLAyC6CZG965', 'eXtToBKJQLTouEceHUMn');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('xTy5zwxmPDWXLOlIy62I', 'dMSn1x8qcquD5WjcRlkz', 'KLq89scrTkC1LJcwtt7t', to_date('05-09-2013', 'dd-mm-yyyy'), 495, 'XpKWUqSdtdTkRHalLBQx', 'rjA816KlpPM2spvwpYRC');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('eF1nM5uXQlLjvCRgjBWL', 'RMQCGQTMhP5akGFAC02y', '1EYJtoF8gFoHeXNzD1Hc', to_date('07-10-2010', 'dd-mm-yyyy'), 464, 'GLjFKsxWSiGooVvXEAcc', '9kjynS4NYMYtT3lHpJKA');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('vNUJ1SXlFe3dNV6Aad81', 'QvYH9ZegfqZOsQvxHdsW', 'GqQ1v0dbzYnGopjN1RL5', to_date('18-10-2002', 'dd-mm-yyyy'), 321, 'nd6LnIEksiOtFUa6vQf2', 'C7dzReqMKmVp3i5oE56s');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('CKHMuYInSwBuhOTqrVJZ', 'wvvpfz4e2MvrcB6q4mPN', 'hUAWYI3r6RfkQZfsbm2t', to_date('23-08-2011', 'dd-mm-yyyy'), 234, 'bw19b6mwAtBmDKZyFb9o', 'engIgxZTgU4kL4za0KKQ');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('yIlm7vKzQjuV6COlD2Fk', 'WhsMcmYqvG4EoNZZYmZf', 'XgIcxoaZo5hkajtlshdr', to_date('07-07-2001', 'dd-mm-yyyy'), 251, 'se4gzbElTGkae6m5G4Us', 'MoHL0y9B4cDsGFu1SbiI');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('IQuNA0feblI1BIobPKJq', 'wa0fFs5SwPD1RwrSg4U0', 'GcHhHvSPFMRkMPkmWqwL', to_date('16-06-2016', 'dd-mm-yyyy'), 269, 'DPM653UMvVbu0LYmgEzQ', '9uL80wbwkdhdtT4kPeVb');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('yicA2eUp9qPBlHkxmfm5', 'XclDgQOJsOCXj49wGv3X', '9kmxtc3gKT6lkmwVkEkh', to_date('10-01-2004', 'dd-mm-yyyy'), 84, 'rU88o1ETDbhaa4AKyCV0', 'PwldAw8e3HhLs13FYwCI');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Hfj18ixIA3fjRhXuuJNE', 'zhj8roog23NhJH4j5Qj9', '9e0vImTCBfojJ6zGyqm8', to_date('10-05-2016', 'dd-mm-yyyy'), 37, 'KCtnxt8qdJniPcHMXkYV', 'mpLiJODLo4U9pyoUSRLL');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('ZXByedjOjnkLONMzRo5m', 'E54PpJxMYcUQ5Wz4EY2D', '33wawyhPEySMhDEsLOYf', to_date('17-04-2012', 'dd-mm-yyyy'), 414, 'T7Jb8zpuPI8LyLMiEI4p', 'USeVj7cdAiNI8XaFC0jg');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('k1GNR66trbkrYA5Tg7Zt', 'g06DzZMExOEA2ZvXKZvr', 'Q9PjU2fUZ5GVtGxTdlBN', to_date('22-03-2014', 'dd-mm-yyyy'), 257, 'AfbhSL6SDMntgQazOdw7', '0KCquUr0vk66Rucr5rbA');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Vg6GZOfF5ly3IQclnBZa', 'E3SLhmKgsOLqJ9ZdMbqp', 'GGrIAQMDiOECtntGhKxC', to_date('11-09-2009', 'dd-mm-yyyy'), 394, 'FOun7n4EmNZKB0IhNaVS', 'MBdvCpldkY49Ki9Ht263');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('QTCkuP0Ixsfm5j1cOkjP', 'qsoTSAFTDW1TmowdMlNB', 'f79p3hPJBi8PbhBoUUJA', to_date('07-01-2012', 'dd-mm-yyyy'), 97, 'bLHXfGthsrfIE7iLI0ET', 'MBdvCpldkY49Ki9Ht263');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('0fEefRaYmAj1MYdR7uvM', 'ry1iJaZLbMkKLhxyt6oR', 'EuyWRb3xBWiJHLKjDNXE', to_date('26-03-2006', 'dd-mm-yyyy'), 66, 'MXNmgKLfoLR01FrbP33l', 'xaMhHod5u1PQqG5Zm6th');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('ZvBpAWrXai6EBAqPi9Q4', 'xlHqrbwECggMx2YjOSRs', 'vzMHscJFICY5Xj10qj8H', to_date('25-12-2017', 'dd-mm-yyyy'), 282, 'KL0YBYaWF4JphFgE9LWc', 'TvcKZG1g4F58koXnWiij');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('rnt5hXg7jA8XuM3w9J3T', 'rLruJRgOSwtxuZkzP3BT', '7ajQJ2YNJYrWk1MZjNn6', to_date('21-10-2005', 'dd-mm-yyyy'), 150, 'lgez9MabDCJM56vvL6gJ', '3Y8kEqNG0EVwLKqPjNig');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('SS1AiZw4LF5ZvTXlfGzm', 'MIjBmAKi73J02JMRWnX2', 'lkIcMTaTLCLFuuR2wmXb', to_date('10-02-2011', 'dd-mm-yyyy'), 268, 'CgR6JeYKVsA0Z96TwQ9G', 'zvNfeYtv874ZZC41zFb8');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('ju0aQJsNsoHWPsPycfWP', 'oouxRbRdaggEeYPKoddP', 'aJPju5nF13DwI8poVYSi', to_date('11-10-2000', 'dd-mm-yyyy'), 478, 'uK4yCqBaNyoF8hvnURMA', 'IXEKcaZYooEx8JwuWaAj');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('oMpOWbd3k8r3hCwywV4Q', 'K24hf9izWTMHFrcyVMUU', '8sqxeTJXEHsnv3MDfYPK', to_date('24-06-2017', 'dd-mm-yyyy'), 462, 'etevZEzcvxfqBYjxoSQo', 'rrHjZDjvwycCkonpQnUn');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('KuvdNE6n6HKxAHGn62wj', 'iMjHW6mW5YA8Ee7Iatnz', 'LiRuhHNHM8ZsGNzVPshv', to_date('09-07-2014', 'dd-mm-yyyy'), 85, 'eCgAM0fxtSiUbIsapPAS', '5iF3SkOKEWWocH5DGa6p');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('yqMGBxSiCmkKlaS4bLSy', 'zOTGtIrlASQQMmvUnuiw', 'JWnYBphI3EonrPKjSyhR', to_date('23-03-2006', 'dd-mm-yyyy'), 189, 'dBl1cQc49dCY04AJe9tT', 'FiJLe1boabrZSnmFInSD');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('fNmK4n0X4FXoCTiBWKFx', 'PbwKTw647yaHhCOk2m6R', 'mC2DrfMCkGHR2BMTKmLM', to_date('01-01-2015', 'dd-mm-yyyy'), 41, 'd3iGFpKtSBxdywFzk9Dc', 'GTfQHzPapKdGFpAwrugN');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('7spSJQWsnGB7Y8PnAjOF', 'wpjEx5zkRkQUcUUprSuT', 'llau2FagyHcsOpV7pZqX', to_date('26-05-2007', 'dd-mm-yyyy'), 172, 'tCfPXECnJaJs8KWiTTI9', 'lxCN8JR9L3kFVadvK13H');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('LxQlmoUwcClfPCnijZ6N', 'awPiLOyx9suGysLuLl4Q', 'uTGhW3cXfXSsXf0P1myb', to_date('10-09-2012', 'dd-mm-yyyy'), 251, 'XyoTliInl3OHqsgPx0jm', 'sC3X1HBttQSQHTBu9tiA');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Mi9j7Skx4JNWqeB0rnuw', 'o68BRlVAne5NWFc3FW8e', 'E5Rd2Vl21knMZ97FAlGe', to_date('19-11-2006', 'dd-mm-yyyy'), 373, 'FHDJsg50qefJtIxGcuHB', 'GTfQHzPapKdGFpAwrugN');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('gzlZAOOvvk6Keh0e9QgY', 'ju9DNWzl8xl54bqMyM8q', 'r9sCCWLZWVIchFUeIjXh', to_date('19-02-2010', 'dd-mm-yyyy'), 25, 'cm7NtsHB6xTNwPD1E7wR', '18RTRkg0B8pDhIgju9bM');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('3pIWN9H4589vPcb5URgz', 'jr5rsFoXgeXUUOaLHW2L', '39hMMLcMPzXk3z97DF6X', to_date('10-01-2002', 'dd-mm-yyyy'), 20, 'v7KLkKcrDM8i0mCYEOjL', 'IsmhwpSX9dYJY35YR0pN');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('i3OPj0bfYWK0dnx7AKK0', 'eRXjHDcgwid7OsTowwVN', '6B1jHcwGaa38aYjVGFZu', to_date('18-01-2012', 'dd-mm-yyyy'), 402, 'oQCylHH9KBGDZls2dTx0', 'z3lmdGvaamY3vjPUH5bg');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('m1j3vXApjpTgaVDMmqu2', 'KSzmABKkj0qgnVOMaA4e', 'X3TlsNe2YueTTYEp7bXN', to_date('09-04-2005', 'dd-mm-yyyy'), 16, 'f1tRgj03Gei8UR7qc0IM', 'PwldAw8e3HhLs13FYwCI');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('8xMoiaNtlBKPInToY3mm', '4sRkMH0Q4Oo0mQkINObw', 'JQCJs2bi3AIp9AD6pWzF', to_date('26-01-2006', 'dd-mm-yyyy'), 448, 'i92YLQncffOg9AsGhQkc', 'JBM5UuSAYs3oPMpjuRmh');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('GyBDzOmbrqChvSSg7DqA', 'wwemDqUaKyf7Phhv759z', 'KTZ6oVFky3Cm4WkogV2q', to_date('14-02-2022', 'dd-mm-yyyy'), 321, 'qH1ObcncprjMdnXHVvNz', 'r1pTidWF7ujWgd2GGr8I');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('XObBmiCwmj8m5EDuE6xR', 'rWyxFsmfRDuw6upmaSSL', 'ZJb2vQ0kuqPktx39Ogd3', to_date('08-05-2011', 'dd-mm-yyyy'), 371, 'Vz03GrTD7HzObxT6Hd6M', 'h42FE7PVrCA6nGDoQF3G');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('iGKWl28ZSeYHiy7adlln', '8tbKkQEhYaMi4KO6pVX7', 'HWN67OaqdIYflFWHsCfH', to_date('12-02-2007', 'dd-mm-yyyy'), 275, 'xaSoTumjWnSv3F7kOjL2', '8Lx1IPHISZWmsG2MRvar');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('xJ8TQDzdxo65WsyWIVyN', 'L4FT0BZ1w5fOnHrOLMVt', 'r2szhRwOzLKX4HCtu386', to_date('15-01-2015', 'dd-mm-yyyy'), 122, 'UpbBhWZdmJd7qnsEHOTc', 'oMGlM4NQ2rHoR3YK5gxP');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('wRu5VawiIQYOfX2Yackj', 'pxHVxw9wS4lJF3zjeGdz', '8sYiFJ78Ypn2ZwLLTYxe', to_date('04-09-2021', 'dd-mm-yyyy'), 2, 'TJIOP3EyahIWP6SlT8Y1', 'a0moKtMAJToJ9DiuxH4Y');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('hYiVRDvdHCQyKF22oipJ', 'ygMF69TVH4GQu95EZcj1', 'JZvAQv15x1q74J4HW9tK', to_date('10-09-2004', 'dd-mm-yyyy'), 226, 'Al40d6OUYBQYEdZzNZRm', 'tt9hJgoIIHBazDIPaqcA');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Qwn6xnlBgkUgYt9Aoc2E', 'ynEbMKSyhgFu19PZQ4gh', 'pjVb4TAu41R8IzqgoIaj', to_date('09-08-2016', 'dd-mm-yyyy'), 128, 'pEbgwKWXAXAesK3tx7p0', '654lFb4IEosiQzgBEb5A');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('geOtQj6P8dnB99iIEplj', 'GoXR7QQAnd7vbRODycWQ', 'fISDFeSk9B8iQZzheyXC', to_date('06-10-2021', 'dd-mm-yyyy'), 47, 'D8dYfIWzZA5hEXi21nk2', 'jooxV0uXzMkLubienmxm');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('MFXQybdPzIeUhJU493g4', 'aPgk6nKzPRKRXYKzH9t3', '2znBgth9Ng56wOJHRXDJ', to_date('28-08-2003', 'dd-mm-yyyy'), 365, 'eCKbnazHbDHaDbZoUviD', 'W0TcQjOG9v5RRq3vVb9N');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('H3jTnHPcikOC1o60ViNG', 'KfiVTImrp5bOYTOwv4Ie', 'JdnvlzYWJ1dPAwdLiAgC', to_date('20-01-2015', 'dd-mm-yyyy'), 106, 'VPTSK3AzywpRkzazdY8p', 'bNmO5f0iEHUgKZXfFAi5');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('485RhaTO5C7fr0sNfrqO', 'Mh9rRzeuiQ4EUahsdv3j', 'x0cLay0VmJvyAXrvuDJK', to_date('21-04-2018', 'dd-mm-yyyy'), 432, 'VYf7vz55zmU4xkqdHeXu', 'GiwtLyAUYWidDNcFGAaI');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('q7KOLMKMLxCTfczi075u', 'ufj8WpDt7aCt3qvOZHca', 'yOUfHiaJ4RMuwgOSyfgQ', to_date('27-07-2019', 'dd-mm-yyyy'), 267, 'xl8mHbCRqE6HLDlmfj5d', '81DBQ5TCBV92Sjm4KCSh');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('4PQ6tXWasQrBUtyTxnoR', 'B12RS8rBxwiY2RIMvFOn', 'o7rtNcIlZSm7nGVJL7Vt', to_date('21-01-2009', 'dd-mm-yyyy'), 123, 'KMVVRL5WTe3UgkVShPb8', 'emmcL5gk56xr3JLj6H3q');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('JoLLLtRHmYlELBHyqEDD', 'JBLRjrSDEpdnjy3ZHLOz', 'BHHfJDEOlGSo7hiWa2K2', to_date('21-09-2018', 'dd-mm-yyyy'), 320, 'XUbAZwhrantdR6MtBhTl', 'ksnGSIRhTxv1oxLDz7z7');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('mkfnBniTP59ImHofxAVg', 'Q88i8Xy9vf2MnROLNBpI', 'GGeblXpoK3NIX8LqEV0H', to_date('06-05-2011', 'dd-mm-yyyy'), 281, 'JF5ngy2oVPx1mx7Ukwlf', 'NqtHNVNNBPqRc9JATlFv');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Dyo5QA8k93b5TQA5m7s8', '4vBdG7waNm9gJnMXKQLx', 'OExbnQ13PrfOnfDZoMBQ', to_date('22-06-2023', 'dd-mm-yyyy'), 349, 'WB3ef83ei4t1owPUkD2f', 'F3m2SAPRJdX4UebXIMhI');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('EEI7TU1GDZMZ59iFStX7', 'yJG0gTFIAC5kuOTneQsB', 'WDSoXBgns2GNwvNmcH8J', to_date('19-08-2008', 'dd-mm-yyyy'), 299, 'NOjAemf4eIwk70EtD9tJ', 'rzLshY2s1kyhcwtF1SSM');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('AAM5wwa5KrPbu68pfIMM', 'BKZXBi3bS0QNFcQHcMbT', 'yTlN79lbvqPEmXWW3ld2', to_date('13-09-2022', 'dd-mm-yyyy'), 57, 'dQUAxaw8CiGqmImz7axg', 'yvC0RFv1ZCgDMJcIzQKf');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('0XSGbRmuWOlbyW4aDNU3', 'H8UbW1ZgZ9PDXjh9H8UX', 'JQUdtpcGqIzkxzbJAyVD', to_date('05-08-2005', 'dd-mm-yyyy'), 75, 'zkmtwFbGF2mzScp7zk8q', 'A3eQ0pZViHGlWtzTIiMU');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('pHialXdfMrZ5TFNUGQsA', 'uhEf1TNArY633TZXey7I', 'dA7XOlIWU2eJOLgkXCnn', to_date('20-06-2010', 'dd-mm-yyyy'), 381, 'RSgIZDcgw1ZWA45rfuNv', '81DBQ5TCBV92Sjm4KCSh');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('tM8WSblYZDI9MqV2EKIs', 'kPe1SxyPJO9k79Om2YQ9', 'Hxml7ONH5COS4eUPINZi', to_date('07-04-2014', 'dd-mm-yyyy'), 49, 'r8tT3RYXTigjxBRduyN1', '81DBQ5TCBV92Sjm4KCSh');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('KZq4aYWqfudWgcfTXQ4B', 'bHtUYHWOgMIQ0r4J64Zh', '71fcRnp2fCGS10zdPu5K', to_date('04-04-2017', 'dd-mm-yyyy'), 169, 'kJN9gu6PmyoDIMFscbIU', 'GuASbGP3QMnZiLY72T6D');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('3e7bkbacsZl7mHkrb7tZ', 'gMytSCsHCvTJGOW3ku6C', 'A03E6NvwLdvN1J7Cunqy', to_date('19-12-2013', 'dd-mm-yyyy'), 109, 'E7GgF6QM0cYC5v0U4z19', 'kkEE7H8690n1lK2HPfm5');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('FRsk2KahxDwF72uZKbuV', '5D8SJvqwP6pyQsQjrFT5', '9J5F6SjUtrw2XQBQbBbD', to_date('21-03-2011', 'dd-mm-yyyy'), 152, 'jq1mWr5eXcew8qZDHuM7', 'h7RBnMPZfOO58pvr5nM9');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('JWeRudVwQiRgQiXFDHkd', 'EshBxQS37j0grJhBiX0T', '6PfQiDtYF2DbsIc7pnnz', to_date('01-09-2010', 'dd-mm-yyyy'), 260, 'sj9lMj8y6QspP4rTdmMB', 'MKqk3sqn7DWFoTUFa6pK');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('iDu568cYo659wPi939iYj470mHc321cCp834cAl291gEg625eK', 'pEl132hJq739kML779iBK016cRo947rVB733bIm985vBc783iE', 'hEU310gIU584xCH547kIQ768jGZ260zDu075mZt473eGG031sV', to_date('18-11-2917 17:44:09', 'dd-mm-yyyy hh24:mi:ss'), 20, 'xVp291zGK915oRk273lXq436fGA758jAO660hEk540eFu126wW', 'rjA816KlpPM2spvwpYRC');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('kYN438wQG198bAO537cAv625rVW280bDZ375kTu219cHx986nH', 'iGV177oXh578oWv694bNa316qGU057xYq375eMs714iPl680aQ', 'rRX293uZz718nLt917dRv715dKu991vCr214cKp423bEi638fS', to_date('14-10-2766 11:58:33', 'dd-mm-yyyy hh24:mi:ss'), 2, 'qJC114jNy964vWa149tBY414lLl486yVt629vRp522tQH065yS', 'ozjzovceamkj9h0Sheld');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('wTx164nCF728sRN560rEP792xVc822wWG655dTu719lRY720qS', 'cET856fZB816eUy389kUg864vUs517nKC319bPc796fFA294aP', 'cJc174tTZ435yRY582xMJ545cYb026jJw319iZt031yQO229gV', to_date('06-05-2724 06:28:39', 'dd-mm-yyyy hh24:mi:ss'), 12, 'rSz688kNK787kAN460wXp243zYg690nGU747vEK546jAz555xH', 'hLB866gCF479dZy146vWk125jSp135pNe747cBH610eEJ218fX');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('tSU153lCR041qOE493nPX034tJr719nZX753iDm047gKA264gS', 'lCB675rNb061bRN689iPf743jMj288lMQ733nBi871sFR059vA', 'kFJ116jXw382dOw018sIq421wBD325tHp656gTn477eOz687sM', to_date('10-08-2991 06:34:33', 'dd-mm-yyyy hh24:mi:ss'), 2, 'fTX550eZp627jNm492yJb934rGA670tUR936aYX562xCN410wU', 'bXg420bZv057pSF334eRl614wGx197dUg975pSB275mCE610jJ');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('tCK179zBg539wVP183nXT288pEg936pQp084rUA027dDK725tK', 'qSR478jHM715sJM186sBs872wCN238eCg937hSB027kMn574fV', 'aLL965oXy243jDl189pXk858yDs180eZW451nMc687lWh296rB', to_date('27-12-2159 15:44:03', 'dd-mm-yyyy hh24:mi:ss'), 3, 'eAI854jDA422rAw767iLe858jQR578zQn983pWT594lDH682qM', 'jXHSJUwVBAHb2TnBMR4M');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('bNv128gAB874cEk363eCb879fBA954uAM469uBz820eKa776iR', 'bTX011nQo812iUS631hHH270rJh993nVE221fKN562lUs646zY', 'bEA198hAK917pBt990vLX163zFH363xWK845yHO727uQi921sX', to_date('01-07-2770 07:55:12', 'dd-mm-yyyy hh24:mi:ss'), 10, 'jQh443iCc364nHr189lGI481dDB255qIJ069iZw535rUf568sF', 'uPw776pBJ941hWR473qJy751hAt166zOA179cNY845rCD321aG');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('uYM830iNv619oAq719kRp131dPR628fDr767bZH517hHq854sI', 'vFT079sRG344oRA643bRh210zCi634hCp127nSr046bNq966iS', 'gMG417uOp618iIp727dCe893oQg394qWl857mPe396bFA276tX', to_date('11-12-1989 18:16:16', 'dd-mm-yyyy hh24:mi:ss'), 13, 'oDY657lWX378fRf589kJk754iBN792gPS881uBP143uIl766eA', 'kV3wxV0wjuwOx4jnYdQE');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('kLD977lPp378mYb260vNU079mJM080zTC628nPd032iWf919fN', 'jCl334lPp549vBw760nCl579yXB090dPn966bBN691wCO829dD', 'dKi954iIl177vDY323sOj978dFQ594zDZ715vZI240gQC934tJ', to_date('16-07-3046 13:58:56', 'dd-mm-yyyy hh24:mi:ss'), 18, 'vWT558jJQ482pIq278xJI861iWx686bSf679cRb169rHS620fI', 'nFn987dYo376dKS314gHI182sDb875eBU420kEN580qTV469eE');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('oUo247tDo926sIe769oRl520pKS957nSP554nMo129qBg687mL', 'iHD471sVe230mQn985jMr751cDt422aYF376wFE555gDs679iZ', 'mJR639kTY758fGR149pNY983pNZ425tZD680oJL292gEi188hK', to_date('20-07-2193 08:51:47', 'dd-mm-yyyy hh24:mi:ss'), 4, 'iWg562tXT138mSu389vHi751eLl546aLP199jVr139bOO875yS', 'kGB259fBI285wOA332rZB460wRf132aEW597xDz217hDJ246eP');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('vZi365aTC175xEl346uTo999aEl515uWA717sHE756hKf934xA', 'sDU414kVC939uWh360rPr989lJu531gQh221mSq755wTK751rC', 'tCR616iIv694aXe286iRj328zRM734iJJ757vKk061kUC152rY', to_date('05-12-1980 02:03:59', 'dd-mm-yyyy hh24:mi:ss'), 5, 'zZv754sFg474gJN351xYj879gAh394oSa285tRw322fUk623rC', 'vEY315yYE650zRv040aOh648kVx995cZO740bQY337eIk470zN');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('fMQ072dLF583xEX390oOL920vWn289qWy137nEz772zUZ287fM', 'zCF224rSV255qGa192zUC835zCE134qJw373oRA169zLf765aO', 'dYi641oXc540rMQ896zLs197xFD836hLk430yOF031lYp355lC', to_date('23-02-2058 21:45:04', 'dd-mm-yyyy hh24:mi:ss'), 3, 'fTq123tGd750rJH950lDb776mDt262tXH827jLX647eCX082uM', '1lmRNBDuXqJL5wQycTPX');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('lPb643iBQ616gAG599hHq458uDK610qYE445vIu547pSN774uW', 'qVl863oEq994tID684hQy178uNJ062lJC582rNS524hIs828iZ', 'aKo266iEN279cLJ732xQU840dAg165hCU938kRV886iDj865iG', to_date('04-11-2688 01:35:36', 'dd-mm-yyyy hh24:mi:ss'), 10, 'mWd859oHD432nGa523gUg713vLI858oKE540lFx459aDQ649jK', 'fGP388xQE025tKU286zAt089cVK812gEx064pBN826rBF179wP');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('pKl357oQO793eTR138oJx757aNC144kEc070pNq030nYL958uQ', 'kZg525eVR073hGT791oIe263sPm146lNo713jDk675bTP689bL', 'yPv451lRj783qWA043vTl894jRX628hZD942cDm689bVR184gZ', to_date('04-04-3043 06:27:21', 'dd-mm-yyyy hh24:mi:ss'), 12, 'oSh415jOJ531mMF146vBz341pSf777dQk716aWt724nGH763kS', 'emmcL5gk56xr3JLj6H3q');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('bOm742sHq427kHR458nLm755qHR624iQj923uCY648dPv980rQ', 'fTr596oYa230dMf311tZL023kTl949oOn935bSz932tQz489iF', 'fNS276jYs065yBC571kJi310qYx643fUa766lFE860rXz765mW', to_date('01-06-3013 08:02:49', 'dd-mm-yyyy hh24:mi:ss'), 4, 'nPf356nPs599sFU992uQQ184yOl917rMl542iUX717jLP118oU', 'xaMhHod5u1PQqG5Zm6th');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('aWI516tLs462nIX035kXw867qSp181pFh351fWf382sGo123pT', 'sSL923uYK615hAh867sWC694kEg573fRo227tCO688lST042aX', 'sLU765sHV586rFa918jMj154wUt655jPy963pQS211nGe548sW', to_date('04-02-2761 07:21:04', 'dd-mm-yyyy hh24:mi:ss'), 16, 'pKY131xOz446vMt576uTU680oID130zAR036xKc052oHp594aI', 'IsmhwpSX9dYJY35YR0pN');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('gYh728hQg156hGZ318kWr375mAJ239hFR551sLH681sGy798tC', 'sLM196pGe417lPW477lXu185uCt472pEK991cVj294wSt026yE', 'gVF987oEc738jBm341dHV336sAD450lAV355nHm096oJh578wJ', to_date('17-12-2703 18:14:32', 'dd-mm-yyyy hh24:mi:ss'), 14, 'pDS348nSC599rIE752zQA240aTs727bSn188lFs092fOE421bN', 'omsS22iNMYcHhpvh7J34');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('uHI625vDJ632rQp919vUc929pSH218sAm785tKy119pGz220aT', 'lQC458wWb454lIk918eKK867mXJ138cTQ765yBq713qKp529eA', 'nMp250uQG492zOs330qLF920qGA527rUL223zYo515iCV548xD', to_date('27-07-2113 17:57:50', 'dd-mm-yyyy hh24:mi:ss'), 15, 'oUx650qXx038mSx869dZm077rVJ657aOx769yOm790rMr187tN', 'fGP388xQE025tKU286zAt089cVK812gEx064pBN826rBF179wP');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('xYJ116cBe075oBn834rPi676hGj827qUu876vVn425tJX889rF', 'zNu723xLO080pXJ484kMk197vVo793kAJ584fPL136lEv541rA', 'pCH728oYP298qYH477xXi035yAg245zCR031uOO289cIt355aU', to_date('04-02-3063 02:23:16', 'dd-mm-yyyy hh24:mi:ss'), 5, 'mGK821dWo263hIa978fZW652gGJ895gTe192rDm015uRD512sB', '6UcgpSngEiqUGXrxHeoH');
commit;
prompt 100 records committed...
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('sWM147kBb935lCe482wAa360xZe047uYP315eXr676wIN992sO', 'gGR749bDq520mQV136vSq578sBS249gRo771kZl056uIT015oN', 'oFR352oPO113vJF118gGD940dIK094qOS314rWj544bPg859mF', to_date('16-07-2307 02:50:29', 'dd-mm-yyyy hh24:mi:ss'), 15, 'nDw793oXV759rTa175kOT038bIO251jKu169xXG143xIB622gF', 'iOW542wJm877zIZ763kJp499gSn839iLS582dYc257dEh329qL');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('cWn953dZv832fGM526nWb721vSR624aHr421lGh679vMS653aZ', 'dQX977lDZ772iAT022cJX397jAD779mGz571vBv970mWB414yL', 'pCA537yUn027mSP123hCA117lWh649aEA791iOW218yCn542fB', to_date('07-11-2050 12:28:48', 'dd-mm-yyyy hh24:mi:ss'), 13, 'wLA871pQx290rNm957wSs115kLb595wGh581vDO480sZo621oC', 'nQQ7u54fVnfHxOga9QJ6');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('jWJ678gMr492zTL839vIv978sMj850qBc172bNY095qWV594xL', 'bRp597tRh530lWd277xNy072uOx575zIg181eKw592vHI970uT', 'dHp541rGz392cJR315lFn298bLc836kWh169fWm779qEQ834hS', to_date('08-12-2324 01:36:28', 'dd-mm-yyyy hh24:mi:ss'), 18, 'kBn638pIa698vPP683hTG942rGA495mSy011pQm438nPH942tG', 'iWq174uAt229pDk067cEl776rVA763xDB312wQq497bDK263oY');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('nAx712iAa450pJs741cPw561bCM178dAm694pMp699dXr245kI', 'cOy983tJi871pDQ385fEG752qSe496jCg158qVL845pPb020qT', 'fKz857xZn110sTE662mDF181uAW652xCk512tOW975oTT857hP', to_date('09-08-2639 08:06:34', 'dd-mm-yyyy hh24:mi:ss'), 12, 'aVl518dWJ896fSV184qQL194yDA544lBA628hOx941oSb214mQ', 'rdoXmH7v1PSaBnrKFgRT');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('nTj335mQy199kEA862mVD580cMD186xCs085nCF086kWK139gW', 'rOB648qHm484mHM243aQn647sND398uRQ230wSJ140tEq289yV', 'fMR884xXI169pWt669pMd067xAK381yEn237pJA153rOr524vJ', to_date('25-02-3017 20:31:20', 'dd-mm-yyyy hh24:mi:ss'), 19, 'eGR081wKm753gZj735tNu049eGU154tTJ675rKl959kFa931cH', '3PKN9A7e8SnPk6ooAiqk');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('xMW071aTt162mFw214oNH079sTH986pAl044wGd898uWH769hC', 'iPX190uFB182rDB158eYd564sJB274iTG635kMO730nUj175lY', 'lPN081oFq551kLf685iFQ575pBv594bEt420oCS968oKm852hV', to_date('28-11-2082 04:42:05', 'dd-mm-yyyy hh24:mi:ss'), 20, 'nKp061gDG637oRR839lIz434tZQ517aYv137lNC050jQj349bQ', 'mH8T0FeDfIPyQBIC95w4');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('iQh155uJe299cTG757kAe625qTH480zEh546iVn687mZr960mK', 'kDw343xSs581lJG912cJl336vAB716mEi365lPO870lZZ318bM', 'tDw291iAQ022eTi852nZf454nPx885nNV088fQz163wLu892sE', to_date('23-10-2572 19:20:38', 'dd-mm-yyyy hh24:mi:ss'), 2, 'rWz040qDG587dSD595wGQ227mBR094qNM931bHC236qCK042zG', 'wZY639pJX437aHK987oLW065wMz118fAl599wUO774aXz091dO');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('oXt343eMA799kCS047pRG755ePj747fYG364xOS824lIN811oB', 'jZa387bPO587kMt484xKo394wRy854nRC711uSN226sQm579oS', 'mMo893uGd394iKp174dHH548zMv339lOX657kYw151rVX450lH', to_date('15-02-2046 04:06:31', 'dd-mm-yyyy hh24:mi:ss'), 18, 'gCo628lDJ515oCp323fFE479lSY142dUI024jQs127nUi134bL', 'pds551YlSg3TPkPWUorW');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('lFg073rGn027nTb539pNQ283xIH543pND643lHa180cRO979mW', 'xKs918uIN254yUb648sOs946vIk343gZB640jAM460hOY795cX', 'rSF549cMO787uRP774iLu498uRl588uLK030eXA614iRq395aJ', to_date('03-09-2839 17:57:59', 'dd-mm-yyyy hh24:mi:ss'), 16, 'oKp178nOR693lUz542dFX861qYz343vGq774yFe187nUw244qU', 'aUU144lTX217nBR859yGN923vSE049rBe979hZx378uFS568rU');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('oPz589uQv157mII580uYX682kYu618yHC991bSc838bHU423yS', 'aNh764xFk056jXp198qXK757gAF731aMU457nNf326yGD878wC', 'iGi624uKI014nVj150xIi263uUu955wEF342gSr379yLF021yH', to_date('01-04-2189 19:55:12', 'dd-mm-yyyy hh24:mi:ss'), 8, 'xZR951vXr254oKT728hQk429rEl736sBh198sKB091rOJ421nB', 'nTF181oPm469vXJ543lJF675gWh315hSz850ySy444vWa968nF');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('rNG184sZb368mQf668iAy936hMh813gRD750yMz573dVK813hC', 'aLd862iCl339cTp782hAm263vMt916rRV993vTn812tTD926lY', 'wFH363oGB871cGS853cET738qWc622mKF614tCK696sPv364nW', to_date('29-07-1981 21:07:20', 'dd-mm-yyyy hh24:mi:ss'), 3, 'xDi723gDt118gCy582dZc958eDy110xDW727wMB126oOW210pH', 'iOW542wJm877zIZ763kJp499gSn839iLS582dYc257dEh329qL');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('cED797hKC167iDF973wSb056iIO354kKg513iXP123wUd377fC', 'lFY533qAN376jYb677gQB461aJQ817uBC433vIr068sSE181pP', 'xIB263bZH030kTZ718iQE193fLh232nEe058hRy225jOj235gC', to_date('24-07-2434 07:12:17', 'dd-mm-yyyy hh24:mi:ss'), 3, 'yNo533tKb199pUu685nLr459zNO372rNF319uFA880jVj571fE', 'vBn388oQg748aXw243jDn088jWa637cZr816vBt415hJM219bT');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('nIb526cPa032qAm838sMS334iED684aDV367mSY258jSk220bL', 'oSl728yEG697mLV156aMw215mAF245tNy141bMt460iRV018dD', 'xAn678uWV381jNC911cYX080uVr191dZn667aNy934rVT057tG', to_date('22-03-2422 06:45:04', 'dd-mm-yyyy hh24:mi:ss'), 17, 'uWj994rWh566vFj654sFy613sTs160uZy569hDS129mVJ633cI', 'soIrFQoX81DKge5WbhA4');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('gZm690uKv157iSw937vBR541xWa021zVI679zGo952uWF826hI', 'qXd163bPt592lXg721zVZ759qYZ024rJG710pKI651tQH236vL', 'gIQ529jDA093dHp857xFI087hEb996yAs035rZz396yPD326dR', to_date('08-09-2657 03:45:30', 'dd-mm-yyyy hh24:mi:ss'), 19, 'aJH611qNh449fSt088yYM121rIN814yEf195cVU117lDw059gY', '6y0zf6LjtRNezxaZShYX');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('sDm133lGQ634oNK553jGR959rDK542nMx996kEL870vZR987yA', 'lVS177gXg568aRc198jHk196kNb962gNW121rMC869gWL270gU', 'qIR543sMh960wAa295iKD463vEj392mZi291kWT886bUU615zB', to_date('27-06-2499 02:39:15', 'dd-mm-yyyy hh24:mi:ss'), 8, 'mXW946tLX760jBY793uCM554gEV855yEM884wSR358uJJ585qH', 'yVQ977uZs978lTc615qBn022tQE619aMb683oXA178wBL136vX');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('nFW075tWM114hHp470hSa919uFo233aWe331uMl391wLL681fD', 'wYY314wKw937eQg778kCi613gDX335iQG014nCI833jVT784nY', 'xZC358mCx724sGd977pZp377mQv023yUc614eUs246dBN212jH', to_date('28-07-2184 23:36:23', 'dd-mm-yyyy hh24:mi:ss'), 13, 'xJn933qFV531pLK989eKF753yIp588dZm222uHy619bOp284oP', 'eDd819sQT191eFi861iFf067hVg329dWS219rGT690xPz545dG');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('nYr812pWc875iLw933mHL534lLv521zAk524cKf387jXt123lF', 'uCb353eAP760yZo760iRE544yMD732mOq712wSD927mVv243eU', 'oCU540xQe733oNx365lVV039xCQ015jWZ743sNm616gVe438fG', to_date('08-09-3010 23:20:15', 'dd-mm-yyyy hh24:mi:ss'), 16, 'aSH829hKU074vNM844nHM318xNP139jUT070nJx637vGX779kB', 'vZV095nWz732bBI456iSz381mGN315iUd936bEw262gAM915mE');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('jEr580zXX973pVH887xLM190aNt022lZk564oZT468hAV666wF', 'yAM646fUk680vTZ850nNa559eEq551pCr177fGU835qMt036oQ', 'xSn824rQw725tAl137vAa332mNE112aWz091hFi081pSJ398jU', to_date('22-10-2235 16:16:45', 'dd-mm-yyyy hh24:mi:ss'), 7, 'yQQ259gKH665yNa426uZj492dOq576iXb878jJR453wLP524kV', 'UGnsttShlqLOAX5RMdfo');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('yAx282iQJ319eQh180vAt548vAE264yDI932vCs284lMO486wT', 'dPC235fYK263lFf593wIQ895aJv970wYP239oGz652sUt239aI', 'hRr911hWs648wEj128iCb129hYM662hSI160gMY544qHf786oN', to_date('27-09-1989 13:04:39', 'dd-mm-yyyy hh24:mi:ss'), 15, 'xIx492rQj553aTd646vEz482tCf443tDB850qYS826aHF190pG', 'bXg420bZv057pSF334eRl614wGx197dUg975pSB275mCE610jJ');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('hEU496aKL638qGs175fOs055hUx895vOS356nFH247bJy947qU', 'zOv536sII844tTP237lBP587vBI142nMY713mYd816cYX743vK', 'aQh147gBu285dXP071vBf558uGi382jFZ292yPv337kRf748pW', to_date('24-07-3064 03:22:01', 'dd-mm-yyyy hh24:mi:ss'), 14, 'lMN298zSg515uNh783xAB025hNS529eOj714jMg356cMV294aL', 'MBdvCpldkY49Ki9Ht263');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('uZi930xKr188jBg894yGf166sWO897nRR155mEN540kDp320hW', 'iCD062tNL853bFz740wPt910jDi095rIX419pYv013gUh724uA', 'kKW593fXW452dPG931hKV182tTx398eIP981jGu074cRO689uS', to_date('30-07-2587 19:19:03', 'dd-mm-yyyy hh24:mi:ss'), 14, 'nFl269oEp739mPA322bAg429jUv871tPy457bBQ814bYf297iU', 'hYY185zIM319lZq144dYl486mXh324eJL667rHq780eMj476mF');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('bWm637oNK097bLw323zNb539nYN739zIa321zLw046hIp247eK', 'gMG688kGC540wOv757iPU069rQG918cJY530aKv078pTM144hR', 'yZI940uGJ579vJR261zQN415lMg045jOW716tYB899fRU175yQ', to_date('01-02-1982 05:24:51', 'dd-mm-yyyy hh24:mi:ss'), 6, 'oGp767oTM360sCB866iZW690uNA049xVa286sLs899mCU313oS', 'QlJCs7gMYhzBgbSiXijj');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('xEX841cMJ431pYm417aKT468yXt592aFE848sVo856vJJ529cK', 'rIT564uNH484vGX519tCI446jMi234pSX558yDx099tMI468qA', 'vUt046vKK668rXC713fKj065pAJ936kBM985eFk712pVd512xL', to_date('18-06-2355 10:35:11', 'dd-mm-yyyy hh24:mi:ss'), 9, 'cOc868cHP394rBO195kTV468zQd824vTC531nAj281vCE875zZ', 'RAOpQqBvsZCu6us9IgmG');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('mKG949jVo484nAn312oFS194cEf460cCS399lAc913eZN989bD', 'gTM888hFN991mRB268jBB036sEQ011bKu550gWZ591zEF796tF', 'lIN669mTo551kXX386wQJ253zMH888gUM138yCI374qDm778dL', to_date('23-08-2080 18:15:41', 'dd-mm-yyyy hh24:mi:ss'), 19, 'uOS552vUj338eGz229sZm360nVt533eJV683gYk737jWz178lD', 'dRS916zNh475aIj351rZa120yPs752yHd533rBU627gNF578nZ');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('gQq951iSK775pZL455uKO521qZK670yPa171sNq558sCQ573bR', 'qXE511xLg759oVE726jLI863oUx812vVt791nXL169bVK831nK', 'gPE151aIV528aPE330hKY589xSH866aGF193zGr975wBv223iL', to_date('30-10-2226 22:32:52', 'dd-mm-yyyy hh24:mi:ss'), 21, 'zDE751cBh119fNb880oUk952vAS741yHq779aID261uBK125uU', 'bQK664xSL473nDC630gML453bBT610yZB669iRF678fDX935fD');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('cVR995dLO221gSN350lVo360eFk359iEv558wFl337jFy699oI', 'xSH499zKp624nJJ923xYH364cRp283lZV858hMg647qVO872cD', 'eVi174bGF794eNd670hNm939aRZ924xKK169pLe126oLx166cR', to_date('15-06-2866 06:51:59', 'dd-mm-yyyy hh24:mi:ss'), 11, 'aHH344yRb898uVZ796nEq910pDa790dEq489yWT069hRS217pK', '5mpdI59GcbPTHIFQZXEL');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('vIy094qYo721aYf242gZP325nOR093xHO960gBp019wZo338gL', 'jRi784sSv390sEp472tDG653uQE982uDq979aDD924oQi784pR', 'eRB362xNN192gPp655jQT546cFW516pUg411sXX667kKW430kT', to_date('11-08-2020 00:17:16', 'dd-mm-yyyy hh24:mi:ss'), 5, 'eCE073jAd560uAI538vRh333nWZ297bQx557gTe321qKV092oM', 'qsgQNS5WNHpHUWZIgIYi');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('pybbnBEnVgNxSwX9uUFH', 'P0rGtMuWkBrwCIMGBp4B', '5ItGu4qkUjzBRxivyyUL', to_date('23-06-2007', 'dd-mm-yyyy'), 156, 'JL7NzwQFER9G0DX3Xei6', 'zb4Mu6Ao0z5Mekurxzvu');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('y1avAYkB2pHQ0L4sZiz4', 'niwNA7ABt9Vu2XCcbaIO', 'yTyZgUfebVlbb4PEKlhQ', to_date('03-10-2021', 'dd-mm-yyyy'), 273, 'O9692ajio3WCmSa584tb', 'PcvkK6qH35Uwe8uffNgt');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('fTtWLXZtmJl1VSzgzskv', 'YZ0icNeXPzhwuXCgWVIW', 'gN4CxvwIejfwB8avFGJx', to_date('21-08-2000', 'dd-mm-yyyy'), 406, 'Bfdc3r39CAJw2Vbeuuhm', 'sKYiehFHn7j7ks4lObBf');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('dpscbeJKqsPEZhNwg90J', 'tc2z5SV3BAc7rQ2vsJmR', 'qL5r3VFQSEoxqeZkvFAJ', to_date('02-11-2012', 'dd-mm-yyyy'), 468, '1ROMkVnlvDnH7GnNbjn3', 'p4EboI4uOwCeVTbhiSpy');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('gL0i5wtpZn3fEv1R3ZqB', 'jKetBsyNykOR4x41QAwR', '1nvpVCytrZN8X2b895yw', to_date('27-04-2017', 'dd-mm-yyyy'), 310, 'EG0JWB3cSdunKDlAr2HA', '9kjynS4NYMYtT3lHpJKA');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('GhE5nvOtdYkgNbPQKkra', 'p7PW1Mwb08bwuzEy8YdI', 'fpWyho36U3HD6MkGCf4C', to_date('24-01-2002', 'dd-mm-yyyy'), 428, 'nvLrzl4srFqHNlOm4S6f', 'kezX82Vtplhs3b6hwl8t');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('BObJ6VLBljGsxLSWjrW2', 'z2oKNu1SJGPPpiryytKk', 'FxJXTkxhFfW24VvkgWj5', to_date('13-12-2002', 'dd-mm-yyyy'), 166, 'i6Cm6TVSg9chn7gBNVwG', '3tQw4wxwfAocdGMFokum');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('rU4VY9sOnuTUDdsDdIeC', '11oFDUxqlh6HJTVlfLmC', 'fRZzfzOzRDv7Fmr2wOib', to_date('06-05-2009', 'dd-mm-yyyy'), 249, 'jvYgSfm9KozkxxzaXpfT', 'nL0rpQ69YntMSLvgutii');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('RmPJuVI9Xgy5xSdtqMvO', 'LmXxRL7HJxW9sazUg2G1', 'am6XJiCJwzf6ysnQne7b', to_date('09-12-2007', 'dd-mm-yyyy'), 465, 'JmsHOp4MPgTsF7CUIDwo', 'wUn9d5lN9gM8yl62t98D');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('RB2Bbdez7ZmGNc8JDy0Y', 'qpU7DaZ8XmYVt4MXQa6s', 'YaKaQm9IEvhPFKyMn54y', to_date('11-10-2003', 'dd-mm-yyyy'), 180, 'tyoBruMaHGEyzHYKB65C', 'nL0rpQ69YntMSLvgutii');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('d1WR5Q9k6QFPhDDARzfg', 'qpybYDqBLgwFLxf0gSNl', 'Qnhghq66Y5GVmPOMy8V3', to_date('09-01-2020', 'dd-mm-yyyy'), 408, 'UIyaiLefTfoA8mbRyWZl', 'tgQi68p4TUxmCPvrNts0');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('7RtL0wQ2d5Mb8g29CnZa', 'Ha8OWsUxgNC3T5IxZuCE', 'zDBblfXFVW5U035Yyn59', to_date('02-05-2015', 'dd-mm-yyyy'), 297, 'QCg3GE0Uajyu4HxN9lsQ', 'Dwa3vW6Td91Aa7Ncu7H5');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('IoNRfXjIauqmtEoioGjv', 'pmNaXTCOtYUP3MsZ4hHn', 'S3VmC6qa8eUqzDo3V1Vs', to_date('17-02-2004', 'dd-mm-yyyy'), 70, '42hwwQnjm1XUPQmjm7ad', 'sKYiehFHn7j7ks4lObBf');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('u0kJmKeBO5YgvlW05nmE', 'RKQfTdBpsTQEVefhGthe', 'QA9Lt8fMbEB37uyStPZY', to_date('12-12-2014', 'dd-mm-yyyy'), 352, '7wOQe9I386y3Vd5OrVOd', 'kWt0XtaBhEqEtGcTMnxE');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('5O3RYcDQBebTThuzjgrn', 'nqNAFQLnQ0q2rMcKzoiy', '0LFgMyZUyxOb8JyVginK', to_date('18-08-2006', 'dd-mm-yyyy'), 459, 'Ow5rXATI7ZuVbkRCs9Dq', 'b8XrBN7QTOHUxOUjjC8F');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('ycRLs5xWmku6ZFF3uXxY', 'QO8CfgRG9KKX5bdoAVb8', 'JeV4bipkqVlWvJmbYvEV', to_date('19-08-2003', 'dd-mm-yyyy'), 484, '4p2wJXHNve27EwOMV4Hu', 'moMcsEeqlxRagCZfTZPS');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('9hBuTPn2HcP0Gqiuaypq', 'XEi6AF3xTqqoBfmFd6TB', 'g4WXSWMtqj72hZ5DzESz', to_date('27-02-2007', 'dd-mm-yyyy'), 71, 'WRCNNab5Q2403IJgK4iV', '50Mn6wVWpSgehfbORrfR');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('GcTsC8VpFLWcKB6f4vba', 'pcPFhAUw2czGJSe3Wd2e', 'cetjbS0aOQzcrdLqTFwK', to_date('15-03-2015', 'dd-mm-yyyy'), 59, 'VOT4ZuGfX0ZVdfCKCmqE', '50Mn6wVWpSgehfbORrfR');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('7YgA78191QVOwytkuX28', '1KoEOT5vJC19xSi2SxNR', 'jyWjLciS1HTP3HRkFJgk', to_date('27-10-2021', 'dd-mm-yyyy'), 125, 'W4xCHF2kACHdWm8eaeIV', 'Q0MUkzYW5Kwe1qWPcjqt');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('uTYDl091PXjc3Xw9Cze7', '0AQZA1ksLsPUfoYlXZnw', 'k21Wl6swucJjQifrSbDf', to_date('17-11-2007', 'dd-mm-yyyy'), 30, 'oidqVsCZ4p7xdPOhNXOB', '9uL80wbwkdhdtT4kPeVb');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('0kt8S28wIlX3EEIfY6Ip', '2UblI3Bzj340jovePgSX', 'IUiRmER9o1DtF95sBHoU', to_date('27-02-2020', 'dd-mm-yyyy'), 15, 'bFOnhgDsuVgS48cGwibU', 'IXEKcaZYooEx8JwuWaAj');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('aTsXkG5XuHWQgRHMXTtN', 'bgx9s0OnjTJWMKmSstmG', 'Y638aOdkoFg6sBgRvocp', to_date('07-12-2009', 'dd-mm-yyyy'), 203, 'U7FYKF3zcmthcKPZW0T0', '3Y8kEqNG0EVwLKqPjNig');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('KmbnAf2mc3zXI3aY6Cpt', 'hYAlTwJmfc4NzHh0Cp1D', 'tCp6k9KnwzkdgCBEo0Le', to_date('14-01-2004', 'dd-mm-yyyy'), 428, 'Ebb3Q8SJeXokJdf3P0V6', 'IXEKcaZYooEx8JwuWaAj');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('9S0yEKDcFikq2UVKAbvu', 'cHcKEZXNHGdLplrpAIc0', 'eCsIpOuOFliMTtn0m4mw', to_date('07-12-2001', 'dd-mm-yyyy'), 423, 'qzISFXy0KC2l0fq1DO5w', 'JBM5UuSAYs3oPMpjuRmh');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('fwZnHZMzB6uva6bHEwnJ', '8Ab6ys4gQBlqtjCvsRdv', 'EEptYKlVtfzrSywyrdMn', to_date('26-07-2000', 'dd-mm-yyyy'), 241, 'jnywfDwWyFGo0J5zIqDJ', 'IsmhwpSX9dYJY35YR0pN');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('rYscjdO6dbnhrzmxUgkd', '29n76xlafTed4tUun8R5', 'csN3ak1iaQRI1Vef4yBl', to_date('25-11-2011', 'dd-mm-yyyy'), 493, '2BokzzYFhuoSDEqucyrs', '70okJpRvnXjo1wvZbLy5');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('fnyLP364dkdYqKSTtxuK', 'oqNUL7exK95c1IxGi0F8', 'Mgw6QLAvN43nwZZcUoZk', to_date('08-06-2021', 'dd-mm-yyyy'), 68, 'MOc0e7ekqOfwlYsXzvi7', 'PdtmS2Y3ivOfXaWkjSaf');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('1DPzZROyC1Wwt1SYKaFu', '6L9M5MYCBV5EZh69eY4H', 'CrmyoKIWUBrJ851Qxkgw', to_date('11-10-2018', 'dd-mm-yyyy'), 477, 'TrXfTqjPU3udHE0sJMOF', 'b8XrBN7QTOHUxOUjjC8F');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('67MWYA8Hj03xFVHajZtc', 'ytYZ4k7PPhsE7Gm4UlbB', 'JMxXopafnXv6KGF6i0wo', to_date('08-09-2012', 'dd-mm-yyyy'), 101, 'z50HkF94FhuhpKiYgtSH', 'JBM5UuSAYs3oPMpjuRmh');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('3IQeXGuoulF9RZhCQ1q1', '8alsPikYc5uIn8Espgzp', 'Y4vYygIf6QUDYXzNQ5Jl', to_date('26-11-2012', 'dd-mm-yyyy'), 183, '5ELX9Wk5NpPp3ItE5WfU', 'tgQi68p4TUxmCPvrNts0');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('s03kHXb2AV7SRlKYIjSm', 'vYaMzELEuhZlUoWnDIZZ', 'swBXbbVJFPhAkJ5KfQit', to_date('23-08-2003', 'dd-mm-yyyy'), 288, 'SpeVke89iGmR1bS1Gfr0', 'xaMhHod5u1PQqG5Zm6th');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('F8fo0yPl9Xj2pBHCkS5o', 'funQB5VzhMCRA6ogM1Ci', 'NmEi2ecqPfTXlOi0rQql', to_date('26-05-2009', 'dd-mm-yyyy'), 249, 'vSWjIbAR1Y7f0ywtb2gu', 'IXEKcaZYooEx8JwuWaAj');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('PtvpWwbbX33XGlbVmCnb', 'U9IDrj1PtMCOv0mP4sFv', '8gjC8IcWRFdlIpgXLWN5', to_date('20-03-2014', 'dd-mm-yyyy'), 414, 'Gi83I4euubUhGdMLplhl', '8eoUoervnsxf4AY6cGcR');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('wbiIIVVpLxD4kyrYhwmP', 'rM0vbaLUCm2kWatt7TBR', 'HyRmnGahfy7zyOBUEFEo', to_date('21-02-2009', 'dd-mm-yyyy'), 336, 'Omai0HH9nvdD8w6lgHsq', 'lvMmmZRiy4S0zehljpGC');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('XzOLUAzIYIZc7FZ2q5hr', '2Bz0MQkA9xTUimcXhB4w', '0pWXCA9kY3NipF4AKFJu', to_date('13-01-2017', 'dd-mm-yyyy'), 355, 'l3n9whQWPhDHJ3TnHmZq', 'twE4EaUzTV4g2lj6tM2O');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('zEu8pAK0zJJYyaoU0F5m', 'atfU0tFIwiyENY10Aai0', 'dhprqiOIo3g2jOOw1XiO', to_date('06-02-2008', 'dd-mm-yyyy'), 222, 'L2pcJT65ShmsZWY5Dis7', '50Mn6wVWpSgehfbORrfR');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('cqbTwNjnecTAsf6TFjXI', 'XmJluCBirmrW2AXcus05', 'FwAWDNX4RCns9Vo6sVi9', to_date('20-11-2012', 'dd-mm-yyyy'), 370, 'kIcc5MKAQSZxQpyZfmXG', '50Mn6wVWpSgehfbORrfR');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('evywxSo7ba2MxLVTWFv0', 'DbxJru8569UKMkMHDNpB', 'l3Lc7xFr5ovzZpMuQH3S', to_date('11-03-2014', 'dd-mm-yyyy'), 140, 'ulNamhGmA9wnTMAskSsJ', 'ITpqcFDYJqrDXVpKcBvT');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('3ueOTk82VqDysp9uoXBt', '0bnYFS0kd9ZmHDFBrn1f', '0PZJXdsaIUaDigYbPlXq', to_date('25-03-2007', 'dd-mm-yyyy'), 208, 'ipHHkuczPAXC5phaTqRm', '5mpdI59GcbPTHIFQZXEL');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Fa9O55I1hAdF98ZtwVRd', 'bNMLd7xMB3IFT3Wxnbrq', 's3vUz15SNngFVi82NIVe', to_date('07-01-2007', 'dd-mm-yyyy'), 155, 'c6D2BrMxdVyG0TnCKG9Y', 'ftPSVoWEbJybMpXDVmsJ');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Pef3Cl7LpKvMjo24RDbM', 'VtpnzTPGe8kkkWz9GLbN', 'oZR1ANEODWB0WQFhfbqQ', to_date('07-12-2006', 'dd-mm-yyyy'), 290, '5MzEnGCtl1z2iR26UTxp', 'OfCZKwhcMeubnCRdPgJy');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('5rkxpiaf3TD03k5YCte6', 'a2Amp4UeAte2zYKG11kW', '3Jk6M448b0ji69D5ZLc4', to_date('08-11-2020', 'dd-mm-yyyy'), 348, 'tcgX2TV6icfW1q7N5n05', 'x5q9vvyjRTTb7hZoJ8l5');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('5Z4QIPcIex7GFOD5N3XL', 'UMQl6jqysBe8GiUJB6Db', 'Yyon1olwfce0vvvh0zvK', to_date('16-11-2005', 'dd-mm-yyyy'), 461, 'BeoOilmPG0WMQ9Akw36v', 'hkHzC0oXSne8mMj3cJhI');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('NDSuaFqzLps0WJWSIi4R', 'IH3JTReyFkbrVV4EkCVh', 'Qv731VkrRUrpcKfu76Dc', to_date('12-06-2004', 'dd-mm-yyyy'), 92, 'zzXdHRQhZisGxhoIi4zr', 'rdoXmH7v1PSaBnrKFgRT');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Dhsp8zO26RelssnbvxWB', 'F8jAPAX1Rg5rlpGb8SSL', 'O2t9Pw7gn9eP3tgZV1B4', to_date('09-10-2007', 'dd-mm-yyyy'), 307, '4USIdZdLdhojs7e52kTp', 'SNXmE5fPhWLhPx9x26OD');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('XVCWCmQTDeXvloaEDpKW', 'sfUUEWwNFFjrTgdrIkOh', 'CJSTw0V0jdiXm2hXYZTJ', to_date('21-01-2001', 'dd-mm-yyyy'), 405, '0uX64uhG1JF34esYvHRR', 'jXHSJUwVBAHb2TnBMR4M');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('TyMJESa86cLORC9yQtl7', 'SDqqDN23e3GspjlCYkhT', 'CvxuDO9ivlEudIDAaUXL', to_date('28-11-2010', 'dd-mm-yyyy'), 32, 'QlXKnpT2eOVDo2WBrZmF', 'X9sbgetf7tTvn1qwPW8B');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('SLh1YFP7x1uPe5HKBvIh', 'XeRS7RQ9FzRuGgihhLPA', 'BoTsoibfROQye5BThLFV', to_date('03-05-2008', 'dd-mm-yyyy'), 186, 'MPFeuVtGkjWGULJQGxmR', 'X9sbgetf7tTvn1qwPW8B');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('UUtQR97yvuExy2K1RrVW', '6ARILoPwxTUj4qL0EpVB', 'Ra5tf2X8pJ424gdad3YH', to_date('16-05-2018', 'dd-mm-yyyy'), 291, '4i5DR97bDPsyvq1EweJO', 'NPQAOwV0LUxO4JD5k8h9');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Zz79pvi19KDhzXw5kIru', 'SUDXptbWnDiW2zTIUija', 'pqwk1G8wPDSjkvcXVdqJ', to_date('05-05-2011', 'dd-mm-yyyy'), 259, 'zazZkJOffNwycyp1cWCu', 'ODj7jzvqMe5URGEXFWX0');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('sJBc8xcABLl0ZRPMgNtH', 'nJeZ17e8gh8Tfx4eDAjQ', 'xM3wcpJTyrlxmzb3Lhvp', to_date('10-04-2017', 'dd-mm-yyyy'), 84, 'FL2D06RWinhmKYmhRhvi', 'tLWhMATUhzkwQgP9gc4T');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('leH5pdq5BIugKcfbh7bD', 'gdEgKL71FNFvC7JzrvSk', 'YHmkHD6wDZkkfalX82EE', to_date('28-11-2023', 'dd-mm-yyyy'), 116, 'HLlzg9jg1tcllwENDdzo', 'w6nAvprRWz7Vz0tbj8dl');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('3w8OO2oxszQCDBcKPOMJ', 'x7JpA3dfEsVnJd9kxy4k', 'C7UX6z2L8p4ZJvV8YCLl', to_date('28-10-2008', 'dd-mm-yyyy'), 422, 'tKbDNPTZNrhGPf5u0DZi', 'W0TcQjOG9v5RRq3vVb9N');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('98PXa16Ymwn6oufBffjg', 'yY3X5jjurTTgrAynka55', '5cvTyukWZtXCLNzvZa7Z', to_date('18-08-2001', 'dd-mm-yyyy'), 395, '6ejFSqwIaH2NTnxzJ3wk', 'tLWhMATUhzkwQgP9gc4T');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('wUXxNUwmVauHKeejxD6z', 'lMOABeHeBxR8LGmxzmGl', 'JaVMYkxhVK04V7r32RWB', to_date('23-08-2015', 'dd-mm-yyyy'), 315, '8LAlyY0MQ08ioAvIUxTU', 'omsS22iNMYcHhpvh7J34');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('evQGLt2DhTgkcBXTQRSP', 'okgGc3alf0OJMxi7AZkt', 'rpPQIKuoZbaGeGUBOes2', to_date('20-06-2023', 'dd-mm-yyyy'), 270, 'l8al1GpcRsCwQ8PvJlUK', 'WZ4a1gVhJGYTzbDNVxLe');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('gwTqDcU5LrftNtHQiG6K', '2vppd2QUTfLbRgDtcYA1', 'iSVQNf3d8SEW0cbkNoV1', to_date('02-12-2013', 'dd-mm-yyyy'), 204, '3McbsZSUo5H43iTHJGZZ', 'F3m2SAPRJdX4UebXIMhI');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('YaAR65w8bCj4bU0rkCeD', 'bT7h0jKTUj6TgaQPI8pX', 'IUnROrJfv4XTPdTi9xYQ', to_date('20-07-2016', 'dd-mm-yyyy'), 252, '9jjMjJLMc7AlGpFf7iyF', 'iDbsx4R4PQidkYhPteoB');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('W4O5A2xMwXbK3ZR9QGzW', 'Js3gAg0VZcctwUlrDlOM', 'X8nlVGlJuO7CfHwYHUa1', to_date('14-11-2004', 'dd-mm-yyyy'), 166, 'xH4mQx4cWW0EtTTOJ8cX', '448anVd5h1XF4ctrNTJs');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('WSChBYHrQKRfgOHSkoDH', 'EpiQikWtyB6afjy8mMcD', 'WS5OQ34t2ziJs1sjHFox', to_date('10-08-2021', 'dd-mm-yyyy'), 240, '0sdtyD3AIM7Xva4BZ04m', 'A3eQ0pZViHGlWtzTIiMU');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('F6mJCHWl3Jyi3OyS5J82', 'jV9XLngQjjxFHxxmmREY', 'Y7bGNQxXBpRuIFyJT7c0', to_date('21-08-2007', 'dd-mm-yyyy'), 84, 'lk3zDjMfz16W3p650jJM', 'o4319U2hhwOyufSq7NWj');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('mLJK0d3Q3KYaRDaH3owt', 'eL6iDnYpLteuTkh39j7H', 'MHdOjVzfmeq0H1Ub7bSf', to_date('25-10-2010', 'dd-mm-yyyy'), 327, '9JjXyrbaJWO40OVEBaPt', 'pds551YlSg3TPkPWUorW');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('kUu08xKfQCnaICUZnjIa', '1UptgGC4wjKmWCMojCNW', 'be6Y71olj1uNRf4d79N8', to_date('10-04-2016', 'dd-mm-yyyy'), 92, 'j8ESrS6WIQEiKAE3FsPI', 'h7RBnMPZfOO58pvr5nM9');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('hWIJ0cX0zz09YjFaady5', 'x0j7fC9pUKNgzB1mNju6', 'X9ISaf0g0nwQUlipgT0p', to_date('07-12-2007', 'dd-mm-yyyy'), 436, 'VGHuhZKtWFhCeqTTiFh9', 'rzLshY2s1kyhcwtF1SSM');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('MfQOWD1QbDdGFcVEUKP0', 'vOp3Yq1HKC1Ih8V68c2m', '3KSuROFYQqq1aLBMbmxt', to_date('19-08-2013', 'dd-mm-yyyy'), 107, 'dZLAqjtW8TQ7OdDZhMWE', '3UQKI6UVMnM0yI2hcQT7');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('fXXqu4ksn1TaMoYRJ4Py', 'RegLWrWlGPNGhxo8HohP', 'KaTUtUkUmqAfXuRvVWy3', to_date('22-04-2012', 'dd-mm-yyyy'), 172, 'yzmrtG6J18SEU0rokRIL', 'AtGmLZFITbw4ZvVpuquC');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('aqvCTJUSMEIi1LsFewIn', 'rxpNB51bx6eYiMySoH4J', 'ZK8trH5DIHLMprgKzeys', to_date('16-06-2010', 'dd-mm-yyyy'), 11, 'U6Ql7QicE2QeB8wkEDBb', 'iDbsx4R4PQidkYhPteoB');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('OqUXtmnajIsilOQl5wW2', 'WvKZHLbaxM6H6l0XjKps', 'qUKMXHo4Vm7nxfUUTicf', to_date('13-09-2007', 'dd-mm-yyyy'), 367, 'LTRNgHdME2A2GG7hii0w', '1cjqlv29gmm9ZmMjq7qC');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('vsmGayLc0GwK0L5G447M', 'fpTMkAI4Id6OlxCWttDK', 'q7W5NCJfOg6Xcl3HQ0Il', to_date('24-01-2019', 'dd-mm-yyyy'), 76, 'VOuz80yRD5WwgxL5AF7r', 'X9sbgetf7tTvn1qwPW8B');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('IHbHubof5sWEXPAKuS4w', 'Km6Vz9o9jwKSnswUIRZa', 'BPzJyeQTdBt78y4QBoGJ', to_date('25-06-2004', 'dd-mm-yyyy'), 44, 'V5UaKUCycCjKytTfiD8A', '9ugEkJptTBCmjiKwAwdJ');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('iCWnWrtoCWJeN5pPHiuC', 'WYh0NLQas8BdzeRbfBQM', 'aqPvKZCYEQ58pE3kgMod', to_date('01-12-2018', 'dd-mm-yyyy'), 206, 'fPKJjofjXqZwBu04AWa7', 'p8lQWKfvrwHlcNSXzpzQ');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Co5IEwGFd0cVnLZORhuF', '9fKH6mtnycnIu96aQQki', 'BRthU91OpK3lAW4AkNjG', to_date('14-12-2002', 'dd-mm-yyyy'), 267, 'vX6oJLrl5YqGwvghsb55', 'pPyFpOA5R74yqP5I7iMQ');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('1CxXqwVYv0sv91eXrJq4', 'Jf8SsdMSOYWiadSl26wm', '7aTaUb668J5wSpfhDJY6', to_date('18-02-2012', 'dd-mm-yyyy'), 211, 'ao5ibVq69PbhHE8nJSi3', '7pXMsMrQdfQyCsdOJ4Qw');
commit;
prompt 200 records committed...
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('RabB8fOhJetRYuJMdM8E', 'QfA305K5pds8qxUXVgyk', 'mUp89AazA4MdwFO4Dd7A', to_date('20-03-2010', 'dd-mm-yyyy'), 377, 'bJSXFDcKbFObtfZQWP27', 'pds551YlSg3TPkPWUorW');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('1TrOPzipcMEQ2Sw82b8s', 'GJnTQwImDnzlLREEP4WO', 'foXlRmZuZq5SBdj4ZOaj', to_date('12-05-2010', 'dd-mm-yyyy'), 82, 'BXn80JoWSYBneWDmqJPK', 'nQQ7u54fVnfHxOga9QJ6');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('kPmPkyu056kgVpE02p3c', 'zlrHbjN443CZKKCmuQTd', 'UUZ4fzK3psJLSeVEmQHZ', to_date('22-11-2001', 'dd-mm-yyyy'), 321, 'vWpoKDqzCYZkybTj9i13', 'AtGmLZFITbw4ZvVpuquC');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('v0tBB5oV1sjMYdAWpAMT', 'gHmunMTGgujk1ozCrGQh', 'd7OtUb9d1EuNFdNX0wdm', to_date('07-09-2001', 'dd-mm-yyyy'), 448, '3684rnd95HKSPYnqLYkp', '1dEC7GbGLoJ30UzrfKwM');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('7nWOJu6EFkKSjLN5YrpC', 'ZTSOMhS7rIZH7YbqLzV3', 'sqlwH21SRcjXRfW4HbmN', to_date('12-12-2014', 'dd-mm-yyyy'), 196, 'Rj37aoaLWOSu1WEPFcSv', 'YhVoJ8eJ0X4233h74uTx');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('6gY6vHxKOyUtZKciLFWe', 'arbSTZNleCSgsEVyBSyv', 'KGTEyKcjKi0BIX0jTPLC', to_date('24-04-2008', 'dd-mm-yyyy'), 114, 'Tr4aZOlvEYW9T84lz5AT', 'a0moKtMAJToJ9DiuxH4Y');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('bqkVyJiFIf3n1v1PkVZY', 'G6niqletEzsQHe5tokyf', 'OLS64lJ9mYmZ2kGVBDST', to_date('06-06-2014', 'dd-mm-yyyy'), 59, 'Lh3QnAXJViK36nUtIZDy', 'WY7tGrjfCj10TaDsjVxY');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('R8ovhwd7o5T9Wdi6cR9f', 'B1C6E1uhVCttkujOHZcJ', 'lJ5cwVqGegtYRZUrJJ2z', to_date('26-07-2001', 'dd-mm-yyyy'), 287, 'D3SZnU2ekTpoXcgAnhKs', 'BvYrxmG8B4mdqv8oygar');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('GGWnEKgcl0nv0twI3vBG', 'BYn814veNsPOaEURbRRy', '4K9Qc2bBMDIqziEqYC8o', to_date('18-09-2010', 'dd-mm-yyyy'), 157, 'fW6XBfy6otFLhYD2AifV', '6UcgpSngEiqUGXrxHeoH');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Ts2Eg4s5Iout7xsCUZEP', 'G2oXDYFw6JKJa5rkzQyf', 'HAFsQwmNR5PupPQtTQxN', to_date('09-06-2006', 'dd-mm-yyyy'), 307, 'uFg01hFWXjYKlsbnHTvZ', 'fvk50GKblvduh1EjeL5r');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Vqusi6LO9EtZMEfzhppG', 'Eunlp8YMlJtpnkEgwrQ7', '3WhCStV7aQBgOdQ0jIDD', to_date('18-05-2011', 'dd-mm-yyyy'), 160, 'cmyh79QU6rudBObQpBel', '8XrZDSkxmxluTZ6R69Iz');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('IcyJuESXmJ86B9RRDn5y', 'MDqJg8qGrl4HDyzAvatw', 'Guxj7HZ4WH29gIx4U4jV', to_date('14-06-2009', 'dd-mm-yyyy'), 348, 'XGnDDewey3HnrmppHkEw', 'jXHSJUwVBAHb2TnBMR4M');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('ICuJ0mVCEm7c0WAjIhXp', 'EHPa5c63Iy1VGTDQobas', 'PW1bPDZspq6RA1Y73YI6', to_date('01-03-2009', 'dd-mm-yyyy'), 209, 'kI1MXhMtK9tPqGq6TGRD', 'SKc0qLftJozhdWOzHS7L');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('w0fTozRYziqjs0tOVE3I', 'wWhxShRztBMSsNZcDFsU', 'LHc9TnaMjX70oJuXWgo0', to_date('20-09-2004', 'dd-mm-yyyy'), 93, 'Z76ClHVSyzSt4BlXarPC', 'NqtHNVNNBPqRc9JATlFv');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('EGbWfGf6sDXbxbN3LdWA', 'd7omz1LfcHzYrCNQLn0p', 'W7YW3OmrHPYbosgHfEIt', to_date('20-06-2000', 'dd-mm-yyyy'), 82, 'oTG6FRZhSEEiHKU5Uf3p', '81DBQ5TCBV92Sjm4KCSh');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('WmVDze5NaFzmaPKFFMMD', 'a8xQmVmW1GIxMnQghP1M', 'kGE4lcF1JFgvu6x2bqct', to_date('04-09-2006', 'dd-mm-yyyy'), 320, 'DtiG0gKIw0yWcwraeecG', 'rdoXmH7v1PSaBnrKFgRT');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('8n2EQvmU9ENQBgfJO0H4', 's3cNabmvuo1QzNC2d9vA', 'p2ZrikEKawhXjZMc0pnh', to_date('25-03-2000', 'dd-mm-yyyy'), 107, 'Y7WUowbf8oNN00JUWylI', 'OfCZKwhcMeubnCRdPgJy');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('8pgoiad5ZnmxDx0kVkQm', 'wEr1ePXiHZmdcjBtsXrR', '5jtZLg3hjICFEOCCY4uJ', to_date('13-12-2022', 'dd-mm-yyyy'), 291, 'SmwGnG20DyhNzHcMAowB', 'tLWhMATUhzkwQgP9gc4T');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('OLuCOsEvCrgkr5gMGoPI', 'gpdbdAMxORusgBUGcSY5', 'IQoEqY5pLQBkaeIyPEpQ', to_date('15-08-2003', 'dd-mm-yyyy'), 128, 'whhU0vYAchcmERer8YrC', 'mH8T0FeDfIPyQBIC95w4');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('rTHAJp1fZiRjKHKPJELs', 'hfu6iiXdPrOrr28myrKU', '1V4xZQLnRm66zOmb2rlc', to_date('20-04-2008', 'dd-mm-yyyy'), 413, 'LVWuEOZfRWKJQHhANbud', 'emmcL5gk56xr3JLj6H3q');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('nCRsKsCKZBqmBn6grdCq', 'dFLOvmbToY9djcuR59Lu', 'vy9tTDguaWhfQDtUu2Io', to_date('27-10-2011', 'dd-mm-yyyy'), 60, '4aQjJ9KGVqFfaRLVRrny', 'tLWhMATUhzkwQgP9gc4T');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('aglF7VnJ6ZpbNQzttHh3', 'HyMoV56CUmdoWEmNH2Yo', '5yC5nvENH62Ds8TIKEI4', to_date('28-11-2010', 'dd-mm-yyyy'), 462, 'dt6iwox9ZNTEO4j36a69', 'ksnGSIRhTxv1oxLDz7z7');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('jpFkSGjvi0HQoK67IDvK', '7mhmXXQWJjQVFRfUi9L1', 'YHZDW4s2ajUVKm5lbU97', to_date('20-08-2013', 'dd-mm-yyyy'), 181, 'n8hcLeUx1dCJNPIVIFpg', 'EYVg8sLWEbPjtFwAB08y');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('gSFcd9LVCflYVFezTDEH', 'lArVW4y9AhGy9No0KzYJ', 'm2GoPOy8HWUWeAOQ2s5T', to_date('01-10-2016', 'dd-mm-yyyy'), 490, 'SlBGgxU1y9NNStMXop03', '6UcgpSngEiqUGXrxHeoH');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('aLw8pY6XRw3n4A0ZZlqE', 'KAAzGysM4CkvWYCz1J1F', 'lpSvBHM82vsxtLBgfM56', to_date('13-09-2018', 'dd-mm-yyyy'), 93, 'nkfIVqkPaJ7au84mjMyc', 'oMGlM4NQ2rHoR3YK5gxP');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('GUS1VRNCwTbvzBGirtJb', 'l2bY1xgntOgAQFzQhYRf', 'YdEaoq9df9WmTRkqKQH0', to_date('03-05-2004', 'dd-mm-yyyy'), 200, 'R9hegO4BujYCb8e6gHsm', 'tt9hJgoIIHBazDIPaqcA');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('TKUbRHOt7VR73IDag9Q8', '1vO7oZ1Y8wQl2gbY4dhO', '1GroJHKv4yXULRzY2geT', to_date('15-04-2001', 'dd-mm-yyyy'), 428, 'QdnWv5H7rUU8tMNZwsZt', 'oklbQJ1wtxpwrmrgpLbo');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('xTTikFplwfjg49RhfKnX', 'DKFLYzqZGYrqb6Ic6W8d', 'Oy9mr8SDa7ZhUIVkczu0', to_date('23-04-2005', 'dd-mm-yyyy'), 332, 'mosOYdYs4NEQrCKJvjzs', '6y0zf6LjtRNezxaZShYX');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('GtL6OqDynO0gixvRgsFv', 'HUhUIPxSLyu47yvKO6sa', 'qFpi8Ay7j227iJVCFHdF', to_date('20-11-2005', 'dd-mm-yyyy'), 121, 'aYlJRYaoVFrYcz8Tncfb', 'p8lQWKfvrwHlcNSXzpzQ');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('WZsN5y7bpY4x2Mw9QFYX', 'eWivMprrKa5ZKw1z8egE', 'VVCtQhHMs3niLEsyXHiK', to_date('22-11-2014', 'dd-mm-yyyy'), 473, 'G33GQPnLqSb5QrC6OaTj', 'UPfWJMhglvMP6b8GDDh3');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('42vkZv4G2J5J4UOW4YhG', 'uRZq1K7QB8Foezc2bvv6', 'QHyL2pVgZPj1fRSfvZJl', to_date('25-08-2000', 'dd-mm-yyyy'), 224, '9jcsZBgMmI8cq4gGNRbm', '3LyIIj1UL2uQqoC7ZKrs');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('njxt4sbpL44N3Be4fYSw', 'r2HgkyIZ9fZxiMxoGd1E', 'yUugzFZSKFxpJNK4PMwo', to_date('17-07-2011', 'dd-mm-yyyy'), 159, 'xG6gqd1Xe1HTu0nweu31', '7pXMsMrQdfQyCsdOJ4Qw');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('3jNdlUmTrzQGHMXldyFU', 'caosnqagcbYRCGlR5sJm', 'CgrsmuWlZcBY7pFFh8Ew', to_date('08-09-2013', 'dd-mm-yyyy'), 496, 'a9mUCjn4iVr7UZrJ782R', 'pds551YlSg3TPkPWUorW');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('exbyzZxodzRjyDMNDf6k', 'W1G9mo9e0Kl9sitdc9IG', 'zUkrFmftESNO6I9y6GqD', to_date('23-12-2001', 'dd-mm-yyyy'), 133, 'toDJZIXf4ULtJRYQGngu', 'GuASbGP3QMnZiLY72T6D');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Sb2nAe53KKbJA0QrhFuR', '1RQyXhfTsaJ05RxiW6CH', 'hLeKGR1rs2GGbSJMhjjb', to_date('20-04-2010', 'dd-mm-yyyy'), 218, 'bYHryZmRmQpodwupdXVq', 'A3eQ0pZViHGlWtzTIiMU');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('521RNe8PeChGJzOA5hZi', 'GikTHavfsrDeJLPXoT7d', 'jei77W5r1VVz5Jlwsifv', to_date('03-04-2012', 'dd-mm-yyyy'), 424, 'phqflfD9FQObrnsvT05s', 'tt9hJgoIIHBazDIPaqcA');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('Y9rzE1nCaIhABYjxeKX4', 'WswzdpkqBw3VLL6dDoL1', 'ddqZCd3fovxpfcCusApm', to_date('27-02-2013', 'dd-mm-yyyy'), 281, '3r65RjdsDWb5ibHdy8fR', 'UPfWJMhglvMP6b8GDDh3');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('5H7kjEe14oiTvPtzutVI', 'bXT2NK8vjw5sZMXy16Bf', 'eJYrr7oUqlbojsL3fzTQ', to_date('03-02-2000', 'dd-mm-yyyy'), 192, 'l0DjAhIy5NwSfPyuPluA', 'CFjkZLKg0k7i31Vb0cXq');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('syTjLx8LQyBjbabvnCRT', 'jDPS3hKN8DhxOy73qvhb', 'fs8TrjhFnMkqWfqUtZbw', to_date('10-11-2007', 'dd-mm-yyyy'), 62, 'KhX9GCjEY8YLme2891Ja', 'GuASbGP3QMnZiLY72T6D');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('CqAKSheHuRWCmVpe9nBm', 'I7bjOYqOhHztdPWO1PxI', 'O6qZa0Lx9Mb8Z8OPXEAA', to_date('07-06-2011', 'dd-mm-yyyy'), 202, 'PYl7eaib4K0dngKw6Oi0', 'W0TcQjOG9v5RRq3vVb9N');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('ekLfvZdQnvKLChCUw7AF', 'moaINIcNKQoxM5KLTD6n', 'aT9QjIpykJjJSBFHDdwQ', to_date('01-08-2017', 'dd-mm-yyyy'), 35, 'EEZifpPrFlrWUfLoYLN7', '3PKN9A7e8SnPk6ooAiqk');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('DWhR9dBFvPiPvZujJUvs', 'Xs7G18y73W38dMI22EZL', 'hzzhEdXODq6KvOenmeeO', to_date('01-03-2015', 'dd-mm-yyyy'), 116, 'HLVhO85yZ24B9wmHhZmc', 'Q1uRKtKHvt2DXGlthVQn');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('x7ITQsTCbRPfZ7m93Dqa', 'RZa3Sp0bp2UVSzPGcNHN', 'UjhwFbthXwZ24wsiVLcN', to_date('10-01-2023', 'dd-mm-yyyy'), 459, '6HlRtgJmoNbqBmpmwmkm', 'AtGmLZFITbw4ZvVpuquC');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('kgIj278yESQP0NyZdpmd', 'nPKgAZXTkuqY0ssZeUaa', 'FXZHDnRShJ7JUnSGap0g', to_date('19-05-2022', 'dd-mm-yyyy'), 328, 'qXqqO8eBYfoMySaVkQR4', 'kV3wxV0wjuwOx4jnYdQE');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('rvra07NL5BPEu6gXQLJ5', '63BoolksVkRBlZcYBeH6', 'RhctRIXL8n64oYcpCylR', to_date('10-03-2005', 'dd-mm-yyyy'), 447, 'VuDXgrrGQ1gprcfa6MkW', '6UcgpSngEiqUGXrxHeoH');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('aAI188pDd026wNq721hIq472dHD329fVD911hQg425rQo824iK', 'rQz735kDk769tBr415wSX532rWJ624aEl017eZi680tVe062jQ', 'lOZ413sCa648jVE668wQF169xOy784qEC342aAF193jFn450fD', to_date('28-11-1969 21:57:53', 'dd-mm-yyyy hh24:mi:ss'), 11, 'vXw196zSr432aHU717sLU595cWy669yLK951iBu929dLe923tM', 'ghPXY3iqhvGcLgGO5W1q');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('uKM162zOD623vQo348kDn897pKn059pQb633nIk489tGy198zL', 'hTo765zJn651uDX372kZZ487jYz937cMt740kEx178aZg338hB', 'vCZ296gWm772tTe039nGe235fZv956fPL756vAa743dNU574vI', to_date('28-06-2211 01:03:38', 'dd-mm-yyyy hh24:mi:ss'), 3, 'oBz592bMy829qHK669zUx543iQt335gXw799pES857rCj990dC', '9uL80wbwkdhdtT4kPeVb');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('fZQ620iIp270zSP073pUH248nKx122bZC842gSg090wUk210zJ', 'lPI644wTC623oFX140kDw844mMH047bPs364mLc839qMh789mR', 'fQv636bLc344zAt036rFM434yLl980aTV051hRK012oJE655rZ', to_date('14-02-2553 04:08:58', 'dd-mm-yyyy hh24:mi:ss'), 12, 'iKH027qMb779hFh457kME133lFh919sZB459nEm799gNY640sU', 'wUn9d5lN9gM8yl62t98D');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('uWU186rQo938bUI631sIG226gTV674hJj370jFS091kPA048oB', 'sQc142mRc960mHc294bGF237vJI359iGX477lPN534nYz265uI', 'jPQ464oSW394yYk184kYi472zEJ421kQc384xYl740oFP743rW', to_date('17-03-2884 00:30:48', 'dd-mm-yyyy hh24:mi:ss'), 15, 'dHU339bEL810bSb887kUC624jYT417hZk655tLj534gId015gU', 'TvcKZG1g4F58koXnWiij');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('fSa710aNb865hMK860wBP731wPG422qAK856nMy960xLU766aQ', 'nSQ558wQD359dQj754tUO847tIT662tJF661mBj337kVH344uQ', 'hIe460qYs519wMz483tJs110aTa164uTX859fFs799aQx774aS', to_date('14-07-2462 20:51:38', 'dd-mm-yyyy hh24:mi:ss'), 10, 'rJR969nZH179hZS033uVi650hGS287jQz130nAH837sGP211pN', 'gNF327yNr398zAe141xXr151oPy375nTg531hVX758gCd881iZ');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('uNE188xGQ131dIX545wUq842yYz229fKG098oYG423lCq582qB', 'uMv883kJX083yNl028gFa583sBM224gRU134jVf675mLY356hJ', 'tOx543aBf212sWx270hRH189oBX831kEj689vOL155hFl658zW', to_date('29-10-2558 12:50:06', 'dd-mm-yyyy hh24:mi:ss'), 20, 'pWm468iPy972dLY643lLN915oUH957dMv096vCP846yRT735vP', 'UGnsttShlqLOAX5RMdfo');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('dMk633yIM757qZu746wDB014dMH383yYa010tXJ931jZO652dX', 'bFp536kIu622gKi082qEV440nCI923jVT425dVf180dFQ150yZ', 'oIr456vEL772nJo642sMh557jQi677kAq246qLX573dIh748dV', to_date('21-01-1901 04:43:40', 'dd-mm-yyyy hh24:mi:ss'), 13, 'lXl687iBO695eWB965jDx611eAO819tYp162hWj595eXe831sN', 'Rzt3bGcSxJO2arUWnxxZ');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('mJT485iEi683xAK661yZu673wVM036cSf274dHI480nUI996lZ', 'dDc510bUI929sXC913bHc529jEK943cDs226jBf738yPU364iJ', 'cLp232sBY746lNu874xSO677aHd519pBh789sZO241pDK469nS', to_date('09-10-2150 03:11:48', 'dd-mm-yyyy hh24:mi:ss'), 7, 'lRf675qFU499yOD675jRJ226gJO655aDF526hMF470jJs373oP', 'ozjzovceamkj9h0Sheld');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('qPW015oNn088kMH535mHN689cZG795jVl618qRv696jLn749oF', 'cHP287sYE668kLT987yNq241aKE113oZi666kLs788cMi782jW', 'fIK444aFC240bQM367rWN416sIt678kXb331kKF979gEC462yE', to_date('13-10-1985 13:23:13', 'dd-mm-yyyy hh24:mi:ss'), 4, 'hRf938wBm883jCG465pTq070kNe324uXt333sDo292pIJ218iX', 'tQj610yDq458xZF538mTX412cTN744gHb420qAf348hQe643sW');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('uWx373dZO674wOz122fRv236yJi290xVn597tKr441cHO049mM', 'qJA727vMG496dUq633dLA795fPR094oZm526oLB067qQG363gV', 'jCM938xGX323lHX727kPs141bUd469zLD946nFK664iIa136mQ', to_date('31-03-1980 12:52:50', 'dd-mm-yyyy hh24:mi:ss'), 11, 'iZP635nQb110aAf264uPs075fPP624fXY020lKy831nEa759lW', 'B1knVMXshql0bl81OlLM');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('nKH150dUG387mVi320fQx675wTK841xWT069eRE595hYR472jW', 'cDf987xRy672lSY565kTY484uWN865zYV193vYG891lPo499fU', 'fVb261eDC384rCt675wZK712lTw777iXL349wDI348vUj681oR', to_date('07-08-1988 23:20:58', 'dd-mm-yyyy hh24:mi:ss'), 8, 'nND549cVY380oOE971fGx430qAo217eSH394gAu536sWs322eO', 'rBE543qGR695cKa139sEu854lSZ473lMj492tGW413pIx019tX');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('lNx350oAC957jNf769eNm874eDt081bFZ444hJm066mEN496uN', 'mHS090aRo123aXX548oFu221kCl020zWy473vHt066pXD838tD', 'lUC253hSb999mQT326rYN614kCf594sWc122uUz823yIg618bH', to_date('27-10-2130 17:38:24', 'dd-mm-yyyy hh24:mi:ss'), 12, 'bGf369aJV138sUA981cST780yYZ663eZh032tIy016oLU563wR', 'rVM887oGj122xUc872jKC125yWc596xEj459rXG668cEx313iY');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('yKt846iTj029tCQ539oIC481kZj381iOX127dAL917hAI993tV', 'iRF041qZl949uBV862eJf591kLE615mYm341cUt381gIu570dL', 'oEz231oJX661xCK798fYi684vBG455uYZ044oMv759rMz745tJ', to_date('29-09-2175 05:03:15', 'dd-mm-yyyy hh24:mi:ss'), 20, 'nHq664gJp182aWb732rAd926qKT879iMO983sYs186rIa335xP', 'yZd379aJg431pEO130nQV126oJW424oKj922uXy810nFt022yM');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('fAG114qAC120gFb353tYx266gSk756iBO747aIq018oTb045rR', 'yJS776tLV862dEh449qSl090hGm925tFF220pIz086ePe460eQ', 'xEV874jGG222dAK886oRj015kEf017eZY261iPO826uWs894jK', to_date('21-04-2910 02:53:05', 'dd-mm-yyyy hh24:mi:ss'), 3, 'eQs256eWU521oBG746wVV357wQU844fWo775aBc116pWR688bA', 'pCs368fRL684dGm519dLU016wRx459vNI760rEr299gUV238yM');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('jAw799kZr460aLu937rQJ053vIt627vNa390kJY173rPh048zG', 'mXX768rRB975iOI293mAK055pKp723sJw033rFh997mGx569gX', 'uWF359bZc976iUw224zJK027eCe383iCU261pSj030hIp646wC', to_date('08-07-2679 02:57:24', 'dd-mm-yyyy hh24:mi:ss'), 13, 'dJv426dJL995wZh527pEY596pAX046eNz392dMo844qAA562qP', 'yvC0RFv1ZCgDMJcIzQKf');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('pGJ416sNx484oEm855oRR556yNg823bOf231gRf935sXA097oK', 'jAA269hYu346cFF493sBC345kQn483uYx517vFM140bAM870aI', 'oLV336kVI888gGS477aNB566vEB524xNb723oDh392tDU117uL', to_date('03-11-2327 02:01:14', 'dd-mm-yyyy hh24:mi:ss'), 20, 'qAq045uLd788tDm853aCB131dXQ950aSv534cTm818uMd445cI', 'iBdwkwjt6NXHkDCArTSi');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('cAT515dIl964nVU831bKf119dTl198tWz730sIA791mBp310sB', 'uJl762eUh221hBS127zJq554xNz724nPm555yGl722iDF951yO', 'wFH850sUL925cMD388jKP593pTl039jSh483uKy016bTc275bB', to_date('12-12-3066 02:10:45', 'dd-mm-yyyy hh24:mi:ss'), 16, 'yXJ525nFk472pHj842fCo645eZr964rUj695qJq490xQE928jD', 'tt9hJgoIIHBazDIPaqcA');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('oZL357xAM695jCX369xEn323uRr224pFl043dCt971vGQ059aD', 'nGP899yLb545xEu522cYw347zXe587kIl576zEN260lHZ038xL', 'qII637mZv435iLl029mVy350cOV612yYl520pRP860cJA124zN', to_date('01-06-2132 12:53:51', 'dd-mm-yyyy hh24:mi:ss'), 17, 'dXA184nNN845mJf127yTN849yOc891pNh360cFy174dAo857lC', 'JDRrKuieBUkBSHR5Q15U');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('zLh238zQG841lNH148fFf129mVp034jGh735uMV791bDC226nX', 'uPz566eBT375tGd620qUR778cVB682iCi279dSU220oAQ869hA', 'lQP517uKd623xVh733zVl112hZa896ePQ566lYl266xTM859kY', to_date('14-09-3063 13:11:51', 'dd-mm-yyyy hh24:mi:ss'), 2, 'cIg155qGY031mKt834bFL838sLp532yYK757nWe687cPo497zU', 'ksnGSIRhTxv1oxLDz7z7');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('fYh095hHT691lRy544pVz368qKS659iLM862eXe033yFZ688mT', 'pHs536pOa753iWD116hNn428wOK599mCy410sFc029tIf085eB', 'pMu549fTq337dQr577sIL092uMu422sTw048kXT289lOB354pK', to_date('30-03-2774 10:40:48', 'dd-mm-yyyy hh24:mi:ss'), 12, 'jBw439gTT340jZZ990nDo873pPD367nDm942kBN277oNV781tV', 'lxCN8JR9L3kFVadvK13H');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('hMY233wPL494kUJ383dQK825gTn376kTD651uGq016fLo822wZ', 'qXR850fOF483zUa968wOh774oPC943qMI345aXn018kWn214nK', 'yKr431sRy585lYW987yIJ814sCF799lGY487nVw012zZf174vY', to_date('19-03-2899 14:53:39', 'dd-mm-yyyy hh24:mi:ss'), 5, 'uUe794zXf968mDJ545yUw592yGo735mKz114wXl672dEz023yD', 'qOA633hLq820hKv968cUv530uMo540pIe131dQL299hYy597jO');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('hTk431wXl937dHo259qPP766bJK243bJb895vAO066rOj612jW', 'xPU361xHq997bNg030iVF355kAT375pFf293nBb987aYK659tY', 'zOl394wOX097rTY423eFO580aJI148zFP823cNo093yFc436eA', to_date('02-09-2731 02:18:31', 'dd-mm-yyyy hh24:mi:ss'), 8, 'sRw450jLI866sCI151vOQ299yKl810pFL958cPC853pZb328oE', '3HDr949pZQb6ltnD36tt');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('jWt188iLk235mAq948iOp680xIK929kBU352nXV280oGB738jN', 'xGk165iNQ144qRw621vWR643cPH738qSp869tBF544tLB290nW', 'vKr853dXK156cTo154xMs029xKn741bTX019hWL871bLt758aO', to_date('21-01-2034 08:12:28', 'dd-mm-yyyy hh24:mi:ss'), 5, 'qWE643gBC595iLI173dBY869bKd041dRv568xZG627yBb014yP', 'z3lmdGvaamY3vjPUH5bg');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('wAn158jSK732cLc311eOF128cZi285zQW093jGx493hLA018lP', 'wLD280uRc060hGE027wJo424fQT157bXs091kHI717jUv867wF', 'fVs276gAy868kSI331vTL131gRg335lZp075hSC812sNR247bN', to_date('12-01-2356 00:02:52', 'dd-mm-yyyy hh24:mi:ss'), 20, 'fEh741rKZ876fJv624kLy353sMe498hKL284gAD396oGe933sZ', 'SKIGq0fAQzTRJaymzoJK');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('wNj149mYX468vQY338iZW926sJw968pAl866cII457tQs471oP', 'jFp523kFZ448rHO745yLN131xDI894oNk031yCU626bAG645lO', 'mXf444uNl736oMR466tNp283uCA925nQB684sDY955oSg448zZ', to_date('19-06-2978 17:25:35', 'dd-mm-yyyy hh24:mi:ss'), 6, 'mMS684zFq968iLU716sLs734rQQ998kQK643yBT745cCr271kE', 'HxmvSqyySUxZTJGiKmCf');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('lXX079uTT852xXe447eHp936tGN939xIz185fLs291lPn829fL', 'iFI614iFE376fVi257vBo238mMN883lCV029iEx063qEH279pY', 'wNn481cYG715pJa152zVX040hTI643uNH526vNi322uIZ896tL', to_date('30-04-2360 09:44:47', 'dd-mm-yyyy hh24:mi:ss'), 7, 'wIr263cEi616gXq115aBb859pIm395fMb828xLf132pWg890tV', 'kGB259fBI285wOA332rZB460wRf132aEW597xDz217hDJ246eP');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('jQI876dDo232wRj126tGt864uTi623fMC783eBA169kQg352uZ', 'mQK599uKt432yQj339qEp754fIN561eAM472oIF621sBq963aU', 'kFg730pCe089hWC191iVE237fQd366eCB820dMf541zBZ182bH', to_date('06-07-2603 00:56:00', 'dd-mm-yyyy hh24:mi:ss'), 19, 'iHX791pPy435eFg291nXH824xTW274dEX919vSN356rEK279kB', '7pXMsMrQdfQyCsdOJ4Qw');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('uQO770qOZ569nBv325yKL335uOf762lXd488eWj930lOP799vT', 'mJN262aJq619zHz697cMg812rQV828aAd576vGM596oSi461bW', 'bCA962cAk516cQE614pXK585tMw131cQL442fGu979jBI541yF', to_date('24-08-2085 10:32:09', 'dd-mm-yyyy hh24:mi:ss'), 20, 'wKe239cSr888aKZ983tAl410fEz357pHD755oNN149xFX343sI', 'B1knVMXshql0bl81OlLM');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('zMt317xQF436sAr542uKY743bDC268sKb335qFB747pBM423bA', 'cCT818aDt711yCu527lZq195vCz647rZU962zHF013iOC583jO', 'hOt182aZM273nBW474aKh015dNx690xRD065sYM943bQB991xP', to_date('09-05-2102 04:56:03', 'dd-mm-yyyy hh24:mi:ss'), 18, 'fDq158nTu692xSu795aHQ618zSR381oLG524pXB098eZf036pM', 'tUW597iPG060vAL394mPA315nIP825tZj144vAS287iMy899mE');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('dAx977nLQ538kUF974uYq447iGo884dNx428xLG576mIY936aS', 'cFO733pMX438oAH870sNs548aJR074hUb015cTv435xId051iT', 'hPm021wEI194rSX540wQo424gTX042oPk173kYy147uCu299bT', to_date('13-08-1931 01:07:58', 'dd-mm-yyyy hh24:mi:ss'), 7, 'sAr872lIG478sHZ284gEn290dQD563bPg237xLE212rYD155bI', '0KCquUr0vk66Rucr5rbA');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('fIF855eIo354nLh735zAo222tJK113qMY313gQg632iYu776jY', 'mAa597bKu338eBi117nLP454gKD336lJi566qEU798eXk522qE', 'sRS342kFz499yTQ832lBw726iLS949gNY483tKO076nKz129gC', to_date('18-04-2856 16:14:26', 'dd-mm-yyyy hh24:mi:ss'), 3, 'yIx331jQM051oId664fGp850yPs042jEo516gLJ142iJt886cV', 'jXHSJUwVBAHb2TnBMR4M');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('wQc497jNu873bTv748rZU139zCs641aNx313wEx725jHt919eM', 'qYs046sIK820qMk968fQA571cEa368iSA253sWq189mHU914aQ', 'sVa733zVn640zHQ321iBD495jWd365rCX064oFu713hQC639jP', to_date('25-04-2317 12:26:55', 'dd-mm-yyyy hh24:mi:ss'), 3, 'iTS860sHi887rUV556aOx044yAJ229aVs781lOq635wWX296qH', 'hSs544gAO780tLT910lBF056uWJ448rPw474vJy337vJh783mN');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('wYs338cQv047oCE933xAG064cVo397yGm187cWA455mDe839yO', 'oUZ829oMO272dKB366mGa263oMq342jIe864xGN543gJz498oE', 'iWB446dUt278hJt692aAH166sAD056oKc182iBd660uPx216dM', to_date('10-02-2985 16:04:39', 'dd-mm-yyyy hh24:mi:ss'), 8, 'qMK883qHJ173tOv843wRG332iAp460qKE220uQK254zRF222mB', 'XopsLOir619dpBGxmJ5D');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('iSs289uMY246kZd895rHy627nKF410vLD882gUM836oNs847aS', 'rXZ289oOI018tKj390rEs770qMh061gFe521sGk211jVE839uF', 'iZJ358dBT263pXB699kWQ937fSk855wWJ067hXH422nWM091kC', to_date('10-02-2716 03:35:51', 'dd-mm-yyyy hh24:mi:ss'), 7, 'fKC229xPn188eJS424gWi869sXT837uBg624pVn219hQO527eM', 'PwldAw8e3HhLs13FYwCI');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('xYN821qQH987zOe370zUB188jRY392pAA943lKv842kRc728aW', 'bLW110uST131sMO758aFI334bZP343zGV052uGk544hRK149oF', 'dTr038bPz473xBO192sVH359bTM265eRn913cAn629eWY147sI', to_date('02-06-2582 16:42:05', 'dd-mm-yyyy hh24:mi:ss'), 16, 'oVS121wTx615nMt917fWl826oAM876iCQ577bAZ595yIK327rU', 'iOW542wJm877zIZ763kJp499gSn839iLS582dYc257dEh329qL');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('qXN113tGj057jBE269kAF546lOt629pCu088pHV240vZi155xB', 'yBi071zNg898nUd238rIn815nHe061fKG686oNv888yTx163zG', 'uTC524qYc575pPG670jHD367qNH134jDN441nBL254wXF154qC', to_date('12-07-2007 09:47:13', 'dd-mm-yyyy hh24:mi:ss'), 12, 'tJs559rPG944ePA775uKa921sTf476yKv045wLy254nVZ372bM', '70okJpRvnXjo1wvZbLy5');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('iBO224cOI044kIa176fZz034jXV956aPt297pSt174wRF057cP', 'xDk667pEM126uIf867oGX757hUm874pEe065qWp765vZt663oM', 'lYk159dIu663wRE452eUF987cNJ912aMI531nOf214gOA992zA', to_date('02-06-2845 00:13:49', 'dd-mm-yyyy hh24:mi:ss'), 10, 'yDY199hCO822yEW266nUl446pVj985bZm773oJJ031pRY195wP', 'UVVmOp2bdEW35j9lJHRW');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('eFU931oPN831xNl654cFk714rNy224tDH229wJB936tZh465mG', 'mCW056nHs881hQd377tHq387iVm443nBx157uHZ739vRT997dZ', 'eAE465hHQ320pMG328zXV222bDT572pPu974cWI428tMf086cW', to_date('06-08-2442 04:56:12', 'dd-mm-yyyy hh24:mi:ss'), 14, 'xDS158iVW056eKU765pAE855tCR556sGx418nPA882sJv134mZ', 'uLC568kDZ554eCB698mCN656gWU934qCT744tSA921kXm724mF');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('qSi124vMr498pJh053cIB221fTi337vJx018cRa663eJR670yM', 'zWY895bUJ311yQL933uCB095dYI498uGs619lUU396vVX059dJ', 'eYS490fKc347zCE020lFh763pJv911dZf446eBv870aLU854pQ', to_date('01-09-2021 15:27:56', 'dd-mm-yyyy hh24:mi:ss'), 8, 'wTn146pVD229gHx179kGA947cVW919cIw118fKo280yIL919uL', 'r1pTidWF7ujWgd2GGr8I');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('yKq980mJB949iHH126aNw797tSG327wPg737iKF692rEP783gV', 'vDJ813rCZ979lRY867tSt417iDX146sYc419nVt764iLI391nQ', 'zOc934tIn227jZs741eYl914iDj265fLG372rVa037sSH064xF', to_date('16-01-2538 04:52:27', 'dd-mm-yyyy hh24:mi:ss'), 3, 'lKU956fDT995xQj862eQh951kXL156oEj214gXH654lLn085wZ', 'yUV587tKs975lMr085qXy145aNm657oTY785sFM747wBq284hR');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('xQp018vLG670wGs099iEm230sON717fDy869eTK560bEF226iI', 'hYP735oVB039uOQ666gLH521zRW893xCo619sPA267eBv583sQ', 'aHU430vMS589tOM985eHD948cYz588zLG684bDl740jQv538lI', to_date('02-09-2938 18:52:24', 'dd-mm-yyyy hh24:mi:ss'), 4, 'rYy735sMd060yWN326mDW191sML788iLc562eAl767uAj364zE', 'j9cWdEMHA2YANrq7Ts4n');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('xDO718zYA897iWX825nVl282wVo345cEP861tAW772xAN392uI', 'eRL947iDD784jOG458kPt287lBr918kBw224wZt277wQG338tY', 'wBC539jZg342tWo178nQK254oEE548qZt858kUC946fKL636wX', to_date('19-10-2474 18:28:04', 'dd-mm-yyyy hh24:mi:ss'), 21, 'jDG667lPM736qAl648tKz487eGw463tKV439aSd636gDt599dE', 'mrzK3eAs1XqUX96oTR7m');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('kYO320vXI683uIr685aIb880xQP552sAV076bUM942zLF942iK', 'aSc427uUw548yWc246yEm590zRe457eNi174nPc643cTX767vI', 'kCV712wOQ019hAu026wHc429lOA234gEt293dIX070fST226yZ', to_date('17-07-2363 06:42:37', 'dd-mm-yyyy hh24:mi:ss'), 15, 'dPW521nOf247uTp866qNE870dMQ716aIE344kHM292vSb185hV', 'OfCZKwhcMeubnCRdPgJy');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('eQT249qMW184iQZ880eHC479pJe766nTS896kCy510iHp118dG', 'kQR811iFR646jQA262wGQ972yZd793tGA793lDS511fCY980sV', 'wKG981eKQ629dGU629qAX871zDR847hNH135aDI754qUP796zG', to_date('22-07-2449 09:12:23', 'dd-mm-yyyy hh24:mi:ss'), 8, 'hBs980sKk471uBn932bUT666nOr212iRH617qHO886jKY972vC', '8eoUoervnsxf4AY6cGcR');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('pWZ779lCw425xEm380eAc033sUg581jMp872sYt452zIj479yC', 'qTW225oRh896mBQ466rLi915kNH289aSv485wCp242jED215mU', 'vQX118uUw870aHQ437qOI743cXg871jZa251dFf556uAh498kT', to_date('10-01-2730 00:17:34', 'dd-mm-yyyy hh24:mi:ss'), 3, 'vLc837tSu746nGq857aNt969hBj430xIh688tNo676vBk450cC', '448anVd5h1XF4ctrNTJs');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('eQD647qNP344fPN181sGb315zLq620fOy179dQy577oSS126tQ', 'aRd586bQr078dIL542zLD341cEI028fUl821dCe449lNR132kT', 'yKQ614nLU023iAr458lPr591rPx142sCg532vZE522uJL633nR', to_date('25-01-1976 08:53:48', 'dd-mm-yyyy hh24:mi:ss'), 5, 'kIA124vKN135iYx582eFq917wLI596eYv549uLf565mLn264aK', 'gEe997tQj255xUu792tIz468uQd534fYQ169tYA231qNj678mN');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('fMM794qSF480eHA864iTn746sOV077tZL088sGB716ePw578rI', 'pPv918sWv289ePE573wUV494yJu671cTD910sCC986hMQ484cD', 'tWx267mLf856uVX467iZx666tHM237bUU174xPM721xJy623tG', to_date('13-03-2656 04:58:48', 'dd-mm-yyyy hh24:mi:ss'), 17, 'oJO894dUw464pRO262zKE279tLh278hXY528pRT153sXs591yV', 'mQI092lHJ513oHK477wYp139nHG374qTV213yYm964yUc129pL');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('eBL166uOY745oLB049kNn741eEJ579gMO799qKE295mZO612iT', 'qGf034rLB229mNv767lYL483hKM543eOJ098mFD160tFS513bG', 'fWf589sQH860xAb721fBM781vBp042sGv992lVh337sJK537xQ', to_date('10-03-2654 13:54:20', 'dd-mm-yyyy hh24:mi:ss'), 10, 'lGZ163gEp813mNy732gLc779fUN070sYY943iFB865dYM585xV', '0dzyAnYjiZBHdwMf8zQP');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('vVF387jUL629yYA597xOx044pZM469cGh177zXr787cQG756mX', 'zKc911zQI862eTi835sVj018aZx123nGu020xHI748wOn350kD', 'jJw441lYy773yEG861iDF226aRx283aCe996sLv256ePQ522eJ', to_date('09-05-2318 03:13:49', 'dd-mm-yyyy hh24:mi:ss'), 15, 'pMK569uMp117kSK936qHK857cMo886kQA273eTQ269gWm172rK', 'aEz787bWB792fJs739oDK627zUD232zWJ845tJQ475oOM111eO');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('yFA937nTJ211iPV389eYi223xJE529jUy591mRQ321gUe270aS', 'fWX698sOt745jZP590dZK866hCB640qVW456kTS552oPC187oB', 'bKY458oIr783rAB036eCG477zQz749sDP991qPw575uIj829hO', to_date('10-10-2304 20:53:05', 'dd-mm-yyyy hh24:mi:ss'), 14, 'jDQ542oUI967lHZ380hSG411sRN185uHN564qLA015nJx565gQ', 'KvU4KecbJukpZwE13Giw');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('nCz475gSq015eIc298zPR554aSM451mKV798iAe852cQT725dK', 'wHa625hEU549aOj496eLS275sGF896tXi014fXH989hKe647eQ', 'kVG672cQe825iRo438gKl983bFv297lDE920ySS866bEA891oI', to_date('17-10-2182 12:38:35', 'dd-mm-yyyy hh24:mi:ss'), 10, 'tPz269bPG149pRd826fFH789hFn493bZr250gNs344iXJ080cR', 'soIrFQoX81DKge5WbhA4');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('eFR837nPK696oFq236sZA856uPk583kKA343sCY698fXM123mJ', 'gFz311wXl055jVF519sVF081yRl447eZy373tBn860wXq452gT', 'wQX750eYe557vPO232mKj066mCG011dSd323qVl847iIp599iN', to_date('22-06-2007 21:20:52', 'dd-mm-yyyy hh24:mi:ss'), 15, 'tSd234pWS151hAa699pTV276lQg171gJD721pZj463yVF061pH', 'XopsLOir619dpBGxmJ5D');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('dPr798yYe661wVH544pFo111zPZ089lVZ713uHW653gHS127hT', 'lXP325vHb486hYX371mTU072iIj758rEG210cFr359bPQ723eA', 'hSG474eGL816kRU734fVp328yVT089cHN380uGZ392wXM150rF', to_date('29-09-2913 06:07:12', 'dd-mm-yyyy hh24:mi:ss'), 14, 'tYJ648tRN623vFM648oWF233kGi938qXw214cMj063iFs125qZ', 'd8Dt9pqcy1rdI730DOzP');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('aRr249vLO664mIt010jUG490aHd967eJM323tFo074uTA341lE', 'cSH194xOn416wXk661tGY874zQS749qHd540bDE136nBR317hM', 'bPW643cDK956hDj148zTQ757iHH285tXq235sHf315fZr151gJ', to_date('26-02-2844 19:16:01', 'dd-mm-yyyy hh24:mi:ss'), 19, 'dIt778iCk021lNf711dOa721xPU472zAE996aVR534zAO756fK', '3LyIIj1UL2uQqoC7ZKrs');
insert into BLOOD_DONATION1 (donationid, donorid, bloodtype, donationdate, volumedonated, testresultid, testid)
values ('wSj414nUc736fOX462aIH786sQs719rOe951tIX241yQE550yL', 'iAH352lOh250dVn510oTT478dQA915vDQ348bNu841jTV593uL', 'qNe137eNw378wCx969kDx419cGf057dDN247iWs839qWA179tJ', to_date('29-05-2370 11:33:04', 'dd-mm-yyyy hh24:mi:ss'), 15, 'qSz996lVC286sJk923iNQ878fMt327fWl717gBF584mAN333nT', 'W0TcQjOG9v5RRq3vVb9N');
commit;
prompt 300 records loaded
prompt Loading DEVICE1...
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('QKrcVPnPqqV670vhKDBW', 83, 193, 0, '9E6uEKfOslNXIZIR2VZm', to_date('17-06-2017', 'dd-mm-yyyy'), to_date('05-12-2012', 'dd-mm-yyyy'), 'd7GvEsWyIpnT6ns3vXBo');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('YvSGkO6l6fRwXlaf5But', 31, 760, 9, 'PvsL2vp1kgjRPSYTZaTE', to_date('16-09-2003', 'dd-mm-yyyy'), to_date('13-04-2010', 'dd-mm-yyyy'), 'evqI5CvnJlWT5sjpFOr8');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('eR4LgsUjk1PKOmGQkmDp', 46, 436, 2, 'WiFxVJLbwrIcYzZdpL5G', to_date('04-04-2010', 'dd-mm-yyyy'), to_date('25-09-2010', 'dd-mm-yyyy'), 'mFjXIEDHUPMHzDIvApsT');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('3h5ggjXUeEB2Gr8WzzWa', 73, 748, 9, 'sApvxdDVio2a9G4AMJ3C', to_date('12-03-2020', 'dd-mm-yyyy'), to_date('20-04-2000', 'dd-mm-yyyy'), 'r964gYNL8H8739jrYgrf');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('pfZcR25AfI1jWa27fgt8', 98, 717, 0, 'SU0VQmy59Rx11gmyE9UT', to_date('28-04-2015', 'dd-mm-yyyy'), to_date('17-09-2012', 'dd-mm-yyyy'), '44ljMsMUowLILqKcQ3aF');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ML7DZaWYZRptrU9KMuRr', 28, 78, 5, 'kQoES3yVarvsNokKitoZ', to_date('21-07-2022', 'dd-mm-yyyy'), to_date('14-02-2022', 'dd-mm-yyyy'), 'ZDDoIKOcPIJm38Jj3TNS');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('GmrbtE8X9tGMY5T3LJ16', 97, 566, 0, '4yz28rFKoMl3yOo5LJkO', to_date('02-01-2017', 'dd-mm-yyyy'), to_date('07-06-2021', 'dd-mm-yyyy'), 'T2L8toQvB0V7uBCIBz4k');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('h6T3Ky1ZXFSMoRV4ErLW', 72, 454, 9, 'M6EtEDxlYBTeEBNJbNGl', to_date('15-12-2003', 'dd-mm-yyyy'), to_date('16-06-2009', 'dd-mm-yyyy'), 'nKJKSoHJ1Fl5l79woA8b');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('TUTHH7HWdHDK8RMFIvnR', 81, 945, 5, 'jqW204LWuG9yZOKJCldS', to_date('20-10-2014', 'dd-mm-yyyy'), to_date('17-06-2013', 'dd-mm-yyyy'), 'wzIwNQgCbvLVx5AshXz1');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('IkfvOMYkD0lt9h3uO36N', 92, 982, 1, 'joz0vlMgtQWi1bPOF0Pe', to_date('24-08-2005', 'dd-mm-yyyy'), to_date('22-09-2000', 'dd-mm-yyyy'), 'Jr4ACbfnLDAmIea6aEx2');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('NfXDBGYxuusnarzk2r5D', 56, 975, 7, 'wunWFlkllBfHR7K0QZMg', to_date('15-10-2013', 'dd-mm-yyyy'), to_date('15-03-2001', 'dd-mm-yyyy'), '6XU6fYgyvPINP27U6XJQ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('GHpWodjzloSJFyxUD3iy', 90, 132, 2, 'D5Ui763SK6sE6SvKAH4I', to_date('04-12-2002', 'dd-mm-yyyy'), to_date('06-11-2000', 'dd-mm-yyyy'), 'TY7m6wThJN67ZXx0MzqG');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('7nuqmAJj29MDPNk31Tsr', 16, 424, 5, 'ZzGwKulUg7dQ72rrrdka', to_date('13-10-2015', 'dd-mm-yyyy'), to_date('28-04-2020', 'dd-mm-yyyy'), 'KzH7jthfIIUmwz15LHu3');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('sZOAkhoJz5cCVwNxRHBj', 34, 674, 1, 'm9vT4SY971Dfdbxcv25n', to_date('13-02-2023', 'dd-mm-yyyy'), to_date('18-10-2021', 'dd-mm-yyyy'), 'lY97hTnrj6SVGwYpFyQo');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('WIKmAy5xQjw9OnFsbtLj', 28, 650, 5, '1pVpeMQHtZZ6lDbHKMTw', to_date('15-10-2021', 'dd-mm-yyyy'), to_date('23-09-2009', 'dd-mm-yyyy'), 'wwkClS7DFSYtZiJfFnKq');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('SkFVHHso1Bo9Ejc4PwrH', 12, 281, 2, 'Rn7dMqaarH1HAFPYGKH3', to_date('01-12-2007', 'dd-mm-yyyy'), to_date('25-08-2012', 'dd-mm-yyyy'), '4KKL9HjxAMByFuG8RZfc');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('FU8B0P61r8v6IfBeedlh', 18, 803, 7, 't5vmX9DFiKDyxH7w2p3o', to_date('10-09-2007', 'dd-mm-yyyy'), to_date('13-09-2002', 'dd-mm-yyyy'), '3DecLs212LLAqcZHW7wr');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('34tJteNGx3z4xUmYHXOY', 12, 467, 2, 'o8xJISUnsZYwLBOb8Cwn', to_date('04-12-2020', 'dd-mm-yyyy'), to_date('08-11-2002', 'dd-mm-yyyy'), 'oDE3CAFkLkcoJ6iWwg1k');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('CNvRDnnIQUtUWIfYrNvs', 66, 756, 5, 'BwK8HinX9yDHMySTtuUH', to_date('02-07-2018', 'dd-mm-yyyy'), to_date('18-01-2009', 'dd-mm-yyyy'), 't9DZxFvWnEkLY6HnzAeA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('wclEysjSGsQG46yMWT7I', 91, 746, 2, 'CNciPTsYIWXDow0EzVKV', to_date('27-09-2013', 'dd-mm-yyyy'), to_date('14-09-2011', 'dd-mm-yyyy'), 'tAnPpPdNRrrq2njcajFB');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('GGWEtwXfll2ofBhf8UzC', 60, 121, 2, 'd7eJmi5qOBzZy8meBPGa', to_date('04-06-2015', 'dd-mm-yyyy'), to_date('22-11-2009', 'dd-mm-yyyy'), 'VTjfZcKuMsizK5jX78t8');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('IB53Fh6I56fivpSlEQEy', 76, 615, 6, 'xGgfyPfo73490y6ZN4Uu', to_date('07-12-2001', 'dd-mm-yyyy'), to_date('06-03-2020', 'dd-mm-yyyy'), '15obvsLwaaS5XgpNy3sk');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('T6EmeIiREh8NuVfkJiPj', 76, 58, 6, 'uab7rEp5QTPv8kIk2yNY', to_date('13-10-2007', 'dd-mm-yyyy'), to_date('23-04-2002', 'dd-mm-yyyy'), '0zCtPT96nPMuztpBnaul');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('nsax8QUYy8jMhyke157s', 4, 369, 5, 'HpOKBkO6mUW89eFkqDRJ', to_date('11-02-2011', 'dd-mm-yyyy'), to_date('22-04-2015', 'dd-mm-yyyy'), 'sb48Y9mbTnSrAx7bokzl');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('f4SQ76EULKwxuwrSA0bw', 53, 703, 6, 'vG2K7HzMTMzP7ZVa6wP4', to_date('22-11-2010', 'dd-mm-yyyy'), to_date('20-04-2002', 'dd-mm-yyyy'), 'vaMIf6oc6eUnyaN7ovJ3');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('vZbvi2NoWbPccKlUuFYG', 4, 2, 2, 'UIxDm6QL7JY55OOY0U9X', to_date('24-03-2019', 'dd-mm-yyyy'), to_date('15-09-2017', 'dd-mm-yyyy'), 'DKHIXvN6EvnC4xAboKMQ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('tndFRXLRtc6hmRNKaJI1', 10, 507, 3, 'hdHuk5BA1yOxjOjEEMKy', to_date('20-06-2019', 'dd-mm-yyyy'), to_date('12-01-2008', 'dd-mm-yyyy'), '8tiifwxBMOE5C4ClXXHO');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('dwit3XcYjJ56odNfhK7S', 83, 522, 1, 'x0ChdmlQltAMafN7XhQK', to_date('17-12-2008', 'dd-mm-yyyy'), to_date('26-02-2005', 'dd-mm-yyyy'), '43MkUgoxjY77r2oHizER');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('K8EhYasfhJGvTT5apgDy', 29, 394, 7, 'PO5Ekv7KTbiAFpoF5cWN', to_date('05-12-2012', 'dd-mm-yyyy'), to_date('04-04-2010', 'dd-mm-yyyy'), 'ZffGFisk6EIFZYoDNqzr');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('evFPXlaS50TNtcl3wQA6', 81, 356, 0, 'gNLtYjAjraE1DbImaS0s', to_date('19-08-2007', 'dd-mm-yyyy'), to_date('11-09-2014', 'dd-mm-yyyy'), '0p2PyDLwGWGJYPfpa7SV');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('JFvZucXhijD21FOFsPuq', 89, 441, 9, 'ksccNBfv13IDvMNEqXmp', to_date('13-04-2011', 'dd-mm-yyyy'), to_date('19-09-2017', 'dd-mm-yyyy'), 'MbwzdEct4ixNAGwGKkIj');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('fsJH4UBf2z1grmt1BVXN', 29, 509, 8, 'FzradTt96QpD9VSbvEc3', to_date('27-10-2021', 'dd-mm-yyyy'), to_date('28-02-2011', 'dd-mm-yyyy'), 'egWnyb6SznlwZohVFDqf');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('A1wktLKikDSi2B1ETztk', 88, 588, 6, '4ppX4by0G6fHVrxaJafJ', to_date('22-06-2016', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'), 'ZotcGBvlWHkifCgJwimr');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Wzu0gEBsxu70wFtkHy6Y', 91, 716, 2, 'EUVsR5mB0fmzEiRN9csa', to_date('14-03-2000', 'dd-mm-yyyy'), to_date('20-09-2018', 'dd-mm-yyyy'), '8RyTeK7eNzC3cmL3b8VU');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('rWivMmgglA6nWopD9shr', 95, 645, 7, '7AWfL77G19q2bIZ8X8pR', to_date('28-09-2013', 'dd-mm-yyyy'), to_date('25-07-2016', 'dd-mm-yyyy'), 'LZOenMlVg7iroR28xvt0');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('wM873rotDfcCJCToR4lQ', 14, 628, 3, 'Pla6KMyZsV4O6HFEvGCq', to_date('05-06-2012', 'dd-mm-yyyy'), to_date('02-08-2010', 'dd-mm-yyyy'), '5AxBg1i9HV1v9uBYbUhn');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('LtpzptmrhRADTmJbDtik', 61, 662, 5, 'xiheTMLjn9GGYFCL2dvs', to_date('21-12-2001', 'dd-mm-yyyy'), to_date('22-11-2004', 'dd-mm-yyyy'), 'FKXgmKdIlxonhhraOriH');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('yTov8KvDBHgbKNd04Szn', 63, 274, 8, 'UzpTqjerpDRjhv8IfOpJ', to_date('16-12-2011', 'dd-mm-yyyy'), to_date('05-09-2018', 'dd-mm-yyyy'), 'Z11WDj3R2TRLB5L86fLd');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('O8iC47zJvCzkvYVPn4Ba', 3, 195, 2, 'nR3rj6v888UMjD2EJs6F', to_date('08-11-2010', 'dd-mm-yyyy'), to_date('23-03-2011', 'dd-mm-yyyy'), 'UfgO8u9r6UnkBdKp59Mg');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('QhEgXWMwuL6MfPltRVSo', 12, 344, 8, 'Y0m5tBmHcWqvSL3J7uWB', to_date('20-12-2016', 'dd-mm-yyyy'), to_date('17-06-2019', 'dd-mm-yyyy'), 'LLcYzjjMHpEoRQqQtkjR');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Ah7h6eT8PniE6taIUxic', 68, 5, 6, 'XxSvARYXPFxD3qxv8Id6', to_date('12-01-2005', 'dd-mm-yyyy'), to_date('17-01-2005', 'dd-mm-yyyy'), 'Ody1U2bEs38ukqTkHOCI');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('1qMAFhbgbPMb7p8KJ4ui', 77, 178, 6, '2h5zEhoCqpxjFV2sVWcs', to_date('08-07-2015', 'dd-mm-yyyy'), to_date('07-02-2015', 'dd-mm-yyyy'), 'QzwS1ssM7RousVhrRNOy');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('NRhEfmfAJC8qIU4PrOM8', 57, 611, 6, 'zfVPcRXVaB06u70P1ILj', to_date('02-04-2002', 'dd-mm-yyyy'), to_date('26-05-2009', 'dd-mm-yyyy'), 'fg0rtEeTxLaWZ3V5mpmT');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('gritD2XQAJgTZPt6cgRn', 49, 975, 0, 'iVe9yJsXh2PgSMQOkN4N', to_date('14-09-2004', 'dd-mm-yyyy'), to_date('17-02-2006', 'dd-mm-yyyy'), '1DJ6zuz1uhqYVShxWcVI');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('YfD6T6vZQjAIHWSl6LqO', 0, 359, 9, 'JrkrxlTLN0tjBYSgMxBG', to_date('24-01-2007', 'dd-mm-yyyy'), to_date('25-01-2023', 'dd-mm-yyyy'), 'Ec4Q4zKOCziIyNLaAhAN');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mJ7tBxDTNALHfCcLcKEO', 4, 247, 8, 'n6osTcQi7h5cQGm8qN4Z', to_date('07-05-2008', 'dd-mm-yyyy'), to_date('17-12-2020', 'dd-mm-yyyy'), '0yQjDpa7xUBKgZ2bz4aV');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ApSsiPb6MRMB20TwhiUY', 76, 537, 8, 'xiDwdh5hx1BklWHWrwXZ', to_date('28-12-2022', 'dd-mm-yyyy'), to_date('26-03-2000', 'dd-mm-yyyy'), 'uUgv8BchgkBaeSDhmhja');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('QGCCmgwYvyKcH62VB80F', 26, 424, 5, 'FbNtXHLgl0SGIuushYQj', to_date('13-09-2015', 'dd-mm-yyyy'), to_date('22-08-2001', 'dd-mm-yyyy'), 'BHz9XQTDm6m2qp45cGIt');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('frZvvc9je2dHzdS1FliB', 8, 567, 1, 'zwdkZWNgkplER0MwkW6A', to_date('06-09-2012', 'dd-mm-yyyy'), to_date('09-08-2006', 'dd-mm-yyyy'), 'RCzXBLGNLCoMqyDv9Vnc');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('OUJNnfPZTydnFL7gNwbb', 88, 670, 2, 'Ws38Xwrcx8808wacmut4', to_date('12-08-2006', 'dd-mm-yyyy'), to_date('07-09-2012', 'dd-mm-yyyy'), '2uWfgpLkqypjWw7zB1nk');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('esbrjKGP60KvChfZ7EQi', 70, 839, 1, 'xNBySOjQ4kanbm496X24', to_date('27-06-2001', 'dd-mm-yyyy'), to_date('25-10-2005', 'dd-mm-yyyy'), 'bFXlewn2AjUU6Adw80vL');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('e3WjYoKU4gsZDY1PezAq', 49, 585, 2, 'bHHqYFAd73hk5P4zxv0A', to_date('11-08-2023', 'dd-mm-yyyy'), to_date('14-08-2006', 'dd-mm-yyyy'), 'eIGu0hrX1Q5V22lNLbjN');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('bScnUsHrPGaixc2j6QLI', 11, 446, 4, 'ShyPPpgx8U1nu2PRt9fL', to_date('21-01-2023', 'dd-mm-yyyy'), to_date('14-01-2021', 'dd-mm-yyyy'), 'Ea65LSU8I712soFExgAA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('MQilacDc7WdMj2dORHOW', 14, 621, 8, 'WJ1e3513vcB3gsRUSZB8', to_date('14-11-2009', 'dd-mm-yyyy'), to_date('18-09-2011', 'dd-mm-yyyy'), 'aKUZpOJsVCajyFVqMafw');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('GvSmbOOvmRDiMtxoFd4F', 32, 65, 5, 'i7X8xsmkgxR20yLCKJnA', to_date('09-06-2017', 'dd-mm-yyyy'), to_date('12-04-2020', 'dd-mm-yyyy'), 'z3qy2Ku2rbdGZLVQ1iMn');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('pckyYbXQdY3743MNxMAk', 61, 352, 3, 'oFiMVM5efWio3ASPluBu', to_date('21-06-2013', 'dd-mm-yyyy'), to_date('09-10-2008', 'dd-mm-yyyy'), 'HuiXGGUUrgOmrSw2kej8');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('EyBzhXbzEJ8ppzNzzPVO', 30, 284, 1, 'kkf9NPRfeV6DQgwRkQS6', to_date('15-03-2016', 'dd-mm-yyyy'), to_date('18-12-2001', 'dd-mm-yyyy'), '1iPVfbK7t3tBpvXxubbT');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('YvZex1gvQ8Zn5ivCoDmM', 97, 474, 2, 'O1cFpmlqHweEbqx0betd', to_date('02-05-2023', 'dd-mm-yyyy'), to_date('06-04-2003', 'dd-mm-yyyy'), 'IUSEwVeFhNuPMMgZfhbQ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('d880XjhYxnJxMSVQRoug', 0, 281, 6, 'hkDUWUYSj4JwxkwgmuqP', to_date('01-08-2013', 'dd-mm-yyyy'), to_date('02-07-2003', 'dd-mm-yyyy'), 'iVbQWVMRtRo6176NfDzD');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('urAWDugsy3Gq63GJwXoD', 0, 64, 7, 'OU6cQiUdz3q5vkUzAkbb', to_date('05-09-2018', 'dd-mm-yyyy'), to_date('04-05-2014', 'dd-mm-yyyy'), 'MK1aZokyVcHO8vcHH9Pd');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('eXemcHF0cHKJgM21Ifzb', 5, 487, 1, 'VMMdmwBUTGx4JaXVfWGv', to_date('13-06-2018', 'dd-mm-yyyy'), to_date('13-10-2022', 'dd-mm-yyyy'), 'GtAINll93Tm9MsDyrE9X');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('uK0AdgGAIFE3ih8GdYFO', 68, 120, 5, 'naVJlsKq4dULmDip6Tpn', to_date('27-07-2000', 'dd-mm-yyyy'), to_date('16-11-2001', 'dd-mm-yyyy'), 'QRGuf6NWxyzeU0PJTpTN');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('dYCqiwEngdq1XikHDdx4', 52, 252, 0, 'OsRnDyYASxxWcAJMmaFz', to_date('24-12-2006', 'dd-mm-yyyy'), to_date('17-07-2009', 'dd-mm-yyyy'), 'eBTP3cGY36SOydLBgIy1');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('OaJLMtviylz07HB9xIyU', 92, 190, 6, 'IPuvmVFCL3M5ReERydS7', to_date('25-01-2008', 'dd-mm-yyyy'), to_date('25-09-2023', 'dd-mm-yyyy'), 'zCgnC2UdQ77siQSa2LLs');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('JbpnZpTTnCpAdF5SaNSG', 13, 379, 3, 'r71K9DoPSWrpFmG40Ylj', to_date('04-03-2003', 'dd-mm-yyyy'), to_date('27-04-2022', 'dd-mm-yyyy'), '0vpv2OeyfdJKl4wI1KjX');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('fSFrfWomAQKsKIiMfO7p', 63, 871, 7, 'gxZWf8nqfkbOmgt5MbTP', to_date('18-03-2001', 'dd-mm-yyyy'), to_date('14-02-2000', 'dd-mm-yyyy'), 'GlqQr3tBC4F0T4mgxGWN');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('qR2QR6I1p8fbBgEfgisk', 28, 572, 3, 'AFpLlvnrY0XuuXTH3pQz', to_date('01-08-2010', 'dd-mm-yyyy'), to_date('22-06-2004', 'dd-mm-yyyy'), '6xx72pVFNAkq57LivPQs');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('AK3rc2539wQEhAgiMRaH', 82, 773, 5, '0qjZY5IIb4ZlsYPk6B8d', to_date('25-11-2019', 'dd-mm-yyyy'), to_date('22-05-2016', 'dd-mm-yyyy'), 'SIsQJ2e0CNHKfrCbDCTW');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('vssuOoN770YhOllvsPVV', 78, 346, 0, 'PwVjuX8ydl3oEpGRNBrI', to_date('21-04-2010', 'dd-mm-yyyy'), to_date('19-11-2007', 'dd-mm-yyyy'), 'thZbzPSqdekP4QxwtHaf');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zKI3CAQqJIdQoMTwsqUz', 27, 867, 9, 'Hp2NKR75AoCNVwa9lzQB', to_date('18-07-2016', 'dd-mm-yyyy'), to_date('12-12-2007', 'dd-mm-yyyy'), 'kPjw8ffzGF5q91Bm1Q50');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('MBL8lPmqo9ukMVqTRzAp', 42, 734, 6, 'i3ldFvjgqoKWf3jHkXiv', to_date('23-02-2006', 'dd-mm-yyyy'), to_date('03-08-2011', 'dd-mm-yyyy'), 'ESxn4yharYHCs2vfvirk');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('RM5iFzNuudZPOHG068SL', 47, 566, 3, 'uvAC80UA0h9mCfDztlQa', to_date('09-09-2009', 'dd-mm-yyyy'), to_date('13-01-2004', 'dd-mm-yyyy'), '6ByTALnGUAMESrd7UGpf');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('qiEPmjrQzcVFi10mmOlj', 48, 110, 1, 'RJSDedUMV7LEb32YuljQ', to_date('23-07-2011', 'dd-mm-yyyy'), to_date('27-11-2011', 'dd-mm-yyyy'), '3U1HFUYrGVecQY7vOsxQ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Wc2Obg1kSmMEnJCfuvBw', 41, 856, 9, 'p1a4DCq2xEXw0PLlw0OH', to_date('28-02-2015', 'dd-mm-yyyy'), to_date('05-05-2006', 'dd-mm-yyyy'), 'm3TSFvUJa2Sp5lyjmwKb');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('gNId9FqUdXLkTW0GiM7I', 68, 974, 5, 'cevgaiyAQ95H3uv57LLW', to_date('10-12-2012', 'dd-mm-yyyy'), to_date('26-05-2009', 'dd-mm-yyyy'), '6cxObMgNjYOC7PMRXeau');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('AOf3IBVESR1DTdPCovOl', 25, 108, 8, 'WbVePhXXtNXu8wN6usmz', to_date('28-12-2015', 'dd-mm-yyyy'), to_date('19-03-2019', 'dd-mm-yyyy'), 'pN1b6pSlUn7Vsi2dtp9D');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('N0cHQ7SihI0rx2ZXPiie', 19, 764, 9, 'CuQygtFMSPOXlmJyBnOi', to_date('27-09-2006', 'dd-mm-yyyy'), to_date('28-03-2022', 'dd-mm-yyyy'), '5utA6eUl2Ht5BkpvtHWq');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('meOTZarSrFgE7ijK67RL', 61, 20, 2, '3UUUECzQ9Sl9aSNl18Cb', to_date('03-10-2020', 'dd-mm-yyyy'), to_date('18-12-2006', 'dd-mm-yyyy'), 'DzNQeRzDwtU1eSNYn4If');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('vEY980zAq091rNC554sHg571aPr014mIr160iFg435sVY521tQ', 20, 81, 1, 'vZv143eIE167aVU113dJU824mFS241vCx492mBH222gUL172hD', to_date('21-05-2549 05:04:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-07-2567 00:03:53', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('tDR517lGD947xCP271zMA239xLN528lHF234xBK780jMf314fB', 55, 570, 10, 'vZT074mQs667yLv081sRn048vGb475fZU785yKS569iGf827aL', to_date('15-11-2386 20:06:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-02-2668 11:32:38', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('aRq239bWc744iPX032vYt722mOK220mGs743jPz879bDi791rD', 34, 863, 0, 'rTg078aUk934kAp638jSh449wDZ455gHg590rAq535fEn614gL', to_date('04-09-2150 08:56:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2112 05:15:30', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mBv246qDn166wDw727eXg355bWX269mBy265oEP539eGK860pW', 15, 843, 1, 'hUa798jYZ798jVN677aOY714iSY927sZS623sAo011bAW954dQ', to_date('18-11-1987 10:51:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-06-2709 09:37:26', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('sQR499iYn010bJE292qLq554yDf328zRV220cTV241aCt323qB', 6, 765, 10, 'gZq186fRZ418aOT816pAH322zTd679fZU115yPR645jRT217iZ', to_date('17-01-2037 03:58:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2638 19:46:24', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('sVM879aGi485oON028qFo548sNa878zBj752tVU158vKD579uL', 19, 576, 5, 'dJc467eRZ176pPG255bPQ296vOd784gHS198wXE692lSu770gL', to_date('23-08-1999 20:16:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-07-1991 12:54:51', 'dd-mm-yyyy hh24:mi:ss'), 'Pakistan');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('bOU617nXa130cHX462uXr681rJS583aGn882sLC598eWA229iM', 60, 927, 6, 'yRe021lAk077jON838kWI093wUY181wEG797mXc562eCF962wH', to_date('28-08-3045 05:18:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-05-2095 16:55:12', 'dd-mm-yyyy hh24:mi:ss'), 'Taiwan');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('xMI989cSB761sHg465cAE340rLD332yAw971gGR536aPz095oX', 19, 790, 0, 'kXq830oRw951kBK742sGQ342sNQ738uQl744tVY890aBC492cZ', to_date('11-10-2216 09:23:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-01-2614 23:26:09', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('nHp754nUe798gND412tZa350bOJ939oAe679hWR072vWL482eH', 78, 332, 9, 'sXs540eQf672nRK937pYY460rXe218mQP520fXS472rVa998nO', to_date('20-11-2443 00:01:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-03-2269 21:19:09', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('pYD240mIm620rGJ892gEY182zZw833nEB029sEG640lLL339fD', 80, 239, 4, 'jFC556zOK925dER039tNk433sST953yGn492oGA467cPE254aV', to_date('21-05-2743 15:24:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-09-2502 15:25:03', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zUZ677kRK714rRF180lBX550tEJ057hBU879xZY687xET829cT', 66, 8, 0, 'sSH424gUq132wUG496iUi348vVA935pEz625sYM044zNT665gI', to_date('07-09-2076 13:19:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-01-2924 13:09:07', 'dd-mm-yyyy hh24:mi:ss'), 'Italy');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('lSm546pHh559oBh368iSv355jDl976aSR170dLN672xSF411lY', 31, 321, 9, 'jCt065zAR128tRH044xLj492gCj367dMs737uOU624ePM818gG', to_date('05-02-2416 17:18:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-07-2199 03:38:09', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('hCH377aMh075qPh612uEv640oFJ121nVE939nSk890yQR520pP', 25, 449, 6, 'xPk398lZO413zDc384fUi740dFg685hDR395bQJ757bSH971eE', to_date('24-02-2391 11:10:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-10-2682 01:30:51', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('fEs595bQe471kGH987aPw743nYD230zMi625pUs867qGv166oK', 51, 995, 1, 'zXy887eUj438iOi880kLw086uOy814fXe691nUg936dPz962rB', to_date('18-03-2620 14:25:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-06-2220 22:30:08', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('wNI346qAI385wSG447aPy133iFv231uGs130gBu962hHY531dW', 14, 661, 8, 'oBi574lOV251kJI587xKV868fLL180bOh258vOT021bSR950mF', to_date('21-07-2478 21:12:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2709 12:05:19', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('kXt592jVm845gDS569dSE975oOL285zFV811tCF251xUw788pM', 19, 147, 6, 'eXk335yNU230xHY149zPi382ePb724yFT819gDQ743yNa421oV', to_date('27-04-2289 19:53:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-07-2288 11:22:07', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('wVa155hQF174oVM772fPW513iIm536iBn977lGA088mWa086oO', 21, 29, 2, 'nWJ962dPm630yFr164iAX262oEZ615rXE186jEp517vWV753mN', to_date('10-07-2535 18:48:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-04-2852 20:42:34', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('hTU755cDx921uHf073eOi940aHf368gDo222wYK848oEO570hY', 17, 397, 9, 'rVV457lTH692yIz117cTz855sDv137wNY331mPK786cRX572dB', to_date('16-05-2147 23:37:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-01-2174 17:45:27', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('jTV718uPr846wIB933gWx760fAu549tVI320kFQ477sYl616eB', 41, 656, 5, 'aVe877gPR619dFe031iKY330oGq764xPK622fQQ141iTA355xQ', to_date('12-04-2394 19:16:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-08-2080 12:13:58', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mUL124yNl976vDh578vBf599xYg062bHl762lOV771aRR679iR', 4, 260, 8, 'pSu234lSt645tOU250jKK696fBD682dSH778vOC127kVl887iO', to_date('21-11-2549 12:41:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2090 00:06:20', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('bLQ838tTL521zVH376jQF663cQA692xYM448kZt135yJo874lH', 56, 303, 10, 'zGE467oSV394hYm512pXx069iMT893qUJ665jXL848iWO871eQ', to_date('17-06-2046 02:10:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2561 10:02:29', 'dd-mm-yyyy hh24:mi:ss'), 'Netherlands');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mGq097xGi939hWE558nYq336rQK762eYR713xIp127wVG867pL', 54, 196, 1, 'lZJ144xLW797cEY673rJB076gZk639gQG596dSP041jME212jQ', to_date('16-03-2160 18:44:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-09-2037 06:18:51', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
commit;
prompt 100 records committed...
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('xZd518dDn297gPf398hRW366cNc397yEo730sLT213eAg519sM', 10, 591, 2, 'aIS784eAx530hYf270iNi837yMl851aCP324vLv540bTb655dU', to_date('31-12-2081 05:54:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-01-2632 10:49:09', 'dd-mm-yyyy hh24:mi:ss'), 'Denmark');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('lTi421nSk538sXu948vYs540vSl154fYF711aMt626hCN923tW', 5, 877, 6, 'wRO572aMn430sVy560dLr762xZh364rVo827mMt628oUi255uL', to_date('11-10-2989 08:07:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-09-2679 14:08:35', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('jWT780kRV740fOU155eBm730aNU381eIJ375oUF017bEm917jH', 85, 144, 8, 'fRI152rDa167jJq460fVq652nLy639tAU368jYO649nDJ983tG', to_date('02-10-2476 03:21:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-11-1960 23:26:00', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('vDS126mYJ211fLB068nWI621pWY213wVz671bQJ269pVs998fG', 99, 922, 4, 'kSi463eLu434mIH693tBj727xHr556sRw255xQB774mRu392oK', to_date('29-08-2901 21:18:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-09-2494 09:27:47', 'dd-mm-yyyy hh24:mi:ss'), 'Chile');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('jZW425rEG510iCt441iRO550yPk636oGd356yMq950eTh594nF', 14, 425, 4, 'wSS124qNG351eIr289lCV728yIA137xWw732wDn242qTP611yV', to_date('06-09-2081 18:56:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-07-2162 04:31:17', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ByZwim7foNXTyDaici1E', 81, 832, 4, '6JgY3VGhKN0rYm7AyYQ5', to_date('25-12-2006', 'dd-mm-yyyy'), to_date('17-04-2009', 'dd-mm-yyyy'), 'qHlkRHNKj5nOHsmoSUcd');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('VC1h8OlzgjOblnuxCvkl', 58, 23, 8, 'CCDxK9AyPcvGBSmItFLX', to_date('06-03-2016', 'dd-mm-yyyy'), to_date('11-06-2003', 'dd-mm-yyyy'), '2swIbgy5TyjbeWd1YOHv');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('l7ZzJLfrJQhoOxbLYC8D', 22, 195, 6, '1HeQyw1rmaIvLq6T0DLM', to_date('10-03-2016', 'dd-mm-yyyy'), to_date('16-08-2019', 'dd-mm-yyyy'), 'qoZHyQNEhdccFTk130Cl');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('fLN6XBGglEVcEobOM9yx', 15, 649, 8, 'Fa6C1tB8X02EXlA58JNc', to_date('22-03-2001', 'dd-mm-yyyy'), to_date('07-11-2016', 'dd-mm-yyyy'), 'gCrIBZqisnDFEsZRDEVU');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('yEhNg3N2kVuvevkSVwgC', 67, 20, 4, 'hT024Ubkz8vq4nDcYdCN', to_date('03-04-2016', 'dd-mm-yyyy'), to_date('30-09-2007', 'dd-mm-yyyy'), 'S2wNzPlrWnHqCVE5KeCG');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('2XKMqaxs2TUlqKM5M4CG', 15, 19, 9, 'y3qO9E49jYDSj4FJDvoP', to_date('22-10-2010', 'dd-mm-yyyy'), to_date('05-01-2008', 'dd-mm-yyyy'), '1JfLdO4u5ojhfWPdAQbO');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('jRo2pPKHiwDGJt7cmhv5', 39, 261, 1, 'hXrzQL6mtFQS7Jzoh5PK', to_date('25-05-2021', 'dd-mm-yyyy'), to_date('14-01-2021', 'dd-mm-yyyy'), 'o38a8Q8ngLnUFYZ6DnkW');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('CYe7ue8cnkUorHHxQXns', 68, 124, 8, 'tlNZEG6X21ZqWMPnPKpO', to_date('27-07-2016', 'dd-mm-yyyy'), to_date('06-02-2017', 'dd-mm-yyyy'), 'V0g15raFhsVrvAB3PVg6');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('2MRI7nRqxLuooUloSpX8', 77, 525, 4, 'uBVpZRAdWR8ZvCn2XPxF', to_date('16-01-2006', 'dd-mm-yyyy'), to_date('29-01-2018', 'dd-mm-yyyy'), 'M3aMq3dLocM39NwJd8pa');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('hOgQI3c8fuZhBqKXzERa', 67, 223, 8, 'bP8Kqc0nEHZFluIwifd0', to_date('04-12-2014', 'dd-mm-yyyy'), to_date('25-11-2011', 'dd-mm-yyyy'), 'cerL6lomaZ7cpdBZTsIL');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('v240unu0mHqWNHBGFZF1', 25, 176, 9, 'fY2yuwzttt21YULp970w', to_date('21-06-2011', 'dd-mm-yyyy'), to_date('07-02-2012', 'dd-mm-yyyy'), 'MmHcbeOQeWFDxWUiUqCc');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('fRv8uS8IR5fXLIyhqukR', 16, 315, 9, 'ZpNIh8i0PCJIfsvhzXD2', to_date('11-12-2013', 'dd-mm-yyyy'), to_date('05-02-2005', 'dd-mm-yyyy'), 'DBXfdXpc2qi4JjzoIeNm');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('PwRjRtTybnD2CDpfQNQI', 44, 643, 7, 'XAiX5h3Y5Ky5CTda8wJi', to_date('01-07-2000', 'dd-mm-yyyy'), to_date('22-06-2021', 'dd-mm-yyyy'), 'xKoguOMUyenKxDLgKmev');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('hxicyD2ZN4rzPEd39xrI', 15, 21, 1, '0NB8x8PeuaWxwafdQTCL', to_date('03-04-2017', 'dd-mm-yyyy'), to_date('15-08-2006', 'dd-mm-yyyy'), '1Lqpuw2A05wXXcHfc1dD');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Me8uOg2YlBdn65t44A8C', 59, 656, 6, 'vRDXSt5n4B18B1NqlanT', to_date('22-04-2008', 'dd-mm-yyyy'), to_date('06-01-2003', 'dd-mm-yyyy'), 'JeI0l96FxsFUmNonZ3Tm');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('IVT3KJv6IVqqoFtcHg1r', 12, 191, 1, 'ET349hhWu2NKdSb6KuIS', to_date('02-09-2012', 'dd-mm-yyyy'), to_date('15-07-2016', 'dd-mm-yyyy'), 'BiyBxTd2rAPRTCD18hyJ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('WVvHpgOe94OGDEtJRVCU', 33, 270, 2, 'Hu0gawHKNtFMD0imUkwF', to_date('20-02-2007', 'dd-mm-yyyy'), to_date('08-02-2016', 'dd-mm-yyyy'), 'T9G5jgzSvkQW9iVOJJtc');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('4YgDpCVltBjR7TFfCmj2', 2, 558, 2, 'YaF162ohpeNwCpcNzuV4', to_date('26-11-2000', 'dd-mm-yyyy'), to_date('24-08-2004', 'dd-mm-yyyy'), 'YQvavi00wLcAr92iRbOK');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('beuq84p1HAwYOrRThK18', 40, 114, 8, 'ilQ7W0tez885JwyKu1OM', to_date('26-07-2019', 'dd-mm-yyyy'), to_date('13-01-2015', 'dd-mm-yyyy'), 'e089czYjcbPhTyAH44vr');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('BanQcVNHk1bgFfy1Qxwf', 17, 584, 8, 'RvCIlJo6bghvjFDaApCb', to_date('22-05-2009', 'dd-mm-yyyy'), to_date('17-10-2022', 'dd-mm-yyyy'), 'gvo3v7OduzTyKNQN5Lm9');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('vkNp4hXK08HNEaZvaiDW', 28, 672, 8, '3RfD3FH1vM8yEp6xpKvQ', to_date('03-10-2004', 'dd-mm-yyyy'), to_date('30-12-2014', 'dd-mm-yyyy'), '6fw9TkoOwziyqq4i37UZ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ePfR8bnXfmYyZfXWoNyz', 78, 395, 5, 't8l3gUOuqDUwTloSi5ej', to_date('17-01-2009', 'dd-mm-yyyy'), to_date('28-05-2015', 'dd-mm-yyyy'), 'msSlfKUnoyKbH87BMQxO');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('jwqqIfAwvlPpJRdxiEfD', 65, 530, 5, 'yX0x8R2T0eSvpgFyYcjR', to_date('03-09-2021', 'dd-mm-yyyy'), to_date('19-09-2001', 'dd-mm-yyyy'), '6lZwZjWQUr1P04HkAlmL');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('RGNwam8V5MdyO69NlcxV', 87, 615, 1, 'dXZr98CNDd2u3MBoJ0aM', to_date('05-08-2012', 'dd-mm-yyyy'), to_date('06-10-2014', 'dd-mm-yyyy'), 'x3VJ5l2iPebJg83JZ921');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('38b0hVQbA9k8nQVAbigu', 98, 798, 6, 'J062DlvkehX0n1JVGZno', to_date('23-03-2012', 'dd-mm-yyyy'), to_date('21-05-2014', 'dd-mm-yyyy'), 'GS223oELR4LP4bc3wWn7');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('MvaIAEVb1Ct8r4i6qL4v', 18, 819, 6, 'VztINGmDgEGj1mvU8qDa', to_date('25-05-2018', 'dd-mm-yyyy'), to_date('12-06-2015', 'dd-mm-yyyy'), 'NeCmuVzZdxKTjc1l1aVJ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('PUrWBTdiTdQVvP9hH0sR', 64, 374, 9, 'dx2eeTg0NdE5borrPikU', to_date('16-01-2002', 'dd-mm-yyyy'), to_date('12-11-2010', 'dd-mm-yyyy'), 'SxQ6HkDXCp9fBhVtOI9V');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('IrbOxfOBMz6OeRQaOqzj', 16, 667, 10, 'zpIhZACMnHQlPAlwcqJN', to_date('01-09-2008', 'dd-mm-yyyy'), to_date('14-05-2002', 'dd-mm-yyyy'), 'prgSL91s14oHXskFX6eL');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('CONzz2zLqNojLyqEouZ3', 88, 783, 7, 'XLM1JMsngn5gJYJN0p6a', to_date('10-04-2016', 'dd-mm-yyyy'), to_date('01-05-2010', 'dd-mm-yyyy'), 'gUILqOwYF7w591HtIMRi');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Hg6NT3WbGgiwC02blNkG', 67, 589, 2, '8lrTAvrF7o7vQWBeEmQv', to_date('19-07-2016', 'dd-mm-yyyy'), to_date('24-05-2007', 'dd-mm-yyyy'), 'qt7QY4VvEaSwexPZlHRQ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('TU8VWMl12eq1FxhDwoDS', 72, 260, 7, 'BJcOfTOLKE9zQvs4bzey', to_date('13-12-2001', 'dd-mm-yyyy'), to_date('08-01-2007', 'dd-mm-yyyy'), 'tjpvqIo4xk2wrPTvFwPK');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('9iopJmlDFjUB6L0lQbF7', 3, 50, 6, 'yGd9L7ZvMMvjMWD6HXKS', to_date('12-07-2010', 'dd-mm-yyyy'), to_date('25-07-2014', 'dd-mm-yyyy'), 'KawzVOwhJOX1y0wxpRmp');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('fX5AJ5At6PxOnoLFOk4H', 47, 682, 4, '9ROQwHbe0emwxmPOtOpU', to_date('27-07-2003', 'dd-mm-yyyy'), to_date('03-01-2008', 'dd-mm-yyyy'), 'aLQFe3q67yOMFDahPji7');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('bHTzDQfwLT60Yp6gKCu0', 3, 643, 7, 's6h3rqXS4XiMBccUxmkH', to_date('30-05-2000', 'dd-mm-yyyy'), to_date('16-07-2007', 'dd-mm-yyyy'), 'wYveJYDkMQJMMUwbUuUG');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('T4uO58YR79WvpRkzOJpY', 61, 800, 8, 'R93uwkXoLgUX6AbW2y3W', to_date('14-12-2008', 'dd-mm-yyyy'), to_date('14-05-2000', 'dd-mm-yyyy'), '3RNa8og55WwUmxEp55zR');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('6WYt0e7XOvEDUpa97e7h', 12, 230, 2, 't6fU9W3Zgcoj7Uq7FBcV', to_date('17-07-2010', 'dd-mm-yyyy'), to_date('12-11-2014', 'dd-mm-yyyy'), 'Mnn58pHTpaa7qzeNUq9B');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('eSk668kVA019eTW111gSt290sSH438gUo619iIt667sOr363fL', 76, 241, 4, 'mTz755eNk761gRi567tQp271bDa990lPy142pWo942xXb574gQ', to_date('17-08-2175 10:55:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-12-2341 09:15:07', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('bJD087uKC519rOG019xOb571lXV367iHD245qDU150qSU554nK', 60, 532, 1, 'tVO664sPi465jDY577kPQ660kKr382qMp398nYi076nCf223iI', to_date('14-10-2005 07:34:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-02-2829 09:44:47', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zKA356bRX722sFT420bIh623sZD488qPk068xSI771pAB876aC', 57, 768, 7, 'yRR759bPO524qDo492eTT927bYh939lGK612rQD732cNY872aJ', to_date('23-10-2930 06:59:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2995 09:47:22', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('qIm173uKJ067qBw129dHn228iPl322yJI217kJQ268vLv059hY', 70, 26, 6, 'iLp233hZg247qHz534aBQ093tIp267eBA630yPt072zEL785uN', to_date('26-02-2515 07:18:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-07-2564 22:10:59', 'dd-mm-yyyy hh24:mi:ss'), 'Israel');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('vFh171oTa222mWr244iSY389cKD418pHr169qWO076tZV082xT', 75, 457, 0, 'tMb596yWf817kQW323kLO976oJb750pCP498lIN124tDs117vW', to_date('03-07-2786 10:56:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2274 17:46:01', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('lWE981vMQ312rAs091zKP078yIW785aLh527yDw018zFl574lU', 47, 848, 2, 'dWZ968hDt512pSB243hPU437vPs779zYl092yNC120kIN844pD', to_date('26-07-3050 01:12:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-01-1981 09:44:47', 'dd-mm-yyyy hh24:mi:ss'), 'Switzerland');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zBy324vQv417iNY039jYD886cVz156dER348wDx334zSZ994bX', 67, 815, 0, 'kGX830vZD971jXx557oRc283dLi398sDE189cOo314nCV131rD', to_date('02-12-2013 08:02:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-03-2047 03:44:47', 'dd-mm-yyyy hh24:mi:ss'), 'Spain');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('sMY960mVA938qNb126gJO950eDC759xQg688xIy642jEl620pP', 5, 552, 6, 'mNE846fZf521hKL197jYK623hQX233cYT242pKr581tKS573dW', to_date('05-07-2878 07:54:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-06-2201 23:02:06', 'dd-mm-yyyy hh24:mi:ss'), 'Canada');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('cNa998fOe773wSM059uOh990iCx859rNN572pQA059lRa070jE', 15, 659, 2, 'xRD780qOn091cAg555pDp134xYc035uTr136pTy516zOf660nI', to_date('24-07-2903 10:44:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-12-2223 10:36:02', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('cJL999rSX950fZe467rEs089nIR940hHA321xZD035qLY596lG', 44, 514, 9, 'wHv012cXf821pQM958zFB695xFM861aBK945oFT567kSR712fH', to_date('11-02-2343 11:56:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-07-2907 06:02:52', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('jYV656nTl880sUg739fRY818sCk451iBd682jDG896vNg114qS', 16, 731, 10, 'gMz015gVk057sDs587tKm959bLZ879tZU575aHp964gQj046lO', to_date('10-01-1970 01:20:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-05-2142 06:05:11', 'dd-mm-yyyy hh24:mi:ss'), 'Canada');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('nHC522oAd428oOb072fZL147lUo666sER535qVJ867sTT213yO', 76, 700, 4, 'dTe467iHl986sDP088eZa962bId458nLY446xOK110oBN280pE', to_date('13-07-2984 09:30:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-10-2055 21:14:41', 'dd-mm-yyyy hh24:mi:ss'), 'Italy');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('qPT318wRV059aAR931rLY669aXB582fKE220dXR272tNr799fJ', 47, 709, 8, 'fHp629hZl081nVV489cXX616nPH872oHo917cMv911sKF263rH', to_date('13-02-2024 07:04:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-05-2340 15:12:57', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('jZC937bAe388nED973oTG790tJP050oWY198sXV896eVE272bT', 11, 381, 9, 'fGA771gFM144tHH028mVh788aHj996kOS058sLQ110pDs898zP', to_date('14-01-2312 22:26:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-09-2946 07:44:15', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('kNk883xTD779gLn782zJt979cMO564sVR826gQt465fFd190yJ', 51, 910, 9, 'wAD216kEv450fVt534zZG937pZw151tRl383rSt134aGt492aD', to_date('14-04-2842 08:48:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-07-2971 02:53:57', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('lJQ199zTr122kAU680iJC457nYd651zCL921zYa483vOo645eL', 12, 728, 4, 'qBT282vKQ261aGy352dSO363cFd863tSc556aMp270eUJ070jC', to_date('15-01-2525 00:14:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-11-3013 15:45:21', 'dd-mm-yyyy hh24:mi:ss'), 'South Korea');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('aCu338hUG713yCs858eYJ450mSX653gPb134hOV916zOr523zJ', 21, 612, 8, 'iAZ219xGS216jGw292lRK716bBK179dOA296jPd486tSv667fP', to_date('26-02-1907 20:54:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-08-2969 11:21:50', 'dd-mm-yyyy hh24:mi:ss'), 'New Zealand');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('fWL941xMI728lTv244oVT361pVy666pFr824lBw410qXx117sQ', 3, 375, 4, 'mMC895bDC768aAW811uPg794iIO544rLw853oJL535mCC558sI', to_date('05-09-2944 07:55:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-12-3024 13:31:17', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('pIS872rOR432oLh060aRm147xRJ777mXJ795uGR785lWP796lG', 59, 237, 6, 'vTv266rFb638jNO686sWg345vUf854bSq997lLe258uFV756wW', to_date('05-04-2091 12:09:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-07-1946 16:36:20', 'dd-mm-yyyy hh24:mi:ss'), 'Slovenia');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('nHi339aMy330iIC911kMt475lHX321tTa123mLj385cEW844zC', 58, 800, 10, 'hPP197eHh445pAi279jWw052yEV174tHZ291xYc462aUp831uU', to_date('22-07-2005 06:11:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-09-2639 09:54:08', 'dd-mm-yyyy hh24:mi:ss'), 'China');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('uUm437nEk962jDs572tPS898hHn571oLb630aEu736gId185jS', 27, 855, 9, 'nKM497vWT951fZM734aWj614nRg385nOO527zAV366iBZ241jB', to_date('19-01-2377 17:58:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-01-2256 21:11:13', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zKP640oJG030vOu832dDI144nCB555xMc939hSv713gXM078gY', 5, 56, 1, 'bNM291kVX276oSb063qGT335tBE414sZV582xCK453rLR836vD', to_date('13-02-2846 02:30:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-07-2363 02:20:58', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('kTv647xSr395mUk883mTd492bIR570gPL488qVP376pLN458lD', 28, 252, 10, 'nQk062hGe054vOZ040eZg792bPe860sJs973hEt344uZl570bB', to_date('31-10-3017 05:47:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-09-2038 13:55:37', 'dd-mm-yyyy hh24:mi:ss'), 'Spain');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('hPl335jTQ251qLH655fMb748wJL882nVE570eEF650lQU736rF', 32, 110, 8, 'nMN233fBx238vFP373pTT867pNZ816wWk255zUZ634hUp076yZ', to_date('31-05-2030 07:09:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-09-2262 03:45:38', 'dd-mm-yyyy hh24:mi:ss'), 'Denmark');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('uIZ657sPN064sFp869wEL643nVr345vMH131vGl012rCS458pN', 6, 974, 0, 'kZM931mUP572qZB190nIq178mLa824mFT264wNy245dWj287sW', to_date('15-10-2927 20:42:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-01-2657 11:10:10', 'dd-mm-yyyy hh24:mi:ss'), 'France');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('cUh379yGK495wQo771qND960iHh729dXv654iER847qXO678sN', 15, 761, 6, 'kCl870pVg176qKe632iHg683aNG456oXI118yCy813fJO057tT', to_date('22-06-1947 14:29:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-05-2251 22:15:10', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('sJD777mMU031lUG629dDK375aIo827eKZ944nCJ345oCl962yW', 61, 69, 8, 'xUZ195uFc344sXw086qDh384gSq395yXp616oRP457fYQ246gQ', to_date('22-02-3024 21:14:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-09-2625 10:57:21', 'dd-mm-yyyy hh24:mi:ss'), 'Switzerland');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('vOQ374kKp447tSO261kCr298qQm140zVo017aYb179aDG870tS', 25, 598, 0, 'uYJ128vSA335hHs482nZB658qNg627tVy913bLV546vAr763wL', to_date('01-05-2481 12:05:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-2873 09:31:32', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('xPS579cVe075oWT080eWh236rBD090gES625uPC480oHc125fT', 46, 145, 0, 'jNy990fFG284zKW598uOx250uIz586mVp229yTX955hPr889dV', to_date('25-12-2323 05:48:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-07-2183 23:39:59', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('tVP877vNm018cYD261mWN026sGi154rJP253rTN372tXA560kS', 16, 376, 2, 'vWj746sNH227tZZ031jQr265dBV674iRV988rZy295fZl837cJ', to_date('15-12-2846 05:44:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-09-2498 18:01:35', 'dd-mm-yyyy hh24:mi:ss'), 'Indonesia');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('rLr687tEd527gNz143mJB628wSp678aAA483pBw995tLV583gB', 94, 579, 6, 'tTG110aUp771cFH867bAV286uPB268lWH230eIM876wMH514uG', to_date('30-12-1978 18:44:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-03-2661 10:34:27', 'dd-mm-yyyy hh24:mi:ss'), 'South Korea');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('gUs282uDU173zSa523eAh120aWt868mAW777dLg124hHW376hF', 38, 81, 10, 'vVd081jAt245gVo727sSH810tNH370gKt282xEU340pCf386dN', to_date('07-12-3046 06:47:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-11-2173 20:22:59', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('jQe442iHb297oPR648yQZ574hUu092bSJ872oQi157uUW420jF', 58, 912, 3, 'sTz438gSb783rGv578wVL233rVY954lRC068eNd244nYW440lP', to_date('28-11-2848 01:02:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-05-2917 06:48:40', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('vXB638iGp995pAb367dQq165mZM471bYo286oEY694vMv433lF', 32, 178, 8, 'pMF766jXr054cJQ393dKu475tGJ899nBX324bOl075bFG546nU', to_date('18-09-2782 16:20:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-05-2525 19:33:36', 'dd-mm-yyyy hh24:mi:ss'), 'Belgium');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('tVG790jAG954iNs571aJj739mIE542eWs177oJs547iEM371qT', 63, 922, 1, 'jUb058lXx550zJr369uHL315oQe248xVU436cQt452mOj188rQ', to_date('04-02-2471 02:41:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-07-2834 11:05:25', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('nSv542dCd139iKM793qMW149zCG180qDN836cDZ493jOo969hX', 40, 63, 3, 'eAx458oWW995mIu063qFn574mPA068sTm095nSU016vIE891oM', to_date('22-08-1906 19:23:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-04-3052 04:31:00', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('iKB738wAq315cYl631zRd281qTT274uXo911fRh122nNJ084fT', 35, 641, 5, 'nIl443kSq067vGz694wRz296pDo114aAY367eCm041yOF389sU', to_date('29-05-2039 22:58:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-08-2137 08:26:18', 'dd-mm-yyyy hh24:mi:ss'), 'Japan');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('fNW878nFD324pSX721nAL648yDU669lDL659oEU315iNT554qO', 84, 400, 7, 'aVs036cTo629iSv798kBq933xLn567mCO857fRs295fVF771wS', to_date('31-07-2175 20:34:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-10-2960 01:44:49', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mBd889yEQ999wPb275fJQ549cOg639uIc439uGL327yAt189yM', 61, 187, 5, 'qLj761aSZ822aQQ712vFy948mOr974nWf261lAm812yMN236aS', to_date('30-05-2149 06:18:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-05-2340 15:36:25', 'dd-mm-yyyy hh24:mi:ss'), 'Poland');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('hMh835kCW883vYM791bFF618eWE919mSy614dMH075lSB313vQ', 97, 444, 1, 'kXw689ePs255pGD071hLH146zGM513kGa611xVG076aVq568nP', to_date('07-09-2718 13:30:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-02-2273 12:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('bNK284rXo413zZe220bHI957xRy661vLO228xRR048pTu046tZ', 4, 217, 3, 'yZT224zSa950yYG219gDA371nNV240vJp755hCd361dPx180oS', to_date('06-08-2175 14:38:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-06-2123 15:55:26', 'dd-mm-yyyy hh24:mi:ss'), 'Spain');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('lLd139fTN993mQi719yRx219fMU815tLt019oRV281qPG659lX', 59, 172, 8, 'rJk795lLM876oMl827yZA074tIh323wIQ788zEb766iMS847gM', to_date('30-07-2038 08:22:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-12-1945 14:32:29', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('cKm848jBA373zCo633yLT247kSy653kAj044gNC674dXb554oF', 10, 256, 5, 'hNQ655yJn768qAy660jBE765pGm613lWm123iSN822xEY429mW', to_date('08-02-2206 20:32:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-07-2181 07:17:54', 'dd-mm-yyyy hh24:mi:ss'), 'Israel');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('dAE913sUG017nJe415qHy431oSJ847gCa027fEb288bMW562rV', 24, 754, 7, 'nBM131wIP976sHa874mMN365sCp819vNa946lCl718fKT342dV', to_date('20-05-2715 17:09:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-08-2976 11:27:44', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('kPL888iHd527ySA459vMQ953bLh364uKQ225mKR134uEk565yL', 63, 860, 3, 'gJt477sHP061lVb869cVX578yWg395yVu491kOO378uUw188oJ', to_date('13-04-2139 01:46:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-08-2304 12:58:01', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zIM288cJr759jQr740xBb316vQQ757tPw230yFL531lAL433iO', 53, 991, 7, 'hUi341oUS784nNq885pOL089qSA589fUQ278jLf088hJJ568zM', to_date('17-11-2564 10:13:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-05-2913 22:32:09', 'dd-mm-yyyy hh24:mi:ss'), 'Switzerland');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('cDt375mRV465dMf532vTP454aCA575hAF635uJq541pFb156aW', 0, 598, 7, 'bWo618iMl655eWx722iBm386zUv155wJy158yIx327iCA747iT', to_date('29-03-2779 23:35:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-12-2811 17:45:36', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('hGk289tXA167nGl954mHc578iKS041pEP826bYU427hBO225rM', 11, 750, 1, 'fPJ416xAP477nSt135zRS871aLD988wQI625cDO691fJN429dE', to_date('24-10-2412 09:08:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2961 08:07:35', 'dd-mm-yyyy hh24:mi:ss'), 'Italy');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mDy871pEt788kTp214aMQ143zHj754oRB123kCn698tFu178iA', 99, 600, 7, 'kWS574fEh294qCp443kSd213rZe734vXu257xDY479iLY560bT', to_date('11-08-2178 02:31:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-04-2792 14:53:57', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('nQQ652xPO968mFp198lUX311uNi686bWb295bXp443tID949cN', 65, 690, 1, 'kXd788aTf089kFS929lKB061cYZ852yJP078qBI124tFT912uV', to_date('28-11-2923 09:29:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-08-2101 10:13:26', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('lWr533lXv721aBK118pKb919fDn453eOS528aDH826pDC618xN', 26, 25, 9, 'eOx766wGq128mVf922iZZ629iYh525tKM372rSl114zFf142oM', to_date('19-11-3021 10:28:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-04-2456 17:19:32', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('eMt579eIm627sQp458nJs356nPk650yMY762dMn055cIT164iK', 11, 173, 10, 'pLn222fQz162eFm155zUY695yXI367lHk179hQe435tSn427tW', to_date('18-08-1924 13:58:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-12-1933 19:38:21', 'dd-mm-yyyy hh24:mi:ss'), 'France');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('KMjr93ysGB1lT0zzdCfj', 87, 466, 9, 'XIFCXwDbr4lsmVM9XWXz', to_date('11-04-2021', 'dd-mm-yyyy'), to_date('08-08-2019', 'dd-mm-yyyy'), 'Vs8YP5UrbvBd0JDjDsMv');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ktCL4nMRHmIDuZpTSJck', 85, 110, 5, 'PnZPva7ukKy68HbRqBmx', to_date('15-10-2006', 'dd-mm-yyyy'), to_date('21-12-2022', 'dd-mm-yyyy'), 'NAKlAdcls59vguUaWzgG');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('dTpruMPSvrzvVxOJfmGY', 82, 314, 6, 'ueAPvUAnpi90bu0CUJn5', to_date('16-06-2000', 'dd-mm-yyyy'), to_date('12-12-2003', 'dd-mm-yyyy'), 'CXdby8pjFT8dvhqjQCao');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('MXHchExJGVbvSrudcEfB', 47, 484, 1, '6Z7tgxORVRY8eluZCvuv', to_date('06-10-2007', 'dd-mm-yyyy'), to_date('18-08-2016', 'dd-mm-yyyy'), 'VULvEimRAfbmL6fGHSmv');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('sy5Y5g1ao4Qbn2fUtbSM', 86, 508, 2, 'YvxprGnUyTZPSbkSQGeG', to_date('20-08-2016', 'dd-mm-yyyy'), to_date('28-08-2011', 'dd-mm-yyyy'), 'uDh2HSpIFtHVNnuN6uYT');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('gy3xtfIoTm7SqSqtFsrl', 69, 637, 7, 'sVLyrogffBdqJ7hjOXqF', to_date('05-07-2013', 'dd-mm-yyyy'), to_date('07-05-2018', 'dd-mm-yyyy'), 'GfrbAqneIjRjckd3aTR4');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('KCifV23WFXnCYapeGB5S', 23, 636, 0, 'qUAnGZNhNH0nIaC5Blxa', to_date('01-11-2001', 'dd-mm-yyyy'), to_date('22-09-2023', 'dd-mm-yyyy'), 'BZAgk3zosPvNkb295BWV');
commit;
prompt 200 records committed...
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ePLDni1VAn3CzSANO6Q1', 69, 51, 3, 'Q3QTMGK2hd0gh2yFxkID', to_date('21-01-2005', 'dd-mm-yyyy'), to_date('10-04-2006', 'dd-mm-yyyy'), 'slJRIgAVZSeT9EEc2GXd');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('3iqH728bBOK0OYFDVD8c', 10, 499, 2, '83aEMv505d21rVuQGmcK', to_date('09-01-2019', 'dd-mm-yyyy'), to_date('06-12-2013', 'dd-mm-yyyy'), '0y7BF2fLlOqF06sryutR');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('cbMIconJWtHCNLY3aG1o', 65, 840, 9, 'Hjj0IsyWXmkAE3beICqZ', to_date('22-07-2000', 'dd-mm-yyyy'), to_date('18-07-2002', 'dd-mm-yyyy'), 'p8AFwUVxY3UmnCfTtLW7');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('bSBpuZ2J0dgw517Zb09h', 4, 50, 3, 'K13ueIA9hmuWNnMHg3AZ', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('17-03-2018', 'dd-mm-yyyy'), 'zcrnxYLNcVdaMuMEx4i0');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('yylksanN6KMpmznFUkj9', 33, 696, 0, 'DEfi1rIcO2U4fcKjJKDf', to_date('09-03-2004', 'dd-mm-yyyy'), to_date('22-05-2017', 'dd-mm-yyyy'), 'rbirMny1f5QZrj979Iz1');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('VSGNUhHSO7qfifaHAcTZ', 96, 475, 8, 'paZFpjfyx9Bkoai0Nea0', to_date('11-03-2000', 'dd-mm-yyyy'), to_date('27-03-2009', 'dd-mm-yyyy'), 'yc9IoBDZ7YKx9QZQy7Ev');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('dk7GxRPa0ILsAi7kzNw4', 49, 646, 1, '2okHDK2CMUUrq2VUwPTn', to_date('26-01-2017', 'dd-mm-yyyy'), to_date('05-11-2009', 'dd-mm-yyyy'), 'nd4sgF4swm48YKfSoVFw');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('KQmJWXf9PcKFXXiRJWgB', 85, 390, 3, 'cyjBtMIyjtQd8I82zfNU', to_date('14-06-2019', 'dd-mm-yyyy'), to_date('20-09-2018', 'dd-mm-yyyy'), 'EtFhARSSXZkKgkrW9YRE');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('SICDWVKkDDLQcDhcF7CU', 90, 439, 3, 'VO08pqywo4i2vQmCpPQM', to_date('15-03-2008', 'dd-mm-yyyy'), to_date('24-12-2011', 'dd-mm-yyyy'), 'FGuXgoovOmHELSetIe4V');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('9dRI118JtyYNwVMZ7ff2', 10, 492, 8, '4Y1u2lWAETM10DNjc1Is', to_date('01-01-2003', 'dd-mm-yyyy'), to_date('25-01-2017', 'dd-mm-yyyy'), 'jcGZ498PkIQ0b8ZvFCQM');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('MHaHS7WQBZAJAHPeZ8fj', 49, 171, 2, '89CRnGbF5KM0Qmt8PFGC', to_date('08-02-2022', 'dd-mm-yyyy'), to_date('19-04-2008', 'dd-mm-yyyy'), 't0hNKrRvsNg4RQfSwAeH');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('raPgsWLXWN3l3QZkr2Tv', 75, 941, 2, 't3e8wGPdXJFzGet9Wi9r', to_date('11-11-2020', 'dd-mm-yyyy'), to_date('13-06-2010', 'dd-mm-yyyy'), 'GwhRw2hnP9GSXWpZg09k');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('cBUqAvx8tQWDFEa46b09', 4, 243, 8, 'QSM3YISPaSCHt20ws8aG', to_date('20-09-2005', 'dd-mm-yyyy'), to_date('19-12-2021', 'dd-mm-yyyy'), 'N29BmNPTfmmh60RERRxd');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ZMEMvTVkYalSL6uVmd0U', 18, 928, 1, 'IJHQlYdgeGouUNw14wsY', to_date('28-11-2011', 'dd-mm-yyyy'), to_date('18-09-2006', 'dd-mm-yyyy'), 'AdPAXmFlwxO76nTys1QN');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('YrjOfUWiN5fKxWA9LxzH', 4, 86, 5, 'EK8IGvv3mqXpKjjGlzct', to_date('12-07-2011', 'dd-mm-yyyy'), to_date('19-07-2020', 'dd-mm-yyyy'), 'bEtMWNOOZ4ulNKOx9ftI');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zInqaEOeudnE68GWB25f', 57, 255, 2, 'PYpV56ah488KvVyXAG6W', to_date('17-12-2010', 'dd-mm-yyyy'), to_date('02-07-2013', 'dd-mm-yyyy'), 'SBpohL5ZqoepvBPwcUc9');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('UlHL6A0JlRPU8Y18zxHb', 29, 216, 4, 'TvDXGNxTRUXhEE7mrcOA', to_date('03-03-2023', 'dd-mm-yyyy'), to_date('12-05-2006', 'dd-mm-yyyy'), 'Q8vSjAMbnjv047ePiRvz');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('TaTAWulEEqGoqaqZvXdk', 5, 410, 2, 'XnmFM3NTrsw605v8G1P2', to_date('06-05-2019', 'dd-mm-yyyy'), to_date('15-03-2011', 'dd-mm-yyyy'), 'bfnpzl0lE1fihwnCRYQI');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('lMlRIPJ8h9zOy8w8DBri', 72, 849, 1, 'iuQ7OLLSBLJeMh125OiW', to_date('06-02-2016', 'dd-mm-yyyy'), to_date('13-07-2014', 'dd-mm-yyyy'), 'yUYYyDVM0k5sGpjvPqCo');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('pecjgjiiEeRiZnHsz5ND', 3, 251, 1, 'PQyJXZAbTWhjJQ7Dn04d', to_date('05-05-2022', 'dd-mm-yyyy'), to_date('14-12-2007', 'dd-mm-yyyy'), 'fYSxq9L6Vd6kuHXXNpYq');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ft6zkU6OZrqKI8T4IxkR', 55, 203, 6, 'PqeVdejgJG5gcP42Y2xR', to_date('20-10-2011', 'dd-mm-yyyy'), to_date('03-04-2020', 'dd-mm-yyyy'), 'deHF2k28jtnC6mmoohAu');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('L9qe00I3L6whVkljVmaw', 64, 765, 8, 'pzE9dgn8qBzlYGTtMcX2', to_date('03-05-2011', 'dd-mm-yyyy'), to_date('21-11-2022', 'dd-mm-yyyy'), '66Nn36bQmM0yIJzqupHa');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('KUc6mLiK4T8aFZWYmYHi', 47, 260, 6, '8YFrzbZP0c1BMLbPa0JY', to_date('11-12-2003', 'dd-mm-yyyy'), to_date('23-02-2000', 'dd-mm-yyyy'), 'gKdBHJj0jAabXODWhcoy');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('2lkZRvlq7LSLMPnbw4vf', 55, 231, 3, 'mmDRER9IKseJoq1KxnPh', to_date('03-12-2020', 'dd-mm-yyyy'), to_date('27-04-2006', 'dd-mm-yyyy'), '258RoMotjf4UG2LQvvNj');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('HQLCRnKIHOffFi56ZZhy', 87, 687, 6, 'qdemvpQUbsheQkq9ZvZM', to_date('08-07-2011', 'dd-mm-yyyy'), to_date('05-08-2010', 'dd-mm-yyyy'), 'GHZlaDi99nEajPiABOYc');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('BnmHROSwRUQ0VDtJqW9s', 64, 392, 1, 'Pv15hKtHGjba299YFEB7', to_date('05-10-2013', 'dd-mm-yyyy'), to_date('09-04-2018', 'dd-mm-yyyy'), 'vQ4FYvPGlzHTJCN4Vv27');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Gk2nLTbu073X84FJ91Ab', 41, 869, 3, 'm70bOxwtGndcMVQi0LNV', to_date('28-06-2006', 'dd-mm-yyyy'), to_date('12-03-2002', 'dd-mm-yyyy'), 'EiQLubsALXZ1ctL2rFCo');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('f9xyxdEeYSKuR4PTnNm4', 71, 754, 1, 'Kc0yA19LWe9DjavhCnS5', to_date('26-01-2005', 'dd-mm-yyyy'), to_date('02-02-2010', 'dd-mm-yyyy'), 'IKJza7bTwFgnVMO98ckx');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('NwclOhr0u7ek6KhjAP8s', 25, 66, 6, 'Lw1JblMUJupyqGm4feKT', to_date('04-07-2021', 'dd-mm-yyyy'), to_date('19-01-2019', 'dd-mm-yyyy'), 'rJsZHSL1DkLLZFvPqQ9F');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('s40fhEmdiCDxZajebLUH', 18, 529, 5, 'SG81h7DdmuGzjY1hv74z', to_date('19-04-2004', 'dd-mm-yyyy'), to_date('21-08-2006', 'dd-mm-yyyy'), 's0CPJtnn7uYufvReM35Q');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('T9nx3Vhb3tvq86iuGaqx', 78, 892, 0, '9A0ZoOjMPKd2UbZnlXcD', to_date('19-05-2017', 'dd-mm-yyyy'), to_date('17-07-2022', 'dd-mm-yyyy'), 'kkxEhOMh2fSlzAGOo9oT');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('UJJhQNr85bzowqpvlDFI', 70, 141, 2, '9LcyWhqvH6JTMSh6GW5t', to_date('25-06-2018', 'dd-mm-yyyy'), to_date('07-02-2013', 'dd-mm-yyyy'), 'oe69oW6MhVi01lvGviyY');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('kQSaTyQe5QNNfYpSvax4', 43, 833, 7, 'GJbAqB0zMDJVewmbgShd', to_date('12-01-2019', 'dd-mm-yyyy'), to_date('11-10-2017', 'dd-mm-yyyy'), 'NPWddzC176hV40HXbyV8');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('SvGx2JfnNFwoQypo0ssA', 14, 478, 6, 'rFfTK1pUiIYpUwSFuwFv', to_date('23-10-2012', 'dd-mm-yyyy'), to_date('09-01-2018', 'dd-mm-yyyy'), 'R6wqxvfRErTBITgDrZcJ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('0o3InEATBqky2vJOibhK', 1, 764, 7, 'bUJbJiv6v8pY5wiqyTIW', to_date('13-06-2002', 'dd-mm-yyyy'), to_date('28-05-2009', 'dd-mm-yyyy'), 'GJbJp2hnsuJacR0yDffP');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('xHoDZJAdVU2mLjgBZ8Fz', 52, 605, 5, '1bocqTcxQoyT4oESkigJ', to_date('28-03-2005', 'dd-mm-yyyy'), to_date('08-02-2000', 'dd-mm-yyyy'), 'SRcON5995jz465LNCqWD');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('PQYwfSwGBRLYnrZBFUBH', 16, 449, 3, 'zEl4cu9NxNYK7tnd4Ucx', to_date('03-06-2010', 'dd-mm-yyyy'), to_date('10-02-2021', 'dd-mm-yyyy'), '4tkQp5IbN57Ebnl8vus0');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('X0Jd1EmW8CW7EdbGB7SD', 93, 373, 4, '2EhoBl9erkuW4Gaea4KX', to_date('15-09-2017', 'dd-mm-yyyy'), to_date('19-05-2023', 'dd-mm-yyyy'), '34a9LSPVQNPT5cVu2Fq5');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('PZ9SfwrlZ0JBk9flxuai', 94, 495, 5, 'aiFftwZIpk7WnEi9fOTW', to_date('15-07-2018', 'dd-mm-yyyy'), to_date('26-04-2013', 'dd-mm-yyyy'), 'R1ddXJEDHpxQYqW88KWu');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('QRkx9VhzcRef3RKLhbFm', 81, 339, 6, 'BJnnJDlRtZjeYvJfsCli', to_date('28-12-2012', 'dd-mm-yyyy'), to_date('05-10-2023', 'dd-mm-yyyy'), 'l3ghwKjSvzTmrjDkVdVQ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('dvFgbovgHZW8xmLspbs8', 17, 776, 5, 'SoWiU96BZNt4BdxmVZGD', to_date('12-12-2022', 'dd-mm-yyyy'), to_date('05-01-2007', 'dd-mm-yyyy'), 'QHy8sDfRG3QV5bVgoAr1');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Frz28ycyuf66xSd0Nf6s', 12, 804, 2, 'vnJCrqhutWQwLih8RhTV', to_date('22-10-2000', 'dd-mm-yyyy'), to_date('18-01-2012', 'dd-mm-yyyy'), 'tfN2hl8YzJw3czJBJRt0');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('gyh7lJXZdDJmW8RUTttp', 21, 53, 5, 'LnpllxolqxZCymLN0GVF', to_date('22-12-2000', 'dd-mm-yyyy'), to_date('25-11-2005', 'dd-mm-yyyy'), 'kLiaztaoblWNCFwTnqit');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('hwRrRVESKlCPvczDmrye', 70, 214, 1, 'dxLxS4ULzoD26kTQRKVj', to_date('27-10-2000', 'dd-mm-yyyy'), to_date('16-01-2018', 'dd-mm-yyyy'), 'MdbW12PimPwsvc4IPMth');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('WyAho3x6uqLZu4GdVPQQ', 77, 292, 7, '8wNCYtKX3RaeUCjT0RdW', to_date('06-08-2018', 'dd-mm-yyyy'), to_date('25-08-2015', 'dd-mm-yyyy'), 'AWCR9MLhcXHFIebW4XTL');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('JEapCITxfSfWjZ1YQYwO', 92, 277, 6, 'KVgewQTlBAfax0ze0JK9', to_date('09-09-2002', 'dd-mm-yyyy'), to_date('26-09-2023', 'dd-mm-yyyy'), 'nU9hJeYZMVtmjgpY6lC7');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('tWqdhZ35Xr1iHTWFRSEU', 99, 574, 0, 'teK6f7uoJxx15LFiv73T', to_date('22-03-2021', 'dd-mm-yyyy'), to_date('08-09-2011', 'dd-mm-yyyy'), 'bBeUYo9g4U3Bm4uA2lWJ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('YXa2DMSRtg4z53ObwO5H', 16, 195, 3, '4ifycgYf3qYhYYTVATrO', to_date('10-08-2020', 'dd-mm-yyyy'), to_date('26-01-2014', 'dd-mm-yyyy'), 'gw27LNMXl8TXaen0j34f');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('NFjiU36M15pM8S71LMU4', 9, 227, 0, 'WB0cyQUUIHcTjshpzq64', to_date('06-09-2014', 'dd-mm-yyyy'), to_date('04-08-2002', 'dd-mm-yyyy'), 'nDBqbrnR7P934M17w37q');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('58dZj4WYdD99eejuPcpd', 59, 710, 2, 'uyFBYPVVb7QboDDI88vZ', to_date('09-04-2022', 'dd-mm-yyyy'), to_date('14-01-2001', 'dd-mm-yyyy'), 'BMEkhsFVMssddYLnj0QD');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('DR9XLbpgWCunbpQ0eMo7', 55, 413, 5, 'aatFL7iuEcyIs1D2LnRe', to_date('02-05-2007', 'dd-mm-yyyy'), to_date('12-10-2006', 'dd-mm-yyyy'), 'NmvKWjgMktXHq0fnqiJZ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('CiPslgn4PLpASIfRVv9l', 68, 147, 9, 'vmBMTa1eh3vJybHm5IRz', to_date('18-04-2017', 'dd-mm-yyyy'), to_date('22-01-2019', 'dd-mm-yyyy'), 'RiRebRPEY0hhILA6wxfw');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('faxith9J9XK3drLd8U73', 7, 309, 2, 'kzUsqA4LjWIbUt0dfWNK', to_date('18-09-2001', 'dd-mm-yyyy'), to_date('21-01-2016', 'dd-mm-yyyy'), 'sW0ypTmcJhfpIgU170Aq');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('LyizzSX19sMbffVqMFqb', 66, 976, 1, 'G9jEjrH8LUM3Pq2CQp58', to_date('11-02-2014', 'dd-mm-yyyy'), to_date('21-11-2020', 'dd-mm-yyyy'), 'TYn5uY23OSCYcRCBJFey');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('wAylh4WerofToz0jZavK', 63, 615, 5, 'GF0QV8PV87i2QHPB6ute', to_date('27-01-2017', 'dd-mm-yyyy'), to_date('06-09-2002', 'dd-mm-yyyy'), 'cugXaPJVwkvWAFDcrgBJ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('1NRC0VGhWcvBIegtcUao', 20, 990, 1, 'UfZ94sDsXEHsCS0tiuv1', to_date('12-02-2009', 'dd-mm-yyyy'), to_date('05-08-2006', 'dd-mm-yyyy'), 'Zccoy2K4be6oZA4LxGxI');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('AmrZ5KxyeTd4R7WMLeAW', 9, 70, 1, 'VzbIHv9WJ65uCDiTbnQq', to_date('05-05-2017', 'dd-mm-yyyy'), to_date('17-07-2022', 'dd-mm-yyyy'), 'D2EKVGUKfUODA6cEkWVq');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('gY8RHOyavD9EBEtbscdg', 72, 813, 2, 'k5yY7hffSMP1nclUkK3b', to_date('11-07-2004', 'dd-mm-yyyy'), to_date('09-06-2000', 'dd-mm-yyyy'), 'eXqQugRMREYgcQVVMWFs');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('GwVpUKoYwxm1S6ozlE6X', 92, 36, 7, 'tZWu5l8uq5VuKV6KHgp1', to_date('06-01-2002', 'dd-mm-yyyy'), to_date('25-11-2015', 'dd-mm-yyyy'), 'b6rR7hNuC07ae2IAuzs8');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('vzaI6njXzib5l88YrVXS', 33, 326, 9, 'o6inooG7Sc2LA5uaPNAN', to_date('25-03-2010', 'dd-mm-yyyy'), to_date('19-03-2017', 'dd-mm-yyyy'), 'VHpT1VbH5LfU9MDjPp64');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('4bcavPduDjDOVow8thbH', 13, 688, 6, 'AX6d5lFgKWphoXHsL1wn', to_date('17-07-2007', 'dd-mm-yyyy'), to_date('03-12-2023', 'dd-mm-yyyy'), 'UbuL4fbGNZlTdNENSAUE');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zZ4xRXgF3KcD8uoABCac', 3, 263, 0, '3TObjpesONma2nPn7B8c', to_date('21-11-2005', 'dd-mm-yyyy'), to_date('02-08-2019', 'dd-mm-yyyy'), 'GOOiHpIaNI9Ot0fDMykB');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('QcCRjwOnnYmibqEAchfh', 88, 21, 8, 'IdZt8yI0wERLRDTHVRxD', to_date('10-02-2005', 'dd-mm-yyyy'), to_date('11-10-2023', 'dd-mm-yyyy'), 'RIyeB9lHg4gdbD2VH3oU');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('cxY1fXeNSor5w6ulA4hF', 93, 46, 0, 'D0BcWT2VlGoMK7XwVphr', to_date('05-09-2014', 'dd-mm-yyyy'), to_date('21-06-2001', 'dd-mm-yyyy'), 'H8ZqSks8iu92Fq9MhZfV');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('nMHhXVXG8lyobGKKFnba', 87, 880, 4, 'Lm70qttNJ2I8VnXPEcgL', to_date('09-06-2009', 'dd-mm-yyyy'), to_date('18-02-2023', 'dd-mm-yyyy'), 'XE2PsUy0QaB8kTjh2I6M');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('HQKHExg8SV0BQP7PmpHu', 57, 7, 3, '99UlQmqvelCFytYmi3Th', to_date('18-02-2006', 'dd-mm-yyyy'), to_date('15-11-2017', 'dd-mm-yyyy'), 'xvGAsnZGVg469Px7wYoV');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('e7CTa4yAhPCWbmypAbUt', 5, 925, 2, 'x0za7wz3rdDAXpkIul13', to_date('10-08-2016', 'dd-mm-yyyy'), to_date('06-02-2017', 'dd-mm-yyyy'), 'FU04W2DtfGC2aj3gcBnD');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('CUin4CnO3riFFafEm4cC', 30, 332, 4, 'BgWerLCuxady5H2zOZsU', to_date('14-05-2008', 'dd-mm-yyyy'), to_date('02-04-2008', 'dd-mm-yyyy'), 'xoBcUwuroZyUf8jqSXFQ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('P3hYahrAqjy54JruGBIQ', 27, 446, 2, '7TyNjReEFgAuiObSCI1e', to_date('28-11-2018', 'dd-mm-yyyy'), to_date('27-07-2019', 'dd-mm-yyyy'), 'ZU0bTcKySFhlQp3aaH2U');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('KVvPcvCuI4JMGnysn2iz', 5, 10, 9, 'nqecNJ3mjQ1xxLVKsooU', to_date('21-04-2014', 'dd-mm-yyyy'), to_date('26-05-2021', 'dd-mm-yyyy'), 'atFz5ibodHEuexgpJQh7');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('k6Y9gRnh2sp1nWSNjXyd', 61, 85, 0, '5SrcsbTmW1TpKMDCussV', to_date('20-10-2008', 'dd-mm-yyyy'), to_date('04-09-2003', 'dd-mm-yyyy'), 'ZNxSDZhYXzFplMGL4Gfq');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('QAJaPCOIFrfM5WMoACo0', 6, 115, 6, 'pUWfHN9xxDvkoAvxEhEF', to_date('28-01-2001', 'dd-mm-yyyy'), to_date('14-01-2012', 'dd-mm-yyyy'), 'd1WlyJjoInQ61NtCEfGc');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('vjYoPWBEjfe1p8pjWuzy', 17, 19, 1, 'D1S82jgFUaWRntBToh9c', to_date('08-02-2003', 'dd-mm-yyyy'), to_date('22-09-2002', 'dd-mm-yyyy'), 'ZxgCHNw350ObX8HaaLN4');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Yvngsz7VQKTj0DB9LJoE', 94, 866, 7, 'LeNkHVYprfDqqOpCetPH', to_date('04-01-2012', 'dd-mm-yyyy'), to_date('26-12-2022', 'dd-mm-yyyy'), 'qarqTs31WwAoCP464qd7');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zPMp5dGnLcNPwKQlNRgL', 33, 146, 3, 'ris0foU9qlDMC4GWua6C', to_date('22-08-2005', 'dd-mm-yyyy'), to_date('03-09-2015', 'dd-mm-yyyy'), 'LAuVriSO3sGphBFdbnfY');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ZbrP08ZxdRBCoQBoV0lo', 57, 102, 9, 'cBFQUaIVqHWl8drPJ8vr', to_date('24-08-2010', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'), 'gsvjhMhvZrYfP6pLx8np');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Uj8OQ61aVsE4oByuNND7', 9, 326, 4, 'uA2S2KNrw6wslRziwtul', to_date('07-12-2007', 'dd-mm-yyyy'), to_date('16-12-2017', 'dd-mm-yyyy'), 'VupMKgo4zIMGkapD41wi');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('w8W8MdjEpelam0GoEoT2', 71, 891, 2, 'YwWtoI9l9oQAsNSy7UuB', to_date('17-03-2018', 'dd-mm-yyyy'), to_date('15-08-2013', 'dd-mm-yyyy'), 'DyRTbfj3aVqxtuPL1fkH');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Udi8RJoZ2mrBlP7520V2', 78, 354, 1, 'VWLJeetnV0Ocdf4lVwDf', to_date('05-03-2001', 'dd-mm-yyyy'), to_date('10-08-2005', 'dd-mm-yyyy'), '8oDQae4phNFuj1bRCanI');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('NBSh7wCDXwpjOIOdv4Nf', 73, 938, 2, 'hZupGlbKrhNmUZV4UVUt', to_date('26-12-2012', 'dd-mm-yyyy'), to_date('15-10-2023', 'dd-mm-yyyy'), 'fo3wFJnItVUaqmnVYQaT');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Q11whnKRh0HzAOWX8mjp', 19, 655, 9, 'OhdIlsUmuRxJWAp2DPQd', to_date('10-03-2019', 'dd-mm-yyyy'), to_date('17-05-2013', 'dd-mm-yyyy'), 'URbZvpCEmuUUC1nV8gxS');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('TK5Kgf9NMDvWO73r5Onm', 81, 397, 6, 'SQIFHjluYp0l5ywQFVwX', to_date('17-05-2010', 'dd-mm-yyyy'), to_date('25-09-2013', 'dd-mm-yyyy'), 'MjIjksLCelbm28Qdy6WP');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('IXLoCQIDwQZOAHUFC86C', 26, 471, 8, 'FHMUmhrgRP2c1PtXzAmo', to_date('10-04-2014', 'dd-mm-yyyy'), to_date('16-10-2017', 'dd-mm-yyyy'), 'zDgIJPQdL8GGwqwK0V16');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('XQkanGduqGvx2X8cYa52', 45, 426, 9, 'HbQCszKmMD4uWSzrdKDb', to_date('27-11-2022', 'dd-mm-yyyy'), to_date('09-09-2017', 'dd-mm-yyyy'), 'oomeI7Up6JG8xzrWgnfK');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('U8EpBXYaDLdsQdw3ME9M', 35, 407, 5, '3gvpsmc5Sig0zNgOo7Bq', to_date('24-05-2005', 'dd-mm-yyyy'), to_date('09-01-2017', 'dd-mm-yyyy'), 'B7jQnmLgW8uWvavZxPjB');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('tzhMeoUrxhUkDtCNNwhB', 42, 201, 0, 'njLJvSthGUfN7sgiQx8A', to_date('21-07-2023', 'dd-mm-yyyy'), to_date('01-12-2019', 'dd-mm-yyyy'), 'sFndpugPui5tXpt6YYx9');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('JivykJE9vWlpRA6FnVTh', 19, 633, 8, '6Tq8H9rUuUZiwlmwgTjj', to_date('07-08-2016', 'dd-mm-yyyy'), to_date('05-05-2005', 'dd-mm-yyyy'), 'Y9HXcL1QChTmZDgedQjk');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('UP7tr6dIw2S5yvBFspmC', 56, 817, 8, 'XK7jozo5cK1sS1d6sE30', to_date('22-09-2015', 'dd-mm-yyyy'), to_date('07-04-2001', 'dd-mm-yyyy'), 'Od9bF4Pu6MY2vd7kfVd6');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('KtalCCZK0c7PcSGuCKC4', 24, 815, 8, 'tuNJ96kOkOZvoI4w0DfP', to_date('22-05-2014', 'dd-mm-yyyy'), to_date('05-05-2011', 'dd-mm-yyyy'), 'E0Yq0zVhkZ27SpqCY98A');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('K39oeBrfobN9hmdhPFzO', 42, 775, 2, 'P53bqfOW3o152W77uKAO', to_date('26-09-2023', 'dd-mm-yyyy'), to_date('15-09-2015', 'dd-mm-yyyy'), 'CqISXYeIqQ7CaHBWXrjh');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('f0dHSSgrBKcvJEwYeBws', 44, 194, 5, 'iyiE2rK6xbMEHKcUIq3V', to_date('23-11-2008', 'dd-mm-yyyy'), to_date('03-05-2002', 'dd-mm-yyyy'), 'GshITokihJBpZsSZOzYE');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('GJj4hdcomVffJTLKsqgA', 27, 763, 3, 'MTdGzRcy8WP4R4bNZCSm', to_date('26-04-2004', 'dd-mm-yyyy'), to_date('04-02-2004', 'dd-mm-yyyy'), 'Ep7dKvxAaJeGrX7GG2q2');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('sAdbjLCWS0DToL9KHoDX', 19, 664, 5, 'EORN81iY2wIvaqNUMBqM', to_date('27-03-2002', 'dd-mm-yyyy'), to_date('24-08-2009', 'dd-mm-yyyy'), 'ikGTTsflR655gdwg5rO2');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('K5wi6p7HDshC9IHttdt4', 31, 631, 3, 'VJzfTdTcGTEPHZUvoMth', to_date('26-04-2015', 'dd-mm-yyyy'), to_date('02-04-2019', 'dd-mm-yyyy'), 'VqKDM9XPLAdZqad4uNgd');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('FmJ3a1B4Jho5sp0FEvCA', 65, 6, 5, 'i9M0huyap5DdMf6GDcmV', to_date('05-03-2003', 'dd-mm-yyyy'), to_date('26-02-2011', 'dd-mm-yyyy'), 'b8e9Ga4BMPqvteLAeHri');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('vNcAXeKVfFRjuFrgpmgj', 61, 908, 6, 'PmS0agzx6x8TXicXgM0F', to_date('08-04-2011', 'dd-mm-yyyy'), to_date('11-09-2018', 'dd-mm-yyyy'), '7oEgYbiq7kcjiv0jC4zp');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('QeKJbfTGbDiziKfYs9wl', 62, 58, 0, 'wbzzG4rHfq0TVl9Rb5Fo', to_date('23-07-2015', 'dd-mm-yyyy'), to_date('12-07-2001', 'dd-mm-yyyy'), 'b4JnYrEykP5IwkILr1ue');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('k0FpngVkGBsNNPgjlxot', 24, 981, 7, 'pXLX3Le1ReDEEFDC78dw', to_date('04-04-2022', 'dd-mm-yyyy'), to_date('16-07-2012', 'dd-mm-yyyy'), 'u9d5bLa04TNUPLhDfvNx');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('5n5plfO7Uw7qrQbnlRvt', 25, 209, 4, 'EBuUPVP4ZoN0PR17RUNf', to_date('23-03-2010', 'dd-mm-yyyy'), to_date('15-11-2002', 'dd-mm-yyyy'), '8iptaIr8mJOWZqjD3Bb8');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('lRlekapedBaa3h6tI8ZK', 63, 533, 8, 'V2uuywrIruvVQt5HBoC8', to_date('25-12-2017', 'dd-mm-yyyy'), to_date('07-01-2021', 'dd-mm-yyyy'), 'Yy55IptDeT5ikwHjsQ2b');
commit;
prompt 300 records committed...
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('HIV0JOjZ7XiAxZ5DjkdH', 62, 160, 1, 'yXj1njidFklBG1b1yu0P', to_date('03-05-2012', 'dd-mm-yyyy'), to_date('06-04-2017', 'dd-mm-yyyy'), 'LLAvGyQnvutCxag2AHPx');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('MGjVO1zDbAO2w73oBrkc', 58, 579, 4, 'gZhHef10XdcW0ggyryGi', to_date('12-02-2014', 'dd-mm-yyyy'), to_date('02-01-2023', 'dd-mm-yyyy'), 'sd1P1ojw0S12cQKM3Yt2');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('8M1r72yes1gmdKxRBaBm', 32, 958, 8, 'DvH7lqY6hdwbA0YtbXoE', to_date('18-04-2018', 'dd-mm-yyyy'), to_date('26-03-2006', 'dd-mm-yyyy'), 'JWFB76mtwsY9FXd3CiFd');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('wEmcZaCaV8tdcxprUxvy', 72, 684, 4, 'QtZrsO9JQtWhBLHMf06Q', to_date('11-09-2000', 'dd-mm-yyyy'), to_date('02-05-2023', 'dd-mm-yyyy'), 'NWE0HpQIV575uSi5F2ot');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('4Nqp1niQNTpZbYr1wbni', 89, 491, 9, 'ZECdJL8gINYrmAuD1J0N', to_date('16-07-2019', 'dd-mm-yyyy'), to_date('07-01-2011', 'dd-mm-yyyy'), 'Ixx23pvUPcHhN7OrXpci');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('pmR9fMfU2cgbYBqXuFUo', 3, 201, 4, 'AuPktugEnlz9dQyLMESW', to_date('04-12-2016', 'dd-mm-yyyy'), to_date('11-09-2021', 'dd-mm-yyyy'), 'zrWEM12yzjVbgvVURrgf');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('HqtiVl893v66wt9a8LYu', 82, 404, 6, '0u4R1saP7aC3BpPbAMpF', to_date('21-06-2023', 'dd-mm-yyyy'), to_date('06-10-2012', 'dd-mm-yyyy'), 'ZRj8oHooXYzYcePdSnV2');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('j5c5IAX7JjRRUp7vwYea', 9, 754, 8, 'qTwdOjy9KGa5AFkKYiF1', to_date('07-02-2005', 'dd-mm-yyyy'), to_date('28-02-2019', 'dd-mm-yyyy'), 'A4L0AmivTgEawgTJpWn5');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('tEAxHDyq3Pe1ixSqvXeZ', 32, 638, 8, 'eUwoviH3jSNnfO25yyIk', to_date('20-07-2017', 'dd-mm-yyyy'), to_date('28-05-2005', 'dd-mm-yyyy'), 'ZlDqvcYKGIxt6q9iTHrI');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('RglXmpisi4NThiRdR0vD', 86, 191, 8, 'hbOIPweixfz7iiNr9MVV', to_date('21-06-2016', 'dd-mm-yyyy'), to_date('03-05-2009', 'dd-mm-yyyy'), '7wkyHw9MF6GnOHUPcvMb');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('4JA1CUueKS9gvHXM3MTE', 18, 123, 5, 'idGIlvAHZ4X2YCrdqDib', to_date('14-11-2012', 'dd-mm-yyyy'), to_date('28-10-2021', 'dd-mm-yyyy'), 'gdYfKRTbhOg9kItgqVhq');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('8ymwd7Cm9aTp4GWUkRYZ', 27, 106, 3, 'sdcVFG55OoUy4769O6JX', to_date('14-12-2001', 'dd-mm-yyyy'), to_date('18-04-2017', 'dd-mm-yyyy'), 'P1OuB2SKSUj60noRecGp');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('4sSFjP8UX7etKczXWMbJ', 72, 330, 4, 'wcDV7tVkjJ9YHF8bAT6i', to_date('08-01-2013', 'dd-mm-yyyy'), to_date('12-04-2000', 'dd-mm-yyyy'), '1q56uX7ZB7N73o4nm817');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('qaiTQ63arfHMx5BaDeF9', 63, 950, 6, 'grqogn0jfrL6BjVud8Vs', to_date('21-10-2008', 'dd-mm-yyyy'), to_date('19-11-2000', 'dd-mm-yyyy'), 'hBqt1cNAHCqmHCacc7W3');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('vwWr9YQj43q4V4OEJnxI', 69, 767, 1, 'aMkbgmEzrCnRzwQBqgRU', to_date('27-05-2013', 'dd-mm-yyyy'), to_date('04-10-2016', 'dd-mm-yyyy'), 'Y8GAG1V2iJpIFPvxbc4G');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('qGk732mUF522gSK767wWk973sNS084aBr734dYs162yHM787jH', 44, 901, 4, 'pQq550zGW848gVO737zKQ329wPr030bDH373hGC253eAP498bR', to_date('28-04-2178 13:26:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-01-2607 19:21:30', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('kTN283zYV335eYI054oRM816dIA887wZv710oUT754yXj164uI', 62, 380, 8, 'kNY513bGZ798lJp462bKf390uWD933fGl597tLA657lVo579qA', to_date('13-11-2152 02:16:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-08-2498 03:42:28', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('lJj388oVL472oXg025yRU894uPm843wMd676qOk112cXc291yN', 82, 4, 10, 'rMN429yNI637gIC721yIr660zSk453qEP718pQX059tCN873zO', to_date('21-06-2969 16:50:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-06-2200 00:27:04', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mXv686iMQ521wZT325rOy639xLS510rDX742dQt251qPW588kH', 54, 522, 0, 'mLV237fXS985wBT362tLT337pSi968vNp116bKt546wJN831iV', to_date('19-04-2194 08:31:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-09-2979 20:02:24', 'dd-mm-yyyy hh24:mi:ss'), 'Portugal');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zJI772pHR328sVa895hLn151rUv379nLE671bWW152rCU912qO', 13, 129, 5, 'dTv991aVK476oWD213iFj458sXt777wFG173mXA810mLp593oO', to_date('24-07-2199 22:08:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-11-2666 09:27:30', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('eQu174hLZ638nQv321jWx583xSY942lGt141iEd042jVl166nC', 1, 753, 6, 'wVT162rYu630gHS699fQG233qGP037iOj773xLD458yRm536cZ', to_date('21-10-2094 20:17:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-04-2716 12:24:54', 'dd-mm-yyyy hh24:mi:ss'), 'China');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('nWe638mSv749zST870kEr690eRZ631wKz432vXk353jUO487yV', 48, 359, 0, 'fWm839tAQ530xKA273qYo770sSg817bNx938mIC866rMi091dY', to_date('16-12-2311 12:15:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-09-2524 17:05:08', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('sFw755dNX120aDE322oGw895qOr157jKB442qBR382rWS972fD', 60, 425, 1, 'dJo125vFV361hZD946vUv791tGv655gOD583bWt695aHh697pU', to_date('04-03-2973 11:50:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-12-2761 12:57:44', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('rOs779vVY140tRp347rUj135fXC397hAx175yTy472nEx452pQ', 50, 229, 3, 'zMg661dJn819lGv389pHp325aUS822jBA262vCx216nUm792xA', to_date('12-03-2784 17:03:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2316 05:12:37', 'dd-mm-yyyy hh24:mi:ss'), 'Australia');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mUy670qYo930uFV753sZk054rOp647tLU757eQa463kRH080uE', 92, 720, 6, 'xNO424wYO429ySU439yFt059nVc741lIb652mQV493oPU446kM', to_date('07-03-3063 21:25:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-06-2265 15:16:16', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('hBB020uYd453bTU846fUy078jGO345kSJ478kSL480fQv366rL', 74, 144, 2, 'fVY354mZN190pDB419oNu641vXh878rQA482vCk015iNl748qO', to_date('28-12-2741 08:44:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-08-2537 15:18:43', 'dd-mm-yyyy hh24:mi:ss'), 'Brazil');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('gAc560wHe537nQl492bZK842gHk011tIU580pRi240cLm738vG', 4, 803, 4, 'jMK048vBH048hLH653jSL628pFF490uVT016nTq020xDJ167iI', to_date('01-01-2444 05:20:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-03-2475 17:26:26', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zHC810bIa428iYm310hQe685fIT821dXn555zLw213uGl595vE', 2, 483, 0, 'oTs953hRp498nSV195nOW344pHR690oIx818hUW341fGF378rO', to_date('03-05-2307 02:51:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-11-1924 11:40:59', 'dd-mm-yyyy hh24:mi:ss'), 'Portugal');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('wYo692lIt785nCa478vYm045nAw414gUt764fXj163nSt580kK', 18, 39, 3, 'iGf163nYX387aLm333zAT673nKf675nIB384oKd391uTH876uN', to_date('29-11-3070 12:19:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-10-2918 09:11:31', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('rOA770sBH123qEo311pQK910iKD413cEp772rDg975fJm652tL', 59, 149, 2, 'eDF058nUD229dTL874cEN814dSV547rUy396kSJ252yGb482lI', to_date('06-08-2468 11:40:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2102 05:19:23', 'dd-mm-yyyy hh24:mi:ss'), 'France');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mYS959lKP876jYK298iEL638bPi663mHz070kCO888sOZ930wE', 83, 2, 5, 'jVG440iDl131mAz478hWp187zCt345tUi089wNs681kJe611eI', to_date('22-08-2048 02:00:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-06-2540 20:23:51', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('pGy324zBB780aTE360jDf468hSQ154jUT321sSs755gYW486zS', 45, 804, 9, 'tAo927gNl829mBm729sNu660bHk386jGT459zFc547zGQ822qU', to_date('29-11-2960 20:14:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-01-2715 21:24:28', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('dYx961nBa541oOG879jPD865uYX930dSF412rQd277gWt933yD', 40, 670, 0, 'pUl474sPX589eHk595zTg694uPf471sPw780dOm166gIe267rC', to_date('13-08-2678 06:19:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-10-2765 22:28:42', 'dd-mm-yyyy hh24:mi:ss'), 'Brazil');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('jAL150gIE119yAo413gLf398cEq919aEv780xHn528sOf387tD', 77, 399, 5, 'rKQ083iLP975cLP468rTC975wRS785nEk628qWK034nPx577aZ', to_date('09-09-2324 11:44:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-10-2794 11:35:22', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('rTc076uDp041wJw497gVQ112uVj662cSi598gAc760uCU679iO', 21, 120, 4, 'kCd634xIi628mNg914tDB727yEa915qBk269yYt689vCe410bW', to_date('04-11-2895 14:21:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-01-2893 08:03:59', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('fRq741xGw011dKZ486tWz016sAa179fQO690mNk561qGG917wR', 14, 984, 6, 'zQg819tPc763dXF716nOf313sKu439aXa887mBR670mKe814mO', to_date('30-06-2333 21:17:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-08-2525 11:00:40', 'dd-mm-yyyy hh24:mi:ss'), 'Netherlands');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('gcZRRWdAL8F2lN2e7K9l', 23, 747, 1, 'MwYieX4xgIRSQ59qTp6w', to_date('26-02-2021', 'dd-mm-yyyy'), to_date('31-01-2023', 'dd-mm-yyyy'), 'mbcUW6f0QhqhTHVpuVgc');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('MGIEhrkGyxdiD8woq97n', 72, 931, 9, 'QtMFaAOaQ8TMphNZh7D5', to_date('01-08-2013', 'dd-mm-yyyy'), to_date('23-07-2011', 'dd-mm-yyyy'), 'tETbKQTTRPEBGZNBVQyo');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Lguo2KKWXFYEgpyoj1eE', 22, 796, 3, 'EEyIgyeT7CwUeWrTaqvm', to_date('26-03-2011', 'dd-mm-yyyy'), to_date('27-05-2012', 'dd-mm-yyyy'), 'NiPwqd7rLrCPwOLU5y9J');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('JwNbiSKcKHdEPy8t1RvP', 10, 998, 1, 'RaaQ3GBYdEx0jsR6LvP5', to_date('03-03-2003', 'dd-mm-yyyy'), to_date('02-06-2008', 'dd-mm-yyyy'), '8sCpt5FWAAfY2AlPAh3T');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('taixM5UCNKyzxI7QdRky', 2, 9, 2, 'n2mtU3Y4CI8Z67eLECaL', to_date('19-10-2008', 'dd-mm-yyyy'), to_date('24-02-2007', 'dd-mm-yyyy'), 'xgGsfgcehLs03LybHCIv');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('VeaAlT3zZXYrD8ewb9GQ', 86, 536, 9, 'DrP9PLdrDEqiULSUDYyZ', to_date('31-12-2016', 'dd-mm-yyyy'), to_date('09-01-2009', 'dd-mm-yyyy'), 'mLxMxtgSChzZ4j8ULaUo');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('8Q0qLjFMnzZHfm8YXj3f', 60, 689, 8, 'csnDyAO7cTirT3pBuhaV', to_date('09-07-2006', 'dd-mm-yyyy'), to_date('13-02-2018', 'dd-mm-yyyy'), 'XSzjTnqzYcn6UZ6nQ8lQ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('suu87hlOAGS2lAI4V6Bx', 69, 20, 1, 'WGMdHdnNeINSVYSPOfXE', to_date('23-05-2021', 'dd-mm-yyyy'), to_date('18-08-2001', 'dd-mm-yyyy'), 'QVbbkkPuQ8lh1C5SsVwk');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('03waK1eR32NJaiv9OjMi', 92, 676, 9, 'z7sLDxgeTPZEGUtyYQnG', to_date('26-05-2012', 'dd-mm-yyyy'), to_date('18-11-2018', 'dd-mm-yyyy'), '1VfBgnjq7d4arawTNBST');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('c2S8bsiiL3bn24KtGpt7', 78, 566, 8, 'CAOLN4ScqDUIDMpkklkK', to_date('27-09-2000', 'dd-mm-yyyy'), to_date('23-11-2021', 'dd-mm-yyyy'), 'hT2ldFVcxPPegtmnqbXr');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('74caJh7t5kpohMcTNeFq', 97, 549, 5, '4FTEt3G1PjULu2tq1mh8', to_date('28-11-2018', 'dd-mm-yyyy'), to_date('17-12-2012', 'dd-mm-yyyy'), 'VcA1fVEywTSDJPhEv38J');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('TSbS7CHdVKjjdItNMd0S', 40, 16, 5, 'OuxFT77oIWsyAtg51dHy', to_date('15-12-2007', 'dd-mm-yyyy'), to_date('23-10-2021', 'dd-mm-yyyy'), '30oIhZIVvNYiXnfzJC2U');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('F7jVxqWEoNO9h0VtgFYy', 20, 537, 7, 'aQp2vvPidLHhYFVHv1OR', to_date('21-06-2007', 'dd-mm-yyyy'), to_date('27-01-2019', 'dd-mm-yyyy'), '3ywutSNPOKBNtuY9rQrZ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('rRkFdDN1FThyxxpF6opE', 26, 877, 3, 'KOmZ01u6qXC4nsLAkIdL', to_date('02-10-2018', 'dd-mm-yyyy'), to_date('16-12-2021', 'dd-mm-yyyy'), 'c8sVI7H8oN1iQhjgASoI');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('1adhoAqYxOfOgrhsC1Ok', 46, 750, 8, 'eH1r1amSb8MBb668bGVo', to_date('22-12-2022', 'dd-mm-yyyy'), to_date('11-08-2004', 'dd-mm-yyyy'), '91mTNRnOZQHDrvIXmIka');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('BbGohXicTujDfD0vS0t2', 14, 273, 1, 'ztzm959zpxejAQ9mP3pH', to_date('07-05-2013', 'dd-mm-yyyy'), to_date('22-10-2013', 'dd-mm-yyyy'), 'LfWsmASyH3GxX367jxzR');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('IwntTcdX6Zsw2cgw1snA', 7, 289, 2, 'rILj3dMNyxlC2YhftAMb', to_date('02-07-2005', 'dd-mm-yyyy'), to_date('08-01-2015', 'dd-mm-yyyy'), 'Rrm12tDtCtS0715W8jJM');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('YJANOrGPs5zmAFtpsgXg', 81, 527, 2, 'uYOLnm9N8Sr6Iap2r2Xn', to_date('06-06-2005', 'dd-mm-yyyy'), to_date('11-01-2017', 'dd-mm-yyyy'), 'uTLfLl4el3hhill2an62');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('0Jo3gNxcM4IB6c2IuLG8', 11, 90, 5, 'Gvzi2j03LRd35yLEer1a', to_date('29-06-2018', 'dd-mm-yyyy'), to_date('27-08-2008', 'dd-mm-yyyy'), '7VQvv2dt1HjiZ11MstuR');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('qNoawCczC5OlmE4Z26Y7', 25, 942, 9, '5fqyFVbKPykC6SWTQg5z', to_date('21-12-2003', 'dd-mm-yyyy'), to_date('21-09-2022', 'dd-mm-yyyy'), 'xsV5nVsfrVJIKVoJgNuD');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('pil3nhkrwRWhH6l0YYOs', 34, 939, 5, 'J62r70kY4Q2nyrYElWpK', to_date('29-12-2009', 'dd-mm-yyyy'), to_date('16-07-2014', 'dd-mm-yyyy'), 'b3qgRvYKV3kh1wOqvA6W');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('LbogDmdLjQIRoimOmWCL', 60, 586, 9, 'ReqUNAFbWAiAcKqQrFvi', to_date('27-11-2014', 'dd-mm-yyyy'), to_date('03-02-2007', 'dd-mm-yyyy'), 'kiHZUR3H9dC4lF2iLeD3');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('9wGuSgD3Vt9olILVkIKE', 13, 189, 5, 'U5Lm5HoGiZfmJojEJdtX', to_date('08-03-2012', 'dd-mm-yyyy'), to_date('16-06-2002', 'dd-mm-yyyy'), '3NjPnSfIJQeQPayXrnQz');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('hqGHjxdb19jKZFxnamGD', 28, 973, 7, '06QNRWqZYA8aUvILirNf', to_date('04-05-2000', 'dd-mm-yyyy'), to_date('02-09-2007', 'dd-mm-yyyy'), '4K38jKBK0yHkFOkPyqMx');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('LBno1oCJmqTidZ2Pl4Jn', 5, 288, 8, 'IsVDnfHFRIwLfhF3maGs', to_date('19-07-2011', 'dd-mm-yyyy'), to_date('29-11-2017', 'dd-mm-yyyy'), 'uqcEcrCw2dEWJyTb7GXQ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('DaND7asHJivTp7rzwvg4', 10, 826, 5, 'Lg9T9Gac7WPtpLzMgfA5', to_date('21-05-2011', 'dd-mm-yyyy'), to_date('06-10-2020', 'dd-mm-yyyy'), 'Zcy3SbJB4iCrwrSeyb6S');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('SAYDluImb3pPRTrg5VGv', 13, 815, 10, 'UIovLAuePCJGBsyiC3D7', to_date('17-02-2016', 'dd-mm-yyyy'), to_date('19-08-2021', 'dd-mm-yyyy'), 'luc0xcY4usU7bPPUvqDw');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('pPd2TEEBLUq8F849OqJL', 3, 207, 5, 'rT5NFk9SlqEjUb12Z3Po', to_date('28-08-2023', 'dd-mm-yyyy'), to_date('14-05-2004', 'dd-mm-yyyy'), '0EaAYZk8sU5FUXTLaAbv');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('HOHpe2VvF5cacXxEP6aQ', 23, 345, 1, '7foH2GQm1hpFCm3nAxQ8', to_date('21-12-2008', 'dd-mm-yyyy'), to_date('13-10-2022', 'dd-mm-yyyy'), 'Z8CojKSkQgYkMez5MVXI');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('tbaCVBp5BWxGqCasNMtK', 86, 631, 7, 'J5RIF17f0inZvu9MViup', to_date('19-04-2002', 'dd-mm-yyyy'), to_date('30-10-2000', 'dd-mm-yyyy'), 'fOitlL0e5kuP2qT7NPc2');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('axMLo7K3sG3eiGSYvUJR', 46, 804, 7, 'Wn9TOWxe9vPcblUKeLqx', to_date('02-05-2010', 'dd-mm-yyyy'), to_date('09-12-2005', 'dd-mm-yyyy'), 'v2kvZqRAf1NjNfRaARDz');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('l2jKtsxoJE32Lw3K9IWR', 44, 544, 2, 'fQVDwv7tIl4NKKswO2a7', to_date('02-06-2008', 'dd-mm-yyyy'), to_date('07-01-2009', 'dd-mm-yyyy'), 'EyXkeKYLx3hWAw3Fmda8');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('1jqIKqiXril5IVVaMQXW', 35, 405, 2, 'VtAt598VJAcbNu0y5jMJ', to_date('06-12-2020', 'dd-mm-yyyy'), to_date('04-06-2021', 'dd-mm-yyyy'), 'SYZFkXLKRXXAecdzGKyk');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Jqbz7yb9fvd0AtTkYFRG', 47, 514, 9, 'ZoZ8cSY5hXWWFgImX2N6', to_date('14-11-2020', 'dd-mm-yyyy'), to_date('07-01-2020', 'dd-mm-yyyy'), 'D60FaKNpQ8JqxX8GQLfc');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Ok2iNOqeLK7Mht1cU2Xr', 42, 102, 7, 'cE5ALlQLo3I68J2pNJEz', to_date('02-07-2018', 'dd-mm-yyyy'), to_date('01-05-2013', 'dd-mm-yyyy'), 'xjEUfNqAXoTOUy4yYukQ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('5vkplOZrcFSUI7FHBymU', 99, 310, 9, '5hPWQHvNs9CNQrRUK5Np', to_date('30-08-2020', 'dd-mm-yyyy'), to_date('26-01-2008', 'dd-mm-yyyy'), 'ieYwWKazdJ3FbtboVyFW');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('1ms0YJp3O5tV4Hg8U2nm', 74, 855, 3, 'TV0lVQR04BuWCIRjDU4H', to_date('11-12-2018', 'dd-mm-yyyy'), to_date('15-08-2023', 'dd-mm-yyyy'), 'BDrZIEnrllMJ8lZkv7W9');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('UvC1WXWQ7HpNbdUmRlI4', 36, 602, 9, 'I8WHkygiMKTmzfqI5FvW', to_date('18-02-2018', 'dd-mm-yyyy'), to_date('10-11-2005', 'dd-mm-yyyy'), 'xxR2KWhuuM1DdnVvm9ok');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('JSds5ZZfvy2jeOYrDmRE', 95, 871, 5, '5b87KU9ePN4BvGSVkCf2', to_date('14-06-2009', 'dd-mm-yyyy'), to_date('01-11-2020', 'dd-mm-yyyy'), '9WtbR4cUYesimujfjm8X');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Ebx8OHOUylvA7yCyqcVJ', 67, 803, 3, '2Z00H5V1xkNwdoP6T0kg', to_date('01-10-2002', 'dd-mm-yyyy'), to_date('25-12-2017', 'dd-mm-yyyy'), '5vEtX8BTLU8TZdl4D7lE');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('P8N8jKvpXHS2SkYyoywX', 4, 795, 7, 'WWco1gRdMK84IUmwUvh2', to_date('17-06-2001', 'dd-mm-yyyy'), to_date('06-08-2002', 'dd-mm-yyyy'), 'pzBQJFlvYRPAamPbMRp5');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('iUrQTOuiEerSNBu2fRwl', 28, 567, 9, 'gtJMYmgccmWGdknxWljD', to_date('01-03-2000', 'dd-mm-yyyy'), to_date('09-04-2015', 'dd-mm-yyyy'), 'WcpIAVfrMHsZ0djtyPHh');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('nPMTBkpvTHSOSiOvrQ4V', 74, 683, 6, 'C182A2XHPk0hTWLTxvYV', to_date('04-07-2005', 'dd-mm-yyyy'), to_date('06-04-2022', 'dd-mm-yyyy'), 'tLOwFaLpSKtQ78XOqnRo');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('yQy2iOglB0TRdr542CF0', 8, 764, 7, 'yXcSOVcTTnN4tOaQENt6', to_date('29-05-2022', 'dd-mm-yyyy'), to_date('17-05-2011', 'dd-mm-yyyy'), 'OTWvIK5HWuAB5Ll4fvRZ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('tVOu7elknmjeugppbxzF', 66, 530, 9, 'R2Htuy1mw1SNvLnj71NN', to_date('09-02-2015', 'dd-mm-yyyy'), to_date('09-01-2005', 'dd-mm-yyyy'), 'by7vEbX1vVEs0H260V7H');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ue99B6PYz245TKKjz2rz', 31, 788, 6, 'WhsrUC21mrorZ72BQCy1', to_date('11-04-2003', 'dd-mm-yyyy'), to_date('15-09-2004', 'dd-mm-yyyy'), 'MwVUtzlkbGrupVsNxFEu');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('hSBwN8GHbyMj1QHf1Cfb', 33, 731, 1, 'XUd2dOcAwPYEKzpySP2d', to_date('08-12-2012', 'dd-mm-yyyy'), to_date('27-09-2009', 'dd-mm-yyyy'), 'TUZ7UkVjTbnnjGZuqXET');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('W3E1u8wzgHxpSdA6wKQy', 98, 182, 2, '4s3tMF4eI6Wa9U8A4agV', to_date('03-03-2005', 'dd-mm-yyyy'), to_date('05-06-2015', 'dd-mm-yyyy'), 'MdNpgTupAVtCisTxXKFE');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('N2qkhDjBLYFkFi3Nc7J4', 87, 832, 5, 'JilPvwLMTZ8H6CPP1fcr', to_date('10-08-2018', 'dd-mm-yyyy'), to_date('13-09-2020', 'dd-mm-yyyy'), 'YEwduF5Wr5ZChxabEmcO');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('bhBGMe4oQgy3gRuKR5Vv', 14, 550, 9, 'hWa7gmcF7LXt8lUjSkZb', to_date('06-03-2004', 'dd-mm-yyyy'), to_date('25-09-2022', 'dd-mm-yyyy'), 'NGFNx6BCnZXnKTYjD5fk');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('SIun5dtcWiMAFUGHde7L', 58, 36, 9, 'RtaAfH57Y4kLshMhcP2N', to_date('19-01-2008', 'dd-mm-yyyy'), to_date('12-11-2006', 'dd-mm-yyyy'), 'CpZF2BHeaF5C6KI5IloP');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('86Uq6e89HvfY4LsJZ4MZ', 14, 80, 7, '8cXDEVENZTp07qxqvxP9', to_date('25-07-2010', 'dd-mm-yyyy'), to_date('03-07-2017', 'dd-mm-yyyy'), '6xQjJiKuhagRzjTNVYn6');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zWvlaMh6wOerD8Y21xSp', 4, 854, 6, 'MFKWlybDxWoaUmCeZqE8', to_date('05-06-2016', 'dd-mm-yyyy'), to_date('07-07-2001', 'dd-mm-yyyy'), 'cDrVCuFTkhxhlE6f98Ry');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('0ZQYyEw1hziwapcIOk27', 23, 20, 6, 'qR2FibGDPvD8hCSqAUXS', to_date('21-04-2013', 'dd-mm-yyyy'), to_date('08-11-2011', 'dd-mm-yyyy'), '1Mv69OQmCTdfGDjmnVcj');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('yWl3WN9siPaJi2Z6pnof', 53, 408, 7, '6POkRW1drHDmyysJXMHf', to_date('20-05-2018', 'dd-mm-yyyy'), to_date('15-06-2013', 'dd-mm-yyyy'), 'L1IPtFqUfdtcKGy4rE5a');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('BkAH3p0qDmSCUZZzh6PJ', 66, 946, 2, 'NTRX0RmyuRHdoUkwFPwn', to_date('22-07-2010', 'dd-mm-yyyy'), to_date('07-11-2019', 'dd-mm-yyyy'), 'e2DRps21Ejksy7zWT84T');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('oXEAf31vqiIEpLO8yLoj', 15, 877, 3, 'nWXsJyC5ye5QqMhUirC3', to_date('12-09-2012', 'dd-mm-yyyy'), to_date('18-04-2008', 'dd-mm-yyyy'), '0zT32cKCm436ZbKUUfiK');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('EYR7GAgTP9MMEvkJ5MYh', 15, 906, 7, 'o1MCkoTKy8dpHyjkhALJ', to_date('15-10-2014', 'dd-mm-yyyy'), to_date('28-06-2021', 'dd-mm-yyyy'), 'W2804H2UJVgwRTbcgPX2');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zOqe8rixCSCX2y5Q2WcK', 95, 654, 5, 'Ex21Io3ZRNrK9i9UDRCM', to_date('08-12-2016', 'dd-mm-yyyy'), to_date('02-04-2006', 'dd-mm-yyyy'), 'QpWd1HD6eS3CgZqF0d24');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('EIde7t33WtR0BwUsYVhV', 92, 357, 5, '0maSEmuJMwk1fc5iylSV', to_date('22-02-2001', 'dd-mm-yyyy'), to_date('01-12-2022', 'dd-mm-yyyy'), 'zpIwpLUryXjBkgG1KncW');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('266vJzSxhiQuNahai51g', 97, 186, 2, 'Lap6enXUjUV8AqNXXu1y', to_date('26-04-2009', 'dd-mm-yyyy'), to_date('01-09-2023', 'dd-mm-yyyy'), 'EJSt0rrYhKlsT6fFeS6t');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('MIuJ0FxwxxW9AGkX4ZOs', 85, 635, 4, 'IZPOR52T5SBk862xTSyl', to_date('07-08-2015', 'dd-mm-yyyy'), to_date('13-04-2002', 'dd-mm-yyyy'), 'tqAMpefGfZDufrC8b8hi');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('5lSqVCcK15N64mcLyiDJ', 89, 415, 5, 'IoqVEh4ZWFzo3YPdJxUz', to_date('09-02-2004', 'dd-mm-yyyy'), to_date('27-12-2013', 'dd-mm-yyyy'), 'CIqHE2zlqOcQ5kxvPYbu');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('aDYTi3L1mNibzyM8Udlj', 9, 867, 7, '50HRVViLbmrcll2fYttI', to_date('29-06-2004', 'dd-mm-yyyy'), to_date('18-02-2022', 'dd-mm-yyyy'), 'SO6tgV3Cv3rKESfCpYcE');
commit;
prompt 400 records committed...
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('V3EW32tbdE5X1kQkAGpw', 28, 555, 3, 'KGoTBrkoka4jQmbPPHze', to_date('23-01-2000', 'dd-mm-yyyy'), to_date('18-10-2020', 'dd-mm-yyyy'), 'd1hYrUkZEnGaPdnIthc5');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('GW16pJRdfKNQHkAjIHO3', 61, 1000, 8, 'xhvZwL3yBOaiN4b0TK3l', to_date('08-03-2008', 'dd-mm-yyyy'), to_date('15-02-2015', 'dd-mm-yyyy'), 'Z0q62IOHNlmTk03LIkX3');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('J9Ffg4FlHZ7VvDClaBUd', 79, 537, 7, 'NsGRkS0JqakpinFDzDuE', to_date('20-01-2018', 'dd-mm-yyyy'), to_date('21-07-2013', 'dd-mm-yyyy'), '8wEiT4gtCvm6YxMOX03v');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('9477DIDeOEpGNzKOzYkf', 83, 604, 6, 'zgwUNJiDTOJWrhjms8vR', to_date('15-04-2007', 'dd-mm-yyyy'), to_date('12-02-2003', 'dd-mm-yyyy'), 'CY2fk12DTMVjqjk6KvgN');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mOP9h8yVvarJEIOX2Oeh', 5, 452, 8, 'ukT01E0jjBi4hhvxjwrR', to_date('06-05-2004', 'dd-mm-yyyy'), to_date('12-05-2001', 'dd-mm-yyyy'), '77l0m29EEzKEHvbqTke1');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('1qwJUVGC5Hrr06VZdYu2', 35, 254, 10, 'vMD6jVxxG81gm9bNMlDi', to_date('20-06-2014', 'dd-mm-yyyy'), to_date('23-05-2011', 'dd-mm-yyyy'), 'JMZzNCmsQiS79RIAGD2N');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('PzUB7gNJMXPtIqPpm9Ub', 81, 65, 8, 'N6X2JreNoSbndrDqOlfN', to_date('16-04-2018', 'dd-mm-yyyy'), to_date('23-03-2000', 'dd-mm-yyyy'), 'Ax14FOp6GXa90gzmIBv3');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('S4wDWarUREDZzOoKjRWl', 29, 455, 1, 'oStCx3VImitgRbN757Ek', to_date('27-04-2017', 'dd-mm-yyyy'), to_date('31-08-2020', 'dd-mm-yyyy'), 'jvwPl7uDNLH8CUg0Rcv6');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zw5VW4FoetCvncqfqI8U', 27, 74, 8, 'bncctkjbfdvOwO0Ukjln', to_date('25-02-2007', 'dd-mm-yyyy'), to_date('21-12-2010', 'dd-mm-yyyy'), 'M4AowlUq8ea8L7KDVDCi');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ilFcS2u5DqpzDjTuV8uN', 55, 946, 7, 'zPOLt0oyOYR9vCuI89tV', to_date('27-04-2006', 'dd-mm-yyyy'), to_date('02-05-2000', 'dd-mm-yyyy'), 'RZJ6A0jbFCtb34fPDpQF');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('LT6ozZFeP8cKKEgsYIVR', 75, 154, 5, 'el6DmVN74gM7uf4LInup', to_date('27-11-2018', 'dd-mm-yyyy'), to_date('13-01-2013', 'dd-mm-yyyy'), '2sCyopenXQk4hLw9VXVV');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('xHmaZn45Kuy3sWIFa2K6', 42, 491, 5, '8kxzOVE2k008fiSsNH1R', to_date('08-03-2010', 'dd-mm-yyyy'), to_date('26-03-2011', 'dd-mm-yyyy'), 'rsGCNjftwejZailnG6YA');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('UuvNPsuhKl6BbVBW77ar', 15, 895, 6, 'RANe2bPzahZExnn5idJG', to_date('22-01-2011', 'dd-mm-yyyy'), to_date('06-07-2014', 'dd-mm-yyyy'), 'sLPxnxOBDyjNOkdtrn1b');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('xHpk7Yx89xGvVRakS5Ox', 96, 332, 10, 'CkDrazdSWzq0dP6yV2My', to_date('10-01-2002', 'dd-mm-yyyy'), to_date('01-02-2011', 'dd-mm-yyyy'), 'asYzKb9YTTSkM0DeaE0H');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('EUBr9OECQRHTtisH4yDX', 47, 421, 10, 'cncrmWw0beWZqs3xUGHl', to_date('25-09-2003', 'dd-mm-yyyy'), to_date('23-06-2007', 'dd-mm-yyyy'), 'YB73SWTJaJdL55Ou34tK');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Tl6ef3EOPrWfEJQZj4l4', 81, 137, 8, 'UdhZRb377jslUO7fTinu', to_date('13-05-2008', 'dd-mm-yyyy'), to_date('17-08-2006', 'dd-mm-yyyy'), 'ZbEVXUfOmEOanZESLTvQ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('3jWxxPOgNosSDx4U6Cto', 95, 582, 1, 'ohntDbJHMaejPML7u2Yo', to_date('18-02-2020', 'dd-mm-yyyy'), to_date('10-10-2005', 'dd-mm-yyyy'), '0qntTEiD2Or01RF7NuA0');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Yj8KvknotzSjPvoWMEug', 92, 81, 7, 'MQzgb6dmEN3lG4SaOGHT', to_date('23-06-2012', 'dd-mm-yyyy'), to_date('26-04-2014', 'dd-mm-yyyy'), '7c9knyARvNdFpgjr2xTv');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('PAr23O76JA3lmocncdku', 92, 437, 7, 'pBiS3LvwixZ5MYtAWdi1', to_date('19-02-2002', 'dd-mm-yyyy'), to_date('15-10-2012', 'dd-mm-yyyy'), 'wYw1al5778sHDGCTNTus');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('TDrY6r5Ed1SkDkJvf1rS', 43, 636, 10, 'sHAIma4TrN2c2dVh6EBf', to_date('15-08-2010', 'dd-mm-yyyy'), to_date('23-02-2017', 'dd-mm-yyyy'), 'y6QrS8sVuRq8sLYT4miR');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('AmlSVEC34t6kft4dp9mT', 74, 38, 2, '6MGbJG4i4GnB0c2RLEAh', to_date('12-02-2001', 'dd-mm-yyyy'), to_date('30-04-2009', 'dd-mm-yyyy'), 'AfOA5i84D8QwZHlCMPvT');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('OxjiLGvCo8fBcaezWnjW', 33, 581, 10, 'Pm714QfWzLvQgmVQsOuV', to_date('31-08-2004', 'dd-mm-yyyy'), to_date('08-02-2004', 'dd-mm-yyyy'), 'raOU8aYscIp79gWXyTOc');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('TEJSDPMWwz4tFjpIP8XE', 7, 515, 8, 'Oiqc7TQXHeQphxXXdkXS', to_date('23-09-2013', 'dd-mm-yyyy'), to_date('06-05-2017', 'dd-mm-yyyy'), 'u9jjirs2nvPtFM7pa0SC');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('i2geAWtR7xiVgX1zjiJA', 89, 581, 10, 'mn9JKofX5QtWoN2CT0Qx', to_date('21-03-2010', 'dd-mm-yyyy'), to_date('26-01-2011', 'dd-mm-yyyy'), 'ktMIw8ykcUXMpQxBFkwE');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('BYsYqbqkNlJKR73SnCYr', 79, 272, 6, '5t2GmGLqlppg6teyr9vQ', to_date('26-11-2005', 'dd-mm-yyyy'), to_date('06-07-2020', 'dd-mm-yyyy'), '3njW55jXnXuBey9zoQKY');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('YFvzR6EXWS7poGrvXd8D', 77, 367, 2, 'zZ7AzXqFIt3FqG7DlhB2', to_date('04-10-2003', 'dd-mm-yyyy'), to_date('13-03-2019', 'dd-mm-yyyy'), 'l0KTbY5mKVnnrGoUaRpd');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Iq1HwvJrwLT06xPL2Cj8', 92, 915, 8, 'mXOT9piWCY4CsLuzYLS6', to_date('16-05-2013', 'dd-mm-yyyy'), to_date('22-11-2002', 'dd-mm-yyyy'), 'G5I3gkqvVw70vYvPR10N');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mzDOJN7jZHZE4gD2LD11', 31, 338, 1, 'ChUA0tSAG7Dv1AWzGTOA', to_date('16-10-2016', 'dd-mm-yyyy'), to_date('04-10-2020', 'dd-mm-yyyy'), 'TsimU8Oj0qFBZPBCpTRJ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Jkl88ZPcQHL8I6QHzV4E', 83, 330, 6, 'IpWjxjoixRko0Nz9VqNN', to_date('14-11-2019', 'dd-mm-yyyy'), to_date('28-06-2011', 'dd-mm-yyyy'), 'Xk7DNUvLvCsq58wHR5Yf');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('uJ5ry4skrj9wkDHsDCSC', 21, 829, 7, 'AdEhesNB2fY8W0GJXg7f', to_date('27-08-2009', 'dd-mm-yyyy'), to_date('06-01-2007', 'dd-mm-yyyy'), '866GoFfryyKyC2x3xFFh');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ZUcHKS0IPEywzGt0xpMy', 14, 765, 4, '9JwnBN5zhPt1Y0VDZQO1', to_date('28-09-2001', 'dd-mm-yyyy'), to_date('27-12-2013', 'dd-mm-yyyy'), '7WmzLjbSgbDApvLUXmMr');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('f9EodZex5QTDySGP8Nph', 84, 331, 5, 'bNMtNT0HbvKlYpf1UeX0', to_date('11-12-2007', 'dd-mm-yyyy'), to_date('31-01-2013', 'dd-mm-yyyy'), 'rw9Ap5G1rdXQAQJkTEwo');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('NRqa7pMYcRLiBJ8JMizf', 66, 449, 9, 'h6Qa6DmKcJwDh6xl8DTh', to_date('17-02-2006', 'dd-mm-yyyy'), to_date('01-11-2000', 'dd-mm-yyyy'), 'yDEyPIIJQDMUvMqtoFYR');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('aG8voTCFXY7NrGcQraj3', 89, 177, 5, 'UUtN6RNoEVUKjId2SFvZ', to_date('16-05-2004', 'dd-mm-yyyy'), to_date('31-10-2006', 'dd-mm-yyyy'), 'jlyMM18If1jOTO58rU36');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('cD7b4H2mTqKMYoDXBY7h', 26, 862, 6, 'vej4LanL9DuQw8GA2EQk', to_date('11-08-2012', 'dd-mm-yyyy'), to_date('09-03-2021', 'dd-mm-yyyy'), 'CLC0q5f8dZVbFTO6Ikvr');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('HUt0FRkONZs6L0v6ivT4', 23, 202, 3, 'hTuJy44BfVz1la5AetGR', to_date('23-06-2017', 'dd-mm-yyyy'), to_date('17-12-2001', 'dd-mm-yyyy'), '9CsyX2OI9DOhllMd4GV5');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('4FxHJhoLndEU5FNaDx0m', 3, 668, 10, 'N2vOkuABJ7PhYxdD9COY', to_date('13-06-2000', 'dd-mm-yyyy'), to_date('27-03-2021', 'dd-mm-yyyy'), 'HvKS6CJ0j1kZuDvns6hv');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('6TZmHHpk2WVslp0R3Cv2', 14, 435, 6, 'soZr1daKBaPwpxfRACgc', to_date('21-06-2017', 'dd-mm-yyyy'), to_date('02-12-2019', 'dd-mm-yyyy'), 'JcA5uuQ7KRssjsLhtFdI');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('KaRXwIQ10WUwfKhv1zKD', 5, 678, 10, '7TNOgAlsi5eNuUVE4k0z', to_date('03-04-2007', 'dd-mm-yyyy'), to_date('30-08-2018', 'dd-mm-yyyy'), 'fqKQBjClSpC9neKb2dUL');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('8ky3Sl1DwKH5dw0iuwwL', 69, 1, 5, 'RVi0pauvdWYaE2LxQimx', to_date('18-06-2012', 'dd-mm-yyyy'), to_date('05-03-2005', 'dd-mm-yyyy'), '6paIqKeJacq0DylDt8GN');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('q0O5KYLHRwWhRUoLkDKb', 46, 137, 8, 'JYo6MS7b3pwMj99HMYbl', to_date('27-08-2011', 'dd-mm-yyyy'), to_date('27-10-2002', 'dd-mm-yyyy'), 'C2bvKRk52qkYxebPifNW');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('NcN9uzVhApOauO58dmBo', 95, 760, 8, 'pOCEBQYUd9mS1GlsrpjY', to_date('21-06-2013', 'dd-mm-yyyy'), to_date('28-10-2023', 'dd-mm-yyyy'), 'OJEHomZHZhCdIUrCMoue');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('fxECb9BGRqheA5NTqOO3', 41, 24, 1, 'bO4CxQAUirTD8yZjbZHm', to_date('09-08-2020', 'dd-mm-yyyy'), to_date('26-04-2022', 'dd-mm-yyyy'), 'oM052lOHb89JoqNAPz0j');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('18lDbm0F0pT08L9pAb6P', 79, 143, 9, 'St3GtqMudBphPLciSrUD', to_date('13-10-2004', 'dd-mm-yyyy'), to_date('07-12-2016', 'dd-mm-yyyy'), 'kPVwsuV37CAHV5lG8hfz');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('wJ3teaaxVAYF6nwBL2G0', 53, 170, 4, 'yPcgngmrZg6CywbVr6dr', to_date('03-04-2016', 'dd-mm-yyyy'), to_date('29-04-2008', 'dd-mm-yyyy'), 'jr6UdP4RVtUrC2ZexDRr');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('crl0r3cxurK0rQUDFJpW', 38, 999, 8, '3W9BIpYN4FYhXKnEDEoQ', to_date('18-10-2008', 'dd-mm-yyyy'), to_date('05-05-2009', 'dd-mm-yyyy'), 'lDJ1rYeJ02gzqchfKBiQ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mAOgjTnXclwq7ypjwa0Q', 66, 513, 6, 'wFkFwbxRd4ioYBcqx34J', to_date('23-03-2019', 'dd-mm-yyyy'), to_date('12-11-2020', 'dd-mm-yyyy'), 'dLOEmFgA3aDHJJwoyPBN');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mtFJ2r1Hk4tvEEQWtA86', 75, 266, 4, '3qeD9MK0IN9WppLS49P1', to_date('03-10-2017', 'dd-mm-yyyy'), to_date('06-08-2001', 'dd-mm-yyyy'), 'SofPKb1AFnS1Ob3N0nnN');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('qNTbsfMluCqN9TD5EQCc', 26, 510, 1, 'iS55JoWxTh1tPVPYPg96', to_date('16-04-2000', 'dd-mm-yyyy'), to_date('11-10-2016', 'dd-mm-yyyy'), 'dbz8TmnzLdYVKJsnPyTb');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ux61GdY3kzAfPVFXgeej', 95, 270, 3, 'G0LPY9G5dhYJISLB5q1a', to_date('30-05-2006', 'dd-mm-yyyy'), to_date('08-12-2005', 'dd-mm-yyyy'), '0Wzitrl3fsKfhnei7QBL');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('GJuUmCFHCM3Unltrgguu', 33, 126, 1, 'p1yVGechxYz5cNnGeIri', to_date('22-05-2002', 'dd-mm-yyyy'), to_date('16-03-2017', 'dd-mm-yyyy'), '8zsACCPTauzGcnjLnudW');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('961KcZSuRAqBJwu9xLS7', 65, 471, 10, 'uyTzJQOnZgbFViOdP4Iy', to_date('07-11-2001', 'dd-mm-yyyy'), to_date('05-10-2021', 'dd-mm-yyyy'), 'OGfyyDaNCYaBb5usQLLo');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('2Fj2QuBEU3QmP8qSMBHV', 72, 901, 2, 'na1iF6DHqG9gfxLjtQ7v', to_date('28-06-2010', 'dd-mm-yyyy'), to_date('10-02-2017', 'dd-mm-yyyy'), 'tRR4bbIAh7veQWhNHaMa');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('D6QqOw7wtKoGkeiK03sD', 96, 1, 7, 'qZJIdlEdO9ng3IaLa1BA', to_date('15-03-2013', 'dd-mm-yyyy'), to_date('01-11-2001', 'dd-mm-yyyy'), '85s8jJFY7at31ZE7g9FN');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('wKxAxjSm2zHtUNeTFwLY', 84, 999, 6, 'ixWGvNwzjVxPsWO6r2LS', to_date('15-05-2000', 'dd-mm-yyyy'), to_date('09-10-2002', 'dd-mm-yyyy'), '2K1REDZ1azEAjXWJjTDv');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('qnbT3LiFB47ohxiEC32F', 6, 454, 5, 'Y8f1XoK7d8wg5YFroxmC', to_date('19-06-2012', 'dd-mm-yyyy'), to_date('06-11-2000', 'dd-mm-yyyy'), 'mulQv8Dn9BiH7zws9THJ');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ba48G3Z8AXtI5qJXo3jP', 93, 410, 4, 'rbCuTVjFSU5ew0gZj1sf', to_date('04-03-2017', 'dd-mm-yyyy'), to_date('31-07-2004', 'dd-mm-yyyy'), 'qxz7291y4GmRhgvWhvzY');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('QIAXByuJoFsAfbUqOsVX', 100, 546, 7, 'CZtZyaszJn6s8DWeO7I7', to_date('11-04-2010', 'dd-mm-yyyy'), to_date('23-10-2014', 'dd-mm-yyyy'), 'y21u1QMqk1MB91IVvNhC');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('eneDROYPYETYgPpyC1eW', 4, 299, 2, 'MOC63c4ou67QwyLHPN1F', to_date('09-07-2012', 'dd-mm-yyyy'), to_date('22-09-2023', 'dd-mm-yyyy'), '3KXN2AGs45pxSP2ad5wx');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('NN9ZyAYw8bUbN1MVOQ9L', 19, 982, 4, '6RzH4vL0aEAhtDhu9vfl', to_date('10-06-2022', 'dd-mm-yyyy'), to_date('30-12-2010', 'dd-mm-yyyy'), 'o7bKVX6BonXbswX5ciz0');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ZAyUUUDhSPJBcRqcYvAM', 88, 763, 2, 'P1tTE9c0Jff6n9R24kVl', to_date('03-06-2009', 'dd-mm-yyyy'), to_date('04-05-2001', 'dd-mm-yyyy'), '7rZTp3kak9AASSzFLQIm');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('e4YaXX8nIEpOCmvo7bmm', 98, 747, 2, 'Az3TioI9w2eqHz9okFRM', to_date('17-11-2000', 'dd-mm-yyyy'), to_date('02-04-2013', 'dd-mm-yyyy'), 'jXdm3L4RGgdvaC3egcFo');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('UpHsnKtDiVqnOfOKB5XK', 12, 400, 4, '8j7VIl3ftcI0J5dcJyhw', to_date('30-11-2005', 'dd-mm-yyyy'), to_date('21-12-2019', 'dd-mm-yyyy'), 'cS39bkEePnSJPtqXTeu0');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('rpZjfphQDAyInd4S9Mg5', 37, 346, 6, '5GmmAZiAzZZVM9OEzgPY', to_date('19-05-2008', 'dd-mm-yyyy'), to_date('04-11-2022', 'dd-mm-yyyy'), 'qwZpPZQI0k3xt0Vgufp8');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('x5R5A0nCmkR1z7Gpq7M4', 1, 641, 2, 'fZLRxg6TUvDLMT7aTvTK', to_date('03-07-2013', 'dd-mm-yyyy'), to_date('27-05-2014', 'dd-mm-yyyy'), 'UerOYcv06nWAVKozJCJI');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('yDA8k3t9c1pPRwC2dI7Z', 70, 911, 5, 'EzCDugnYCQvJytuma7xD', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('08-12-2002', 'dd-mm-yyyy'), 'q7CzQVlDt4yaJ4KdytAC');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('fYwwVbkWl38WdlUdur6B', 76, 362, 9, 'G9maL19byKbMIaUJdfbQ', to_date('06-08-2011', 'dd-mm-yyyy'), to_date('23-02-2006', 'dd-mm-yyyy'), 'C9iUYfzGirrT43hC7lSm');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('jB9CA4SIKdE5adCZJnUD', 35, 193, 10, 'w9gKh7MTfKCwkxKH1gek', to_date('19-11-2006', 'dd-mm-yyyy'), to_date('20-10-2016', 'dd-mm-yyyy'), 'WRVhLO2A0T7eZXIyFcqK');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Q9AlgKi2VQPgvULqdZaQ', 89, 61, 4, 'NSH6xVBeXK8HByJMpDRn', to_date('18-06-2013', 'dd-mm-yyyy'), to_date('19-07-2020', 'dd-mm-yyyy'), 'aESA7XtZ8CuGOzOfq7FF');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('dgfQMidJqzdP6IuSo4Fz', 22, 42, 8, 'MGgaEL25sYtTACil09Hh', to_date('17-05-2017', 'dd-mm-yyyy'), to_date('24-10-2011', 'dd-mm-yyyy'), 'KaYvdPDPF6HEkYmPFg4A');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Dt7CfR13I5QPel8AMwLL', 31, 379, 4, '08s7dcAgicYtlwnWLFS2', to_date('17-04-2020', 'dd-mm-yyyy'), to_date('28-06-2015', 'dd-mm-yyyy'), 'rUPAnyfAsiLY9F1fVntm');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ombfWRm1sjIGOuObKz5K', 61, 975, 8, '50QHRFnhhMvDpH6U0k6q', to_date('10-05-2003', 'dd-mm-yyyy'), to_date('11-01-2017', 'dd-mm-yyyy'), 'XvZSONy6xxJXr4UfAdv7');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('oXmV4VXMBsj6fvgvsHe5', 53, 831, 9, 'dO3bTunXwidGKXhKvxIX', to_date('12-08-2005', 'dd-mm-yyyy'), to_date('03-10-2003', 'dd-mm-yyyy'), 'uuCdVmjXeAGdFFtp8ViU');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Yzgyp2lGDUpXsjQRyIRp', 22, 68, 4, 'l7u3ZtA1XYlwzyhoc110', to_date('16-06-2010', 'dd-mm-yyyy'), to_date('27-05-2012', 'dd-mm-yyyy'), 'hR7FFw1ddq1WlmhG1TIX');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('W7KIfUx9l5hEDYjKtoE1', 50, 773, 10, 'x2PuvzbtSyQgYiPCBKAX', to_date('20-08-2001', 'dd-mm-yyyy'), to_date('21-08-2012', 'dd-mm-yyyy'), '8EzuOcZuIv7uyVwQMDvu');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('L9n4mU0n5851cf7t8Bpk', 36, 46, 4, 'RXCfgK3a1v28tJbUhYBJ', to_date('23-04-2022', 'dd-mm-yyyy'), to_date('03-02-2001', 'dd-mm-yyyy'), 'X9IFX9uaYbY1Kb4dwvrP');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('H3Nc5J7LvhMKZBGMIrXx', 58, 117, 8, 'HDKQBhFZV0mVVZLJUr37', to_date('15-05-2012', 'dd-mm-yyyy'), to_date('27-12-2003', 'dd-mm-yyyy'), 'pCAj2d64odOjSGizXAOf');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('mBZGQYHw4Lh1Mk1potaP', 26, 486, 1, 'QDZ27h3a3dPVydjqokAt', to_date('17-10-2022', 'dd-mm-yyyy'), to_date('24-02-2017', 'dd-mm-yyyy'), 'phkprMDfpu2QEA7cgXii');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('VvQmjJJqAGZ0RUbEH0lB', 3, 266, 5, 'u61GURC3QQ16NCt0Zd31', to_date('21-11-2019', 'dd-mm-yyyy'), to_date('02-04-2013', 'dd-mm-yyyy'), 'WUu5heXHpbLqJNWxGDUp');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('frT7nZPCsgY6FX1ejPAO', 78, 765, 4, 'xPEVVZB4M6HXcg6qDGwr', to_date('01-07-2014', 'dd-mm-yyyy'), to_date('13-12-2016', 'dd-mm-yyyy'), 'm45MNyYlD9dMXms0rI45');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('L7HBFaQ53xlaYpAtWHA2', 24, 798, 3, 'Yeie1OQsN9bSZhS9KLZq', to_date('27-01-2003', 'dd-mm-yyyy'), to_date('11-09-2005', 'dd-mm-yyyy'), 'RuTjRwQ7lHYIYrXHIfIT');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('zVz4eeNfmee9f7eOeR3H', 4, 708, 7, 'Q8pIJS32eYUKzKMZ9ZUA', to_date('01-08-2010', 'dd-mm-yyyy'), to_date('16-02-2019', 'dd-mm-yyyy'), 'AsQ3Q46cZY2ENZNjKLyD');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('3JwIU9dGEKtdyfH8LY5w', 30, 474, 7, 'RoTCaXQL8BItLNTXWtpf', to_date('09-09-2020', 'dd-mm-yyyy'), to_date('12-06-2005', 'dd-mm-yyyy'), '8kvOhth70mKwh5jTnAR0');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('U7cNBtzHmA1wGJNJZEf9', 26, 704, 8, 'SCizqrp4mJ2o3qMtAoI4', to_date('02-05-2019', 'dd-mm-yyyy'), to_date('11-01-2003', 'dd-mm-yyyy'), 'vGDKxnEahk4jRfpCO3bX');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('wuiubA2UJzRYBJSqEtA8', 30, 736, 2, 'TcHLlpR8HCQt93zStT4a', to_date('19-09-2006', 'dd-mm-yyyy'), to_date('01-09-2023', 'dd-mm-yyyy'), 'Phs75Hd9DpEmcxC6gKqY');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('wn8wfPdTijFqufjshKHp', 75, 544, 2, 'JCmpsfLvJZN2w96hBt3q', to_date('14-04-2013', 'dd-mm-yyyy'), to_date('02-09-2005', 'dd-mm-yyyy'), 'VszNW960JLeXrBokuQjP');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('RkSWMbV50bWkqkbQfZvf', 18, 124, 9, 'FqMU2R88FDr0VFGdlMio', to_date('14-08-2018', 'dd-mm-yyyy'), to_date('14-05-2017', 'dd-mm-yyyy'), '26eXmaCxzSX0kZMYhdnR');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('rCtYfzy2lJ9ZD7fVWsm3', 33, 164, 10, 'bRNtRnI6DMWVzkjuSqWm', to_date('03-08-2008', 'dd-mm-yyyy'), to_date('21-02-2018', 'dd-mm-yyyy'), 'WjqmpUM2QtwU7HoULABz');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('MHRvIrODdBxuL6zAA3BZ', 49, 876, 9, 'notPLLJHtfo2KJu8Ggh5', to_date('30-12-2008', 'dd-mm-yyyy'), to_date('24-12-2009', 'dd-mm-yyyy'), 'KtYSAbf6MgOSbP3tDSDy');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('TR5OYgsUMAVdpgn386Es', 4, 296, 6, '7rcgEJWFDXefr9rYaz5H', to_date('10-04-2011', 'dd-mm-yyyy'), to_date('13-09-2017', 'dd-mm-yyyy'), 'OVHO1ePf2zKQ6RKTSaOF');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('P1vRpYpPQoI0MPZUaKDi', 48, 401, 4, 'FuYTuc2FzevsUjsy21DR', to_date('25-06-2021', 'dd-mm-yyyy'), to_date('14-08-2015', 'dd-mm-yyyy'), 'j2yDmayIsXeYnETUG8G2');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('iEvYsrJUPtxeeovrkT9x', 2, 366, 1, 'Yjvcq9rJ2wwo17EXWI4R', to_date('19-09-2011', 'dd-mm-yyyy'), to_date('15-09-2004', 'dd-mm-yyyy'), 'dWkKbD37CyQDQJm1xzw6');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('K4nA7xpbSyhKrXhOU41q', 37, 287, 3, '0cDO6kCINS4HFb07dSgb', to_date('27-10-2016', 'dd-mm-yyyy'), to_date('26-05-2016', 'dd-mm-yyyy'), '2y4H8yYPF5Qwmc6KRUWX');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('1suLrYsJRcaafbQpdMGg', 70, 450, 7, 'LJan3vMVtx84DVeJEQ7W', to_date('20-10-2000', 'dd-mm-yyyy'), to_date('21-04-2007', 'dd-mm-yyyy'), 'K3b0vaGGPacUwohlModf');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('9PyHTF9fiOIenl9xT7Jm', 58, 421, 7, 'Qq4q1N60Ys8gGGd3OcOy', to_date('23-11-2003', 'dd-mm-yyyy'), to_date('27-11-2003', 'dd-mm-yyyy'), 'dklJB3LlhEykWVsEOVlL');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('Z6Aj5az3BIJTTMyW3a9b', 67, 939, 9, 'NxpuEbcI3g0pkgwAc7Hv', to_date('11-02-2020', 'dd-mm-yyyy'), to_date('25-08-2001', 'dd-mm-yyyy'), 'Y37yXUcKXFVQGlVBvvQg');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('ZGckr2KcIcxuHCyY8ou7', 18, 360, 5, 'UWsfxedUIGhwdkzZjtlc', to_date('04-05-2018', 'dd-mm-yyyy'), to_date('09-05-2014', 'dd-mm-yyyy'), 'GmWMMAivBZuGwwNOofce');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('pOmuSefuIvJ5x8b6Bg26', 14, 431, 8, 'nLgv1Nko2VAPp8KI2W2t', to_date('15-02-2007', 'dd-mm-yyyy'), to_date('25-03-2016', 'dd-mm-yyyy'), 'BJCqGiTiuIjPwfvJ6cY8');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('X7PaplqOITK3SWmboFgB', 80, 526, 7, 'eJXTzSh7AF5IneroERhN', to_date('14-03-2017', 'dd-mm-yyyy'), to_date('11-08-2015', 'dd-mm-yyyy'), 'cO4BwoEyK1qBQvX3p5Gs');
insert into DEVICE1 (deviceid, devicetype, seriesnum, versiond, manufacturer, purchasedate, lastmaintenancedate, locationd)
values ('M8n9wcIrzzgr5K0U4eYI', 93, 548, 10, 'f4UfRR4MO3JxOB360sQE', to_date('23-11-2014', 'dd-mm-yyyy'), to_date('05-04-2001', 'dd-mm-yyyy'), '6l3McgujjK93FCsn8IoZ');
commit;
prompt 500 records loaded
prompt Loading TEST_TUBE1...
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('H8ktArK1AnIvAtq03y4U', 96, 120, to_date('08-11-2018', 'dd-mm-yyyy'), to_date('10-03-2028', 'dd-mm-yyyy'), 'MpvyxHodFEigX6zH4F5u');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('dChUi6PSTAJhRCzjQsAN', 85, 265, to_date('01-12-2002', 'dd-mm-yyyy'), to_date('17-03-2029', 'dd-mm-yyyy'), 'smEjqu7O6aoLiAVLiuoT');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('A5NRtouv7ZerCjg237Cq', 17, 111, to_date('23-05-2020', 'dd-mm-yyyy'), to_date('08-02-2025', 'dd-mm-yyyy'), 'bKMwV5zntXsBwjr2jcSJ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Vhh703tZIp1tZ7GoZbWX', 37, 491, to_date('24-04-2011', 'dd-mm-yyyy'), to_date('12-10-2024', 'dd-mm-yyyy'), 'HkoPkerdANrHiXUBECuA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('JqRwnCoajVpsABi4gxMR', 18, 226, to_date('19-10-2012', 'dd-mm-yyyy'), to_date('18-12-2027', 'dd-mm-yyyy'), 'CGLOY3fqaEgGli4tLELw');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('zcrI7A63twgdCHKsuT2H', 5, 412, to_date('20-12-2008', 'dd-mm-yyyy'), to_date('03-10-2026', 'dd-mm-yyyy'), 'Ky2Xi6Ry0ZtNhlGVWSLI');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ptvv82QPFbguhmsnEy9z', 47, 15, to_date('25-02-2003', 'dd-mm-yyyy'), to_date('04-06-2024', 'dd-mm-yyyy'), 'ZGXIbZ3ajWwICyk5dF80');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('FlTT0RqNpde2JSJsJKAA', 42, 48, to_date('05-07-2023', 'dd-mm-yyyy'), to_date('15-09-2028', 'dd-mm-yyyy'), 'OHGOl2tgAuE8AP0kEZDQ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('QSxJWOWO3fEEG1y28qIX', 61, 396, to_date('12-10-2008', 'dd-mm-yyyy'), to_date('28-04-2028', 'dd-mm-yyyy'), 'Vs2Fhp3i26wqwF5hgrdu');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('XI3XRPtYHKabmukzDEWF', 2, 371, to_date('16-02-2017', 'dd-mm-yyyy'), to_date('28-04-2030', 'dd-mm-yyyy'), 'c0otUUTQ3Y6A4pagr0ak');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('PavPQnL8aEA37uJGpXo1', 46, 236, to_date('08-02-2013', 'dd-mm-yyyy'), to_date('11-06-2027', 'dd-mm-yyyy'), 'ZjryWjiMaAOZIUXGrk99');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('haJGW8xrSkojpvjV73ut', 12, 449, to_date('24-01-2014', 'dd-mm-yyyy'), to_date('01-07-2030', 'dd-mm-yyyy'), 'WXxc6m6HOliEVb2UfDxb');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('7zKQ7H5Ts6xyP1BZrIMo', 69, 230, to_date('26-05-2000', 'dd-mm-yyyy'), to_date('28-12-2028', 'dd-mm-yyyy'), 'fSYsGTsXEUVMfvKeOfus');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('8ncliBh8AHMCzngq6uLR', 33, 302, to_date('17-03-2014', 'dd-mm-yyyy'), to_date('15-09-2030', 'dd-mm-yyyy'), 'QlRErUwfBlGkf69Hr9nS');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('XkTyAwOJ0Oiw3sGFN6nA', 87, 28, to_date('01-04-2011', 'dd-mm-yyyy'), to_date('17-10-2024', 'dd-mm-yyyy'), 'aBVyG1V7gGsfTan6LIbP');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('oq75G8kqnARB5K45q8aX', 31, 279, to_date('08-05-2017', 'dd-mm-yyyy'), to_date('01-08-2027', 'dd-mm-yyyy'), 'V4tcbypPqoIFHVNUKnYQ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('9AKU1sOifumqJ5De4jEg', 70, 141, to_date('05-07-2004', 'dd-mm-yyyy'), to_date('22-07-2025', 'dd-mm-yyyy'), 'rZfPNboOVo7ZGhzo5Ouf');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('nQ8gmbidKOWFKMHwaR3H', 73, 250, to_date('16-10-2014', 'dd-mm-yyyy'), to_date('04-06-2027', 'dd-mm-yyyy'), 'EszFFooFYgPQCfO0uB4m');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('5nXNQf6ObnCxIhAoCivv', 53, 33, to_date('03-09-2012', 'dd-mm-yyyy'), to_date('12-08-2028', 'dd-mm-yyyy'), 'uJMX6hBU2rGqfqhMJEtE');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('kxfK9AbomBjLgF9kdiOc', 31, 308, to_date('17-10-2022', 'dd-mm-yyyy'), to_date('27-12-2030', 'dd-mm-yyyy'), 'w7HEoOdIM9c4nlZ4Coht');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('1zysUx3C9PgvvpBQ9rOk', 45, 460, to_date('01-02-2010', 'dd-mm-yyyy'), to_date('03-05-2029', 'dd-mm-yyyy'), 'S4vFvZkWzFoPrnPdZY7p');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('sDwGAVOln5uKYqyWtdRw', 46, 374, to_date('11-03-2002', 'dd-mm-yyyy'), to_date('11-02-2024', 'dd-mm-yyyy'), 'GjKMMrl462tgYj0pfChK');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('hpjAcODbiQEFS7HIsCI0', 85, 238, to_date('14-07-2000', 'dd-mm-yyyy'), to_date('14-10-2025', 'dd-mm-yyyy'), 'Y3c90GmurDDG77H2igao');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('T9O4rjXZ4K7P3zzrKeDS', 29, 354, to_date('15-03-2007', 'dd-mm-yyyy'), to_date('07-08-2029', 'dd-mm-yyyy'), 'ehcWY7OwzdesXlwJ4vHl');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('xA3mXaUkmjwtxAQrq52q', 53, 403, to_date('23-08-2004', 'dd-mm-yyyy'), to_date('18-06-2024', 'dd-mm-yyyy'), 'aUdz32LUXfL6HeCkROGB');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('PUclfzwvsUZFh7PaXxzp', 60, 450, to_date('24-10-2000', 'dd-mm-yyyy'), to_date('12-09-2027', 'dd-mm-yyyy'), 'Qx4FdpoD0HmruMPR11A1');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('EgR9JFkvwTBhL83hiaFt', 65, 51, to_date('14-12-2023', 'dd-mm-yyyy'), to_date('14-03-2028', 'dd-mm-yyyy'), 'ncfamw5V9u5kozmukY24');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fmVCIzQf3MmpJ9sZb2h4', 56, 153, to_date('07-05-2004', 'dd-mm-yyyy'), to_date('10-10-2024', 'dd-mm-yyyy'), 'hWcGuweYVr7XMg32w5yW');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('VE5cNYoVJ80qrhYcb5B7', 74, 34, to_date('26-08-2001', 'dd-mm-yyyy'), to_date('11-07-2026', 'dd-mm-yyyy'), 'gBKV5pTbFmjd9zlWWxom');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('kI2eLQnGZVKaXR0NHeVc', 72, 442, to_date('07-08-2010', 'dd-mm-yyyy'), to_date('04-07-2027', 'dd-mm-yyyy'), 'wv4tF8e2BfPRfnHnchJw');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('L0rtOBx3dPfxaXFPlCqr', 67, 228, to_date('04-11-2002', 'dd-mm-yyyy'), to_date('01-07-2026', 'dd-mm-yyyy'), 'dRCLOG6l8BXsQmAUOSsD');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('naymfyIKvn8oMVNCJlHm', 64, 323, to_date('24-06-2003', 'dd-mm-yyyy'), to_date('11-08-2028', 'dd-mm-yyyy'), 'velZAPHdV9wjjPBp6yCw');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('OurZyOvGhG80NKPdYoUO', 37, 34, to_date('22-10-2009', 'dd-mm-yyyy'), to_date('15-03-2028', 'dd-mm-yyyy'), 'qCIvB4ouV0iDIGBbsxVR');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('xwGfUtfegJiCYGSOcgWF', 56, 91, to_date('18-12-2007', 'dd-mm-yyyy'), to_date('02-05-2028', 'dd-mm-yyyy'), 'nHRRAyjgJgLFzaZbq2fT');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('teMeyrsxOR5tSJowNZTr', 42, 142, to_date('26-01-2000', 'dd-mm-yyyy'), to_date('21-10-2030', 'dd-mm-yyyy'), 'qE7fav7Jp7wVT5h3oJR9');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('0S1irtW8ZvrJKAFubwYd', 49, 66, to_date('02-01-2022', 'dd-mm-yyyy'), to_date('10-06-2030', 'dd-mm-yyyy'), 'RKIiuLMQkAJrR4Q0Z481');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('cgN26MS8ewLttg7cBvRn', 84, 2, to_date('04-03-2021', 'dd-mm-yyyy'), to_date('20-10-2026', 'dd-mm-yyyy'), 'UL68FelhuxInHhqtNuJD');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('IycmfkUJHH38ZietIpJN', 38, 92, to_date('19-10-2023', 'dd-mm-yyyy'), to_date('18-06-2029', 'dd-mm-yyyy'), '9tVpZFlUJ0ukGTSKqeWE');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('zk7UO9EOX1WAZC0642g7', 63, 84, to_date('02-08-2001', 'dd-mm-yyyy'), to_date('16-01-2026', 'dd-mm-yyyy'), 'xt73OQA6uSQE9FO6WCp6');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('G6b5aidMelw2bQY4Kvyu', 28, 269, to_date('01-06-2004', 'dd-mm-yyyy'), to_date('03-10-2027', 'dd-mm-yyyy'), '23gIRGEtIgC6Z6ZA5Wfx');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('yoRhD2mxeEMlf8XUBMEA', 81, 118, to_date('18-02-2019', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), 'FiUFr9S1pbm71jsV4bzR');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('tDike6zaa3tF3nGspYtR', 58, 221, to_date('13-06-2003', 'dd-mm-yyyy'), to_date('13-10-2028', 'dd-mm-yyyy'), 'VttmtfF2L9fHe1Mc1LO8');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('48Ujnm4GgrM9jEHzhbpe', 80, 158, to_date('20-02-2013', 'dd-mm-yyyy'), to_date('25-11-2025', 'dd-mm-yyyy'), 'FfZFXWVHvItNRLytgXOU');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('mvRGFgz04a0QsraJcq99', 36, 132, to_date('14-09-2005', 'dd-mm-yyyy'), to_date('11-06-2026', 'dd-mm-yyyy'), 'IZf5p0TGxrmoM6fbhozo');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('PlZV6B3pQyg98okwSns8', 4, 214, to_date('14-07-2013', 'dd-mm-yyyy'), to_date('14-10-2026', 'dd-mm-yyyy'), 'YcYevxp9M397Z57soVU9');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('XBt22H5gf225pgiZx72Z', 6, 407, to_date('16-09-2018', 'dd-mm-yyyy'), to_date('10-02-2029', 'dd-mm-yyyy'), '1gSAodMiNKxL6TTTV98G');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Bxfr0bdpgQD03eOspdU9', 31, 121, to_date('06-02-2013', 'dd-mm-yyyy'), to_date('16-08-2030', 'dd-mm-yyyy'), 'CSeFXgCl6NyY4DRxGxlz');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('w8TL1GdNWOVf0IrTL3WA', 85, 276, to_date('08-03-2001', 'dd-mm-yyyy'), to_date('01-05-2027', 'dd-mm-yyyy'), 'Zuh9PcS1GW2BN02wA70J');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('hI14CMd5QH2J067uF8WY', 47, 239, to_date('28-02-2011', 'dd-mm-yyyy'), to_date('07-11-2030', 'dd-mm-yyyy'), '08YR4CWfPlfXHjEafOYA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('nCjs4vyxnNZULKfVD1mj', 24, 192, to_date('05-05-2012', 'dd-mm-yyyy'), to_date('13-08-2026', 'dd-mm-yyyy'), 'BtIFILa93WqFjrEaDwjU');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('m4XEBouZeuybMyIpkcWc', 71, 148, to_date('26-09-2023', 'dd-mm-yyyy'), to_date('22-09-2027', 'dd-mm-yyyy'), '60JnfhyFPFY60vXZypk3');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('U7RCqAOUqz7FdoiEfBiz', 11, 436, to_date('03-07-2009', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'), 'wJXpivER2Ic6MwiS0Otw');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('qPLMlLhpuSTGG8k4w6CW', 92, 487, to_date('06-03-2003', 'dd-mm-yyyy'), to_date('25-03-2025', 'dd-mm-yyyy'), 'VY21eCtpXsrMjL43xG9Z');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Tp5lqMcbXylXvtXPoTt4', 3, 238, to_date('02-12-2001', 'dd-mm-yyyy'), to_date('10-06-2026', 'dd-mm-yyyy'), 'DsFuVi7Anv8TTRouFFVS');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('wbkr9JCAsoj5ixFhWuzn', 69, 458, to_date('03-01-2022', 'dd-mm-yyyy'), to_date('18-05-2028', 'dd-mm-yyyy'), 'TjhQOzN8aClcyJlDlHVL');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('qaIQssMdmMnL9BAPR5dR', 95, 196, to_date('23-05-2020', 'dd-mm-yyyy'), to_date('23-05-2028', 'dd-mm-yyyy'), 'EmAfaP9xn0WktoXkzJZy');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('7oIWIe5uK7gkYJVtl6ZO', 98, 445, to_date('06-11-2023', 'dd-mm-yyyy'), to_date('26-10-2030', 'dd-mm-yyyy'), 'Byozp7eEdIRlKQkwnsW8');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fNWv6AEV7TCY4rVHnzu1', 83, 88, to_date('25-02-2010', 'dd-mm-yyyy'), to_date('13-03-2025', 'dd-mm-yyyy'), '1ISsQRwrnZvMyG9eXuz3');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('3tD22HU6WJsLx6BV02Ge', 11, 194, to_date('22-12-2007', 'dd-mm-yyyy'), to_date('24-04-2026', 'dd-mm-yyyy'), 'anFLUMB68GVQR0MfpBsp');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('gSHuXdpqBKCQjXzBItv3', 4, 292, to_date('13-02-2018', 'dd-mm-yyyy'), to_date('16-02-2028', 'dd-mm-yyyy'), 'V6myZwJJNkvzDlY98qgN');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('UWQVWcUtsZBJskTWAp7n', 77, 174, to_date('03-05-2022', 'dd-mm-yyyy'), to_date('10-09-2027', 'dd-mm-yyyy'), 'yhtFSIA6nhTk5e8cUkeR');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('eMsqSjjqdHBc2PUOsHaE', 57, 403, to_date('14-09-2021', 'dd-mm-yyyy'), to_date('03-08-2025', 'dd-mm-yyyy'), 'rzFXCQG8Sd2P95PjETxL');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('F5ZqC646NM31gft5jpNw', 35, 377, to_date('17-09-2004', 'dd-mm-yyyy'), to_date('20-06-2025', 'dd-mm-yyyy'), 'SCZ4RlRYlksc7HoRfBv9');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('SPoiWutNENGhkAmM6SU7', 18, 76, to_date('24-04-2004', 'dd-mm-yyyy'), to_date('11-10-2029', 'dd-mm-yyyy'), '7GNJ033WJOmVPi4ECAeR');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('jmzRPEjeauDDSp0vnBYa', 25, 355, to_date('17-01-2016', 'dd-mm-yyyy'), to_date('27-03-2029', 'dd-mm-yyyy'), 'zobtgr63P1gWQVMhcdFn');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('X8lGC8JyK0l4sTcC5OT9', 64, 225, to_date('07-03-2020', 'dd-mm-yyyy'), to_date('19-11-2024', 'dd-mm-yyyy'), 'e9i7nr34y7YOfw3OhHzH');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('v1EYGyPcag4VCAoT1nE8', 60, 149, to_date('14-05-2019', 'dd-mm-yyyy'), to_date('27-07-2027', 'dd-mm-yyyy'), 'Mb9MWxug0fJZUGOovgYo');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('NN7ikPNnqnBaKcl8VsVg', 74, 285, to_date('28-01-2000', 'dd-mm-yyyy'), to_date('16-01-2024', 'dd-mm-yyyy'), '90iUSZvGOWlhDHdKDDgd');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('MYWmDoTF7SGwCBFHcMLr', 87, 89, to_date('12-08-2006', 'dd-mm-yyyy'), to_date('11-08-2024', 'dd-mm-yyyy'), 'd7worAqr5s7XuhHbVWoH');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('aiV9KjwbE6FSpmLV91pR', 96, 484, to_date('06-07-2007', 'dd-mm-yyyy'), to_date('21-06-2029', 'dd-mm-yyyy'), 'c8lYuhV2mklLuZGY5PrQ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('gpKCZnHsxk5S5qg0QmPw', 90, 265, to_date('16-10-2015', 'dd-mm-yyyy'), to_date('11-12-2027', 'dd-mm-yyyy'), 'mSciDu6uYLvLGl4nbnMR');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('L2B3t8qr95OnOFWKsZr3', 50, 270, to_date('05-01-2016', 'dd-mm-yyyy'), to_date('11-04-2027', 'dd-mm-yyyy'), 'QMEZh0J5gVqkhN4VRD8i');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('b6ofRO73TKaIKgUUKHDy', 58, 55, to_date('17-09-2014', 'dd-mm-yyyy'), to_date('21-12-2026', 'dd-mm-yyyy'), 'YDFddq4Y9iVXrA1xmBXB');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('PvhlCcLdgBicPFqH6eDV', 25, 455, to_date('02-10-2020', 'dd-mm-yyyy'), to_date('14-05-2030', 'dd-mm-yyyy'), 'iYw0S4bcUzG2ZXwxId5C');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('uNoaFhirclTDhiUinJCt', 46, 97, to_date('07-02-2005', 'dd-mm-yyyy'), to_date('14-04-2028', 'dd-mm-yyyy'), '2ytMnuKtvHbJwN68POf0');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('5IDYsIcbZYYI46Kbq7Dk', 48, 267, to_date('28-06-2011', 'dd-mm-yyyy'), to_date('25-09-2024', 'dd-mm-yyyy'), '0ZftpgJBxQi1c9Pbv6jB');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('yRrZHlmdtLgmpytIr86Y', 82, 318, to_date('19-12-2018', 'dd-mm-yyyy'), to_date('01-12-2029', 'dd-mm-yyyy'), '8sXEtG9QFCsTv8Tgi8SZ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('nKA3pAPA99v9u40kB3MX', 12, 299, to_date('23-06-2005', 'dd-mm-yyyy'), to_date('13-10-2024', 'dd-mm-yyyy'), '9JdvdQYC64O2X5HWSZVf');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('jmHkeexmOfKS72wRfDFB', 63, 169, to_date('04-09-2023', 'dd-mm-yyyy'), to_date('04-03-2026', 'dd-mm-yyyy'), 'b4eIFOY4plxWjRTsl86f');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('1NfJrsIomgbIGVGnHOv5', 83, 129, to_date('20-02-2010', 'dd-mm-yyyy'), to_date('13-10-2028', 'dd-mm-yyyy'), 'FeWSffD2o9qf2zUfNYqI');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('iFy6lSrrnaH8rxIatqEv', 56, 92, to_date('14-09-2010', 'dd-mm-yyyy'), to_date('11-03-2025', 'dd-mm-yyyy'), 'WC6DkWFYDiy4v4EsvcGF');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('pAWlYSsAxAUqphVStjoS', 95, 326, to_date('06-05-2017', 'dd-mm-yyyy'), to_date('22-03-2024', 'dd-mm-yyyy'), 'rWR0tTKtlxBaxFERTWcm');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('WP91tHXZOg3ZeIYlMXLo', 97, 354, to_date('18-09-2019', 'dd-mm-yyyy'), to_date('27-10-2028', 'dd-mm-yyyy'), 'HSnIK985mLPL6XSGtr2t');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('LAFiIaBVBHjEcWZ4J0B7', 88, 55, to_date('17-04-2011', 'dd-mm-yyyy'), to_date('15-03-2024', 'dd-mm-yyyy'), 'Erz8mF9OzHOdiXNZN1e1');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('L5dE7FynxNtPPDHbtZaG', 90, 443, to_date('19-12-2020', 'dd-mm-yyyy'), to_date('04-05-2024', 'dd-mm-yyyy'), '701T4VnCiRJnwAARD8SI');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('naaNrqAF6bgJRoF8UtMu', 68, 198, to_date('06-10-2000', 'dd-mm-yyyy'), to_date('09-03-2028', 'dd-mm-yyyy'), '45C9ub71OtzEmnxC03ka');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('QM4uL0gVwHFhOn1wSYc1', 48, 175, to_date('05-04-2020', 'dd-mm-yyyy'), to_date('09-11-2026', 'dd-mm-yyyy'), '54VL37XsVKaNFWVoGjXL');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('VNwsLupyvMtoUUJlLKOc', 45, 433, to_date('07-12-2016', 'dd-mm-yyyy'), to_date('07-02-2028', 'dd-mm-yyyy'), 'Ig4xSyQE78q2hhKMfCa8');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ceA7JgXopKkLgAEj2Irq', 14, 318, to_date('04-06-2010', 'dd-mm-yyyy'), to_date('03-10-2025', 'dd-mm-yyyy'), '3r0d0oORXoeMMPP2hSE1');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('JJxecv0MvcZMGORGS10L', 3, 458, to_date('15-05-2003', 'dd-mm-yyyy'), to_date('06-06-2028', 'dd-mm-yyyy'), 'id3a90QFALMl7GvyQUP0');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('J2wjcUvUAemDfUq4GNtH', 73, 4, to_date('01-04-2015', 'dd-mm-yyyy'), to_date('05-08-2025', 'dd-mm-yyyy'), 'G7Cg9a4czjMxgQumY8TT');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('BPx7Q5ajQgDyaymXyyhe', 56, 499, to_date('19-10-2017', 'dd-mm-yyyy'), to_date('10-01-2025', 'dd-mm-yyyy'), 'zu0FHfeGPqroleRNF1J8');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Wv49749z7jNScREAGe1p', 40, 50, to_date('19-02-2011', 'dd-mm-yyyy'), to_date('24-03-2030', 'dd-mm-yyyy'), 'jaBXuJyYMxWDjyJ2Ca6z');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('8RT3K3L6P8UZ46S7at2Q', 58, 267, to_date('05-03-2017', 'dd-mm-yyyy'), to_date('22-04-2026', 'dd-mm-yyyy'), '2Wpkl7Qs1X9CutlkNuu9');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('oVwX2AWItmmF4fjwoFFp', 39, 366, to_date('27-12-2006', 'dd-mm-yyyy'), to_date('23-09-2024', 'dd-mm-yyyy'), 'qWXpfXkEzqOC6dcgGgSy');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('JxE5j304rlCRFGWi4IyV', 32, 70, to_date('20-11-2004', 'dd-mm-yyyy'), to_date('19-11-2027', 'dd-mm-yyyy'), 'fWGY4Mg0Tkw5wFVgPDkm');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Jh82ywEAJjT2ROdOG4G3', 62, 317, to_date('28-12-2023', 'dd-mm-yyyy'), to_date('07-06-2030', 'dd-mm-yyyy'), 'HjoLQ8BZ0IfcwL13GHHy');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('NHCoKKLvMFvHOPUBKy0a', 7, 167, to_date('16-07-2002', 'dd-mm-yyyy'), to_date('12-02-2025', 'dd-mm-yyyy'), 'TQcIE65XbRPJIExglbIO');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('lBRbmATMkqcDQKg8zGW9', 2, 132, to_date('22-05-2007', 'dd-mm-yyyy'), to_date('08-12-2024', 'dd-mm-yyyy'), 'bVRXngKsRhXOzjQJ3HLE');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('6xV8faS2aPTedSKyoRPj', 78, 148, to_date('02-06-2011', 'dd-mm-yyyy'), to_date('14-12-2029', 'dd-mm-yyyy'), 'PIYhOrYhZTDI18a7AhX2');
commit;
prompt 100 records committed...
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Qpo2PcIecvGZXZjOmICP', 92, 65, to_date('23-04-2004', 'dd-mm-yyyy'), to_date('17-07-2024', 'dd-mm-yyyy'), '0hqZGy0654AWqKszPNUf');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('6rHNo7t4UY9nDidTpQAF', 78, 302, to_date('04-01-2023', 'dd-mm-yyyy'), to_date('10-04-2026', 'dd-mm-yyyy'), 'L6QKpdfBelSacNOJPlxa');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('s7ybUQ6bHZZr4ndIngEQ', 71, 65, to_date('03-03-2015', 'dd-mm-yyyy'), to_date('27-12-2026', 'dd-mm-yyyy'), 'onx8MJwg1EjpfYulHvK4');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('5pD1xi8D6MbP7JtP2M2o', 18, 384, to_date('01-05-2008', 'dd-mm-yyyy'), to_date('18-05-2025', 'dd-mm-yyyy'), 'jOpGc1igEIF4RoTQ6CBF');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('QMZ62f6VFxAj9ae0V0mR', 96, 94, to_date('06-06-2004', 'dd-mm-yyyy'), to_date('14-12-2025', 'dd-mm-yyyy'), 'VmtAG9k3PRjSFkCFpMtX');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('O72Pw4SUwOVzez43kX7l', 28, 156, to_date('04-04-2022', 'dd-mm-yyyy'), to_date('10-04-2004', 'dd-mm-yyyy'), '9bXZB813VosN1Pu4F7i8');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('vwRNxbfdCl0qClxbUcpd', 52, 254, to_date('07-09-2014', 'dd-mm-yyyy'), to_date('15-07-2010', 'dd-mm-yyyy'), 'fAz2t1LgULZtMcl53bvL');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('A1Fb3Gqy6k2t9opZI5mt', 59, 114, to_date('11-08-2012', 'dd-mm-yyyy'), to_date('23-12-2017', 'dd-mm-yyyy'), 'nna4pztDkPPSJTFXpuVT');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('CJb8jKU5oUy04EYQVvGv', 88, 80, to_date('03-07-2019', 'dd-mm-yyyy'), to_date('10-09-2023', 'dd-mm-yyyy'), 'jCRLwTL9uQB9RzJxdZSX');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('BjTPS3fYTgjN90kKtIY2', 96, 169, to_date('19-06-2012', 'dd-mm-yyyy'), to_date('12-04-2011', 'dd-mm-yyyy'), 'F1bFfYUF1novbgrSn860');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('gJoVmv2Jfq8xZ34p3TmK', 57, 176, to_date('10-11-2018', 'dd-mm-yyyy'), to_date('05-12-2018', 'dd-mm-yyyy'), 'OrJ3rqughONiFs8WDSoZ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('f29aYgWi10GfT6xB9P2R', 18, 310, to_date('25-07-2005', 'dd-mm-yyyy'), to_date('24-10-2028', 'dd-mm-yyyy'), 'tMquRoK90QA0MsbS6SVJ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Vdq9FHhTOaIQIwZQfa1S', 38, 479, to_date('04-06-2006', 'dd-mm-yyyy'), to_date('20-03-2025', 'dd-mm-yyyy'), 'gi3OqftRxMqVGDruhCuR');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('2r4UkRf5ojjh43XffMJz', 88, 3, to_date('08-08-2004', 'dd-mm-yyyy'), to_date('03-07-2030', 'dd-mm-yyyy'), '2kZaktPg3a7Vmm8Z4Xeu');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('w9yW1oIjUOfXDLRKyPlx', 80, 187, to_date('31-03-2009', 'dd-mm-yyyy'), to_date('18-12-2024', 'dd-mm-yyyy'), 'KxUvOFURAMC6cMwf74y0');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('EFLHOg0Wz22l3gqanVHp', 85, 48, to_date('07-12-2011', 'dd-mm-yyyy'), to_date('26-01-2030', 'dd-mm-yyyy'), 'ZgC9rzn9mn038yNtazRK');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('P45NLW99Rt2CXz0CewOi', 93, 55, to_date('19-01-2019', 'dd-mm-yyyy'), to_date('30-05-2024', 'dd-mm-yyyy'), 'RSxujm2c7fYWRgzk7rk4');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ZZf5RpFp91k7LAUBr5Po', 55, 323, to_date('20-07-2022', 'dd-mm-yyyy'), to_date('25-01-2025', 'dd-mm-yyyy'), '5IpUemVlr1nD1Qa0f0eA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('u0SEUk5tYzswaq5DKzlv', 63, 366, to_date('16-10-2014', 'dd-mm-yyyy'), to_date('29-04-2026', 'dd-mm-yyyy'), '2kb13Y2LKipsEydWNdyq');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Yswpy6NyhnbXCtt0NCFt', 48, 349, to_date('29-06-2005', 'dd-mm-yyyy'), to_date('24-11-2025', 'dd-mm-yyyy'), 'RIg08fFKRvVrgQpozS5f');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('eDErO6bU3aL4YbXnB2FC', 11, 190, to_date('24-04-2007', 'dd-mm-yyyy'), to_date('12-11-2024', 'dd-mm-yyyy'), '8Sx6IwnnqwdHLp08SmXP');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('g7MSRp3bm3IW5RCkn152', 86, 397, to_date('03-03-2005', 'dd-mm-yyyy'), to_date('14-01-2029', 'dd-mm-yyyy'), 'YFALkJ71tOvmwQVFiuaK');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('efO53Xeq8v7g4RQ7Tj21', 98, 315, to_date('09-10-2006', 'dd-mm-yyyy'), to_date('03-02-2026', 'dd-mm-yyyy'), 'LLXb0DS1JYRJUCY8cYDT');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('zzwKhNIRjQ8HwJMwUSGP', 99, 75, to_date('07-05-2013', 'dd-mm-yyyy'), to_date('03-01-2028', 'dd-mm-yyyy'), 'pPNJ5dHRv4enrEmAqhms');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Pqqz0nLrXAUWo0k4dorG', 29, 258, to_date('14-03-2005', 'dd-mm-yyyy'), to_date('14-03-2026', 'dd-mm-yyyy'), 'JfgcBQZYgxDH3nuOCXre');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('OA58HDq27zDwl23CPRLk', 71, 110, to_date('22-09-2014', 'dd-mm-yyyy'), to_date('18-02-2024', 'dd-mm-yyyy'), 'TbzTtx8jvQvnYfXaw3Hx');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ykDFnpu65ep3uAPh4ipF', 91, 39, to_date('22-09-2021', 'dd-mm-yyyy'), to_date('16-12-2025', 'dd-mm-yyyy'), 'DDtuMnC4YaBb4V2P9Me5');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('BYrjE2x34aYWpSL09QRL', 95, 150, to_date('28-01-2021', 'dd-mm-yyyy'), to_date('09-12-2024', 'dd-mm-yyyy'), 'Ywi29tqAXsaDxyhujol8');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('xMawiPejBrLSwfaEEy09', 39, 428, to_date('10-01-2016', 'dd-mm-yyyy'), to_date('29-10-2029', 'dd-mm-yyyy'), 'ED0q1s0FiFJNC7SAi8Id');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('nSKDoyaH66th5mrnxdCM', 48, 233, to_date('20-06-2008', 'dd-mm-yyyy'), to_date('25-11-2030', 'dd-mm-yyyy'), '6XVKeVuipB0XaOGdgNkJ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('wxKzHbi39v4jYRzYRl3B', 58, 61, to_date('06-01-2023', 'dd-mm-yyyy'), to_date('10-07-2026', 'dd-mm-yyyy'), 'j8rAOtSHwHk5B5JnNqZb');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('rwmYBgZ8YlNYs4SoxWsY', 8, 270, to_date('18-07-2008', 'dd-mm-yyyy'), to_date('13-11-2027', 'dd-mm-yyyy'), 'P0vsCIhe77XE3xklTNZI');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('1RBaOAEKmPV7GJyyHVcV', 89, 336, to_date('07-04-2023', 'dd-mm-yyyy'), to_date('20-10-2029', 'dd-mm-yyyy'), '7i7KyeZBGrTnKIOuFddg');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('vrIhwcInaNYxw6P3lLqI', 12, 246, to_date('27-04-2016', 'dd-mm-yyyy'), to_date('05-07-2030', 'dd-mm-yyyy'), 'e9iucbAeFCXFTu5aI4Fc');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fFtF1uOV3sM0jQzA2QnN', 90, 370, to_date('17-10-2007', 'dd-mm-yyyy'), to_date('12-12-2029', 'dd-mm-yyyy'), 'GZ3lcERNj2Jv7m7QvbTW');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('rhp6fbTJ4zJbFcKcfOay', 9, 306, to_date('25-10-2002', 'dd-mm-yyyy'), to_date('06-06-2029', 'dd-mm-yyyy'), 'bXYkRBojL4KNSBvNiS81');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('AqjgJ7zrDzPcu4AiFzja', 70, 189, to_date('29-10-2013', 'dd-mm-yyyy'), to_date('12-04-2026', 'dd-mm-yyyy'), '7ZW7wTAVvV3rKOjKpFp3');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('JtDlXdz8PcHBkw1WzLlE', 18, 22, to_date('08-08-2017', 'dd-mm-yyyy'), to_date('04-01-2025', 'dd-mm-yyyy'), '6P57EFuDi1bLyq3uvQu0');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('FrbvvRwuebi2nZueZwxZ', 46, 236, to_date('17-01-2023', 'dd-mm-yyyy'), to_date('17-07-2028', 'dd-mm-yyyy'), 'cGGxPSdFoKOED4T5O2Vy');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('vuLg3nWnxhAwVSpBzVh1', 6, 455, to_date('29-08-2001', 'dd-mm-yyyy'), to_date('28-01-2028', 'dd-mm-yyyy'), 'K30FGVwago1zFSu0Trd7');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('pyvmhndbdAI8lOrsnwZx', 54, 7, to_date('26-07-2018', 'dd-mm-yyyy'), to_date('12-05-2028', 'dd-mm-yyyy'), 'Q26lBUS0fuKEi5gZ7xaJ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('aBYVdn6r3tXuK5dehF3A', 50, 108, to_date('23-12-2012', 'dd-mm-yyyy'), to_date('30-12-2029', 'dd-mm-yyyy'), 'RSXSp7OeqVYkcHbq6PS1');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('uoZxID14zXG7CjV4xn70', 92, 235, to_date('01-05-2014', 'dd-mm-yyyy'), to_date('05-11-2028', 'dd-mm-yyyy'), 'CJTdOyiHuwCPHsEaus1A');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('u2SDQnQDVvfUeGFutIDs', 56, 498, to_date('21-09-2000', 'dd-mm-yyyy'), to_date('11-02-2029', 'dd-mm-yyyy'), 'FDB2wIFlje1o9dnmMn33');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('VFVL02D2Pz4yqFnh4jHu', 44, 102, to_date('24-03-2009', 'dd-mm-yyyy'), to_date('30-06-2028', 'dd-mm-yyyy'), 'CNxSKnBPfnHmtelNL69b');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('4B1DAFaa6Fc4PnEqRn1Y', 53, 454, to_date('23-02-2022', 'dd-mm-yyyy'), to_date('30-07-2029', 'dd-mm-yyyy'), 'GA3xSb8XqHL54pbw1eLw');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('sH300pWnbYUDpgtW1PlO', 25, 428, to_date('25-07-2013', 'dd-mm-yyyy'), to_date('06-07-2029', 'dd-mm-yyyy'), 'NvekysdYxLq2Po6IUhHL');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('esOdgmmrVgqGG74ZqksM', 80, 447, to_date('05-04-2003', 'dd-mm-yyyy'), to_date('04-04-2025', 'dd-mm-yyyy'), 'HHEYzjtZ4acitdXhrJwU');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('NTJzeU0VzNbUk80SGd9t', 58, 458, to_date('30-08-2017', 'dd-mm-yyyy'), to_date('29-06-2029', 'dd-mm-yyyy'), 'KXo41k1gz5GrxKcpFypS');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('E6wAxnOHRXmZMK41RblA', 46, 427, to_date('21-05-2007', 'dd-mm-yyyy'), to_date('26-04-2030', 'dd-mm-yyyy'), '9Ki68Vt31QN6Ky6nvAqq');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('RfWP3sLrTpOIs6MBrCSD', 58, 460, to_date('04-12-2002', 'dd-mm-yyyy'), to_date('06-12-2030', 'dd-mm-yyyy'), 'c7TTsJtOXeDM2fiolVeE');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('DoASihvhsPsmmISK1Fo0', 32, 449, to_date('07-06-2015', 'dd-mm-yyyy'), to_date('08-03-2025', 'dd-mm-yyyy'), 'hgHEnlxw2WM3lgTJEJgm');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('YUMeiRvLvZhgearHQbvn', 15, 281, to_date('17-10-2000', 'dd-mm-yyyy'), to_date('10-03-2025', 'dd-mm-yyyy'), '8NtrGhh10vnjuiOQX8tM');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Yzr9tssnhLu0sBh9tnWN', 26, 379, to_date('14-05-2016', 'dd-mm-yyyy'), to_date('05-02-2028', 'dd-mm-yyyy'), 'hkRTA6vBAFbOUAPfKlC9');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('GlwjYl8V4eoaXGjQz39z', 77, 93, to_date('01-10-2012', 'dd-mm-yyyy'), to_date('28-04-2024', 'dd-mm-yyyy'), '2MqwwifK8LLYPVzFySlB');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('JCxqJEyaQke5GlVioXwp', 11, 59, to_date('10-07-2019', 'dd-mm-yyyy'), to_date('19-08-2028', 'dd-mm-yyyy'), 'fmkplQSWesCncZSSvQtt');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('equDhg7Tv29sa0DWXFfX', 53, 101, to_date('18-05-2008', 'dd-mm-yyyy'), to_date('22-07-2027', 'dd-mm-yyyy'), 'xv3TRKq3frmSFYQ5Qnng');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('WKleAvgVTUl7JQ8O3caq', 3, 36, to_date('12-04-2012', 'dd-mm-yyyy'), to_date('13-04-2025', 'dd-mm-yyyy'), 'LtpzbzsCFFx7kHmnN3kb');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('QX9I61vGTTiaJ3csxX6U', 18, 30, to_date('19-06-2006', 'dd-mm-yyyy'), to_date('08-07-2027', 'dd-mm-yyyy'), 'TijAeyhTWcsKPjerVV9P');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('NlfWKFJuBcn8yl3OTTjv', 58, 172, to_date('06-08-2019', 'dd-mm-yyyy'), to_date('28-12-2027', 'dd-mm-yyyy'), 'bWNlwzWvkAKwVwSC5aC8');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ToKIhRj9ck9r8wColHur', 18, 382, to_date('14-01-2021', 'dd-mm-yyyy'), to_date('22-12-2025', 'dd-mm-yyyy'), '9bGE1T3mXQq0ECHxYyU6');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('vBQOUZHZ04Nk5Yngo7DT', 5, 292, to_date('14-05-2001', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 'gVEH0YM8285R6Wo8Yy7T');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('WkqsO66mIirkAhWlaWMK', 87, 224, to_date('28-11-2004', 'dd-mm-yyyy'), to_date('11-12-2028', 'dd-mm-yyyy'), 'WlTFkurpLCXKLm1fVjLN');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('N5BI4lPk5hh1LrYERoKM', 29, 274, to_date('07-08-2018', 'dd-mm-yyyy'), to_date('12-05-2027', 'dd-mm-yyyy'), 'i1KLjRdAfaEuFYydm13C');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('5RsTFjezgwyGJKHCuzwb', 81, 147, to_date('22-02-2011', 'dd-mm-yyyy'), to_date('27-12-2027', 'dd-mm-yyyy'), '4mSWEXcBgx2baXfdCK9Y');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('NkraxUdkmDkoDLfDaTDm', 83, 61, to_date('16-02-2022', 'dd-mm-yyyy'), to_date('14-01-2027', 'dd-mm-yyyy'), 'VVXEiBweQf3lkwMo533C');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('qEdL2qdk4NNv7U6wcnK7', 45, 291, to_date('28-04-2008', 'dd-mm-yyyy'), to_date('08-11-2024', 'dd-mm-yyyy'), 'EK2k8L5S0OzmnjWCxhv3');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ANGv9ZWgDDTfdciPLUTp', 46, 69, to_date('08-06-2018', 'dd-mm-yyyy'), to_date('05-12-2025', 'dd-mm-yyyy'), '1ARUuQCtSxM0iYA6ZynM');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('u2Am1nRDDN0SgY1ABRfF', 99, 13, to_date('04-10-2011', 'dd-mm-yyyy'), to_date('19-03-2027', 'dd-mm-yyyy'), 'hLvAUiFXsUlSRlUxBEuq');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('shZDNheKfZQxj0enpCVv', 12, 101, to_date('21-11-2000', 'dd-mm-yyyy'), to_date('12-12-2025', 'dd-mm-yyyy'), 'vk1UNCS6GWoIvCP6BDck');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('cIZOxUMRGFLKn2s0km37', 7, 87, to_date('26-09-2022', 'dd-mm-yyyy'), to_date('17-07-2030', 'dd-mm-yyyy'), 'LRSIHbGuUXoMSzXsBqzR');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('eQadrDc8aK2onaHXmK7b', 59, 415, to_date('20-07-2019', 'dd-mm-yyyy'), to_date('27-07-2030', 'dd-mm-yyyy'), '5sE3I5yu1jnfualZF1Qj');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('YrARMyuzS4cVQVIU5akO', 20, 476, to_date('02-05-2011', 'dd-mm-yyyy'), to_date('27-01-2029', 'dd-mm-yyyy'), 'u0J1HjAcyviieff4ifmt');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('aiCCNfpCznP9Qjein6Qo', 92, 60, to_date('20-12-2008', 'dd-mm-yyyy'), to_date('04-03-2027', 'dd-mm-yyyy'), '0aNt962ZdSxBqHzwQ4M6');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('XEUiN8Udzo5LOO4gThQj', 84, 64, to_date('20-09-2021', 'dd-mm-yyyy'), to_date('29-05-2024', 'dd-mm-yyyy'), 'kW6Paylqnxch5P2q7ihG');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ZCLNDMO6TsDdGp7XWQcS', 83, 234, to_date('01-12-2006', 'dd-mm-yyyy'), to_date('04-01-2027', 'dd-mm-yyyy'), 'QBOu1o8tjf4wQYdoAY0k');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('H36lpnfxLiNVde3Qc80k', 25, 32, to_date('03-04-2001', 'dd-mm-yyyy'), to_date('04-05-2029', 'dd-mm-yyyy'), 'QcqcUy4nxjeUMhV7VxGy');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('sdfz4nx7kCKWcgjiQKBC', 60, 115, to_date('28-05-2020', 'dd-mm-yyyy'), to_date('03-11-2025', 'dd-mm-yyyy'), 'eeu4Xi4bI48D5U3S84Hq');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('jiouPayYillpC2OdbRnQ', 90, 452, to_date('11-10-2000', 'dd-mm-yyyy'), to_date('25-11-2027', 'dd-mm-yyyy'), 'P1ZiKWBhltwarY4kgllv');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Q4R2OX7CYabEhxCbx1Zm', 26, 120, to_date('17-10-2012', 'dd-mm-yyyy'), to_date('06-09-2026', 'dd-mm-yyyy'), 'LYwXn1ayW8Yd8vZjz64Q');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ziijwkEvZrX273arkI4G', 49, 5, to_date('04-01-2011', 'dd-mm-yyyy'), to_date('11-06-2026', 'dd-mm-yyyy'), 'eYlZ6pakDHSfCI4p1o7Z');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ImH7abYGbP6EfzYbPXob', 3, 72, to_date('23-11-2002', 'dd-mm-yyyy'), to_date('08-05-2028', 'dd-mm-yyyy'), 'lKDUxSOVx4YgRBF0yOK0');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('MnFmFXo37HOHeZc1Ne5s', 85, 66, to_date('19-06-2007', 'dd-mm-yyyy'), to_date('15-05-2030', 'dd-mm-yyyy'), 'JZtZ0Ra5Hng4yL4BIean');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('gMDgCfA7Y5EjPCULgPc5', 25, 356, to_date('07-01-2022', 'dd-mm-yyyy'), to_date('17-08-2029', 'dd-mm-yyyy'), 'qpfwk2mS5kOdhceYZtPs');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('unrUa8nNig0XvrPWLjaN', 78, 421, to_date('29-01-2010', 'dd-mm-yyyy'), to_date('12-04-2024', 'dd-mm-yyyy'), 'YliVPhhtPteRqHgscMxw');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('0X3Ijgf4gQWiZAQET55N', 88, 162, to_date('26-05-2006', 'dd-mm-yyyy'), to_date('24-04-2025', 'dd-mm-yyyy'), 'AguDtiN9fI1ubcT1ydEf');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('jhKMhV1TuYlrlJoLf2Gb', 65, 100, to_date('22-02-2001', 'dd-mm-yyyy'), to_date('15-09-2026', 'dd-mm-yyyy'), 'UEpr90ZEaXJjQbMlKKYA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('7W6haE8mzS3AE1JTd8HW', 23, 84, to_date('29-12-2018', 'dd-mm-yyyy'), to_date('23-05-2030', 'dd-mm-yyyy'), 'WA3I0VL3l2NL1B0tM0Uo');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('IXTeCNAderdIizcUfLNE', 38, 345, to_date('09-04-2010', 'dd-mm-yyyy'), to_date('07-03-2026', 'dd-mm-yyyy'), 'tT66IBPX69V8KLIv3yxq');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('wJxvgPLDDSzKai3a1x4n', 8, 362, to_date('20-05-2014', 'dd-mm-yyyy'), to_date('11-07-2024', 'dd-mm-yyyy'), 'nMQAa21jCpvAQkOYQXz4');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('D374wRAey8r85dr8u9UV', 91, 158, to_date('14-07-2002', 'dd-mm-yyyy'), to_date('14-12-2030', 'dd-mm-yyyy'), 'rczhJHD9ZQODuzFR19iM');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('xSQSE5Oh1ecif22LZLgO', 8, 282, to_date('08-04-2016', 'dd-mm-yyyy'), to_date('02-09-2024', 'dd-mm-yyyy'), 'k1rNKfjrR90TEPKcTs25');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('tkVN2f1KAQiwN3zAG8EB', 46, 435, to_date('19-12-2016', 'dd-mm-yyyy'), to_date('04-02-2024', 'dd-mm-yyyy'), 'CuB3jPCKcoD7I9BkDakI');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ItZkS3JAVz7aj76srcik', 27, 164, to_date('26-03-2017', 'dd-mm-yyyy'), to_date('04-02-2027', 'dd-mm-yyyy'), 'ty2sDAtDYQkOph9z0ztT');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Dqv9kuAaZMZRRaXwVwZd', 54, 109, to_date('06-03-2008', 'dd-mm-yyyy'), to_date('28-11-2030', 'dd-mm-yyyy'), '7OF82tb73USNzpmdsvCw');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('4m0L6wND8iDJTBNPx4Ih', 16, 150, to_date('20-06-2005', 'dd-mm-yyyy'), to_date('12-06-2025', 'dd-mm-yyyy'), 'FPNEe2R7Oe1i382uQLD1');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('eKW4SHLMd1TFp92s0QL1', 33, 143, to_date('29-08-2021', 'dd-mm-yyyy'), to_date('18-12-2024', 'dd-mm-yyyy'), '0jM7hVOGHL7OGZ50IXCP');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('FqpU2mxLCOIs3pAY6UbV', 95, 69, to_date('14-09-2007', 'dd-mm-yyyy'), to_date('01-03-2028', 'dd-mm-yyyy'), 'k9zVRWMwqm2u1gDAurK7');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('M3t4w3LS74NeCwKX6Sl3', 60, 229, to_date('10-07-2002', 'dd-mm-yyyy'), to_date('29-07-2027', 'dd-mm-yyyy'), 'aUKZxZdPSjUTOces1RMF');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Fa60JVLgn8PQEgPfIoN9', 53, 337, to_date('15-05-2004', 'dd-mm-yyyy'), to_date('02-12-2024', 'dd-mm-yyyy'), 'Avtsvj7En3izZ5Sbh6JK');
commit;
prompt 200 records committed...
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fH1aqtAcvz9eF8J4Ijqi', 80, 55, to_date('11-10-2001', 'dd-mm-yyyy'), to_date('28-02-2024', 'dd-mm-yyyy'), 'IfFhxto0ov98T8imNWXZ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('9VZSzHUqN5Jj2m7GQCzJ', 38, 103, to_date('17-06-2013', 'dd-mm-yyyy'), to_date('29-06-2026', 'dd-mm-yyyy'), 'WI92PfeVW4I5ZGZVDumX');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('oLgCmY25ncjWNUYqUchQ', 55, 143, to_date('22-05-2014', 'dd-mm-yyyy'), to_date('05-09-2030', 'dd-mm-yyyy'), 'xAlnUpHBE0FZd0tu8eXC');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('UbSZTQLLYvCxhGtCz01Q', 76, 375, to_date('12-05-2023', 'dd-mm-yyyy'), to_date('25-09-2027', 'dd-mm-yyyy'), '4781xXnEwV2hMBj3vUsf');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('amJJxxNvJZPDz3p2jECF', 52, 88, to_date('24-11-2005', 'dd-mm-yyyy'), to_date('30-04-2025', 'dd-mm-yyyy'), 'mxSMYPNXqlyKv6LKeB0i');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('LqALBUHB7zAzXjVf21oa', 74, 413, to_date('17-10-2008', 'dd-mm-yyyy'), to_date('24-09-2024', 'dd-mm-yyyy'), 'k61mTTk9g85RCjudBWBN');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('2fZlEIWbx06GHGMNsLh9', 54, 81, to_date('15-03-2006', 'dd-mm-yyyy'), to_date('21-12-2029', 'dd-mm-yyyy'), '0RqsxWvEMP9zDqtm3OWu');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ZH0ewimXZ7o6UUxUmVcL', 16, 244, to_date('12-01-2022', 'dd-mm-yyyy'), to_date('23-07-2024', 'dd-mm-yyyy'), 'Pl9LwF2Fn0k3Rk0i7Mun');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('rMJ018hYX915eJc556rAl385gUC497mMN367fLM160kPz351bP', 1, 5, to_date('24-01-1975 17:20:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-02-2381 05:36:14', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('wKA476vIL014aXn970tFq456gXo981tPL494zEn868rYg660pL', 15, 8, to_date('14-08-2313 23:39:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-09-2805 02:19:32', 'dd-mm-yyyy hh24:mi:ss'), 'Turkey');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('pQc658xFU772nFX662wAc634hRX958jHG642rPY064dXG862uQ', 7, 12, to_date('19-01-2443 22:33:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-12-2901 05:12:28', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('iRI269sWP879zGX754qTZ478rSE748fMB048qXo084aDK741pD', 9, 15, to_date('26-06-2010 14:18:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-03-2413 06:38:26', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('hVZ999jNG687fXJ123kIX843jSo163aTg579cRy350xTY116uI', 15, 13, to_date('10-09-2349 15:33:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-11-2837 02:47:36', 'dd-mm-yyyy hh24:mi:ss'), 'Austria');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('hJi548aZR664pPy898cSt882fES575iQf147wIT087cVP016lZ', 20, 13, to_date('16-11-3037 08:57:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-02-2320 06:19:43', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('uAN591xOs550tBD644lUn650oSk873xGe655dZZ651bAS265sX', 2, 9, to_date('23-06-2566 08:34:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-12-2530 17:00:23', 'dd-mm-yyyy hh24:mi:ss'), 'Sweden');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fNs720fCg823nAN492eUF063pKh196uJc851eXc443vPr094nG', 5, 14, to_date('18-05-2892 21:50:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-11-2100 08:09:18', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('pZd887xBz191hVk956rZp887eZK141cJu466zZK022tTu896uC', 8, 5, to_date('18-09-3053 11:53:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-08-1908 17:41:08', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('rXg166sHA636iRk531rSj988fYI946hIi097gQM990jBF698iQ', 20, 8, to_date('23-06-2199 18:11:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-03-2115 03:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('lBG770kRl552mNa917oAM775qJZ180iTq730hKo582wXy915eH', 2, 6, to_date('04-08-2795 04:47:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-11-2774 23:37:06', 'dd-mm-yyyy hh24:mi:ss'), 'South Korea');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('cMx691jQG624hDU227fCA493aYO391tJo988rRU186iUm072wP', 1, 11, to_date('07-08-2500 18:23:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-04-1993 01:26:41', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('cSL683wPO043vWO547zQF541vLk213sDC561nFv224rDF223iK', 6, 7, to_date('09-02-2227 09:35:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-03-2719 02:05:34', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('eDA040zAY325eRo020mCc985yKU474kDD572hIm424pWD617wA', 16, 3, to_date('13-06-2135 21:31:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-12-2556 09:24:46', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('nMu153jDg074wZy026vGn189rOV767kUH964hWP468qGl251xM', 4, 10, to_date('26-10-2257 02:35:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-06-2733 08:36:57', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('eOO857bZF074uTq365dWM634zJh344yZq115iJl595fUl186eB', 15, 7, to_date('18-05-2373 22:06:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-11-2288 12:25:29', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('bHk734hVY216nJz966fNO076vZn919iLl311vDJ887wTh930oQ', 9, 12, to_date('29-09-3029 00:26:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-04-2168 02:15:47', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('dNC746yQV381dSw628gQI651gKI644cZc969oQR985kIa451hH', 0, 1, to_date('12-06-2896 02:11:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-02-2200 13:46:24', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('wKF267iDO314dAq447oBe036tRR334gMb028wGU083eLO957rU', 16, 2, to_date('06-06-2319 01:53:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-08-2890 07:58:56', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('bDb280kCu199vCf813tUJ966oUB260sYU394uPA435oXL755qG', 18, 15, to_date('03-12-2726 23:15:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-10-2816 22:45:07', 'dd-mm-yyyy hh24:mi:ss'), 'France');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('jMS743qQp833oCN242uJD517cPP883xMj859sIU954fXi255sG', 3, 15, to_date('18-07-2532 03:00:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-07-2019 22:24:40', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('pVH448lJz127kFF819zXg888iEL624tHS274iHn443fSU268cF', 19, 8, to_date('27-05-2681 07:11:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-10-2221 20:05:16', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('dDo160xHU859eJd565mVc960wCe539vYR225qTb794tNK752lI', 11, 10, to_date('21-06-2922 01:20:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-06-2071 16:01:20', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('iUq174oEq650jQC316xYT554rVe883bTB339fNk369rMW164hH', 8, 14, to_date('15-11-3034 17:51:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-09-2669 14:41:08', 'dd-mm-yyyy hh24:mi:ss'), 'Denmark');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('dCp554eJw712zDh983nRi272lFR447gAz193wIz692oIY616mD', 14, 1, to_date('30-11-2801 09:44:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-07-2250 21:20:26', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('eJS058bCG088yBm373nQg316qGx167zMm330aTR853cSP563yE', 14, 14, to_date('19-01-2749 16:01:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-08-2904 14:19:23', 'dd-mm-yyyy hh24:mi:ss'), 'Poland');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('sLR749nRA118gEG190aOO151oCY420fKH980tZv599tHZ738kA', 5, 5, to_date('10-04-2858 15:22:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-01-2554 10:07:14', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('bHl316mWR832rLl962wLp279lKF240tAS147pZJ575kJl254qZ', 11, 10, to_date('25-07-1942 12:53:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-10-2750 01:19:29', 'dd-mm-yyyy hh24:mi:ss'), 'Belgium');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('eNv013aLR958hCi292xBP234dAc744rVc826rQc471pSq990xR', 0, 3, to_date('28-09-2292 18:03:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-02-2837 22:54:20', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('bWW663oSg428pNq492fYE699eIo225yOl114oCd175sGI613mK', 2, 12, to_date('11-04-2055 02:01:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-08-2347 13:59:39', 'dd-mm-yyyy hh24:mi:ss'), 'Japan');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('sEH348hDl554zJv427tVE781dZt743cNg620xDd423cJT787sX', 9, 7, to_date('23-06-2045 02:34:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-01-1944 12:38:09', 'dd-mm-yyyy hh24:mi:ss'), 'Slovakia');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('hIq141zIu015uPV520sYt465sEw161iVF192sIS123xPT430sO', 11, 13, to_date('11-03-2208 17:23:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-02-2616 21:37:09', 'dd-mm-yyyy hh24:mi:ss'), 'Spain');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('cNV481zUu115sKQ625pGk522uDh188sHu358cIX262uUi033mH', 20, 12, to_date('13-01-2923 08:57:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-09-2394 18:25:03', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('jZP485yDN358kTr489hRI216yJm240kGB860nEW680wSH317sS', 2, 9, to_date('17-10-2548 13:27:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-05-3045 18:17:08', 'dd-mm-yyyy hh24:mi:ss'), 'South Korea');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('iKL992vZt455gGQ987bNz922kJl132uXy315vOY259hEp835zV', 5, 2, to_date('29-09-2078 15:04:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-01-2621 20:25:26', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('jKG190eIG446cTp732lSU962hIq454oCe564dFk113zID995vK', 0, 8, to_date('01-07-2166 00:48:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-09-2211 03:03:10', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('sER457kUL772iXW294wJQ578aEV294xQE944iEi620oSV235kQ', 19, 10, to_date('12-08-2331 07:27:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-07-2791 13:56:38', 'dd-mm-yyyy hh24:mi:ss'), 'Netherlands');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('oTv690xSN035eSI588vNr638oJM190tNM023dLq224yHB784uH', 17, 15, to_date('17-08-1928 13:06:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-3014 13:11:16', 'dd-mm-yyyy hh24:mi:ss'), 'Japan');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('tLh970zZP925bSt817cCV988pPr218rJk547yLu683pKJ924oU', 18, 9, to_date('23-01-2997 07:23:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-12-2906 21:24:02', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('pZq211mAB189fFe790lKj538eHp890mDw832qVi921tZV294aE', 18, 7, to_date('02-01-2681 09:01:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-05-2184 05:55:14', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fMf233qMK458uKW489hGb165tIU290uFa347pMM796wVQ690zW', 11, 2, to_date('18-10-2860 16:37:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-02-2094 03:28:39', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('gWD332yDa122yNZ315oUE691bYn786qBZ467wWg496qSv451uB', 6, 10, to_date('01-10-2959 05:31:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-05-2387 19:24:14', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('mQQ585iFA820oVf461zVc145hWP126rMt033rJf651wBC373kT', 8, 12, to_date('23-07-2695 06:15:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-09-2848 22:25:58', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('gZv769eLF115lTM932sCt596wQn076aMX839wLx442tRq180zG', 6, 5, to_date('16-03-2170 05:49:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-06-2388 21:52:59', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('aEQ416iXG575vDU546aIa616wSG891iRX021qHQ418iLw296nE', 8, 8, to_date('24-12-2932 11:20:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-06-2152 20:23:42', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('rSb571fXN643aYo430kQH747iQo484yKN115pWH296nJJ111wL', 20, 8, to_date('03-09-3044 06:55:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-05-2947 06:15:33', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('kXW759gOQ997kHE392vVD657cCm623hOD594oCU965iFx668lH', 10, 9, to_date('13-11-2711 05:11:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-09-2964 13:51:10', 'dd-mm-yyyy hh24:mi:ss'), 'Portugal');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('zQe977rYS457eCO019xAf174bOL560mEU648vSl733jXi463lS', 17, 4, to_date('16-09-2291 00:20:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-12-1949 05:37:49', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('jLZ972uYD979gKW395dMP361fYc233sYJ346yIp876iVO981rC', 16, 5, to_date('26-11-2189 03:56:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-05-2539 13:08:41', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('dNZ215xMN659vAP792kXc034yJV331oGj828gRZ350yHA075yD', 12, 11, to_date('29-07-1940 15:02:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-07-2354 23:09:10', 'dd-mm-yyyy hh24:mi:ss'), 'Mexico');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('iUb653tDN585eWc347vOv239iPw495aDi876xIN976aEg026gO', 6, 7, to_date('15-01-2732 15:40:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-12-2999 23:35:57', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('eDB498jCR232rRe980fPS184fCm110qFP286dLn656pQJ482oL', 14, 2, to_date('28-01-2225 07:34:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-02-2084 21:04:19', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('rWB975kUi827zMr239rQG431qJy791sXW534fFI559pVW930aT', 20, 7, to_date('09-05-1907 19:25:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-10-2063 23:08:18', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('wQk633zGt335zLN873nTG523vZm585pXd382aXR934hHz954dD', 16, 7, to_date('28-06-2627 10:17:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-12-2123 23:43:26', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('eZS221oWW819kDb795aVR034uNb469sMp157hFc729rKF649pQ', 13, 11, to_date('24-04-2029 03:23:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-1928 14:36:05', 'dd-mm-yyyy hh24:mi:ss'), 'South Africa');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('yLq876kNK369cHw016bAF299dWy870jMB965sMm842cVc620uW', 4, 11, to_date('31-12-2432 13:54:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-12-2705 00:34:07', 'dd-mm-yyyy hh24:mi:ss'), 'Switzerland');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('dQC433nSB951kPR056fON070jQB322iGd949nIx176oCf330bX', 16, 2, to_date('23-10-2054 17:40:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2069 15:40:36', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('wHI772sAz728kFE942lIB594aCE724wZi319xQr821uPE458mP', 11, 13, to_date('24-05-2268 00:34:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-09-3039 02:22:50', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('aAq199tGR246zXh329xTK844sTu840uNC259aOn794yAe312pO', 9, 14, to_date('13-09-2727 16:22:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-10-2925 07:43:40', 'dd-mm-yyyy hh24:mi:ss'), 'Brazil');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('nQb373rUL467gKS125qJV024tLG521sXC078zLz367pEX450pS', 13, 12, to_date('23-07-2665 01:27:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-06-2412 03:32:24', 'dd-mm-yyyy hh24:mi:ss'), 'Belgium');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('hRe244eKD168iGl879oZA359yLJ384wCB111sMK473hEe054mT', 6, 11, to_date('16-12-2586 06:30:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-07-1937 23:03:50', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('cZG892wLo732sEC182xYu154sBn050wZQ670oRi845aKJ185aJ', 14, 4, to_date('16-10-2573 16:43:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2585 20:02:24', 'dd-mm-yyyy hh24:mi:ss'), 'Japan');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('jBg024xQX947sDk239tUV195uZj911uZJ676eXA176fAU122iO', 12, 10, to_date('26-04-2637 21:36:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-03-2415 19:23:05', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('lAD397oBO528aDX387nDe851aGf911bFm896qKW535lTc170uG', 9, 4, to_date('14-06-2335 22:12:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-06-2480 14:35:57', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('uLy458nPf816aEP847aCY242yJl846gXg034fNh097fLK840oN', 13, 5, to_date('24-05-2970 06:14:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-11-2445 23:23:42', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('aXH745hDx297bWP928qHd497dDN693qEn715mCM473vBR484wF', 11, 11, to_date('07-06-2142 09:25:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-04-1900 16:40:30', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('iDB275uEl735aWq056iFu941lKE899yNP615cDL118cGz770eG', 7, 5, to_date('01-09-2214 14:06:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-02-2742 06:39:53', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('lBC039hFR839iCT332gLb972eAm426eSm136uBs027cGu913uR', 18, 7, to_date('11-10-2350 07:34:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-03-1922 22:44:24', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('lMN119wWz617gSz778mLC110xJH213pIx169uEF822yZl046bO', 0, 9, to_date('31-12-2313 07:47:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-09-2593 11:36:31', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('kTr554sGv216oKu740yYL189vYU987qBL390xZO820mXf570eR', 7, 12, to_date('24-03-2421 13:47:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-10-2016 10:59:13', 'dd-mm-yyyy hh24:mi:ss'), 'Italy');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('nQo478gVK489fTM815mAv633iQr254nMr927eQf358aXT014vM', 11, 9, to_date('23-06-2585 09:18:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-10-2001 20:03:59', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('hIy586wSk416eIM915qBO919jQh579uHQ346fFA693mKM968mY', 18, 11, to_date('11-11-2081 15:05:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-12-2448 04:04:48', 'dd-mm-yyyy hh24:mi:ss'), 'South Africa');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fFd669bCP448mTl396fDo678pZs363rIw241aQf316vCZ115fO', 3, 12, to_date('13-06-2742 22:37:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-08-2796 09:41:02', 'dd-mm-yyyy hh24:mi:ss'), 'Sweden');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('dRl210aZX531pAm595dAP625kQQ270uBI696jWI334mDJ372wQ', 14, 11, to_date('19-08-1918 06:57:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-03-2227 20:55:06', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('qJv848xFw025lMw134hTZ130kLg994cJN781yJI881iTo852fV', 17, 11, to_date('03-09-2709 19:37:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-10-2080 08:44:44', 'dd-mm-yyyy hh24:mi:ss'), 'Belgium');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('tOA840gEP932mMH090fZY040eAj155yYZ349dND696vYh413mI', 18, 10, to_date('11-01-2974 06:36:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-3020 02:57:59', 'dd-mm-yyyy hh24:mi:ss'), 'Portugal');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('gWK957eXH745jMt346sXA492hVm335uGc840xTg773pXK292yA', 10, 2, to_date('03-07-1948 19:37:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-10-2807 06:53:08', 'dd-mm-yyyy hh24:mi:ss'), 'Netherlands');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('kXZ771gJb183cAl651nAc081mGA933aZs326lRh020yUs965aN', 9, 3, to_date('22-11-2721 14:05:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-09-2139 10:32:18', 'dd-mm-yyyy hh24:mi:ss'), 'France');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('sFa048vKe788oNp024hEy825eCJ879sKA878xKQ389vGT395pN', 20, 7, to_date('30-12-1978 16:03:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-08-2582 16:11:25', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('nEY526nRk323zQd659lDl859oXa943qEW111tWL779tJM897kT', 4, 7, to_date('12-12-2857 18:58:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-07-2670 15:27:38', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('cHD838dJy026iOg394dTc316bYY556hXQ096aIb067eNV452lS', 12, 9, to_date('26-01-2789 17:59:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-10-2571 05:15:04', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('yYR141pGY560jIy689tIm258aOl129gMG986wFs010wHW154cQ', 7, 10, to_date('20-12-2126 12:21:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2447 09:57:10', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fCU831oOR573rAP883hUy565eYS360yXa023wWl129jRa369yF', 10, 1, to_date('02-12-2178 15:15:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-03-2954 03:46:39', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fFA044hNz042uXA043rNQ774xOW762sHA216gJs283gYQ684kJ', 8, 1, to_date('20-07-2797 10:01:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-04-2656 17:45:53', 'dd-mm-yyyy hh24:mi:ss'), 'Switzerland');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('jOf310kGg149kYS273hPx765iQM757wZs478lQy299iMm464cW', 20, 9, to_date('11-10-2521 17:58:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-01-2036 01:15:53', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ffpGGg1qbXc9cOD97ChT', 49, 159, to_date('01-09-2008', 'dd-mm-yyyy'), to_date('19-06-2024', 'dd-mm-yyyy'), '0TqDlcenvRZS0JeGfmVJ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('nEP0RynbbE2Z1gvskgR8', 34, 385, to_date('08-10-2004', 'dd-mm-yyyy'), to_date('03-12-2028', 'dd-mm-yyyy'), 'XgDpLAGa5azlqWnj99eX');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('KMl70xXL7DHC0GzT862U', 46, 52, to_date('16-06-2014', 'dd-mm-yyyy'), to_date('09-11-2028', 'dd-mm-yyyy'), 'FZFkwMdTRshnWW0NOdZb');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('FMvrvf8zRSJo8VW6q7Oh', 63, 286, to_date('06-02-2006', 'dd-mm-yyyy'), to_date('28-03-2027', 'dd-mm-yyyy'), '5rO63zxdBhhTlvs2fVUL');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('XknBFi4ViPHIuyyzgg76', 53, 299, to_date('06-04-2011', 'dd-mm-yyyy'), to_date('16-11-2026', 'dd-mm-yyyy'), 'kahFn5UbFVKQIPnsITUr');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('XshqQkR6NfJ0kCxBd90U', 34, 189, to_date('18-02-2003', 'dd-mm-yyyy'), to_date('04-06-2025', 'dd-mm-yyyy'), 'aHHKmhymZ2X7Gym23Gc5');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('MBneLoLOYezmFmncrzZC', 90, 180, to_date('02-09-2014', 'dd-mm-yyyy'), to_date('05-02-2025', 'dd-mm-yyyy'), '6dkzYb9ndwVZc1SQfJAb');
commit;
prompt 300 records committed...
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('RoSegROfYqNnL7zS03ms', 35, 262, to_date('26-07-2011', 'dd-mm-yyyy'), to_date('20-04-2025', 'dd-mm-yyyy'), 'If7bVq5ZO2SX89yGDVhh');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('oOIHsL3QGusZ76Y8G5ih', 21, 286, to_date('18-11-2008', 'dd-mm-yyyy'), to_date('15-01-2030', 'dd-mm-yyyy'), 'BzJTN9hc7yBjnmzqaISC');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Ff3ZefcG5ReLFIv6Hbps', 34, 252, to_date('24-04-2021', 'dd-mm-yyyy'), to_date('14-06-2028', 'dd-mm-yyyy'), 'gwXvAQe92ttwisYDsVHy');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Re0tE5DrSbadw5633QVb', 78, 23, to_date('26-09-2009', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), '6Eld0Urm09CH96ZQNM5L');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('juTWZa7oAKlTSyr5uTwX', 67, 453, to_date('18-01-2010', 'dd-mm-yyyy'), to_date('21-07-2028', 'dd-mm-yyyy'), '0i4cErmGAR5JKWlaUmH1');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Keiu2WmkL5sZvdJLNQ42', 37, 69, to_date('12-03-2000', 'dd-mm-yyyy'), to_date('04-10-2026', 'dd-mm-yyyy'), 'jWHdCH04IdnrWK1891B2');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('lxNuzyE2Ssb1o9JllqWx', 14, 467, to_date('14-03-2009', 'dd-mm-yyyy'), to_date('26-08-2030', 'dd-mm-yyyy'), 'mneHj27iFll1qRTXGyUF');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('VzuKgK4zbfe0REtDOS6f', 50, 453, to_date('17-10-2005', 'dd-mm-yyyy'), to_date('26-08-2028', 'dd-mm-yyyy'), 'kJU4f79pNN4zmGJyE8jd');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('AA2HBQm0dN8PMvCGGo8M', 95, 442, to_date('22-01-2019', 'dd-mm-yyyy'), to_date('11-09-2025', 'dd-mm-yyyy'), 'Ii2MeL0ux7xiaNGuF0dR');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('5IfiKrIIReyeGBSGmNUD', 5, 211, to_date('13-05-2009', 'dd-mm-yyyy'), to_date('09-01-2025', 'dd-mm-yyyy'), 'YjtHBbvTlV52HgVUo9dp');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('lqNjf7s4RYSfyBK4ruyZ', 39, 108, to_date('09-07-2016', 'dd-mm-yyyy'), to_date('27-05-2030', 'dd-mm-yyyy'), 'bDT9VYuJIzdQy6jZ9SJf');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('C6GDuFYkXkXKpQwKFxF2', 35, 458, to_date('20-01-2012', 'dd-mm-yyyy'), to_date('14-02-2030', 'dd-mm-yyyy'), 'pZPTYG9XMIBdPlOsDmi6');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('wnSzHXbVa9MsiyqVWCrP', 12, 468, to_date('11-10-2022', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 'ziWlMQSxT2ewMlFuW8TL');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('TO24cGOCB9AssdofUS23', 42, 356, to_date('23-12-2021', 'dd-mm-yyyy'), to_date('12-11-2028', 'dd-mm-yyyy'), 'WOmfYZjalqDHaDoO9P8m');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('6DUIbotKmoEDy6NAg6mq', 55, 337, to_date('12-08-2008', 'dd-mm-yyyy'), to_date('25-12-2030', 'dd-mm-yyyy'), '3KA9FAryxdGRiXD191YE');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('WdY4uQds3VppPfmpFYfD', 7, 143, to_date('24-12-2013', 'dd-mm-yyyy'), to_date('08-07-2029', 'dd-mm-yyyy'), 'LQhh1xEIqpLmj7mI1dS3');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('dmIVxo5up87POTs4rZMP', 53, 344, to_date('16-08-2020', 'dd-mm-yyyy'), to_date('20-03-2026', 'dd-mm-yyyy'), 'Avm3GS254P4OP0m05Klt');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('XDSb0P6pTL98ic3BjOX7', 15, 336, to_date('05-05-2004', 'dd-mm-yyyy'), to_date('04-02-2029', 'dd-mm-yyyy'), 'nbjHFoMPGCdmGZTW0I9M');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('vdt1x2tRxBiIMJCyWTqB', 92, 161, to_date('07-07-2011', 'dd-mm-yyyy'), to_date('08-05-2026', 'dd-mm-yyyy'), 'uV75ys03pZ77vi6VeUJi');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('80X7u8wrgHsTniARlakr', 61, 263, to_date('28-09-2001', 'dd-mm-yyyy'), to_date('26-10-2027', 'dd-mm-yyyy'), 'aYpu6UUEv5Ynd5C1aM4Y');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('wLsqznwUyVKmYy6Ujc7M', 6, 40, to_date('05-03-2012', 'dd-mm-yyyy'), to_date('02-11-2029', 'dd-mm-yyyy'), 'BpLAy1SFUAIlghbox3iy');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ZKlBsAkl0FtVVy373A2B', 8, 63, to_date('03-10-2012', 'dd-mm-yyyy'), to_date('02-04-2027', 'dd-mm-yyyy'), 'G9KvxG6h2pUZoessyXyF');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('cz04g0ksh1QKO0j4THGD', 66, 240, to_date('18-03-2000', 'dd-mm-yyyy'), to_date('25-01-2029', 'dd-mm-yyyy'), 'bLTauPgcfrQkgqGGqNvA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('0uDORrwyiEG0KXa6v9EO', 70, 190, to_date('17-04-2014', 'dd-mm-yyyy'), to_date('06-11-2025', 'dd-mm-yyyy'), 'ZuTVAuMkVUeIngcCAHzx');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('uUEqwKCJuD81aFd1KEv3', 79, 139, to_date('22-03-2006', 'dd-mm-yyyy'), to_date('13-10-2029', 'dd-mm-yyyy'), '6gSLtW9ee3DxPdlmvSli');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('B07SLDMOA68pfpTZfyLN', 58, 370, to_date('01-09-2007', 'dd-mm-yyyy'), to_date('24-08-2028', 'dd-mm-yyyy'), 'Zatcd6SRYmhOYZbBOBcw');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('IL4PxfZmxPfT7ehuqbRI', 3, 351, to_date('01-08-2007', 'dd-mm-yyyy'), to_date('23-02-2029', 'dd-mm-yyyy'), 'KEbv5GRRXrCvrsNLaWRo');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('JkK8CvGABEKt4OKWdb13', 95, 412, to_date('01-11-2014', 'dd-mm-yyyy'), to_date('03-10-2030', 'dd-mm-yyyy'), 'ZeccEVtv9ged7eE7gYHL');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('HRhZdX39gSvRfsGCcZFR', 61, 341, to_date('28-09-2003', 'dd-mm-yyyy'), to_date('10-02-2029', 'dd-mm-yyyy'), 'l191e0oCC3Ne4u3XzV61');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('AnNHmvjpdvKDw3gp8qWS', 79, 168, to_date('08-01-2012', 'dd-mm-yyyy'), to_date('24-03-2027', 'dd-mm-yyyy'), '9lXdRjBOZKwBVjztKvJ6');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('M5xjgiD5zeSAmM18ChyY', 53, 385, to_date('25-07-2001', 'dd-mm-yyyy'), to_date('22-10-2026', 'dd-mm-yyyy'), 'aIfEk868G9dtZyqW2zEC');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('0gOpDLpCtwhLrIufV3nj', 13, 302, to_date('22-12-2008', 'dd-mm-yyyy'), to_date('14-03-2028', 'dd-mm-yyyy'), '6FwdepXfmasRlWXQMWu1');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('38pqaizZggN2Ag5mFZLo', 87, 266, to_date('26-04-2001', 'dd-mm-yyyy'), to_date('07-05-2025', 'dd-mm-yyyy'), 'lXAObOL6bLCmOKz1vKiY');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('7TAnnzQvpzBzHnK2eytW', 41, 253, to_date('23-11-2003', 'dd-mm-yyyy'), to_date('01-11-2024', 'dd-mm-yyyy'), 'aA2SrpG53z9ixk9FdHdD');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('QoPSZAkRjo3WP8PasdFO', 79, 118, to_date('09-02-2012', 'dd-mm-yyyy'), to_date('26-04-2028', 'dd-mm-yyyy'), 'YOXnQ0iUMYjEccKLbYKa');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('HcdGCsqWqifqJy5kQLWe', 15, 79, to_date('15-02-2012', 'dd-mm-yyyy'), to_date('18-07-2029', 'dd-mm-yyyy'), 'wKPDVfq7Tor5e2EwfpTb');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('zLQicTkrVctdjhuHhth8', 49, 347, to_date('04-04-2018', 'dd-mm-yyyy'), to_date('02-11-2028', 'dd-mm-yyyy'), 'REXxPCyI0tlWqTMMGPlg');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('oaMOlFEIsHBlsOHTlqVO', 95, 74, to_date('18-09-2004', 'dd-mm-yyyy'), to_date('19-10-2025', 'dd-mm-yyyy'), 'K90N3IRFm1TySWtir0ox');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('MsJn0CaoSD0TGaqwuDsP', 61, 442, to_date('06-03-2010', 'dd-mm-yyyy'), to_date('12-05-2028', 'dd-mm-yyyy'), 'g8sjpd4aBgDEezhZQJ5U');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('4lZQAYgusjM7iOsiXbrE', 13, 383, to_date('05-01-2011', 'dd-mm-yyyy'), to_date('11-05-2028', 'dd-mm-yyyy'), 'cqCF34kb6IOexinmoKNt');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('c2aVHdJczfcFnkqT9xZB', 51, 435, to_date('06-02-2013', 'dd-mm-yyyy'), to_date('27-02-2024', 'dd-mm-yyyy'), 'LN3rxMcyrRQnAgBVHuj3');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('rx5fmvBIk51OEVEGiCB7', 42, 194, to_date('14-01-2000', 'dd-mm-yyyy'), to_date('23-04-2030', 'dd-mm-yyyy'), '1Ilv0JitDVrBHfp0sYqo');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('KOuAimoraRbCuiyb8RkV', 96, 402, to_date('14-05-2003', 'dd-mm-yyyy'), to_date('27-08-2028', 'dd-mm-yyyy'), 'iuXr1SHikO6SUYfGt3Yg');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('a0vXJgZpTKbdgMXFiBGf', 64, 202, to_date('06-05-2004', 'dd-mm-yyyy'), to_date('01-01-2026', 'dd-mm-yyyy'), 'PWorQILJHC1VYpxHjekU');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('eSZltoQZEXTAxrCt3vyy', 14, 230, to_date('01-09-2003', 'dd-mm-yyyy'), to_date('12-08-2025', 'dd-mm-yyyy'), 'LwB6LRyaKQoHI0kZUln4');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ZbiWEM54YOhx2w0BWVy1', 0, 257, to_date('18-02-2014', 'dd-mm-yyyy'), to_date('12-11-2025', 'dd-mm-yyyy'), '1LNqNnpF7ARqTco5lD1z');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Dg4nccIVtpr34gnh8dUJ', 98, 121, to_date('15-05-2005', 'dd-mm-yyyy'), to_date('27-08-2029', 'dd-mm-yyyy'), 'bqClDl8Ssj5BFT6heK5B');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Gzj9iEsVyA0a2qbMa9tu', 79, 409, to_date('08-07-2007', 'dd-mm-yyyy'), to_date('20-08-2027', 'dd-mm-yyyy'), 'JjtxPwVassYHAOe0A9UD');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('d2zLzLXK6C5OdO2l6j9k', 45, 317, to_date('20-09-2002', 'dd-mm-yyyy'), to_date('11-08-2026', 'dd-mm-yyyy'), 'WhhMTnSos5mt1HZ0gewr');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('VoNZjETREUPoErHNvVCe', 3, 95, to_date('01-05-2014', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 'WugfdOJLS2fCoSuhryMP');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('cOX5NDdQLwZkIu1cDKyf', 29, 143, to_date('16-05-2018', 'dd-mm-yyyy'), to_date('08-12-2024', 'dd-mm-yyyy'), '2mDFwTCd53ATmkeP7wlm');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('IgEzW2nTs8uUsYpC2tDe', 82, 491, to_date('18-06-2004', 'dd-mm-yyyy'), to_date('21-09-2029', 'dd-mm-yyyy'), 'ciRDbFMZWW1Jee8sYxEA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('o47IsmvdBLtGTMidFVa0', 32, 430, to_date('07-10-2004', 'dd-mm-yyyy'), to_date('27-07-2029', 'dd-mm-yyyy'), 'DbebT3Ha7quJGaSRLWLq');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('z9Rh7S9XRL832dR7RevL', 34, 388, to_date('22-12-2017', 'dd-mm-yyyy'), to_date('25-04-2030', 'dd-mm-yyyy'), 'PGlBS2tQUQiDMc0JjYbo');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('RMElPEg3e6FBM42XSoIj', 72, 92, to_date('25-03-2009', 'dd-mm-yyyy'), to_date('19-09-2028', 'dd-mm-yyyy'), 'zMlwwqFoFwZcBWlgRytR');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('cis3n5kwVLs2W2DlCWPJ', 85, 320, to_date('24-10-2020', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), 'rL8TJmHcY1jFCbKucRNd');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('CzXQcz3apPWHN6nnAh2U', 79, 119, to_date('02-09-2000', 'dd-mm-yyyy'), to_date('20-07-2029', 'dd-mm-yyyy'), 'UxGYEXLbXx4xlEQmHYxe');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('6M1XYfgE6mZ1RsdXpDwf', 98, 433, to_date('14-01-2022', 'dd-mm-yyyy'), to_date('22-07-2025', 'dd-mm-yyyy'), 'ITRMmuZUCKzdOCd8jTn9');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('JAKkQBZ2IsCyHdcJf7NO', 56, 281, to_date('23-06-2002', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 'AxDdjMtHrkmhmI1WzD3y');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Q1z7DAQOMEIC5VXDwsP6', 13, 384, to_date('07-08-2014', 'dd-mm-yyyy'), to_date('02-01-2025', 'dd-mm-yyyy'), 'nqQPYKPtc2jQi1VWoD1F');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('X3YnVa9z96ujU95jnSzi', 11, 388, to_date('06-12-2007', 'dd-mm-yyyy'), to_date('15-02-2024', 'dd-mm-yyyy'), 'ChZeNOsnorPX0nkDz8VA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('8X1RNlK7Nkip5xEPcdpu', 9, 409, to_date('23-03-2013', 'dd-mm-yyyy'), to_date('28-11-2024', 'dd-mm-yyyy'), '8rm0KP6ILWexR6gevxed');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('7CmiLEcpUbv5oGAau4Il', 28, 64, to_date('16-03-2014', 'dd-mm-yyyy'), to_date('20-11-2028', 'dd-mm-yyyy'), '2fhQ4Ev8k4YzhEPGvDZs');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('hG0hKKC3FriiMTJ2uYtS', 8, 288, to_date('18-03-2010', 'dd-mm-yyyy'), to_date('23-08-2027', 'dd-mm-yyyy'), 'Q81OFQak5RowrQ6EqfcJ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('pCDE7rCKzqfeDJCDNjjR', 63, 283, to_date('10-05-2008', 'dd-mm-yyyy'), to_date('14-03-2029', 'dd-mm-yyyy'), 'tbL5mvHtKnEvibTem0u2');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fx15COfZeXmH1zss0APe', 37, 380, to_date('24-10-2014', 'dd-mm-yyyy'), to_date('27-02-2029', 'dd-mm-yyyy'), '1Tc80hzrN4etHxE49XEg');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('z3jdKsy6FpE9VrunWgxD', 84, 255, to_date('26-04-2004', 'dd-mm-yyyy'), to_date('26-11-2025', 'dd-mm-yyyy'), 'nt7dyTtgxDqWJI2vAJ2R');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('aMEzMnmvig1YxAoxVRo3', 64, 55, to_date('01-03-2016', 'dd-mm-yyyy'), to_date('04-02-2026', 'dd-mm-yyyy'), 'YusaNOyJ2u0B35pTAvlv');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('rDMIEQwzvOGLgAwmI8E9', 59, 42, to_date('14-08-2018', 'dd-mm-yyyy'), to_date('08-10-2027', 'dd-mm-yyyy'), 'xe4M6lHHnhfJLCLDc5OA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('29wJuzTCbAhXOMxj3GDE', 66, 259, to_date('21-03-2017', 'dd-mm-yyyy'), to_date('15-06-2024', 'dd-mm-yyyy'), 'tc2U3CSPaC7TU98NWuJ2');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('nZCfKKUFFO746eIW4FyN', 4, 478, to_date('21-07-2004', 'dd-mm-yyyy'), to_date('26-05-2028', 'dd-mm-yyyy'), 'PEcNfl8UnnO8BfolL2Gg');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('aTcXld4l2IGujbXPo5LL', 57, 21, to_date('24-12-2009', 'dd-mm-yyyy'), to_date('07-02-2030', 'dd-mm-yyyy'), 'DYBNoFuyqqdmwzeI1JNN');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('cX1JucLxMdIJoUthn7E7', 71, 248, to_date('22-07-2016', 'dd-mm-yyyy'), to_date('18-12-2026', 'dd-mm-yyyy'), 'S728CHGfen4eAxwKpYui');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('IQNFb9IrBrjOfAe4UCZB', 62, 377, to_date('02-05-2023', 'dd-mm-yyyy'), to_date('25-10-2024', 'dd-mm-yyyy'), 'OqqdO51SRy1PJpTnp6rd');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ftmH02kUUMPWAY1DMKie', 20, 275, to_date('27-08-2014', 'dd-mm-yyyy'), to_date('15-06-2030', 'dd-mm-yyyy'), 'cYZRBcBqp9hMfouoqiMq');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('J1wap6l2GbJIiVk4FOuW', 45, 442, to_date('08-10-2020', 'dd-mm-yyyy'), to_date('23-05-2026', 'dd-mm-yyyy'), 'dKuu5lXMANiYUOJXKzYo');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('quXJw1BZrJhqksNwHrFq', 20, 101, to_date('15-12-2023', 'dd-mm-yyyy'), to_date('13-08-2030', 'dd-mm-yyyy'), 'ixGtC2SXX24a6v1AuJ8W');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('mICn9KwAVgKz5HmBqvXJ', 79, 146, to_date('08-08-2015', 'dd-mm-yyyy'), to_date('03-07-2028', 'dd-mm-yyyy'), 'sU9IDGQkAdVBpMZGCsAC');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('0KTeIjciha4uwGYzzBKd', 45, 272, to_date('06-05-2011', 'dd-mm-yyyy'), to_date('05-01-2027', 'dd-mm-yyyy'), 'KTcvHlsqKsxysviPpN7T');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('nBg81lkzAEkPmOUxRwjX', 6, 191, to_date('08-06-2017', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 'sbkaYXjppwZdHKlJqoEV');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ZIwfuyspGK6UM7zLTl24', 45, 185, to_date('24-10-2017', 'dd-mm-yyyy'), to_date('26-02-2025', 'dd-mm-yyyy'), 'pvUJ0Qm1vB0XuuadeaYG');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('153Yg8SzzqCcZMXjp9wi', 16, 130, to_date('06-08-2017', 'dd-mm-yyyy'), to_date('20-07-2030', 'dd-mm-yyyy'), '35GUwPAomjUXmOY2RAFg');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('RUwEsLD7qbwtwAZljOei', 10, 12, to_date('05-12-2017', 'dd-mm-yyyy'), to_date('08-06-2026', 'dd-mm-yyyy'), 'nOf9SflnsmC5ewOWgL6J');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fM6S6LDaI4wj0yUjHcD3', 99, 255, to_date('28-03-2000', 'dd-mm-yyyy'), to_date('28-04-2027', 'dd-mm-yyyy'), 'Aa8XFn61xejNnYjyTu24');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('2S4NaZi5iRR2KlXNITZH', 2, 237, to_date('09-01-2013', 'dd-mm-yyyy'), to_date('16-02-2025', 'dd-mm-yyyy'), 'cYlME2R5T8Ui31yrXmLL');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('OJnu2UcvKOLPsEHzVOoD', 57, 242, to_date('20-10-2022', 'dd-mm-yyyy'), to_date('25-09-2030', 'dd-mm-yyyy'), 'GRF2KSWNW2eyknj69Gql');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('KF7CA8u8AlXNS02eCFK2', 59, 388, to_date('12-04-2002', 'dd-mm-yyyy'), to_date('09-06-2026', 'dd-mm-yyyy'), 'wNLES48mmxeQbaL04hCP');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('tih12Oa5RFRTjImMrzZW', 32, 6, to_date('24-05-2002', 'dd-mm-yyyy'), to_date('20-05-2027', 'dd-mm-yyyy'), '6hIA17XpvRVvfZfaxeLn');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('vUZ139gTC312cHa588oXE616zUI490aRJ910fAP188nKc950wR', 19, 3, to_date('22-06-2276 01:31:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-09-2928 22:34:10', 'dd-mm-yyyy hh24:mi:ss'), 'Mexico');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('xZa979nNs961zAV911sDd149aDi852mEi510eAp639jAI222nJ', 5, 8, to_date('10-01-2937 06:34:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-07-2772 20:00:57', 'dd-mm-yyyy hh24:mi:ss'), 'Brazil');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('mBv559zVG832zSd913qDm698wIl187wVq271zKE753aBp530qZ', 5, 9, to_date('14-04-1948 22:14:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-09-2039 10:12:51', 'dd-mm-yyyy hh24:mi:ss'), 'Netherlands');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('gWz498tLR013gNM165jDj257mOF857dCr646wHT166fNy161sE', 0, 8, to_date('17-03-2877 13:42:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-03-2462 19:17:02', 'dd-mm-yyyy hh24:mi:ss'), 'France');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('uMs242qAq365vJx776sET676yGf512iMS931kTX698sDJ080fD', 16, 2, to_date('29-06-2509 15:38:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-07-1956 20:03:50', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('uMZ923gRw240oQY646cGH242aMB647dOx544sHJ387yBl952rJ', 2, 9, to_date('23-07-2279 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-06-2251 16:47:34', 'dd-mm-yyyy hh24:mi:ss'), 'Germany');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('aSh320jUE281aOF923uNg726wPz691kYq770kBP843iGs793bZ', 0, 1, to_date('21-09-2922 09:49:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-03-2479 04:46:16', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('kGy840pOa828jPq235hRm920uOT718fYd116aXC771tPQ830tE', 4, 6, to_date('20-03-2463 01:16:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-07-2395 09:54:17', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('cEV621vAv029iML051gQA262hJk365tXf111eTl883aZQ156dC', 8, 15, to_date('13-12-2077 13:59:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-10-2685 12:04:01', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fAy235cTa327fSv726iKU858jOH381cOO412gEP062wIW445mV', 10, 7, to_date('20-10-3039 06:42:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-06-1925 05:19:40', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('vUN771vHu044tMb895wPj042kWr847bYh147lEG632fNA643wB', 1, 7, to_date('17-05-2972 14:08:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2483 07:25:40', 'dd-mm-yyyy hh24:mi:ss'), 'United Kingdom');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('bUK028yTS722fKP515oPB115lTd910hKF065cSJ393gGp584pY', 18, 2, to_date('21-12-2645 04:00:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-08-2626 13:08:49', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
commit;
prompt 400 records committed...
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('hCm571dFK732oWk760kKd766fEh076yGH279jLh412aIP283xC', 1, 11, to_date('05-02-2980 14:15:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-05-2979 20:14:03', 'dd-mm-yyyy hh24:mi:ss'), 'Portugal');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('qKC996yOB344qOf213aYG286zKK132wRO110bCG149uSt189gS', 20, 9, to_date('15-10-2143 21:29:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-11-2572 18:56:00', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('dGl642jJo693jZs463eQI050tWU032zZB694vQl720sBK771uM', 20, 14, to_date('30-10-2680 10:34:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-01-2314 15:47:13', 'dd-mm-yyyy hh24:mi:ss'), 'USA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('yxaXd3JrCM1eLZlhsjnH', 8, 406, to_date('14-11-2003', 'dd-mm-yyyy'), to_date('23-06-2019', 'dd-mm-yyyy'), '1w3PIuE88UJagM2jhJE4');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('NWLBldsT2NHYzVh4gRlQ', 40, 310, to_date('13-04-2020', 'dd-mm-yyyy'), to_date('09-01-2011', 'dd-mm-yyyy'), 'FnIdaZlPN9cTHycxUekW');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('p0eqB0mOG8EB8vl04mmP', 97, 427, to_date('02-04-2006', 'dd-mm-yyyy'), to_date('07-12-2014', 'dd-mm-yyyy'), 'kppbNvyl5OznHfzxviXX');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('XUE8nup3IyWkrFd1hOXz', 15, 467, to_date('29-08-2014', 'dd-mm-yyyy'), to_date('02-01-2021', 'dd-mm-yyyy'), 'g1Cy2TUCswBuMZYdGXG9');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('G8yW6ZV5XHtQwfvukDPy', 88, 101, to_date('18-10-2002', 'dd-mm-yyyy'), to_date('13-08-2014', 'dd-mm-yyyy'), 'JJ8G0yw0GFoWzSVzRVCu');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('v20HbaVMw7LeiFa7DJ5r', 86, 83, to_date('20-05-2006', 'dd-mm-yyyy'), to_date('11-07-2020', 'dd-mm-yyyy'), 'ws31u5JqGTnphs6PhAAX');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('j7SCZBKW2aIzFda1iRda', 69, 17, to_date('21-02-2008', 'dd-mm-yyyy'), to_date('10-06-2004', 'dd-mm-yyyy'), 'CaycJ3rqa5WE176nXuaB');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('vU7a8rmlA6bQsH5nPguP', 15, 336, to_date('11-09-2000', 'dd-mm-yyyy'), to_date('07-08-2006', 'dd-mm-yyyy'), 'RLNxES4Q2ufZUvfPGW1B');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('jV8GZALjLz7Z9XMYVEPt', 87, 267, to_date('17-08-2018', 'dd-mm-yyyy'), to_date('18-08-2023', 'dd-mm-yyyy'), 'Z7qjNypKReVXQ682vwEP');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('gH7NC07V3Jf2t1TeDh9z', 49, 326, to_date('14-02-2010', 'dd-mm-yyyy'), to_date('03-04-2002', 'dd-mm-yyyy'), '9FMi41JqlBCTjPVIPI8Z');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('c2tPmrNlE3CG9xGKjy91', 66, 451, to_date('26-02-2004', 'dd-mm-yyyy'), to_date('07-01-2007', 'dd-mm-yyyy'), 'XCA0SAGhLZg2kIWBtzLG');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Q1s7gBY3j5EHJoPsaSgR', 93, 267, to_date('20-03-2002', 'dd-mm-yyyy'), to_date('29-06-2016', 'dd-mm-yyyy'), 'FBTAbYXAK5RIoWVbP6Iz');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('tZxyWbqqFEStu4LZow4x', 41, 373, to_date('11-02-2011', 'dd-mm-yyyy'), to_date('21-02-2013', 'dd-mm-yyyy'), '7OvKFJdd4tRoHyQ43H3Y');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('g51yTUoYY79GmBhUMzPG', 68, 59, to_date('31-12-2007', 'dd-mm-yyyy'), to_date('31-01-2000', 'dd-mm-yyyy'), 'eDOG5jjqlKZ5oXzYTYPv');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('1R5S4S4qqF5fHxNF5waO', 31, 416, to_date('14-02-2008', 'dd-mm-yyyy'), to_date('07-04-2021', 'dd-mm-yyyy'), 'SBXg3V4IT9vcXEGYWHVi');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('SwJ95ckJDcpNNjKypX49', 47, 71, to_date('25-02-2002', 'dd-mm-yyyy'), to_date('30-09-2001', 'dd-mm-yyyy'), 'RIg5p2AgfzaDZA4S70wy');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('gUj9AiQ5Xb1jio7Dya9P', 2, 394, to_date('05-06-2020', 'dd-mm-yyyy'), to_date('30-11-2022', 'dd-mm-yyyy'), 'LaXDw1YIBNwxwccwc5K8');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('BucEuUvJSB2wNgXZM4im', 90, 185, to_date('24-05-2021', 'dd-mm-yyyy'), to_date('05-10-2004', 'dd-mm-yyyy'), 'aICLrPpYAtMAmue5gmmP');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('KR2VIerKF4mEkOx6oqAl', 58, 207, to_date('20-11-2018', 'dd-mm-yyyy'), to_date('17-05-2019', 'dd-mm-yyyy'), 'E016GtyKMzssI7wrax5o');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('yaONBq9LndfoiZM4fUSC', 87, 360, to_date('13-10-2016', 'dd-mm-yyyy'), to_date('19-02-2019', 'dd-mm-yyyy'), 'qLisPpknTUNZG8uWBsbo');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('somY7DiSxYls92QWNhQe', 100, 214, to_date('19-04-2022', 'dd-mm-yyyy'), to_date('05-10-2000', 'dd-mm-yyyy'), 'wAz1oForI463fhFyu0wl');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('XYffQFbYihOUZI95IN1u', 30, 230, to_date('18-10-2004', 'dd-mm-yyyy'), to_date('20-05-2008', 'dd-mm-yyyy'), 'OuVpTn0RKVZuWdSbqPuQ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('bWA3ZKXWRxvSm2gz8kuF', 6, 346, to_date('08-05-2000', 'dd-mm-yyyy'), to_date('23-05-2020', 'dd-mm-yyyy'), 'D4hTiRaAgDAtutXw39B8');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('kX4qKDSAHxBtNcLP2YcS', 30, 87, to_date('21-01-2004', 'dd-mm-yyyy'), to_date('08-01-2003', 'dd-mm-yyyy'), '4CT80u3RFMQ2UoABpTDP');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('mmIZZCLPZWQZ7011FBV8', 4, 11, to_date('27-01-2008', 'dd-mm-yyyy'), to_date('13-04-2012', 'dd-mm-yyyy'), '2jhuFRUsqL25YaRIM0oK');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('pRq0s5DjzbkomDuyRyJ0', 97, 290, to_date('16-06-2021', 'dd-mm-yyyy'), to_date('04-03-2013', 'dd-mm-yyyy'), '6f5fGxoprqh2d5hjhaLQ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Ku5iuPeNH4NJLq26LXYK', 83, 136, to_date('07-05-2011', 'dd-mm-yyyy'), to_date('30-01-2003', 'dd-mm-yyyy'), '21JZdqqhHaccBPoLUOft');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('UT4youtCA4ybT3od2oW0', 50, 130, to_date('15-08-2014', 'dd-mm-yyyy'), to_date('30-12-2021', 'dd-mm-yyyy'), 'vowNCvxkm819IGOery6A');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('XrGJVcwjQRNAbQNxKJfv', 91, 87, to_date('29-05-2017', 'dd-mm-yyyy'), to_date('18-01-2019', 'dd-mm-yyyy'), 'bwwYwmicKAj01vqAQcUf');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('U3f5KuhaQEcXGyOUpx2R', 1, 188, to_date('03-07-2001', 'dd-mm-yyyy'), to_date('15-01-2023', 'dd-mm-yyyy'), 'BcXmiKWUHDjLWSYXUhyQ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('oKWAMxq2zaKM06v66SnX', 25, 242, to_date('17-03-2021', 'dd-mm-yyyy'), to_date('23-04-2011', 'dd-mm-yyyy'), 'Y8ABEvq2J6OgMjMbnxEV');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('OouCOLPGnNgMmDYTYwH9', 23, 150, to_date('09-10-2016', 'dd-mm-yyyy'), to_date('18-09-2011', 'dd-mm-yyyy'), 'UoJgb7w0qBJnJB5NDdOE');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('J63DTlzU0ntL6vYP1iBQ', 8, 298, to_date('30-11-2007', 'dd-mm-yyyy'), to_date('21-11-2015', 'dd-mm-yyyy'), 'gMnD3MkaqwTNaSvVaRyT');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('wbHsqIGnvNQO5NyJqN3E', 14, 60, to_date('09-12-2021', 'dd-mm-yyyy'), to_date('11-02-2004', 'dd-mm-yyyy'), 'Yp4zcpysKjtjBrjVMKUl');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('7PLdg5wE8Xz8H4UZjz8o', 67, 364, to_date('19-06-2006', 'dd-mm-yyyy'), to_date('02-11-2009', 'dd-mm-yyyy'), '7NJ2892CUJThoATs0hVO');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('DT6sjIf3nuabsxmuGddL', 48, 278, to_date('02-11-2013', 'dd-mm-yyyy'), to_date('21-06-2017', 'dd-mm-yyyy'), 'f5r68MaN21w56lULIX3o');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('n8S3wGYZylu8HbpeGuuP', 100, 249, to_date('30-07-2020', 'dd-mm-yyyy'), to_date('25-05-2006', 'dd-mm-yyyy'), 'qbuiGME6zGK8K0dEmfo2');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('anRVbFT5s62YEkCgu9MF', 84, 434, to_date('08-06-2019', 'dd-mm-yyyy'), to_date('07-08-2000', 'dd-mm-yyyy'), 'dVMYJ6pI0IbprxRYHmrR');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('FeIViBbWtZaCVJ4IfDA5', 46, 364, to_date('11-12-2016', 'dd-mm-yyyy'), to_date('22-09-2002', 'dd-mm-yyyy'), '5PGezKW618tKTPB5Cnbs');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('JiSjE5nSCf73HoP09mCG', 58, 483, to_date('15-06-2019', 'dd-mm-yyyy'), to_date('02-09-2015', 'dd-mm-yyyy'), 'vsVuMpoXIo3Qt15wNUj9');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('YyqfvzM8DvAwRyqtZ5aW', 28, 260, to_date('28-08-2009', 'dd-mm-yyyy'), to_date('22-07-2016', 'dd-mm-yyyy'), 'miCiRULHc4hoTP7h5YSQ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('BTCaTbNAdQvH0VbiHorD', 37, 279, to_date('10-04-2006', 'dd-mm-yyyy'), to_date('18-06-2013', 'dd-mm-yyyy'), 'ky9oiLu03CowDokFfH3U');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('haizCT2Oqoq1ZgysluKQ', 30, 216, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('24-08-2012', 'dd-mm-yyyy'), 'NuvZWUBNt3BaN6hhSuPt');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('qChyOqG2A0I4eeNhWBD5', 50, 470, to_date('04-05-2015', 'dd-mm-yyyy'), to_date('16-01-2012', 'dd-mm-yyyy'), 'eJqtNoSbVux2usHDRx8C');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('iCMgZ0pwTlzosqMiAO8i', 49, 420, to_date('23-01-2014', 'dd-mm-yyyy'), to_date('10-05-2006', 'dd-mm-yyyy'), 'cziiTur6jPz3x56cqVjs');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('pm3NW43RAfpWgRtsPHip', 19, 63, to_date('19-10-2015', 'dd-mm-yyyy'), to_date('15-09-2002', 'dd-mm-yyyy'), 'WQuwO7KMAZWI5Wkp8wsR');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ZZWjDEOCTAsJdSlMYzBW', 93, 264, to_date('03-08-2013', 'dd-mm-yyyy'), to_date('01-03-2006', 'dd-mm-yyyy'), 'nQHQ383DzNHg0Xjt9BZH');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('HonifQl9QXMKw7hMDQJI', 83, 273, to_date('25-07-2011', 'dd-mm-yyyy'), to_date('05-09-2000', 'dd-mm-yyyy'), '5jlvL6Zd5KMOaKna55RY');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('mO9gBCFifVPNlWAh64De', 99, 482, to_date('26-07-2016', 'dd-mm-yyyy'), to_date('26-05-2010', 'dd-mm-yyyy'), 'aO6hvaHacWlyZ6N7wJ3d');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('FuByAgTIuAYWDE7afIj6', 57, 212, to_date('08-06-2019', 'dd-mm-yyyy'), to_date('10-05-2005', 'dd-mm-yyyy'), '6yKyPrDbp6pvqhssirza');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('rhZIw6dShGBKMp5mHKGk', 66, 33, to_date('29-04-2001', 'dd-mm-yyyy'), to_date('02-06-2009', 'dd-mm-yyyy'), 'l71eCC23Q13mKUsLW345');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('rl4HEp7VCXksPTPr3Sjt', 20, 308, to_date('30-10-2002', 'dd-mm-yyyy'), to_date('29-04-2016', 'dd-mm-yyyy'), 'euUjjCbnVFZCjen09v9D');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Y1jjKSKT9Yan1vPa6x7s', 77, 264, to_date('22-03-2003', 'dd-mm-yyyy'), to_date('08-09-2021', 'dd-mm-yyyy'), 'F70VJucA7mgTTAc8FDM1');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('3LgjCMl5ZrHtOkpHWjBF', 44, 449, to_date('29-11-2018', 'dd-mm-yyyy'), to_date('16-12-2021', 'dd-mm-yyyy'), '3FoFAGOuLeXusc41Voih');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('u280HkUuBZ6JK2D1WIUv', 19, 467, to_date('06-04-2014', 'dd-mm-yyyy'), to_date('09-02-2005', 'dd-mm-yyyy'), '9wXKoaspBzfJTMFTgJox');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('yttDiHKPFFvtj65CW5aN', 59, 236, to_date('13-02-2002', 'dd-mm-yyyy'), to_date('06-12-2023', 'dd-mm-yyyy'), 'dfhT05KlwYQ9reiC93Cd');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('VFszeI8fEquQllp0uLKg', 91, 493, to_date('18-01-2020', 'dd-mm-yyyy'), to_date('25-04-2009', 'dd-mm-yyyy'), 'WVP2YygWnSjNGUAArObF');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('BNBxwc25FV97fWtFD7JJ', 81, 391, to_date('17-02-2021', 'dd-mm-yyyy'), to_date('09-02-2012', 'dd-mm-yyyy'), 'mM4GVKGhh5mrlHW2ntT1');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('y4r3BeHmq5O4hivCD2QA', 98, 171, to_date('20-02-2015', 'dd-mm-yyyy'), to_date('21-05-2013', 'dd-mm-yyyy'), '8gAHiPhD7UxLHfKxywt0');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('6k6Eau6DMaADpsvcLYmI', 51, 208, to_date('05-01-2012', 'dd-mm-yyyy'), to_date('29-09-2010', 'dd-mm-yyyy'), '7b1IndDYkiuaZKH9CJ0V');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('YteW2nLkHJLAM4l1Gl30', 11, 89, to_date('20-04-2001', 'dd-mm-yyyy'), to_date('24-03-2016', 'dd-mm-yyyy'), 'Ei3uwmwcWuIeYLUI2kEt');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('SaHkEJS0Kgn7PeWIXeuf', 36, 413, to_date('12-04-2023', 'dd-mm-yyyy'), to_date('20-02-2011', 'dd-mm-yyyy'), 'PYVWFdAmJvjuMk4LW8uU');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('tUHMhIkKYXYgYCdqFWwv', 54, 122, to_date('09-08-2012', 'dd-mm-yyyy'), to_date('07-12-2009', 'dd-mm-yyyy'), 'v5tCj0NldQdM9t9JVT0G');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('uqkWzKN0YatbapdYazQW', 100, 326, to_date('14-02-2007', 'dd-mm-yyyy'), to_date('30-01-2007', 'dd-mm-yyyy'), 'YU7Dt7Vg7oD0wf5YwRwd');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('LD1S7vAbpYPdXjEas3eD', 55, 42, to_date('30-08-2007', 'dd-mm-yyyy'), to_date('18-09-2008', 'dd-mm-yyyy'), 'MxKSdndkNXELElIECDkI');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('EreVdc2iCSV1Sm2aV3af', 20, 88, to_date('08-02-2010', 'dd-mm-yyyy'), to_date('23-12-2020', 'dd-mm-yyyy'), 'dghpUVcz6rmTiQv8ljnt');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fBC1cnJtxnpncUSrj4Jn', 75, 112, to_date('24-10-2023', 'dd-mm-yyyy'), to_date('30-06-2017', 'dd-mm-yyyy'), 'jJCYRHB7VfbvHp8LE6pJ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('8S9jnCSI1u2yZOxdSPBz', 82, 172, to_date('06-10-2023', 'dd-mm-yyyy'), to_date('26-07-2020', 'dd-mm-yyyy'), 'dG39wEgRUjizRtb6m3T5');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('rJxyL8SlVT7IgMqOvrce', 33, 454, to_date('31-10-2016', 'dd-mm-yyyy'), to_date('25-03-2012', 'dd-mm-yyyy'), 'fLKQeeS3VezZE4pnP3Tq');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('XXTHvvl9elQNITvzD3C7', 12, 373, to_date('11-12-2014', 'dd-mm-yyyy'), to_date('07-01-2016', 'dd-mm-yyyy'), 'aP3BBtETjbEKQei4bAPv');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('nR7NRT7eA26BiF0tzYhG', 97, 365, to_date('09-11-2018', 'dd-mm-yyyy'), to_date('26-12-2017', 'dd-mm-yyyy'), '9OKS5AyTCAAmczTgV8O3');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('lpOS4CJmx0Hg6vXcCCVV', 52, 271, to_date('25-03-2009', 'dd-mm-yyyy'), to_date('31-01-2001', 'dd-mm-yyyy'), 'bCuVY9VRXw31rkRtrVky');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Vlrj7xWAsLAkvN9XG5q8', 94, 82, to_date('28-03-2020', 'dd-mm-yyyy'), to_date('22-03-2020', 'dd-mm-yyyy'), 'O244ZdEsyqFajmmekLAN');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('N56msfCOtFIiP4WNEpeL', 62, 448, to_date('26-10-2019', 'dd-mm-yyyy'), to_date('30-09-2011', 'dd-mm-yyyy'), 'ArTsAfCkhUMBhHvsssjA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('fw8vScVyBteAI6yZY2D9', 56, 486, to_date('12-06-2013', 'dd-mm-yyyy'), to_date('08-10-2021', 'dd-mm-yyyy'), 'yUkIANOBBuCkJBTLNeoB');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('2wKLK15qocPNrOTKPTGb', 39, 458, to_date('27-03-2008', 'dd-mm-yyyy'), to_date('09-11-2019', 'dd-mm-yyyy'), 'qGpzpv4kXsuD2uGIKaNl');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('Dvh5ZPWTUtzdnSyL8bfR', 50, 80, to_date('14-02-2020', 'dd-mm-yyyy'), to_date('22-05-2011', 'dd-mm-yyyy'), 'LXJqjdEsn0xCQvxWZKCx');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('pbIYBVVNmCKCAyRP4C2d', 63, 402, to_date('25-07-2008', 'dd-mm-yyyy'), to_date('06-05-2001', 'dd-mm-yyyy'), 'Ki13MQ0m1OKkhPDgj2ZK');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('y0P5GaIVzO1wEqlXHeyD', 35, 15, to_date('06-04-2010', 'dd-mm-yyyy'), to_date('04-12-2014', 'dd-mm-yyyy'), 'RBmzDQ9rzK1gE4WqXYEQ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('StGeKwCX7qHStMDuOD73', 31, 437, to_date('08-06-2002', 'dd-mm-yyyy'), to_date('14-05-2011', 'dd-mm-yyyy'), '4ObwzSwpCHlpbmFOnkpN');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('jBzzDFV8fWqu5Sy1zCNN', 65, 373, to_date('24-01-2015', 'dd-mm-yyyy'), to_date('16-03-2016', 'dd-mm-yyyy'), '8mVqCK1erOY5iuzfynPW');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('bgr1PgxCrPeAdwMWUC1r', 71, 41, to_date('28-12-2012', 'dd-mm-yyyy'), to_date('27-12-2022', 'dd-mm-yyyy'), 'TBSM5COXJi5Xp7fxRfhy');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('FslY90JVKToZtqEnGCao', 40, 493, to_date('03-02-2023', 'dd-mm-yyyy'), to_date('26-06-2014', 'dd-mm-yyyy'), 'eX8q749ZIHhtMMiDsLP7');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('C2dVR5iaq182uuhI3eA4', 57, 364, to_date('27-10-2000', 'dd-mm-yyyy'), to_date('12-10-2018', 'dd-mm-yyyy'), 'vy8QYXAtnMXhzqmWyerB');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('WZmtjukg6FlAAIQStZoT', 48, 97, to_date('11-10-2006', 'dd-mm-yyyy'), to_date('20-02-2021', 'dd-mm-yyyy'), '41cedyESOwFtV6jHccXQ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ADdmQOmxmmeUp8oy0Fm8', 49, 167, to_date('20-04-2006', 'dd-mm-yyyy'), to_date('04-10-2017', 'dd-mm-yyyy'), 'hQfKkOzqeV5mc8b6omSr');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('6VpbupTeQl3uTujUeDJX', 93, 6, to_date('30-05-2015', 'dd-mm-yyyy'), to_date('05-03-2011', 'dd-mm-yyyy'), 'jsaugxjcdSSH4OPa2vOG');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('qHK2cBne4GHKETcSgwHO', 32, 42, to_date('29-02-2016', 'dd-mm-yyyy'), to_date('27-03-2018', 'dd-mm-yyyy'), 'JGcznnrIW4MBr6K0C4KA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('ggfDyVrMRJ8pkrIuAbbq', 97, 19, to_date('10-11-2022', 'dd-mm-yyyy'), to_date('04-03-2011', 'dd-mm-yyyy'), '9724IWplJZZ0pcHRQaBL');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('05vaMiA7idqBtEvzHwTU', 5, 139, to_date('31-10-2010', 'dd-mm-yyyy'), to_date('25-02-2002', 'dd-mm-yyyy'), '93kEjW3qBfVYm3yLHm36');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('0OHACilvqV5NUgTIdFW8', 23, 384, to_date('13-08-2011', 'dd-mm-yyyy'), to_date('23-01-2019', 'dd-mm-yyyy'), '5lgwGr5Wn1HU1Y9DZN7C');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('1e5vjlC8eH8hWr4vn3AN', 14, 389, to_date('12-02-2002', 'dd-mm-yyyy'), to_date('11-05-2003', 'dd-mm-yyyy'), 'mVCHzsk19goUTWmNqCKE');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('EEh25VIvlafwPXIqqxdA', 99, 140, to_date('01-08-2011', 'dd-mm-yyyy'), to_date('31-10-2011', 'dd-mm-yyyy'), 'Fg0rA5zm3Wop18B86GCQ');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('TbVm9UI7DPyCRZze9nqH', 67, 444, to_date('16-11-2019', 'dd-mm-yyyy'), to_date('17-02-2016', 'dd-mm-yyyy'), 'X1PpKkJitEQkAolF8d2v');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('W7JhIgFjRCCyYByNbvUd', 16, 299, to_date('16-12-2003', 'dd-mm-yyyy'), to_date('06-09-2029', 'dd-mm-yyyy'), '27EdTJ1FZVfoeLMT5gMI');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('9rYSkYUYqurcMneaooE0', 10, 261, to_date('20-10-2010', 'dd-mm-yyyy'), to_date('17-08-2030', 'dd-mm-yyyy'), 'QS79tsUiT43RBcEKEYOA');
insert into TEST_TUBE1 (testtubeid, material, volumecapacity, purchasedate, expirydate, locationtesttube)
values ('48qfDwEqklRsWyx9a17i', 15, 155, to_date('02-06-2012', 'dd-mm-yyyy'), to_date('17-05-2024', 'dd-mm-yyyy'), '64yoVfkpEjoLI5Qja7jb');
commit;
prompt 500 records loaded
prompt Loading DEVICETEST_TUBE1...
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('j5c5IAX7JjRRUp7vwYea', '7TAnnzQvpzBzHnK2eytW');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('j5c5IAX7JjRRUp7vwYea', 'cis3n5kwVLs2W2DlCWPJ');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('jB9CA4SIKdE5adCZJnUD', 'NkraxUdkmDkoDLfDaTDm');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('jB9CA4SIKdE5adCZJnUD', 'ziijwkEvZrX273arkI4G');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('kQSaTyQe5QNNfYpSvax4', 'Q1z7DAQOMEIC5VXDwsP6');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('ktCL4nMRHmIDuZpTSJck', 'JqRwnCoajVpsABi4gxMR');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('lMlRIPJ8h9zOy8w8DBri', 'Re0tE5DrSbadw5633QVb');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('lMlRIPJ8h9zOy8w8DBri', 's7ybUQ6bHZZr4ndIngEQ');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('mAOgjTnXclwq7ypjwa0Q', 'rhp6fbTJ4zJbFcKcfOay');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('meOTZarSrFgE7ijK67RL', '9AKU1sOifumqJ5De4jEg');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('meOTZarSrFgE7ijK67RL', 'UWQVWcUtsZBJskTWAp7n');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('mtFJ2r1Hk4tvEEQWtA86', 'Yswpy6NyhnbXCtt0NCFt');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('mtFJ2r1Hk4tvEEQWtA86', 'vrIhwcInaNYxw6P3lLqI');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('mzDOJN7jZHZE4gD2LD11', 'JCxqJEyaQke5GlVioXwp');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('mzDOJN7jZHZE4gD2LD11', 'W7JhIgFjRCCyYByNbvUd');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('mzDOJN7jZHZE4gD2LD11', 'oLgCmY25ncjWNUYqUchQ');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('mzDOJN7jZHZE4gD2LD11', 'xMawiPejBrLSwfaEEy09');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('nMHhXVXG8lyobGKKFnba', '8X1RNlK7Nkip5xEPcdpu');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('nMHhXVXG8lyobGKKFnba', 'Re0tE5DrSbadw5633QVb');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('nsax8QUYy8jMhyke157s', 'gpKCZnHsxk5S5qg0QmPw');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('ombfWRm1sjIGOuObKz5K', '48qfDwEqklRsWyx9a17i');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('pOmuSefuIvJ5x8b6Bg26', 'VFVL02D2Pz4yqFnh4jHu');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('pOmuSefuIvJ5x8b6Bg26', 'nSKDoyaH66th5mrnxdCM');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('pmR9fMfU2cgbYBqXuFUo', 'juTWZa7oAKlTSyr5uTwX');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('q0O5KYLHRwWhRUoLkDKb', 'ItZkS3JAVz7aj76srcik');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('q0O5KYLHRwWhRUoLkDKb', 'YUMeiRvLvZhgearHQbvn');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('qNTbsfMluCqN9TD5EQCc', 'JtDlXdz8PcHBkw1WzLlE');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('qR2QR6I1p8fbBgEfgisk', 'Jh82ywEAJjT2ROdOG4G3');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('qaiTQ63arfHMx5BaDeF9', '5pD1xi8D6MbP7JtP2M2o');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('qiEPmjrQzcVFi10mmOlj', '5IDYsIcbZYYI46Kbq7Dk');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('qiEPmjrQzcVFi10mmOlj', 'LAFiIaBVBHjEcWZ4J0B7');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('rCtYfzy2lJ9ZD7fVWsm3', 'rwmYBgZ8YlNYs4SoxWsY');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('rCtYfzy2lJ9ZD7fVWsm3', 'vrIhwcInaNYxw6P3lLqI');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('raPgsWLXWN3l3QZkr2Tv', 'Vhh703tZIp1tZ7GoZbWX');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('s40fhEmdiCDxZajebLUH', 'IL4PxfZmxPfT7ehuqbRI');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('sAdbjLCWS0DToL9KHoDX', '2S4NaZi5iRR2KlXNITZH');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('sAdbjLCWS0DToL9KHoDX', '5pD1xi8D6MbP7JtP2M2o');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('sAdbjLCWS0DToL9KHoDX', 'IgEzW2nTs8uUsYpC2tDe');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('sAdbjLCWS0DToL9KHoDX', 'cOX5NDdQLwZkIu1cDKyf');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('sAdbjLCWS0DToL9KHoDX', 'lxNuzyE2Ssb1o9JllqWx');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('sZOAkhoJz5cCVwNxRHBj', '7zKQ7H5Ts6xyP1BZrIMo');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('tWqdhZ35Xr1iHTWFRSEU', 'dmIVxo5up87POTs4rZMP');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('taixM5UCNKyzxI7QdRky', 'rhp6fbTJ4zJbFcKcfOay');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('tzhMeoUrxhUkDtCNNwhB', 'nZCfKKUFFO746eIW4FyN');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('uJ5ry4skrj9wkDHsDCSC', '0X3Ijgf4gQWiZAQET55N');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('uJ5ry4skrj9wkDHsDCSC', 'rhp6fbTJ4zJbFcKcfOay');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('uK0AdgGAIFE3ih8GdYFO', 'm4XEBouZeuybMyIpkcWc');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('ux61GdY3kzAfPVFXgeej', 'aBYVdn6r3tXuK5dehF3A');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('vNcAXeKVfFRjuFrgpmgj', 'cis3n5kwVLs2W2DlCWPJ');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('vNcAXeKVfFRjuFrgpmgj', 'lqNjf7s4RYSfyBK4ruyZ');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('vZbvi2NoWbPccKlUuFYG', 'F5ZqC646NM31gft5jpNw');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('vjYoPWBEjfe1p8pjWuzy', 'cX1JucLxMdIJoUthn7E7');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('vssuOoN770YhOllvsPVV', 'Tp5lqMcbXylXvtXPoTt4');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('vzaI6njXzib5l88YrVXS', 'c2aVHdJczfcFnkqT9xZB');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('wEmcZaCaV8tdcxprUxvy', 'RUwEsLD7qbwtwAZljOei');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('wEmcZaCaV8tdcxprUxvy', 'a0vXJgZpTKbdgMXFiBGf');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('wKxAxjSm2zHtUNeTFwLY', 'H36lpnfxLiNVde3Qc80k');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('wKxAxjSm2zHtUNeTFwLY', 'vuLg3nWnxhAwVSpBzVh1');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('wKxAxjSm2zHtUNeTFwLY', 'zzwKhNIRjQ8HwJMwUSGP');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('wM873rotDfcCJCToR4lQ', 'VE5cNYoVJ80qrhYcb5B7');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('wM873rotDfcCJCToR4lQ', 'kI2eLQnGZVKaXR0NHeVc');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('wM873rotDfcCJCToR4lQ', 'v1EYGyPcag4VCAoT1nE8');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('wclEysjSGsQG46yMWT7I', 'WP91tHXZOg3ZeIYlMXLo');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('x5R5A0nCmkR1z7Gpq7M4', '0X3Ijgf4gQWiZAQET55N');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('x5R5A0nCmkR1z7Gpq7M4', 'unrUa8nNig0XvrPWLjaN');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('xHmaZn45Kuy3sWIFa2K6', 'xSQSE5Oh1ecif22LZLgO');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('xHpk7Yx89xGvVRakS5Ox', 'ItZkS3JAVz7aj76srcik');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('yDA8k3t9c1pPRwC2dI7Z', 'JCxqJEyaQke5GlVioXwp');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('yDA8k3t9c1pPRwC2dI7Z', 'YUMeiRvLvZhgearHQbvn');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('yTov8KvDBHgbKNd04Szn', 'JJxecv0MvcZMGORGS10L');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('yylksanN6KMpmznFUkj9', 'hpjAcODbiQEFS7HIsCI0');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('zZ4xRXgF3KcD8uoABCac', 'C6GDuFYkXkXKpQwKFxF2');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('zZ4xRXgF3KcD8uoABCac', 'MBneLoLOYezmFmncrzZC');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('zZ4xRXgF3KcD8uoABCac', 'QMZ62f6VFxAj9ae0V0mR');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('zZ4xRXgF3KcD8uoABCac', 'Qpo2PcIecvGZXZjOmICP');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('0o3InEATBqky2vJOibhK', 'Q1z7DAQOMEIC5VXDwsP6');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('18lDbm0F0pT08L9pAb6P', '2r4UkRf5ojjh43XffMJz');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('18lDbm0F0pT08L9pAb6P', 'esOdgmmrVgqGG74ZqksM');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('1NRC0VGhWcvBIegtcUao', 'a0vXJgZpTKbdgMXFiBGf');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('2Fj2QuBEU3QmP8qSMBHV', 'aiCCNfpCznP9Qjein6Qo');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('2lkZRvlq7LSLMPnbw4vf', 'Gzj9iEsVyA0a2qbMa9tu');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('2lkZRvlq7LSLMPnbw4vf', 'KOuAimoraRbCuiyb8RkV');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('2lkZRvlq7LSLMPnbw4vf', 'quXJw1BZrJhqksNwHrFq');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('34tJteNGx3z4xUmYHXOY', 'kI2eLQnGZVKaXR0NHeVc');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('34tJteNGx3z4xUmYHXOY', 'nCjs4vyxnNZULKfVD1mj');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('3JwIU9dGEKtdyfH8LY5w', 'aBYVdn6r3tXuK5dehF3A');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('3h5ggjXUeEB2Gr8WzzWa', 'MYWmDoTF7SGwCBFHcMLr');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('3h5ggjXUeEB2Gr8WzzWa', 'PlZV6B3pQyg98okwSns8');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('3iqH728bBOK0OYFDVD8c', 'oq75G8kqnARB5K45q8aX');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('3iqH728bBOK0OYFDVD8c', 'pAWlYSsAxAUqphVStjoS');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('3iqH728bBOK0OYFDVD8c', 'teMeyrsxOR5tSJowNZTr');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('4JA1CUueKS9gvHXM3MTE', '0uDORrwyiEG0KXa6v9EO');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('4bcavPduDjDOVow8thbH', 'Keiu2WmkL5sZvdJLNQ42');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('58dZj4WYdD99eejuPcpd', 'Re0tE5DrSbadw5633QVb');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('7nuqmAJj29MDPNk31Tsr', 'OurZyOvGhG80NKPdYoUO');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('7nuqmAJj29MDPNk31Tsr', 'UWQVWcUtsZBJskTWAp7n');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('7nuqmAJj29MDPNk31Tsr', 'hpjAcODbiQEFS7HIsCI0');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('7nuqmAJj29MDPNk31Tsr', 'jmHkeexmOfKS72wRfDFB');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('7nuqmAJj29MDPNk31Tsr', 'kxfK9AbomBjLgF9kdiOc');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('8Q0qLjFMnzZHfm8YXj3f', 'DoASihvhsPsmmISK1Fo0');
commit;
prompt 100 records committed...
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('8Q0qLjFMnzZHfm8YXj3f', 'wxKzHbi39v4jYRzYRl3B');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('8ymwd7Cm9aTp4GWUkRYZ', 'JAKkQBZ2IsCyHdcJf7NO');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('961KcZSuRAqBJwu9xLS7', 'Vdq9FHhTOaIQIwZQfa1S');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('961KcZSuRAqBJwu9xLS7', 'vrIhwcInaNYxw6P3lLqI');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('961KcZSuRAqBJwu9xLS7', 'zzwKhNIRjQ8HwJMwUSGP');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('9dRI118JtyYNwVMZ7ff2', '9AKU1sOifumqJ5De4jEg');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('9dRI118JtyYNwVMZ7ff2', 'fNWv6AEV7TCY4rVHnzu1');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('9dRI118JtyYNwVMZ7ff2', 'haJGW8xrSkojpvjV73ut');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('9dRI118JtyYNwVMZ7ff2', 'hpjAcODbiQEFS7HIsCI0');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('A1wktLKikDSi2B1ETztk', '6xV8faS2aPTedSKyoRPj');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('A1wktLKikDSi2B1ETztk', 'zcrI7A63twgdCHKsuT2H');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('AK3rc2539wQEhAgiMRaH', 'gSHuXdpqBKCQjXzBItv3');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('AOf3IBVESR1DTdPCovOl', 'NHCoKKLvMFvHOPUBKy0a');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('AOf3IBVESR1DTdPCovOl', 'lBRbmATMkqcDQKg8zGW9');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Ah7h6eT8PniE6taIUxic', 'ceA7JgXopKkLgAEj2Irq');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('AmlSVEC34t6kft4dp9mT', 'VFVL02D2Pz4yqFnh4jHu');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('AmlSVEC34t6kft4dp9mT', 'YrARMyuzS4cVQVIU5akO');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('AmrZ5KxyeTd4R7WMLeAW', 'nZCfKKUFFO746eIW4FyN');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('ApSsiPb6MRMB20TwhiUY', '1NfJrsIomgbIGVGnHOv5');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('BYsYqbqkNlJKR73SnCYr', 'FqpU2mxLCOIs3pAY6UbV');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('BnmHROSwRUQ0VDtJqW9s', '8X1RNlK7Nkip5xEPcdpu');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('BnmHROSwRUQ0VDtJqW9s', 'J1wap6l2GbJIiVk4FOuW');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('CUin4CnO3riFFafEm4cC', 'CzXQcz3apPWHN6nnAh2U');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('CUin4CnO3riFFafEm4cC', 'fx15COfZeXmH1zss0APe');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('CiPslgn4PLpASIfRVv9l', '38pqaizZggN2Ag5mFZLo');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('CiPslgn4PLpASIfRVv9l', 'rDMIEQwzvOGLgAwmI8E9');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Dt7CfR13I5QPel8AMwLL', 'N5BI4lPk5hh1LrYERoKM');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Dt7CfR13I5QPel8AMwLL', 'cIZOxUMRGFLKn2s0km37');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Dt7CfR13I5QPel8AMwLL', 'shZDNheKfZQxj0enpCVv');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('FU8B0P61r8v6IfBeedlh', '8ncliBh8AHMCzngq6uLR');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('FU8B0P61r8v6IfBeedlh', 'QM4uL0gVwHFhOn1wSYc1');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('FU8B0P61r8v6IfBeedlh', 'qaIQssMdmMnL9BAPR5dR');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Frz28ycyuf66xSd0Nf6s', 'RoSegROfYqNnL7zS03ms');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('GGWEtwXfll2ofBhf8UzC', '5nXNQf6ObnCxIhAoCivv');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('GJj4hdcomVffJTLKsqgA', 'ZIwfuyspGK6UM7zLTl24');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Gk2nLTbu073X84FJ91Ab', 'WdY4uQds3VppPfmpFYfD');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('GmrbtE8X9tGMY5T3LJ16', 'wbkr9JCAsoj5ixFhWuzn');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('H3Nc5J7LvhMKZBGMIrXx', 'jhKMhV1TuYlrlJoLf2Gb');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('H3Nc5J7LvhMKZBGMIrXx', 'u0SEUk5tYzswaq5DKzlv');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('HIV0JOjZ7XiAxZ5DjkdH', 'a0vXJgZpTKbdgMXFiBGf');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('HQKHExg8SV0BQP7PmpHu', 'HcdGCsqWqifqJy5kQLWe');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('HQLCRnKIHOffFi56ZZhy', '4lZQAYgusjM7iOsiXbrE');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('HQLCRnKIHOffFi56ZZhy', 'pCDE7rCKzqfeDJCDNjjR');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('HUt0FRkONZs6L0v6ivT4', 'Yzr9tssnhLu0sBh9tnWN');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('IXLoCQIDwQZOAHUFC86C', 'TO24cGOCB9AssdofUS23');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('IkfvOMYkD0lt9h3uO36N', 'OurZyOvGhG80NKPdYoUO');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('IkfvOMYkD0lt9h3uO36N', 'hI14CMd5QH2J067uF8WY');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Iq1HwvJrwLT06xPL2Cj8', '2r4UkRf5ojjh43XffMJz');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Iq1HwvJrwLT06xPL2Cj8', 'sH300pWnbYUDpgtW1PlO');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('JEapCITxfSfWjZ1YQYwO', 'MBneLoLOYezmFmncrzZC');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('JFvZucXhijD21FOFsPuq', 'EgR9JFkvwTBhL83hiaFt');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('JFvZucXhijD21FOFsPuq', 'iFy6lSrrnaH8rxIatqEv');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('JbpnZpTTnCpAdF5SaNSG', '9AKU1sOifumqJ5De4jEg');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('JbpnZpTTnCpAdF5SaNSG', 'T9O4rjXZ4K7P3zzrKeDS');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('JivykJE9vWlpRA6FnVTh', 'ffpGGg1qbXc9cOD97ChT');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Jkl88ZPcQHL8I6QHzV4E', '1RBaOAEKmPV7GJyyHVcV');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Jkl88ZPcQHL8I6QHzV4E', '48qfDwEqklRsWyx9a17i');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Jkl88ZPcQHL8I6QHzV4E', '9VZSzHUqN5Jj2m7GQCzJ');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Jkl88ZPcQHL8I6QHzV4E', 'ZH0ewimXZ7o6UUxUmVcL');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('K39oeBrfobN9hmdhPFzO', '80X7u8wrgHsTniARlakr');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('K5wi6p7HDshC9IHttdt4', 'J1wap6l2GbJIiVk4FOuW');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('K5wi6p7HDshC9IHttdt4', 'cz04g0ksh1QKO0j4THGD');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('K8EhYasfhJGvTT5apgDy', 'JxE5j304rlCRFGWi4IyV');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('KMjr93ysGB1lT0zzdCfj', 'G6b5aidMelw2bQY4Kvyu');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('KQmJWXf9PcKFXXiRJWgB', 'cgN26MS8ewLttg7cBvRn');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('KaRXwIQ10WUwfKhv1zKD', '2r4UkRf5ojjh43XffMJz');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('KtalCCZK0c7PcSGuCKC4', 'aTcXld4l2IGujbXPo5LL');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('KtalCCZK0c7PcSGuCKC4', 'lxNuzyE2Ssb1o9JllqWx');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('L9n4mU0n5851cf7t8Bpk', '4m0L6wND8iDJTBNPx4Ih');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('L9n4mU0n5851cf7t8Bpk', 'E6wAxnOHRXmZMK41RblA');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('L9qe00I3L6whVkljVmaw', '0uDORrwyiEG0KXa6v9EO');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('L9qe00I3L6whVkljVmaw', 'M5xjgiD5zeSAmM18ChyY');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('LT6ozZFeP8cKKEgsYIVR', 'ZH0ewimXZ7o6UUxUmVcL');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('LT6ozZFeP8cKKEgsYIVR', 'wJxvgPLDDSzKai3a1x4n');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Lguo2KKWXFYEgpyoj1eE', '4m0L6wND8iDJTBNPx4Ih');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('LyizzSX19sMbffVqMFqb', 'J1wap6l2GbJIiVk4FOuW');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('M8n9wcIrzzgr5K0U4eYI', 'JtDlXdz8PcHBkw1WzLlE');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('M8n9wcIrzzgr5K0U4eYI', 'QX9I61vGTTiaJ3csxX6U');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('M8n9wcIrzzgr5K0U4eYI', 'rhp6fbTJ4zJbFcKcfOay');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('MBL8lPmqo9ukMVqTRzAp', 'tDike6zaa3tF3nGspYtR');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('MGjVO1zDbAO2w73oBrkc', 'Qpo2PcIecvGZXZjOmICP');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('MGjVO1zDbAO2w73oBrkc', 'eSZltoQZEXTAxrCt3vyy');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('MHRvIrODdBxuL6zAA3BZ', 'DoASihvhsPsmmISK1Fo0');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('MHaHS7WQBZAJAHPeZ8fj', '7oIWIe5uK7gkYJVtl6ZO');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('MHaHS7WQBZAJAHPeZ8fj', 'EgR9JFkvwTBhL83hiaFt');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('MHaHS7WQBZAJAHPeZ8fj', 'gpKCZnHsxk5S5qg0QmPw');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('MHaHS7WQBZAJAHPeZ8fj', 'naaNrqAF6bgJRoF8UtMu');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('MQilacDc7WdMj2dORHOW', 'm4XEBouZeuybMyIpkcWc');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('MQilacDc7WdMj2dORHOW', 'zk7UO9EOX1WAZC0642g7');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('MXHchExJGVbvSrudcEfB', 'tDike6zaa3tF3nGspYtR');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('MXHchExJGVbvSrudcEfB', 'yoRhD2mxeEMlf8XUBMEA');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('N0cHQ7SihI0rx2ZXPiie', 'eMsqSjjqdHBc2PUOsHaE');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('NFjiU36M15pM8S71LMU4', 'Qpo2PcIecvGZXZjOmICP');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('NFjiU36M15pM8S71LMU4', 'mICn9KwAVgKz5HmBqvXJ');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('NN9ZyAYw8bUbN1MVOQ9L', 'efO53Xeq8v7g4RQ7Tj21');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('NRqa7pMYcRLiBJ8JMizf', 'D374wRAey8r85dr8u9UV');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('NfXDBGYxuusnarzk2r5D', 'eMsqSjjqdHBc2PUOsHaE');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('NfXDBGYxuusnarzk2r5D', 'hpjAcODbiQEFS7HIsCI0');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('O8iC47zJvCzkvYVPn4Ba', 'Tp5lqMcbXylXvtXPoTt4');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('OUJNnfPZTydnFL7gNwbb', 'VE5cNYoVJ80qrhYcb5B7');
commit;
prompt 200 records committed...
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('OUJNnfPZTydnFL7gNwbb', 'kI2eLQnGZVKaXR0NHeVc');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('P1vRpYpPQoI0MPZUaKDi', 'ToKIhRj9ck9r8wColHur');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('PZ9SfwrlZ0JBk9flxuai', 'aTcXld4l2IGujbXPo5LL');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Q11whnKRh0HzAOWX8mjp', '7TAnnzQvpzBzHnK2eytW');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Q11whnKRh0HzAOWX8mjp', 'C6GDuFYkXkXKpQwKFxF2');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Q11whnKRh0HzAOWX8mjp', 'XshqQkR6NfJ0kCxBd90U');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Q9AlgKi2VQPgvULqdZaQ', 'LqALBUHB7zAzXjVf21oa');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Q9AlgKi2VQPgvULqdZaQ', 'UbSZTQLLYvCxhGtCz01Q');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Q9AlgKi2VQPgvULqdZaQ', 'gMDgCfA7Y5EjPCULgPc5');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('QGCCmgwYvyKcH62VB80F', 'H8ktArK1AnIvAtq03y4U');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('QGCCmgwYvyKcH62VB80F', 'yoRhD2mxeEMlf8XUBMEA');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('QIAXByuJoFsAfbUqOsVX', 'Yzr9tssnhLu0sBh9tnWN');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('QeKJbfTGbDiziKfYs9wl', 'Gzj9iEsVyA0a2qbMa9tu');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('QhEgXWMwuL6MfPltRVSo', 'PlZV6B3pQyg98okwSns8');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('QhEgXWMwuL6MfPltRVSo', 'dChUi6PSTAJhRCzjQsAN');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('RglXmpisi4NThiRdR0vD', 'rx5fmvBIk51OEVEGiCB7');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('SICDWVKkDDLQcDhcF7CU', 'JxE5j304rlCRFGWi4IyV');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('SICDWVKkDDLQcDhcF7CU', 'UWQVWcUtsZBJskTWAp7n');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('SkFVHHso1Bo9Ejc4PwrH', 'G6b5aidMelw2bQY4Kvyu');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('SvGx2JfnNFwoQypo0ssA', 'C6GDuFYkXkXKpQwKFxF2');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('TDrY6r5Ed1SkDkJvf1rS', 'H36lpnfxLiNVde3Qc80k');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('TEJSDPMWwz4tFjpIP8XE', 'ImH7abYGbP6EfzYbPXob');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('TEJSDPMWwz4tFjpIP8XE', 'Vdq9FHhTOaIQIwZQfa1S');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('TEJSDPMWwz4tFjpIP8XE', 'WkqsO66mIirkAhWlaWMK');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('TK5Kgf9NMDvWO73r5Onm', 'RMElPEg3e6FBM42XSoIj');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('TUTHH7HWdHDK8RMFIvnR', 'hpjAcODbiQEFS7HIsCI0');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('TaTAWulEEqGoqaqZvXdk', 'oaMOlFEIsHBlsOHTlqVO');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('TaTAWulEEqGoqaqZvXdk', 'zLQicTkrVctdjhuHhth8');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('U8EpBXYaDLdsQdw3ME9M', 'Re0tE5DrSbadw5633QVb');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('U8EpBXYaDLdsQdw3ME9M', 'fx15COfZeXmH1zss0APe');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('UJJhQNr85bzowqpvlDFI', '0KTeIjciha4uwGYzzBKd');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('UP7tr6dIw2S5yvBFspmC', '0gOpDLpCtwhLrIufV3nj');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Udi8RJoZ2mrBlP7520V2', 'AA2HBQm0dN8PMvCGGo8M');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Udi8RJoZ2mrBlP7520V2', 'RMElPEg3e6FBM42XSoIj');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Udi8RJoZ2mrBlP7520V2', 'ZIwfuyspGK6UM7zLTl24');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Udi8RJoZ2mrBlP7520V2', 'z3jdKsy6FpE9VrunWgxD');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Uj8OQ61aVsE4oByuNND7', '7TAnnzQvpzBzHnK2eytW');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('UlHL6A0JlRPU8Y18zxHb', 'fx15COfZeXmH1zss0APe');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('UlHL6A0JlRPU8Y18zxHb', 'hG0hKKC3FriiMTJ2uYtS');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('UpHsnKtDiVqnOfOKB5XK', 'ItZkS3JAVz7aj76srcik');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('UuvNPsuhKl6BbVBW77ar', 'JCxqJEyaQke5GlVioXwp');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('UuvNPsuhKl6BbVBW77ar', 'Q4R2OX7CYabEhxCbx1Zm');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('UuvNPsuhKl6BbVBW77ar', 'uoZxID14zXG7CjV4xn70');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('VeaAlT3zZXYrD8ewb9GQ', 'efO53Xeq8v7g4RQ7Tj21');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('VeaAlT3zZXYrD8ewb9GQ', 'gMDgCfA7Y5EjPCULgPc5');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('WIKmAy5xQjw9OnFsbtLj', 'L0rtOBx3dPfxaXFPlCqr');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('WIKmAy5xQjw9OnFsbtLj', 'b6ofRO73TKaIKgUUKHDy');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Wc2Obg1kSmMEnJCfuvBw', '8RT3K3L6P8UZ46S7at2Q');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Wc2Obg1kSmMEnJCfuvBw', 'PUclfzwvsUZFh7PaXxzp');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('WyAho3x6uqLZu4GdVPQQ', '6DUIbotKmoEDy6NAg6mq');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('WyAho3x6uqLZu4GdVPQQ', 'J1wap6l2GbJIiVk4FOuW');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('WyAho3x6uqLZu4GdVPQQ', 'QMZ62f6VFxAj9ae0V0mR');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('X7PaplqOITK3SWmboFgB', 'wxKzHbi39v4jYRzYRl3B');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('XQkanGduqGvx2X8cYa52', '38pqaizZggN2Ag5mFZLo');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('YXa2DMSRtg4z53ObwO5H', 'tih12Oa5RFRTjImMrzZW');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('YrjOfUWiN5fKxWA9LxzH', '5nXNQf6ObnCxIhAoCivv');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('YvZex1gvQ8Zn5ivCoDmM', 'hpjAcODbiQEFS7HIsCI0');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('Yzgyp2lGDUpXsjQRyIRp', 'tkVN2f1KAQiwN3zAG8EB');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('ZAyUUUDhSPJBcRqcYvAM', 'ImH7abYGbP6EfzYbPXob');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('ZGckr2KcIcxuHCyY8ou7', '7W6haE8mzS3AE1JTd8HW');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('ZbrP08ZxdRBCoQBoV0lo', 'cX1JucLxMdIJoUthn7E7');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('ZbrP08ZxdRBCoQBoV0lo', 'nZCfKKUFFO746eIW4FyN');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('aG8voTCFXY7NrGcQraj3', 'Yswpy6NyhnbXCtt0NCFt');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('aG8voTCFXY7NrGcQraj3', 'ziijwkEvZrX273arkI4G');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('bScnUsHrPGaixc2j6QLI', 'Bxfr0bdpgQD03eOspdU9');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('ba48G3Z8AXtI5qJXo3jP', 'gMDgCfA7Y5EjPCULgPc5');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('cD7b4H2mTqKMYoDXBY7h', 'EFLHOg0Wz22l3gqanVHp');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('cD7b4H2mTqKMYoDXBY7h', 'nSKDoyaH66th5mrnxdCM');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('cxY1fXeNSor5w6ulA4hF', '6M1XYfgE6mZ1RsdXpDwf');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('d880XjhYxnJxMSVQRoug', 'Tp5lqMcbXylXvtXPoTt4');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('d880XjhYxnJxMSVQRoug', 'XkTyAwOJ0Oiw3sGFN6nA');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('d880XjhYxnJxMSVQRoug', 'v1EYGyPcag4VCAoT1nE8');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('dTpruMPSvrzvVxOJfmGY', 'qPLMlLhpuSTGG8k4w6CW');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('dgfQMidJqzdP6IuSo4Fz', 'Yswpy6NyhnbXCtt0NCFt');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('dk7GxRPa0ILsAi7kzNw4', '7oIWIe5uK7gkYJVtl6ZO');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('dvFgbovgHZW8xmLspbs8', 'nEP0RynbbE2Z1gvskgR8');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('dwit3XcYjJ56odNfhK7S', 'LAFiIaBVBHjEcWZ4J0B7');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('e3WjYoKU4gsZDY1PezAq', 'Bxfr0bdpgQD03eOspdU9');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('ePLDni1VAn3CzSANO6Q1', 'SPoiWutNENGhkAmM6SU7');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('eR4LgsUjk1PKOmGQkmDp', 'J2wjcUvUAemDfUq4GNtH');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('eR4LgsUjk1PKOmGQkmDp', 'ceA7JgXopKkLgAEj2Irq');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('eXemcHF0cHKJgM21Ifzb', 'PlZV6B3pQyg98okwSns8');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('eneDROYPYETYgPpyC1eW', 'sdfz4nx7kCKWcgjiQKBC');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('f9EodZex5QTDySGP8Nph', 'ZZf5RpFp91k7LAUBr5Po');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('f9EodZex5QTDySGP8Nph', 'jhKMhV1TuYlrlJoLf2Gb');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('f9xyxdEeYSKuR4PTnNm4', '5pD1xi8D6MbP7JtP2M2o');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('faxith9J9XK3drLd8U73', '6DUIbotKmoEDy6NAg6mq');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('frT7nZPCsgY6FX1ejPAO', 'xSQSE5Oh1ecif22LZLgO');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('ft6zkU6OZrqKI8T4IxkR', 'ZKlBsAkl0FtVVy373A2B');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('fxECb9BGRqheA5NTqOO3', 'GlwjYl8V4eoaXGjQz39z');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('gNId9FqUdXLkTW0GiM7I', 'Vhh703tZIp1tZ7GoZbWX');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('gcZRRWdAL8F2lN2e7K9l', 'jhKMhV1TuYlrlJoLf2Gb');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('gy3xtfIoTm7SqSqtFsrl', 'oVwX2AWItmmF4fjwoFFp');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('h6T3Ky1ZXFSMoRV4ErLW', 'F5ZqC646NM31gft5jpNw');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('hwRrRVESKlCPvczDmrye', 'Keiu2WmkL5sZvdJLNQ42');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('i2geAWtR7xiVgX1zjiJA', 'DoASihvhsPsmmISK1Fo0');
insert into DEVICETEST_TUBE1 (deviceid, testtubeid)
values ('i2geAWtR7xiVgX1zjiJA', 'sdfz4nx7kCKWcgjiQKBC');
commit;
prompt 297 records loaded
prompt Loading REFRIGERATOR1...
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('MyvFSIIwIAlqUcOMoXAH', 57, to_date('09-11-2012', 'dd-mm-yyyy'), to_date('03-12-2014', 'dd-mm-yyyy'), 'KRO4mN5nkLsdyoFVpLB3', '7zKQ7H5Ts6xyP1BZrIMo', 'aTsXkG5XuHWQgRHMXTtN');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('HPG6a1hWHhyzTFzV3I64', 22, to_date('15-02-2002', 'dd-mm-yyyy'), to_date('05-03-2004', 'dd-mm-yyyy'), 'QQOOiO6bp7gmzhM84pX4', 'VE5cNYoVJ80qrhYcb5B7', 'Od6RsocR6se0iBg0y0qt');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('rZIdTYRlyj8Fi3xLxQrr', 24, to_date('25-10-2005', 'dd-mm-yyyy'), to_date('05-09-2000', 'dd-mm-yyyy'), 'Vrv2ZseKDZXxlc6PMWek', '0S1irtW8ZvrJKAFubwYd', 'Vg6GZOfF5ly3IQclnBZa');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('0XUnzkNoW6OJJ86hQzH1', 12, to_date('20-02-2014', 'dd-mm-yyyy'), to_date('17-12-2013', 'dd-mm-yyyy'), '2boqYFF3yktIs8fXDRNX', 'WP91tHXZOg3ZeIYlMXLo', 'CrYzxCNfDiXDeqZsLYdP');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('hCNjavWe07hKAQqhRi4V', 21, to_date('20-11-2002', 'dd-mm-yyyy'), to_date('21-08-2023', 'dd-mm-yyyy'), 'JB9PbS5Qk1FN8fy64Cyz', '1NfJrsIomgbIGVGnHOv5', 'qTjAfgw3KSKPVbgl2Ae1');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('VdYKY6jWvDuojEPMpbiU', 74, to_date('02-04-2016', 'dd-mm-yyyy'), to_date('09-02-2018', 'dd-mm-yyyy'), '42sCUiXYydkvrCQYO8Gg', 'NHCoKKLvMFvHOPUBKy0a', 'k1GNR66trbkrYA5Tg7Zt');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('4kkMX572B2nhvYCqm7o2', 76, to_date('01-01-2022', 'dd-mm-yyyy'), to_date('09-02-2004', 'dd-mm-yyyy'), 'B8EGGEuLQeCD36jj4ykz', 'm4XEBouZeuybMyIpkcWc', 'rU4VY9sOnuTUDdsDdIeC');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('g8gKlBE0suENUpacZDr9', 10, to_date('10-10-2008', 'dd-mm-yyyy'), to_date('03-05-2011', 'dd-mm-yyyy'), 'F2FPqbwUSRCbFBgeVWcw', 'PavPQnL8aEA37uJGpXo1', 'rU4VY9sOnuTUDdsDdIeC');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('XcMrItxejq4qukD8BQkm', 96, to_date('05-06-2014', 'dd-mm-yyyy'), to_date('08-09-2001', 'dd-mm-yyyy'), 'YdaQ0RAVPX7qg81aATJ3', 'T9O4rjXZ4K7P3zzrKeDS', 'oMpOWbd3k8r3hCwywV4Q');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('vvdKsEZr9Hwr0V2FwqBO', 92, to_date('20-08-2013', 'dd-mm-yyyy'), to_date('05-01-2010', 'dd-mm-yyyy'), '1SLQZSC1UU8AX4kgzPe7', '5nXNQf6ObnCxIhAoCivv', 'F8fo0yPl9Xj2pBHCkS5o');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('2jDWnpTHmIjqp8B2CeAX', 75, to_date('19-10-2004', 'dd-mm-yyyy'), to_date('12-09-2011', 'dd-mm-yyyy'), 'MS8MgELOiWbijcsLNTo3', 'gSHuXdpqBKCQjXzBItv3', 'Q2ZZoK3e27KjeiAKzZRa');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('n41NT9KuSl5hH2fzrR1Q', 97, to_date('25-10-2013', 'dd-mm-yyyy'), to_date('01-12-2000', 'dd-mm-yyyy'), 'uCiLouxj3Uqb8D3eNjUv', 'kxfK9AbomBjLgF9kdiOc', '7spSJQWsnGB7Y8PnAjOF');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('NMrK2kL58CTL28z5jiKz', 40, to_date('20-02-2022', 'dd-mm-yyyy'), to_date('13-03-2010', 'dd-mm-yyyy'), 'XizINtQLJNn5Jgcjji43', 'zk7UO9EOX1WAZC0642g7', 'cqbTwNjnecTAsf6TFjXI');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('JpburI9eLYZ5QnphfA8t', 1, to_date('26-08-2014', 'dd-mm-yyyy'), to_date('03-04-2023', 'dd-mm-yyyy'), 'mkPid5wK2pUw3MXhlpD7', 'naymfyIKvn8oMVNCJlHm', 'i8AYNusN4ehCS0c0BkUB');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('K5YDBCOH16YEx1NPj6Gj', 17, to_date('15-11-2000', 'dd-mm-yyyy'), to_date('23-04-2009', 'dd-mm-yyyy'), 'FvqTnvE7ddoNj9VD7UAC', 'jmHkeexmOfKS72wRfDFB', 'qTjAfgw3KSKPVbgl2Ae1');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('jnamzxmsrRLBCGSt7EQA', 49, to_date('13-06-2000', 'dd-mm-yyyy'), to_date('19-06-2011', 'dd-mm-yyyy'), 'mwKP9wfzqAXhwUSinY1E', 'JqRwnCoajVpsABi4gxMR', 'evywxSo7ba2MxLVTWFv0');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('HOT6ccDx4c6FadwHCTFu', 13, to_date('06-09-2004', 'dd-mm-yyyy'), to_date('10-06-2015', 'dd-mm-yyyy'), 'RMyO1XPf4esVFGU5hOyg', 'BPx7Q5ajQgDyaymXyyhe', 'yqMGBxSiCmkKlaS4bLSy');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('9MJUwRClMnxzAfV8kKtK', 42, to_date('11-05-2012', 'dd-mm-yyyy'), to_date('23-04-2001', 'dd-mm-yyyy'), 'E5VFJdS2uNoE4SxweeKe', 'wbkr9JCAsoj5ixFhWuzn', 'IoNRfXjIauqmtEoioGjv');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('W4klq1XK9SeRhzl0LPRC', 83, to_date('21-10-2003', 'dd-mm-yyyy'), to_date('23-02-2001', 'dd-mm-yyyy'), 'VkOGXEj4Jz67fM8HjiBY', 'haJGW8xrSkojpvjV73ut', 'SJpExbTkS10XuTidcNKJ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('OpOxpo9R1Z5WbeDPA3Gx', 61, to_date('05-10-2008', 'dd-mm-yyyy'), to_date('07-09-2005', 'dd-mm-yyyy'), 'mJhZF7M8sghelwFTwVUn', 'lBRbmATMkqcDQKg8zGW9', 'k1GNR66trbkrYA5Tg7Zt');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('Zna40C3j9pnr1Z4ouz8E', 21, to_date('12-05-2019', 'dd-mm-yyyy'), to_date('07-08-2003', 'dd-mm-yyyy'), 'FXDgk0EKPiOurYNJ896H', 'qaIQssMdmMnL9BAPR5dR', 'F8fo0yPl9Xj2pBHCkS5o');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('Ab6qffg1VvprORBLGLl7', 16, to_date('02-10-2017', 'dd-mm-yyyy'), to_date('18-05-2006', 'dd-mm-yyyy'), '4NMKyiIGVAT9UA6AJITx', 'ptvv82QPFbguhmsnEy9z', '9hBuTPn2HcP0Gqiuaypq');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('54VJwZ3Ntc67Ms6QRdEX', 64, to_date('18-10-2006', 'dd-mm-yyyy'), to_date('10-09-2017', 'dd-mm-yyyy'), 'PzYevbgydfBIffQLXAnZ', 'BPx7Q5ajQgDyaymXyyhe', 'gzlZAOOvvk6Keh0e9QgY');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('UH6g5DEpkth87VgEnyap', 9, to_date('26-04-2008', 'dd-mm-yyyy'), to_date('06-12-2013', 'dd-mm-yyyy'), 'g25LeVl8YWKFDkwe4vVG', 'L2B3t8qr95OnOFWKsZr3', 'QTCkuP0Ixsfm5j1cOkjP');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('GzcpcADfhSFE1Tik6ylT', 38, to_date('15-06-2007', 'dd-mm-yyyy'), to_date('09-08-2008', 'dd-mm-yyyy'), 'OZ6yySC9GpJvWDzfZnak', 'zcrI7A63twgdCHKsuT2H', 'ZXByedjOjnkLONMzRo5m');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('xyJJ6c5WjxYfzBwS2zYR', 45, to_date('08-11-2006', 'dd-mm-yyyy'), to_date('04-02-2019', 'dd-mm-yyyy'), 'vpXaGSfwYBBWyvP7ItjF', 'haJGW8xrSkojpvjV73ut', 'oMpOWbd3k8r3hCwywV4Q');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('fmQFL1b72OSZWm6pOWwn', 86, to_date('02-03-2009', 'dd-mm-yyyy'), to_date('27-02-2009', 'dd-mm-yyyy'), 'bPZkb97t4hyNqqYayNqI', 'naymfyIKvn8oMVNCJlHm', 'oMpOWbd3k8r3hCwywV4Q');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('nMx8B5y0TJ8GUXcPNUGk', 1, to_date('20-08-2022', 'dd-mm-yyyy'), to_date('24-02-2012', 'dd-mm-yyyy'), 'SKxIi9G0IMbzMp8nSTco', 'SPoiWutNENGhkAmM6SU7', 'fwZnHZMzB6uva6bHEwnJ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('vkqrBsiIYeq7xiZc9xQu', 68, to_date('27-12-2001', 'dd-mm-yyyy'), to_date('02-12-2009', 'dd-mm-yyyy'), 'M4e9i2F1zZssQdaK1XeT', '7zKQ7H5Ts6xyP1BZrIMo', 'hf0UhEjys2flCW13Pv1s');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('fA1S38CGZtPHXn9CAVbY', 30, to_date('14-05-2016', 'dd-mm-yyyy'), to_date('21-04-2003', 'dd-mm-yyyy'), 'lbFIQELJatVeS64ExTSi', 'oVwX2AWItmmF4fjwoFFp', 'TdcFbcnuUTWoXxTJnh7A');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('k1MJTEIigmVy4jjV2GJI', 92, to_date('15-02-2014', 'dd-mm-yyyy'), to_date('13-12-2000', 'dd-mm-yyyy'), 'tLvaauwa2DmY8bh0I8rO', 'w8TL1GdNWOVf0IrTL3WA', 'fwZnHZMzB6uva6bHEwnJ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('kbwP17IWHnJ5U0JnvcMg', 86, to_date('17-07-2002', 'dd-mm-yyyy'), to_date('20-01-2002', 'dd-mm-yyyy'), '4NpRZ3G0bhzSzf2FofoV', 'nKA3pAPA99v9u40kB3MX', '7YgA78191QVOwytkuX28');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('AEhMwFOvCjxB2eXpvkox', 16, to_date('12-03-2020', 'dd-mm-yyyy'), to_date('09-04-2023', 'dd-mm-yyyy'), 'wlRnqnZT6DlYbyQJnYfE', 'SPoiWutNENGhkAmM6SU7', 'yicA2eUp9qPBlHkxmfm5');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('p1XsHZmIhstFg6Ntvhrx', 97, to_date('25-12-2020', 'dd-mm-yyyy'), to_date('18-01-2023', 'dd-mm-yyyy'), 'Yffv10dqHY5YPKBkgXbh', 'T9O4rjXZ4K7P3zzrKeDS', 'Hfj18ixIA3fjRhXuuJNE');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('VJ8jrJVOthGceVr30sNZ', 90, to_date('25-04-2007', 'dd-mm-yyyy'), to_date('08-02-2008', 'dd-mm-yyyy'), 'b8o91zotc25JpxkyFbb4', '3tD22HU6WJsLx6BV02Ge', '7spSJQWsnGB7Y8PnAjOF');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('Jo4LpbB0o1jnADpjqsKh', 23, to_date('27-09-2010', 'dd-mm-yyyy'), to_date('11-11-2008', 'dd-mm-yyyy'), 'FrOknRk2BGidfgC2LXYg', 'fNWv6AEV7TCY4rVHnzu1', '3pIWN9H4589vPcb5URgz');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('LjPvVapsTBuGSViEXjGo', 24, to_date('06-12-2009', 'dd-mm-yyyy'), to_date('04-06-2002', 'dd-mm-yyyy'), '9gdJd8RLaw7D5mFjhDIP', 'MYWmDoTF7SGwCBFHcMLr', '67MWYA8Hj03xFVHajZtc');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('A7u1ax2IzEbTI3a8tvHH', 28, to_date('12-12-2017', 'dd-mm-yyyy'), to_date('21-10-2015', 'dd-mm-yyyy'), 'PQzD872sCNUYwi6LaiDP', 'm4XEBouZeuybMyIpkcWc', 'dpscbeJKqsPEZhNwg90J');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('ImNjPk2YyGekY0ug0Pbb', 22, to_date('22-05-2021', 'dd-mm-yyyy'), to_date('20-05-2011', 'dd-mm-yyyy'), 'z9motFkr7T8Tf77q799S', 'nQ8gmbidKOWFKMHwaR3H', 'u3YgnTv1nZbeH6eZK275');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('AWw0HMVhd8Gc3C6oDF9o', 23, to_date('06-05-2003', 'dd-mm-yyyy'), to_date('15-04-2015', 'dd-mm-yyyy'), 'lGR2uZe27rJjA64BLgho', 'IycmfkUJHH38ZietIpJN', 'WbS858YFNGISImiGShXo');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('J0vAe5LIwYq99IpYvAJN', 84, to_date('12-09-2010', 'dd-mm-yyyy'), to_date('24-08-2010', 'dd-mm-yyyy'), 'H9EPqDvn4quJgKwmEOUg', 'wbkr9JCAsoj5ixFhWuzn', 'gzlZAOOvvk6Keh0e9QgY');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('226nHTuEVeaOt12t7KpM', 50, to_date('10-12-2005', 'dd-mm-yyyy'), to_date('14-03-2008', 'dd-mm-yyyy'), '5VTgRrhU0pHVQGSzPWOq', 'haJGW8xrSkojpvjV73ut', 'iGKWl28ZSeYHiy7adlln');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('RQqYUHv7bukVt4mQ9YRM', 34, to_date('04-03-2003', 'dd-mm-yyyy'), to_date('19-05-2014', 'dd-mm-yyyy'), 'gWGbPvzXRHP6oX3RrJxw', 'H8ktArK1AnIvAtq03y4U', 'uTYDl091PXjc3Xw9Cze7');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('W5tFAQ0ztP9Dfi2amG2c', 1, to_date('22-01-2011', 'dd-mm-yyyy'), to_date('11-05-2009', 'dd-mm-yyyy'), 'LhXK8i6F7q8u9tBUtsFX', 'J2wjcUvUAemDfUq4GNtH', 'WmGXMgQGczr51f07MIVH');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('SFqIlm4UYhH01m8ceTt7', 48, to_date('27-04-2013', 'dd-mm-yyyy'), to_date('03-01-2016', 'dd-mm-yyyy'), 'XJDKr1mQrg1RA0p807dr', 'nCjs4vyxnNZULKfVD1mj', 'yIlm7vKzQjuV6COlD2Fk');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('uhnNUkggoUEqPFsXc6fo', 58, to_date('17-08-2002', 'dd-mm-yyyy'), to_date('16-06-2022', 'dd-mm-yyyy'), 'yjyDxBp2mFmnAkLN6y1b', '48Ujnm4GgrM9jEHzhbpe', 'GhE5nvOtdYkgNbPQKkra');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('JZhBhTgL7VUv0XzdKOCp', 94, to_date('13-06-2011', 'dd-mm-yyyy'), to_date('21-07-2021', 'dd-mm-yyyy'), 'jBW5Q8Lg96MsyFCv51Q4', 'nKA3pAPA99v9u40kB3MX', 'zEu8pAK0zJJYyaoU0F5m');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('Jt3fO3KuQx5GkZ8vcTIl', 36, to_date('18-02-2005', 'dd-mm-yyyy'), to_date('25-08-2022', 'dd-mm-yyyy'), 'UWlu19Slr2iyl8kvg1Vg', 'X8lGC8JyK0l4sTcC5OT9', '3IQeXGuoulF9RZhCQ1q1');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('YjaK7rtOiJKBGoGfrmNQ', 83, to_date('11-08-2007', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'), 'lprjimWuxcw8uhivpH0V', '0S1irtW8ZvrJKAFubwYd', 'rpjW9nNcMkOBOFw3Vkt3');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('SmUedx7KeDSYEPIKH0Bf', 30, to_date('26-10-2011', 'dd-mm-yyyy'), to_date('03-07-2020', 'dd-mm-yyyy'), '6jFwQAaodldZHvTKI8rN', 'PavPQnL8aEA37uJGpXo1', 'PtvpWwbbX33XGlbVmCnb');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('7t9jaaiBmE8QkB7olbOR', 23, to_date('18-11-2022', 'dd-mm-yyyy'), to_date('22-07-2015', 'dd-mm-yyyy'), '9UXikRb8MGbqAX7qoxP7', 'fmVCIzQf3MmpJ9sZb2h4', 'yicA2eUp9qPBlHkxmfm5');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('GSh4qHTQSa8HIXFcVAN2', 56, to_date('05-12-2021', 'dd-mm-yyyy'), to_date('07-05-2018', 'dd-mm-yyyy'), '0lUSOESEtkwjymDk1W9p', 'XI3XRPtYHKabmukzDEWF', 'Hfj18ixIA3fjRhXuuJNE');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('wP8AcVmt4RFtdo2g8bVc', 43, to_date('06-01-2004', 'dd-mm-yyyy'), to_date('22-07-2022', 'dd-mm-yyyy'), '0MgxKAsXQqrzkOTjilIT', 'yRrZHlmdtLgmpytIr86Y', 'XzOLUAzIYIZc7FZ2q5hr');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('YhlEeO3XZnMozfICPMSZ', 22, to_date('02-08-2017', 'dd-mm-yyyy'), to_date('03-07-2009', 'dd-mm-yyyy'), 'yMPG87xJxstRlsLBS1r4', 'xA3mXaUkmjwtxAQrq52q', 'ITw06nJJ1vDPqTSbg9gw');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('RN9XRerMiIczYtl7TJAq', 8, to_date('03-02-2002', 'dd-mm-yyyy'), to_date('12-03-2012', 'dd-mm-yyyy'), 'xxZJfqdmy81I7JSP93x9', 'WP91tHXZOg3ZeIYlMXLo', 'pybbnBEnVgNxSwX9uUFH');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('9h5r0bFbLN6LlQYocT2P', 92, to_date('23-02-2013', 'dd-mm-yyyy'), to_date('22-05-2005', 'dd-mm-yyyy'), 'TJsX7fFCBOjyWkEgnrtn', 'jmHkeexmOfKS72wRfDFB', '05YPJmd5WtPo6n3LVgtv');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('6Jaw79Y7Ojsw7NA3nG2w', 95, to_date('28-05-2019', 'dd-mm-yyyy'), to_date('08-02-2018', 'dd-mm-yyyy'), 'ewQV9nu29Iu1NgCHTc3I', 'pAWlYSsAxAUqphVStjoS', 'ITw06nJJ1vDPqTSbg9gw');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('ujNqwKkcq3ZLeDu5T0ia', 53, to_date('12-04-2011', 'dd-mm-yyyy'), to_date('28-02-2005', 'dd-mm-yyyy'), 'iCDGBkV1nQeGiXjhx1Zl', 'EgR9JFkvwTBhL83hiaFt', 'aTsXkG5XuHWQgRHMXTtN');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('kYKpagMmIOKDswePaPAu', 60, to_date('10-05-2007', 'dd-mm-yyyy'), to_date('26-07-2011', 'dd-mm-yyyy'), 'pG15vRFSYjKKYAFRlMCU', 'PvhlCcLdgBicPFqH6eDV', 'zEu8pAK0zJJYyaoU0F5m');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('g7NXFTpvhHbKQx9h1ubK', 6, to_date('07-04-2014', 'dd-mm-yyyy'), to_date('25-02-2012', 'dd-mm-yyyy'), 'VEJMF7wCmve8Xu5AuZDw', 'JxE5j304rlCRFGWi4IyV', 'VLavrGF349D9K9Ko9JfE');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('mv9wzaGCw1KZdVUdyvAb', 21, to_date('08-06-2023', 'dd-mm-yyyy'), to_date('25-02-2007', 'dd-mm-yyyy'), 'QzSnIBDDqhbQZiNa9DhP', 'hpjAcODbiQEFS7HIsCI0', 'rYscjdO6dbnhrzmxUgkd');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('OI4uPmYulrvlSAyKUh2C', 15, to_date('24-11-2006', 'dd-mm-yyyy'), to_date('15-01-2013', 'dd-mm-yyyy'), 'EdRNxFwbShlhWm4nLehS', 'fmVCIzQf3MmpJ9sZb2h4', 'L1TBmMtz0yeqP8OJX15d');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('zWJtvElCknc62eVJco9z', 28, to_date('02-10-2010', 'dd-mm-yyyy'), to_date('04-10-2001', 'dd-mm-yyyy'), 'lIigdBZCUy7svcAhIZbR', '1NfJrsIomgbIGVGnHOv5', 'ycRLs5xWmku6ZFF3uXxY');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('i3C9RE5wll4IGBocPJ1t', 20, to_date('08-10-2019', 'dd-mm-yyyy'), to_date('20-02-2006', 'dd-mm-yyyy'), 'MOU0ajYJActRgMpoYo5V', 'JqRwnCoajVpsABi4gxMR', 'rU4VY9sOnuTUDdsDdIeC');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('TgiBRdEXhTiH0DOgNHec', 79, to_date('01-10-2004', 'dd-mm-yyyy'), to_date('12-09-2008', 'dd-mm-yyyy'), 'iWXNHogNqCy7ErXqALoj', 'nKA3pAPA99v9u40kB3MX', 'SJpExbTkS10XuTidcNKJ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('bn3YvFTjNjScTpillkqa', 44, to_date('08-10-2017', 'dd-mm-yyyy'), to_date('10-11-2020', 'dd-mm-yyyy'), '0zdSSkhCajsLII2cCeji', 'oVwX2AWItmmF4fjwoFFp', 'evywxSo7ba2MxLVTWFv0');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('BjSmtQyBjIXlqroHTUG5', 39, to_date('02-02-2022', 'dd-mm-yyyy'), to_date('28-09-2023', 'dd-mm-yyyy'), '9wxZn0lkB9R7RhZXKkI9', 'F5ZqC646NM31gft5jpNw', 'i8AYNusN4ehCS0c0BkUB');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('RWGpibbD17NuzzKPoSyI', 4, to_date('10-05-2018', 'dd-mm-yyyy'), to_date('24-03-2017', 'dd-mm-yyyy'), 'TVI6YntGAvWhgfuvRne3', 'J2wjcUvUAemDfUq4GNtH', 'fTtWLXZtmJl1VSzgzskv');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('gSj999mHE770wAn484eYe793iLi130eTJ469oEH289cBf094bV', 264, to_date('20-03-2687 01:49:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-11-2694 23:25:52', 'dd-mm-yyyy hh24:mi:ss'), 'xHQ644xPi685oOG940mGI767rPb221bQp131bPI073eRs384jA', 'MYWmDoTF7SGwCBFHcMLr', 'L1TBmMtz0yeqP8OJX15d');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('tTI542iQS638tDR951cAn420yZS376zDs513tQw515kTr129sE', 80, to_date('15-02-2351 16:48:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-01-2926 16:44:58', 'dd-mm-yyyy hh24:mi:ss'), 'eXL035iZe030kLR261bGP870eHP254cEA099xWk964eCR645bZ', 'hIq141zIu015uPV520sYt465sEw161iVF192sIS123xPT430sO', 'iCWnWrtoCWJeN5pPHiuC');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('nRw859cZV851sKn053jPe732eYi997zOl443eWI120uAE922bC', 316, to_date('28-04-1910 00:49:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-09-2703 17:39:33', 'dd-mm-yyyy hh24:mi:ss'), 'uPZ325pDv683nQd852iGM865aOU467gBL696qDE528zOl188aD', 'aiV9KjwbE6FSpmLV91pR', 'eBL166uOY745oLB049kNn741eEJ579gMO799qKE295mZO612iT');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('fKP919bIU117uLh578xTc514uLi243fQQ180gWQ247wFe560iF', 161, to_date('08-10-2218 18:46:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-01-2015 03:12:14', 'dd-mm-yyyy hh24:mi:ss'), 'bXg456jVQ044uUh273gKT876wGG441aOO628mSV782pCz498yS', 'CzXQcz3apPWHN6nnAh2U', 'F8fo0yPl9Xj2pBHCkS5o');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('nPU617yOH248dOr964nMj075jYV038gMV290wLY580zCr617cS', 166, to_date('15-09-2097 04:55:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-01-2178 10:53:54', 'dd-mm-yyyy hh24:mi:ss'), 'gLb936uWS766qBZ213hOs672lIk917cGM146eKn621dSd482dA', 'jmHkeexmOfKS72wRfDFB', 'fnyLP364dkdYqKSTtxuK');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('qHu414pIY710dMy512fMA357eTO751yYD066bTc277pIK162pE', 162, to_date('23-11-2633 23:28:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-08-1959 01:16:45', 'dd-mm-yyyy hh24:mi:ss'), 'aGU478bRG259xJj525zFv895wYJ854yXJ845cCl452zKj472sE', 'vUZ139gTC312cHa588oXE616zUI490aRJ910fAP188nKc950wR', 'oQo3NkLUysRUdo5uEpBZ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('eNm991iRJ837sKF872nMs652iCl832xOb976zQo369qZH813gM', 288, to_date('10-12-2395 02:08:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2952 03:36:43', 'dd-mm-yyyy hh24:mi:ss'), 'jMp152pWf962zBE314dHH485hUt177tYL995oLt168sMp536fP', '0S1irtW8ZvrJKAFubwYd', '1TrOPzipcMEQ2Sw82b8s');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('qFL614zVG842uBv527nYy087aSj439nFr068rYP988tEE548nM', 13, to_date('06-06-2556 12:59:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-04-2085 21:48:48', 'dd-mm-yyyy hh24:mi:ss'), 'pHy275pSG999kIe961fOP939aIn535vHp352bJo825eUi032fD', 'Wv49749z7jNScREAGe1p', 's03kHXb2AV7SRlKYIjSm');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('xTJ724pPy932aNI316pHm788mKq142sIR715dYc055pRs693kO', 252, to_date('16-08-3034 13:46:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-04-2622 00:30:48', 'dd-mm-yyyy hh24:mi:ss'), 'mLw934fEu984jRs952lWr760fDt943tBc946jRH186yFq512bE', 'KOuAimoraRbCuiyb8RkV', 'hWIJ0cX0zz09YjFaady5');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('uRX412tAf033kZF828mSJ322pPP055lVa965xDq988aAy062xN', 16, to_date('28-11-2485 16:36:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2831 12:14:24', 'dd-mm-yyyy hh24:mi:ss'), 'kXt952jFo760gTj819eFH651yGQ633yUY446cEX386nAm252wN', 'oTv690xSN035eSI588vNr638oJM190tNM023dLq224yHB784uH', 'x7ITQsTCbRPfZ7m93Dqa');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('gWY265yMj670aTw240nQH799pIN667nTy491wRf687nPx968uN', 132, to_date('08-07-2137 04:16:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-11-3025 18:23:28', 'dd-mm-yyyy hh24:mi:ss'), 'xBl257jLT561mEx043yDL265tZg042uZw597lRK983lJj598sJ', 'kTr554sGv216oKu740yYL189vYU987qBL390xZO820mXf570eR', 'wbiIIVVpLxD4kyrYhwmP');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('gAV964iAU267ySo520aBg283yAU222wBa395eGT673oZz368aY', 230, to_date('09-12-2271 12:11:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-06-2756 07:25:23', 'dd-mm-yyyy hh24:mi:ss'), 'cWv230oRd912xIU212mFA585kSZ340jWh999jRM293iCC223vB', 'eMsqSjjqdHBc2PUOsHaE', 'cWn953dZv832fGM526nWb721vSR624aHr421lGh679vMS653aZ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('tGr684rPI744yNA726sHq272cPn536lLO098eXC693fPP244rP', 152, to_date('20-06-2706 07:20:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-04-2653 20:31:29', 'dd-mm-yyyy hh24:mi:ss'), 'bIp331xXr093jPG468nEi446iSt792dTJ836kGI838cFR951dJ', 'aTcXld4l2IGujbXPo5LL', '3pIWN9H4589vPcb5URgz');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('aOQ448lSV431sAq340sBb293nHl692tOh777hHc768jIU959gE', 196, to_date('06-07-2711 01:27:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-01-2885 03:23:36', 'dd-mm-yyyy hh24:mi:ss'), 'kRI628lGY914aGk988iHV085pHj156tDA611eHY377tEP913rP', 'aXH745hDx297bWP928qHd497dDN693qEn715mCM473vBR484wF', 'fXXqu4ksn1TaMoYRJ4Py');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('wEG056aJb853sZg570qHO858dFI737oCy091hJo322mVq564zS', 197, to_date('17-03-2715 02:10:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-03-2740 19:19:29', 'dd-mm-yyyy hh24:mi:ss'), 'xYz469nUd023yZS124zMu972wOy652wUV985vNm378cPJ717mB', 'kxfK9AbomBjLgF9kdiOc', 'eQD647qNP344fPN181sGb315zLq620fOy179dQy577oSS126tQ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('wEa328hAl798zIU391cVv430aUn716lEV063tTJ732pAl526jI', 226, to_date('16-06-1949 20:36:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-07-2726 10:16:01', 'dd-mm-yyyy hh24:mi:ss'), 'wRv116wEx313pVY446vYu247sLD611pFV628zPs585sNt997jP', 'dRl210aZX531pAm595dAP625kQQ270uBI696jWI334mDJ372wQ', 'kYO320vXI683uIr685aIb880xQP552sAV076bUM942zLF942iK');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('nKR553fUe721bSn531xTk066qZG220kBu745ePh821cEO782qD', 282, to_date('12-03-2183 03:30:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-03-2809 07:41:31', 'dd-mm-yyyy hh24:mi:ss'), 'oFQ277jCF067dZL951gGU494dXy873lXt240gBL179lHu259bX', 'MBneLoLOYezmFmncrzZC', 'hEU496aKL638qGs175fOs055hUx895vOS356nFH247bJy947qU');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('hRo088rIt824zCW155sXU957bFl951zVo648oHZ159rWs557qL', 15, to_date('25-11-2843 07:26:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-12-2777 05:36:57', 'dd-mm-yyyy hh24:mi:ss'), 'iZc795sRe047gMm516xXj777kLD688rRS384jFk827oSw272aU', 'cgN26MS8ewLttg7cBvRn', 'wTx164nCF728sRN560rEP792xVc822wWG655dTu719lRY720qS');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('qRE376fXd393wNe188eRf142eDv785rTI154xQX610sGI377jK', 126, to_date('10-11-3071 14:22:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-10-2895 00:37:00', 'dd-mm-yyyy hh24:mi:ss'), 'lCA284mAW312hMq032fNS963fKv469bEh513zNL384dHq033fJ', 'fx15COfZeXmH1zss0APe', 'Zz79pvi19KDhzXw5kIru');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('uZS658aAi249tVt497bYi623xDQ565fJt513tCe911bRV859dF', 192, to_date('04-03-2995 14:41:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-12-2382 05:22:07', 'dd-mm-yyyy hh24:mi:ss'), 'zSC278iMe946lOS295hSo014vKq180kWy958yHC096pZN820jN', 'cZG892wLo732sEC182xYu154sBn050wZQ670oRi845aKJ185aJ', 'MfQOWD1QbDdGFcVEUKP0');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('qDN166eHG873yWn565tOm014mEc878jVX761nBf737vUo442tP', 11, to_date('04-11-2306 04:27:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-01-2658 03:31:40', 'dd-mm-yyyy hh24:mi:ss'), 'dTn054vVP226fTR237yBa685rVy616tEf999aYX829gDd379bS', 'jBg024xQX947sDk239tUV195uZj911uZJ676eXA176fAU122iO', 'xMW071aTt162mFw214oNH079sTH986pAl044wGd898uWH769hC');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('zPt245eGF277zVc672pJN328hNN036hGK024dGU862iVJ934aM', 123, to_date('14-01-2114 11:19:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-03-2726 20:13:12', 'dd-mm-yyyy hh24:mi:ss'), 'aKi313yXX615oNr940uRY697tGW778nPf629xHo053sSm212zC', 'pZq211mAB189fFe790lKj538eHp890mDw832qVi921tZV294aE', 'LxQlmoUwcClfPCnijZ6N');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('hQY629qGx218iNY635fVp339oRv422xGB785rMQ955zZq195sI', 313, to_date('15-02-2645 10:38:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-04-2637 21:43:37', 'dd-mm-yyyy hh24:mi:ss'), 'zUP265sOo410oCc088rNL330aMP650uHk399jZf018gLa318jH', 'mvRGFgz04a0QsraJcq99', 'gzlZAOOvvk6Keh0e9QgY');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('qON840oWl864iIj085iUG796sZd062nKc997qEZ515cKc671iN', 185, to_date('09-08-2591 01:26:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-10-2312 15:50:49', 'dd-mm-yyyy hh24:mi:ss'), 'dQw334yAx285bFN435bQD486cXk031nZs287iAr028kZd730pI', '1zysUx3C9PgvvpBQ9rOk', 'khfw65juHe5S6cO4DzHT');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('wKM015cBX976iZq619oUP236gDE281fBG357dCx376iXP295dQ', 168, to_date('23-09-2648 06:00:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-07-2566 11:37:58', 'dd-mm-yyyy hh24:mi:ss'), 'uUB320kGo536fZG018oKK868qCj326xUr646cGN268tPQ326qN', 'naymfyIKvn8oMVNCJlHm', 'bWm637oNK097bLw323zNb539nYN739zIa321zLw046hIp247eK');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('pYR242lGC042rSZ492cLV778kXs795gAZ392zEG631rPV992aH', 303, to_date('18-06-2625 03:21:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-11-2724 09:53:42', 'dd-mm-yyyy hh24:mi:ss'), 'oPr067zDO389fSE794zBN159zUa193tTU772qSb935lGZ177xS', 'F5ZqC646NM31gft5jpNw', 'rTHAJp1fZiRjKHKPJELs');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('wSO033sBR943rZz399kWY822sRp132cMH685qGq548wQS541cO', 61, to_date('08-01-2429 02:30:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-06-2924 14:23:08', 'dd-mm-yyyy hh24:mi:ss'), 'fFY024eMw021bWu735tZk879pPa998sCx874wWG644aEg197vN', 'kGy840pOa828jPq235hRm920uOT718fYd116aXC771tPQ830tE', 'Co5IEwGFd0cVnLZORhuF');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('oZf451oSR591tUh123hAs074rEg639eCo853vLF440qBj763xA', 327, to_date('15-12-2460 09:04:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-06-2655 23:55:14', 'dd-mm-yyyy hh24:mi:ss'), 'qNN934mGH624vPv431pLo977pYd951qUO112wAZ289kJq497lQ', 'pZq211mAB189fFe790lKj538eHp890mDw832qVi921tZV294aE', 'dPr798yYe661wVH544pFo111zPZ089lVZ713uHW653gHS127hT');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('hJx687tEu481qDk573kCN282rUb436rLJ817uAK195yUk572tR', 113, to_date('24-12-2465 20:07:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2529 17:02:24', 'dd-mm-yyyy hh24:mi:ss'), 'aBs853bXd646bIi294kXp664zGC738nEW945zVN662mZQ637xR', '29wJuzTCbAhXOMxj3GDE', 'tCK179zBg539wVP183nXT288pEg936pQp084rUA027dDK725tK');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('xNF784gNl251rOR630uRK921nTe141oQA274oUR277kSP078nL', 231, to_date('04-02-2737 00:04:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-11-2019 12:01:26', 'dd-mm-yyyy hh24:mi:ss'), 'cRh250vOI467tAe089vSu482jAa640nEh614nKy292sQh538kK', 'uMZ923gRw240oQY646cGH242aMB647dOx544sHJ387yBl952rJ', 'L1TBmMtz0yeqP8OJX15d');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('fVo742yOY378kDO265nIu820zUc045zJF289sAo616fUj790lC', 78, to_date('19-09-3064 07:07:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-01-2204 02:15:30', 'dd-mm-yyyy hh24:mi:ss'), 'cEM798oMB588xBp932kWX027nJw824wEf114rXP540zMG012yL', 'JkK8CvGABEKt4OKWdb13', 'SLh1YFP7x1uPe5HKBvIh');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('eDp861qJu972mBT098zNQ994eAT827pLU198lLv749pLH866cY', 290, to_date('01-08-2535 08:51:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-12-2248 02:52:04', 'dd-mm-yyyy hh24:mi:ss'), 'vVS075mDI817eLo086yUJ542hYh455bRH499uUT943lYO481kN', 'c2aVHdJczfcFnkqT9xZB', 'hWIJ0cX0zz09YjFaady5');
commit;
prompt 100 records committed...
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('xFS580vWL838zTP940rJq364tPJ374yVJ797nFY192jUF516kY', 155, to_date('06-01-2904 13:14:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-03-2524 15:21:01', 'dd-mm-yyyy hh24:mi:ss'), 'aZB129dWb943qYo743gPm342kUd744gSg954oAA753eMn923kF', 'gZv769eLF115lTM932sCt596wQn076aMX839wLx442tRq180zG', 'fSa710aNb865hMK860wBP731wPG422qAK856nMy960xLU766aQ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('bXu581fFQ499pCx932eQO667pPC584qSk440oRl979vVj154wB', 78, to_date('30-07-3051 23:34:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-05-2812 21:02:09', 'dd-mm-yyyy hh24:mi:ss'), 'iCc645dPu751jVl316gHt567oCV629eCz932vCW425fIF585oL', 'cZG892wLo732sEC182xYu154sBn050wZQ670oRi845aKJ185aJ', 'sWM147kBb935lCe482wAa360xZe047uYP315eXr676wIN992sO');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('rPN799cYQ469iDv381vQS095xFO468kFy336jGi167rIc935qI', 139, to_date('07-12-2881 23:10:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-04-2418 08:39:15', 'dd-mm-yyyy hh24:mi:ss'), 'lYL246iDU432hPD054nKc573cEq298rVi839uJG655gAX880fX', 'H8ktArK1AnIvAtq03y4U', 'eF1nM5uXQlLjvCRgjBWL');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('xTJ816hJE362cJU094oVx356xLX568wFp461vMp113iXg433zQ', 288, to_date('03-02-2668 07:25:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-08-2697 05:16:04', 'dd-mm-yyyy hh24:mi:ss'), 'dLr136jUB319pNs410zIM534uSp857gMp947tIK691lYe385dR', '3tD22HU6WJsLx6BV02Ge', 'XzOLUAzIYIZc7FZ2q5hr');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('nND146fQS263cSO691uKP276kZG871lGn277kGb959hCl213eH', 62, to_date('07-02-2930 10:11:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-01-2098 05:53:05', 'dd-mm-yyyy hh24:mi:ss'), 'rLy854vJj332jFB042wHW964wJf172jWA179qVG396sGK765wH', 'C6GDuFYkXkXKpQwKFxF2', '0fEefRaYmAj1MYdR7uvM');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('gKB820gYy454dWx184uWJ079sHe754jUn753sBP883fSB697fP', 96, to_date('11-12-2975 11:14:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-12-2725 19:47:42', 'dd-mm-yyyy hh24:mi:ss'), 'nPA561wSQ330pGb151sWK860zDx067aYt064xMI153iIp554sC', '80X7u8wrgHsTniARlakr', 'bNv128gAB874cEk363eCb879fBA954uAM469uBz820eKa776iR');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('lLz787zIV672rAy615wNv567iSt820wTp241cTq944gZu079yQ', 298, to_date('02-07-2216 03:02:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2272 11:18:23', 'dd-mm-yyyy hh24:mi:ss'), 'fAW812mAJ839wJu532zKt762jSg520rAG242cNs140xAp478cC', 'jBg024xQX947sDk239tUV195uZj911uZJ676eXA176fAU122iO', 'm1j3vXApjpTgaVDMmqu2');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('vYS395aOh599pAg329pVf387dGw147tHU694cCJ586mXT317dL', 288, to_date('20-03-2906 07:24:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-02-2072 04:20:29', 'dd-mm-yyyy hh24:mi:ss'), 'bBY740rZe086cDL062cDR742jPZ095kEO250gWJ846lMM425jW', 'FMvrvf8zRSJo8VW6q7Oh', 'wbiIIVVpLxD4kyrYhwmP');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('fTw344sXa318gXw762eMC511tZI488tYS188yFF528mKx451nS', 288, to_date('23-09-2285 15:02:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-12-2297 03:43:46', 'dd-mm-yyyy hh24:mi:ss'), 'uZZ429dTb590fTl814aWj425nHM727qJH050aSE852xAK480pV', 'X8lGC8JyK0l4sTcC5OT9', 'Q2ZZoK3e27KjeiAKzZRa');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('vJL592sVD691nRk794kBL892mEg492kMp968wTn276lNf669jP', 247, to_date('17-04-2593 18:32:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2270 03:22:45', 'dd-mm-yyyy hh24:mi:ss'), 'mHG816aMa028gXF684kLk271qPg816vPf565mHw757jPn220aX', 'KF7CA8u8AlXNS02eCFK2', 'SS1AiZw4LF5ZvTXlfGzm');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('bKl269sIq913xMG219sJa657yNa871vTv632cWY914iAH394oE', 247, to_date('15-07-2823 21:35:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-08-2369 21:10:39', 'dd-mm-yyyy hh24:mi:ss'), 'kMC469lUv773sTt596nYW649bVj644aJz772ySG625zQe493oL', 'RUwEsLD7qbwtwAZljOei', '8xMoiaNtlBKPInToY3mm');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('hHp515lGQ811zCP683mUF972eUj349tHk174fUK328oFf357sC', 45, to_date('18-01-2714 11:04:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-09-2880 17:57:50', 'dd-mm-yyyy hh24:mi:ss'), 'zVG499uZv822pJV527uEE758dKx882sLJ685gYK266nFK173yN', 'JqRwnCoajVpsABi4gxMR', 'u3YgnTv1nZbeH6eZK275');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('iPg812bGI356jCg312jMY549gPO942eUZ178cHT029mWB891oA', 315, to_date('04-05-2373 10:24:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-09-2229 03:42:11', 'dd-mm-yyyy hh24:mi:ss'), 'lQD411kIR614yZm456qUC396cMh881uPc354kTg625eIo638fI', 'aTcXld4l2IGujbXPo5LL', 'MFXQybdPzIeUhJU493g4');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('lJi152hWE199tTZ076tJA881eTf339bGe593iRe250vES597eR', 137, to_date('31-12-3059 05:40:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-08-2774 02:32:12', 'dd-mm-yyyy hh24:mi:ss'), 'uEC143fBJ163nWQ624yNT146kOG216bYp363tLw219iMK497kU', 'Bxfr0bdpgQD03eOspdU9', 'rTHAJp1fZiRjKHKPJELs');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('iIw296gVC487uFV747tFQ375eWl289nCo652pFa461gPf776uY', 54, to_date('14-03-1909 08:02:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-02-2280 00:23:11', 'dd-mm-yyyy hh24:mi:ss'), 'lRr844tSo344sRI057vIw870gQm549fOQ212pRD054vPV193oL', 'iUq174oEq650jQC316xYT554rVe883bTB339fNk369rMW164hH', 'rU4VY9sOnuTUDdsDdIeC');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('hLr975fXH980zWA487cCT592wSh580jAm051mQr283hVt388nM', 279, to_date('27-06-2465 08:49:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-05-2930 22:03:38', 'dd-mm-yyyy hh24:mi:ss'), 'tHD526wOn641uFi140hGg465wNX334qAE861nKp678vOb316oQ', '9AKU1sOifumqJ5De4jEg', 'CrYzxCNfDiXDeqZsLYdP');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('hPM876uUU819jFu417fRB170aBj787rEl562iLf793jDc918kO', 138, to_date('22-04-2081 12:08:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-07-2200 03:30:23', 'dd-mm-yyyy hh24:mi:ss'), 'zHa075aFw926zRF838mSO644lOY954fOW264gUS773pIt531nK', 'kI2eLQnGZVKaXR0NHeVc', 'syTjLx8LQyBjbabvnCRT');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('hKo960iFd288cHR966sMy076jWX938rYa822tLg255wHE794iT', 166, to_date('16-07-1961 18:03:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-11-2610 11:46:36', 'dd-mm-yyyy hh24:mi:ss'), 'sMG838jPi549yFM295pRX642pLm819hNl317eDj929vQQ933cE', 'VE5cNYoVJ80qrhYcb5B7', 'gQq951iSK775pZL455uKO521qZK670yPa171sNq558sCQ573bR');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('tYr064bTn123tGe777aOZ016nUl088cUw377dGz012mMv144kZ', 242, to_date('17-05-2655 02:05:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-07-2249 17:26:35', 'dd-mm-yyyy hh24:mi:ss'), 'nZK548lUY520tMD760qYT083zWT156sCk132lCO747vDw023wG', 'bWW663oSg428pNq492fYE699eIo225yOl114oCd175sGI613mK', 'AAM5wwa5KrPbu68pfIMM');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('yOR838aCD274pPE442vPA751vFu271cNq988vHz655dVr189lS', 304, to_date('14-12-2342 23:30:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-10-2318 18:19:26', 'dd-mm-yyyy hh24:mi:ss'), 'eDY740fPU022kIv031oKv024rTv311dYn067uCL427fKA488bN', 'wKA476vIL014aXn970tFq456gXo981tPL494zEn868rYg660pL', 'uKM162zOD623vQo348kDn897pKn059pQb633nIk489tGy198zL');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('sJG162bIk079gMZ023sTe743fHG493nHU412rMI751fEs321yT', 144, to_date('25-06-1980 13:36:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-04-2742 12:47:31', 'dd-mm-yyyy hh24:mi:ss'), 'mTS474jID094pFF958sRl270jLu153tIr661yNl890qIy666jF', '7oIWIe5uK7gkYJVtl6ZO', 'vIy094qYo721aYf242gZP325nOR093xHO960gBp019wZo338gL');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('pVV898uQh011hXO043rAr953fSr895nWX921cCD849fWy148vG', 199, to_date('12-11-2420 04:34:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-10-2406 11:36:05', 'dd-mm-yyyy hh24:mi:ss'), 'xNC157kWA969sDQ946uLK596kNE041oJt086nUb289eAE348hM', 'cz04g0ksh1QKO0j4THGD', 'UUtQR97yvuExy2K1RrVW');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('mHN371rUA374pWP114xXt824dOW678uRj580lMK176jOB890pX', 8, to_date('15-08-2915 03:04:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-07-2546 23:08:35', 'dd-mm-yyyy hh24:mi:ss'), 'hFV167uTO633nSu684fLu132kQQ854vUU379zNe959pEd045pR', 'mBv559zVG832zSd913qDm698wIl187wVq271zKE753aBp530qZ', 'nCz475gSq015eIc298zPR554aSM451mKV798iAe852cQT725dK');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('pYP347qPd099wMg685vHb635vHB340gVS843sRX739nPE966nJ', 150, to_date('07-06-3021 02:59:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-05-2508 16:27:50', 'dd-mm-yyyy hh24:mi:ss'), 'zKY494dIF571qWU920aZf279dDK639dKT093vBl689rXM394cD', 'jLZ972uYD979gKW395dMP361fYc233sYJ346yIp876iVO981rC', 'yKt846iTj029tCQ539oIC481kZj381iOX127dAL917hAI993tV');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('vCn837gSP863hYK626rBX581bEm174wYF981jGG977iUf925qB', 263, to_date('08-06-2491 15:20:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-10-2188 11:05:08', 'dd-mm-yyyy hh24:mi:ss'), 'qPw115nZk815dNi424pAN182zXk416gJJ913gKN016yTs482gR', 'lAD397oBO528aDX387nDe851aGf911bFm896qKW535lTc170uG', 'R8ovhwd7o5T9Wdi6cR9f');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('xPo558nZu667eYW330fIs520bCM812vPu910oBd687vLJ579eR', 296, to_date('06-11-1902 08:43:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-09-2762 23:12:02', 'dd-mm-yyyy hh24:mi:ss'), 'eUn341hWW224eZZ890ePx956eSH062hRp680rTT676tPb944sK', 'QSxJWOWO3fEEG1y28qIX', 'L1TBmMtz0yeqP8OJX15d');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('jBW335sGa312vNx134yDH476kCx562tTt393qYi223nBH754oW', 30, to_date('31-08-2460 19:40:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-11-2575 01:30:25', 'dd-mm-yyyy hh24:mi:ss'), 'iHT846zVp521bBu687dBc373lJH047zXv330tMM194qLr866aU', 'wLsqznwUyVKmYy6Ujc7M', 'Vg6GZOfF5ly3IQclnBZa');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('dKx180vBU146rUU366sEe166iVH865jEx133sPB932rBx663oK', 34, to_date('10-12-2705 20:49:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-02-2318 05:54:31', 'dd-mm-yyyy hh24:mi:ss'), 'cQU561fZY271hFf840tLP550vGT460sXg935vDP388cFI888xZ', 'IQNFb9IrBrjOfAe4UCZB', 'uWx373dZO674wOz122fRv236yJi290xVn597tKr441cHO049mM');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('zPZ284iOW234xSo281qFk541lNU531eWg773iZg627uHO091tC', 15, to_date('16-10-2563 09:10:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-06-2933 23:50:55', 'dd-mm-yyyy hh24:mi:ss'), 'wAR115qZN696oRV723eYD919wHo458nVk936vKs665wBt248eY', 'iKL992vZt455gGQ987bNz922kJl132uXy315vOY259hEp835zV', '3e7bkbacsZl7mHkrb7tZ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('aVU858dJy344iGI083kGx165oBd535bMo271mAH590pMh045hL', 228, to_date('24-10-2267 04:27:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-07-2411 19:20:03', 'dd-mm-yyyy hh24:mi:ss'), 'yGp588tBo875iXk069fFX612pWY683qSf568oGF787rJW030uB', 'hI14CMd5QH2J067uF8WY', 'MfQOWD1QbDdGFcVEUKP0');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('qLV642iXR244rPW622iOJ522xWO873iKH073fSU715dCX569tC', 98, to_date('22-07-2751 06:53:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-09-2609 18:04:36', 'dd-mm-yyyy hh24:mi:ss'), 'pHn110rHD746yUo131vQG351oEU597yHN443dTE047cHD660kY', 'fNWv6AEV7TCY4rVHnzu1', 'eFR837nPK696oFq236sZA856uPk583kKA343sCY698fXM123mJ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('hOB872eZQ440gBd273eGN328tMm618xHg132lNx418tGB883pA', 253, to_date('09-02-2723 14:19:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-07-2582 16:35:45', 'dd-mm-yyyy hh24:mi:ss'), 'dGS959fVP265bFy482xAP836zDC016iFY557hKD535gGb533sQ', 'Gzj9iEsVyA0a2qbMa9tu', 'uKM162zOD623vQo348kDn897pKn059pQb633nIk489tGy198zL');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('gHR664pID279qSc236hDG948gMT167mCl280uMn173hER318zS', 69, to_date('25-05-2890 07:31:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-01-2733 00:01:26', 'dd-mm-yyyy hh24:mi:ss'), 'bXX235kVX027iQj340zWx776bSn377jGm485dBQ966tOM166oI', 'd2zLzLXK6C5OdO2l6j9k', 'cVR995dLO221gSN350lVo360eFk359iEv558wFl337jFy699oI');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('wIc129uRH699aSg847fYY840cSh024fUF463gYc592jAu150nE', 174, to_date('20-04-2132 13:25:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-07-1988 10:50:18', 'dd-mm-yyyy hh24:mi:ss'), 'sTg340aMJ340nPZ655wUT311aDx737vYG610qJm529tAg092uB', 'tOA840gEP932mMH090fZY040eAj155yYZ349dND696vYh413mI', 'lXX079uTT852xXe447eHp936tGN939xIz185fLs291lPn829fL');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('aEQ313aSr737sEi658jON466nWB346hNc180dTZ142tEX776eS', 330, to_date('05-10-2455 22:46:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-01-3050 08:18:14', 'dd-mm-yyyy hh24:mi:ss'), 'qJh919aHj438qXJ748nDA653yPh720zNy753pWh839fUx279lB', 'eSZltoQZEXTAxrCt3vyy', 'WZsN5y7bpY4x2Mw9QFYX');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('cXV589dWG720rZY750jXF849sKQ039xLs931nUA250tJa876qW', 155, to_date('10-04-2760 01:54:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2559 10:07:23', 'dd-mm-yyyy hh24:mi:ss'), 'ePj391xXx944yOG991bUc269fKh491mUk198xWD381dPQ054vI', '38pqaizZggN2Ag5mFZLo', 'sJBc8xcABLl0ZRPMgNtH');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('wFU832cGs921aMG254eUX545iBm777lCb794rYz915kTb016zB', 77, to_date('04-10-2907 13:29:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-03-1978 13:20:03', 'dd-mm-yyyy hh24:mi:ss'), 'jFU154tIF782cVZ477lKF984yDP539wKQ935pFc465nPB796uX', 'kTr554sGv216oKu740yYL189vYU987qBL390xZO820mXf570eR', 'TyMJESa86cLORC9yQtl7');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('xML889qOD396vSu762zXg597hKV697jYy713bWr054lNP978lL', 326, to_date('21-01-2754 19:25:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-07-2514 11:26:18', 'dd-mm-yyyy hh24:mi:ss'), 'gGS420jRu529sSw166iYJ240rDj898vDZ345wLc717tHC274sU', 'J2wjcUvUAemDfUq4GNtH', 'dMk633yIM757qZu746wDB014dMH383yYa010tXJ931jZO652dX');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('eZw768xXO173nTM848wBN765eHM576yCz960vNz695cXo614xX', 309, to_date('07-02-2799 14:27:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-11-2303 23:06:25', 'dd-mm-yyyy hh24:mi:ss'), 'oOj680aZI524gUH288gWl734zEQ034gIg947vBw216dSm331tO', 'cis3n5kwVLs2W2DlCWPJ', 'nCz475gSq015eIc298zPR554aSM451mKV798iAe852cQT725dK');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('pJV833aXA817yTE674zUJ436hZT349tPt867hEt623vSm368sL', 248, to_date('24-02-2417 23:22:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-10-2027 17:27:53', 'dd-mm-yyyy hh24:mi:ss'), 'qAR256lIv852oNH234cRr828nGL030cIf557uPz872qWz159xO', 'vdt1x2tRxBiIMJCyWTqB', 'njxt4sbpL44N3Be4fYSw');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('xNP581fFD456lQv984qXL072aIx269kPd752zIT417gZm251xM', 199, to_date('19-07-2294 17:45:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-07-2881 21:07:03', 'dd-mm-yyyy hh24:mi:ss'), 'cRo097nRm419cNW388hZK635eBw549qEi261rXJ356iPn067sQ', 'z3jdKsy6FpE9VrunWgxD', 'aRr249vLO664mIt010jUG490aHd967eJM323tFo074uTA341lE');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('aMO270sCC679cKi459fFo941qOd429pUx433nYT856dUQ892qM', 189, to_date('15-01-2508 12:55:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-03-2103 23:15:47', 'dd-mm-yyyy hh24:mi:ss'), 'uFa468dUt138lUs618wAG352xHV951fEG386wGK411yTX420dM', 'EgR9JFkvwTBhL83hiaFt', 'H3jTnHPcikOC1o60ViNG');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('zGN515zGX994bOR256tKB128pTI642pBC286wLi029zHE737cK', 107, to_date('21-03-3038 14:46:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2883 15:45:38', 'dd-mm-yyyy hh24:mi:ss'), 'iJg214tHr861vVu315bWI624qRG414zLo355kNd626zKe471sM', 'vdt1x2tRxBiIMJCyWTqB', 'JWeRudVwQiRgQiXFDHkd');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('d4H854UOU9MATzorXKml', 24, to_date('06-12-2014', 'dd-mm-yyyy'), to_date('20-11-2023', 'dd-mm-yyyy'), 'fALLez6k93ikIYhwIAzC', 'A5NRtouv7ZerCjg237Cq', 'yIlm7vKzQjuV6COlD2Fk');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('XBnKBnI0wzMy2cOCV6eg', 88, to_date('21-02-2004', 'dd-mm-yyyy'), to_date('12-07-2018', 'dd-mm-yyyy'), 'EfbAte6TMtkYhUTVKSXX', 'SPoiWutNENGhkAmM6SU7', 'GhE5nvOtdYkgNbPQKkra');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('tZqhb573G3rAGIkGRAwd', 75, to_date('06-03-2023', 'dd-mm-yyyy'), to_date('17-07-2011', 'dd-mm-yyyy'), '07h8PuDnOLAjFbi06TO7', 'yRrZHlmdtLgmpytIr86Y', '67MWYA8Hj03xFVHajZtc');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('dTrBYQe4ZJ4p5ga6kYyh', 18, to_date('22-07-2012', 'dd-mm-yyyy'), to_date('06-01-2006', 'dd-mm-yyyy'), 'tUz3cyBWAtowLga161NR', 'mvRGFgz04a0QsraJcq99', 'pybbnBEnVgNxSwX9uUFH');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('YwsqxBn5aKBkyhnFb797', 30, to_date('26-05-2008', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), '3lj2izj2SCPSf8TwWCFA', 'NHCoKKLvMFvHOPUBKy0a', 'WbS858YFNGISImiGShXo');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('bluqv8XcoDIbzjUtOqi1', 43, to_date('27-11-2018', 'dd-mm-yyyy'), to_date('03-11-2001', 'dd-mm-yyyy'), 'Qbc4z163oP1HVYgWfyZJ', 'wbkr9JCAsoj5ixFhWuzn', 'oMpOWbd3k8r3hCwywV4Q');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('KywmAVqkXZzRJ7gMEWlf', 58, to_date('21-11-2017', 'dd-mm-yyyy'), to_date('14-01-2010', 'dd-mm-yyyy'), 'E3LxJZkUVES6KqfHAa64', 'U7RCqAOUqz7FdoiEfBiz', 'khfw65juHe5S6cO4DzHT');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('tZm8mhT7IS4sdq92EqHR', 12, to_date('09-12-2000', 'dd-mm-yyyy'), to_date('14-05-2001', 'dd-mm-yyyy'), '0UNVNO8XxuceQ7d4u39y', 'JJxecv0MvcZMGORGS10L', 'cqbTwNjnecTAsf6TFjXI');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('i24gwVXy2Lo94xmuzZiB', 43, to_date('06-03-2020', 'dd-mm-yyyy'), to_date('20-02-2008', 'dd-mm-yyyy'), 'T2ttauVZU498qBzSpX5j', 'pAWlYSsAxAUqphVStjoS', 'wbiIIVVpLxD4kyrYhwmP');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('fU1oR7m5fLX5TWzo8dII', 98, to_date('04-12-2020', 'dd-mm-yyyy'), to_date('25-11-2013', 'dd-mm-yyyy'), 'wy46y01GdfakGFWP5prd', 'naymfyIKvn8oMVNCJlHm', 'Vg6GZOfF5ly3IQclnBZa');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('77DPd54mblIHZG2Ro4D8', 56, to_date('11-06-2017', 'dd-mm-yyyy'), to_date('04-03-2004', 'dd-mm-yyyy'), '4fr6H5okAyyzDWUO7Sni', 'LAFiIaBVBHjEcWZ4J0B7', 'ju0aQJsNsoHWPsPycfWP');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('arSzofguIQLeCfZMhAQi', 59, to_date('25-09-2019', 'dd-mm-yyyy'), to_date('02-07-2006', 'dd-mm-yyyy'), 'vJQUXkniiLHa9wcqTGEc', 'gpKCZnHsxk5S5qg0QmPw', 'hf0UhEjys2flCW13Pv1s');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('Z2RQxbv4OS6U8hSvVVCP', 81, to_date('09-05-2014', 'dd-mm-yyyy'), to_date('04-07-2019', 'dd-mm-yyyy'), 'N5nqctNhNfP3E5JZiQhX', '3tD22HU6WJsLx6BV02Ge', '0fEefRaYmAj1MYdR7uvM');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('ThqBRLzla2wX8dgLKzFM', 11, to_date('26-08-2008', 'dd-mm-yyyy'), to_date('04-09-2020', 'dd-mm-yyyy'), 'tBJrQhT7LZ2NVDNWYzNT', 'xwGfUtfegJiCYGSOcgWF', 'ZvBpAWrXai6EBAqPi9Q4');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('kOMhWI4O5tmAvIntfKyD', 10, to_date('17-05-2018', 'dd-mm-yyyy'), to_date('03-06-2001', 'dd-mm-yyyy'), '0pFtbtix7jMe1WHNrJAl', 'BPx7Q5ajQgDyaymXyyhe', 'cqbTwNjnecTAsf6TFjXI');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('jzsIV0fyioU0cakFH6A1', 72, to_date('08-04-2002', 'dd-mm-yyyy'), to_date('06-03-2017', 'dd-mm-yyyy'), 'YmRnnjKnL4XvYfo96dDf', 'J2wjcUvUAemDfUq4GNtH', 'i3OPj0bfYWK0dnx7AKK0');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('FyYq3DNfHkxsKsLKXXKM', 71, to_date('23-07-2014', 'dd-mm-yyyy'), to_date('12-12-2023', 'dd-mm-yyyy'), 'ggom70wEHAIRR3jWXkA2', 'JJxecv0MvcZMGORGS10L', 'Vg6GZOfF5ly3IQclnBZa');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('sxjDNxtFItYfewk1Fefs', 38, to_date('21-08-2002', 'dd-mm-yyyy'), to_date('26-08-2015', 'dd-mm-yyyy'), 'JsICYNCW68IMOPUUGAlo', 'pAWlYSsAxAUqphVStjoS', 'XzOLUAzIYIZc7FZ2q5hr');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('diANcroph0TI2kpqELC0', 56, to_date('11-04-2003', 'dd-mm-yyyy'), to_date('02-07-2018', 'dd-mm-yyyy'), 'Mr3DQe4JUdbEqLSX7bvN', 'IycmfkUJHH38ZietIpJN', 'BObJ6VLBljGsxLSWjrW2');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('oTIBkugDAVkJx7VPDMlG', 50, to_date('25-10-2011', 'dd-mm-yyyy'), to_date('03-05-2005', 'dd-mm-yyyy'), 'HzbrCLfrzCwZRktN8U9G', 'ceA7JgXopKkLgAEj2Irq', 'ycRLs5xWmku6ZFF3uXxY');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('I36wrppfcEpIWtxosYx3', 77, to_date('01-11-2014', 'dd-mm-yyyy'), to_date('17-04-2011', 'dd-mm-yyyy'), 'Qrj0QpD9UynuQNcwsELb', 'wbkr9JCAsoj5ixFhWuzn', 'qTjAfgw3KSKPVbgl2Ae1');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('l4RBKoD13EYKfmwZ8QVX', 0, to_date('24-03-2017', 'dd-mm-yyyy'), to_date('01-11-2015', 'dd-mm-yyyy'), 'rtLrHLI61UHlSELLme8i', 'nCjs4vyxnNZULKfVD1mj', 'Q2ZZoK3e27KjeiAKzZRa');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('KligtUn6SbAS0Yoi4w3L', 59, to_date('06-01-2007', 'dd-mm-yyyy'), to_date('06-12-2003', 'dd-mm-yyyy'), 'vLC5LFmjCl8fP0zxhgz0', 'lBRbmATMkqcDQKg8zGW9', 'u0kJmKeBO5YgvlW05nmE');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('zouz9HnpbIbmkfTY8sl1', 58, to_date('08-04-2017', 'dd-mm-yyyy'), to_date('27-09-2015', 'dd-mm-yyyy'), '8vY4ZRQ2oWqPkh805aYZ', 'ptvv82QPFbguhmsnEy9z', 'qTjAfgw3KSKPVbgl2Ae1');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('Yqwka0MBdqNYYRP51L9q', 45, to_date('12-01-2008', 'dd-mm-yyyy'), to_date('02-02-2005', 'dd-mm-yyyy'), 'sy2r0EAvuo61Z1v2zMrw', 'EgR9JFkvwTBhL83hiaFt', '5O3RYcDQBebTThuzjgrn');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('eY5OVNZ34N8wsKvSieYq', 12, to_date('10-10-2005', 'dd-mm-yyyy'), to_date('27-12-2011', 'dd-mm-yyyy'), 'hqqQpclgWqMJNGbmsbXW', 'QM4uL0gVwHFhOn1wSYc1', '3pIWN9H4589vPcb5URgz');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('SKctjP3OwQ7NFyI6lLh6', 22, to_date('02-02-2013', 'dd-mm-yyyy'), to_date('01-06-2016', 'dd-mm-yyyy'), 'A95apOfKzrIhX4ZyUkOF', 'NHCoKKLvMFvHOPUBKy0a', 'CrYzxCNfDiXDeqZsLYdP');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('FY0PIxQRIFA9aTBiPXK1', 94, to_date('17-05-2023', 'dd-mm-yyyy'), to_date('15-04-2012', 'dd-mm-yyyy'), 'MiFYrzZFSqxy2zZZ5brQ', '5nXNQf6ObnCxIhAoCivv', '67MWYA8Hj03xFVHajZtc');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('dtPa1Oct9X64xeuRW6QY', 74, to_date('22-11-2012', 'dd-mm-yyyy'), to_date('13-08-2017', 'dd-mm-yyyy'), 'Mgp3WJg8l8V9XqbNmbVX', 'teMeyrsxOR5tSJowNZTr', 'VLavrGF349D9K9Ko9JfE');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('IAzBTL4zP5jRVc39CIhB', 84, to_date('27-02-2016', 'dd-mm-yyyy'), to_date('04-08-2017', 'dd-mm-yyyy'), 'zokLb6UH86G6vVQEjncL', 'qaIQssMdmMnL9BAPR5dR', 'eUGmTPixKekVw4AsyzZp');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('xOokjMN8cBT5CdwKCEDO', 50, to_date('13-09-2001', 'dd-mm-yyyy'), to_date('15-11-2021', 'dd-mm-yyyy'), 'qqCSXbQHMbpYKjf2ZmJD', 'NHCoKKLvMFvHOPUBKy0a', 'fwZnHZMzB6uva6bHEwnJ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('IkbtOgUwtizkogyhdPjP', 46, to_date('20-06-2023', 'dd-mm-yyyy'), to_date('23-12-2016', 'dd-mm-yyyy'), 'WLo96ZYE27JfbkwvWHTo', '8ncliBh8AHMCzngq6uLR', 'pybbnBEnVgNxSwX9uUFH');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('h7SLhOx3O4ClSF50VdIn', 6, to_date('07-01-2003', 'dd-mm-yyyy'), to_date('15-02-2004', 'dd-mm-yyyy'), 'bK7ppafH6uqt9kEBAHAc', 'lxNuzyE2Ssb1o9JllqWx', 'xJ8TQDzdxo65WsyWIVyN');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('mhIejee0sjOifvmIS58l', 13, to_date('11-08-2017', 'dd-mm-yyyy'), to_date('28-04-2014', 'dd-mm-yyyy'), 'h6XyVC4HzOIPe0qu9jTp', 'o47IsmvdBLtGTMidFVa0', 'FRsk2KahxDwF72uZKbuV');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('8ltrDvTOBmjfefOwP1DV', 13, to_date('04-04-2020', 'dd-mm-yyyy'), to_date('14-05-2013', 'dd-mm-yyyy'), 'trx1s473UfBszhjuPPN2', 'KF7CA8u8AlXNS02eCFK2', '0XSGbRmuWOlbyW4aDNU3');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('4IlTS3b7UjCbI6UU9u1k', 29, to_date('05-01-2008', 'dd-mm-yyyy'), to_date('06-04-2011', 'dd-mm-yyyy'), 'uQTAomjMza9GTmT7rugt', '38pqaizZggN2Ag5mFZLo', 'WmVDze5NaFzmaPKFFMMD');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('lLqswsijswLlWlkN0TWj', 62, to_date('02-08-2000', 'dd-mm-yyyy'), to_date('24-01-2020', 'dd-mm-yyyy'), '4DMqoJKzrF03VGd8umQv', '2S4NaZi5iRR2KlXNITZH', 'DWhR9dBFvPiPvZujJUvs');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('9O2XJB772l4sLK1rJpkG', 50, to_date('16-04-2013', 'dd-mm-yyyy'), to_date('18-05-2008', 'dd-mm-yyyy'), 'akFCeT7fkdZMBlRHC1u5', '153Yg8SzzqCcZMXjp9wi', 'Y9rzE1nCaIhABYjxeKX4');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('AlUoCmmAN3Zy2zZtHMPi', 9, to_date('07-04-2019', 'dd-mm-yyyy'), to_date('05-04-2018', 'dd-mm-yyyy'), 'lY54GSgh3Cydcmy7aynS', 'Keiu2WmkL5sZvdJLNQ42', 'W4O5A2xMwXbK3ZR9QGzW');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('w8KOgPKKmX9gUK9nOOMw', 25, to_date('21-05-2011', 'dd-mm-yyyy'), to_date('21-02-2020', 'dd-mm-yyyy'), 'CyuujLpMBvobvhqSZ3pL', 'CzXQcz3apPWHN6nnAh2U', '3w8OO2oxszQCDBcKPOMJ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('q0C8h3LahP89UHRX9RSN', 2, to_date('01-10-2000', 'dd-mm-yyyy'), to_date('06-07-2014', 'dd-mm-yyyy'), 'LMudU8RjlDrHgM4huonW', 'fM6S6LDaI4wj0yUjHcD3', 'TyMJESa86cLORC9yQtl7');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('OsCTS6tUwipqvzW3resw', 22, to_date('11-06-2001', 'dd-mm-yyyy'), to_date('22-11-2003', 'dd-mm-yyyy'), 'VEJ6FDzL4DOFDD0Edo86', '7CmiLEcpUbv5oGAau4Il', 'DWhR9dBFvPiPvZujJUvs');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('PcaZElcL5BgpkMeBjAeO', 41, to_date('06-06-2015', 'dd-mm-yyyy'), to_date('16-10-2003', 'dd-mm-yyyy'), '6ryuqQVqYOav9cO0Exe3', 'uUEqwKCJuD81aFd1KEv3', 'IcyJuESXmJ86B9RRDn5y');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('ltykhDFHvf8axJHRGyBK', 33, to_date('04-08-2001', 'dd-mm-yyyy'), to_date('19-07-2007', 'dd-mm-yyyy'), 'CntsmbXNrryKcqlmtUmv', 'Ff3ZefcG5ReLFIv6Hbps', 'mLJK0d3Q3KYaRDaH3owt');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('fQSI3Y2UnSLozbSULUMp', 45, to_date('07-07-2012', 'dd-mm-yyyy'), to_date('28-12-2018', 'dd-mm-yyyy'), '3RS6QEaKyf3SVcsRBpOO', '7TAnnzQvpzBzHnK2eytW', '1TrOPzipcMEQ2Sw82b8s');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('dNrB1qho5ikGmFWO0elm', 52, to_date('23-06-2007', 'dd-mm-yyyy'), to_date('08-03-2003', 'dd-mm-yyyy'), 'Dz1Cy7gGDDQiDD3gqyP1', 'vdt1x2tRxBiIMJCyWTqB', 'IHbHubof5sWEXPAKuS4w');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('kjifHWElF6iq8FsdBvsk', 7, to_date('17-07-2022', 'dd-mm-yyyy'), to_date('07-08-2013', 'dd-mm-yyyy'), 'NKrF5c30vYbU3laecrHb', '5pD1xi8D6MbP7JtP2M2o', 'wUXxNUwmVauHKeejxD6z');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('KLiWB8EoLSwcn4cO1Vje', 86, to_date('27-03-2001', 'dd-mm-yyyy'), to_date('17-01-2014', 'dd-mm-yyyy'), 'IkQ6b17nZhhKuFePHwFB', 'o47IsmvdBLtGTMidFVa0', 'Vqusi6LO9EtZMEfzhppG');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('KuFti4wqxyNOkG5ewtgg', 41, to_date('26-10-2015', 'dd-mm-yyyy'), to_date('06-03-2013', 'dd-mm-yyyy'), 'DdpHmKxtdEqB2IPUIPUm', 'RoSegROfYqNnL7zS03ms', 'kPmPkyu056kgVpE02p3c');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('A4T9FH0XKkLbap09c2sm', 43, to_date('17-06-2013', 'dd-mm-yyyy'), to_date('07-01-2016', 'dd-mm-yyyy'), 'Flp4tQPIhV6WzEWx2xgB', 'RMElPEg3e6FBM42XSoIj', 'IHbHubof5sWEXPAKuS4w');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('Wi9PeTI3WyhXV0phCbqo', 88, to_date('07-08-2023', 'dd-mm-yyyy'), to_date('08-09-2009', 'dd-mm-yyyy'), 'L6y5BaYizKaXI619jAgu', 'a0vXJgZpTKbdgMXFiBGf', 'leH5pdq5BIugKcfbh7bD');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('HF0sobTW1Ne7dJ3qBJqy', 61, to_date('10-03-2019', 'dd-mm-yyyy'), to_date('13-11-2000', 'dd-mm-yyyy'), 'O6gPpzTsihdSXl7Dnv2T', '7TAnnzQvpzBzHnK2eytW', '8pgoiad5ZnmxDx0kVkQm');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('nUgitWR5jGKsSwgjffKA', 81, to_date('27-07-2014', 'dd-mm-yyyy'), to_date('15-06-2013', 'dd-mm-yyyy'), 'mjAQy5vg4CFgOlil9KdY', '8X1RNlK7Nkip5xEPcdpu', 'hWIJ0cX0zz09YjFaady5');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('3GAIJNCWEne75QmYYorl', 36, to_date('28-06-2014', 'dd-mm-yyyy'), to_date('15-06-2009', 'dd-mm-yyyy'), 'B2Rw4igptXM979W4CMWf', 'a0vXJgZpTKbdgMXFiBGf', '5Z4QIPcIex7GFOD5N3XL');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('a9trhU81Frdtj24FQnFr', 18, to_date('16-08-2006', 'dd-mm-yyyy'), to_date('04-07-2006', 'dd-mm-yyyy'), 'sI2jq8h3CKVxC5YZ9hxE', 'tih12Oa5RFRTjImMrzZW', 'WZsN5y7bpY4x2Mw9QFYX');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('pGGUOT0HdgAhcp6kl4ON', 98, to_date('26-10-2004', 'dd-mm-yyyy'), to_date('12-03-2006', 'dd-mm-yyyy'), 'zLEZMFbrAvmc4HQybTsm', 'tih12Oa5RFRTjImMrzZW', 'IHbHubof5sWEXPAKuS4w');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('vQVuwXPVHje7HJtuByNn', 9, to_date('23-12-2020', 'dd-mm-yyyy'), to_date('28-07-2003', 'dd-mm-yyyy'), 'TL4zSz0HUgD3zByf68NP', 'VzuKgK4zbfe0REtDOS6f', 'jpFkSGjvi0HQoK67IDvK');
commit;
prompt 200 records committed...
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('i7ANnv1gDlqkbN3I13rp', 54, to_date('05-06-2009', 'dd-mm-yyyy'), to_date('25-07-2009', 'dd-mm-yyyy'), '2dTbclG4lk4a6gCb4Tsa', 'aMEzMnmvig1YxAoxVRo3', 'kUu08xKfQCnaICUZnjIa');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('DDyIpbp8r3GLiIe8YKVF', 57, to_date('27-05-2001', 'dd-mm-yyyy'), to_date('25-01-2006', 'dd-mm-yyyy'), 'iQDpVPYAvUuHiOF6pS9m', 'X3YnVa9z96ujU95jnSzi', 'x7ITQsTCbRPfZ7m93Dqa');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('9gAO1HesbdLBCVnlh424', 94, to_date('28-01-2023', 'dd-mm-yyyy'), to_date('22-12-2005', 'dd-mm-yyyy'), '9vG5b1vHWqXOc2yIuNu9', '2S4NaZi5iRR2KlXNITZH', 'mkfnBniTP59ImHofxAVg');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('luQJ9CN5mxMYd6LILmTw', 95, to_date('22-04-2010', 'dd-mm-yyyy'), to_date('13-03-2008', 'dd-mm-yyyy'), '7vzlzvh54PT0xGPpQBHf', 'a0vXJgZpTKbdgMXFiBGf', '3e7bkbacsZl7mHkrb7tZ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('tLEdlNd8o1xDS4vfcgFf', 92, to_date('25-03-2009', 'dd-mm-yyyy'), to_date('23-06-2002', 'dd-mm-yyyy'), 'RZoQMkoiYslxA28vkKoJ', 'XDSb0P6pTL98ic3BjOX7', '5H7kjEe14oiTvPtzutVI');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('U8Fzuzn16ck9NbntIPGF', 25, to_date('18-08-2018', 'dd-mm-yyyy'), to_date('08-02-2007', 'dd-mm-yyyy'), 'CX9BfxYiIiM4D5kAPql6', 'cz04g0ksh1QKO0j4THGD', 'FRsk2KahxDwF72uZKbuV');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('1wNpIAG8xVDBjKu8wwsH', 65, to_date('09-07-2022', 'dd-mm-yyyy'), to_date('17-09-2021', 'dd-mm-yyyy'), 'buUJlCZRhTQ8b0vNaCru', 'z3jdKsy6FpE9VrunWgxD', 'wUXxNUwmVauHKeejxD6z');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('W0KA649mUTRHB0hlPLly', 0, to_date('14-05-2007', 'dd-mm-yyyy'), to_date('08-10-2020', 'dd-mm-yyyy'), '10bZGoBxjiWkyt2V4vPR', '7CmiLEcpUbv5oGAau4Il', '42vkZv4G2J5J4UOW4YhG');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('CqTpXBatIyT0tgwU7jib', 23, to_date('24-06-2021', 'dd-mm-yyyy'), to_date('18-12-2018', 'dd-mm-yyyy'), 'xt3cxnduqhE7hu2B7bfa', '2S4NaZi5iRR2KlXNITZH', 'JWeRudVwQiRgQiXFDHkd');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('2VGQ7dxiyxaFDPU8GaL8', 4, to_date('02-05-2022', 'dd-mm-yyyy'), to_date('21-08-2011', 'dd-mm-yyyy'), '0ozqaDK8pEqgo8S4jH1q', '5IfiKrIIReyeGBSGmNUD', 'exbyzZxodzRjyDMNDf6k');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('fZphAzlu1NrV4dWuFkpZ', 52, to_date('28-07-2017', 'dd-mm-yyyy'), to_date('17-08-2009', 'dd-mm-yyyy'), 'jfa7P4k6sfK4f17LKJWY', '5pD1xi8D6MbP7JtP2M2o', '1CxXqwVYv0sv91eXrJq4');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('XTxcFT1mqxf7Zl579rmD', 58, to_date('07-09-2020', 'dd-mm-yyyy'), to_date('19-07-2019', 'dd-mm-yyyy'), 'GSOeZaNGsFGqxJSOBskQ', '0KTeIjciha4uwGYzzBKd', 'F6mJCHWl3Jyi3OyS5J82');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('s7HtjdpSEhXDTXkO24oo', 82, to_date('16-04-2002', 'dd-mm-yyyy'), to_date('01-07-2012', 'dd-mm-yyyy'), 'OX0OGtHo4tA0FmYrkOcy', 'Keiu2WmkL5sZvdJLNQ42', '521RNe8PeChGJzOA5hZi');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('4ywKnU59qUlOGr4cHSIA', 68, to_date('14-11-2013', 'dd-mm-yyyy'), to_date('17-06-2002', 'dd-mm-yyyy'), 'z5uYVZxO0NCAMpHqhWNI', 'quXJw1BZrJhqksNwHrFq', 'Pef3Cl7LpKvMjo24RDbM');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('JDDTxydBpYmx5X8ZTDEr', 63, to_date('12-09-2023', 'dd-mm-yyyy'), to_date('10-02-2008', 'dd-mm-yyyy'), 'XtHoW8EPsYBnbn9W8L4f', 'aTcXld4l2IGujbXPo5LL', 'Dyo5QA8k93b5TQA5m7s8');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('CF9yf7OR71SfNRWFXpNA', 89, to_date('04-03-2012', 'dd-mm-yyyy'), to_date('25-09-2009', 'dd-mm-yyyy'), 'smMfluSeqRu3LSNjHR7o', 'o47IsmvdBLtGTMidFVa0', '5rkxpiaf3TD03k5YCte6');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('jl1RuKJXH9dIzvJgV59p', 84, to_date('02-07-2013', 'dd-mm-yyyy'), to_date('03-09-2000', 'dd-mm-yyyy'), 'PL8Ta5kAsSc6jmHUGjzU', '0uDORrwyiEG0KXa6v9EO', 'mkfnBniTP59ImHofxAVg');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('45kHqkJDxTcTK51cMUmT', 63, to_date('08-11-2003', 'dd-mm-yyyy'), to_date('24-08-2022', 'dd-mm-yyyy'), 'FXob7BCiItE4muO1yO29', 'Keiu2WmkL5sZvdJLNQ42', 'Dyo5QA8k93b5TQA5m7s8');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('DddL60CGtdbN0jxHND5Y', 22, to_date('14-09-2003', 'dd-mm-yyyy'), to_date('22-06-2003', 'dd-mm-yyyy'), 'y0xNONyY734qFDvQVmuA', '38pqaizZggN2Ag5mFZLo', 'OqUXtmnajIsilOQl5wW2');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('ildRSwmqdAMFkTNqnLxt', 17, to_date('16-11-2010', 'dd-mm-yyyy'), to_date('14-06-2007', 'dd-mm-yyyy'), 'ynNdaoN49wM2dlOzB4zj', '153Yg8SzzqCcZMXjp9wi', 'WSChBYHrQKRfgOHSkoDH');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('VNksEZNGmZypSg0TxTWF', 41, to_date('01-09-2005', 'dd-mm-yyyy'), to_date('12-12-2021', 'dd-mm-yyyy'), 'ibXqyZXiivNTlCAlBvIn', 'Re0tE5DrSbadw5633QVb', 'JoLLLtRHmYlELBHyqEDD');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('4zC7TnW4lOEEfjySkY32', 95, to_date('10-07-2023', 'dd-mm-yyyy'), to_date('15-09-2014', 'dd-mm-yyyy'), 'ZrwJGD6u1IvAkylWTxh8', 'RMElPEg3e6FBM42XSoIj', 'iCWnWrtoCWJeN5pPHiuC');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('244TGAuZ1Tpdp9IwPCQc', 49, to_date('11-12-2000', 'dd-mm-yyyy'), to_date('09-04-2000', 'dd-mm-yyyy'), '5F7BC3G97h7GpKdMG6Mr', 'cX1JucLxMdIJoUthn7E7', 'SLh1YFP7x1uPe5HKBvIh');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('D8lYdUxv0iBDTCE5OhAY', 78, to_date('22-11-2019', 'dd-mm-yyyy'), to_date('18-03-2022', 'dd-mm-yyyy'), 'makLwIcvmY28HhvEHKqR', 'pCDE7rCKzqfeDJCDNjjR', 'hYiVRDvdHCQyKF22oipJ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('lXjZAjljOeAz9FifYDoB', 51, to_date('21-11-2008', 'dd-mm-yyyy'), to_date('07-07-2006', 'dd-mm-yyyy'), 'rnHpm82VB0fhzDeyfIAq', 'Q1z7DAQOMEIC5VXDwsP6', 'Co5IEwGFd0cVnLZORhuF');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('Zq7SL8Yg0SCkwsMHKUXj', 72, to_date('02-06-2001', 'dd-mm-yyyy'), to_date('23-09-2015', 'dd-mm-yyyy'), 'JqKU0sqwWcAIdgZWIA12', 'Dg4nccIVtpr34gnh8dUJ', 'wRu5VawiIQYOfX2Yackj');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('aytPd8NM13k5hcNRBnVZ', 48, to_date('06-11-2016', 'dd-mm-yyyy'), to_date('06-05-2015', 'dd-mm-yyyy'), 'P7NNR2NzqvRjfj9BR7kx', '38pqaizZggN2Ag5mFZLo', 'Vqusi6LO9EtZMEfzhppG');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('ode9xsLhrOEbFpYSdwp5', 7, to_date('25-11-2022', 'dd-mm-yyyy'), to_date('16-04-2020', 'dd-mm-yyyy'), 'mLvDI87z73I6eISLzjVa', 'Qpo2PcIecvGZXZjOmICP', 'wRu5VawiIQYOfX2Yackj');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('BmQkTasBzZz9fvuw2oYQ', 14, to_date('25-09-2005', 'dd-mm-yyyy'), to_date('06-08-2019', 'dd-mm-yyyy'), 'hw91tXntjacE4i2cgIJw', 'IgEzW2nTs8uUsYpC2tDe', 'Vqusi6LO9EtZMEfzhppG');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('1tow4DMfOpLJIzko4yij', 48, to_date('11-02-2018', 'dd-mm-yyyy'), to_date('26-07-2000', 'dd-mm-yyyy'), '77PEVAgEXsj2ZzhU2NzB', 'JAKkQBZ2IsCyHdcJf7NO', 'FRsk2KahxDwF72uZKbuV');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('j6Jhqw28VmcQbdYtWUaT', 23, to_date('01-09-2001', 'dd-mm-yyyy'), to_date('04-12-2018', 'dd-mm-yyyy'), 'jFBcxn5QVSRimPCWEepa', 'oOIHsL3QGusZ76Y8G5ih', '485RhaTO5C7fr0sNfrqO');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('91eQyL8twfZnj1gS7Kgc', 67, to_date('12-08-2000', 'dd-mm-yyyy'), to_date('08-10-2004', 'dd-mm-yyyy'), 'W4U0jXV31Md9aLPRWKbQ', 'KF7CA8u8AlXNS02eCFK2', 'IcyJuESXmJ86B9RRDn5y');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('3oZeChX7Opyc7ShjNGho', 54, to_date('20-10-2018', 'dd-mm-yyyy'), to_date('11-04-2001', 'dd-mm-yyyy'), 'zRZCJIvQ0npN2mYfkFZR', 'rDMIEQwzvOGLgAwmI8E9', 'evQGLt2DhTgkcBXTQRSP');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('jndITSuI76k2DAiUv6zj', 77, to_date('06-01-2022', 'dd-mm-yyyy'), to_date('22-09-2022', 'dd-mm-yyyy'), '9FTFEoqCo7SHz3MAsWN3', 'AnNHmvjpdvKDw3gp8qWS', 'rTHAJp1fZiRjKHKPJELs');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('LSWygC69KQWUMbREHtdq', 62, to_date('13-09-2017', 'dd-mm-yyyy'), to_date('13-06-2010', 'dd-mm-yyyy'), 'qxeH8FohijxfpAc0SmlU', 'VzuKgK4zbfe0REtDOS6f', 'NDSuaFqzLps0WJWSIi4R');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('bDtY3VnjDze6yk6DQ9nC', 13, to_date('06-12-2013', 'dd-mm-yyyy'), to_date('23-02-2019', 'dd-mm-yyyy'), 'RgGycCTBwI5ah1TYZOIw', 'AnNHmvjpdvKDw3gp8qWS', 'GtL6OqDynO0gixvRgsFv');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('GdrfJ50rkwA2nj09mFOG', 16, to_date('25-11-2006', 'dd-mm-yyyy'), to_date('23-12-2004', 'dd-mm-yyyy'), 'ts1d9PuTkFJq9bwrmuBD', 'd2zLzLXK6C5OdO2l6j9k', 'kgIj278yESQP0NyZdpmd');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('EWmc55oDp3Ob6WcrJyJq', 77, to_date('09-04-2021', 'dd-mm-yyyy'), to_date('07-02-2008', 'dd-mm-yyyy'), '20KICUTwX7o1QdTvmIub', 'lqNjf7s4RYSfyBK4ruyZ', '42vkZv4G2J5J4UOW4YhG');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('Id3RRU1a4YtICQpSW720', 61, to_date('26-08-2004', 'dd-mm-yyyy'), to_date('09-01-2000', 'dd-mm-yyyy'), '8o6cE090pzLP4mHMW5ET', 'Ff3ZefcG5ReLFIv6Hbps', '4PQ6tXWasQrBUtyTxnoR');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('vN9dxGWeOx2eYmRig4Fz', 77, to_date('05-01-2004', 'dd-mm-yyyy'), to_date('25-12-2000', 'dd-mm-yyyy'), 'VDGYKF1oW12MIr5J60Sg', '0gOpDLpCtwhLrIufV3nj', '6gY6vHxKOyUtZKciLFWe');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('Ie97BcsbdZqrnoyGb8n4', 39, to_date('25-11-2018', 'dd-mm-yyyy'), to_date('08-05-2012', 'dd-mm-yyyy'), 'TCvz2Qu0x5MQSFnlj501', 'fx15COfZeXmH1zss0APe', '1CxXqwVYv0sv91eXrJq4');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('hwsMqLWh7nyWiCDRlysb', 19, to_date('19-01-2003', 'dd-mm-yyyy'), to_date('06-12-2019', 'dd-mm-yyyy'), 'fobnkSjcm77KZjcbtJB4', '6DUIbotKmoEDy6NAg6mq', 'wRu5VawiIQYOfX2Yackj');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('iMrdChOLMoPWxSdDJbNt', 60, to_date('27-08-2019', 'dd-mm-yyyy'), to_date('02-10-2009', 'dd-mm-yyyy'), 'aSgPgKTTiYSvt4fm4N57', '38pqaizZggN2Ag5mFZLo', 'sJBc8xcABLl0ZRPMgNtH');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('3yqRlhiluPY5uoC8gToY', 44, to_date('20-10-2019', 'dd-mm-yyyy'), to_date('23-08-2019', 'dd-mm-yyyy'), 'Eeq4RmqkqZ3V6JkLlNSD', 'Re0tE5DrSbadw5633QVb', 'kUu08xKfQCnaICUZnjIa');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('L7VMy3Nx6hWREGu3h5kV', 92, to_date('09-05-2020', 'dd-mm-yyyy'), to_date('11-07-2023', 'dd-mm-yyyy'), 'QoPzg5LCzCGT78LjvoiP', 'o47IsmvdBLtGTMidFVa0', 'xTTikFplwfjg49RhfKnX');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('P38hLt8SkKG2Ou55QYW2', 80, to_date('04-03-2020', 'dd-mm-yyyy'), to_date('04-11-2008', 'dd-mm-yyyy'), 'PDF66yfip9pMFLQHZfHN', 'B07SLDMOA68pfpTZfyLN', 'JWeRudVwQiRgQiXFDHkd');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('Y8dHWhUq1TyvUYrd9Igt', 97, to_date('06-05-2008', 'dd-mm-yyyy'), to_date('15-01-2014', 'dd-mm-yyyy'), 'YceByGFI0xv4d4NhuatY', 'RMElPEg3e6FBM42XSoIj', 'wRu5VawiIQYOfX2Yackj');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('Dy7ejtzBKyqF1sRK43LW', 60, to_date('09-10-2003', 'dd-mm-yyyy'), to_date('03-12-2010', 'dd-mm-yyyy'), 'lYAPBX5tWjsM3W7Cpezm', 'KOuAimoraRbCuiyb8RkV', 'TyMJESa86cLORC9yQtl7');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('6DXissAqux6P9SA6ZX3j', 40, to_date('04-05-2012', 'dd-mm-yyyy'), to_date('14-02-2005', 'dd-mm-yyyy'), 'AB7TSQx8h5bBMHbWrPTN', '6M1XYfgE6mZ1RsdXpDwf', '8pgoiad5ZnmxDx0kVkQm');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('rXxAOn6ncBEagil8FGBn', 64, to_date('14-11-2004', 'dd-mm-yyyy'), to_date('07-12-2012', 'dd-mm-yyyy'), 'n2FEYVb8JkMGqTt4kNfi', 'fx15COfZeXmH1zss0APe', 'Dhsp8zO26RelssnbvxWB');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('jxJ30q0oJFcLGKh3iXHg', 81, to_date('20-06-2023', 'dd-mm-yyyy'), to_date('27-01-2019', 'dd-mm-yyyy'), 'iMsmQfH1MiLTnd6dkUi5', 'RUwEsLD7qbwtwAZljOei', 'TyMJESa86cLORC9yQtl7');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('vMu5Cmzrj1tt0zizug3X', 80, to_date('16-05-2004', 'dd-mm-yyyy'), to_date('09-05-2008', 'dd-mm-yyyy'), '55JWX5NGtIQHz1XjRC8q', 'ftmH02kUUMPWAY1DMKie', 'F6mJCHWl3Jyi3OyS5J82');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('32qngZHyTTlMgVnLTEXK', 34, to_date('02-08-2018', 'dd-mm-yyyy'), to_date('19-01-2017', 'dd-mm-yyyy'), 'ju1Gpmrdqk8UT8gLmfVB', '7CmiLEcpUbv5oGAau4Il', 'syTjLx8LQyBjbabvnCRT');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('QJd4qRkKjojeoHEaCw0U', 9, to_date('28-05-2022', 'dd-mm-yyyy'), to_date('27-06-2008', 'dd-mm-yyyy'), '02LMA6Xo0ZfiClsYOAlG', 'o47IsmvdBLtGTMidFVa0', 'UUtQR97yvuExy2K1RrVW');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('P1rwlDgQJfZU9KwB9ifO', 55, to_date('16-07-2015', 'dd-mm-yyyy'), to_date('12-04-2013', 'dd-mm-yyyy'), 'uJjaTjqSKg1bBDt1BOkh', '153Yg8SzzqCcZMXjp9wi', '6gY6vHxKOyUtZKciLFWe');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('0kjmLFCHtBIr1rSBIbuG', 79, to_date('17-08-2020', 'dd-mm-yyyy'), to_date('18-06-2023', 'dd-mm-yyyy'), '8zSKVZiv3cFoMSNT7XHe', 'M5xjgiD5zeSAmM18ChyY', 'rTHAJp1fZiRjKHKPJELs');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('rGXsrBuCvrmS8OWZdEmJ', 1, to_date('22-10-2000', 'dd-mm-yyyy'), to_date('17-06-2014', 'dd-mm-yyyy'), 'BlvbrunrbPyBderZ5bNr', 'JkK8CvGABEKt4OKWdb13', '98PXa16Ymwn6oufBffjg');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('HBHmESQcXSqAL1MlJs9f', 16, to_date('22-04-2004', 'dd-mm-yyyy'), to_date('23-07-2003', 'dd-mm-yyyy'), 'iLpsYYNQO3fUYfAVIZVg', 'oOIHsL3QGusZ76Y8G5ih', 'TyMJESa86cLORC9yQtl7');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('afqYKtCVjSm6qpmTmZ1t', 58, to_date('15-10-2001', 'dd-mm-yyyy'), to_date('26-12-2018', 'dd-mm-yyyy'), 'Okvw4om8k9eWXgdVzKXZ', 'KF7CA8u8AlXNS02eCFK2', 'xTTikFplwfjg49RhfKnX');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('AcZIou3w3mITSBtjfDuD', 42, to_date('24-04-2004', 'dd-mm-yyyy'), to_date('19-10-2008', 'dd-mm-yyyy'), 'MzZJxb28tKtqbu3OYsTN', 'AnNHmvjpdvKDw3gp8qWS', 'KZq4aYWqfudWgcfTXQ4B');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('AqDGM3coHQYSazgq8AZo', 70, to_date('16-06-2012', 'dd-mm-yyyy'), to_date('04-05-2016', 'dd-mm-yyyy'), 'aiKMSYXrc3IBK4TcwipY', 'juTWZa7oAKlTSyr5uTwX', '5rkxpiaf3TD03k5YCte6');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('Uc3QThGFgRlct2Gs3VUu', 72, to_date('02-06-2006', 'dd-mm-yyyy'), to_date('19-10-2012', 'dd-mm-yyyy'), 'CB7xr0u7kCDonmKo1aIb', 'MsJn0CaoSD0TGaqwuDsP', '98PXa16Ymwn6oufBffjg');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('1HFCAGHvyvzKFmQHsnKv', 49, to_date('11-04-2016', 'dd-mm-yyyy'), to_date('28-11-2012', 'dd-mm-yyyy'), 'OvkcFOCdw8Ief5IGseHV', 'VzuKgK4zbfe0REtDOS6f', 'Y9rzE1nCaIhABYjxeKX4');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('9XbkNFgeXEeZwMKBBIjC', 62, to_date('27-09-2012', 'dd-mm-yyyy'), to_date('02-10-2016', 'dd-mm-yyyy'), 'rRf3S30XK2zEcuIZAw52', 'quXJw1BZrJhqksNwHrFq', 'iCWnWrtoCWJeN5pPHiuC');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('jpeq4VjEsBFpyOr4Vwhs', 61, to_date('02-04-2009', 'dd-mm-yyyy'), to_date('19-03-2005', 'dd-mm-yyyy'), 'XYFdYXthXnG2l4C0Sv9y', 'TO24cGOCB9AssdofUS23', 'MFXQybdPzIeUhJU493g4');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('NA2kvb2djg34qoB8xre5', 44, to_date('21-07-2006', 'dd-mm-yyyy'), to_date('18-11-2005', 'dd-mm-yyyy'), 'zZ6HRMRco96YuNelEuss', 'oaMOlFEIsHBlsOHTlqVO', 'sJBc8xcABLl0ZRPMgNtH');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('wKBxmM7ubB2ah1TmyHRm', 49, to_date('08-01-2002', 'dd-mm-yyyy'), to_date('21-08-2006', 'dd-mm-yyyy'), 'DouaAbiGty1VAwxTjjTK', 'Q1z7DAQOMEIC5VXDwsP6', 'wUXxNUwmVauHKeejxD6z');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('9Kui0vDJf86fqgsqTwGK', 58, to_date('04-03-2016', 'dd-mm-yyyy'), to_date('28-03-2021', 'dd-mm-yyyy'), 'FZIIVPaNHkOg04y5UVWe', 'nBg81lkzAEkPmOUxRwjX', '6gY6vHxKOyUtZKciLFWe');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('qUtOUQmK6oPWw7clFYbD', 72, to_date('08-02-2022', 'dd-mm-yyyy'), to_date('15-03-2020', 'dd-mm-yyyy'), 'SyUdpV0pGLKkAIXuIxHH', 'juTWZa7oAKlTSyr5uTwX', '0XSGbRmuWOlbyW4aDNU3');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('2dj8xwANXw4dGopPTKfT', 52, to_date('01-12-2011', 'dd-mm-yyyy'), to_date('11-07-2020', 'dd-mm-yyyy'), 'n7cXrXuPIL8eoE9wmmlV', 'Keiu2WmkL5sZvdJLNQ42', 'bqkVyJiFIf3n1v1PkVZY');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('homsISJPHT5J6uFOR748', 43, to_date('16-02-2013', 'dd-mm-yyyy'), to_date('16-07-2010', 'dd-mm-yyyy'), 'egaC1oiKmLGMjS9f0VGJ', 'J1wap6l2GbJIiVk4FOuW', '3jNdlUmTrzQGHMXldyFU');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('1hLfcKQ7FBUTrMZ7fxSk', 95, to_date('16-09-2011', 'dd-mm-yyyy'), to_date('27-01-2016', 'dd-mm-yyyy'), 'yLxG9UYMy1VTwF1jRZl1', 'hG0hKKC3FriiMTJ2uYtS', 'AAM5wwa5KrPbu68pfIMM');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('ezK7afzn5GRywfqFjUx7', 53, to_date('15-07-2015', 'dd-mm-yyyy'), to_date('15-12-2013', 'dd-mm-yyyy'), '1CDxc8thdjI8cbUgPzix', 's7ybUQ6bHZZr4ndIngEQ', 'aLw8pY6XRw3n4A0ZZlqE');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('SfxES1JvaAUs7JyKWqNk', 6, to_date('21-07-2012', 'dd-mm-yyyy'), to_date('12-01-2019', 'dd-mm-yyyy'), 'ITSVbIWzYHnXo48pUrvd', 'KF7CA8u8AlXNS02eCFK2', '1TrOPzipcMEQ2Sw82b8s');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('X4z9Ws0YF1X9tDz2gG8V', 39, to_date('28-02-2006', 'dd-mm-yyyy'), to_date('23-05-2002', 'dd-mm-yyyy'), 'EfAQXOVGD2GpulrmWO2g', 'o47IsmvdBLtGTMidFVa0', 'TKUbRHOt7VR73IDag9Q8');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('hVR884lBw913xBF158bEv780yWD010mRi415fBV343xSE698uV', 332, to_date('01-08-2510 21:34:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-11-2153 07:56:38', 'dd-mm-yyyy hh24:mi:ss'), 'vKG447eVc563wXm486kGb752hVa341dMO150aCq320jKz863rL', 'jmzRPEjeauDDSp0vnBYa', 'QTCkuP0Ixsfm5j1cOkjP');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('zHz376rDE474oWC488vEc591mZJ851iBV522vZJ068hYp550zS', 260, to_date('10-10-3015 11:55:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-10-2300 10:43:23', 'dd-mm-yyyy hh24:mi:ss'), 'yBr369pGP656dJf258yCm393jBF059nTi383oSV168cZG898fA', 'w8TL1GdNWOVf0IrTL3WA', 'enoL3FtJZlkvgh0LfQKa');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('wGz627eFM729kXN967gDC089fWk766zAM539hEr670jXT273gG', 31, to_date('23-02-2634 11:42:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-05-2621 21:24:54', 'dd-mm-yyyy hh24:mi:ss'), 'wGQ366wAp134dUs395cRC146bXs055sYT376dPm659tXS331mK', 'qPLMlLhpuSTGG8k4w6CW', 'eBL166uOY745oLB049kNn741eEJ579gMO799qKE295mZO612iT');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('jCC091aAn227lVu784jAV019eIb237yNQ830fLh651kAB065cR', 267, to_date('02-12-2881 07:36:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-09-2789 13:52:53', 'dd-mm-yyyy hh24:mi:ss'), 'qLg478fNJ841cWS931zSC636tLM926fIe219mLP312hKa650sF', 'PvhlCcLdgBicPFqH6eDV', 'kPmPkyu056kgVpE02p3c');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('zOh475aGv741oVr965mQy653iIK190zFS165nQB554rNh137xQ', 304, to_date('10-10-2943 11:23:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-08-3057 09:22:53', 'dd-mm-yyyy hh24:mi:ss'), 'oYS736mAa257eWg545xUq593iMV868zVC070gZi187wQh212aK', 'cHD838dJy026iOg394dTc316bYY556hXQ096aIb067eNV452lS', 'ICuJ0mVCEm7c0WAjIhXp');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('rRX569aJX166sTo150hTW547yBa723oPf289iRN236iYn885sT', 30, to_date('14-07-2887 21:36:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-03-2147 20:35:48', 'dd-mm-yyyy hh24:mi:ss'), 'iZe293lFV290gCy110zFB848bQf714wEP420eVa011vZV334hW', 'WP91tHXZOg3ZeIYlMXLo', 'bNv128gAB874cEk363eCb879fBA954uAM469uBz820eKa776iR');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('vPU174fJN428pIO213uSP415fZJ154nYg979rIc278kYE714nQ', 85, to_date('12-02-2798 22:01:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-07-2454 09:13:06', 'dd-mm-yyyy hh24:mi:ss'), 'zBQ164xYl629wPi264tAI712wGW971qXI191jNy062pAD337aK', 'lBC039hFR839iCT332gLb972eAm426eSm136uBs027cGu913uR', 'rU4VY9sOnuTUDdsDdIeC');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('dZM362bFf281eLN652tZr747sWD641nFK796vVw732eNv656zK', 19, to_date('08-06-2364 22:18:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-10-1914 21:26:29', 'dd-mm-yyyy hh24:mi:ss'), 'bVW640rRS118rNw051rQm215aDV137gCl057yFK215uUn738dD', 'L0rtOBx3dPfxaXFPlCqr', 'GhE5nvOtdYkgNbPQKkra');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('pWn656sMO895sMg993bYv317rXP040qZQ025vRC820jAf560xF', 240, to_date('08-07-2081 09:27:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-03-2975 09:06:20', 'dd-mm-yyyy hh24:mi:ss'), 'dNR162aBh265iRF593kSn172dAG646kYD829zTn915nCk595qK', 'jmzRPEjeauDDSp0vnBYa', 'SJpExbTkS10XuTidcNKJ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('aGN650cBA620dSf712cAp372jLo032lKx351sNi943bGs276mN', 330, to_date('26-06-2598 18:08:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-01-2424 06:54:00', 'dd-mm-yyyy hh24:mi:ss'), 'hHG967zDv444dUQ594nKN647cKx725xJe745lSX796eKc044pJ', 'L2B3t8qr95OnOFWKsZr3', 'WmGXMgQGczr51f07MIVH');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('oWS520bGF138sIY324wVr466mER123vSL945kAe044sNi212hC', 315, to_date('27-11-1944 09:22:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-01-2747 05:46:53', 'dd-mm-yyyy hh24:mi:ss'), 'zJk348oSC188mMn091lKB965mFy368hVc853sEd994sIW931uV', 'QSxJWOWO3fEEG1y28qIX', 'fAG114qAC120gFb353tYx266gSk756iBO747aIq018oTb045rR');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('tJn963oKs922bVq421uGe132jEP455lSS442hTO872rCL779lH', 50, to_date('08-05-2402 16:54:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-07-2026 20:25:26', 'dd-mm-yyyy hh24:mi:ss'), 'mXn193qWd565yGn425kLy851oSb832iLf286wDm330lWH021pP', 'bDb280kCu199vCf813tUJ966oUB260sYU394uPA435oXL755qG', 'fAG114qAC120gFb353tYx266gSk756iBO747aIq018oTb045rR');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('cIb717oYn132lUg491yKY423mTp879xJt274vWl841kCD018mB', 66, to_date('10-08-2573 13:45:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2788 07:20:55', 'dd-mm-yyyy hh24:mi:ss'), 'tBt266pAI480uQB098uHC975fFb322vLU969eWJ357hGv443hP', 'IycmfkUJHH38ZietIpJN', 'yqMGBxSiCmkKlaS4bLSy');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('qRz389uCu583hJa085nTr621hYQ511qIQ791bPx617wOl955qZ', 181, to_date('23-07-2271 16:14:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-04-2658 18:26:47', 'dd-mm-yyyy hh24:mi:ss'), 'zXn060pTV937tNW539qJL194uVU780gMx940jRs699fFP255dB', 'ceA7JgXopKkLgAEj2Irq', '3e7bkbacsZl7mHkrb7tZ');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('rRO712wJk154uWR990vJG495fKr640qOt881cBi730eUR854mE', 234, to_date('09-06-2631 06:37:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-08-2562 09:11:13', 'dd-mm-yyyy hh24:mi:ss'), 'gCw253gZh078gOx760iEU132kGf736sWa144uZs066tIl857bD', 'aiV9KjwbE6FSpmLV91pR', 'oPz589uQv157mII580uYX682kYu618yHC991bSc838bHU423yS');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('iHW987pGL279qCF746nOk364jGz523uRA737mOw846oXY812oW', 121, to_date('02-05-2290 22:37:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-08-2692 19:38:12', 'dd-mm-yyyy hh24:mi:ss'), 'yIz697pEo882bZr571aFZ845hDw535fSv059mEw272mNX390yP', 'TO24cGOCB9AssdofUS23', 'rYscjdO6dbnhrzmxUgkd');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('dRg773uTj348hFP852lDv734lJJ058nEH196vUP944zTn298iD', 233, to_date('27-10-3054 09:54:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-11-2677 21:18:51', 'dd-mm-yyyy hh24:mi:ss'), 'sON662bKd345fDn589bZG627xMZ112dUE333bXz572qBn147rW', '29wJuzTCbAhXOMxj3GDE', 'W4O5A2xMwXbK3ZR9QGzW');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('zHL564hXd969qSd397zNW141kQV273tVK536iQM899fMJ997zT', 145, to_date('06-08-2390 21:08:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-09-2311 09:55:43', 'dd-mm-yyyy hh24:mi:ss'), 'hXl520pUg744iAc870tPQ395cEG322eOu713lOg211eEB992gY', 'QMZ62f6VFxAj9ae0V0mR', 'CrYzxCNfDiXDeqZsLYdP');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('tLb771dYS916cAa834cPG590xWs125oAk599vRH596eKw428fU', 212, to_date('09-11-2157 23:50:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-05-2889 07:48:34', 'dd-mm-yyyy hh24:mi:ss'), 'iMa813lQs124uXq014aAE766kPS598rZN527gIZ280dWW099xF', '29wJuzTCbAhXOMxj3GDE', 'aqvCTJUSMEIi1LsFewIn');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('hOc323zWV651yYz153mUv234gEg195yDB615sXj547lRh586oG', 118, to_date('30-12-2231 09:22:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-10-2885 22:09:33', 'dd-mm-yyyy hh24:mi:ss'), 'dOF838fDd775zVx681kMn213oID133gYs298dRd928bUx793uV', 'gWz498tLR013gNM165jDj257mOF857dCr646wHT166fNy161sE', 'aTsXkG5XuHWQgRHMXTtN');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('hUy290uTj816lWh788qVJ865cYz010cLJ031vUX781gOp612fF', 26, to_date('23-03-3006 03:58:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-01-3037 06:30:05', 'dd-mm-yyyy hh24:mi:ss'), 'dSb621sFF315nAi768gDk338vDn873gFi135uMb197dWB694iF', 'A5NRtouv7ZerCjg237Cq', 'gL0i5wtpZn3fEv1R3ZqB');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('tGi983uIh536kZk653zQA285zVn320kSU969mAB322fCP729fG', 297, to_date('01-04-1913 17:07:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-07-2737 02:56:24', 'dd-mm-yyyy hh24:mi:ss'), 'oLs390uFU354rYm122fBt265kZu961uEL273fXs460gKv088lK', 'cz04g0ksh1QKO0j4THGD', 'xDO718zYA897iWX825nVl282wVo345cEP861tAW772xAN392uI');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('wVI512mRb048jLb249bIw339gMX477jWK450iKc568dQi656aI', 322, to_date('29-12-2273 11:13:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-04-2770 21:12:14', 'dd-mm-yyyy hh24:mi:ss'), 'rSw481zPx627cUE692lOt141aDw745lBW558hZS919hFP921hR', 'ZKlBsAkl0FtVVy373A2B', 'Ts2Eg4s5Iout7xsCUZEP');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('bHC547vJC746tAO582lUS488oZn339nQF468vRn193yHu815vG', 324, to_date('10-01-2852 03:41:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-01-2292 23:42:34', 'dd-mm-yyyy hh24:mi:ss'), 'vZE671vVt070bCx169nXe748zCx082oPi144wIt235jIe370iM', 'TO24cGOCB9AssdofUS23', 'yqMGBxSiCmkKlaS4bLSy');
insert into REFRIGERATOR1 (refrigeratorid, modelr, purchasedate, lastmaintenancedate, locationr, testtubeid, donationid)
values ('sIz279iZl791fPE799fBA825kLx057bTZ233gKE917pIW790qF', 91, to_date('27-09-1993 15:58:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2942 16:35:36', 'dd-mm-yyyy hh24:mi:ss'), 'dDh649hFy752bTH961oOe124dDM312vCl359cSg393lWl477zX', 'uLy458nPf816aEP847aCY242yJl846gXg034fNh097fLK840oN', 'fnyLP364dkdYqKSTtxuK');
commit;
prompt 300 records loaded
prompt Loading STOVE1...
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('zIQ1Mnkkvgvf06IRx6VY', 798, 5, 68, to_date('06-05-2001', 'dd-mm-yyyy'), to_date('07-07-2004', 'dd-mm-yyyy'), 'Z3cUfdj6gmcQXOF8l45p', 'LtpzptmrhRADTmJbDtik');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('ep2McuyoQbwuSvnZKkrj', 438, 7, 49, to_date('23-10-2016', 'dd-mm-yyyy'), to_date('09-08-2020', 'dd-mm-yyyy'), 'dF7UlpOL7Fe1t0tfzJOY', 'JFvZucXhijD21FOFsPuq');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('3r7Rdy4wk57Noa4q1Zsh', 596, 8, 95, to_date('03-04-2006', 'dd-mm-yyyy'), to_date('11-09-2017', 'dd-mm-yyyy'), 'xpOgAAs4ejypkc5PCtCw', 'ePLDni1VAn3CzSANO6Q1');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('1o7oaCJ6BPQhAnJ3e0aj', 701, 7, 67, to_date('11-08-2009', 'dd-mm-yyyy'), to_date('10-04-2005', 'dd-mm-yyyy'), '3QjLTulNYq9o0yRyv6gg', 'Ah7h6eT8PniE6taIUxic');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('a2TfKssk2u5Jw21eIk8o', 709, 6, 60, to_date('11-07-2016', 'dd-mm-yyyy'), to_date('06-01-2009', 'dd-mm-yyyy'), 'U68rRk3nv694Li0TeXcw', 'GvSmbOOvmRDiMtxoFd4F');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('diaaPKIG2TghwlUJ834p', 669, 7, 35, to_date('27-01-2016', 'dd-mm-yyyy'), to_date('24-03-2007', 'dd-mm-yyyy'), '7qIcf5PRcVfQDAiTMr1c', 'uK0AdgGAIFE3ih8GdYFO');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('cm5WeWea8MGDq7IjnToQ', 363, 4, 25, to_date('17-11-2018', 'dd-mm-yyyy'), to_date('05-05-2014', 'dd-mm-yyyy'), 'ycJzH0mAgvDhPNw5WK4p', 'cBUqAvx8tQWDFEa46b09');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('aifL87KzTyBb1RJ39ZpY', 335, 3, 90, to_date('21-02-2013', 'dd-mm-yyyy'), to_date('13-04-2021', 'dd-mm-yyyy'), '0qdzS3ZnSgSSmaJ8Nnec', 'OUJNnfPZTydnFL7gNwbb');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Bb0hv5r6YnjUakRvx3Bl', 970, 9, 0, to_date('04-01-2021', 'dd-mm-yyyy'), to_date('24-06-2023', 'dd-mm-yyyy'), 'miccr190EJUkXA8rfcJQ', '7nuqmAJj29MDPNk31Tsr');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Jyvhh8XK7vQ4OnnLFDwa', 691, 7, 56, to_date('03-10-2016', 'dd-mm-yyyy'), to_date('06-02-2015', 'dd-mm-yyyy'), 'ioNDfTKdJ15uYsGtGH7B', 'e3WjYoKU4gsZDY1PezAq');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('OHS6LtNVEvf6pqs60xcD', 548, 4, 1, to_date('20-02-2020', 'dd-mm-yyyy'), to_date('09-10-2017', 'dd-mm-yyyy'), 'EG1aKT7hTu7rurrSEBdX', 'cbMIconJWtHCNLY3aG1o');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('zsXYHR8WaKMlMUKvKcYB', 135, 0, 53, to_date('08-12-2005', 'dd-mm-yyyy'), to_date('19-10-2014', 'dd-mm-yyyy'), 'G9LrCUIU3D0hPfnLYU3i', 'MHaHS7WQBZAJAHPeZ8fj');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('EJRafDnOLABAYaw0N5vO', 636, 0, 5, to_date('18-12-2010', 'dd-mm-yyyy'), to_date('28-09-2000', 'dd-mm-yyyy'), 'xUMmewBMmaMHR07wmkUD', 'vssuOoN770YhOllvsPVV');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('VC0b19xr8XSAEWi0B40h', 947, 9, 96, to_date('19-06-2001', 'dd-mm-yyyy'), to_date('16-05-2016', 'dd-mm-yyyy'), 'FL6eRTELBceNJvRixEjJ', 'K8EhYasfhJGvTT5apgDy');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('7JcqmlOYAoyFVUFcvOYE', 506, 8, 90, to_date('02-09-2012', 'dd-mm-yyyy'), to_date('02-09-2009', 'dd-mm-yyyy'), '8On976NUdJqsnJtdGZPv', 'SkFVHHso1Bo9Ejc4PwrH');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('RuZzQApD4FJ8yWlSOJdq', 56, 7, 34, to_date('06-03-2013', 'dd-mm-yyyy'), to_date('23-12-2006', 'dd-mm-yyyy'), 'gdKYJ0ONxL6W91ZYHaPN', 'gritD2XQAJgTZPt6cgRn');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('t6RllrwTYwQNGj7L3QMM', 168, 6, 72, to_date('12-11-2018', 'dd-mm-yyyy'), to_date('27-09-2011', 'dd-mm-yyyy'), 'p5fi8jZI8u7V8M6c2Zqo', 'dwit3XcYjJ56odNfhK7S');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('o5E4ufjpwHbKsHuAnOlU', 818, 9, 0, to_date('22-06-2018', 'dd-mm-yyyy'), to_date('18-11-2019', 'dd-mm-yyyy'), '2I79Te9cAqV0U0HBaavW', 'ZMEMvTVkYalSL6uVmd0U');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('2Q6qT3Oo2QqXlHHW5Cjs', 323, 4, 87, to_date('07-08-2003', 'dd-mm-yyyy'), to_date('12-08-2007', 'dd-mm-yyyy'), 'AkUZglvcAahbq2Mr1Xrn', 'bSBpuZ2J0dgw517Zb09h');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('eDucLQeNts5eo0rLZCUK', 83, 8, 6, to_date('22-08-2020', 'dd-mm-yyyy'), to_date('27-03-2015', 'dd-mm-yyyy'), 'E4Cy0T17U57lgoCw44Dg', '7nuqmAJj29MDPNk31Tsr');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('DGFSU1pLUGz5KFzPqv0Z', 397, 7, 74, to_date('15-07-2009', 'dd-mm-yyyy'), to_date('01-07-2021', 'dd-mm-yyyy'), 'padnk3ZmDVVQPbx1UF2t', 'JFvZucXhijD21FOFsPuq');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('8TpDWhsfoxQ4qxxzevZn', 304, 9, 63, to_date('05-09-2002', 'dd-mm-yyyy'), to_date('15-10-2003', 'dd-mm-yyyy'), 'pIp6YpjeYcDpdBzJIMIo', 'raPgsWLXWN3l3QZkr2Tv');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('EAfthMMd0n0C9NtwfoNC', 26, 9, 31, to_date('20-12-2009', 'dd-mm-yyyy'), to_date('19-11-2015', 'dd-mm-yyyy'), 'wKQqPTSrreE843Ll3VFt', 'O8iC47zJvCzkvYVPn4Ba');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('rRXHsUWibexGNxwReFhB', 457, 8, 5, to_date('15-09-2014', 'dd-mm-yyyy'), to_date('16-12-2015', 'dd-mm-yyyy'), 'NcONS5WvsdX4QXXbVBPO', 'GGWEtwXfll2ofBhf8UzC');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('PlZ5fie4qYMHXgTnRl59', 976, 2, 40, to_date('11-04-2015', 'dd-mm-yyyy'), to_date('13-12-2002', 'dd-mm-yyyy'), 'EVWazZTLPwbCZoYRAsvM', '3h5ggjXUeEB2Gr8WzzWa');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Ej5OqOrR3z9a7vcmwfwB', 348, 9, 15, to_date('11-09-2009', 'dd-mm-yyyy'), to_date('02-11-2001', 'dd-mm-yyyy'), 'FvtjmSZWDxlqRawxvk3S', 'A1wktLKikDSi2B1ETztk');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('crBYKfiyc8uR0BLV46JA', 732, 3, 49, to_date('24-12-2017', 'dd-mm-yyyy'), to_date('21-07-2004', 'dd-mm-yyyy'), 'HwmV17IT172r32BngKHO', 'qiEPmjrQzcVFi10mmOlj');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('8X66OpfiYsMv50sY7Z4m', 858, 0, 79, to_date('15-03-2018', 'dd-mm-yyyy'), to_date('19-10-2008', 'dd-mm-yyyy'), 'AyRfWwvwdVsMNvSZ43as', 'pckyYbXQdY3743MNxMAk');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('6cXm358lfrAJwylhDvTz', 465, 2, 43, to_date('20-06-2009', 'dd-mm-yyyy'), to_date('01-08-2016', 'dd-mm-yyyy'), 'ys8OEDFPDHoK1oW0rQWg', 'fSFrfWomAQKsKIiMfO7p');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('GfHHPlJkXJ5Pmr6qOLr4', 790, 8, 5, to_date('24-05-2008', 'dd-mm-yyyy'), to_date('10-02-2009', 'dd-mm-yyyy'), 'MLmY5rMx1D29vTIuygdX', 'evFPXlaS50TNtcl3wQA6');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('mYVxD5Ec3epxd4WKS0Lu', 747, 4, 61, to_date('13-04-2016', 'dd-mm-yyyy'), to_date('19-11-2001', 'dd-mm-yyyy'), 'sZaAMSbzZVnKvAxhQIa6', 'h6T3Ky1ZXFSMoRV4ErLW');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('2NW92sFTuYSoq83xaeHT', 521, 2, 49, to_date('01-02-2013', 'dd-mm-yyyy'), to_date('17-01-2001', 'dd-mm-yyyy'), 'gN65gy6ewfuT4jCh86Zq', 'sy5Y5g1ao4Qbn2fUtbSM');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('NrnKx9R8HMAdSUo5rGXU', 205, 0, 77, to_date('11-01-2008', 'dd-mm-yyyy'), to_date('28-12-2021', 'dd-mm-yyyy'), 'BPRyoUp6ai3q1GYaqE9W', 'QKrcVPnPqqV670vhKDBW');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('yjSy7hR18OX16LaTTUO0', 955, 3, 8, to_date('13-09-2020', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), 'rdiE1JLdAQY98c9VYXxu', '3iqH728bBOK0OYFDVD8c');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('g0v36XAzvlC7AF1s646L', 446, 4, 5, to_date('21-09-2017', 'dd-mm-yyyy'), to_date('11-06-2016', 'dd-mm-yyyy'), 'vXBs2QDq1CS2tGAyVUQX', 'CNvRDnnIQUtUWIfYrNvs');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('yPV2saA6i2PWy1SnDeYy', 374, 3, 54, to_date('27-08-2021', 'dd-mm-yyyy'), to_date('13-04-2019', 'dd-mm-yyyy'), 'TsWyQbBF9mpAccRnaUha', 'ML7DZaWYZRptrU9KMuRr');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('3VVJtgEBozNPS9xKHc7k', 666, 7, 94, to_date('13-09-2016', 'dd-mm-yyyy'), to_date('06-05-2020', 'dd-mm-yyyy'), 'TYuXmm0X0OddauKjvXV9', 'ZMEMvTVkYalSL6uVmd0U');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('uB5d9wNWmay6IvUugzAK', 804, 2, 2, to_date('06-12-2015', 'dd-mm-yyyy'), to_date('10-08-2003', 'dd-mm-yyyy'), 'f5sYMNfYMA8OQxoCdi4N', 'MXHchExJGVbvSrudcEfB');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('gfe4i4vatYqwqYONw4n1', 791, 3, 85, to_date('27-03-2020', 'dd-mm-yyyy'), to_date('09-06-2007', 'dd-mm-yyyy'), 'RPQ1kktlwjFWRGtyfjun', 'KQmJWXf9PcKFXXiRJWgB');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('5zkepsHmcJtkpHj8nK03', 419, 6, 70, to_date('01-02-2023', 'dd-mm-yyyy'), to_date('25-05-2020', 'dd-mm-yyyy'), 'LUGJBmaoEZLR8dBcGu7Y', 'zKI3CAQqJIdQoMTwsqUz');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('vE8H7tBkEYtBAdZzV2XG', 982, 5, 40, to_date('12-03-2010', 'dd-mm-yyyy'), to_date('08-03-2004', 'dd-mm-yyyy'), 'ExTmlFKn4aAcIa0b2dcr', 'MQilacDc7WdMj2dORHOW');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Bw0jMhcM0x3JBdAvYlKD', 174, 4, 29, to_date('08-06-2007', 'dd-mm-yyyy'), to_date('05-05-2001', 'dd-mm-yyyy'), 'g7AvOaQU7a7LEbx3JXZE', 'raPgsWLXWN3l3QZkr2Tv');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('EpPMJqIxP1Tht1OMzLFC', 635, 0, 79, to_date('01-02-2018', 'dd-mm-yyyy'), to_date('18-02-2005', 'dd-mm-yyyy'), '2MdD8vUpDPW9oNZZfeH9', 'meOTZarSrFgE7ijK67RL');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('A26qHmJ7CyZBUvP7cMr3', 384, 2, 78, to_date('24-05-2009', 'dd-mm-yyyy'), to_date('24-04-2008', 'dd-mm-yyyy'), '94cxZKuKR29BzlO7AA3q', 'gritD2XQAJgTZPt6cgRn');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('3O1M0z7t3O8BJzYdaYKr', 416, 8, 28, to_date('09-10-2002', 'dd-mm-yyyy'), to_date('05-03-2009', 'dd-mm-yyyy'), 'z5GSrqwvCJ6MjkC286TJ', 'SkFVHHso1Bo9Ejc4PwrH');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('OLZrM882BnGC5HOWcNMR', 428, 3, 71, to_date('08-12-2005', 'dd-mm-yyyy'), to_date('01-11-2009', 'dd-mm-yyyy'), 'BirZIO8y9nns55GJR1VA', 'h6T3Ky1ZXFSMoRV4ErLW');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('9pxwFxifwn2pQHNKb2O5', 670, 7, 40, to_date('21-10-2002', 'dd-mm-yyyy'), to_date('07-09-2010', 'dd-mm-yyyy'), 'uD5EfweIhgUoSDFphI89', 'MXHchExJGVbvSrudcEfB');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('c6nsEWmU7yFuxH6YQSwe', 135, 1, 42, to_date('12-07-2016', 'dd-mm-yyyy'), to_date('14-11-2019', 'dd-mm-yyyy'), '66OpI4cqQ57avK92jssw', 'ktCL4nMRHmIDuZpTSJck');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('DGJfi7Bb3B5C4YudfxDY', 620, 1, 23, to_date('18-03-2002', 'dd-mm-yyyy'), to_date('14-12-2009', 'dd-mm-yyyy'), 'ECK0ZLkQqznLbfbGIwTf', 'f4SQ76EULKwxuwrSA0bw');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('u8HXP9n4bnJXeb10qVsv', 577, 6, 31, to_date('26-11-2023', 'dd-mm-yyyy'), to_date('06-10-2004', 'dd-mm-yyyy'), '5vT324sNp8d9U2wRPIgr', 'JbpnZpTTnCpAdF5SaNSG');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('LhxWsXazXvD59h9I2RlK', 221, 0, 73, to_date('13-03-2016', 'dd-mm-yyyy'), to_date('20-01-2013', 'dd-mm-yyyy'), 'ZP1hCL94ULTvfA0L6DYK', 'cbMIconJWtHCNLY3aG1o');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Abu7YqVWAMsjw6MFArW4', 128, 2, 30, to_date('26-03-2020', 'dd-mm-yyyy'), to_date('06-09-2000', 'dd-mm-yyyy'), 'cCGLSk2hxJLsLQlO0LPl', 'd880XjhYxnJxMSVQRoug');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('KogYjrfkSGvwQhEf3EQz', 372, 2, 42, to_date('14-01-2013', 'dd-mm-yyyy'), to_date('14-02-2000', 'dd-mm-yyyy'), 'Zj0okPTwE95ZhpbOD2J7', 'nsax8QUYy8jMhyke157s');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('UIcCncfETSEKJfftq5Vl', 590, 9, 98, to_date('14-09-2015', 'dd-mm-yyyy'), to_date('19-06-2005', 'dd-mm-yyyy'), 'NV87GBTV65thSYaVLRKw', 'NfXDBGYxuusnarzk2r5D');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('EWY9YGCPwB2JCTVXlukR', 850, 5, 19, to_date('21-01-2009', 'dd-mm-yyyy'), to_date('27-01-2011', 'dd-mm-yyyy'), '7792P9jcfdyhzbMwJHos', 'frZvvc9je2dHzdS1FliB');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('IS7DiBYs45vLk2udjQ22', 566, 2, 58, to_date('19-05-2007', 'dd-mm-yyyy'), to_date('24-02-2005', 'dd-mm-yyyy'), 'x0g5pOgoA81RUqc5WOce', 'Ah7h6eT8PniE6taIUxic');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('S0KX5NFRJUHyktpBJRw2', 410, 7, 30, to_date('20-06-2020', 'dd-mm-yyyy'), to_date('07-02-2005', 'dd-mm-yyyy'), '3PdsoFGLMOV6XX1n0uX1', 'NfXDBGYxuusnarzk2r5D');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dGFZkA9IZIvOl74bPKim', 554, 8, 63, to_date('15-01-2009', 'dd-mm-yyyy'), to_date('15-05-2005', 'dd-mm-yyyy'), 'kU4tRces8ByZ9TPcCEcL', 'nsax8QUYy8jMhyke157s');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('egquF3JVSbzZVrfvFqcU', 579, 4, 92, to_date('04-09-2016', 'dd-mm-yyyy'), to_date('09-03-2023', 'dd-mm-yyyy'), '6vymUR7GrYwn4JikIsZU', 'CNvRDnnIQUtUWIfYrNvs');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('ZXhtF2Vb7p0IXrDKntsQ', 112, 9, 2, to_date('23-03-2001', 'dd-mm-yyyy'), to_date('13-12-2005', 'dd-mm-yyyy'), 'TpK2VH0WzU5e0YSXml6K', 'ZMEMvTVkYalSL6uVmd0U');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('SDKiV6s0PgtnFx1zXpvm', 671, 7, 85, to_date('08-12-2021', 'dd-mm-yyyy'), to_date('03-12-2002', 'dd-mm-yyyy'), 'UAjGDKPai8SGdIPsJEVb', 'mJ7tBxDTNALHfCcLcKEO');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('OlPoSXCqFqQv6GItxduI', 325, 3, 63, to_date('26-11-2009', 'dd-mm-yyyy'), to_date('17-12-2000', 'dd-mm-yyyy'), 'QR2nrnwqrgAsxP68rTGp', 'CNvRDnnIQUtUWIfYrNvs');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('oy6ZAiSXamg2pw0AmGwz', 915, 4, 95, to_date('11-06-2012', 'dd-mm-yyyy'), to_date('04-07-2020', 'dd-mm-yyyy'), 'LXmAkzM5TUwFJN1PYJQD', 'meOTZarSrFgE7ijK67RL');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('KP6hSKwNbXKAaBwN84nT', 777, 6, 99, to_date('19-05-2007', 'dd-mm-yyyy'), to_date('09-02-2013', 'dd-mm-yyyy'), 'V9Elwv8YNqCZFNmSXeLA', 'dYCqiwEngdq1XikHDdx4');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('WcOuKslBg8dvfsgJYJ1H', 15, 2, 95, to_date('18-12-2015', 'dd-mm-yyyy'), to_date('28-02-2000', 'dd-mm-yyyy'), 'POismFDJvc9FEWLsEHgJ', 'urAWDugsy3Gq63GJwXoD');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('pmp2e5F9r2U7JvjqxbSG', 188, 0, 34, to_date('07-10-2019', 'dd-mm-yyyy'), to_date('13-06-2021', 'dd-mm-yyyy'), 'YBWtmjt0CsZbm6Jd2qFQ', 'T6EmeIiREh8NuVfkJiPj');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('xqIXvDIyUZeLdN4nsNGO', 799, 4, 8, to_date('17-09-2008', 'dd-mm-yyyy'), to_date('15-06-2004', 'dd-mm-yyyy'), 'PVAeNU6rLkibfmJsegXu', '34tJteNGx3z4xUmYHXOY');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('ZtxWbWtX0GvkwhOIB9y3', 56, 0, 12, to_date('23-02-2016', 'dd-mm-yyyy'), to_date('20-11-2007', 'dd-mm-yyyy'), 'nTFEHDHnyY2xl1FWWgqo', 'NfXDBGYxuusnarzk2r5D');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('0GB8mLqYlkEWKaJ2s8rA', 954, 5, 85, to_date('13-07-2008', 'dd-mm-yyyy'), to_date('13-06-2016', 'dd-mm-yyyy'), '1VFXNRe0dJL225Kpy44w', 'YvZex1gvQ8Zn5ivCoDmM');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('sumZA91eKIcY9ZwpACEd', 936, 3, 40, to_date('25-01-2017', 'dd-mm-yyyy'), to_date('05-11-2018', 'dd-mm-yyyy'), 'dDFOAGeYmX2Jj6zltw5f', 'fSFrfWomAQKsKIiMfO7p');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('mA67P1XmxdaQLuPZujbU', 594, 5, 62, to_date('06-02-2010', 'dd-mm-yyyy'), to_date('20-04-2013', 'dd-mm-yyyy'), '5B9SFiT4nlI7UMvlyup5', 'cBUqAvx8tQWDFEa46b09');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('AriIGvxyBsroMVjBKYLT', 473, 0, 61, to_date('24-08-2022', 'dd-mm-yyyy'), to_date('21-04-2002', 'dd-mm-yyyy'), 'JJLmNxHB0cP6QqHNsd4L', 'IkfvOMYkD0lt9h3uO36N');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('26BmvjmNabv662CusZd1', 37, 7, 50, to_date('18-04-2023', 'dd-mm-yyyy'), to_date('11-07-2019', 'dd-mm-yyyy'), 'DMWqHhT5mds3jeI72MiJ', '7nuqmAJj29MDPNk31Tsr');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('1Uz5DH3QFZBFhvmaFLtA', 647, 7, 13, to_date('18-11-2016', 'dd-mm-yyyy'), to_date('01-07-2006', 'dd-mm-yyyy'), 'RSQ84yIDIqCb1HXrbi76', '1qMAFhbgbPMb7p8KJ4ui');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('I8zwzTrLFcpdmCG1Q0H3', 618, 5, 55, to_date('05-05-2012', 'dd-mm-yyyy'), to_date('01-02-2015', 'dd-mm-yyyy'), 'X2ErCRQ1kGkzz2ieFeIC', 'GvSmbOOvmRDiMtxoFd4F');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('X4Rt2xkhBZRwFaggESJq', 370, 9, 51, to_date('28-04-2011', 'dd-mm-yyyy'), to_date('02-03-2016', 'dd-mm-yyyy'), '0CIQOFTrN1duW51Qtx6p', 'd880XjhYxnJxMSVQRoug');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('UAJsdJlGw8pouzTMTgBe', 999, 8, 53, to_date('14-03-2002', 'dd-mm-yyyy'), to_date('09-08-2011', 'dd-mm-yyyy'), 'GOJR16y9evXCLN5Or0kS', 'LtpzptmrhRADTmJbDtik');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('kbQvY9CpTWWFL9wKNbVI', 25, 8, 54, to_date('08-07-2019', 'dd-mm-yyyy'), to_date('27-04-2013', 'dd-mm-yyyy'), 'hqUpCwvDpQwRN5vla3T7', 'qR2QR6I1p8fbBgEfgisk');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dKq829bMI475iIh275oNh093nQb149sKT716xMo633tNl579aS', 771, 29, 144, to_date('13-10-2208 17:50:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-11-2028 08:48:02', 'dd-mm-yyyy hh24:mi:ss'), 'lOR086gLR793dZp368cDj151sUD422uVi673bDE395rEH325cG', 'sFw755dNX120aDE322oGw895qOr157jKB442qBR382rWS972fD');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('wMD683dKV856bHf372sAe575fIR259vIC781tTl580eRO681rN', 795, 50, 1459, to_date('13-01-2524 15:54:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-03-2303 16:54:20', 'dd-mm-yyyy hh24:mi:ss'), 'lVV442oAF120nDE770pUF860lFG730yXj170hJK060gXd664wU', 'zJI772pHR328sVa895hLn151rUv379nLE671bWW152rCU912qO');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('jYD773cAw787eOy719hGx868gWB897bPA976kQx571nOG552yL', 1170, 97, 578, to_date('11-02-2100 19:43:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-10-2396 12:33:59', 'dd-mm-yyyy hh24:mi:ss'), 'fYM529vOK696mUD831vHD010tDx027yYR824sRG454rKo193lV', 'mJ7tBxDTNALHfCcLcKEO');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('nKL628fCn816aGP799bRL287gYO270yXk669kZV758aJb989pO', 964, 23, 840, to_date('16-07-2793 03:49:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-01-2580 22:10:07', 'dd-mm-yyyy hh24:mi:ss'), 'tTB597iUB885ySB176bEG363nNG318jPB261rBh890iVL623iD', 'zZ4xRXgF3KcD8uoABCac');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('oNb446oSq166cFs315aXV072lLq796uEA864yOg686lIG011vZ', 533, 63, 141, to_date('06-11-2494 07:04:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-05-2571 00:08:21', 'dd-mm-yyyy hh24:mi:ss'), 'yXa354iFn352eZE875qXg143wXw745lUj083oNc937wYh885jK', 'A1wktLKikDSi2B1ETztk');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('gQw886kMB529cVE915jSw395kXp793cUf318lYl634yHu040eC', 462, 75, 1795, to_date('27-02-2694 21:16:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-07-2224 07:34:53', 'dd-mm-yyyy hh24:mi:ss'), 'nBv751xBm494rLQ337qDB741rPi952tAn246gWh530tRB426vZ', 'ZMEMvTVkYalSL6uVmd0U');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('yUn814hSR298tJA420kQF452aGH912pOL129fUw195jNB257fN', 973, 2, 957, to_date('06-01-2868 23:44:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-03-2707 04:15:27', 'dd-mm-yyyy hh24:mi:ss'), 'kQS846kWs336mER722rBI540jQf169uNd375nGJ636eER047bV', 'lSm546pHh559oBh368iSv355jDl976aSR170dLN672xSF411lY');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('rPE691mGV184fTM864fKA744sPD572rMc457uDQ780lLa187kR', 755, 79, 1205, to_date('26-09-2303 15:20:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-03-2625 03:17:42', 'dd-mm-yyyy hh24:mi:ss'), 'cNt174oJC424lYV067qFo782gFm372sDf330bTv990mPz186eL', 'MGjVO1zDbAO2w73oBrkc');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('fZA086uCC554oQH014oCc719yUq022zDr665dQy396hBo614kV', 390, 79, 1952, to_date('26-06-3019 03:58:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-01-2805 10:40:30', 'dd-mm-yyyy hh24:mi:ss'), 'bNq545hOB953dYH590bMu622jCy911gKp513zBJ159kIj637sB', '1NRC0VGhWcvBIegtcUao');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('qZY727vGo437vWV390tJB160eYl120tFc084kQs347wAY735vA', 37, 9, 1807, to_date('06-03-2428 05:25:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-05-2513 18:04:10', 'dd-mm-yyyy hh24:mi:ss'), 'uQv962xPI330nTs873nOX424eHW612nMS169xEM781yNU929oR', 'sQR499iYn010bJE292qLq554yDf328zRV220cTV241aCt323qB');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('kGU869hBU541hZl216gVg797tWG927fFX010tEV982bMd984bR', 784, 7, 266, to_date('20-06-2276 09:10:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-06-2914 08:33:21', 'dd-mm-yyyy hh24:mi:ss'), 'yLG657jTW476aSF321lZQ637rJV981vVf550dCZ180yIn990gJ', 'mJ7tBxDTNALHfCcLcKEO');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('vGq557zEo497zAS116aWK259vJO352hGy181hUb393kAq562nS', 587, 52, 1238, to_date('04-09-2775 11:27:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-09-3018 03:35:42', 'dd-mm-yyyy hh24:mi:ss'), 'sGI620fQL827wRu256pOj572sBo994zTx526vHs576yFi934mL', 'lLd139fTN993mQi719yRx219fMU815tLt019oRV281qPG659lX');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('cFW797aCV835oTo394gTd397iMh134lTi682eYK316sMg126vQ', 618, 25, 1527, to_date('16-05-2119 03:02:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-06-2812 21:21:44', 'dd-mm-yyyy hh24:mi:ss'), 'wHb867bZR163oGN692tYt464oQu071lUQ791sIq490fUn443pO', 'LyizzSX19sMbffVqMFqb');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('wIf718aGe511jLg869xBC090oOB563pIO387hJj741mIO152uX', 662, 59, 662, to_date('19-08-2203 23:27:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-09-1921 01:27:59', 'dd-mm-yyyy hh24:mi:ss'), 'nLQ319aZQ546fSx122dZv465dIQ693sJC279sAp399kRX128fU', 'bScnUsHrPGaixc2j6QLI');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dAB018yIV933yCw065wEU268jBH545tYu364mZi928bYL723sG', 11, 88, 1965, to_date('19-10-2841 22:51:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-08-2428 01:00:02', 'dd-mm-yyyy hh24:mi:ss'), 'hVV432oYo180cFf246zGT148mCG881hOh120dTt125uHY231oK', '8M1r72yes1gmdKxRBaBm');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('vGH736nHO360sNt581jWr784gEM559wLd090fQq727mSk144lG', 447, 83, 2100, to_date('27-09-2379 03:16:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-07-2625 00:06:28', 'dd-mm-yyyy hh24:mi:ss'), 'yMk834qYm735vLM169vOm661sUM913fFZ829yVO054aRq953mK', 'qIm173uKJ067qBw129dHn228iPl322yJI217kJQ268vLv059hY');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('sUU698vBT671hXT469qQs756pNA350oWf732oRq519sGG549yX', 971, 44, 2030, to_date('28-09-2788 16:14:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-11-2224 15:09:38', 'dd-mm-yyyy hh24:mi:ss'), 'oDf151vRi539pYu426nSX771uYn492zPB369jYZ241dIM286aG', 'MGjVO1zDbAO2w73oBrkc');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dUO547aYr514oUj062xWD992vXr025uYC344jUB759rRD093cK', 133, 35, 1672, to_date('14-04-2381 14:46:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-10-2512 22:36:02', 'dd-mm-yyyy hh24:mi:ss'), 'oJK359oVK115eMt735mJl470aZM481eWe584aMj020pUk068dN', 'urAWDugsy3Gq63GJwXoD');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('hVW621mKv318xRs220iYi211iPC789eYw428xUj646hRM789fF', 1217, 6, 1581, to_date('30-12-1954 11:54:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-06-3034 09:52:24', 'dd-mm-yyyy hh24:mi:ss'), 'cFJ280nYe946hLU852fRC691jEu044rQM785nYg887sRX652sY', 'qIm173uKJ067qBw129dHn228iPl322yJI217kJQ268vLv059hY');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('wYi760iPh244bEm411aWq747hRe611uDC839iBm851xGz075sE', 542, 62, 631, to_date('10-12-2624 02:09:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-09-2084 03:34:59', 'dd-mm-yyyy hh24:mi:ss'), 'cEB861gVA994fRC735tRk528aQh150qKE587tRk071dIZ077nS', '7nuqmAJj29MDPNk31Tsr');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('vPt159pEi727dTn310qFe476oOV127hLr466kZw488tPG486iT', 195, 77, 2336, to_date('31-10-2612 20:56:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-03-2806 08:25:35', 'dd-mm-yyyy hh24:mi:ss'), 'lXT919iLJ073cGF858vCS586qSS334wZx354tKf319aCD678aL', 'k0FpngVkGBsNNPgjlxot');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('hIi054yYk838tDx111xJw459zHn277tTu856dQS839jIk892dB', 985, 20, 373, to_date('04-05-2711 18:10:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-10-2488 17:27:27', 'dd-mm-yyyy hh24:mi:ss'), 'zVW240rFR459uXQ480dJU221aPC190mYG935pFZ939lRp438gC', 'gy3xtfIoTm7SqSqtFsrl');
commit;
prompt 100 records committed...
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dTB075aXk838oHl817hWs157xKz364iBE863bDR169fNc080pE', 422, 74, 1639, to_date('14-07-2283 11:31:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-11-2104 10:01:55', 'dd-mm-yyyy hh24:mi:ss'), 'iZG295bWo082gVC360uVs795jTf161kHJ829nWC341iIi770sX', 'zKP640oJG030vOu832dDI144nCB555xMc939hSv713gXM078gY');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('pBQ261yHy393bMB219hED727jEu961oBG467lAB753oUo068xL', 489, 93, 2115, to_date('31-03-2757 17:20:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-05-2846 19:04:56', 'dd-mm-yyyy hh24:mi:ss'), 'nDD049oRb178rPw480cPf751bXA138oIp878mFx517wKd343nS', 'f4SQ76EULKwxuwrSA0bw');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('rHw555hZT346jLo899uXs280cRi472kAc827jKe661lCO554rH', 1166, 47, 2059, to_date('26-07-2883 04:40:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-11-2290 19:31:17', 'dd-mm-yyyy hh24:mi:ss'), 'wMd033nFX066bFB990xPQ196yTE374jWq625cGQ453lBI613gM', '1qMAFhbgbPMb7p8KJ4ui');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('bYl948dPh715sFF029nWR743yMe661iZl359kNq772kUk051xL', 154, 86, 2060, to_date('22-01-2795 03:39:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-06-2026 11:13:37', 'dd-mm-yyyy hh24:mi:ss'), 'rXw457cRY615lHn335hZj668mQF077zAr157gKl135aYK039fV', 'vFh171oTa222mWr244iSY389cKD418pHr169qWO076tZV082xT');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('vUF177yKW928zSV515kFu897fFG832gZn021dLf889yUC262fO', 295, 10, 949, to_date('23-01-2550 14:00:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-06-2938 21:10:04', 'dd-mm-yyyy hh24:mi:ss'), 'fBZ524oZB857aLP687mRx890yFg934rKN042hNQ056gIB797fB', 'rLr687tEd527gNz143mJB628wSp678aAA483pBw995tLV583gB');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('bKn112kFF787kHx636aOv616wTC186fMO489aRl119qZZ119zD', 1040, 96, 1552, to_date('24-10-2168 03:27:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-08-2755 18:06:11', 'dd-mm-yyyy hh24:mi:ss'), 'vEm036fXA442oPW583yCk413wDj410iEq124xHL269qNR976xV', 'hCH377aMh075qPh612uEv640oFJ121nVE939nSk890yQR520pP');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dGh127fBd022iTS380pFm350cOO763sAk724uAR988lWw164bY', 684, 19, 2061, to_date('30-09-2795 17:16:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-02-2994 16:49:43', 'dd-mm-yyyy hh24:mi:ss'), 'oRY684qYb478kCz651vTB815xJx340cJb369vGP598vLk966fC', 'dvFgbovgHZW8xmLspbs8');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('mUY612cXC719iKf734fLt254iJc259rUU863bKn884lEt019qR', 921, 33, 782, to_date('12-12-2325 01:05:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-02-2131 10:21:04', 'dd-mm-yyyy hh24:mi:ss'), 'uWt651wNh518tYX757eMn437aHt019uUl780eKC960wYN736kY', 'yylksanN6KMpmznFUkj9');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('zEv588kDk911iVG561yZI453nMQ732aRS282sGq692eVm986yL', 611, 60, 460, to_date('05-08-2789 16:43:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-10-2239 17:10:27', 'dd-mm-yyyy hh24:mi:ss'), 'xWP611eSx397iOP180rDj537hKj982rYn575iJh031cKY687xY', 'KVvPcvCuI4JMGnysn2iz');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('yLy394eGw530lNS972hES483sAy217cSi265zXj729uCf048kV', 947, 41, 1404, to_date('12-10-2586 08:57:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-06-2292 00:18:51', 'dd-mm-yyyy hh24:mi:ss'), 'kRM899sPv945cFj712iEW077oXy682wEl756iEN431dGa388rI', 'A1wktLKikDSi2B1ETztk');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('yTG580rYY676iTR549wQg855fAB095nUL894nRn648eFf775fI', 939, 46, 405, to_date('02-03-2242 12:22:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-04-2269 07:54:20', 'dd-mm-yyyy hh24:mi:ss'), 'hNj660mHo213bCg194yIr622rHB115yDP468cOt419mJK061dL', 'NwclOhr0u7ek6KhjAP8s');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('iEq646xNo224uSp850rQM181kYJ277xMx747lEA165zGB887hF', 259, 59, 1856, to_date('25-04-2286 13:44:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-04-2388 11:04:16', 'dd-mm-yyyy hh24:mi:ss'), 'wKm368tCf932bCR884lUo753rVG163rAq795cMj421fLe219uA', 'jZW425rEG510iCt441iRO550yPk636oGd356yMq950eTh594nF');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('rFy439aXr671qUN133kRw716nHz033bAF273pSB129nYG683qE', 492, 17, 2213, to_date('22-08-2918 17:52:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-03-2956 11:28:36', 'dd-mm-yyyy hh24:mi:ss'), 'iCq339rGE826mWO931lVE086eJR611eFn127wKj832oSc333vU', 'lJj388oVL472oXg025yRU894uPm843wMd676qOk112cXc291yN');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('wMh341kGq551mOt153lZf699dZA725nND259mNr865zTq545pH', 87, 5, 198, to_date('08-01-2986 00:36:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-02-2654 00:45:21', 'dd-mm-yyyy hh24:mi:ss'), 'fXK496eBJ273uOG464yZB319aZi142bZI897xGH675uTV587xT', 'jTV718uPr846wIB933gWx760fAu549tVI320kFQ477sYl616eB');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('xCZ020aTE768sLf197bPP764sNb461zPo617kWC136cGJ238bD', 690, 3, 180, to_date('07-05-2624 10:37:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-11-2440 06:03:01', 'dd-mm-yyyy hh24:mi:ss'), 'cHt461bQd778jFY149sMX646wGJ325tSe371mBM431kWV148bP', 'wAylh4WerofToz0jZavK');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('xFL026cCV897oYM231pOT067aOy935hNH816yBS457fCL860pL', 552, 14, 857, to_date('01-01-2186 09:06:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-02-2449 07:26:15', 'dd-mm-yyyy hh24:mi:ss'), 'nLF481jDK532uVH055kWr760mIS269uXD171xPT440uEb063sK', 'cBUqAvx8tQWDFEa46b09');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('rWQ790yYt087dAk479tAq250wYu182lUA725wCx846gJS252dL', 380, 20, 641, to_date('27-07-2148 04:30:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-05-2204 20:45:27', 'dd-mm-yyyy hh24:mi:ss'), 'aKZ043mIO166xOv012nAX293nQY911nZU485qJN955xRa113iN', 'QeKJbfTGbDiziKfYs9wl');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('tTn327bWi140hRE558xOU185yDQ893uLy920rFy253eLY590lI', 843, 36, 1783, to_date('16-03-2340 13:50:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-10-2489 05:07:09', 'dd-mm-yyyy hh24:mi:ss'), 'wRP062dCX380eUl654lWD471bVV478pZV197xLw660xJn080hE', 'k0FpngVkGBsNNPgjlxot');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('pLj268zYD227sJd234vJs824qRD124rNO449cIa390mWk074qO', 86, 55, 1563, to_date('28-12-2190 08:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-01-2383 23:29:36', 'dd-mm-yyyy hh24:mi:ss'), 'uAL643jNb931vYa392oRl392bVM433cLs268wWt990pVE973wS', 'mGq097xGi939hWE558nYq336rQK762eYR713xIp127wVG867pL');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('iVT548jVx234wHa019uAK360yWI731yDk856gGl548nDz545kB', 647, 28, 912, to_date('23-06-2123 17:52:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2114 16:02:55', 'dd-mm-yyyy hh24:mi:ss'), 'lDo360vIw640uMV596dEY910yDB918wPn122lDK327gWn393pQ', 'yTov8KvDBHgbKNd04Szn');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('cIb979mWu876lPJ727bAZ792lUV415zIu661fUX644gNe775nX', 362, 73, 1844, to_date('06-02-2997 04:18:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-09-2397 16:53:11', 'dd-mm-yyyy hh24:mi:ss'), 'mMM132gXM724vCK930vZc158cCf442sLz570xOX642xGk584lN', 'QhEgXWMwuL6MfPltRVSo');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('vNG861iBl337lFd662rZh525jRc679iEy663dNE576bWn517tZ', 250, 51, 1241, to_date('09-12-2501 00:13:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2801 05:13:12', 'dd-mm-yyyy hh24:mi:ss'), 'pXX261cQI413nCd197uSB676hJL634hHQ919eCY139iOp693hN', 'PZ9SfwrlZ0JBk9flxuai');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('iKZ816nNp433rWD095nZT789oVM778uGd578oSl991uGO835jX', 426, 61, 1534, to_date('03-05-2340 16:04:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-07-1965 17:13:29', 'dd-mm-yyyy hh24:mi:ss'), 'iXD713lUO992gTR280bEV941oSr594aLM753zRk061iWy128qA', 'pfZcR25AfI1jWa27fgt8');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('sCG677yAD453zIB621bAf659dSt135vPr646yOk175jDr627wF', 1110, 90, 605, to_date('22-11-2423 05:03:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-03-2666 02:57:50', 'dd-mm-yyyy hh24:mi:ss'), 'xCb016nOv830lOp872eVY931kRL089gMl971lYp445aWq698nR', 'YrjOfUWiN5fKxWA9LxzH');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('yCs466wLh683cPL611iFx773gRa425tDw184oQz128xUa217lP', 462, 81, 11, to_date('10-11-2663 03:10:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-07-3045 19:53:11', 'dd-mm-yyyy hh24:mi:ss'), 'hMZ050rCB269ySG758uYH530cKv922aBB258kTr142lTV635kD', 'UP7tr6dIw2S5yvBFspmC');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('vDV649rTC360uOT357cGI612yMP663lVM478gIN764cVN549zN', 143, 47, 1459, to_date('05-01-2953 05:46:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-11-3001 01:20:38', 'dd-mm-yyyy hh24:mi:ss'), 'aTD291uXR562lQJ732mNQ571mAo020rWP036gWJ076eBK861hC', 'wEmcZaCaV8tdcxprUxvy');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('yWt693jKx638gIP678pSK781sUW928wLg533lEh499jXP938lB', 729, 90, 907, to_date('02-05-2645 22:24:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-06-2425 08:38:06', 'dd-mm-yyyy hh24:mi:ss'), 'jIi494xAn370dXJ563gLp526qCs066vQO762iOD966iLi229gY', 'Ah7h6eT8PniE6taIUxic');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('iML286tPd882eVd282qAA223fQI121vHy398uZP933kVb434vO', 389, 98, 1854, to_date('10-12-2039 00:27:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-08-2199 06:29:22', 'dd-mm-yyyy hh24:mi:ss'), 'cTP376hKT352lNM523xUK310sMS256oJN421uZR715cQE937tJ', 'IB53Fh6I56fivpSlEQEy');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('gGr599oDd936wOE989mPj649oGd129oOF798zFf379jOR376bC', 549, 8, 1768, to_date('16-09-2198 11:30:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-04-2105 19:35:36', 'dd-mm-yyyy hh24:mi:ss'), 'rYh132uMb977mDW991qDy484pUX417cJE499xGA344kDs832kC', 'hwRrRVESKlCPvczDmrye');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dJA364wLY472mRp716tNI145fEG876gFC161cZW772dLM437xW', 576, 93, 2062, to_date('07-04-2703 07:08:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-07-2626 16:07:14', 'dd-mm-yyyy hh24:mi:ss'), 'hBE877wZT797sIR735wAo498oWn942bFM816wYs730rRJ032wP', 'mUy670qYo930uFV753sZk054rOp647tLU757eQa463kRH080uE');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('jRo283vBY510rPz064jPU070rHz389zGK142yOo629mPY594gT', 346, 25, 2318, to_date('13-07-2410 01:01:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-07-2584 19:00:11', 'dd-mm-yyyy hh24:mi:ss'), 'qAv321rHJ051iUJ950sRf976gVb274xDv546nUS147iIr565cI', 'SICDWVKkDDLQcDhcF7CU');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('bBe864iVs260aCL775mCD910zTL049fUM660gAz471qBn187uZ', 876, 23, 1268, to_date('20-06-2153 07:46:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-07-2179 14:14:38', 'dd-mm-yyyy hh24:mi:ss'), 'hId860iUi993qSC077bNn974mSn699zZK211nOh270oEH710pJ', 'pmR9fMfU2cgbYBqXuFUo');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('eLG387oNm056jNa635eFV212lGN553mEv423oPI823zNr781nH', 370, 70, 169, to_date('13-02-2193 07:35:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2077 23:00:57', 'dd-mm-yyyy hh24:mi:ss'), 'jOl599fDc054yRL662fPO147tFH871tBV178gCA346lXd536gI', 'QhEgXWMwuL6MfPltRVSo');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('sZW174aKH546rUi853kNO517mMK248cDw592rKE479aNE553lT', 705, 53, 1496, to_date('03-07-2594 15:17:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-10-2505 09:10:39', 'dd-mm-yyyy hh24:mi:ss'), 'nUV998zZx520sIS129bDh643gGc177uLX918rYn490lPz170oT', 'qR2QR6I1p8fbBgEfgisk');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('rEb067vTU913uRi553sAF356qWH965hZt955gIl416yAO337xM', 1123, 61, 1981, to_date('17-04-1962 05:20:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2625 02:10:01', 'dd-mm-yyyy hh24:mi:ss'), 'sFD334rPg562nCa818pTf058dYp721eVC679wRt772dMv236nN', 'xZd518dDn297gPf398hRW366cNc397yEo730sLT213eAg519sM');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('eKE868sXl179wWn680qYP691rLb914xIH560aNO238vTV678cG', 564, 9, 1375, to_date('23-01-2417 03:58:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-11-2671 21:33:50', 'dd-mm-yyyy hh24:mi:ss'), 'mWQ486uCG052vZG446oXb831mZQ872pZN898yNA840sJj915hT', 'vNcAXeKVfFRjuFrgpmgj');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('hMp949vKr592eMR886eIs020bEI460oUT115tEa862fJS785mK', 957, 14, 1341, to_date('13-09-2598 09:43:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2041 03:40:19', 'dd-mm-yyyy hh24:mi:ss'), 'oYv244xSY160nXe528kPu792gKF064sXk476hKu843dEj440dU', 'tVP877vNm018cYD261mWN026sGi154rJP253rTN372tXA560kS');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('vPy473kHn351nUq558uHq085iGD983gHa084tFp116pZH371pL', 443, 51, 430, to_date('12-09-2050 08:17:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-01-2628 13:14:18', 'dd-mm-yyyy hh24:mi:ss'), 'xSg927hGl073dZR579rFt423aNK732yLV322qYE347lYG348oY', 'sFw755dNX120aDE322oGw895qOr157jKB442qBR382rWS972fD');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('gTl841gAA644sVZ455hOp919rVd988mJF344kZk211sTN665mA', 210, 98, 1761, to_date('17-02-2357 17:44:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2632 23:11:11', 'dd-mm-yyyy hh24:mi:ss'), 'xTl911rJP528wIx861xRo514dBG812jVD394cPE061hIc067cO', 'JEapCITxfSfWjZ1YQYwO');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('iHQ298nJu092iVg714jFH523aHa624oIi959iWj940rEG784lC', 1218, 82, 33, to_date('13-08-2591 02:32:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-09-2299 23:00:48', 'dd-mm-yyyy hh24:mi:ss'), 'bJP556tJq413uNU950xPC714gHM343oRg133pBs838vKI139hY', 'kPL888iHd527ySA459vMQ953bLh364uKQ225mKR134uEk565yL');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('nWL155pAk936nQG917wYD931uIV449bLj440uIi847rHA837bI', 544, 57, 2063, to_date('29-03-2913 21:22:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-01-2117 13:18:20', 'dd-mm-yyyy hh24:mi:ss'), 'zNZ177fUg548sLm758wCw583oMU297lHq173lVZ590rQI662aG', 'zKP640oJG030vOu832dDI144nCB555xMc939hSv713gXM078gY');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('nHv473pVp365jVz423kHA020jSo871kEL197gAP618jCe075yT', 955, 74, 1770, to_date('11-02-2663 14:10:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-06-2426 04:17:28', 'dd-mm-yyyy hh24:mi:ss'), 'tJX460cVd729vCz011zRF182xCU673jXj493sVN747sJB247mP', 'raPgsWLXWN3l3QZkr2Tv');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('xRz799zLV614zOL519rNL511vFj326tBw623nIy592xKB041cR', 826, 7, 303, to_date('25-09-1929 08:39:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-11-2973 18:46:04', 'dd-mm-yyyy hh24:mi:ss'), 'tBA373aMh632oLu810gFO047cXd559zRL253lHY019aOt299xJ', 'UlHL6A0JlRPU8Y18zxHb');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dPp699uFd679lTV661sNF121yFz726qWQ244kCQ482jMv098hU', 575, 97, 2240, to_date('24-06-2787 14:19:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-08-2976 10:58:30', 'dd-mm-yyyy hh24:mi:ss'), 'wLO899tLb620mJn379bIL918yRZ495zPn233cHA498hUv170iS', 'WIKmAy5xQjw9OnFsbtLj');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('lWX272eTd491oTw852vPU817oDZ130lXU174kXG418gLt153mD', 1062, 23, 294, to_date('24-03-2734 17:05:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-09-2700 16:19:20', 'dd-mm-yyyy hh24:mi:ss'), 'mBt084kZX672fZN040fKY644bFw950lIS225gUi076qWd487jM', 'dYx961nBa541oOG879jPD865uYX930dSF412rQd277gWt933yD');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('lJM863kSu440uDZ164mZW337uZv942lNR710gGx470rLO149nO', 291, 8, 288, to_date('31-08-2147 06:56:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-09-2315 17:16:04', 'dd-mm-yyyy hh24:mi:ss'), 'eUG099bCF739yAU052iGi362yFv196eDK364xFr472sOy548lS', 'HQKHExg8SV0BQP7PmpHu');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('gJG953oQg598iMJ882zOq326qLO521mPN470nTW150pDo143qC', 282, 61, 702, to_date('27-10-2615 16:34:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-07-2984 01:59:48', 'dd-mm-yyyy hh24:mi:ss'), 'kGR426dSG399dHa927sJL178pEN995jUn638cYf878nMd374rB', 'pecjgjiiEeRiZnHsz5ND');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('lGi194oTA228qPx249pGq771tAu781qXV928dSz020xUt081jU', 668, 5, 455, to_date('20-03-2309 01:52:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-11-2954 14:09:36', 'dd-mm-yyyy hh24:mi:ss'), 'xMy138hJO854oHE057iXw372rSF544tOk645tFA449vEW375dL', 'fWL941xMI728lTv244oVT361pVy666pFr824lBw410qXx117sQ');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('mSS340eXe441aVA610mJy620bQA255qKL685hKI595iYS826cA', 515, 48, 1169, to_date('25-10-2679 17:14:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2016 00:31:32', 'dd-mm-yyyy hh24:mi:ss'), 'xYR471gMc159cBp566fUz496uMw833sNy368tFm827eKt990zZ', 'qiEPmjrQzcVFi10mmOlj');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('fKA026gZK597yIK798sHW299gYl388ySr040qDC588mPu296pG', 203, 88, 1683, to_date('18-10-2192 21:35:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-10-2949 01:46:16', 'dd-mm-yyyy hh24:mi:ss'), 'uSb636iCQ848lZc863aZD449xGP019eLu812lGa970yXS171rM', 'zKP640oJG030vOu832dDI144nCB555xMc939hSv713gXM078gY');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('sMA335eNV913aUU516yUk344cVF883lLb269sXJ047xNR860uH', 902, 79, 1924, to_date('16-06-2531 10:46:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-06-2673 09:20:44', 'dd-mm-yyyy hh24:mi:ss'), 'aKJ831eDv965qRU014hEI556lFD712aYv772uPX533oFo496kB', 'pckyYbXQdY3743MNxMAk');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('aYI013oJM721mOw669rEN792aYl925kJM387nNz437xDB330mA', 182, 53, 770, to_date('18-07-2983 00:58:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-10-2881 18:46:22', 'dd-mm-yyyy hh24:mi:ss'), 'vJt425dNt181mMr025gXo566zEP915eLY017hKD474nGF471bX', 'MGjVO1zDbAO2w73oBrkc');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('lKw885nFO533tCj993sJk437gNe432aRR744tDO884aAW671dT', 859, 78, 2041, to_date('18-07-2149 13:07:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-11-2557 08:41:08', 'dd-mm-yyyy hh24:mi:ss'), 'dWg376cIb564pBC113rZa761jVT358oAW794jVM658rCB913jK', 'kTN283zYV335eYI054oRM816dIA887wZv710oUT754yXj164uI');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('pMK842fVv220xYN245nWe524tOO857hCX453zCZ959qYr681sZ', 704, 10, 783, to_date('13-11-1975 20:19:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-02-2202 17:47:11', 'dd-mm-yyyy hh24:mi:ss'), 'bKI791lJr921aIm433eJq369cNu032eCd953pOm623vGK373gC', 'FU8B0P61r8v6IfBeedlh');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('hGm968iDb294sUd858oYQ733oBX493kKK317mRP016vOo382uF', 671, 25, 2089, to_date('13-11-3030 05:06:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-03-2732 11:57:50', 'dd-mm-yyyy hh24:mi:ss'), 'sSR336uNV117mVT030eHg459aTh096pSn624zIG879kAp555iQ', 'vNcAXeKVfFRjuFrgpmgj');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('yRZ641wFq220dJG667nYF564yFd641jYS740hWL746uEG858aE', 466, 28, 1182, to_date('10-06-2859 07:11:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-02-2522 10:36:46', 'dd-mm-yyyy hh24:mi:ss'), 'bXt085jGz637pKf576sZP487uJU850fCw719qCw813qSG867pV', 'frZvvc9je2dHzdS1FliB');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('nKk227wEI280lOM727oHt230rHl134zKN167qAf881lNM321dU', 532, 40, 1113, to_date('07-03-2156 18:58:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-04-2905 00:46:04', 'dd-mm-yyyy hh24:mi:ss'), 'qZI885iAf378pLA362gJo866jBG895vKj385bAD581hFO280fK', 'K39oeBrfobN9hmdhPFzO');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('bDJ237nHn572xEQ947aKP861lEv639gYr528nHC357uWZ728jW', 869, 35, 897, to_date('08-04-2042 03:17:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-01-2802 17:01:40', 'dd-mm-yyyy hh24:mi:ss'), 'pZs651fLJ035zAl376lQR770wSH284xTI198nZH768tOG754eE', 'pGy324zBB780aTE360jDf468hSQ154jUT321sSs755gYW486zS');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('lXk734fLd990wET326pCZ940vCx156sPc644zLZ026nFk382uF', 604, 96, 1894, to_date('05-09-2020 02:21:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-12-2856 07:13:52', 'dd-mm-yyyy hh24:mi:ss'), 'iWZ791pTa373kKo836cXL173qXl825uAn391zSt749aMf530eJ', 'tEAxHDyq3Pe1ixSqvXeZ');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('S4EX2j2fEoemdM23VDTM', 161, 7, 19, to_date('06-06-2014', 'dd-mm-yyyy'), to_date('20-01-2023', 'dd-mm-yyyy'), 'rhhMaFQwr8s7cquew3O3', 'gNId9FqUdXLkTW0GiM7I');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('xUTjA8JTQ76OVhblEBMa', 487, 6, 86, to_date('01-12-2001', 'dd-mm-yyyy'), to_date('27-01-2015', 'dd-mm-yyyy'), 'dURUpWNDtDtLOoXIgCDO', 'pckyYbXQdY3743MNxMAk');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('IBHmDsWUmwgJr9aOUhXW', 876, 7, 20, to_date('27-10-2001', 'dd-mm-yyyy'), to_date('24-08-2000', 'dd-mm-yyyy'), 'r8M0tWiNfHHAnp4lGXXI', 'EyBzhXbzEJ8ppzNzzPVO');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('sJnVtRaUOEnO0XbXF2Qh', 141, 5, 17, to_date('02-04-2015', 'dd-mm-yyyy'), to_date('08-12-2008', 'dd-mm-yyyy'), 'ZG0U8hoxjukZwgDNA0t9', 'JFvZucXhijD21FOFsPuq');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('WZkqEHvl44Sfw74aG9pV', 677, 1, 57, to_date('16-01-2017', 'dd-mm-yyyy'), to_date('08-05-2015', 'dd-mm-yyyy'), 'IvvQaTIBw8E4CQrJalJY', 'YvSGkO6l6fRwXlaf5But');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('hFnqH3cPf3GYfrTNhlms', 870, 0, 26, to_date('18-04-2001', 'dd-mm-yyyy'), to_date('19-01-2016', 'dd-mm-yyyy'), 'AD2WJ6FOu20iE62xT7nU', 'YrjOfUWiN5fKxWA9LxzH');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('SxK7sCfMP9LbQJtTpFKi', 277, 0, 68, to_date('23-02-2001', 'dd-mm-yyyy'), to_date('07-09-2021', 'dd-mm-yyyy'), 'T1wVPHvFaeDeRGHUbAMC', 'gritD2XQAJgTZPt6cgRn');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('2lReCRVBHSfpEx1afxfL', 657, 0, 80, to_date('23-10-2021', 'dd-mm-yyyy'), to_date('28-12-2018', 'dd-mm-yyyy'), '0BQNZk1SG3cDrKUI4vLd', 'pfZcR25AfI1jWa27fgt8');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('IsholzCuiWBqfHhjdExX', 457, 9, 5, to_date('07-10-2005', 'dd-mm-yyyy'), to_date('25-03-2012', 'dd-mm-yyyy'), 'WE2zNDTb4zHJ2bCH5nVw', 'TUTHH7HWdHDK8RMFIvnR');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('8c1lZGYJsYnyyccnfdqH', 644, 3, 59, to_date('02-09-2006', 'dd-mm-yyyy'), to_date('21-10-2011', 'dd-mm-yyyy'), 'HdE5lOKddocDKEbJSAM4', 'KCifV23WFXnCYapeGB5S');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('V3F5YmTfpegbfRf4YVxt', 294, 8, 50, to_date('04-06-2002', 'dd-mm-yyyy'), to_date('28-05-2008', 'dd-mm-yyyy'), 'XY8VrEHbzItjjp9grPb2', 'tndFRXLRtc6hmRNKaJI1');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('j6y99RMVyUJZ3VYCgtCz', 925, 1, 14, to_date('18-11-2020', 'dd-mm-yyyy'), to_date('06-10-2020', 'dd-mm-yyyy'), 'Gk87v27l0V8Wojz9zCXG', '9dRI118JtyYNwVMZ7ff2');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Ffz8BoYrmc0rsaieA1HH', 617, 4, 60, to_date('23-06-2020', 'dd-mm-yyyy'), to_date('16-12-2023', 'dd-mm-yyyy'), 'w12kgR6hiC5RzR5xd7j7', 'OUJNnfPZTydnFL7gNwbb');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('z5cRM38KRBWsVyETkmFn', 182, 8, 81, to_date('19-05-2022', 'dd-mm-yyyy'), to_date('24-01-2017', 'dd-mm-yyyy'), 'GnUqA0a6Pw6LZSwC9ODu', 'dYCqiwEngdq1XikHDdx4');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dKIyWtnAkiizavUgdXRW', 823, 6, 48, to_date('26-05-2001', 'dd-mm-yyyy'), to_date('05-08-2021', 'dd-mm-yyyy'), 'MjmT242y4XNftokX3K9W', 'OaJLMtviylz07HB9xIyU');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('vgoEf1b8x18dfADiu1fv', 617, 3, 45, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('26-08-2001', 'dd-mm-yyyy'), 'z3veuf1y5WwHlQWsM986', 'pfZcR25AfI1jWa27fgt8');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('JTuunNTdmyR0uQbJQECF', 58, 0, 63, to_date('08-04-2014', 'dd-mm-yyyy'), to_date('01-03-2012', 'dd-mm-yyyy'), '5scESZQAQ7AWHzucNCAR', 'KQmJWXf9PcKFXXiRJWgB');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('0yiWjwYtMWNtulGtMORe', 929, 8, 96, to_date('04-08-2015', 'dd-mm-yyyy'), to_date('23-12-2008', 'dd-mm-yyyy'), 'M58qbf3rFZBzhLNqONZb', 'esbrjKGP60KvChfZ7EQi');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('lkkfoKScIPYTNQowBxnL', 276, 3, 38, to_date('24-03-2015', 'dd-mm-yyyy'), to_date('08-03-2011', 'dd-mm-yyyy'), 'XjL5L2PmfLHyhSerEjeO', 'nsax8QUYy8jMhyke157s');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('fWTBvY0pgBzcReG8ciAj', 795, 2, 83, to_date('26-08-2012', 'dd-mm-yyyy'), to_date('21-03-2011', 'dd-mm-yyyy'), 'lHX3gxInmKzc0kN51QJ1', 'GmrbtE8X9tGMY5T3LJ16');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('bhKXdM2E45IjgdRRsMK3', 247, 6, 93, to_date('20-05-2019', 'dd-mm-yyyy'), to_date('06-11-2022', 'dd-mm-yyyy'), 'ZFEoacqIZchon4MBLLSC', 'KMjr93ysGB1lT0zzdCfj');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('pZSGFU3AHvv9lK5buLA2', 371, 0, 57, to_date('15-01-2008', 'dd-mm-yyyy'), to_date('09-05-2019', 'dd-mm-yyyy'), 'b0UH0rfh7K94uBIvqKHn', 'K8EhYasfhJGvTT5apgDy');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('f0DKCqvCEEBzVUnfP58T', 836, 3, 32, to_date('14-11-2021', 'dd-mm-yyyy'), to_date('14-09-2007', 'dd-mm-yyyy'), 'sKxZo3dA8vdyZ9CqD2ZQ', 'w8W8MdjEpelam0GoEoT2');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('X55vRmHuM6cUahlminDA', 131, 3, 52, to_date('04-08-2011', 'dd-mm-yyyy'), to_date('19-06-2013', 'dd-mm-yyyy'), 'UXSfbnETDUaEkBoeYLHd', 'HQKHExg8SV0BQP7PmpHu');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('xKHzG0jrhKE2AgO51yGA', 406, 4, 27, to_date('01-12-2008', 'dd-mm-yyyy'), to_date('25-08-2003', 'dd-mm-yyyy'), 'w4QP4Px1qPujRPnXoSLr', 'zInqaEOeudnE68GWB25f');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('LD69R6fwH6oXH5Ek44ZP', 669, 9, 23, to_date('12-03-2023', 'dd-mm-yyyy'), to_date('18-11-2009', 'dd-mm-yyyy'), '4ODqVxrWNemQDA7pyy7S', 'QAJaPCOIFrfM5WMoACo0');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('f5amw6Mwmb9Gjn4oljsH', 811, 0, 45, to_date('22-04-2022', 'dd-mm-yyyy'), to_date('18-08-2011', 'dd-mm-yyyy'), 'xTFKRzfCZhztgEF11RSB', 'kQSaTyQe5QNNfYpSvax4');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('8CNpFGLhnSoS5QpG2b3J', 832, 9, 42, to_date('16-10-2001', 'dd-mm-yyyy'), to_date('16-05-2007', 'dd-mm-yyyy'), 'K7yElnIM6DGsshnS5DXs', 'pecjgjiiEeRiZnHsz5ND');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('muCl55W5246QlH31XefM', 905, 3, 12, to_date('20-02-2009', 'dd-mm-yyyy'), to_date('16-04-2014', 'dd-mm-yyyy'), 'wbImvF72X0k78SnYCOnE', 'QeKJbfTGbDiziKfYs9wl');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('SCCUToFsFSgLfivK8oDI', 736, 8, 0, to_date('18-11-2021', 'dd-mm-yyyy'), to_date('18-11-2009', 'dd-mm-yyyy'), 'k1YjoUvz7mCAwCNQ2ba9', 'YXa2DMSRtg4z53ObwO5H');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('VMijsVf0BY2rXT41WZSE', 985, 4, 36, to_date('12-07-2004', 'dd-mm-yyyy'), to_date('28-01-2016', 'dd-mm-yyyy'), '4EvV5aLTHRLF4qzx5FCJ', '4sSFjP8UX7etKczXWMbJ');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('6a1KX4nAJlDAR4awtFsU', 5, 0, 79, to_date('08-01-2015', 'dd-mm-yyyy'), to_date('01-12-2018', 'dd-mm-yyyy'), 'HaIXVhOqSO77z09V5Q6B', 'vzaI6njXzib5l88YrVXS');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('rURsPIWaF5HKuiGalcrq', 270, 4, 77, to_date('06-09-2009', 'dd-mm-yyyy'), to_date('17-01-2016', 'dd-mm-yyyy'), 'yN8A5P3onjM1UrRZd9Jy', 'HqtiVl893v66wt9a8LYu');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('qXG9zXLHBZD8rV54bbw7', 477, 7, 25, to_date('26-07-2004', 'dd-mm-yyyy'), to_date('06-10-2018', 'dd-mm-yyyy'), 'Qfahw99Z9MKwPGvMzRcV', 'Gk2nLTbu073X84FJ91Ab');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('qeMXXo9AMOz2bF03Vbhs', 364, 3, 34, to_date('10-03-2001', 'dd-mm-yyyy'), to_date('05-06-2002', 'dd-mm-yyyy'), 'QDfr3w9kxRuukf59Qwun', 'vwWr9YQj43q4V4OEJnxI');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Nu5udpJTB7DaWnaZdDTL', 486, 6, 96, to_date('08-08-2021', 'dd-mm-yyyy'), to_date('18-10-2000', 'dd-mm-yyyy'), 'dluxnp33FUMRJJgo0OIV', 'WyAho3x6uqLZu4GdVPQQ');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('zDOD6fMrPd6vunhsPPDB', 899, 8, 51, to_date('17-11-2004', 'dd-mm-yyyy'), to_date('12-07-2022', 'dd-mm-yyyy'), 'P0e7mUtGSvbMiS5WiGqt', 'nMHhXVXG8lyobGKKFnba');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('yifSbBGp9HaMSPAg7aE8', 184, 5, 78, to_date('02-02-2000', 'dd-mm-yyyy'), to_date('06-04-2017', 'dd-mm-yyyy'), 'jqyI6UUkMPFhYzGcKV27', 'vjYoPWBEjfe1p8pjWuzy');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('R3gUp8P3RxorrOI37PQP', 85, 0, 20, to_date('05-01-2009', 'dd-mm-yyyy'), to_date('27-06-2010', 'dd-mm-yyyy'), 'vPY5HncgjwJ9S4u3SkSb', 'GJj4hdcomVffJTLKsqgA');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('UuZERZg1QVOp535bTOrX', 970, 6, 95, to_date('13-06-2000', 'dd-mm-yyyy'), to_date('25-10-2015', 'dd-mm-yyyy'), 'EIlgDSwR0cdSGikLyB0w', 'lRlekapedBaa3h6tI8ZK');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('nIYO7t54VzCtHfeYfKCe', 757, 6, 66, to_date('02-10-2014', 'dd-mm-yyyy'), to_date('20-09-2013', 'dd-mm-yyyy'), 'ekyzlrdNiQB4Iu1uNP1g', '58dZj4WYdD99eejuPcpd');
commit;
prompt 200 records committed...
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('jYi3Ko6jhMKwtNPbxwMX', 739, 3, 26, to_date('26-11-2007', 'dd-mm-yyyy'), to_date('19-12-2012', 'dd-mm-yyyy'), 'SSkgKfrQa0VRg9xD7YxZ', 'wAylh4WerofToz0jZavK');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('UJCMizwxRKp52ZrBUFlC', 962, 1, 5, to_date('26-03-2018', 'dd-mm-yyyy'), to_date('23-10-2005', 'dd-mm-yyyy'), 's3RPB2rExIJu91QvaktS', 'kQSaTyQe5QNNfYpSvax4');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('jD10SydXJz2QRiZY9C7H', 410, 7, 22, to_date('09-01-2018', 'dd-mm-yyyy'), to_date('04-11-2008', 'dd-mm-yyyy'), 'KfQ4149iDfHGpU3N87uS', 'QcCRjwOnnYmibqEAchfh');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('ANTooDk2J5YtOLNodmWP', 196, 4, 55, to_date('01-02-2002', 'dd-mm-yyyy'), to_date('16-09-2002', 'dd-mm-yyyy'), 'ZHla99TRldWvxb8G4kdD', 'HQKHExg8SV0BQP7PmpHu');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('F4fD4aaOKy0zsaANcugX', 281, 4, 92, to_date('06-11-2013', 'dd-mm-yyyy'), to_date('02-06-2008', 'dd-mm-yyyy'), 'rLHLv5oTDPKK34KKsCL6', '0o3InEATBqky2vJOibhK');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('4gm3QqW11R8g4CSirw1A', 428, 8, 8, to_date('17-09-2011', 'dd-mm-yyyy'), to_date('24-09-2010', 'dd-mm-yyyy'), 'J7WrZiJ0SpcRJAcRgLEc', 'XQkanGduqGvx2X8cYa52');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Bdag1OdyGXotCq2kBC1q', 127, 2, 17, to_date('14-04-2007', 'dd-mm-yyyy'), to_date('06-08-2017', 'dd-mm-yyyy'), 'wlqraj65Hw9vAWlaGQz0', '4Nqp1niQNTpZbYr1wbni');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('YfKe1Ms4PvgnT8KMSiG2', 482, 4, 71, to_date('17-11-2014', 'dd-mm-yyyy'), to_date('17-05-2015', 'dd-mm-yyyy'), 'nNsKZoULVtnjrtrC3Eau', 'K5wi6p7HDshC9IHttdt4');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('qwMZWMVBuWjnPTzBBlmh', 907, 6, 82, to_date('21-03-2000', 'dd-mm-yyyy'), to_date('06-11-2013', 'dd-mm-yyyy'), 'IIWlrrvx9WFVe4NbJjUz', 'QcCRjwOnnYmibqEAchfh');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dQ7K5BTmfyRknG4BlYXW', 738, 8, 56, to_date('13-11-2002', 'dd-mm-yyyy'), to_date('10-09-2016', 'dd-mm-yyyy'), '0pmpOVJPTS97eU68uzRf', 'faxith9J9XK3drLd8U73');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('xu4ITDprNTpiz17VDGjA', 697, 5, 60, to_date('19-05-2018', 'dd-mm-yyyy'), to_date('07-12-2020', 'dd-mm-yyyy'), 'DwdMXQ2MOkWuEeTsi1p2', 'CUin4CnO3riFFafEm4cC');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('isy6x69BoU8fFGGzvBZT', 672, 2, 10, to_date('22-08-2005', 'dd-mm-yyyy'), to_date('14-11-2012', 'dd-mm-yyyy'), 'iiy3cxfdlsoeezXzbZ8W', 'CiPslgn4PLpASIfRVv9l');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('T0OcWJb4Gr07K0Tt6ZHS', 839, 9, 73, to_date('25-03-2021', 'dd-mm-yyyy'), to_date('01-09-2021', 'dd-mm-yyyy'), 'Bgg2Ah2O4JzIRwnQ2E8E', 'TaTAWulEEqGoqaqZvXdk');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('S9V0DbepiW3huPPBAsJG', 493, 7, 31, to_date('02-01-2019', 'dd-mm-yyyy'), to_date('04-03-2005', 'dd-mm-yyyy'), 'BHGUzPSarNequ02flNL0', 'HQLCRnKIHOffFi56ZZhy');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('PAC7v3XFNt6SLeypHREy', 720, 7, 98, to_date('17-04-2014', 'dd-mm-yyyy'), to_date('27-08-2006', 'dd-mm-yyyy'), 'XgWAN0bthcxCaJjeclDd', 'zPMp5dGnLcNPwKQlNRgL');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('XbdsSh8tSCoFRSWqifx4', 400, 0, 61, to_date('21-12-2012', 'dd-mm-yyyy'), to_date('27-11-2004', 'dd-mm-yyyy'), 'QmNKiTch6RG5k3ynVkGg', 'HQLCRnKIHOffFi56ZZhy');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('giHxMjdfBpUtRK0ticfF', 468, 5, 66, to_date('21-12-2009', 'dd-mm-yyyy'), to_date('19-09-2009', 'dd-mm-yyyy'), 'ml5ifqvy2viZpSoILwY5', 'GJj4hdcomVffJTLKsqgA');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('sdqs3CFba2tHOLP6DGx1', 410, 1, 47, to_date('01-06-2008', 'dd-mm-yyyy'), to_date('27-07-2016', 'dd-mm-yyyy'), 'bXW6UrS6pnyNFMyx1hFK', 'LyizzSX19sMbffVqMFqb');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('SMMUZFHAvbHwZMynPg86', 670, 5, 59, to_date('15-10-2014', 'dd-mm-yyyy'), to_date('23-12-2001', 'dd-mm-yyyy'), 'PqjRgGIhOjwP00rMPGdg', 'gY8RHOyavD9EBEtbscdg');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('KHY63dsdcNhUmbMt8s9k', 716, 4, 48, to_date('19-05-2005', 'dd-mm-yyyy'), to_date('19-12-2012', 'dd-mm-yyyy'), 'sGso3imsHlh9b1uJwxjL', 'HQLCRnKIHOffFi56ZZhy');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('nNJ5CcOR8OnZfLj5QTGX', 792, 2, 36, to_date('05-07-2017', 'dd-mm-yyyy'), to_date('09-03-2020', 'dd-mm-yyyy'), 'mqv7tBWXvTVAvXxlPFx1', 'e7CTa4yAhPCWbmypAbUt');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('K9VXQdzATHSP26HVVGNA', 274, 3, 72, to_date('15-02-2020', 'dd-mm-yyyy'), to_date('20-01-2008', 'dd-mm-yyyy'), 'kP7SXatgi6HsBMruRXz6', 'tEAxHDyq3Pe1ixSqvXeZ');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('xFTuiasm1wRRjcLMuoh5', 619, 7, 70, to_date('19-07-2005', 'dd-mm-yyyy'), to_date('04-10-2018', 'dd-mm-yyyy'), 'jUxtLtocJaHsUW0jmty5', 'wEmcZaCaV8tdcxprUxvy');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('2koSHGnITWi8y8kzrDSb', 222, 3, 76, to_date('19-04-2015', 'dd-mm-yyyy'), to_date('07-06-2008', 'dd-mm-yyyy'), 't5fiijneXDr9ZOjcyxWO', 'TK5Kgf9NMDvWO73r5Onm');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('WBw8KhqLOzWPmGLMewA4', 882, 2, 7, to_date('01-08-2003', 'dd-mm-yyyy'), to_date('11-04-2005', 'dd-mm-yyyy'), '85CGtnGwwcKlEIRQNy4a', 'WyAho3x6uqLZu4GdVPQQ');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('gPaqLg9z7JVq1WE4TzMM', 61, 4, 15, to_date('03-05-2022', 'dd-mm-yyyy'), to_date('18-09-2019', 'dd-mm-yyyy'), 'f99JLHMuJqYP6f0pIhiF', 'wAylh4WerofToz0jZavK');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('b2kl2X8wZYCvA8RLbRjj', 672, 1, 24, to_date('03-12-2022', 'dd-mm-yyyy'), to_date('02-11-2011', 'dd-mm-yyyy'), 'JcW0ylcUm2L2TW54kD6f', 'UJJhQNr85bzowqpvlDFI');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('MOfjq5dZ0k8WrePsTGF8', 941, 5, 99, to_date('15-03-2004', 'dd-mm-yyyy'), to_date('28-07-2005', 'dd-mm-yyyy'), 'Sv8M9kjWlcpAmE1X7TNl', 'sAdbjLCWS0DToL9KHoDX');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('g8aGsENGTedXGurnzjKc', 440, 4, 62, to_date('10-04-2018', 'dd-mm-yyyy'), to_date('19-07-2009', 'dd-mm-yyyy'), 'qyhHs8QZOkW1Ts7Tdy6C', 'KUc6mLiK4T8aFZWYmYHi');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('zfL22WB2CUkbzXCYk1yA', 843, 5, 80, to_date('07-10-2021', 'dd-mm-yyyy'), to_date('22-08-2008', 'dd-mm-yyyy'), 'mrNxdZG8o0KcMlADiDvE', 'KtalCCZK0c7PcSGuCKC4');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('xyJZK2ZuPUbWaWxwMzks', 261, 4, 28, to_date('05-02-2014', 'dd-mm-yyyy'), to_date('03-04-2001', 'dd-mm-yyyy'), 'IiuogxpUnjjdtRxbDUlu', 'FmJ3a1B4Jho5sp0FEvCA');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('B7QW9ykjthxdZ0htoF0A', 119, 5, 47, to_date('07-11-2018', 'dd-mm-yyyy'), to_date('16-09-2000', 'dd-mm-yyyy'), 'tr67wpAGvtXEeSOTXfYd', 'lRlekapedBaa3h6tI8ZK');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('w6BghR38lbTuCuMAA86G', 66, 6, 11, to_date('28-02-2014', 'dd-mm-yyyy'), to_date('12-08-2007', 'dd-mm-yyyy'), 'wDbydIdsLktcwk1JWB3D', 'Q11whnKRh0HzAOWX8mjp');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('IbS7dExakD3hpaSNAngG', 714, 3, 18, to_date('03-08-2006', 'dd-mm-yyyy'), to_date('21-05-2005', 'dd-mm-yyyy'), 'NqsJlufBF4OFG2EGOMVq', 'UlHL6A0JlRPU8Y18zxHb');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('17XPtL84teGp91rjGH6P', 468, 8, 93, to_date('20-05-2005', 'dd-mm-yyyy'), to_date('09-02-2007', 'dd-mm-yyyy'), 'HB1dEeQt1BWbBeWIkrF2', '2lkZRvlq7LSLMPnbw4vf');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('RJvw0Gf6yAaZG1iBRgq3', 737, 2, 31, to_date('26-11-2002', 'dd-mm-yyyy'), to_date('06-06-2022', 'dd-mm-yyyy'), 'E2lEy92zpkwuo5EU6oRC', 'MGjVO1zDbAO2w73oBrkc');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('CQj1e1LYdx2n4ZUq4CQr', 629, 9, 50, to_date('27-10-2002', 'dd-mm-yyyy'), to_date('24-12-2003', 'dd-mm-yyyy'), 'IDttGEoXKNRsRymlhJsa', 'tWqdhZ35Xr1iHTWFRSEU');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('89nDnm0PaXIophffrbum', 283, 4, 86, to_date('15-11-2023', 'dd-mm-yyyy'), to_date('06-05-2019', 'dd-mm-yyyy'), 'x8J7G2dWWwc1SFQsSFu0', 'X0Jd1EmW8CW7EdbGB7SD');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('GxHDp1BIdqxtpEgMRd8I', 435, 9, 7, to_date('01-06-2016', 'dd-mm-yyyy'), to_date('20-10-2018', 'dd-mm-yyyy'), 'nrOVFSOTZL05tU1x9QPo', '4sSFjP8UX7etKczXWMbJ');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('aQ5xMNfqg6piOkvONXFE', 977, 4, 62, to_date('02-11-2004', 'dd-mm-yyyy'), to_date('10-12-2001', 'dd-mm-yyyy'), 'XvsoiAIPdXdiRa9mJivz', 'K5wi6p7HDshC9IHttdt4');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('wgpz2M7AhMv2OmlvDebo', 105, 4, 97, to_date('18-06-2012', 'dd-mm-yyyy'), to_date('19-09-2019', 'dd-mm-yyyy'), 'lFD2BeA8o011iBylwwkk', 'TK5Kgf9NMDvWO73r5Onm');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Q295WovlPx96898Ykkq4', 253, 2, 79, to_date('16-12-2000', 'dd-mm-yyyy'), to_date('01-11-2012', 'dd-mm-yyyy'), 'Kuidd9i817oOW7UfNSDW', 'QcCRjwOnnYmibqEAchfh');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('RSpOiKonD2qlZjEhk9UA', 493, 3, 19, to_date('18-10-2018', 'dd-mm-yyyy'), to_date('05-03-2012', 'dd-mm-yyyy'), '9dW5e8vc8Fkpfde8x2To', 'vzaI6njXzib5l88YrVXS');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('YSxDacJiiKSw1Gr42MA6', 837, 7, 6, to_date('08-09-2001', 'dd-mm-yyyy'), to_date('26-05-2017', 'dd-mm-yyyy'), 'ubvn66PeoCHoboipP94i', 'cxY1fXeNSor5w6ulA4hF');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('HDzzCU2e1tGfjshCG4XH', 763, 6, 47, to_date('27-07-2016', 'dd-mm-yyyy'), to_date('14-03-2005', 'dd-mm-yyyy'), 'iTRR2wZJrmBQa4cknKOo', 'KtalCCZK0c7PcSGuCKC4');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('a4jaQUEiM9dTXIpDpVR4', 408, 1, 73, to_date('10-05-2005', 'dd-mm-yyyy'), to_date('08-01-2012', 'dd-mm-yyyy'), 'CjIu1r0cKpbov98CuGQd', 'Uj8OQ61aVsE4oByuNND7');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('CHnekrLZzNDccnsdlysU', 689, 1, 62, to_date('02-12-2007', 'dd-mm-yyyy'), to_date('24-06-2009', 'dd-mm-yyyy'), 'z8kAVmgcMJJjl5cGb77N', 'Frz28ycyuf66xSd0Nf6s');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('pmrWl3FQaE7Fpzl34kTA', 105, 0, 94, to_date('19-07-2015', 'dd-mm-yyyy'), to_date('23-08-2009', 'dd-mm-yyyy'), 'P7TaOCB4HWGQGMfzQK7q', 'QcCRjwOnnYmibqEAchfh');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('tgfkPP6w4QI6kprwN242', 500, 5, 20, to_date('24-02-2021', 'dd-mm-yyyy'), to_date('12-07-2015', 'dd-mm-yyyy'), 'fD76u8uCNPuxyrXuslaf', 'QRkx9VhzcRef3RKLhbFm');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('aztlB0K9k000ufwNKz1m', 690, 1, 73, to_date('09-11-2021', 'dd-mm-yyyy'), to_date('22-05-2013', 'dd-mm-yyyy'), 'OWVh31bKkhVjgDo7gQlQ', 'U8EpBXYaDLdsQdw3ME9M');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('0mlqM5tNvgIqVNln6z1p', 338, 9, 41, to_date('02-11-2023', 'dd-mm-yyyy'), to_date('06-05-2021', 'dd-mm-yyyy'), 'kPcjN5gR84TYPLSnVr1O', 'lMlRIPJ8h9zOy8w8DBri');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dffigkNTq5x93HatZxb2', 940, 1, 44, to_date('12-11-2009', 'dd-mm-yyyy'), to_date('05-10-2022', 'dd-mm-yyyy'), 'D1M67kJ7tklMqjKL3RRt', 'ft6zkU6OZrqKI8T4IxkR');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('ADCAeoeGvRxazety9OyJ', 752, 5, 78, to_date('07-08-2022', 'dd-mm-yyyy'), to_date('08-07-2005', 'dd-mm-yyyy'), 'WD5hgScEuvAs9V3F4wVC', 'vjYoPWBEjfe1p8pjWuzy');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('BNr1xg1NgMqwowMYyHNu', 6, 1, 63, to_date('19-12-2014', 'dd-mm-yyyy'), to_date('03-09-2017', 'dd-mm-yyyy'), 'uQJrBMtbr5PcbzpMGzZJ', 'k6Y9gRnh2sp1nWSNjXyd');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Q5dtqZSscYCLP2XY1P2z', 45, 7, 44, to_date('14-05-2009', 'dd-mm-yyyy'), to_date('16-01-2020', 'dd-mm-yyyy'), 'vn6T69fpgVYXXPySyLST', 'f9xyxdEeYSKuR4PTnNm4');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('5GxrJrAftL2V1m8oPY3l', 644, 9, 64, to_date('28-05-2005', 'dd-mm-yyyy'), to_date('18-03-2012', 'dd-mm-yyyy'), 'eglanAtWI80tjIjq9LWi', 'qaiTQ63arfHMx5BaDeF9');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('IScXBR5s1eazb7s9AUsE', 880, 4, 8, to_date('04-12-2011', 'dd-mm-yyyy'), to_date('13-12-2023', 'dd-mm-yyyy'), 'pRc3Sts3ndDnrGbSAqNY', 'SvGx2JfnNFwoQypo0ssA');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('VtbpMS7gzgE6SLx2RJTB', 257, 6, 33, to_date('04-01-2007', 'dd-mm-yyyy'), to_date('10-03-2012', 'dd-mm-yyyy'), 'PVzojPfv8NerTkceKEal', 'QeKJbfTGbDiziKfYs9wl');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('3eyDSCbdDSoFJcRLQaWY', 687, 7, 10, to_date('26-01-2013', 'dd-mm-yyyy'), to_date('19-06-2015', 'dd-mm-yyyy'), '2gLAWR7SHameMcFylr5J', 'PZ9SfwrlZ0JBk9flxuai');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('yFWEKzX1jafQk5eVZhMO', 590, 9, 19, to_date('06-09-2004', 'dd-mm-yyyy'), to_date('07-06-2017', 'dd-mm-yyyy'), 'x2TBjw3YX11R41pmlhY1', 'X0Jd1EmW8CW7EdbGB7SD');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('4V2ysT1zLSXkXyUyefnM', 184, 1, 82, to_date('22-10-2014', 'dd-mm-yyyy'), to_date('12-07-2016', 'dd-mm-yyyy'), '1uGcbRyXnXoiqVNaYpP2', 'wEmcZaCaV8tdcxprUxvy');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Wcav3b6UPXKYPbgmgiel', 251, 9, 25, to_date('11-01-2020', 'dd-mm-yyyy'), to_date('07-09-2023', 'dd-mm-yyyy'), 'PaWWjDQtXspVPmegoaCP', '2lkZRvlq7LSLMPnbw4vf');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('8HXJwUdR1WHnx6GHw4Y7', 780, 0, 83, to_date('14-11-2001', 'dd-mm-yyyy'), to_date('01-03-2006', 'dd-mm-yyyy'), '6T5kz1kl14Hw2lMt8ZXV', 'Gk2nLTbu073X84FJ91Ab');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('4u66gtm2MSvnaIkyhk6v', 654, 4, 1, to_date('21-11-2005', 'dd-mm-yyyy'), to_date('19-05-2023', 'dd-mm-yyyy'), 'VX6VSwbMz3TfMBjePha5', 'zZ4xRXgF3KcD8uoABCac');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Z0BsQv3NL3CN7Cqjwzji', 410, 8, 10, to_date('13-02-2007', 'dd-mm-yyyy'), to_date('22-01-2008', 'dd-mm-yyyy'), '1ktOjiFONqgeORYbPBit', 'zPMp5dGnLcNPwKQlNRgL');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('IHLESwogBGEGGwvawEvn', 644, 0, 58, to_date('26-03-2021', 'dd-mm-yyyy'), to_date('25-06-2023', 'dd-mm-yyyy'), 'GjRjgwfSJMtpCSCCogfg', 'MGjVO1zDbAO2w73oBrkc');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('v1kHXqSS3ABj3g369CNP', 801, 2, 59, to_date('10-10-2005', 'dd-mm-yyyy'), to_date('15-04-2001', 'dd-mm-yyyy'), '95bEGvAlNC0Ja1wZCzs2', 'P3hYahrAqjy54JruGBIQ');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('3UxMJS3dFF9IXj120My2', 413, 0, 92, to_date('23-05-2018', 'dd-mm-yyyy'), to_date('07-02-2014', 'dd-mm-yyyy'), '6ywHEYnxfPyep5ufyOh2', 'e7CTa4yAhPCWbmypAbUt');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('5gNqnFX0mE32EoNIPPws', 417, 0, 57, to_date('15-01-2000', 'dd-mm-yyyy'), to_date('27-04-2003', 'dd-mm-yyyy'), 'Q8K8qregL0i9Z1D0jDEQ', 'KUc6mLiK4T8aFZWYmYHi');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('N6ogpeiksagCuFIalHui', 484, 4, 91, to_date('26-04-2008', 'dd-mm-yyyy'), to_date('21-04-2019', 'dd-mm-yyyy'), '4ZN3yhLy6xVcnEQRrR2o', 'JEapCITxfSfWjZ1YQYwO');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('XJC7kEs8ldXKVX3OsJ4B', 603, 9, 32, to_date('07-01-2023', 'dd-mm-yyyy'), to_date('17-10-2013', 'dd-mm-yyyy'), 'QSETUJsVKCMYTox2QFRF', '8ymwd7Cm9aTp4GWUkRYZ');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('qLrwr3S0uP51Qi4pOASa', 990, 4, 14, to_date('05-01-2009', 'dd-mm-yyyy'), to_date('16-06-2000', 'dd-mm-yyyy'), 'saqWYvb796E9ASEDK2pA', 'wAylh4WerofToz0jZavK');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Qa9oeO3JjRqhZKJj2C1K', 111, 0, 15, to_date('22-12-2001', 'dd-mm-yyyy'), to_date('05-03-2008', 'dd-mm-yyyy'), 'Gswv0IlaIQjARo7jT0DI', 'YXa2DMSRtg4z53ObwO5H');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('rq4haUFM4xSlK96YCyj2', 577, 7, 7, to_date('27-03-2010', 'dd-mm-yyyy'), to_date('05-08-2002', 'dd-mm-yyyy'), 'pO5gGjFg5sRTGnIFJB3U', 'UP7tr6dIw2S5yvBFspmC');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('rOtFSLZRKA8oA1IjrEKQ', 229, 3, 12, to_date('12-11-2015', 'dd-mm-yyyy'), to_date('04-10-2022', 'dd-mm-yyyy'), 'Q9NBMTkSb0FmICO79GhM', 'MGjVO1zDbAO2w73oBrkc');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('Ip9Wx77nGrQ7qNHpbuT7', 608, 2, 94, to_date('28-08-2020', 'dd-mm-yyyy'), to_date('24-02-2019', 'dd-mm-yyyy'), 'l0CnjK8zfMK0aJC4K7VI', 'w8W8MdjEpelam0GoEoT2');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('THzhEspS3hsGTaerUAGR', 143, 4, 15, to_date('20-11-2012', 'dd-mm-yyyy'), to_date('07-09-2003', 'dd-mm-yyyy'), 'Q4xy3GRas8ejqUgJicUT', 'HqtiVl893v66wt9a8LYu');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('OGkEcwmbopNvWLCTnGTP', 157, 7, 68, to_date('13-04-2010', 'dd-mm-yyyy'), to_date('23-10-2002', 'dd-mm-yyyy'), 'LL7FXU8E7RPaMChCPS8N', 'w8W8MdjEpelam0GoEoT2');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('3YQyiP0zJchYDkWSmqkv', 830, 1, 48, to_date('01-05-2020', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'), 'mWfuDjWXYTvYxSDsHbuA', 'nMHhXVXG8lyobGKKFnba');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('YHub5ev02Udd3U18MLnt', 775, 9, 4, to_date('05-04-2010', 'dd-mm-yyyy'), to_date('01-01-2010', 'dd-mm-yyyy'), 'QXRZW8RB4ZXudRa1NCPE', 'pmR9fMfU2cgbYBqXuFUo');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('8DSz6aDgYNiIBvEUDDX7', 732, 3, 88, to_date('19-12-2002', 'dd-mm-yyyy'), to_date('18-11-2003', 'dd-mm-yyyy'), 'slClw9QKvwyMoP0K1USx', 'QAJaPCOIFrfM5WMoACo0');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('iCO542zGf910fGF873pJz898fVc498xUD210tIH638xXa829tJ', 507, 12, 1642, to_date('15-11-2622 18:05:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-11-2257 00:15:33', 'dd-mm-yyyy hh24:mi:ss'), 'iQj489eEY338sRa029qGW727qGb095yQw972pXZ291eKm331pX', 'pGy324zBB780aTE360jDf468hSQ154jUT321sSs755gYW486zS');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dAI376pDR361gGu638gVT740dXv256aVN263vKa430cYO591jP', 19, 93, 1522, to_date('14-06-2645 15:09:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-09-1962 22:33:18', 'dd-mm-yyyy hh24:mi:ss'), 'gWd570uWG494dPg045wIA941rVA720kYe345zJt218jES462kA', '1qMAFhbgbPMb7p8KJ4ui');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('vCk147qRc326yFQ731eIV443oNL630cEd222fTN264zFN810kP', 948, 66, 1687, to_date('12-07-2084 02:56:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-12-2405 13:39:30', 'dd-mm-yyyy hh24:mi:ss'), 'yJX044zSg789bYh644jWZ062xYP221bRL758kXy249xXY653uW', 'IXLoCQIDwQZOAHUFC86C');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dRv098kTU335xYj127ePH054wGO918tLK668gWy082hDs637rI', 485, 99, 1164, to_date('18-08-2928 13:11:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-10-1906 04:06:14', 'dd-mm-yyyy hh24:mi:ss'), 'jJz483pRl587wHs184dNj732gYt586tXN591wKU282oEH551qL', 'KtalCCZK0c7PcSGuCKC4');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('ySi762jTj311eWf190mJy038oXD257bCk158oIF173yYF380rJ', 630, 89, 1378, to_date('10-09-2383 08:30:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-12-2309 04:15:53', 'dd-mm-yyyy hh24:mi:ss'), 'eHA899tSw787wEM896tCQ954zUP591eEk457hFN740iKy991hF', 'ZMEMvTVkYalSL6uVmd0U');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('dWK656mFP987tOr189uNS799cOe071gUY758hOE288hIP118rN', 708, 73, 1514, to_date('29-01-2535 11:25:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-04-2681 19:02:38', 'dd-mm-yyyy hh24:mi:ss'), 'aWL336bXm819tHi890lLg543pMZ373xRX992zLn477qRZ876dX', 'O8iC47zJvCzkvYVPn4Ba');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('sUa590yBu273bNs796vQs831qTq599jDa296pOr769iEy770tL', 856, 21, 64, to_date('28-08-2028 13:54:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-02-2557 04:13:00', 'dd-mm-yyyy hh24:mi:ss'), 'xSD488hFF086uPy095rQH893lFN213tCq574gZE715uGp167lL', '9dRI118JtyYNwVMZ7ff2');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('yBK265hHD738qIt255iGe954kBA023vAM987qOO952ySf848jI', 226, 98, 224, to_date('21-02-2873 04:47:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-05-2251 07:17:11', 'dd-mm-yyyy hh24:mi:ss'), 'eYE923zJG625nSg227pXk555oMW254wBf641dMV652jXc812hK', 'wAylh4WerofToz0jZavK');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('ySs817tEL436nSS041aDv317uEP125nFM310kRM953wUZ853uR', 97, 67, 2206, to_date('18-09-2945 00:50:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-09-2032 15:23:11', 'dd-mm-yyyy hh24:mi:ss'), 'zUk055sVm876sZC088uNR741gDy358tFe873fZi865sFU725dP', 'vZbvi2NoWbPccKlUuFYG');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('oVn519uAW663qHN668cVe481mXQ013xCR212aXu129sZe880dM', 738, 3, 1167, to_date('24-02-2473 13:46:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-01-2332 23:00:31', 'dd-mm-yyyy hh24:mi:ss'), 'zEc361jEd129gSw666pJl886xRb932vTX070aPQ418dJH315kR', 'DR9XLbpgWCunbpQ0eMo7');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('jYW671aJv541bUB996hKW160iUX952eAy121eKh250xEA929xL', 1206, 59, 1786, to_date('31-12-2899 04:11:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-05-2431 21:55:52', 'dd-mm-yyyy hh24:mi:ss'), 'oMV682wNi933tLx767kZP622jMz187fQf141pQu989oMm586qL', 'pfZcR25AfI1jWa27fgt8');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('xBc749yAZ394lOG840xAS667oRc860vXj394dNM710yLm194aO', 686, 46, 1429, to_date('25-12-2366 01:21:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-12-3020 01:34:53', 'dd-mm-yyyy hh24:mi:ss'), 'nDR984pEC256lZA618mBe163hJm150pTS167eCl925yNC373tQ', 'qiEPmjrQzcVFi10mmOlj');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('tYP723vUZ180cXg076wOD288lUe711uYq032bUE143rTv975dK', 958, 41, 1454, to_date('23-08-2152 10:37:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-07-2810 11:21:59', 'dd-mm-yyyy hh24:mi:ss'), 'jWc176jML482rNc053aAd074wCo620vTK411kCB628jYV451uC', 'eMt579eIm627sQp458nJs356nPk650yMY762dMn055cIT164iK');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('fDS623zNM437sIf233wWN516dJv543vAs862wGg833vAs695nL', 175, 91, 2230, to_date('11-05-2084 02:53:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-05-2256 05:00:23', 'dd-mm-yyyy hh24:mi:ss'), 'oCK396pUA942vXo088bSU275oIn275yOs917iWA483gKl521zJ', 'YvSGkO6l6fRwXlaf5But');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('zJE144iHw651eXC649iGf634wHo057aCF499gQK214tSt563tZ', 719, 29, 1559, to_date('05-12-2764 17:07:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2064 00:08:38', 'dd-mm-yyyy hh24:mi:ss'), 'kZm254qNC831aVH639uIO955pMx314yWX720sWH664kLG985iL', 'bOU617nXa130cHX462uXr681rJS583aGn882sLC598eWA229iM');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('aLc638qXV038yDx610cUZ128nID796yCk345fRw699xRw660kV', 257, 3, 1453, to_date('26-03-2453 07:06:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-01-2249 01:06:23', 'dd-mm-yyyy hh24:mi:ss'), 'mTX964eFi460cAO566cGk661xVn341wKz384uEQ425lDm872fE', 'faxith9J9XK3drLd8U73');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('xIY214oOy735qYF761lWj763xOG375kHP692gPe066mXX127tG', 867, 79, 257, to_date('19-09-2772 12:00:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-08-2795 05:10:36', 'dd-mm-yyyy hh24:mi:ss'), 'uDw470yKM822yRP849yFa477pPu145mRm442hLg510tSp649bM', 'SkFVHHso1Bo9Ejc4PwrH');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('iXr861zVn683xKj476sTV310yJn032xIK821rTs657sRq225sA', 721, 21, 1082, to_date('17-05-2287 15:16:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-02-2989 10:02:47', 'dd-mm-yyyy hh24:mi:ss'), 'sLs664vLc011sZB313eIo837fLy538bFD184jVq820yBs925jR', 'wclEysjSGsQG46yMWT7I');
insert into STOVE1 (stoveid, seriesnum, versionstove, manufacturer, purchasedate, lastmaintenancedate, locationstove, deviceid)
values ('yKI645tCU721nKI596wKU616yOl428fXQ263pJs360pPW488iR', 1112, 49, 1956, to_date('12-05-3035 14:10:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-11-2123 07:15:18', 'dd-mm-yyyy hh24:mi:ss'), 'bRl320pRj645rGg435vQX926hSH423xVB654eWX090kXS114nI', 'faxith9J9XK3drLd8U73');
commit;
prompt 300 records loaded
prompt Loading TEST_DEVICE1...
insert into TEST_DEVICE1 (testid, deviceid)
values ('D5MvnOmYa9fx4vr9dmYA', '6TZmHHpk2WVslp0R3Cv2');
insert into TEST_DEVICE1 (testid, deviceid)
values ('Dc6dzUi7qkJXBRTQ2Lja', 'Z6Aj5az3BIJTTMyW3a9b');
insert into TEST_DEVICE1 (testid, deviceid)
values ('Dc6dzUi7qkJXBRTQ2Lja', 'ux61GdY3kzAfPVFXgeej');
insert into TEST_DEVICE1 (testid, deviceid)
values ('Dwa3vW6Td91Aa7Ncu7H5', 'RM5iFzNuudZPOHG068SL');
insert into TEST_DEVICE1 (testid, deviceid)
values ('Dwa3vW6Td91Aa7Ncu7H5', 'fEs595bQe471kGH987aPw743nYD230zMi625pUs867qGv166oK');
insert into TEST_DEVICE1 (testid, deviceid)
values ('Dwa3vW6Td91Aa7Ncu7H5', 'h6T3Ky1ZXFSMoRV4ErLW');
insert into TEST_DEVICE1 (testid, deviceid)
values ('E6E0g6KNYRxsrS2n8JVZ', 'sAdbjLCWS0DToL9KHoDX');
insert into TEST_DEVICE1 (testid, deviceid)
values ('EIgyQIGB1SIUrSSXUGy3', 'UP7tr6dIw2S5yvBFspmC');
insert into TEST_DEVICE1 (testid, deviceid)
values ('EIgyQIGB1SIUrSSXUGy3', 'UlHL6A0JlRPU8Y18zxHb');
insert into TEST_DEVICE1 (testid, deviceid)
values ('EIgyQIGB1SIUrSSXUGy3', 'nMHhXVXG8lyobGKKFnba');
insert into TEST_DEVICE1 (testid, deviceid)
values ('EYVg8sLWEbPjtFwAB08y', '8M1r72yes1gmdKxRBaBm');
insert into TEST_DEVICE1 (testid, deviceid)
values ('EYVg8sLWEbPjtFwAB08y', 'vEY980zAq091rNC554sHg571aPr014mIr160iFg435sVY521tQ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('F3m2SAPRJdX4UebXIMhI', 'cxY1fXeNSor5w6ulA4hF');
insert into TEST_DEVICE1 (testid, deviceid)
values ('F3m2SAPRJdX4UebXIMhI', 'vjYoPWBEjfe1p8pjWuzy');
insert into TEST_DEVICE1 (testid, deviceid)
values ('F9O3TZNVkcQnmlUmlQFJ', 'suu87hlOAGS2lAI4V6Bx');
insert into TEST_DEVICE1 (testid, deviceid)
values ('F9O3TZNVkcQnmlUmlQFJ', 'xHmaZn45Kuy3sWIFa2K6');
insert into TEST_DEVICE1 (testid, deviceid)
values ('FiJLe1boabrZSnmFInSD', 'CNvRDnnIQUtUWIfYrNvs');
insert into TEST_DEVICE1 (testid, deviceid)
values ('FiJLe1boabrZSnmFInSD', 'QKrcVPnPqqV670vhKDBW');
insert into TEST_DEVICE1 (testid, deviceid)
values ('FiJLe1boabrZSnmFInSD', 'T6EmeIiREh8NuVfkJiPj');
insert into TEST_DEVICE1 (testid, deviceid)
values ('FzxE89aQmNlLnAh75poz', 'PAr23O76JA3lmocncdku');
insert into TEST_DEVICE1 (testid, deviceid)
values ('FzxE89aQmNlLnAh75poz', 'UpHsnKtDiVqnOfOKB5XK');
insert into TEST_DEVICE1 (testid, deviceid)
values ('FzxE89aQmNlLnAh75poz', 'f9EodZex5QTDySGP8Nph');
insert into TEST_DEVICE1 (testid, deviceid)
values ('GIITU8WYsLSfKvteQhBd', 'Frz28ycyuf66xSd0Nf6s');
insert into TEST_DEVICE1 (testid, deviceid)
values ('GIITU8WYsLSfKvteQhBd', 'pmR9fMfU2cgbYBqXuFUo');
insert into TEST_DEVICE1 (testid, deviceid)
values ('GPzZGvWXkGUZMwJpKqh6', 'mAOgjTnXclwq7ypjwa0Q');
insert into TEST_DEVICE1 (testid, deviceid)
values ('GPzZGvWXkGUZMwJpKqh6', 'uJ5ry4skrj9wkDHsDCSC');
insert into TEST_DEVICE1 (testid, deviceid)
values ('GTfQHzPapKdGFpAwrugN', 'K8EhYasfhJGvTT5apgDy');
insert into TEST_DEVICE1 (testid, deviceid)
values ('GTfQHzPapKdGFpAwrugN', 'VSGNUhHSO7qfifaHAcTZ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('GTfQHzPapKdGFpAwrugN', 'qiEPmjrQzcVFi10mmOlj');
insert into TEST_DEVICE1 (testid, deviceid)
values ('GaFBV74iQ5VLIoLh3tv9', 'NFjiU36M15pM8S71LMU4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('GaFBV74iQ5VLIoLh3tv9', 'UJJhQNr85bzowqpvlDFI');
insert into TEST_DEVICE1 (testid, deviceid)
values ('GiwtLyAUYWidDNcFGAaI', 'SvGx2JfnNFwoQypo0ssA');
insert into TEST_DEVICE1 (testid, deviceid)
values ('I4UWhXP1PJjq7lIyvvnE', '03waK1eR32NJaiv9OjMi');
insert into TEST_DEVICE1 (testid, deviceid)
values ('I4UWhXP1PJjq7lIyvvnE', 'mAOgjTnXclwq7ypjwa0Q');
insert into TEST_DEVICE1 (testid, deviceid)
values ('ITpqcFDYJqrDXVpKcBvT', 'sZOAkhoJz5cCVwNxRHBj');
insert into TEST_DEVICE1 (testid, deviceid)
values ('IUL6NCHf6JM0f07q192W', 'TDrY6r5Ed1SkDkJvf1rS');
insert into TEST_DEVICE1 (testid, deviceid)
values ('IsmhwpSX9dYJY35YR0pN', '1qMAFhbgbPMb7p8KJ4ui');
insert into TEST_DEVICE1 (testid, deviceid)
values ('IsmhwpSX9dYJY35YR0pN', 'h6T3Ky1ZXFSMoRV4ErLW');
insert into TEST_DEVICE1 (testid, deviceid)
values ('JDRrKuieBUkBSHR5Q15U', 'KUc6mLiK4T8aFZWYmYHi');
insert into TEST_DEVICE1 (testid, deviceid)
values ('JDRrKuieBUkBSHR5Q15U', 'qaiTQ63arfHMx5BaDeF9');
insert into TEST_DEVICE1 (testid, deviceid)
values ('JIOGEgQ5407vc15Af3Cj', '2Fj2QuBEU3QmP8qSMBHV');
insert into TEST_DEVICE1 (testid, deviceid)
values ('JIOGEgQ5407vc15Af3Cj', 'K4nA7xpbSyhKrXhOU41q');
insert into TEST_DEVICE1 (testid, deviceid)
values ('LD95e9KwAb1xKQx6OczP', 'P1vRpYpPQoI0MPZUaKDi');
insert into TEST_DEVICE1 (testid, deviceid)
values ('MKqk3sqn7DWFoTUFa6pK', 'fNW878nFD324pSX721nAL648yDU669lDL659oEU315iNT554qO');
insert into TEST_DEVICE1 (testid, deviceid)
values ('MKqk3sqn7DWFoTUFa6pK', 'nMHhXVXG8lyobGKKFnba');
insert into TEST_DEVICE1 (testid, deviceid)
values ('McgbcC2b3m8ny1Qg1cx9', 'LtpzptmrhRADTmJbDtik');
insert into TEST_DEVICE1 (testid, deviceid)
values ('McgbcC2b3m8ny1Qg1cx9', 'wM873rotDfcCJCToR4lQ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('MoHL0y9B4cDsGFu1SbiI', 'dwit3XcYjJ56odNfhK7S');
insert into TEST_DEVICE1 (testid, deviceid)
values ('MoHL0y9B4cDsGFu1SbiI', 'fSFrfWomAQKsKIiMfO7p');
insert into TEST_DEVICE1 (testid, deviceid)
values ('NqtHNVNNBPqRc9JATlFv', '2lkZRvlq7LSLMPnbw4vf');
insert into TEST_DEVICE1 (testid, deviceid)
values ('NqtHNVNNBPqRc9JATlFv', 'KVvPcvCuI4JMGnysn2iz');
insert into TEST_DEVICE1 (testid, deviceid)
values ('ODj7jzvqMe5URGEXFWX0', 'SvGx2JfnNFwoQypo0ssA');
insert into TEST_DEVICE1 (testid, deviceid)
values ('OGlPakdkl9a4GVzyiRH6', 'Dt7CfR13I5QPel8AMwLL');
insert into TEST_DEVICE1 (testid, deviceid)
values ('ORmNGCoMw7FPoWlHB2fO', 'MHaHS7WQBZAJAHPeZ8fj');
insert into TEST_DEVICE1 (testid, deviceid)
values ('ORmNGCoMw7FPoWlHB2fO', 'frZvvc9je2dHzdS1FliB');
insert into TEST_DEVICE1 (testid, deviceid)
values ('OsA69lD7HuWxGrewBf6X', 'CNvRDnnIQUtUWIfYrNvs');
insert into TEST_DEVICE1 (testid, deviceid)
values ('PcvkK6qH35Uwe8uffNgt', 'JFvZucXhijD21FOFsPuq');
insert into TEST_DEVICE1 (testid, deviceid)
values ('PcvkK6qH35Uwe8uffNgt', 'e7CTa4yAhPCWbmypAbUt');
insert into TEST_DEVICE1 (testid, deviceid)
values ('PcvkK6qH35Uwe8uffNgt', 'urAWDugsy3Gq63GJwXoD');
insert into TEST_DEVICE1 (testid, deviceid)
values ('PdtmS2Y3ivOfXaWkjSaf', 'dvFgbovgHZW8xmLspbs8');
insert into TEST_DEVICE1 (testid, deviceid)
values ('PdtmS2Y3ivOfXaWkjSaf', 'gritD2XQAJgTZPt6cgRn');
insert into TEST_DEVICE1 (testid, deviceid)
values ('PwldAw8e3HhLs13FYwCI', 'rWivMmgglA6nWopD9shr');
insert into TEST_DEVICE1 (testid, deviceid)
values ('Q0MUkzYW5Kwe1qWPcjqt', 'dYCqiwEngdq1XikHDdx4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('Q1uRKtKHvt2DXGlthVQn', 'YXa2DMSRtg4z53ObwO5H');
insert into TEST_DEVICE1 (testid, deviceid)
values ('QlJCs7gMYhzBgbSiXijj', 'AmrZ5KxyeTd4R7WMLeAW');
insert into TEST_DEVICE1 (testid, deviceid)
values ('RhrOAJb8j16myZZ8cvXB', 'CUin4CnO3riFFafEm4cC');
insert into TEST_DEVICE1 (testid, deviceid)
values ('Rzt3bGcSxJO2arUWnxxZ', 'TUTHH7HWdHDK8RMFIvnR');
insert into TEST_DEVICE1 (testid, deviceid)
values ('SC0dOG4An6i1Z5BkUc6u', 'BnmHROSwRUQ0VDtJqW9s');
insert into TEST_DEVICE1 (testid, deviceid)
values ('SC0dOG4An6i1Z5BkUc6u', 'IXLoCQIDwQZOAHUFC86C');
insert into TEST_DEVICE1 (testid, deviceid)
values ('SC0dOG4An6i1Z5BkUc6u', 'Yvngsz7VQKTj0DB9LJoE');
insert into TEST_DEVICE1 (testid, deviceid)
values ('SC0dOG4An6i1Z5BkUc6u', 'bScnUsHrPGaixc2j6QLI');
insert into TEST_DEVICE1 (testid, deviceid)
values ('SKIGq0fAQzTRJaymzoJK', 'ZbrP08ZxdRBCoQBoV0lo');
insert into TEST_DEVICE1 (testid, deviceid)
values ('SKIGq0fAQzTRJaymzoJK', 'gritD2XQAJgTZPt6cgRn');
insert into TEST_DEVICE1 (testid, deviceid)
values ('SNXmE5fPhWLhPx9x26OD', 'T9nx3Vhb3tvq86iuGaqx');
insert into TEST_DEVICE1 (testid, deviceid)
values ('SNXmE5fPhWLhPx9x26OD', 'nMHhXVXG8lyobGKKFnba');
insert into TEST_DEVICE1 (testid, deviceid)
values ('SqUis6DpHKvCAeSYFh3p', 'pOmuSefuIvJ5x8b6Bg26');
insert into TEST_DEVICE1 (testid, deviceid)
values ('TvcKZG1g4F58koXnWiij', 'GGWEtwXfll2ofBhf8UzC');
insert into TEST_DEVICE1 (testid, deviceid)
values ('UGnsttShlqLOAX5RMdfo', 'lTi421nSk538sXu948vYs540vSl154fYF711aMt626hCN923tW');
insert into TEST_DEVICE1 (testid, deviceid)
values ('USeVj7cdAiNI8XaFC0jg', 'meOTZarSrFgE7ijK67RL');
insert into TEST_DEVICE1 (testid, deviceid)
values ('UVVmOp2bdEW35j9lJHRW', '3h5ggjXUeEB2Gr8WzzWa');
insert into TEST_DEVICE1 (testid, deviceid)
values ('UVVmOp2bdEW35j9lJHRW', 'TUTHH7HWdHDK8RMFIvnR');
insert into TEST_DEVICE1 (testid, deviceid)
values ('UVVmOp2bdEW35j9lJHRW', 'bScnUsHrPGaixc2j6QLI');
insert into TEST_DEVICE1 (testid, deviceid)
values ('UVVmOp2bdEW35j9lJHRW', 'vssuOoN770YhOllvsPVV');
insert into TEST_DEVICE1 (testid, deviceid)
values ('l6NsA2DVVbHsHRddrKOc', 'ePLDni1VAn3CzSANO6Q1');
insert into TEST_DEVICE1 (testid, deviceid)
values ('lMmHzzsz9vE0ZJn5doVs', '9dRI118JtyYNwVMZ7ff2');
insert into TEST_DEVICE1 (testid, deviceid)
values ('lMmHzzsz9vE0ZJn5doVs', 'VSGNUhHSO7qfifaHAcTZ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('lMmHzzsz9vE0ZJn5doVs', 'tndFRXLRtc6hmRNKaJI1');
insert into TEST_DEVICE1 (testid, deviceid)
values ('liZ2wqBkSrEc3tdAXv0O', '8Q0qLjFMnzZHfm8YXj3f');
insert into TEST_DEVICE1 (testid, deviceid)
values ('liZ2wqBkSrEc3tdAXv0O', 'rpZjfphQDAyInd4S9Mg5');
insert into TEST_DEVICE1 (testid, deviceid)
values ('lvMmmZRiy4S0zehljpGC', 'FU8B0P61r8v6IfBeedlh');
insert into TEST_DEVICE1 (testid, deviceid)
values ('lvMmmZRiy4S0zehljpGC', 'OUJNnfPZTydnFL7gNwbb');
insert into TEST_DEVICE1 (testid, deviceid)
values ('lxCN8JR9L3kFVadvK13H', 'f4SQ76EULKwxuwrSA0bw');
insert into TEST_DEVICE1 (testid, deviceid)
values ('mH8T0FeDfIPyQBIC95w4', 'Q11whnKRh0HzAOWX8mjp');
insert into TEST_DEVICE1 (testid, deviceid)
values ('mH8T0FeDfIPyQBIC95w4', 'YXa2DMSRtg4z53ObwO5H');
insert into TEST_DEVICE1 (testid, deviceid)
values ('mOU566iBz387bMx689pKA555sUo286cYg725mZb089xVB713jH', 'lJQ199zTr122kAU680iJC457nYd651zCL921zYa483vOo645eL');
insert into TEST_DEVICE1 (testid, deviceid)
values ('mQI092lHJ513oHK477wYp139nHG374qTV213yYm964yUc129pL', 'xPS579cVe075oWT080eWh236rBD090gES625uPC480oHc125fT');
insert into TEST_DEVICE1 (testid, deviceid)
values ('mSe824aVo081bDc186jSo660kLx915rRG024lPZ256lDJ013eG', 'pIS872rOR432oLh060aRm147xRJ777mXJ795uGR785lWP796lG');
insert into TEST_DEVICE1 (testid, deviceid)
values ('mVikNh7YuoBJQ7edY3Jk', 'K8EhYasfhJGvTT5apgDy');
insert into TEST_DEVICE1 (testid, deviceid)
values ('mmzfrTby8UmEM7ehK0WD', 'qNTbsfMluCqN9TD5EQCc');
insert into TEST_DEVICE1 (testid, deviceid)
values ('mpdr4zrasOIZmKkIyAYx', 'GwVpUKoYwxm1S6ozlE6X');
commit;
prompt 100 records committed...
insert into TEST_DEVICE1 (testid, deviceid)
values ('mpdr4zrasOIZmKkIyAYx', 'IXLoCQIDwQZOAHUFC86C');
insert into TEST_DEVICE1 (testid, deviceid)
values ('mrzK3eAs1XqUX96oTR7m', 'MGjVO1zDbAO2w73oBrkc');
insert into TEST_DEVICE1 (testid, deviceid)
values ('mrzK3eAs1XqUX96oTR7m', 'rOA770sBH123qEo311pQK910iKD413cEp772rDg975fJm652tL');
insert into TEST_DEVICE1 (testid, deviceid)
values ('mrzK3eAs1XqUX96oTR7m', 'tWqdhZ35Xr1iHTWFRSEU');
insert into TEST_DEVICE1 (testid, deviceid)
values ('nGJ946cFc182vLB284sKR537pCw931yIi289cII230iHr364tI', 'lWr533lXv721aBK118pKb919fDn453eOS528aDH826pDC618xN');
insert into TEST_DEVICE1 (testid, deviceid)
values ('nGJ946cFc182vLB284sKR537pCw931yIi289cII230iHr364tI', 'mXv686iMQ521wZT325rOy639xLS510rDX742dQt251qPW588kH');
insert into TEST_DEVICE1 (testid, deviceid)
values ('nL0rpQ69YntMSLvgutii', 'QeKJbfTGbDiziKfYs9wl');
insert into TEST_DEVICE1 (testid, deviceid)
values ('nTF181oPm469vXJ543lJF675gWh315hSz850ySy444vWa968nF', 'GHpWodjzloSJFyxUD3iy');
insert into TEST_DEVICE1 (testid, deviceid)
values ('ndXGXUhstPC1EeeqbH1l', 'K4nA7xpbSyhKrXhOU41q');
insert into TEST_DEVICE1 (testid, deviceid)
values ('nrVB7jGgDcJgBNSAtaEW', '8M1r72yes1gmdKxRBaBm');
insert into TEST_DEVICE1 (testid, deviceid)
values ('o4319U2hhwOyufSq7NWj', 'HIV0JOjZ7XiAxZ5DjkdH');
insert into TEST_DEVICE1 (testid, deviceid)
values ('o4319U2hhwOyufSq7NWj', 'QeKJbfTGbDiziKfYs9wl');
insert into TEST_DEVICE1 (testid, deviceid)
values ('oGk4KBJs4mtodOv4vxx8', '4sSFjP8UX7etKczXWMbJ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('oGk4KBJs4mtodOv4vxx8', 'QeKJbfTGbDiziKfYs9wl');
insert into TEST_DEVICE1 (testid, deviceid)
values ('oGk4KBJs4mtodOv4vxx8', 'mXv686iMQ521wZT325rOy639xLS510rDX742dQt251qPW588kH');
insert into TEST_DEVICE1 (testid, deviceid)
values ('oMGlM4NQ2rHoR3YK5gxP', 'Gk2nLTbu073X84FJ91Ab');
insert into TEST_DEVICE1 (testid, deviceid)
values ('oMGlM4NQ2rHoR3YK5gxP', 'f9xyxdEeYSKuR4PTnNm4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('oMGlM4NQ2rHoR3YK5gxP', 'hwRrRVESKlCPvczDmrye');
insert into TEST_DEVICE1 (testid, deviceid)
values ('oklbQJ1wtxpwrmrgpLbo', 'IXLoCQIDwQZOAHUFC86C');
insert into TEST_DEVICE1 (testid, deviceid)
values ('oklbQJ1wtxpwrmrgpLbo', 'NwclOhr0u7ek6KhjAP8s');
insert into TEST_DEVICE1 (testid, deviceid)
values ('oklbQJ1wtxpwrmrgpLbo', 'Uj8OQ61aVsE4oByuNND7');
insert into TEST_DEVICE1 (testid, deviceid)
values ('omsS22iNMYcHhpvh7J34', 'JivykJE9vWlpRA6FnVTh');
insert into TEST_DEVICE1 (testid, deviceid)
values ('p4EboI4uOwCeVTbhiSpy', 'OaJLMtviylz07HB9xIyU');
insert into TEST_DEVICE1 (testid, deviceid)
values ('p8lQWKfvrwHlcNSXzpzQ', 'k6Y9gRnh2sp1nWSNjXyd');
insert into TEST_DEVICE1 (testid, deviceid)
values ('pEuugs2eElJFUvGMrXJd', 'A1wktLKikDSi2B1ETztk');
insert into TEST_DEVICE1 (testid, deviceid)
values ('pEuugs2eElJFUvGMrXJd', 'SICDWVKkDDLQcDhcF7CU');
insert into TEST_DEVICE1 (testid, deviceid)
values ('pPyFpOA5R74yqP5I7iMQ', 'SvGx2JfnNFwoQypo0ssA');
insert into TEST_DEVICE1 (testid, deviceid)
values ('pPyFpOA5R74yqP5I7iMQ', 'lMlRIPJ8h9zOy8w8DBri');
insert into TEST_DEVICE1 (testid, deviceid)
values ('pds551YlSg3TPkPWUorW', 'NFjiU36M15pM8S71LMU4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('pds551YlSg3TPkPWUorW', 'zBy324vQv417iNY039jYD886cVz156dER348wDx334zSZ994bX');
insert into TEST_DEVICE1 (testid, deviceid)
values ('qDDhN5Wst4Tw0ydBgELC', 'TEJSDPMWwz4tFjpIP8XE');
insert into TEST_DEVICE1 (testid, deviceid)
values ('qDDhN5Wst4Tw0ydBgELC', 'iEvYsrJUPtxeeovrkT9x');
insert into TEST_DEVICE1 (testid, deviceid)
values ('qOA633hLq820hKv968cUv530uMo540pIe131dQL299hYy597jO', 'KUc6mLiK4T8aFZWYmYHi');
insert into TEST_DEVICE1 (testid, deviceid)
values ('qa9xRNalA8qCqXaiDUB6', 'X7PaplqOITK3SWmboFgB');
insert into TEST_DEVICE1 (testid, deviceid)
values ('qcinQy2C2ygVvxsptXEx', 'cUh379yGK495wQo771qND960iHh729dXv654iER847qXO678sN');
insert into TEST_DEVICE1 (testid, deviceid)
values ('qsgQNS5WNHpHUWZIgIYi', 'HqtiVl893v66wt9a8LYu');
insert into TEST_DEVICE1 (testid, deviceid)
values ('qsgQNS5WNHpHUWZIgIYi', 'WIKmAy5xQjw9OnFsbtLj');
insert into TEST_DEVICE1 (testid, deviceid)
values ('qsgQNS5WNHpHUWZIgIYi', 'eXemcHF0cHKJgM21Ifzb');
insert into TEST_DEVICE1 (testid, deviceid)
values ('rAPZaY9C1Z3X23nVVhC5', 'GJuUmCFHCM3Unltrgguu');
insert into TEST_DEVICE1 (testid, deviceid)
values ('rAPZaY9C1Z3X23nVVhC5', 'VeaAlT3zZXYrD8ewb9GQ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('rBE543qGR695cKa139sEu854lSZ473lMj492tGW413pIx019tX', 'SkFVHHso1Bo9Ejc4PwrH');
insert into TEST_DEVICE1 (testid, deviceid)
values ('rCq662eOA729pXN443jMH127mBZ734iRh238qUq974bFb935mX', 'UlHL6A0JlRPU8Y18zxHb');
insert into TEST_DEVICE1 (testid, deviceid)
values ('rNPkSTh5gZoMvGftkox1', '18lDbm0F0pT08L9pAb6P');
insert into TEST_DEVICE1 (testid, deviceid)
values ('rQA9xVsyIzvLDWiTA9b2', 'frT7nZPCsgY6FX1ejPAO');
insert into TEST_DEVICE1 (testid, deviceid)
values ('rVM887oGj122xUc872jKC125yWc596xEj459rXG668cEx313iY', 'JivykJE9vWlpRA6FnVTh');
insert into TEST_DEVICE1 (testid, deviceid)
values ('rVM887oGj122xUc872jKC125yWc596xEj459rXG668cEx313iY', 'qiEPmjrQzcVFi10mmOlj');
insert into TEST_DEVICE1 (testid, deviceid)
values ('rdoXmH7v1PSaBnrKFgRT', 'NBSh7wCDXwpjOIOdv4Nf');
insert into TEST_DEVICE1 (testid, deviceid)
values ('rjA816KlpPM2spvwpYRC', 'MBL8lPmqo9ukMVqTRzAp');
insert into TEST_DEVICE1 (testid, deviceid)
values ('rjA816KlpPM2spvwpYRC', 'e3WjYoKU4gsZDY1PezAq');
insert into TEST_DEVICE1 (testid, deviceid)
values ('rrHjZDjvwycCkonpQnUn', '1qMAFhbgbPMb7p8KJ4ui');
insert into TEST_DEVICE1 (testid, deviceid)
values ('sDb743wKq149jSQ115rOl994uGs944yXL094wYF848tZx843nW', 'QcCRjwOnnYmibqEAchfh');
insert into TEST_DEVICE1 (testid, deviceid)
values ('sKYiehFHn7j7ks4lObBf', 'fEs595bQe471kGH987aPw743nYD230zMi625pUs867qGv166oK');
insert into TEST_DEVICE1 (testid, deviceid)
values ('sKYiehFHn7j7ks4lObBf', 'nHp754nUe798gND412tZa350bOJ939oAe679hWR072vWL482eH');
insert into TEST_DEVICE1 (testid, deviceid)
values ('soIrFQoX81DKge5WbhA4', '8ymwd7Cm9aTp4GWUkRYZ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('tD5BQy0T2RUaYE4mVxk3', 'VeaAlT3zZXYrD8ewb9GQ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('tgQi68p4TUxmCPvrNts0', 'AOf3IBVESR1DTdPCovOl');
insert into TEST_DEVICE1 (testid, deviceid)
values ('tt9hJgoIIHBazDIPaqcA', 'WyAho3x6uqLZu4GdVPQQ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('twE4EaUzTV4g2lj6tM2O', 'tzhMeoUrxhUkDtCNNwhB');
insert into TEST_DEVICE1 (testid, deviceid)
values ('uIPX3Sxzi11yOopkogpM', '8ky3Sl1DwKH5dw0iuwwL');
insert into TEST_DEVICE1 (testid, deviceid)
values ('uLC568kDZ554eCB698mCN656gWU934qCT744tSA921kXm724mF', 'YfD6T6vZQjAIHWSl6LqO');
insert into TEST_DEVICE1 (testid, deviceid)
values ('uWmu6rBhfV0AAQluCh1K', '8Q0qLjFMnzZHfm8YXj3f');
insert into TEST_DEVICE1 (testid, deviceid)
values ('uWmu6rBhfV0AAQluCh1K', 'BYsYqbqkNlJKR73SnCYr');
insert into TEST_DEVICE1 (testid, deviceid)
values ('uWmu6rBhfV0AAQluCh1K', 'mzDOJN7jZHZE4gD2LD11');
insert into TEST_DEVICE1 (testid, deviceid)
values ('uWmu6rBhfV0AAQluCh1K', 'taixM5UCNKyzxI7QdRky');
insert into TEST_DEVICE1 (testid, deviceid)
values ('vBn388oQg748aXw243jDn088jWa637cZr816vBt415hJM219bT', 'tEAxHDyq3Pe1ixSqvXeZ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('vMfDoz33kG8se56D3S5V', 'NRqa7pMYcRLiBJ8JMizf');
insert into TEST_DEVICE1 (testid, deviceid)
values ('vfAO3ByH7navfLaXNLC8', 'W7KIfUx9l5hEDYjKtoE1');
insert into TEST_DEVICE1 (testid, deviceid)
values ('vummW3KL41jxKfGGvagj', 'cD7b4H2mTqKMYoDXBY7h');
insert into TEST_DEVICE1 (testid, deviceid)
values ('vummW3KL41jxKfGGvagj', 'fxECb9BGRqheA5NTqOO3');
insert into TEST_DEVICE1 (testid, deviceid)
values ('w6nAvprRWz7Vz0tbj8dl', 'Q11whnKRh0HzAOWX8mjp');
insert into TEST_DEVICE1 (testid, deviceid)
values ('w6nAvprRWz7Vz0tbj8dl', 'T9nx3Vhb3tvq86iuGaqx');
insert into TEST_DEVICE1 (testid, deviceid)
values ('wRj679rDl354zKC256rJV176cGE942rOy644aKe932qLO284uF', 'meOTZarSrFgE7ijK67RL');
insert into TEST_DEVICE1 (testid, deviceid)
values ('wUn9d5lN9gM8yl62t98D', 'YfD6T6vZQjAIHWSl6LqO');
insert into TEST_DEVICE1 (testid, deviceid)
values ('wUn9d5lN9gM8yl62t98D', 'esbrjKGP60KvChfZ7EQi');
insert into TEST_DEVICE1 (testid, deviceid)
values ('wZY639pJX437aHK987oLW065wMz118fAl599wUO774aXz091dO', 'dYCqiwEngdq1XikHDdx4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('x99F1QtzkPJRkNS0tm8B', 'ba48G3Z8AXtI5qJXo3jP');
insert into TEST_DEVICE1 (testid, deviceid)
values ('x99F1QtzkPJRkNS0tm8B', 'mBZGQYHw4Lh1Mk1potaP');
insert into TEST_DEVICE1 (testid, deviceid)
values ('xIQ267zWF373tKs922kYt560uVU921dTq561hEm839lHw424rX', 'nQQ652xPO968mFp198lUX311uNi686bWb295bXp443tID949cN');
insert into TEST_DEVICE1 (testid, deviceid)
values ('xQc268wQg946yZY783tNo823vGp497dRB644fAI626tRP817oR', 'WyAho3x6uqLZu4GdVPQQ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('xQc268wQg946yZY783tNo823vGp497dRB644fAI626tRP817oR', 'dwit3XcYjJ56odNfhK7S');
insert into TEST_DEVICE1 (testid, deviceid)
values ('xaMhHod5u1PQqG5Zm6th', 'dYCqiwEngdq1XikHDdx4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('y4a3OlWwasDYPhbbFLK9', 'mBZGQYHw4Lh1Mk1potaP');
insert into TEST_DEVICE1 (testid, deviceid)
values ('y7J4JMJGSQiPZHSo2Tws', 'xHpk7Yx89xGvVRakS5Ox');
insert into TEST_DEVICE1 (testid, deviceid)
values ('yVQ977uZs978lTc615qBn022tQE619aMb683oXA178wBL136vX', 'ft6zkU6OZrqKI8T4IxkR');
insert into TEST_DEVICE1 (testid, deviceid)
values ('yVQ977uZs978lTc615qBn022tQE619aMb683oXA178wBL136vX', 'wAylh4WerofToz0jZavK');
insert into TEST_DEVICE1 (testid, deviceid)
values ('yZd379aJg431pEO130nQV126oJW424oKj922uXy810nFt022yM', 'O8iC47zJvCzkvYVPn4Ba');
insert into TEST_DEVICE1 (testid, deviceid)
values ('yvC0RFv1ZCgDMJcIzQKf', 'dk7GxRPa0ILsAi7kzNw4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('z3lmdGvaamY3vjPUH5bg', 'jWT780kRV740fOU155eBm730aNU381eIJ375oUF017bEm917jH');
insert into TEST_DEVICE1 (testid, deviceid)
values ('zLg067pEe549qWF869gZO878lSm019uQz423oYd180sEv226hZ', 'dk7GxRPa0ILsAi7kzNw4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('zvNfeYtv874ZZC41zFb8', 'K8EhYasfhJGvTT5apgDy');
insert into TEST_DEVICE1 (testid, deviceid)
values ('0FPKhgiq2Au3lX3JAJEC', 'mAOgjTnXclwq7ypjwa0Q');
insert into TEST_DEVICE1 (testid, deviceid)
values ('0M5gMQS58Fn9TjjHxeJI', 'NN9ZyAYw8bUbN1MVOQ9L');
insert into TEST_DEVICE1 (testid, deviceid)
values ('0dzyAnYjiZBHdwMf8zQP', 'hGk289tXA167nGl954mHc578iKS041pEP826bYU427hBO225rM');
insert into TEST_DEVICE1 (testid, deviceid)
values ('0vpD3RUIijlXVQ15a0YH', 'cxY1fXeNSor5w6ulA4hF');
insert into TEST_DEVICE1 (testid, deviceid)
values ('0vpD3RUIijlXVQ15a0YH', 'lJQ199zTr122kAU680iJC457nYd651zCL921zYa483vOo645eL');
insert into TEST_DEVICE1 (testid, deviceid)
values ('0vpD3RUIijlXVQ15a0YH', 'sAdbjLCWS0DToL9KHoDX');
insert into TEST_DEVICE1 (testid, deviceid)
values ('1cjqlv29gmm9ZmMjq7qC', 'YXa2DMSRtg4z53ObwO5H');
insert into TEST_DEVICE1 (testid, deviceid)
values ('1dEC7GbGLoJ30UzrfKwM', 'Ah7h6eT8PniE6taIUxic');
insert into TEST_DEVICE1 (testid, deviceid)
values ('1dEC7GbGLoJ30UzrfKwM', 'pmR9fMfU2cgbYBqXuFUo');
insert into TEST_DEVICE1 (testid, deviceid)
values ('1lmRNBDuXqJL5wQycTPX', 'wM873rotDfcCJCToR4lQ');
commit;
prompt 200 records committed...
insert into TEST_DEVICE1 (testid, deviceid)
values ('2alYgFjgcM86bBymVDHG', '4Nqp1niQNTpZbYr1wbni');
insert into TEST_DEVICE1 (testid, deviceid)
values ('2alYgFjgcM86bBymVDHG', 'WyAho3x6uqLZu4GdVPQQ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('2alYgFjgcM86bBymVDHG', 'iKB738wAq315cYl631zRd281qTT274uXo911fRh122nNJ084fT');
insert into TEST_DEVICE1 (testid, deviceid)
values ('2alYgFjgcM86bBymVDHG', 'zBy324vQv417iNY039jYD886cVz156dER348wDx334zSZ994bX');
insert into TEST_DEVICE1 (testid, deviceid)
values ('2ngNlu02O4Ww2Jor3dO5', 'BYsYqbqkNlJKR73SnCYr');
insert into TEST_DEVICE1 (testid, deviceid)
values ('30C5xntrDaV1oY1PC1yi', 'ApSsiPb6MRMB20TwhiUY');
insert into TEST_DEVICE1 (testid, deviceid)
values ('30C5xntrDaV1oY1PC1yi', 'f0dHSSgrBKcvJEwYeBws');
insert into TEST_DEVICE1 (testid, deviceid)
values ('3COaGnfiv7vbCQhUlgwn', 'Ah7h6eT8PniE6taIUxic');
insert into TEST_DEVICE1 (testid, deviceid)
values ('3COaGnfiv7vbCQhUlgwn', 'KMjr93ysGB1lT0zzdCfj');
insert into TEST_DEVICE1 (testid, deviceid)
values ('3COaGnfiv7vbCQhUlgwn', 'OaJLMtviylz07HB9xIyU');
insert into TEST_DEVICE1 (testid, deviceid)
values ('3HDr949pZQb6ltnD36tt', 'HqtiVl893v66wt9a8LYu');
insert into TEST_DEVICE1 (testid, deviceid)
values ('3HDr949pZQb6ltnD36tt', 'TaTAWulEEqGoqaqZvXdk');
insert into TEST_DEVICE1 (testid, deviceid)
values ('3Wd8m2lVBQy4tek98FB7', 'FmJ3a1B4Jho5sp0FEvCA');
insert into TEST_DEVICE1 (testid, deviceid)
values ('3Wd8m2lVBQy4tek98FB7', 'XQkanGduqGvx2X8cYa52');
insert into TEST_DEVICE1 (testid, deviceid)
values ('3Y8kEqNG0EVwLKqPjNig', 'GGWEtwXfll2ofBhf8UzC');
insert into TEST_DEVICE1 (testid, deviceid)
values ('3Y8kEqNG0EVwLKqPjNig', 'f4SQ76EULKwxuwrSA0bw');
insert into TEST_DEVICE1 (testid, deviceid)
values ('3tQw4wxwfAocdGMFokum', 'MQilacDc7WdMj2dORHOW');
insert into TEST_DEVICE1 (testid, deviceid)
values ('448anVd5h1XF4ctrNTJs', 'NFjiU36M15pM8S71LMU4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('448anVd5h1XF4ctrNTJs', 'lRlekapedBaa3h6tI8ZK');
insert into TEST_DEVICE1 (testid, deviceid)
values ('4X0b6fRK4EvsPRqzzDOA', 'Lguo2KKWXFYEgpyoj1eE');
insert into TEST_DEVICE1 (testid, deviceid)
values ('4X0b6fRK4EvsPRqzzDOA', 'TR5OYgsUMAVdpgn386Es');
insert into TEST_DEVICE1 (testid, deviceid)
values ('4X0b6fRK4EvsPRqzzDOA', 'ZUcHKS0IPEywzGt0xpMy');
insert into TEST_DEVICE1 (testid, deviceid)
values ('4tLTZkUsfYSEeIUde6Kk', 'W7KIfUx9l5hEDYjKtoE1');
insert into TEST_DEVICE1 (testid, deviceid)
values ('4tLTZkUsfYSEeIUde6Kk', 'aG8voTCFXY7NrGcQraj3');
insert into TEST_DEVICE1 (testid, deviceid)
values ('5iF3SkOKEWWocH5DGa6p', '34tJteNGx3z4xUmYHXOY');
insert into TEST_DEVICE1 (testid, deviceid)
values ('5iF3SkOKEWWocH5DGa6p', 'TUTHH7HWdHDK8RMFIvnR');
insert into TEST_DEVICE1 (testid, deviceid)
values ('5kuH1JL6TRBGs5R20i26', 'OxjiLGvCo8fBcaezWnjW');
insert into TEST_DEVICE1 (testid, deviceid)
values ('5mpdI59GcbPTHIFQZXEL', 'QGCCmgwYvyKcH62VB80F');
insert into TEST_DEVICE1 (testid, deviceid)
values ('5mpdI59GcbPTHIFQZXEL', 'pfZcR25AfI1jWa27fgt8');
insert into TEST_DEVICE1 (testid, deviceid)
values ('654lFb4IEosiQzgBEb5A', 'IXLoCQIDwQZOAHUFC86C');
insert into TEST_DEVICE1 (testid, deviceid)
values ('654lFb4IEosiQzgBEb5A', 'SkFVHHso1Bo9Ejc4PwrH');
insert into TEST_DEVICE1 (testid, deviceid)
values ('654lFb4IEosiQzgBEb5A', 'dvFgbovgHZW8xmLspbs8');
insert into TEST_DEVICE1 (testid, deviceid)
values ('654lFb4IEosiQzgBEb5A', 'sAdbjLCWS0DToL9KHoDX');
insert into TEST_DEVICE1 (testid, deviceid)
values ('6GMI1cVmKVEz2rdEFXzG', 'mJ7tBxDTNALHfCcLcKEO');
insert into TEST_DEVICE1 (testid, deviceid)
values ('6MuA97VatgftQMWyEbUj', '2Fj2QuBEU3QmP8qSMBHV');
insert into TEST_DEVICE1 (testid, deviceid)
values ('6MuA97VatgftQMWyEbUj', 'M8n9wcIrzzgr5K0U4eYI');
insert into TEST_DEVICE1 (testid, deviceid)
values ('6Q5kRLteTmJl8NHEzHrK', 'EUBr9OECQRHTtisH4yDX');
insert into TEST_DEVICE1 (testid, deviceid)
values ('6UcgpSngEiqUGXrxHeoH', 'HIV0JOjZ7XiAxZ5DjkdH');
insert into TEST_DEVICE1 (testid, deviceid)
values ('6YogdvPqm0qv47UhBQbF', 'lWr533lXv721aBK118pKb919fDn453eOS528aDH826pDC618xN');
insert into TEST_DEVICE1 (testid, deviceid)
values ('6dXTBxc00Ycbob45y5UK', '0o3InEATBqky2vJOibhK');
insert into TEST_DEVICE1 (testid, deviceid)
values ('6dXTBxc00Ycbob45y5UK', 'BnmHROSwRUQ0VDtJqW9s');
insert into TEST_DEVICE1 (testid, deviceid)
values ('6dXTBxc00Ycbob45y5UK', 'GJj4hdcomVffJTLKsqgA');
insert into TEST_DEVICE1 (testid, deviceid)
values ('6frcU4LsrmBgXfd0saU6', '18lDbm0F0pT08L9pAb6P');
insert into TEST_DEVICE1 (testid, deviceid)
values ('6y0zf6LjtRNezxaZShYX', 'EyBzhXbzEJ8ppzNzzPVO');
insert into TEST_DEVICE1 (testid, deviceid)
values ('6y0zf6LjtRNezxaZShYX', 'P3hYahrAqjy54JruGBIQ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('70okJpRvnXjo1wvZbLy5', 'pfZcR25AfI1jWa27fgt8');
insert into TEST_DEVICE1 (testid, deviceid)
values ('70okJpRvnXjo1wvZbLy5', 'raPgsWLXWN3l3QZkr2Tv');
insert into TEST_DEVICE1 (testid, deviceid)
values ('71TaVgQySnneP1wsEsmb', 'P1vRpYpPQoI0MPZUaKDi');
insert into TEST_DEVICE1 (testid, deviceid)
values ('71TaVgQySnneP1wsEsmb', 'ZGckr2KcIcxuHCyY8ou7');
insert into TEST_DEVICE1 (testid, deviceid)
values ('71TaVgQySnneP1wsEsmb', 'cD7b4H2mTqKMYoDXBY7h');
insert into TEST_DEVICE1 (testid, deviceid)
values ('71TaVgQySnneP1wsEsmb', 'ombfWRm1sjIGOuObKz5K');
insert into TEST_DEVICE1 (testid, deviceid)
values ('71TaVgQySnneP1wsEsmb', 'pOmuSefuIvJ5x8b6Bg26');
insert into TEST_DEVICE1 (testid, deviceid)
values ('886AKSq63LfkPkQQEkb6', 'NRqa7pMYcRLiBJ8JMizf');
insert into TEST_DEVICE1 (testid, deviceid)
values ('886AKSq63LfkPkQQEkb6', 'Tl6ef3EOPrWfEJQZj4l4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('8A1R3gez5DK04BhQenpP', 'TEJSDPMWwz4tFjpIP8XE');
insert into TEST_DEVICE1 (testid, deviceid)
values ('8Lx1IPHISZWmsG2MRvar', 'IB53Fh6I56fivpSlEQEy');
insert into TEST_DEVICE1 (testid, deviceid)
values ('8Lx1IPHISZWmsG2MRvar', 'QGCCmgwYvyKcH62VB80F');
insert into TEST_DEVICE1 (testid, deviceid)
values ('8MnVrtbkPQJRN3wGJ7VM', 'kTN283zYV335eYI054oRM816dIA887wZv710oUT754yXj164uI');
insert into TEST_DEVICE1 (testid, deviceid)
values ('8MnVrtbkPQJRN3wGJ7VM', 'uK0AdgGAIFE3ih8GdYFO');
insert into TEST_DEVICE1 (testid, deviceid)
values ('8eoUoervnsxf4AY6cGcR', '7nuqmAJj29MDPNk31Tsr');
insert into TEST_DEVICE1 (testid, deviceid)
values ('8eoUoervnsxf4AY6cGcR', 'SkFVHHso1Bo9Ejc4PwrH');
insert into TEST_DEVICE1 (testid, deviceid)
values ('8eoUoervnsxf4AY6cGcR', 'gritD2XQAJgTZPt6cgRn');
insert into TEST_DEVICE1 (testid, deviceid)
values ('8yudrGJkL1hg17Ozg3qF', 'frT7nZPCsgY6FX1ejPAO');
insert into TEST_DEVICE1 (testid, deviceid)
values ('952jyjjWt0tcBgJ6I9TJ', 'K8EhYasfhJGvTT5apgDy');
insert into TEST_DEVICE1 (testid, deviceid)
values ('952jyjjWt0tcBgJ6I9TJ', 'fSFrfWomAQKsKIiMfO7p');
insert into TEST_DEVICE1 (testid, deviceid)
values ('9J0OlsEWYhnfj3X8P8bp', 'sy5Y5g1ao4Qbn2fUtbSM');
insert into TEST_DEVICE1 (testid, deviceid)
values ('9dRQTXfeb2EHG8AIfdo4', 'MHRvIrODdBxuL6zAA3BZ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('9kjynS4NYMYtT3lHpJKA', 'dk7GxRPa0ILsAi7kzNw4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('9uL80wbwkdhdtT4kPeVb', 'EyBzhXbzEJ8ppzNzzPVO');
insert into TEST_DEVICE1 (testid, deviceid)
values ('9uL80wbwkdhdtT4kPeVb', 'L9qe00I3L6whVkljVmaw');
insert into TEST_DEVICE1 (testid, deviceid)
values ('9zGC1XJc9f5gEtLkQndp', 'q0O5KYLHRwWhRUoLkDKb');
insert into TEST_DEVICE1 (testid, deviceid)
values ('9zGC1XJc9f5gEtLkQndp', 'taixM5UCNKyzxI7QdRky');
insert into TEST_DEVICE1 (testid, deviceid)
values ('9zGC1XJc9f5gEtLkQndp', 'xHpk7Yx89xGvVRakS5Ox');
insert into TEST_DEVICE1 (testid, deviceid)
values ('AKKPS3buU7lWdVyTZ5g3', 'e4YaXX8nIEpOCmvo7bmm');
insert into TEST_DEVICE1 (testid, deviceid)
values ('Asm9Aeyf8XSavFLLlkbz', 'zKI3CAQqJIdQoMTwsqUz');
insert into TEST_DEVICE1 (testid, deviceid)
values ('B1knVMXshql0bl81OlLM', 'VSGNUhHSO7qfifaHAcTZ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('B1knVMXshql0bl81OlLM', 'YrjOfUWiN5fKxWA9LxzH');
insert into TEST_DEVICE1 (testid, deviceid)
values ('B1knVMXshql0bl81OlLM', 'eSk668kVA019eTW111gSt290sSH438gUo619iIt667sOr363fL');
insert into TEST_DEVICE1 (testid, deviceid)
values ('BACPd7YA7pRV9OXP67Tj', 'VSGNUhHSO7qfifaHAcTZ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('BTs2qnWO8CxFzxG201xb', '8ymwd7Cm9aTp4GWUkRYZ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('BTs2qnWO8CxFzxG201xb', 'dvFgbovgHZW8xmLspbs8');
insert into TEST_DEVICE1 (testid, deviceid)
values ('BTs2qnWO8CxFzxG201xb', 'jAL150gIE119yAo413gLf398cEq919aEv780xHn528sOf387tD');
insert into TEST_DEVICE1 (testid, deviceid)
values ('BvYrxmG8B4mdqv8oygar', '58dZj4WYdD99eejuPcpd');
insert into TEST_DEVICE1 (testid, deviceid)
values ('C7dzReqMKmVp3i5oE56s', '3iqH728bBOK0OYFDVD8c');
insert into TEST_DEVICE1 (testid, deviceid)
values ('CFjkZLKg0k7i31Vb0cXq', 'HIV0JOjZ7XiAxZ5DjkdH');
insert into TEST_DEVICE1 (testid, deviceid)
values ('CFjkZLKg0k7i31Vb0cXq', 'KQmJWXf9PcKFXXiRJWgB');
insert into TEST_DEVICE1 (testid, deviceid)
values ('CFjkZLKg0k7i31Vb0cXq', 'KUc6mLiK4T8aFZWYmYHi');
insert into TEST_DEVICE1 (testid, deviceid)
values ('CFjkZLKg0k7i31Vb0cXq', 'XQkanGduqGvx2X8cYa52');
insert into TEST_DEVICE1 (testid, deviceid)
values ('VDy9ai99wTWrR6Lqrta3', '3jWxxPOgNosSDx4U6Cto');
insert into TEST_DEVICE1 (testid, deviceid)
values ('VDy9ai99wTWrR6Lqrta3', 'L7HBFaQ53xlaYpAtWHA2');
insert into TEST_DEVICE1 (testid, deviceid)
values ('VDy9ai99wTWrR6Lqrta3', 'ZUcHKS0IPEywzGt0xpMy');
insert into TEST_DEVICE1 (testid, deviceid)
values ('VGkSlvk9OV5Mv0uf1tl2', '961KcZSuRAqBJwu9xLS7');
insert into TEST_DEVICE1 (testid, deviceid)
values ('VIaQ2dYXuvnXnZEUgY87', 'uJ5ry4skrj9wkDHsDCSC');
insert into TEST_DEVICE1 (testid, deviceid)
values ('VsWdxtX95tovv9vfhkIa', 'NBSh7wCDXwpjOIOdv4Nf');
insert into TEST_DEVICE1 (testid, deviceid)
values ('VsWdxtX95tovv9vfhkIa', 'ft6zkU6OZrqKI8T4IxkR');
insert into TEST_DEVICE1 (testid, deviceid)
values ('VzdCjuL34RyM4lqlCVdB', 'KMjr93ysGB1lT0zzdCfj');
insert into TEST_DEVICE1 (testid, deviceid)
values ('VzdCjuL34RyM4lqlCVdB', 'evFPXlaS50TNtcl3wQA6');
insert into TEST_DEVICE1 (testid, deviceid)
values ('W0TcQjOG9v5RRq3vVb9N', 'ft6zkU6OZrqKI8T4IxkR');
insert into TEST_DEVICE1 (testid, deviceid)
values ('W0TcQjOG9v5RRq3vVb9N', 'pmR9fMfU2cgbYBqXuFUo');
insert into TEST_DEVICE1 (testid, deviceid)
values ('W9N7JCIeXA9UlXgYUZ8g', 'Q9AlgKi2VQPgvULqdZaQ');
commit;
prompt 300 records committed...
insert into TEST_DEVICE1 (testid, deviceid)
values ('WY7tGrjfCj10TaDsjVxY', 'MGjVO1zDbAO2w73oBrkc');
insert into TEST_DEVICE1 (testid, deviceid)
values ('WZ4a1gVhJGYTzbDNVxLe', 'tzhMeoUrxhUkDtCNNwhB');
insert into TEST_DEVICE1 (testid, deviceid)
values ('WkVYauOUfI4EhM5QHbNb', 'L7HBFaQ53xlaYpAtWHA2');
insert into TEST_DEVICE1 (testid, deviceid)
values ('Wp0iFrqohIG6himb6fJV', 'rCtYfzy2lJ9ZD7fVWsm3');
insert into TEST_DEVICE1 (testid, deviceid)
values ('X6JwVnMkA7H1DRoe1DrX', 'BnmHROSwRUQ0VDtJqW9s');
insert into TEST_DEVICE1 (testid, deviceid)
values ('XopsLOir619dpBGxmJ5D', 'FU8B0P61r8v6IfBeedlh');
insert into TEST_DEVICE1 (testid, deviceid)
values ('XopsLOir619dpBGxmJ5D', 'dTpruMPSvrzvVxOJfmGY');
insert into TEST_DEVICE1 (testid, deviceid)
values ('YTWWjJjczCRZChgN1tAz', 'ZUcHKS0IPEywzGt0xpMy');
insert into TEST_DEVICE1 (testid, deviceid)
values ('YTWWjJjczCRZChgN1tAz', 'ba48G3Z8AXtI5qJXo3jP');
insert into TEST_DEVICE1 (testid, deviceid)
values ('YTWWjJjczCRZChgN1tAz', 'xHmaZn45Kuy3sWIFa2K6');
insert into TEST_DEVICE1 (testid, deviceid)
values ('YhVoJ8eJ0X4233h74uTx', 'cxY1fXeNSor5w6ulA4hF');
insert into TEST_DEVICE1 (testid, deviceid)
values ('YuWzvCfhX8fltWSDKI9T', 'NfXDBGYxuusnarzk2r5D');
insert into TEST_DEVICE1 (testid, deviceid)
values ('YuWzvCfhX8fltWSDKI9T', 'RM5iFzNuudZPOHG068SL');
insert into TEST_DEVICE1 (testid, deviceid)
values ('a0moKtMAJToJ9DiuxH4Y', 'JivykJE9vWlpRA6FnVTh');
insert into TEST_DEVICE1 (testid, deviceid)
values ('aazLUdsyTxCh7qhkYlHF', 'dk7GxRPa0ILsAi7kzNw4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('b8XrBN7QTOHUxOUjjC8F', 'dk7GxRPa0ILsAi7kzNw4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('b8XrBN7QTOHUxOUjjC8F', 'pGy324zBB780aTE360jDf468hSQ154jUT321sSs755gYW486zS');
insert into TEST_DEVICE1 (testid, deviceid)
values ('bHa742tCb433vKK962vVu851aEC110kHj815yLd157cDh560iS', '9dRI118JtyYNwVMZ7ff2');
insert into TEST_DEVICE1 (testid, deviceid)
values ('bNmO5f0iEHUgKZXfFAi5', '4JA1CUueKS9gvHXM3MTE');
insert into TEST_DEVICE1 (testid, deviceid)
values ('bNmO5f0iEHUgKZXfFAi5', 'gUs282uDU173zSa523eAh120aWt868mAW777dLg124hHW376hF');
insert into TEST_DEVICE1 (testid, deviceid)
values ('bQK664xSL473nDC630gML453bBT610yZB669iRF678fDX935fD', 'eMt579eIm627sQp458nJs356nPk650yMY762dMn055cIT164iK');
insert into TEST_DEVICE1 (testid, deviceid)
values ('bcC2rcFCghaUmFXxbSLz', 'K4nA7xpbSyhKrXhOU41q');
insert into TEST_DEVICE1 (testid, deviceid)
values ('bcC2rcFCghaUmFXxbSLz', 'Lguo2KKWXFYEgpyoj1eE');
insert into TEST_DEVICE1 (testid, deviceid)
values ('bcC2rcFCghaUmFXxbSLz', 'ux61GdY3kzAfPVFXgeej');
insert into TEST_DEVICE1 (testid, deviceid)
values ('bk10XGnAhcCEt2JyAlRr', 'KCifV23WFXnCYapeGB5S');
insert into TEST_DEVICE1 (testid, deviceid)
values ('bk10XGnAhcCEt2JyAlRr', 'KQmJWXf9PcKFXXiRJWgB');
insert into TEST_DEVICE1 (testid, deviceid)
values ('bk10XGnAhcCEt2JyAlRr', 'd880XjhYxnJxMSVQRoug');
insert into TEST_DEVICE1 (testid, deviceid)
values ('bxyyeq59EsoMvggiEWbF', '1suLrYsJRcaafbQpdMGg');
insert into TEST_DEVICE1 (testid, deviceid)
values ('bxyyeq59EsoMvggiEWbF', 'JwNbiSKcKHdEPy8t1RvP');
insert into TEST_DEVICE1 (testid, deviceid)
values ('bxyyeq59EsoMvggiEWbF', 'fxECb9BGRqheA5NTqOO3');
insert into TEST_DEVICE1 (testid, deviceid)
values ('cJT396yDC652aNC326hCM110cTY084lEs675cSa063nWE845yS', 'wYo692lIt785nCa478vYm045nAw414gUt764fXj163nSt580kK');
insert into TEST_DEVICE1 (testid, deviceid)
values ('cKb141wXD558wXi578oVj689zPq693kGH257dLH870lFA088yN', 'qaiTQ63arfHMx5BaDeF9');
insert into TEST_DEVICE1 (testid, deviceid)
values ('cOKXWB4ccA73zsRo9B57', '9PyHTF9fiOIenl9xT7Jm');
insert into TEST_DEVICE1 (testid, deviceid)
values ('cpJqQxA6NgQbqvsJcW1U', 'Jkl88ZPcQHL8I6QHzV4E');
insert into TEST_DEVICE1 (testid, deviceid)
values ('d8Dt9pqcy1rdI730DOzP', 'NwclOhr0u7ek6KhjAP8s');
insert into TEST_DEVICE1 (testid, deviceid)
values ('d8Dt9pqcy1rdI730DOzP', 'OaJLMtviylz07HB9xIyU');
insert into TEST_DEVICE1 (testid, deviceid)
values ('d8Dt9pqcy1rdI730DOzP', 'PQYwfSwGBRLYnrZBFUBH');
insert into TEST_DEVICE1 (testid, deviceid)
values ('dKa797zTc512kLg331aQa622kWP895gBj935mRg158mFN485vS', '5n5plfO7Uw7qrQbnlRvt');
insert into TEST_DEVICE1 (testid, deviceid)
values ('dKa797zTc512kLg331aQa622kWP895gBj935mRg158mFN485vS', 'OaJLMtviylz07HB9xIyU');
insert into TEST_DEVICE1 (testid, deviceid)
values ('dXk659wOE111zJl537cIV572wRP471nCt896hZc515nJk590pO', 'aRq239bWc744iPX032vYt722mOK220mGs743jPz879bDi791rD');
insert into TEST_DEVICE1 (testid, deviceid)
values ('dXk659wOE111zJl537cIV572wRP471nCt896hZc515nJk590pO', 'esbrjKGP60KvChfZ7EQi');
insert into TEST_DEVICE1 (testid, deviceid)
values ('eDd819sQT191eFi861iFf067hVg329dWS219rGT690xPz545dG', 'pckyYbXQdY3743MNxMAk');
insert into TEST_DEVICE1 (testid, deviceid)
values ('eJD821eWI585cLw347sKM240kWA880fFv157aBl598lAV721dL', 'IXLoCQIDwQZOAHUFC86C');
insert into TEST_DEVICE1 (testid, deviceid)
values ('eUj552oWk057pOz129iLn784gIi327lNr561sLl613lCL296cI', 'nHi339aMy330iIC911kMt475lHX321tTa123mLj385cEW844zC');
insert into TEST_DEVICE1 (testid, deviceid)
values ('eXtToBKJQLTouEceHUMn', 'FU8B0P61r8v6IfBeedlh');
insert into TEST_DEVICE1 (testid, deviceid)
values ('engIgxZTgU4kL4za0KKQ', 'GGWEtwXfll2ofBhf8UzC');
insert into TEST_DEVICE1 (testid, deviceid)
values ('engIgxZTgU4kL4za0KKQ', 'urAWDugsy3Gq63GJwXoD');
insert into TEST_DEVICE1 (testid, deviceid)
values ('fGM368xEW331mPp856mPS195rJA762nDx488gEG038iMz817cH', 'gyh7lJXZdDJmW8RUTttp');
insert into TEST_DEVICE1 (testid, deviceid)
values ('fKC142ySu558nQw114cNM849nWq238hKh589wXn812wNa438fM', 'dAE913sUG017nJe415qHy431oSJ847gCa027fEb288bMW562rV');
insert into TEST_DEVICE1 (testid, deviceid)
values ('fLOzvnQH2EjEsOZJ9Gnw', '18lDbm0F0pT08L9pAb6P');
insert into TEST_DEVICE1 (testid, deviceid)
values ('fLOzvnQH2EjEsOZJ9Gnw', 'aG8voTCFXY7NrGcQraj3');
insert into TEST_DEVICE1 (testid, deviceid)
values ('ftPSVoWEbJybMpXDVmsJ', '9dRI118JtyYNwVMZ7ff2');
insert into TEST_DEVICE1 (testid, deviceid)
values ('g2x0z7vnTqCVyunzM3sf', 'H3Nc5J7LvhMKZBGMIrXx');
insert into TEST_DEVICE1 (testid, deviceid)
values ('g2x0z7vnTqCVyunzM3sf', 'wuiubA2UJzRYBJSqEtA8');
insert into TEST_DEVICE1 (testid, deviceid)
values ('gMG575hUG787fLL574vBq010wMl212lLi739vOe424fXE892rH', 'lTi421nSk538sXu948vYs540vSl154fYF711aMt626hCN923tW');
insert into TEST_DEVICE1 (testid, deviceid)
values ('gSTyTjimzh4ttwGpU5ij', 'gcZRRWdAL8F2lN2e7K9l');
insert into TEST_DEVICE1 (testid, deviceid)
values ('ghPXY3iqhvGcLgGO5W1q', 'qiEPmjrQzcVFi10mmOlj');
insert into TEST_DEVICE1 (testid, deviceid)
values ('ghPXY3iqhvGcLgGO5W1q', 'uK0AdgGAIFE3ih8GdYFO');
insert into TEST_DEVICE1 (testid, deviceid)
values ('gq5V3GEX8J6umx7ILxt0', '7nuqmAJj29MDPNk31Tsr');
insert into TEST_DEVICE1 (testid, deviceid)
values ('h42FE7PVrCA6nGDoQF3G', 'EyBzhXbzEJ8ppzNzzPVO');
insert into TEST_DEVICE1 (testid, deviceid)
values ('h42FE7PVrCA6nGDoQF3G', 'IB53Fh6I56fivpSlEQEy');
insert into TEST_DEVICE1 (testid, deviceid)
values ('h42FE7PVrCA6nGDoQF3G', 'ZMEMvTVkYalSL6uVmd0U');
insert into TEST_DEVICE1 (testid, deviceid)
values ('h9jfoIVpzzHIHNYkrtSp', '03waK1eR32NJaiv9OjMi');
insert into TEST_DEVICE1 (testid, deviceid)
values ('h9jfoIVpzzHIHNYkrtSp', 'Dt7CfR13I5QPel8AMwLL');
insert into TEST_DEVICE1 (testid, deviceid)
values ('h9jfoIVpzzHIHNYkrtSp', 'TEJSDPMWwz4tFjpIP8XE');
insert into TEST_DEVICE1 (testid, deviceid)
values ('hDr922tOO766pYj794lDw357rNZ614iQn563yKj792dWI089nL', 'vFh171oTa222mWr244iSY389cKD418pHr169qWO076tZV082xT');
insert into TEST_DEVICE1 (testid, deviceid)
values ('hLx511wTn753gAv290iGA669iNb934eEz473tJa830xRM561aS', 'nQQ652xPO968mFp198lUX311uNi686bWb295bXp443tID949cN');
insert into TEST_DEVICE1 (testid, deviceid)
values ('hkHzC0oXSne8mMj3cJhI', 'JivykJE9vWlpRA6FnVTh');
insert into TEST_DEVICE1 (testid, deviceid)
values ('hkHzC0oXSne8mMj3cJhI', 'K5wi6p7HDshC9IHttdt4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('iBL478tYA422zHi734aFk442xCN510kGa275iSN474sZv254wW', 'ktCL4nMRHmIDuZpTSJck');
insert into TEST_DEVICE1 (testid, deviceid)
values ('iDbsx4R4PQidkYhPteoB', 'Frz28ycyuf66xSd0Nf6s');
insert into TEST_DEVICE1 (testid, deviceid)
values ('iDbsx4R4PQidkYhPteoB', 'JivykJE9vWlpRA6FnVTh');
insert into TEST_DEVICE1 (testid, deviceid)
values ('iDbsx4R4PQidkYhPteoB', 'TK5Kgf9NMDvWO73r5Onm');
insert into TEST_DEVICE1 (testid, deviceid)
values ('iDbsx4R4PQidkYhPteoB', 'f9xyxdEeYSKuR4PTnNm4');
insert into TEST_DEVICE1 (testid, deviceid)
values ('iDbsx4R4PQidkYhPteoB', 'vwWr9YQj43q4V4OEJnxI');
insert into TEST_DEVICE1 (testid, deviceid)
values ('iTm526vOz354iCE660iCV166gUB889pKc014bVE318rGW892qQ', 'IB53Fh6I56fivpSlEQEy');
insert into TEST_DEVICE1 (testid, deviceid)
values ('igzgToqb48KmvZjH8xjx', 'GwVpUKoYwxm1S6ozlE6X');
insert into TEST_DEVICE1 (testid, deviceid)
values ('igzgToqb48KmvZjH8xjx', 'KUc6mLiK4T8aFZWYmYHi');
insert into TEST_DEVICE1 (testid, deviceid)
values ('igzgToqb48KmvZjH8xjx', 'Uj8OQ61aVsE4oByuNND7');
insert into TEST_DEVICE1 (testid, deviceid)
values ('j2WrRgkdCQERmSRkOLsY', '7nuqmAJj29MDPNk31Tsr');
insert into TEST_DEVICE1 (testid, deviceid)
values ('j2WrRgkdCQERmSRkOLsY', 'MQilacDc7WdMj2dORHOW');
insert into TEST_DEVICE1 (testid, deviceid)
values ('j2WrRgkdCQERmSRkOLsY', 'jTV718uPr846wIB933gWx760fAu549tVI320kFQ477sYl616eB');
insert into TEST_DEVICE1 (testid, deviceid)
values ('j2WrRgkdCQERmSRkOLsY', 'nHp754nUe798gND412tZa350bOJ939oAe679hWR072vWL482eH');
insert into TEST_DEVICE1 (testid, deviceid)
values ('jXHSJUwVBAHb2TnBMR4M', '8ymwd7Cm9aTp4GWUkRYZ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('jXHSJUwVBAHb2TnBMR4M', 'vzaI6njXzib5l88YrVXS');
insert into TEST_DEVICE1 (testid, deviceid)
values ('jYw846qUW922gAQ235nGs258lBu398oXz381tRD512pNJ812pF', '7nuqmAJj29MDPNk31Tsr');
insert into TEST_DEVICE1 (testid, deviceid)
values ('jooxV0uXzMkLubienmxm', '4sSFjP8UX7etKczXWMbJ');
insert into TEST_DEVICE1 (testid, deviceid)
values ('kV3wxV0wjuwOx4jnYdQE', 'PZ9SfwrlZ0JBk9flxuai');
insert into TEST_DEVICE1 (testid, deviceid)
values ('kezX82Vtplhs3b6hwl8t', 'sy5Y5g1ao4Qbn2fUtbSM');
insert into TEST_DEVICE1 (testid, deviceid)
values ('kkEE7H8690n1lK2HPfm5', 'k6Y9gRnh2sp1nWSNjXyd');
insert into TEST_DEVICE1 (testid, deviceid)
values ('kkEE7H8690n1lK2HPfm5', 'lMlRIPJ8h9zOy8w8DBri');
insert into TEST_DEVICE1 (testid, deviceid)
values ('ksnGSIRhTxv1oxLDz7z7', 'KVvPcvCuI4JMGnysn2iz');
insert into TEST_DEVICE1 (testid, deviceid)
values ('ksnGSIRhTxv1oxLDz7z7', 'Udi8RJoZ2mrBlP7520V2');
insert into TEST_DEVICE1 (testid, deviceid)
values ('ksnGSIRhTxv1oxLDz7z7', 'w8W8MdjEpelam0GoEoT2');
commit;
prompt 394 records loaded
prompt Enabling foreign key constraints for BLOOD_DONATION1...
alter table BLOOD_DONATION1 enable constraint SYS_C00708277;
prompt Enabling foreign key constraints for DEVICETEST_TUBE1...
alter table DEVICETEST_TUBE1 enable constraint SYS_C00708269;
alter table DEVICETEST_TUBE1 enable constraint SYS_C00708270;
prompt Enabling foreign key constraints for REFRIGERATOR1...
alter table REFRIGERATOR1 enable constraint SYS_C00708291;
alter table REFRIGERATOR1 enable constraint SYS_C00708292;
prompt Enabling foreign key constraints for STOVE1...
alter table STOVE1 enable constraint SYS_C00708286;
prompt Enabling foreign key constraints for TEST_DEVICE1...
alter table TEST_DEVICE1 enable constraint SYS_C00708264;
alter table TEST_DEVICE1 enable constraint SYS_C00708265;
prompt Enabling triggers for TEST_1...
alter table TEST_1 enable all triggers;
prompt Enabling triggers for BLOOD_DONATION1...
alter table BLOOD_DONATION1 enable all triggers;
prompt Enabling triggers for DEVICE1...
alter table DEVICE1 enable all triggers;
prompt Enabling triggers for TEST_TUBE1...
alter table TEST_TUBE1 enable all triggers;
prompt Enabling triggers for DEVICETEST_TUBE1...
alter table DEVICETEST_TUBE1 enable all triggers;
prompt Enabling triggers for REFRIGERATOR1...
alter table REFRIGERATOR1 enable all triggers;
prompt Enabling triggers for STOVE1...
alter table STOVE1 enable all triggers;
prompt Enabling triggers for TEST_DEVICE1...
alter table TEST_DEVICE1 enable all triggers;
