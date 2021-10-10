/*************************************************
Creates and populates a MySQL database 
*************************************************/

DROP DATABASE IF EXISTS `global_calender`;
CREATE DATABASE `global_calender`;
USE `global_calender`;

CREATE TABLE `category` (
  `idcategory` int NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) NOT NULL,
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `client` (
  `idclient` int NOT NULL AUTO_INCREMENT,
  `clientname` varchar(255) NOT NULL,
  PRIMARY KEY (`idclient`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `region` (
  `idregion` int NOT NULL AUTO_INCREMENT,
  `region` varchar(5) NOT NULL,
  PRIMARY KEY (`idregion`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `instructor` (
  `idinstructor` int NOT NULL AUTO_INCREMENT,
  `instructorname` varchar(255) NOT NULL,
  `idfkregion` int NOT NULL,
  PRIMARY KEY (`idinstructor`),
  FOREIGN KEY (idfkregion) REFERENCES region(idregion)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `salesteam` (
  `idsalesteam` int NOT NULL AUTO_INCREMENT,
  `team` varchar(255) NOT NULL,
  PRIMARY KEY (`idsalesteam`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `status` (
  `idstatus` int NOT NULL AUTO_INCREMENT,
  `statusname` varchar(255) NOT NULL,
  PRIMARY KEY (`idstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `timezone` (
  `idtimezone` int NOT NULL AUTO_INCREMENT,
  `timezone` varchar(255) NOT NULL,
  PRIMARY KEY (`idtimezone`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pathway` (
  `idpathway` int NOT NULL AUTO_INCREMENT,
  `idfkcategory` int,
  `pathway` varchar(255) NOT NULL,
  PRIMARY KEY (`idpathway`),
  FOREIGN KEY (idfkcategory) REFERENCES category(idcategory)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cohort` (
  `idcohort` int NOT NULL AUTO_INCREMENT,
  `cohortnumber` int NOT NULL, 
  `idfksalesteam` int,
  `size` int,
  `presold` int,
  `nonpresold` int,
  `idfkregion` int,
  `idfkinstructor` int,
  `idfkstatus` int,
  `idfkcategory` int,
  `startdate` date,
  `enddate` date,
  PRIMARY KEY (`idcohort`),
  FOREIGN KEY (idfksalesteam) REFERENCES region(idregion),
  FOREIGN KEY (idfkregion) REFERENCES region(idregion),
  FOREIGN KEY (idfkinstructor) REFERENCES instructor(idinstructor),
  FOREIGN KEY (idfkstatus) REFERENCES status(idstatus),
  FOREIGN KEY (idfkcategory) REFERENCES category(idcategory)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `xcohortsalesteam` (
	`idxcohortsalesteam`int NOT NULL AUTO_INCREMENT,
	`idfkcohort` int NOT NULL, 
    `idfksalesteam` int NOT NULL,
    PRIMARY KEY (idxcohortsalesteam),
    FOREIGN KEY (idfkcohort) REFERENCES cohort(idcohort),
    FOREIGN KEY (idfksalesteam) REFERENCES salesteam(idsalesteam)
);

CREATE TABLE `xcohortpathway` (
	`idxcohortpathway`int NOT NULL AUTO_INCREMENT,
	`idfkcohort` int NOT NULL, 
    `idfkpathway` int NOT NULL,
    PRIMARY KEY (idxcohortpathway),
    FOREIGN KEY (idfkcohort) REFERENCES cohort(idcohort),
    FOREIGN KEY (idfkpathway) REFERENCES pathway(idpathway)
);

CREATE TABLE `xcohortclient` (
	`idxcohortclient`int NOT NULL AUTO_INCREMENT,
	`idfkcohort` int NOT NULL, 
    `idfkclient` int NOT NULL,
    PRIMARY KEY (idxcohortclient),
    FOREIGN KEY (idfkcohort) REFERENCES cohort(idcohort),
    FOREIGN KEY (idfkclient) REFERENCES client(idclient)
);

INSERT INTO `category` (`categoryname`) VALUES ('Banking');
INSERT INTO `category` (`categoryname`) VALUES ('Data');
INSERT INTO `category` (`categoryname`) VALUES ('DevOps');
INSERT INTO `category` (`categoryname`) VALUES ('Software Development');

INSERT INTO `global_calender`.`region` (`region`) VALUES ('NA');
INSERT INTO `global_calender`.`region` (`region`) VALUES ('EMEA');
INSERT INTO `global_calender`.`region` (`region`) VALUES ('APAC');
INSERT INTO `global_calender`.`region` (`region`) VALUES ('AUS');

INSERT INTO `status` (`statusname`) VALUES ('Ready in Engage');
INSERT INTO `status` (`statusname`) VALUES ('Planning');
INSERT INTO `status` (`statusname`) VALUES ('CANCELLED');
INSERT INTO `status` (`statusname`) VALUES ('Completed');

INSERT INTO `client` (`clientname`) VALUES ('Scheduled');
INSERT INTO `client` (`clientname`) VALUES ('Amadeus');
INSERT INTO `client` (`clientname`) VALUES ('AMEX');
INSERT INTO `client` (`clientname`) VALUES ('AXA');
INSERT INTO `client` (`clientname`) VALUES ('Banking Services');
INSERT INTO `client` (`clientname`) VALUES ('Bank of Queensland');
INSERT INTO `client` (`clientname`) VALUES ('Bloomberg');
INSERT INTO `client` (`clientname`) VALUES ('BNY Mellon');
INSERT INTO `client` (`clientname`) VALUES ('Business Development');
INSERT INTO `client` (`clientname`) VALUES ('CBA');
INSERT INTO `client` (`clientname`) VALUES ('Centene');
INSERT INTO `client` (`clientname`) VALUES ('Credit Suisse');
INSERT INTO `client` (`clientname`) VALUES ('Commonwealth Bank of Australia');
INSERT INTO `client` (`clientname`) VALUES ('First Republic Bank');
INSERT INTO `client` (`clientname`) VALUES ('Genesis');
INSERT INTO `client` (`clientname`) VALUES ('HSBC Poland');
INSERT INTO `client` (`clientname`) VALUES ('LBCO');
INSERT INTO `client` (`clientname`) VALUES ('Liberty Mutual');
INSERT INTO `client` (`clientname`) VALUES ('JPMC');
INSERT INTO `client` (`clientname`) VALUES ('Mizuho (Hays)');
INSERT INTO `client` (`clientname`) VALUES ('Natwest Markets India Markets India');
INSERT INTO `client` (`clientname`) VALUES ('NBC');
INSERT INTO `client` (`clientname`) VALUES ('Peloton');
INSERT INTO `client` (`clientname`) VALUES ('QVC');
INSERT INTO `client` (`clientname`) VALUES ('Restaurant Brands International');
INSERT INTO `client` (`clientname`) VALUES ('Royal Bank of Canada');
INSERT INTO `client` (`clientname`) VALUES ('Self-Paced');
INSERT INTO `client` (`clientname`) VALUES ('Standard Chartered Bank');
INSERT INTO `client` (`clientname`) VALUES ('State Street');
INSERT INTO `client` (`clientname`) VALUES ('TB Bank');
INSERT INTO `client` (`clientname`) VALUES ('Trinity Health');
INSERT INTO `client` (`clientname`) VALUES ('UBS');
INSERT INTO `client` (`clientname`) VALUES ('Visa');

INSERT INTO `global_calender`.`salesteam`(`team`) VALUES ('Client Services');
INSERT INTO `global_calender`.`salesteam`(`team`) VALUES ('Business Development');

INSERT INTO timezone (timezone) VALUES ('PDT');
INSERT INTO timezone (timezone) VALUES ('MDT');
INSERT INTO timezone (timezone) VALUES ('CDT');
INSERT INTO timezone (timezone) VALUES ('EDT');
INSERT INTO timezone (timezone) VALUES ('BST');
INSERT INTO timezone (timezone) VALUES ('CEST');
INSERT INTO timezone (timezone) VALUES ('IST');
INSERT INTO timezone (timezone) VALUES ('GMT');
INSERT INTO timezone (timezone) VALUES ('HKT');
INSERT INTO timezone (timezone) VALUES ('AEST');

INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Financial Markets and the Trade Lifecycle', (SELECT idcategory FROM category WHERE categoryname = 'Banking'));
INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Big Data And Distributed Systems', (SELECT idcategory FROM category WHERE categoryname = 'Data'));
INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Data Analytics', (SELECT idcategory FROM category WHERE categoryname = 'Data'));
INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Data Science', (SELECT idcategory FROM category WHERE categoryname = 'Data'));
INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Site Reliability Enginereeing (SRE)', (SELECT idcategory FROM category WHERE categoryname = 'DevOps'));
INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Production Support', (SELECT idcategory FROM category WHERE categoryname = 'Production Support'));
INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Frontend Application Development', (SELECT idcategory FROM category WHERE categoryname = 'Software Development'));
INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Full Stack Development using C#/.NET', (SELECT idcategory FROM category WHERE categoryname = 'Software Development'));
INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Full Stack Development Using Java', (SELECT idcategory FROM category WHERE categoryname = 'Software Development'));
INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Introduction to Mainframe', (SELECT idcategory FROM category WHERE categoryname = 'Software Development'));
INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Java Backend Application Development', (SELECT idcategory FROM category WHERE categoryname = 'Software Development'));
INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Software Development Using C', (SELECT idcategory FROM category WHERE categoryname = 'Software Development'));
INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Software Development Using C++', (SELECT idcategory FROM category WHERE categoryname = 'Software Development'));
INSERT INTO pathway (`pathway`,`idfkcategory`) VALUES ('Software Development Using Go', (SELECT idcategory FROM category WHERE categoryname = 'Software Development'));

INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Shams Al Ajrawi',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Charles Washington',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Calvin Moser',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('David Hunnicutt',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Sean Palm',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Ronnie Jones',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('David Albeck',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Amir Gill',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Rohini Sindhuja',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Jenna Triolo',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Farah Al-Mahameed',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Ishwar Joshi',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Phil Williams',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Quinten Lambert',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Randy Hash',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Love Bennett',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('August Schau',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Steve Shilling',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Doug Pyle',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Maurice Gibson',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Michael Gorman',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Patricia Angioletto',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Craig East',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Chris Pisarski',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Mani Anand',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Patrick ',(SELECT idregion FROM region WHERE region = 'NA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Amit Deshpande',(SELECT idregion FROM region WHERE region = 'APAC'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('WileyNXT',(SELECT idregion FROM region WHERE region = 'APAC'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('JP Duvivier',(SELECT idregion FROM region WHERE region = 'APAC'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Ron Lobo',(SELECT idregion FROM region WHERE region = 'EMEA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Luke Mulcahy',(SELECT idregion FROM region WHERE region = 'EMEA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Feyzullah Egriboyun',(SELECT idregion FROM region WHERE region = 'EMEA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Frankie McCallion',(SELECT idregion FROM region WHERE region = 'EMEA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Dave Greaves',(SELECT idregion FROM region WHERE region = 'EMEA'));
INSERT INTO `global_calender`.`instructor` (`instructorname`,`idfkregion`) VALUES('Jonathan Ledwidge',(SELECT idregion FROM region WHERE region = 'EMEA'));

INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (128,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'EMEA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Ron Lobo'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Ready in Engage'),'2021-08-02','2021-09-10',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (129,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'EMEA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Chris Pisarski'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Ready in Engage'),'2021-09-07','2021-10-08',(SELECT idcategory FROM category WHERE categoryname= 'Production Support'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (130,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'EMEA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Ron Lobo'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Ready in Engage'),'2021-09-13','2021-10-29',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (131,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),55,0,55,(SELECT idregion FROM region where region = 'APAC'),(SELECT idinstructor FROM instructor WHERE instructorname = 'WileyNXT'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-06-21','2021-08-27',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (132,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),0,50,50,(SELECT idregion FROM region where region = 'APAC'),(SELECT idinstructor FROM instructor WHERE instructorname = 'WileyNXT'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-07-26','2021-10-15',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (133,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),50,0,50,(SELECT idregion FROM region where region = 'APAC'),(SELECT idinstructor FROM instructor WHERE instructorname = 'WileyNXT'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-07-26','2021-10-15',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (135,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),5,5,0,(SELECT idregion FROM region where region = 'AUS'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Amit Deshpande'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-07-19','2021-08-27',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (136,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),15,15,0,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Patrick Morgan'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-08-23','2021-10-01',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (137,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'EMEA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Feyz'), (SELECT idstatus FROM `status` WHERE `statusname` = 'CANCELLED'),'2021-09-13','2021-10-15',(SELECT idcategory FROM category WHERE categoryname= 'Banking'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (138,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Jenna Triolo'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Ready in Engage'),'2021-08-09','2021-09-17',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (139,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),15,15,0,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Shams Al Ajrawi'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Ready in Engage'),'2021-07-26','2021-07-30',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (140,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Craig East'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Ready in Engage'),'2021-08-16','2021-08-24',(SELECT idcategory FROM category WHERE categoryname= 'Production Support'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (141,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),2,2,0,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = ''), (SELECT idstatus FROM `status` WHERE `statusname` = 'Ready in Engage'),'2021-08-23','2021-09-27',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (142,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),15,15,0,(SELECT idregion FROM region where region = 'AUS'),(SELECT idinstructor FROM instructor WHERE instructorname = 'JP Duvivier'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Ready in Engage'),'2021-09-15','2021-10-22',(SELECT idcategory FROM category WHERE categoryname= 'Banking'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (143,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'David Albeck'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Ready in Engage'),'2021-09-20','2021-10-29',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (144,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'David Hunnicutt'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-11-29','2021-01-14',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (145,(SELECT idsalesteam FROM salesteam WHERE team = "Business Services"),25,0,25,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Sean Palm'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-11-08','2021-12-23',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (146,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'EMEA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'TBD EMEA Contractor'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-10-18','2021-11-26',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (147,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'EMEA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Ron Lobo'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-11-08','2021-12-17',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (148,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'EMEA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'TBD EMEA Contractor'), (SELECT idstatus FROM `status` WHERE `statusname` = 'CANCELLED'),'2021-10-11','2021-11-12',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (149,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'EMEA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'TBD EMEA Contractor'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-11-08','2021-12-17',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (150,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Craig East'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-11-08','2021-12-23',(SELECT idcategory FROM category WHERE categoryname= 'Production Support'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (151,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,0,25,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Ronnie Jones'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-10-25','2021-12-10',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (152,(SELECT idsalesteam FROM salesteam WHERE team = "Business Services"),25,0,25,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Mani Anand'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-10-25','2021-12-10',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (153,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),20,20,0,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'David Albeck'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Ready in Engage'),'2021-08-23','2021-10-01',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (154,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),55,55,0,(SELECT idregion FROM region where region = 'APAC'),(SELECT idinstructor FROM instructor WHERE instructorname = 'WileyNXT'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-08-23','2021-10-29',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (155,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),40,40,0,(SELECT idregion FROM region where region = 'AUS'),(SELECT idinstructor FROM instructor WHERE instructorname = 'AUS Contractor'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-11-15','2021-12-17',(SELECT idcategory FROM category WHERE categoryname= 'Banking'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (156,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),20,20,0,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Calvin Moser'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-08-23','2021-09-03',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (157,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),2,2,0,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Jenna Triolo'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-08-16','2021-09-01',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (158,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),2,2,0,(SELECT idregion FROM region where region = 'EMA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Frankie & Dave G'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-08-30','2021-09-17',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (159,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),35,35,0,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Michael Gorman'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-11-01','2021-12-03',(SELECT idcategory FROM category WHERE categoryname= 'Banking'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (160,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),35,35,0,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Patricia Angioletto'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-11-01','2021-12-03',(SELECT idcategory FROM category WHERE categoryname= 'Banking'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (161,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),35,35,0,(SELECT idregion FROM region where region = 'EMEA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Feyz'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-11-01','2021-11-26',(SELECT idcategory FROM category WHERE categoryname= 'Banking'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (162,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),35,35,0,(SELECT idregion FROM region where region = 'APAC'),(SELECT idinstructor FROM instructor WHERE instructorname = 'TBD'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-11-01','2021-11-26',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (163,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),35,35,0,(SELECT idregion FROM region where region = 'APAC'),(SELECT idinstructor FROM instructor WHERE instructorname = 'TBD'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-11-01','2021-11-26',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (164,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),36,0,36,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Chris Pisarski'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-11-01','2021-12-14',(SELECT idcategory FROM category WHERE categoryname= 'Production Support'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (165,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,25,0,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Patrick Morgan'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-01-10','2021-02-18',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (166,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),25,25,0,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Charles Washington'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-01-10','2021-02-18',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (167,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),10,10,0,(SELECT idregion FROM region where region = 'APAC'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Amit Deshpande'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-10-25','2021-12-03',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));
INSERT INTO `global_calender`.`cohort` (`cohortnumber`, `idfksalesteam`,`size`,`presold`,`nonpresold`,`idfkregion`,`idfkinstructor`,`idfkstatus`,`startdate`,`enddate`,`idfkcategory`) VALUES (168,(SELECT idsalesteam FROM salesteam WHERE team = "Client Services"),10,10,0,(SELECT idregion FROM region where region = 'NA'),(SELECT idinstructor FROM instructor WHERE instructorname = 'Frankie'), (SELECT idstatus FROM `status` WHERE `statusname` = 'Planning'),'2021-12-06','2021-01-07',(SELECT idcategory FROM category WHERE categoryname= 'Software Development'));

-- INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 127),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 128),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 129),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 130),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 131),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 132),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 133),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 135),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 136),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 137),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 138),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 139),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 140),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 141),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 142),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 143),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 144),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 145),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 146),(SELECT idsalesteam FROM salesteam WHERE team = 'Business Development'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 147),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 148),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 149),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 150),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 151),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 152),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 153),(SELECT idsalesteam FROM salesteam WHERE team = 'Business Development'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 154),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 155),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 156),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 157),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 158),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 159),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 160),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 161),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 162),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 163),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 164),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 165),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 166),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 167),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));
INSERT INTO `global_calender`.`xcohortsalesteam`(`idfkcohort`,`idfksalesteam`) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 168),(SELECT idsalesteam FROM salesteam WHERE team = 'Client Services'));

-- INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES (127, (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 128), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 129), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 130), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 131), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 132), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 133), (SELECT idclient FROM `client` WHERE clientname = 'JPMC'));
-- INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 134), (SELECT idclient FROM `client` WHERE clientname = 'Liberty Mutual'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 135), (SELECT idclient FROM `client` WHERE clientname = 'Amadeus'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 136), (SELECT idclient FROM `client` WHERE clientname = 'AMEX'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 137), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 138), (SELECT idclient FROM `client` WHERE clientname = 'Credit Suisse'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 138), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 139), (SELECT idclient FROM `client` WHERE clientname = 'AMEX'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 140), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 141), (SELECT idclient FROM `client` WHERE clientname = 'Self-paced'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 141), (SELECT idclient FROM `client` WHERE clientname = 'Centene'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 142), (SELECT idclient FROM `client` WHERE clientname = 'Bank of Queensland'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 143), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 144), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 145), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 146), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 147), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 148), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 149), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 150), (SELECT idclient FROM `client` WHERE clientname = 'State Street'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 150), (SELECT idclient FROM `client` WHERE clientname = 'Bloomberg'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 151), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 152), (SELECT idclient FROM `client` WHERE clientname = 'Scheduled'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 153), (SELECT idclient FROM `client` WHERE clientname = 'NBC'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 153), (SELECT idclient FROM `client` WHERE clientname = 'JPMC'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 154), (SELECT idclient FROM `client` WHERE clientname = 'Natwest Markets India'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 154), (SELECT idclient FROM `client` WHERE clientname = 'HSBC'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 155), (SELECT idclient FROM `client` WHERE clientname = 'CBA'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 156), (SELECT idclient FROM `client` WHERE clientname = 'State Street'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 157), (SELECT idclient FROM `client` WHERE clientname = 'Credit Suisse'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 158), (SELECT idclient FROM `client` WHERE clientname = 'JPMC'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 159), (SELECT idclient FROM `client` WHERE clientname = 'BNY'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 160), (SELECT idclient FROM `client` WHERE clientname = 'BNY'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 161), (SELECT idclient FROM `client` WHERE clientname = 'BNY'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 162), (SELECT idclient FROM `client` WHERE clientname = 'BNY'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 163), (SELECT idclient FROM `client` WHERE clientname = 'BNY'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 164), (SELECT idclient FROM `client` WHERE clientname = 'State Street'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 164), (SELECT idclient FROM `client` WHERE clientname = 'JPMC'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 165), (SELECT idclient FROM `client` WHERE clientname = 'AMEX'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 166), (SELECT idclient FROM `client` WHERE clientname = 'JPMC'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 167), (SELECT idclient FROM `client` WHERE clientname = 'JPMC'));
INSERT INTO xcohortclient (idfkcohort,idfkclient) VALUES ((SELECT idcohort FROM cohort WHERE cohortnumber = 168), (SELECT idclient FROM `client` WHERE clientname = 'State Street'));
