-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: newcentrex
-- ------------------------------------------------------
-- Server version	5.7.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `SIPStatusCodeToPSTNCauseCode`
--

DROP TABLE IF EXISTS `SIPStatusCodeToPSTNCauseCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SIPStatusCodeToPSTNCauseCode` (
  `SIPStatusCode` int(11) NOT NULL,
  `SIPStatusCodeDescription` varchar(50) NOT NULL,
  `PSTNCauseCode` int(11) NOT NULL,
  `PSTNCauseCodeDescription` varchar(50) NOT NULL,
  PRIMARY KEY (`SIPStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SIPStatusCodeToPSTNCauseCode`
--

LOCK TABLES `SIPStatusCodeToPSTNCauseCode` WRITE;
/*!40000 ALTER TABLE `SIPStatusCodeToPSTNCauseCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `SIPStatusCodeToPSTNCauseCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_logmon`
--

DROP TABLE IF EXISTS `access_logmon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_logmon` (
  `user` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_logmon`
--

LOCK TABLES `access_logmon` WRITE;
/*!40000 ALTER TABLE `access_logmon` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_logmon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_log` (
  `user` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `params` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES ('supvoip','LOGIN','SELECT * FROM users WHERE nick= supvoip AND pass = 22123 AND enabled = 1 ','2021-04-08 19:56:39'),('supvoip','LOGIN','SELECT * FROM users WHERE nick= supvoip AND pass = 22123 AND enabled = 1 ','2021-04-08 19:57:38'),('supvoip','LOGIN','SELECT * FROM users WHERE nick= supvoip AND pass = 22123 AND enabled = 1 ','2021-04-09 12:44:36'),('SUPVOIP','CREATE SERVER','INSERT SERVER: TEST203','2021-04-09 12:45:52'),('supvoip','LOGIN','SELECT * FROM users WHERE nick= supvoip AND pass = 22123 AND enabled = 1 ','2021-04-09 12:56:14'),('supvoip','LOGIN','SELECT * FROM users WHERE nick= supvoip AND pass = 22123 AND enabled = 1 ','2021-04-09 12:56:15'),('supvoip','LOGIN','SELECT * FROM users WHERE nick= supvoip AND pass = 22123 AND enabled = 1 ','2021-04-09 13:05:50'),('SUPVOIP','CREATE CORP','INSERT CORP: E Corp','2021-04-09 13:15:40'),('SUPVOIP','CREATE USER','INSERT USER: testing1','2021-04-09 13:16:12'),('SUPVOIP','UPDATE USER','UPDATE users SET nick = testing, mail = , pass = testing, corpID = 10, level = administrador, enabled = 1  WHERE ID = 2','2021-04-09 13:16:19'),('testing','LOGIN','SELECT * FROM users WHERE nick= testing AND pass = testing AND enabled = 1','2021-04-09 13:16:26'),('TESTING','CREATE EXTEN','INSERT EXTEN: 2000','2021-04-09 13:31:49'),('testing','LOGIN','SELECT * FROM users WHERE nick= testing AND pass = testing AND enabled = 1','2021-04-09 13:41:49'),('testing','LOGIN','SELECT * FROM users WHERE nick= testing AND pass = testing AND enabled = 1','2021-04-19 13:52:51'),('TESTING','CREATE EXTEN','INSERT EXTEN: 2002','2021-04-19 13:55:20'),('testing','LOGIN','SELECT * FROM users WHERE nick= testing AND pass = testing AND enabled = 1','2021-05-26 12:45:56'),('TESTING','CREATE SPEED DIAL','INSERT SPEED DIAL: 11','2021-05-26 12:46:49'),('supvoip','LOGIN','SELECT * FROM users WHERE nick= supvoip AND pass = 22123 AND enabled = 1 ','2021-05-26 13:56:26'),('SUPVOIP','UPDATE CORP','UPDATE corps SET name = E Corp, enabled= 1, extLen= 4, extMax= 1234, queMax = 12, monEnabled = 1, monPath= /home/10, AllowCustom= 0, AllowDiscador=0 WHERE ID = 10 ','2021-05-26 13:56:53'),('testing','LOGIN','SELECT * FROM users WHERE nick= testing AND pass = testing AND enabled = 1','2021-05-26 14:28:48'),('TESTING','CREATE EXTEN','INSERT EXTEN: 2003','2021-05-26 14:29:28'),('testing','LOGIN','SELECT * FROM users WHERE nick= testing AND pass = testing AND enabled = 1','2021-05-26 18:08:48'),('supvoip','LOGIN','SELECT * FROM users WHERE nick= supvoip AND pass = 22123 AND enabled = 1 ','2021-05-26 18:18:55'),('SUPVOIP','UPDATE CORP','UPDATE corps SET name = E Corp, enabled= 1, extLen= 4, extMax= 1234, queMax = 12, monEnabled = 0, monPath= , AllowCustom= 0, AllowDiscador=0 WHERE ID = 10 ','2021-05-26 18:19:07'),('testing','LOGIN','SELECT * FROM users WHERE nick= testing AND pass = testing AND enabled = 1','2021-05-27 14:18:20'),('TESTING','CREATE SPEED DIAL','INSERT SPEED DIAL: 12','2021-05-27 14:19:28'),('TESTING','CREATE SPEED DIAL','INSERT SPEED DIAL: 13','2021-05-27 14:19:36'),('TESTING','CREATE SPEED DIAL','INSERT SPEED DIAL: 14','2021-05-27 14:19:44'),('TESTING','CREATE SPEED DIAL','INSERT SPEED DIAL: 15','2021-05-27 14:19:53'),('TESTING','CREATE SPEED DIAL','INSERT SPEED DIAL: 21','2021-05-27 14:20:05'),('TESTING','CREATE SPEED DIAL','INSERT SPEED DIAL: 22','2021-05-27 14:20:15'),('testing','LOGIN','SELECT * FROM users WHERE nick= testing AND pass = testing AND enabled = 1','2021-05-27 14:45:32'),('testing','LOGIN','SELECT * FROM users WHERE nick= testing AND pass = testing AND enabled = 1','2021-05-27 15:12:51'),('supvoip','LOGIN','SELECT * FROM users WHERE nick= supvoip AND pass = 22123 AND enabled = 1 ','2021-05-27 15:16:42'),('SUPVOIP','UPDATE CORP','UPDATE corps SET name = E Corp, enabled= 1, extLen= 4, extMax= 1234, queMax = 12, monEnabled = 1, monPath= /home/asterisk, AllowCustom= 0, AllowDiscador=0 WHERE ID = 10 ','2021-05-27 15:16:56'),('testing','LOGIN','SELECT * FROM users WHERE nick= testing AND pass = testing AND enabled = 1','2021-05-27 18:04:30'),('testing','LOGIN','SELECT * FROM users WHERE nick= testing AND pass = testing AND enabled = 1','2021-05-28 13:51:10'),('testing','LOGIN','SELECT * FROM users WHERE nick= testing AND pass = testing AND enabled = 1','2021-06-07 12:38:59');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alembic_version_config`
--

DROP TABLE IF EXISTS `alembic_version_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version_config` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version_config`
--

LOCK TABLES `alembic_version_config` WRITE;
/*!40000 ALTER TABLE `alembic_version_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `alembic_version_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `astcalldetails`
--

DROP TABLE IF EXISTS `astcalldetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `astcalldetails` (
  `calldate` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `clid` varchar(80) NOT NULL DEFAULT '',
  `src` varchar(80) NOT NULL DEFAULT '',
  `dst` varchar(80) NOT NULL DEFAULT '',
  `dcontext` varchar(80) NOT NULL DEFAULT '',
  `channel` varchar(80) NOT NULL DEFAULT '',
  `dstchannel` varchar(80) NOT NULL DEFAULT '',
  `lastapp` varchar(80) NOT NULL DEFAULT '',
  `lastdata` varchar(80) NOT NULL DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT '0',
  `billsec` int(11) NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `amaflags` int(11) NOT NULL DEFAULT '0',
  `accountcode` varchar(20) NOT NULL DEFAULT '',
  `uniqueid` varchar(32) NOT NULL DEFAULT '',
  `userfield` varchar(255) NOT NULL DEFAULT '',
  `did` varchar(50) NOT NULL DEFAULT '',
  `recordingfile` varchar(255) NOT NULL DEFAULT '',
  KEY `calldate` (`calldate`),
  KEY `dst` (`dst`),
  KEY `accountcode` (`accountcode`),
  KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astcalldetails`
--

LOCK TABLES `astcalldetails` WRITE;
/*!40000 ALTER TABLE `astcalldetails` DISABLE KEYS */;
INSERT INTO `astcalldetails` VALUES ('2021-04-19 13:58:37','\"\" <10_2002>','10_2002','10_2000','10','PJSIP/10_2002-00000000','PJSIP/10_2002-00000001','Dial','PJSIP/10_2002/10_2000',6,0,'NO ANSWER',3,'','1618840717.0','','',''),('2021-04-19 14:10:11','\"\" <10_2000>','10_2000','10_2002','10','PJSIP/10_2000-00000002','PJSIP/10_2000-00000003','Dial','PJSIP/10_2000/10_2002',7,0,'BUSY',3,'','1618841411.2','','',''),('2021-04-19 14:10:23','\"\" <10_2002>','10_2002','10_2000','10','PJSIP/10_2002-00000004','PJSIP/10_2002-00000005','Dial','PJSIP/10_2002/10_2000',7,0,'BUSY',3,'','1618841423.4','','',''),('2021-04-19 14:28:42','\"55354701650\" <55354701650>','55354701650','4701650','tronco','PJSIP/10_2002-00000000','PJSIP/55354701650-00000001','Dial','PJSIP/4701650@55354701650/sip:192.168.0.202',13,8,'ANSWERED',3,'','1618842522.0','','',''),('2021-05-26 13:48:45','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000008','PJSIP/10_2000-00000009','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',5,0,'BUSY',3,'','1622036925.8','','',''),('2021-05-26 13:52:44','\"\" <10_2000>','10_2000','11','10','PJSIP/10_2000-0000000b','','ConfBridge','10',4,4,'ANSWERED',3,'','1622037164.11','','',''),('2021-05-26 13:57:27','\"\" <10_2000>','10_2000','11','10','PJSIP/10_2000-0000000c','','ConfBridge','10',5,4,'ANSWERED',3,'','1622037447.14','','',''),('2021-05-26 13:59:02','\"\" <10_2000>','10_2000','11','10','PJSIP/10_2000-0000000d','','ConfBridge','10',5,4,'ANSWERED',3,'','1622037542.17','','',''),('2021-05-26 14:53:24','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-0000000f','PJSIP/10_2000-00000010','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',4,0,'BUSY',3,'','1622040804.21','','',''),('2021-05-26 14:53:37','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000011','PJSIP/10_2000-00000012','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',7,0,'BUSY',3,'','1622040817.23','','',''),('2021-05-26 14:55:52','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000013','PJSIP/10_2000-00000014','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',5,0,'BUSY',3,'','1622040952.25','','',''),('2021-05-26 14:56:30','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000015','PJSIP/10_2000-00000016','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',4,0,'BUSY',3,'','1622040990.27','','',''),('2021-05-26 14:57:55','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000017','PJSIP/10_2000-00000018','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',3,0,'BUSY',3,'','1622041075.29','','',''),('2021-05-26 15:14:10','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000019','PJSIP/10_2000-0000001a','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',7,0,'BUSY',3,'','1622042050.31','','',''),('2021-05-26 15:20:58','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-0000001b','PJSIP/10_2000-0000001c','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',5,0,'BUSY',3,'','1622042458.33','','',''),('2021-05-26 17:52:44','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000000','PJSIP/10_2000-00000001','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',4,0,'BUSY',3,'','1622051564.0','','',''),('2021-05-26 18:26:56','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000000','PJSIP/10_2000-00000001','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',7,0,'BUSY',3,'','1622053616.0','','',''),('2021-05-26 18:27:59','\"123\" <10_2000>','10_2000','2003','10','PJSIP/10_2000-00000002','PJSIP/10_2000-00000003','Dial','PJSIP/10_2000/10_2003,60,KktM(vsc-callid)',3,0,'BUSY',3,'','1622053679.2','','',''),('2021-05-26 18:28:21','\"123\" <10_2000>','10_2000','2003','10','PJSIP/10_2000-00000004','PJSIP/10_2000-00000005','Dial','PJSIP/10_2000/10_2003,60,KktM(vsc-callid)',61,0,'NO ANSWER',3,'','1622053701.4','','',''),('2021-05-26 18:44:43','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000007','PJSIP/10_2000-00000008','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',8,5,'ANSWERED',3,'','1622054683.7','','',''),('2021-05-26 18:44:56','\"\" <10_2002>','10_2002','2000','10','PJSIP/10_2002-00000009','PJSIP/10_2002-0000000a','Dial','PJSIP/10_2002/10_2000,60,KktM(vsc-callid)',7,5,'ANSWERED',3,'','1622054696.9','','',''),('2021-05-26 18:46:00','\"\" <10_2002>','10_2002','2002','10','PJSIP/10_2002-0000000b','PJSIP/10_2002-0000000c','Dial','PJSIP/10_2002/10_2002,60,KktM(vsc-callid)',4,0,'BUSY',3,'','1622054760.11','','',''),('2021-05-26 18:46:08','\"\" <10_2002>','10_2002','2000','10','PJSIP/10_2002-0000000d','PJSIP/10_2002-0000000e','Dial','PJSIP/10_2002/10_2000,60,KktM(vsc-callid)',10,6,'ANSWERED',3,'','1622054768.13','','',''),('2021-05-26 18:46:24','\"\" <10_2002>','10_2002','2003','10','PJSIP/10_2002-0000000f','PJSIP/10_2002-00000010','Dial','PJSIP/10_2002/10_2003,60,KktM(vsc-callid)',8,6,'ANSWERED',3,'','1622054784.15','','',''),('2021-05-26 18:46:38','\"\" <10_2003>','10_2003','2000','10','PJSIP/10_2003-00000011','PJSIP/10_2003-00000012','Dial','PJSIP/10_2003/10_2000,60,KktM(vsc-callid)',11,9,'ANSWERED',3,'','1622054798.17','','',''),('2021-05-27 15:07:14','\"\" <10_2000>','10_2000','12','10','PJSIP/10_2000-00000000','','VoiceMailMain','2000@10',19,18,'ANSWERED',3,'','1622128034.0','','',''),('2021-05-27 15:18:07','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000005','PJSIP/10_2000-00000006','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',3,0,'BUSY',3,'','1622128687.5','','',''),('2021-05-27 17:51:02','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-0000000d','PJSIP/10_2000-0000000e','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',4,0,'BUSY',3,'','1622137862.13','','',''),('2021-05-27 18:02:51','\"10_2003\" <10_2003>','10_2003','14','10','PJSIP/10_2003-00000012','','BackGround','extension',7,6,'ANSWERED',3,'','1622138571.18','','',''),('2021-05-27 18:03:18','\"10_2003\" <10_2003>','10_2003','14','10','PJSIP/10_2003-00000013','','BackGround','extension',9,8,'ANSWERED',3,'','1622138598.19','','',''),('2021-05-27 18:02:36','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000010','PJSIP/10_2000-00000011','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',71,69,'ANSWERED',3,'','1622138556.16','','',''),('2021-05-27 18:05:17','\"10_2003\" <10_2003>','10_2003','14','10','PJSIP/10_2003-00000016','','ChanSpy','PJSIP/10_2000',24,23,'ANSWERED',3,'','1622138717.22','','',''),('2021-05-27 18:05:04','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000014','PJSIP/10_2000-00000015','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',44,38,'ANSWERED',3,'','1622138704.20','','',''),('2021-05-27 18:07:21','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000017','PJSIP/10_2000-00000018','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',47,44,'ANSWERED',3,'','1622138841.23','','',''),('2021-05-27 18:07:31','\"10_2003\" <10_2003>','10_2003','15','10','PJSIP/10_2003-00000019','','ChanSpy','PJSIP/10_2000,w',54,53,'ANSWERED',3,'','1622138851.25','','',''),('2021-05-27 18:09:05','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-0000001a','','Playback','you-dialed-wrong-number&vm-goodbye',28,27,'ANSWERED',3,'','1622138945.26','','',''),('2021-05-27 18:27:34','\"\" <10_2000>','10_2000','22','10','PJSIP/10_2000-0000001b','','BackGround','call-forward&privacy-not&activated&to-change&status&press-1',2,2,'ANSWERED',3,'','1622140054.27','','',''),('2021-05-27 18:27:52','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-0000001c','','Playback','you-dialed-wrong-number&vm-goodbye',13,13,'ANSWERED',3,'','1622140072.28','','',''),('2021-05-27 18:33:18','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-0000001d','','BackGround','press-1',33,32,'ANSWERED',3,'','1622140398.29','','',''),('2021-05-27 18:35:01','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-0000001e','','BackGround','press-1',30,29,'ANSWERED',3,'','1622140501.30','','',''),('2021-05-28 13:50:01','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000000','PJSIP/10_2000-00000001','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',5,0,'BUSY',3,'','1622209801.0','','',''),('2021-05-28 14:34:42','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000003','','BackGround','press-1',33,33,'ANSWERED',3,'','1622212482.3','','',''),('2021-05-31 10:15:59','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000000','','BackGround','press-1',30,29,'ANSWERED',3,'','1622466959.0','','',''),('2021-05-31 10:20:39','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000001','','BackGround','press-1',12,11,'ANSWERED',3,'','1622467239.1','','',''),('2021-05-31 10:23:37','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000002','','BackGround','press-1',11,10,'ANSWERED',3,'','1622467417.2','','',''),('2021-05-31 10:25:34','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000003','','BackGround','press-1',39,38,'ANSWERED',3,'','1622467534.3','','',''),('2021-05-31 10:29:03','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000004','','BackGround','press-1',27,27,'ANSWERED',3,'','1622467743.4','','',''),('2021-05-31 10:34:59','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000005','','BackGround','press-1',38,37,'ANSWERED',3,'','1622468099.5','','',''),('2021-05-31 10:37:00','\"REMINDER\" <2000>','2000','4','Voicemail','PJSIP/10_2002-00000006','','AppDial2','(Outgoing Line)',13,0,'ANSWERED',3,'','1622468220.6','','',''),('2021-05-31 14:42:26','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000007','','BackGround','press-1',49,48,'ANSWERED',3,'','1622482946.7','','',''),('2021-05-31 14:45:00','\"REMINDER\" <2000>','2000','5','Voicemail','PJSIP/10_2002-00000008','','AppDial2','(Outgoing Line)',5,0,'ANSWERED',3,'','1622483100.8','','',''),('2021-06-01 12:00:20','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000000','','BackGround','vm-enter-num-to-call',8,7,'ANSWERED',3,'','1622559620.0','','',''),('2021-06-01 12:23:15','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000001','','BackGround','press-1',41,40,'ANSWERED',3,'','1622560995.1','','',''),('2021-06-01 12:25:00','\"REMINDER\" <2000>','2000','6','Voicemail','PJSIP/10_2002-00000002','','AppDial2','(Outgoing Line)',4,0,'ANSWERED',3,'','1622561100.2','','',''),('2021-06-01 12:32:02','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000003','','BackGround','press-1',50,49,'ANSWERED',3,'','1622561522.3','','',''),('2021-06-01 12:35:00','\"REMINDER\" <2000>','2000','7','Voicemail','PJSIP/10_2002-00000004','','AppDial2','(Outgoing Line)',3,0,'ANSWERED',3,'','1622561700.4','','',''),('2021-06-01 12:38:43','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000005','','BackGround','press-1',40,39,'ANSWERED',3,'','1622561923.5','','',''),('2021-06-01 12:42:00','\"REMINDER\" <2000>','2000','8','Voicemail','PJSIP/10_2002-00000006','','AppDial2','(Outgoing Line)',5,0,'ANSWERED',3,'','1622562120.6','','',''),('2021-06-01 12:43:21','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000007','','BackGround','press-1',40,39,'ANSWERED',3,'','1622562201.7','','',''),('2021-06-01 12:48:20','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000009','','BackGround','press-1',43,42,'ANSWERED',3,'','1622562500.9','','',''),('2021-06-01 12:50:43','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-0000000b','','BackGround','press-1',41,40,'ANSWERED',3,'','1622562643.11','','',''),('2021-06-01 12:55:00','\"REMINDER\" <2000>','2000','11','Voicemail','PJSIP/10_2002-0000000f','','AppDial2','(Outgoing Line)',5,0,'ANSWERED',3,'','1622562900.15','','',''),('2021-06-01 12:55:00','\"REMINDER\" <2000>','2000','10','Voicemail','PJSIP/10_2002-0000000e','','AppDial2','(Outgoing Line)',6,0,'ANSWERED',3,'','1622562900.14','','',''),('2021-06-01 12:56:00','\"REMINDER\" <2000>','2000','9','Voicemail','PJSIP/10_2002-00000010','','AppDial2','(Outgoing Line)',5,0,'ANSWERED',3,'','1622562960.16','','',''),('2021-06-01 13:12:30','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000011','','BackGround','press-1',44,43,'ANSWERED',3,'','1622563950.17','','',''),('2021-06-01 13:18:36','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000000','PJSIP/10_2000-00000001','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',14,0,'BUSY',3,'','1622564316.0','','',''),('2021-06-01 13:20:29','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000003','PJSIP/10_2000-00000004','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',5,0,'BUSY',3,'','1622564429.3','','',''),('2021-06-01 13:20:44','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000005','','BackGround','press-1',40,40,'ANSWERED',3,'','1622564444.5','','',''),('2021-06-01 13:25:03','\"REMINDER\" <2000>','2000','12','Voicemail','PJSIP/10_2002-00000007','','AppDial2','(Outgoing Line)',1,0,'ANSWERED',3,'','1622564703.7','','',''),('2021-06-01 13:25:00','\"REMINDER\" <2000>','2000','13','Voicemail','PJSIP/10_2002-00000006','','AppDial2','(Outgoing Line)',5,0,'ANSWERED',3,'','1622564700.6','','',''),('2021-06-01 13:35:38','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000008','','BackGround','press-1',39,39,'ANSWERED',3,'','1622565338.8','','',''),('2021-06-01 13:37:47','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000009','','BackGround','press-1',42,42,'ANSWERED',3,'','1622565467.9','','',''),('2021-06-01 13:40:00','\"REMINDER\" <2000>','2000','15','Voicemail','PJSIP/10_2002-0000000b','','AppDial2','(Outgoing Line)',6,0,'ANSWERED',3,'','1622565600.11','','',''),('2021-06-01 13:40:00','\"REMINDER\" <2000>','2000','14','Voicemail','PJSIP/10_2002-0000000a','','AppDial2','(Outgoing Line)',7,0,'ANSWERED',3,'','1622565600.10','','',''),('2021-06-01 14:31:15','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-0000000c','','BackGround','press-1',56,55,'ANSWERED',3,'','1622568675.12','','',''),('2021-06-01 14:35:00','\"REMINDER\" <2000>','2000','16','Voicemail','PJSIP/10_2002-0000000d','','AppDial2','(Outgoing Line)',4,0,'ANSWERED',3,'','1622568900.13','','',''),('2021-06-01 14:39:33','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-0000000e','','BackGround','press-1',50,50,'ANSWERED',3,'','1622569173.14','','',''),('2021-06-01 14:41:00','\"REMINDER\" <2000>','2000','17','Voicemail','PJSIP/10_2002-0000000f','','AppDial2','(Outgoing Line)',3,0,'ANSWERED',3,'','1622569260.15','','',''),('2021-06-04 12:23:52','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000000','','BackGround','press-1',48,48,'ANSWERED',3,'','1622820232.0','','',''),('2021-06-04 12:26:00','\"REMINDER\" <2000>','2000','18','Voicemail','PJSIP/10_2002-00000001','','AppDial2','(Outgoing Line)',11,0,'ANSWERED',3,'','1622820360.1','','',''),('2021-06-04 15:27:30','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000002','','BackGround','press-1',53,53,'ANSWERED',3,'','1622831250.2','','',''),('2021-06-04 15:29:00','\"REMINDER\" <2000>','2000','19','Voicemail','PJSIP/10_2002-00000003','','AppDial2','(Outgoing Line)',5,0,'ANSWERED',3,'','1622831340.3','','',''),('2021-06-04 15:31:22','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000004','','BackGround','press-1',46,45,'ANSWERED',3,'','1622831482.4','','',''),('2021-06-04 15:33:01','\"REMINDER\" <2000>','2000','20','Voicemail','PJSIP/10_2002-00000005','','AppDial2','(Outgoing Line)',3,0,'ANSWERED',3,'','1622831581.5','','',''),('2021-06-04 15:52:55','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000006','','BackGround','press-1',49,49,'ANSWERED',3,'','1622832775.6','','',''),('2021-06-04 15:55:00','\"REMINDER\" <2000>','2000','21','Voicemail','PJSIP/10_2002-00000007','','AGI','VoiceMail.php',3,0,'ANSWERED',3,'','1622832900.7','','',''),('2021-06-04 15:56:41','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000000','','BackGround','press-1',53,53,'ANSWERED',3,'','1622833001.0','','',''),('2021-06-04 15:58:00','\"REMINDER\" <2000>','2000','22','Voicemail','PJSIP/10_2002-00000001','','AGI','VoiceMail.php',2,0,'ANSWERED',3,'','1622833080.1','','',''),('2021-06-04 16:00:12','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000003','PJSIP/10_2000-00000004','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',3,0,'BUSY',3,'','1622833212.3','','',''),('2021-06-07 12:45:29','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000009','PJSIP/10_2000-0000000a','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',2,0,'BUSY',3,'','1623080729.9','','',''),('2021-06-07 13:03:12','\"123\" <10_2000>','10_2000','2002','10','PJSIP/10_2000-00000010','PJSIP/10_2000-00000011','Dial','PJSIP/10_2000/10_2002,60,KktM(vsc-callid)',4,0,'BUSY',3,'','1623081792.16','','',''),('2021-06-07 13:03:40','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000012','','BackGround','press-1',45,45,'ANSWERED',3,'','1623081820.18','','',''),('2021-06-07 13:05:00','\"REMINDER\" <2000>','2000','23','Voicemail','PJSIP/10_2002-00000013','','AGI','VoiceMail.php',4,0,'ANSWERED',3,'','1623081900.19','','',''),('2021-06-07 14:07:32','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000014','','BackGround','press-1',43,42,'ANSWERED',3,'','1623085652.20','','',''),('2021-06-07 14:09:00','\"REMINDER\" <2000>','2000','24','Voicemail','PJSIP/10_2002-00000015','','AGI','VoiceMail.php',3,0,'ANSWERED',3,'','1623085740.21','','',''),('2021-06-07 14:12:58','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000016','','BackGround','press-1',47,47,'ANSWERED',3,'','1623085978.22','','',''),('2021-06-07 14:15:00','\"REMINDER\" <2000>','2000','25','Voicemail','PJSIP/10_2002-00000017','','AGI','VoiceMail.php',4,0,'ANSWERED',3,'','1623086100.23','','',''),('2021-06-07 14:16:52','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-00000018','','BackGround','press-1',44,44,'ANSWERED',3,'','1623086212.24','','',''),('2021-06-07 14:19:01','\"REMINDER\" <2000>','2000','26','Voicemail','PJSIP/10_2002-00000019','','AGI','VoiceMail.php',4,0,'ANSWERED',3,'','1623086341.25','','',''),('2021-06-07 14:28:30','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-0000001a','','BackGround','press-1',44,44,'ANSWERED',3,'','1623086910.26','','',''),('2021-06-07 14:30:00','\"REMINDER\" <2000>','2000','28','Voicemail','PJSIP/10_2002-0000001b','','AGI','VoiceMail.php',3,0,'ANSWERED',3,'','1623087000.27','','',''),('2021-06-07 15:14:15','\"\" <10_2000>','10_2000','21','10','PJSIP/10_2000-0000001c','','BackGround','press-1',47,47,'ANSWERED',3,'','1623089655.28','','',''),('2021-06-07 15:16:00','\"REMINDER\" <2000>','2000','29','Voicemail','PJSIP/10_2002-0000001d','','AGI','VoiceMail.php',8,5,'ANSWERED',3,'','1623089760.29','','','');
/*!40000 ALTER TABLE `astcalldetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `astconfig`
--

DROP TABLE IF EXISTS `astconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `astconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_metric` int(11) NOT NULL DEFAULT '0',
  `var_metric` int(11) NOT NULL DEFAULT '0',
  `commented` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(128) NOT NULL DEFAULT '',
  `category` varchar(128) DEFAULT 'default',
  `var_name` varchar(128) NOT NULL DEFAULT '',
  `var_val` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `filename_comment` (`filename`,`commented`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astconfig`
--

LOCK TABLES `astconfig` WRITE;
/*!40000 ALTER TABLE `astconfig` DISABLE KEYS */;
INSERT INTO `astconfig` VALUES (1,0,0,0,'voicemail.conf','general','format','wav'),(2,0,1,1,'voicemail.conf','general','serveremail','centrex'),(3,0,2,0,'voicemail.conf','general','attach','yes'),(4,0,3,0,'voicemail.conf','general','maxmsg','100'),(5,0,4,1,'voicemail.conf','general','maxsecs','180'),(6,0,5,1,'voicemail.conf','general','minsecs','3'),(7,0,6,1,'voicemail.conf','general','maxgreet','60'),(8,0,7,1,'voicemail.conf','general','skipms','3000'),(9,0,8,1,'voicemail.conf','general','maxsilence','10'),(10,0,9,1,'voicemail.conf','general','silencethreshold','128'),(11,0,10,1,'voicemail.conf','general','maxlogins','3'),(12,0,11,1,'voicemail.conf','general','moveheard','yes'),(13,0,12,1,'voicemail.conf','general','forward_urgent_auto','no'),(14,0,13,1,'voicemail.conf','general','userscontext','default'),(15,0,14,0,'voicemail.conf','general','externnotify','/var/www/discador/src/send_mail.sh'),(16,0,15,1,'voicemail.conf','general','smdienable','yes'),(17,0,16,1,'voicemail.conf','general','smdiport','/dev/ttyS0'),(18,0,17,1,'voicemail.conf','general','externpass','/usr/bin/myapp'),(19,0,18,1,'voicemail.conf','general','externpassnotify','/usr/bin/myapp'),(20,0,19,1,'voicemail.conf','general','externpasscheck','/usr/bin/myapp'),(21,0,20,1,'voicemail.conf','general','directoryintro','dir-intro'),(22,0,21,1,'voicemail.conf','general','charset','ISO-8859-1'),(23,0,22,1,'voicemail.conf','general','adsifdn','0000000F'),(24,0,23,1,'voicemail.conf','general','adsisec','9BDBF7AC'),(25,0,24,1,'voicemail.conf','general','adsiver','1'),(26,0,25,1,'voicemail.conf','general','pbxskip','yes'),(27,0,26,0,'voicemail.conf','general','fromstring','VSC Centrex Virtual'),(28,0,27,1,'voicemail.conf','general','usedirectory','yes'),(29,0,28,0,'voicemail.conf','general','odbcstorage','asterisk'),(30,0,29,0,'voicemail.conf','general','odbctable','astvoicemessages'),(31,0,30,1,'voicemail.conf','general','emailsubject','Centrex Virtual - Mensagem de Voz'),(32,0,31,1,'voicemail.conf','general','emailbody','nova mensagem de voz'),(33,0,32,1,'voicemail.conf','general','pagerbody','New ${VM_DUR} long msg in box ${VM_MAILBOX}\nfrom ${VM_CALLERID}, on ${VM_DATE}'),(34,0,33,0,'voicemail.conf','general','emaildateformat','%d/%m/%Y %H:%M'),(41,1,0,0,'voicemail.conf','zonemessages','eastern','America/New_York|\'vm-received\\\' Q \\\'digits/at\\\' IMp'),(60,0,33,1,'pjsip.conf','general','notifyhold','yes'),(61,0,34,1,'pjsip.conf','general','notifyid','yes'),(62,0,35,1,'pjsip.conf','general','notifyringing','yes'),(63,0,22,0,'pjsip.conf','general','language','es_AR'),(64,0,29,1,'pjsip.conf','general','allowsubscribe','yes'),(57,0,0,0,'extensions.conf','globals','#include','extensions_custom.conf'),(47,0,0,0,'extensions.conf','general','static','yes'),(48,0,1,0,'extensions.conf','general','writeprotect','yes'),(58,0,30,0,'pjsip.conf','general','callcounter','100'),(59,0,31,1,'pjsip.conf','general','limitonpeers','yes'),(51,1,0,0,'extensions.conf','globals','CONSOLE','Console/dsp'),(52,1,1,0,'extensions.conf','globals','IAXINFO','guest'),(53,1,2,0,'extensions.conf','globals','TRUNK','DAHDI/G2'),(54,1,3,0,'extensions.conf','globals','TRUNKMSD','1'),(55,2,0,0,'extensions.conf','from-sip-external','switch','Realtime'),(106,3,0,0,'extensions.conf','10','switch','Realtime'),(107,3,0,0,'extensions.conf','tronco','switch','Realtime'),(108,0,0,0,'extensions.conf','Voicemail','switch','Realtime');
/*!40000 ALTER TABLE `astconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `astdialplans`
--

DROP TABLE IF EXISTS `astdialplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `astdialplans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(20) NOT NULL DEFAULT '',
  `exten` varchar(20) NOT NULL DEFAULT '',
  `priority` tinyint(4) NOT NULL DEFAULT '0',
  `app` varchar(20) NOT NULL DEFAULT '',
  `appdata` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`context`,`exten`,`priority`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astdialplans`
--

LOCK TABLES `astdialplans` WRITE;
/*!40000 ALTER TABLE `astdialplans` DISABLE KEYS */;
INSERT INTO `astdialplans` VALUES (13,'from-sip-external','_X.',1,'AGI','EntrantesTronco.php'),(30,'message_10','_.X!',1,'AGI','Messages.php,${CUT(CUT(CUT(MESSAGE(from),@,1),<,2),:,2)}'),(14,'from-sip-external','h',1,'AGI','EntrantesTronco.php'),(29,'message_10','h',1,'AGI','Messages.php,${CUT(CUT(CUT(MESSAGE(from),@,1),<,2),:,2)}'),(28,'10','h',1,'AGI','Salientes.php'),(27,'10','_.X!',1,'AGI','Salientes.php'),(31,'tronco','_.X!',1,'AGI','SalientesTronco.php'),(32,'tronco','h',1,'AGI','SalientesTronco.php'),(33,'Voicemail','_.X!',1,'AGI','VoiceMail.php');
/*!40000 ALTER TABLE `astdialplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `astmusics`
--

DROP TABLE IF EXISTS `astmusics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `astmusics` (
  `name` varchar(80) NOT NULL,
  `directory` varchar(255) NOT NULL DEFAULT '',
  `application` varchar(255) NOT NULL DEFAULT '',
  `mode` varchar(80) NOT NULL DEFAULT '',
  `digit` char(1) NOT NULL DEFAULT '',
  `sort` varchar(16) NOT NULL DEFAULT '',
  `format` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astmusics`
--

LOCK TABLES `astmusics` WRITE;
/*!40000 ALTER TABLE `astmusics` DISABLE KEYS */;
INSERT INTO `astmusics` VALUES ('1_1','/var/www/sounds/Queue1_1','','files','','',''),('Corp10','/var/www/sounds/Corp10/moh','','files','','','');
/*!40000 ALTER TABLE `astmusics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `astqueue_log`
--

DROP TABLE IF EXISTS `astqueue_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `astqueue_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` varchar(26) NOT NULL DEFAULT '',
  `callid` varchar(40) NOT NULL DEFAULT '',
  `queuename` varchar(20) NOT NULL DEFAULT '',
  `agent` varchar(20) NOT NULL DEFAULT '',
  `event` varchar(20) NOT NULL DEFAULT '',
  `data` varchar(100) NOT NULL DEFAULT '',
  `data1` varchar(40) NOT NULL DEFAULT '',
  `data2` varchar(40) NOT NULL DEFAULT '',
  `data3` varchar(40) NOT NULL DEFAULT '',
  `data4` varchar(40) NOT NULL DEFAULT '',
  `data5` varchar(40) NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `queue` (`queuename`),
  KEY `event` (`event`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astqueue_log`
--

LOCK TABLES `astqueue_log` WRITE;
/*!40000 ALTER TABLE `astqueue_log` DISABLE KEYS */;
INSERT INTO `astqueue_log` VALUES (150,'2021-05-21 18:24:02.464797','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-05-21 18:24:02'),(151,'2021-05-21 18:26:52.702846','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-05-21 18:26:52'),(152,'2021-05-26 12:28:31.689281','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-05-26 12:28:31'),(153,'2021-05-26 12:38:46.743747','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-05-26 12:38:46'),(154,'2021-05-26 17:51:59.196556','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-05-26 17:51:59'),(155,'2021-05-26 18:26:01.622396','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-05-26 18:26:01'),(156,'2021-05-27 14:00:10.230510','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-05-27 14:00:10'),(157,'2021-05-27 14:43:46.488516','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-05-27 14:43:46'),(158,'2021-05-27 15:05:46.538882','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-05-27 15:05:46'),(159,'2021-05-28 13:37:16.927520','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-05-28 13:37:16'),(160,'2021-05-28 13:49:48.003277','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-05-28 13:49:48'),(161,'2021-05-31 13:03:58.573129','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-05-31 13:03:58'),(162,'2021-05-31 10:14:36.506284','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-05-31 13:14:36'),(163,'2021-06-01 11:29:25.278946','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-06-01 14:29:25'),(164,'2021-06-01 11:59:00.584039','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-06-01 14:59:00'),(165,'2021-06-01 13:16:33.056753','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-06-01 16:16:33'),(166,'2021-06-01 15:17:26.075311','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-06-01 18:17:26'),(167,'2021-06-03 15:15:33.594372','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-06-03 18:15:33'),(168,'2021-06-04 11:33:04.884629','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-06-04 14:33:04'),(169,'2021-06-04 12:00:22.146626','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-06-04 15:00:22'),(170,'2021-06-04 12:04:17.071072','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-06-04 15:04:17'),(171,'2021-06-04 15:56:34.462664','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-06-04 18:56:34'),(172,'2021-06-07 12:36:52.154243','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-06-07 15:36:52'),(173,'2021-06-08 10:36:53.322012','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-06-08 13:36:53'),(174,'2021-06-08 10:58:39.735293','NONE','NONE','NONE','QUEUESTART','','','','','','','2021-06-08 13:58:39');
/*!40000 ALTER TABLE `astqueue_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `astqueue_members`
--

DROP TABLE IF EXISTS `astqueue_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `astqueue_members` (
  `queue_name` varchar(80) NOT NULL,
  `interface` varchar(80) NOT NULL,
  `membername` varchar(80) DEFAULT NULL,
  `state_interface` varchar(80) DEFAULT NULL,
  `penalty` int(11) DEFAULT NULL,
  `paused` int(11) DEFAULT NULL,
  `uniqueid` int(11) NOT NULL AUTO_INCREMENT,
  `wrapuptime` int(11) DEFAULT NULL,
  PRIMARY KEY (`queue_name`,`interface`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astqueue_members`
--

LOCK TABLES `astqueue_members` WRITE;
/*!40000 ALTER TABLE `astqueue_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `astqueue_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `astqueue_rules`
--

DROP TABLE IF EXISTS `astqueue_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `astqueue_rules` (
  `rule_name` varchar(80) NOT NULL,
  `time` varchar(32) NOT NULL,
  `min_penalty` varchar(32) NOT NULL,
  `max_penalty` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astqueue_rules`
--

LOCK TABLES `astqueue_rules` WRITE;
/*!40000 ALTER TABLE `astqueue_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `astqueue_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `astqueues`
--

DROP TABLE IF EXISTS `astqueues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `astqueues` (
  `name` varchar(128) NOT NULL,
  `musiconhold` varchar(128) DEFAULT NULL,
  `announce` varchar(128) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `ringinuse` enum('yes','no') DEFAULT NULL,
  `setinterfacevar` enum('yes','no') DEFAULT NULL,
  `setqueuevar` enum('yes','no') DEFAULT NULL,
  `setqueueentryvar` enum('yes','no') DEFAULT NULL,
  `monitor_format` varchar(8) DEFAULT NULL,
  `membermacro` varchar(512) DEFAULT NULL,
  `membergosub` varchar(512) DEFAULT NULL,
  `queue_youarenext` varchar(128) DEFAULT NULL,
  `queue_thereare` varchar(128) DEFAULT NULL,
  `queue_callswaiting` varchar(128) DEFAULT NULL,
  `queue_quantity1` varchar(128) DEFAULT NULL,
  `queue_quantity2` varchar(128) DEFAULT NULL,
  `queue_holdtime` varchar(128) DEFAULT NULL,
  `queue_minutes` varchar(128) DEFAULT NULL,
  `queue_minute` varchar(128) DEFAULT NULL,
  `queue_seconds` varchar(128) DEFAULT NULL,
  `queue_thankyou` varchar(128) DEFAULT NULL,
  `queue_callerannounce` varchar(128) DEFAULT NULL,
  `queue_reporthold` varchar(128) DEFAULT NULL,
  `announce_frequency` int(11) DEFAULT NULL,
  `announce_to_first_user` enum('yes','no') DEFAULT NULL,
  `min_announce_frequency` int(11) DEFAULT NULL,
  `announce_round_seconds` int(11) DEFAULT NULL,
  `announce_holdtime` varchar(128) DEFAULT NULL,
  `announce_position` varchar(128) DEFAULT NULL,
  `announce_position_limit` int(11) DEFAULT NULL,
  `periodic_announce` varchar(50) DEFAULT NULL,
  `periodic_announce_frequency` int(11) DEFAULT NULL,
  `relative_periodic_announce` enum('yes','no') DEFAULT NULL,
  `random_periodic_announce` enum('yes','no') DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `wrapuptime` int(11) DEFAULT NULL,
  `penaltymemberslimit` int(11) DEFAULT NULL,
  `autofill` enum('yes','no') DEFAULT NULL,
  `monitor_type` varchar(128) DEFAULT NULL,
  `autopause` enum('yes','no','all') DEFAULT NULL,
  `autopausedelay` int(11) DEFAULT NULL,
  `autopausebusy` enum('yes','no') DEFAULT NULL,
  `autopauseunavail` enum('yes','no') DEFAULT NULL,
  `maxlen` int(11) DEFAULT NULL,
  `servicelevel` int(11) DEFAULT NULL,
  `strategy` enum('ringall','leastrecent','fewestcalls','random','rrmemory','linear','wrandom','rrordered') DEFAULT NULL,
  `joinempty` varchar(128) DEFAULT NULL,
  `leavewhenempty` varchar(128) DEFAULT NULL,
  `reportholdtime` enum('yes','no') DEFAULT NULL,
  `memberdelay` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `timeoutrestart` enum('yes','no') DEFAULT NULL,
  `defaultrule` varchar(128) DEFAULT NULL,
  `timeoutpriority` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astqueues`
--

LOCK TABLES `astqueues` WRITE;
/*!40000 ALTER TABLE `astqueues` DISABLE KEYS */;
INSERT INTO `astqueues` VALUES ('1_1','1_1','/var/www/sounds/','1',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ringall',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `astqueues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `astvoicemessages`
--

DROP TABLE IF EXISTS `astvoicemessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `astvoicemessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgnum` int(11) NOT NULL DEFAULT '0',
  `dir` varchar(80) DEFAULT '',
  `context` varchar(80) DEFAULT '',
  `macrocontext` varchar(80) DEFAULT '',
  `callerid` varchar(40) DEFAULT '',
  `origtime` varchar(40) DEFAULT '',
  `duration` varchar(20) DEFAULT '',
  `mailboxuser` varchar(80) DEFAULT '',
  `mailboxcontext` varchar(80) DEFAULT '',
  `recording` longblob,
  `flag` varchar(128) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `dir` (`dir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astvoicemessages`
--

LOCK TABLES `astvoicemessages` WRITE;
/*!40000 ALTER TABLE `astvoicemessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `astvoicemessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bupcdrs`
--

DROP TABLE IF EXISTS `bupcdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bupcdrs` (
  `id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caller` varchar(150) NOT NULL,
  `dialed` varchar(150) NOT NULL,
  `destination` varchar(150) NOT NULL,
  `duration` varchar(150) DEFAULT '0',
  `billsec` varchar(150) DEFAULT '0',
  `restPattern` varchar(150) DEFAULT NULL,
  `destID` int(11) DEFAULT NULL,
  `result` varchar(150) DEFAULT NULL,
  `cdruniqueid` varchar(150) DEFAULT NULL,
  `callid` varchar(150) DEFAULT NULL,
  `trunk` varchar(150) DEFAULT NULL,
  `endcall` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bupcdrs`
--

LOCK TABLES `bupcdrs` WRITE;
/*!40000 ALTER TABLE `bupcdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bupcdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdrs`
--

DROP TABLE IF EXISTS `cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caller` varchar(150) NOT NULL,
  `dialed` varchar(150) NOT NULL,
  `destination` varchar(150) NOT NULL,
  `duration` varchar(150) DEFAULT '0',
  `billsec` varchar(150) DEFAULT '0',
  `restPattern` varchar(150) DEFAULT NULL,
  `destID` int(11) DEFAULT NULL,
  `result` varchar(150) DEFAULT NULL,
  `cdruniqueid` varchar(150) DEFAULT NULL,
  `callid` varchar(150) DEFAULT NULL,
  `trunk` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdrs`
--

LOCK TABLES `cdrs` WRITE;
/*!40000 ALTER TABLE `cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdrsVSC`
--

DROP TABLE IF EXISTS `cdrsVSC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdrsVSC` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `ani` varchar(255) DEFAULT NULL,
  `conferenceid` varchar(1000) DEFAULT NULL,
  `usercost` double DEFAULT NULL,
  `transactionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdrsVSC`
--

LOCK TABLES `cdrsVSC` WRITE;
/*!40000 ALTER TABLE `cdrsVSC` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdrsVSC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corps`
--

DROP TABLE IF EXISTS `corps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corps` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `enabled` int(1) NOT NULL DEFAULT '1',
  `extLen` int(11) NOT NULL,
  `extMax` int(11) NOT NULL,
  `queMax` int(11) NOT NULL,
  `monEnabled` int(1) NOT NULL DEFAULT '0',
  `monPath` varchar(255) DEFAULT NULL,
  `AllowCustom` bit(1) DEFAULT NULL,
  `AllowDiscador` bit(1) DEFAULT NULL,
  `CostEnabled` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corps`
--

LOCK TABLES `corps` WRITE;
/*!40000 ALTER TABLE `corps` DISABLE KEYS */;
INSERT INTO `corps` VALUES (10,'E Corp',1,4,1234,12,1,'/home/asterisk',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `corps` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%.%.%.%`*/ /*!50003 TRIGGER `corpsInsert` AFTER INSERT ON `corps` FOR EACH ROW BEGIN
	DECLARE metric VARCHAR(330) DEFAULT (SELECT (cat_metric+1) AS new_metric 
	FROM astconfig WHERE filename='extensions.conf' ORDER BY cat_metric DESC LIMIT 1);
	INSERT INTO astconfig  (cat_metric,filename,category,var_name,var_val) VALUES (metric,'extensions.conf',NEW.ID,'switch','Realtime');
	INSERT INTO astdialplans (context,exten,priority,app,appdata) VALUES (NEW.ID,'_.X!','1','AGI','Salientes.php');
	INSERT INTO astdialplans (context,exten,priority,app,appdata) VALUES (NEW.ID,'h','1','AGI','Salientes.php');
	INSERT INTO astdialplans (context,exten,priority,app,appdata) VALUES (CONCAT('message_', NEW.ID),'h','1','AGI','Messages.php,${CUT(CUT(CUT(MESSAGE(from),@,1),<,2),:,2)}');
	INSERT INTO astdialplans (context,exten,priority,app,appdata) VALUES (CONCAT('message_', NEW.ID),'_.X!','1','AGI','Messages.php,${CUT(CUT(CUT(MESSAGE(from),@,1),<,2),:,2)}');
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%.%.%.%`*/ /*!50003 TRIGGER `corpsDelete` AFTER DELETE ON `corps` FOR EACH ROW BEGIN
	DELETE FROM astconfig WHERE filename = 'extensions.conf' AND category = OLD.ID;
	DELETE FROM astdialplans WHERE context = OLD.ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dac_numbers`
--

DROP TABLE IF EXISTS `dac_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dac_numbers` (
  `number` varchar(50) NOT NULL,
  `corp` varchar(50) DEFAULT '',
  `queue` varchar(50) DEFAULT '',
  `last_updated` varchar(50) NOT NULL,
  `status` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dac_numbers`
--

LOCK TABLES `dac_numbers` WRITE;
/*!40000 ALTER TABLE `dac_numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dac_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dac_queues`
--

DROP TABLE IF EXISTS `dac_queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dac_queues` (
  `queue` varchar(50) NOT NULL,
  `trunk` varchar(50) NOT NULL,
  `timeout` varchar(50) NOT NULL,
  `sound` varchar(50) DEFAULT '',
  `corp` varchar(50) DEFAULT '',
  UNIQUE KEY `queue` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dac_queues`
--

LOCK TABLES `dac_queues` WRITE;
/*!40000 ALTER TABLE `dac_queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `dac_queues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination_group_patterns`
--

DROP TABLE IF EXISTS `destination_group_patterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destination_group_patterns` (
  `group` int(10) NOT NULL,
  `pattern` varchar(255) NOT NULL,
  `destination` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination_group_patterns`
--

LOCK TABLES `destination_group_patterns` WRITE;
/*!40000 ALTER TABLE `destination_group_patterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `destination_group_patterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination_groups`
--

DROP TABLE IF EXISTS `destination_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destination_groups` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination_groups`
--

LOCK TABLES `destination_groups` WRITE;
/*!40000 ALTER TABLE `destination_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `destination_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinations`
--

DROP TABLE IF EXISTS `destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destinations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pattern` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name_pattern` (`name`,`pattern`),
  UNIQUE KEY `pattern` (`pattern`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinations`
--

LOCK TABLES `destinations` WRITE;
/*!40000 ALTER TABLE `destinations` DISABLE KEYS */;
/*!40000 ALTER TABLE `destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discador`
--

DROP TABLE IF EXISTS `discador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discador` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `comments` varchar(255) COLLATE utf8_bin NOT NULL,
  `trunk` int(11) NOT NULL,
  `callLimit` int(11) NOT NULL DEFAULT '10',
  `currentCalls` int(11) NOT NULL DEFAULT '0',
  `timeout` varchar(50) COLLATE utf8_bin NOT NULL,
  `sound` varchar(255) COLLATE utf8_bin DEFAULT '',
  `corp` varchar(50) COLLATE utf8_bin DEFAULT '',
  `action` varchar(50) COLLATE utf8_bin DEFAULT '',
  `retries` int(50) DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `previousState` int(11) NOT NULL DEFAULT '0',
  `running` int(11) NOT NULL DEFAULT '0',
  `days` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `horaDesde` int(11) DEFAULT NULL,
  `horaHasta` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_discador_trunks` (`trunk`),
  CONSTRAINT `FK_discador_trunks` FOREIGN KEY (`trunk`) REFERENCES `trunks` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discador`
--

LOCK TABLES `discador` WRITE;
/*!40000 ALTER TABLE `discador` DISABLE KEYS */;
/*!40000 ALTER TABLE `discador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discador_exten_history`
--

DROP TABLE IF EXISTS `discador_exten_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discador_exten_history` (
  `exten` int(11) DEFAULT NULL,
  `corpID` int(11) DEFAULT NULL,
  `state` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discador_exten_history`
--

LOCK TABLES `discador_exten_history` WRITE;
/*!40000 ALTER TABLE `discador_exten_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `discador_exten_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discador_history`
--

DROP TABLE IF EXISTS `discador_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discador_history` (
  `ID` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `comments` varchar(255) COLLATE utf8_bin NOT NULL,
  `trunk` varchar(50) COLLATE utf8_bin NOT NULL,
  `callLimit` int(11) NOT NULL DEFAULT '10',
  `currentCalls` int(11) NOT NULL DEFAULT '0',
  `timeout` varchar(50) COLLATE utf8_bin NOT NULL,
  `sound` varchar(255) COLLATE utf8_bin DEFAULT '',
  `corp` varchar(50) COLLATE utf8_bin DEFAULT '',
  `action` varchar(50) COLLATE utf8_bin DEFAULT '',
  `retries` int(50) DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `running` int(11) NOT NULL DEFAULT '0',
  `horaDesde` int(11) DEFAULT NULL,
  `horaHasta` int(11) DEFAULT NULL,
  `when` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discador_history`
--

LOCK TABLES `discador_history` WRITE;
/*!40000 ALTER TABLE `discador_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `discador_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discador_numbers`
--

DROP TABLE IF EXISTS `discador_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discador_numbers` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(50) COLLATE utf8_bin NOT NULL,
  `countRetries` int(50) DEFAULT '0',
  `discador` bigint(20) NOT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `statusCode` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `inUse` int(50) DEFAULT '0',
  `resultCode` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cdrUniqueId` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_number_queue` (`number`,`discador`),
  KEY `FK_discador_numbers` (`discador`),
  CONSTRAINT `FK_discador_numbers` FOREIGN KEY (`discador`) REFERENCES `discador` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discador_numbers`
--

LOCK TABLES `discador_numbers` WRITE;
/*!40000 ALTER TABLE `discador_numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `discador_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discador_numbers_history`
--

DROP TABLE IF EXISTS `discador_numbers_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discador_numbers_history` (
  `number` varchar(50) COLLATE utf8_bin NOT NULL,
  `countRetries` int(50) DEFAULT '0',
  `discador` bigint(20) NOT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `statusCode` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `inUse` int(50) DEFAULT '0',
  `resultCode` varchar(50) COLLATE utf8_bin DEFAULT '0',
  `cdrUniqueId` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  KEY `FK_discador_numbers_history` (`discador`),
  CONSTRAINT `FK_discador_numbers_history` FOREIGN KEY (`discador`) REFERENCES `discador` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discador_numbers_history`
--

LOCK TABLES `discador_numbers_history` WRITE;
/*!40000 ALTER TABLE `discador_numbers_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `discador_numbers_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discador_queue_history`
--

DROP TABLE IF EXISTS `discador_queue_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discador_queue_history` (
  `queue` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `inUse` int(11) DEFAULT NULL,
  `notInUse` int(11) DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discador_queue_history`
--

LOCK TABLES `discador_queue_history` WRITE;
/*!40000 ALTER TABLE `discador_queue_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `discador_queue_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extens`
--

DROP TABLE IF EXISTS `extens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extens` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `number` int(10) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pass` varchar(255) NOT NULL,
  `corpID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `trunkID` int(11) NOT NULL,
  `outer` varchar(255) DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT '1',
  `action` varchar(255) DEFAULT NULL,
  `onbusy` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `vmpass` varchar(10) DEFAULT NULL,
  `callgroup` varchar(5) NOT NULL,
  `spy` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `extNumber_extCorpID` (`number`,`corpID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extens`
--

LOCK TABLES `extens` WRITE;
/*!40000 ALTER TABLE `extens` DISABLE KEYS */;
INSERT INTO `extens` VALUES (21,1000,NULL,'1000aa1000',1,1,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,'',0),(22,2000,'123','2000aa2000',10,2,0,'123',1,'ring','followme',NULL,NULL,NULL,'123','1',1),(23,2002,'','2002aa2002',10,2,0,'',1,'ring','followme',NULL,NULL,NULL,'123','1',0),(24,2003,'','2003aa2003',10,2,0,'',1,'ring','voicemail',NULL,NULL,NULL,'1234','1',0);
/*!40000 ALTER TABLE `extens` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%.%.%.%`*/ /*!50003 TRIGGER `extensInsert` AFTER INSERT ON `extens` FOR EACH ROW BEGIN
	DECLARE email VARCHAR(255) DEFAULT (SELECT mail FROM users u WHERE u.ID=NEW.userID);
	DECLARE dtmfmode VARCHAR(500) DEFAULT (SELECT value FROM params WHERE name='dtmfmode' LIMIT 1);
	DECLARE lang VARCHAR(500) DEFAULT (SELECT value FROM params WHERE name='language' LIMIT 1);
	DECLARE allow VARCHAR(500) DEFAULT (SELECT value FROM params WHERE name='allow' LIMIT 1);
	DECLARE disallow VARCHAR(500) DEFAULT (SELECT value FROM params WHERE name='disallow' LIMIT 1);
	DECLARE qualify VARCHAR(500) DEFAULT (SELECT value FROM params WHERE name='qualify' LIMIT 1);
	DECLARE allowtransfer VARCHAR(500) DEFAULT (SELECT value FROM params WHERE name='allowtransfer' LIMIT 1);

	DECLARE extension VARCHAR(10);
	SET extension = CONCAT(NEW.corpID, '_', NEW.number);
	INSERT INTO ps_aors (`id`, `max_contacts`, `qualify_frequency`) VALUES (extension, 1, qualify);
		
	INSERT INTO ps_auths (`id`, `auth_type`, `password`, `username`) VALUES (extension, 'userpass', NEW.pass, extension);
	
	INSERT INTO ps_endpoints(`id`, `transport`, `aors`, `auth`, `context`, `disallow`, `allow`, `direct_media`,
	`mailboxes`, `dtmf_mode`, `language`,`allow_transfer`)
	VALUES
	(extension, 'transport-udp', extension, extension, NEW.CorpId, disallow, allow,  'no', 
	email, dtmfmode, lang,  allowtransfer);

	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%.%.%.%`*/ /*!50003 TRIGGER `extensUpdate` AFTER UPDATE ON `extens` FOR EACH ROW BEGIN
	DECLARE extension VARCHAR(10);
	DECLARE mail VARCHAR(255) DEFAULT (SELECT mail FROM users u WHERE u.ID=new.userID);
	SET extension = CONCAT(NEW.corpID, '_', NEW.number);
	IF NEW.pass != OLD.pass THEN
		UPDATE ps_auths SET `password` = NEW.pass WHERE id = extension;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%.%.%.%`*/ /*!50003 TRIGGER `extensDelete` BEFORE DELETE ON `extens` FOR EACH ROW BEGIN
	DECLARE extension VARCHAR(10);
	SET extension = CONCAT(OLD.corpID, '_', OLD.number);
	
	DELETE FROM ps_aors WHERE id = extension;
	DELETE FROM ps_auths WHERE id = extension;
	DELETE FROM ps_endpoints WHERE id = extension;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `extensions`
--

DROP TABLE IF EXISTS `extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extensions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `exten` varchar(40) NOT NULL,
  `priority` int(11) NOT NULL,
  `app` varchar(40) NOT NULL,
  `appdata` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `context` (`context`,`exten`,`priority`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extensions`
--

LOCK TABLES `extensions` WRITE;
/*!40000 ALTER TABLE `extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follows` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT '0',
  `entityID` int(10) NOT NULL,
  `order` int(10) NOT NULL,
  `number` int(10) NOT NULL,
  `timeout` int(10) NOT NULL,
  `typeCall` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `type_entityID_order` (`type`,`entityID`,`order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globals`
--

DROP TABLE IF EXISTS `globals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globals` (
  `variable` char(20) NOT NULL,
  `value` char(50) NOT NULL,
  PRIMARY KEY (`variable`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globals`
--

LOCK TABLES `globals` WRITE;
/*!40000 ALTER TABLE `globals` DISABLE KEYS */;
/*!40000 ALTER TABLE `globals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaxfriends`
--

DROP TABLE IF EXISTS `iaxfriends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaxfriends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `dbsecret` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `regcontext` varchar(40) DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `ipaddr` varchar(40) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `defaultip` varchar(20) DEFAULT NULL,
  `sourceaddress` varchar(20) DEFAULT NULL,
  `mask` varchar(20) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `regseconds` int(11) DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `mohinterpret` varchar(20) DEFAULT NULL,
  `mohsuggest` varchar(20) DEFAULT NULL,
  `inkeys` varchar(40) DEFAULT NULL,
  `outkeys` varchar(40) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `callerid` varchar(100) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `sendani` enum('yes','no') DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunk` enum('yes','no') DEFAULT NULL,
  `auth` varchar(20) DEFAULT NULL,
  `maxauthreq` int(11) DEFAULT NULL,
  `requirecalltoken` enum('yes','no','auto') DEFAULT NULL,
  `encryption` enum('yes','no','aes128') DEFAULT NULL,
  `transfer` enum('yes','no','mediaonly') DEFAULT NULL,
  `jitterbuffer` enum('yes','no') DEFAULT NULL,
  `forcejitterbuffer` enum('yes','no') DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `codecpriority` varchar(40) DEFAULT NULL,
  `qualify` varchar(10) DEFAULT NULL,
  `qualifysmoothing` enum('yes','no') DEFAULT NULL,
  `qualifyfreqok` varchar(10) DEFAULT NULL,
  `qualifyfreqnotok` varchar(10) DEFAULT NULL,
  `timezone` varchar(20) DEFAULT NULL,
  `adsi` enum('yes','no') DEFAULT NULL,
  `amaflags` varchar(20) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `iaxfriends_name` (`name`),
  KEY `iaxfriends_name_host` (`name`,`host`),
  KEY `iaxfriends_name_ipaddr_port` (`name`,`ipaddr`,`port`),
  KEY `iaxfriends_ipaddr_port` (`ipaddr`,`port`),
  KEY `iaxfriends_host_port` (`host`,`port`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaxfriends`
--

LOCK TABLES `iaxfriends` WRITE;
/*!40000 ALTER TABLE `iaxfriends` DISABLE KEYS */;
/*!40000 ALTER TABLE `iaxfriends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integration`
--

DROP TABLE IF EXISTS `integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(128) DEFAULT NULL,
  `host` varchar(128) DEFAULT NULL,
  `user` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `corpID` int(11) NOT NULL,
  `option1` varchar(15) DEFAULT NULL,
  `option2` varchar(15) DEFAULT NULL,
  `option3` varchar(15) DEFAULT NULL,
  `sound1` varchar(128) DEFAULT NULL,
  `sound2` varchar(128) DEFAULT NULL,
  `sound3` varchar(128) DEFAULT NULL,
  `sound4` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `corpID` (`corpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integration`
--

LOCK TABLES `integration` WRITE;
/*!40000 ALTER TABLE `integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ivr_answers`
--

DROP TABLE IF EXISTS `ivr_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ivr_answers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdruniqueid` varchar(150) DEFAULT NULL,
  `callid` varchar(150) DEFAULT NULL,
  `optionAnswer` int(5) unsigned DEFAULT NULL,
  `dateAnswer` timestamp NULL DEFAULT NULL,
  `exten` varchar(15) DEFAULT NULL,
  `ivr` int(11) DEFAULT NULL,
  `corp` int(11) unsigned DEFAULT NULL,
  `trunk` varchar(150) DEFAULT NULL,
  `queue` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ivr_answers`
--

LOCK TABLES `ivr_answers` WRITE;
/*!40000 ALTER TABLE `ivr_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ivr_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ivrs`
--

DROP TABLE IF EXISTS `ivrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ivrs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sound` varchar(255) NOT NULL,
  `corpID` int(11) NOT NULL,
  `option0` varchar(15) DEFAULT NULL,
  `option1` varchar(15) DEFAULT NULL,
  `option2` varchar(15) DEFAULT NULL,
  `option3` varchar(15) DEFAULT NULL,
  `option4` varchar(15) DEFAULT NULL,
  `option5` varchar(15) DEFAULT NULL,
  `option6` varchar(15) DEFAULT NULL,
  `option7` varchar(15) DEFAULT NULL,
  `option8` varchar(15) DEFAULT NULL,
  `option9` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ivrName_ivrCorpID` (`name`,`corpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ivrs`
--

LOCK TABLES `ivrs` WRITE;
/*!40000 ALTER TABLE `ivrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ivrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langses`
--

DROP TABLE IF EXISTS `langses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langses` (
  `en` varchar(550) NOT NULL,
  `es` varchar(550) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langses`
--

LOCK TABLES `langses` WRITE;
/*!40000 ALTER TABLE `langses` DISABLE KEYS */;
INSERT INTO `langses` VALUES ('addContext','Adicionar contexto'),('addTrunk','Adicionar Trunk'),('add_dial','A&ntilde;adir nuevo marcado r&aacute;pido'),('add_followme','A&ntilde;adir nuevo Follow Me'),('all','Todos'),('announce_sound_format_note','Archivos (.wav) en formato PCM, 8Khz, 16 bits '),('answer','Respuesta'),('atention_dec_panel','Primero debe seleccionar una Extensi&oacute;n para insertarla en una Cola'),('atention_desc_panel','No hay una Extensi&oacute;n seleccionada para la Cola'),('atention_panel','Atenci&oacute;n'),('average_poll','Promedio'),('btn_exit','Salir'),('btn_view_corps','Ver Corporaciones'),('btn_view_destinations','Ver Destinos'),('btn_view_destinations_group','Ver Grupo de Destinos'),('btn_view_dial','Ver Marcado R&aacute;pido'),('btn_view_extens','Ver Extensiones'),('btn_view_integration','Ver integraciones'),('btn_view_ivrs','Ver IVRs'),('btn_view_media_servers','Ver Media Servers'),('btn_view_outboundvm','Ver voiceMails'),('btn_view_polls','Ver Encuesta'),('btn_view_queues','Ver Colas'),('btn_view_restrictions','Ver Restricciones'),('btn_view_servers','Ver Servers'),('btn_view_time','Lista de Horarios'),('btn_view_trunks','Ver Trunks'),('btn_view_users','Ver Usuarios'),('call_forward','Desv&iacute;o de llamadas'),('CALL_RESTRICTED','Llamada restringida'),('cal_April','Abril'),('cal_August','Agosto'),('cal_December','Diciembre'),('cal_February','Febrero'),('cal_Fr','Vie'),('cal_Friday','Viernes'),('cal_January','Enero'),('cal_July','Julio'),('cal_June','Junio'),('cal_May','Mayo'),('cal_Mo','Lun'),('cal_Monday','Lunes'),('cal_next_year','a&ntilde;o sig.'),('cal_November','Noviembre'),('cal_October','Octubre'),('cal_prev_year','a&ntilde;o ant.'),('cal_Saturday','S&aacute;bado'),('cal_September','Septiembre'),('cal_Su','Dom'),('cal_Sunday','Domingo'),('cal_Th','Jue'),('cal_Thursday','Jueves'),('cal_Tu','Mar'),('cal_Tuesday','Martes'),('cal_We','Mie'),('cal_Wednesday','Mi&eacute;rcoles'),('CANCEL','Cancelada'),('capture_by_size','Ingrese el tama&ntilde;o'),('capture_by_size_incorrect_input','Tama&ntilde;o incorrecto'),('capture_by_size_input','Ingrese el tama&ntilde;o [en MB]: '),('capture_by_time','Ingrese el tiempo'),('capture_by_time_incorrect_input','Tiempo incorrecto'),('capture_by_time_input','Ingrese el tiempo [en segundos, mayor o igual a 2]: '),('capture_packet','Captura de paquetes'),('capture_please_wait','La captura se est&aacute; generando, por favor aguarde...'),('cc_ddd','C&oacute;digo de Pa&iacute;s o DDD'),('cdr_audio','Audio'),('cdr_billsec','Duraci&oacute;n'),('cdr_called','Destino'),('cdr_caller','Origen'),('cdr_calltype','Tipo'),('cdr_calltype_quantity','Cantidad'),('cdr_date','Fecha'),('cdr_destination','Destino'),('cdr_destinationtype','Tipo de Destino'),('cdr_detailed','Detallado'),('cdr_exten','Extensi&oacute;n'),('cdr_from','Desde'),('cdr_list_title','CDRs'),('cdr_name','Nombre'),('cdr_note','El filtrado es hecho desde las 00:00 hs del d&iacute;a desde, hasta las 23:59 hs del d&iacute;a hasta.'),('cdr_restPattern','Prefijo'),('cdr_result','Resultados'),('cdr_search','Buscar'),('cdr_subtotal','Subtotal'),('cdr_to','Hasta'),('cdr_total','Total'),('cdr_total_billsec','Duraci&oacute;n Total'),('cdr_usercost','Costo'),('color_bg_active','Color de fondo de secci&oacute;n activa: '),('color_bg_default','Color de fondo de secciones: '),('color_blue_css','Color de men&uacute; lateral: '),('color_font_active','Color de fuente de la secci&oacute;n activa: '),('color_font_default','Color de fuente de secciones: '),('color_footer_bar','Color de pi&eacute; de p&aacute;gina: '),('color_nav_bar','Color de la barra de secciones: '),('col_title_exten_action','Acci&oacute;n'),('col_title_exten_actions','Acciones'),('col_title_exten_ID','ID'),('col_title_exten_number','N&uacute;mero'),('config_bar','Configuraci&oacute;n'),('CONGESTION','Congestionamiento'),('corp','Corporaci&oacute;n'),('CORP::delete_IVR_EXISTS','Error - Existe el IVR'),('CORP::delete_RESTRICTIONS_EXISTS','Borre las Restricciones'),('CORP::delete_TIMETABLES_COUNT','Error - Borrando Horario'),('corp_AllowCustom','Permitir cambiar Look & Feel'),('corp_AllowCustom_table','Look & Feel'),('corp_AllowDiscador','Habilitar Discador'),('corp_AllowDiscador_table','Discador'),('corp_Enabled','Habilitado'),('corp_ExtLen','Long. de la Extensi&oacute;n'),('corp_ExtMax','Cant. Max. de Extensiones'),('corp_form_title_add','Adicionar'),('corp_form_title_update','Actualizar'),('corp_MonEnabled','Grabaciones'),('corp_MonPath','Carpeta'),('corp_Name','Nombre'),('corp_noteAllowCustom','Este cambio ser&aacute; aplicado cuando el usuario ingrese nuevamente al navegador'),('corp_noteMaxExten','Si la long. de la Extensi&oacute;n es 3, el n&uacute;m. m&aacute;ximo de Extensiones es 799, y si es 4, el n&uacute;mero m&aacute;ximo de Extensiones ser&iacute;a 8999'),('corp_QueMax','Cant. Max. de Colas'),('dashboard_bar','Dashboard'),('del-restriction-exten-ok','Restricci&oacute;n borrada con &eacute;xito'),('delete_corp_ok','Corporaci&oacute;n borrada con &eacute;xito '),('delete_corp_text1',' Confirma exclusi&oacute;n de la Corporaci&oacute;n'),('delete_corp_text2','Ser&aacute;n borrado los Usuarios, las Colas, los Trunks, las Extensiones, los IVRs y las Restricciones que pertenecen a la Corporaci&oacute;n'),('delete_corp_title','Borrar Corporaci&oacute;n'),('delete_destinationgroup_text1',' Confirmar exclusi&oacute;n del Grupo de Destino'),('delete_destination_groups_title','Borrar Grupo de Destino'),('delete_destination_group_title','Borrar Grupo de Destino'),('delete_destination_ok','Destino borrado con &eacute;xito'),('delete_destination_text1',' Confirmar exclusi&oacute;n del Destino'),('delete_destination_title','Borrar Destino'),('delete_dgroup_text1',' Confirmar exclusi&oacute;n del Grupo de Destino'),('delete_dial_exten_ok','Extensi&oacute;n borrada con &eacute;xito'),('delete_dial_exten_title','Borrar Marcado R&aacute;pido - Extensi&oacute;n'),('delete_dial_ok','Marcado R&aacute;pido borrado con &eacute;xito'),('delete_dial_text1',' Confirmar exclusi&oacute;n del Marcado R&aacute;pido'),('delete_dial_title','Borrar Marcado R&aacute;pido'),('delete_exten_text1',' Confirmar exclusi&oacute;n de la Extensi&oacute;n'),('delete_exten_title','Borrar Extensi&oacute;n'),('delete_follow_exten_ok','Follow Me - Extensi&oacute;n borrada con &eacute;xito'),('delete_follow_exten_title','Borrar Follow Me - Extensi&oacute;n'),('delete_follow_text1',' Confirmar exclusi&oacute;n del Follow Me'),('delete_integration_ok','Integraci&oacute;n borrada con &eacute;xito'),('delete_integration_text1',' Confirmar exclusi&oacute;n de la integraci&oacute;n'),('delete_integration_title','Borrar integraci&oacute;n'),('delete_ivr_ok','IVR borrado con &eacute;xito'),('delete_ivr_text1',' Confirmar exclusi&oacute;n del IVR'),('delete_ivr_title','Borrar IVR'),('delete_mediaserver_text1',' Confirmar exclusi&oacute;n del Media Server'),('delete_media_server_title','Borrar Media Server'),('delete_outboundvm_ok','Voicemail borrado con &eacute;xito'),('delete_outboundvm_text1','Confirmar exclusi&oacute;n del Voicemail'),('delete_outboundvm_text2','Origen: '),('delete_outboundvm_text3','Destino: '),('delete_outboundvm_text4','Fecha: '),('delete_outboundvm_title','Borrar Voicemail'),('delete_poll_ok','Encuesta borrada con &eacute;xito'),('delete_poll_text1',' Confirmar exclusi&oacute;n de la Encuesta'),('delete_poll_title','Borrar Encuesta'),('delete_question_text1',' Confirmar exclusi&oacute;n de la Pregunta'),('delete_question_title','Borrar Pregunta'),('delete_queue_ok','Cola borrada con &eacute;xito'),('delete_queue_text1',' Confirmar exclusi&oacute;n de la Cola'),('delete_queue_title','Borrar Cola'),('delete_restriction_exten_title','Borrar Restricci&oacute;n'),('delete_restriction_ok','Restricci&oacute;n borrada con &eacute;xito'),('delete_restriction_text1',' Confirmar exclusi&oacute;n de la Restricci&oacute;n'),('delete_restriction_title','Borrar Restricci&oacute;n'),('delete_server_ok','El Server fu&eacute; borrado con &eacute;xito '),('delete_server_text1',' Confirmar exclusi&oacute;n del Server y sus Trunks asociados'),('delete_server_title','Borrar Server'),('delete_speeddial_text1',' Confirmar exclusi&oacute;n del Marcado R&aacute;pido'),('delete_time_ok','Horario borrado con &eacute;xito'),('delete_time_text1',' Confirmar exclusi&oacute;n del Horario'),('delete_time_title','Borrar Horario'),('delete_trunk_text1',' Confirmar exclusi&oacute;n del Trunk'),('delete_trunk_title','Borrar Trunk'),('delete_user_ok','Usuario borrado con &eacute;xito'),('delete_user_ok','Usuario borrado con &eacute;xito'),('delete_user_text1',' Confirmar exclusi&oacute;n del Usuario'),('delete_user_title','Borrar Usuario'),('destination','Destino'),('DESTINATION::setName','Error - Ingrese el Nombre'),('DESTINATION::setPattern','Error - Ingrese el Destino'),('destinations','Destinos'),('destination_form_title_add','Adicionar Destino'),('destination_form_title_update','Actualizar Destino'),('destination_group_form_title_add','Adicionar Grupo de Destinos'),('destination_group_form_title_update','Grupo de Destinos'),('destination_group_items','Items del Grupo'),('destination_group_list_title','Nombre del Grupo '),('destination_group_name','Nombre del Grupo'),('destination_ID','Destino'),('destination_list_title','Lista de Destinos'),('destination_Name','Nombre'),('destination_note','Usar .(punto) para un caracter o T para muchos caracteres. Ej.: 54..4T - Importante: Los prefijos deben incluir T en el final.  Por ejemplo: 54T para una ruta para cualquier destino en Argentina'),('destination_Pattern','Prefijo'),('dial_exten_title','Nuevo Marcado R&aacute;pido - Extensi&oacute;n'),('dial_exten_title2','Marcado R&aacute;pido - Extensi&oacute;n'),('download','Descargar'),('duration','Duraci&oacute;n'),('edit_corp_title','Editar Corporaci&oacute;n'),('edit_destination_group_title','Editar Grupo de Destino'),('edit_destination_title','Editar Destino'),('edit_dial_exten_title','Editar Marcado R&aacute;pido - Extensi&oacute;n'),('edit_dial_title','Editar Marcado R&aacute;pido'),('edit_exten_ok','Extensi&oacute;n editada con &eacute;xito'),('edit_exten_title','Editar Extensi&oacute;n'),('edit_integration_title','Editar integraci&oacute;n'),('edit_ivr_title','Editar IVR'),('exten_spied','Puede ser espiado'),('btn_queue_report','Ver reporte de la fila'),('edit_media_server_title','Editar Media Server'),('edit_outboundvm_title','Editar voicemail'),('edit_page_style','Editar Look & Feel'),('edit_page_style_login','Editar Look & Feel del Login'),('edit_poll_title','Editar Encuesta'),('edit_queue_title','Editar Cola'),('edit_restriction_title','Editar Restricci&oacute;n'),('edit_server_title','Editar Server'),('edit_time_ok','Horario editado con &eacute;xito'),('edit_time_title','Editar Horario'),('edit_trunk_title','Editar Trunk'),('edit_user_title','Editar Usuario'),('error1_panel','La Extensi&oacute;n ya existe dentro de la Cola'),('error2_panel','Debe seleccionar los dos elementos'),('ERROR_ADD_DESTINATION','Error - Agregando Destino'),('ERROR_ADD_EXTEN','Error - Agregando Extensi&oacute;n'),('ERROR_ADD_FOLLOWS','Error - Agregando Follow Me'),('ERROR_ADD_IVR','Error - Agregando IVR'),('ERROR_ADD_IVROPTION','Error - Agregando opci&oacute;n de IVR'),('ERROR_ADD_MEDIASERVER','Error - Agregando Media Server'),('ERROR_ADD_QUEUE','Error - Agregando Cola'),('ERROR_ADD_SERVER','Error - Agregando Server'),('ERROR_ADD_TIME','Error - Agregando Horario'),('ERROR_ADD_TIMEOPTION','Error - Agregando Opci&oacute;n en Horario'),('ERROR_ADD_TRUNK','Error - Agregando Trunk'),('ERROR_DELETE_EXTEN','Error - Borrando Extensi&oacute;n'),('ERROR_DELETE_TIMEOPTION','Error - Borrando Opci&oacute;n en Horario'),('error_empty','Datos sin cargar'),('error_exten_quantity_max','Excedi&oacute; la cantidad m&aacute;xima de Extensiones'),('error_ilegal_digits_exten','El n&uacute;mero de d&iacute;gitos de la Extensi&oacute;n no es correcto'),('error_ilegal_format_exten','La cantidad max. de extensiones no es correcta'),('ERROR_LOGIN','Error - Login'),('error_max_que','Cantidad Max. de Colas Alcanzada.'),('error_outboundvm_not_allowed','El tiempo est&aacute; mal configurado o no puede ser editado porque cambio de estado'),('error_outboundvm_schedule','El tiempo est&aacute; mal configurado'),('error_path_record','Selecciono activar grabaciones, no puede dejar la ruta de grabaciones vac&iacute;a'),('error_trunk_exist','Ya existe un Trunk con ese n&uacute;mero'),('ERROR_UPDATE_FOLLOWS','Error - Actualizando Follow Me'),('ERROR_UPDATE_QUEUE','Error - Actualizando Cola'),('error_user','Usuario o Contrase&ntilde;a incorrectos'),('especial','Especial'),('EXTEN::insert_EXTENS','Por favor cargue la Extensi&oacute;n'),('EXTEN::setCallgroup','Por favor cargue el n&uacute;mero del Grupo de Pickup'),('EXTEN::setNumber','Por favor cargue el n&uacute;mero'),('EXTEN::setPass','Por favor cargue el contrase&ntilde;a'),('extens','Extensiones'),('exten_Action','Acci&oacute;n'),('exten_action1','Features'),('exten_action2','Acci&oacute;n directa 2'),('exten_action3','Acci&oacute;n directa 3'),('exten_asign','Asign'),('exten_callgroup','Grupo'),('exten_CorpID','Corporaci&oacute;n'),('exten_create_user','Crear usuario web'),('exten_description','Descripci&oacute;n'),('exten_Enabled','Habilitado'),('exten_form_register_note','El n&uacute;mero de la Extensi&oacute;n no puede ser inferior a 200. Registrar usando'),('exten_form_register_note2','El n&uacute;mero de Extensi&oacute;n no puede ser inferior a 1000. Registrar usando'),('exten_form_title_add','Adicionar Extensi&oacute;n'),('exten_form_title_update','Actualizar Extensi&oacute;n'),('exten_HasVoiceMail','Tenes VoiceMail'),('exten_list_title','Lista de Extensiones'),('exten_Number','N&uacute;mero'),('exten_onbusy_action','Ocupado'),('exten_Outer','Externo'),('exten_Pass','Contrase&ntilde;a'),('exten_registered_ip','IP'),('exten_registered_port','Puerto'),('exten_selected_panel','Extensi&oacute;n seleccionado'),('exten_selected_panel2','Escoja la Cola donde desea insertar la Extensi&oacute;n en el lado derecho de la pantalla, haciendo clic en'),('exten_trunk','Trunk'),('exten_TrunkID','Trunk'),('exten_user','Usuario'),('exten_useragent','User Agent'),('exten_UserID','Usuario'),('exten_VMPass','Contrase&ntilde;a del VoiceMail'),('file_no_exist','El archivo no existe'),('followme','Follow Me'),('FOLLOWME::setExtID','Error - Cargar la Extensi&oacute;n'),('FOLLOWME::setNumber','Error - Cargar el N&uacute;mero'),('FOLLOWME::setOrder','Error - Cargar el orden'),('FOLLOWME::setTimeout','Error - Cargar el timeout'),('FOLLOWME::setType','Error - Cargar el tipo'),('FOLLOWME::update_FOLLOWS','Error actualizando el Follow Me'),('followme_exten_new_title','Nuevo Follow Me - Extensi&oacute;n'),('followme_exten_title','Follow Me  - Extensi&oacute;n'),('followme_ExtID','Extensi&oacute;n'),('followme_form_title_add','Adicionar'),('followme_form_title_update','Actualizar'),('followme_ID','ID'),('followme_list_title','Lista de Follow Me'),('followme_Name','Nombre'),('followme_Number','N&uacute;mero'),('followme_Order','Orden'),('followme_Timeout','Timeout'),('followme_Type','Tipo'),('followme_typeCall','Tipo de llamada'),('followme_type_call','Tipo de llamada'),('forget_password','Recuperar el contrase&ntilde;a'),('forms_bar','Altas'),('form_add','Adicionar'),('form_cancel','Cancelar'),('form_Dial','Discar'),('form_disabled','Desabilitado'),('form_dual_ring','Toque Simult&aacute;neo'),('form_enabled','Habilitado'),('form_enqueue','Encolar'),('form_extern','Externo'),('form_external_ring','Toque Externo'),('form_file_upload','Cargar archivo'),('form_followme','Follow Me'),('form_followme_extern','Follow Me - Externo'),('form_followme_intern','Follow Me - Extensi&oacute;n'),('form_fri','vie'),('form_import_from_VSC','Importar desde VSC'),('form_intern','Extensi&oacute;n'),('form_login','Login'),('form_logout','Logout'),('form_mon','lun'),('form_no','No'),('form_Pickup','Pickup'),('form_rest_sala','Sala de Conferencia'),('form_ring','Toque'),('form_send','Enviar'),('form_sun','dom'),('form_thu','jue'),('form_tue','mar'),('form_update','Actualizar'),('form_voicemail','VoiceMail'),('form_VoiceMailMain','VoiceMail'),('form_wed','mie'),('form_yes','Si'),('funcionalidades','Funciones'),('groups','Grupos'),('hangup','Terminar'),('incoming','Entrada'),('incorrect_sound','Opc. Inv.'),('input_pattern','Ingrese el Patr&oacute;n'),('integration_form_title_options','Integraci&oacute;n - Acciones'),('integration_list_title','Lista de integraciones'),('integration_option1','Op. No cliente'),('integration_option2','Op. Cliente sin problemas'),('integration_option3','Op. Cliente con problemas y con deudas'),('internacional','LDI'),('internal','Extensi&oacute;n'),('ivr','IVR'),('IVR::setName','Error - Cargue el Nombre'),('IVR::setSound','Error - Cargue el Audio'),('IVROPTION::setIvrID','Error - Cargue el IVR'),('ivroption_Action','Acci&oacute;n'),('ivroption_form_title_add','Adicionar'),('ivroption_form_title_update','Actualizar'),('ivroption_IvrID','IVR'),('ivroption_list_title','Lista de opciones'),('ivroption_Name','Nombre'),('ivroption_Order','Orden'),('ivrs','IVRs'),('ivr_form_title_add','Adicionar'),('ivr_form_title_options','IVR - Opciones'),('ivr_form_title_update','Actualizar'),('ivr_list_title','Lista de IVRs'),('ivr_Name','Nombre'),('ivr_opcion','Opci&oacute;n'),('ivr_option0','Op. 0'),('ivr_option1','Op. 1'),('ivr_option2','Op. 2'),('ivr_option3','Op. 3'),('ivr_option4','Op. 4'),('ivr_option5','Op. 5'),('ivr_option6','Op. 6'),('ivr_option7','Op. 7'),('ivr_option8','Op. 8'),('ivr_option9','Op. 9'),('ivr_pattern','Default'),('ivr_Sound','Audio'),('ivr_sound_format_note','Archivos (.wav) en formato PCM, 8Khz, 16 bits y tama&ntilde;o m&aacute;ximo de 2Mb'),('label_from_dashboard','Desde'),('label_queues_dashboard','Colas'),('label_to_dashboard','Hasta'),('label_view_password','Cliquear en el &aacute;rea de texto para ver el contrase&ntilde;a'),('list_add','Adicionar'),('list_ant','Anterior'),('list_delete','Borrar'),('list_download','Descargar'),('list_extern','Externo'),('list_intern','Extensi&oacute;n'),('list_no','No'),('list_pin','Pin'),('list_play_sound','Reproducir'),('list_sig','Siguiente'),('list_sublist','Sublista'),('list_update','Actualizar'),('list_yes','Si'),('list_zero_rows','Ninguna Cola'),('local_fijo','Local'),('local_movil','Celular Local'),('login_form_title','Login'),('login_pass','Contrase&ntilde;a'),('login_user','Usuario&#160;&#160;&#160;&#160;&#160;&#160;'),('logmon_bar','LogMonitor'),('logmon_filter_agi','AGI'),('logmon_filter_btn_restart','Reiniciar'),('logmon_filter_centrex','CENTREX'),('logmon_filter_centrex_sql','CENTREX SQL'),('logmon_filter_error','ERROR'),('logmon_filter_msje1','Solamente falta un minuto para reiniciar el Logmon'),('logmon_filter_msje2','Atenci&oacute;n'),('logmon_filter_msje3','El Logmon requiere reiniciar el proceso despu&eacute;s de 10 minutos'),('logmon_filter_notice','NOTICE'),('logmon_filter_verbose','VERBOSE'),('logmon_filter_warning','WARNING'),('logo','Imagen de la barra de secciones: '),('logo_fondo','Imagen de fondo: '),('max_duration','Tiempo m&aacute;ximo de Llamada'),('mediaserver_enabled','Habilitado'),('mediaserver_form_title_add','Adicionar Media Server'),('mediaserver_form_title_update','Actualizar Media Server'),('mediaserver_list_title','Media Server'),('mediaserver_number','N&uacute;mero'),('mediaserver_sound','Audio'),('mediaserver_sound_format_note','Archivos (.wav) en formato PCM, 8Khz, 16 bits'),('MEDIA_SERVER::insert_MEDIASERVERS','Error cargando Media Server'),('menu_cdr_list','Lista de CDRs'),('menu_corp_list','Corporaciones'),('menu_destinations_groups_list','Grupos de Destinos'),('menu_destination_list','Destinos'),('menu_discador','Discador'),('menu_exten_list','Extensiones'),('menu_integration','Integraciones'),('menu_ivr_list','IVRs'),('menu_logout','Salir'),('menu_mediaserver_list','Media Server'),('menu_moh','Moh de Corporaci&oacute;n'),('menu_outboundvm_list','Voicemail'),('menu_page_style','Look & Feel'),('menu_panel','Panel del Operador'),('menu_queue_list','Colas'),('menu_restrictions_list','Restricciones'),('menu_restriction_list','Restricciones'),('menu_route_list','Rutas'),('menu_server_list','Servers'),('menu_speeddial_list','Marcado R&aacute;pido'),('menu_time_list','Horarios'),('menu_title','Men&uacute;'),('menu_trunk_list','Trunks'),('menu_users_list','Usuarios'),('menu_user_list','Usuarios'),('min_duration','Tiempo m&aacute;ximo de Espera'),('moda_poll','Moda'),('msge-info-route','Si se deja el valor vac&iacute;o en la ruta se va a usar la imagen del supervisor.'),('msge-no-style-changed','No hay cambios.'),('msge-ok-set-style','Parametros actualizados, por favor inicie sesi&otilde;n nuevamente.'),('msge_error','ERROR'),('msge_error','ERROR'),('msge_error2','Hay un problema de conexi&oacute;n, verifiquelo e intente nuevamente'),('msge_error4','Escogi&oacute; como acci&oacute;n toque simult&aacute;neo y debe indicar un nro. externo'),('msge_error5','El n&uacte,mero que introdujo ya existe. Pueden existir Extensiones con el mismo n&uacte,mero'),('msge_error6','Error en la carga del archivo de audio'),('msge_error7','La Extensi&oacute;n no existe.'),('msge_error_exten_bad_description','La descripcion solo puede contener letras, numeros, espacios,  (, ), -, _ y . (punto)'),('msge_error_corp','Ya existe una Corporaci&oacute;n con ese nombre'),('msge_error_destination\r\n','Ya existe ese prefijo'),('msge_error_destination','Ya existe un Destino con ese prefijo'),('msge_error_destination_group','Ya existe un Grupo de Destino con ese nombre'),('msge_error_destination_group','Ya existe un Grupo de Destino co ese nombre'),('msge_error_dgroup_exist','Un Grupo de Destino ya existe con ese nombre'),('msge_error_dial','Ya existe un Marcado R&aacute;pido con ese n&uacute;mero'),('msge_error_dial_exten','El Marcado R&aacute;pido ya existe con ese n&uacute;mero'),('msge_error_edit_dial_exten','Marcado R&aacute;pido - Ya existe una Extensi&oacute;n con ese n&uacute;mero'),('msge_error_exten','Ya existe una Extensi&oacute;n con ese n&uacute;mero'),('msge_error_follow','Un Follow Me ya existe con esos datos'),('msge_error_integration','Ya existe una integraci&oacute;n con ese nombre'),('msge_error_ivr','Ya existe un IVR con ese nombre'),('msge_error_ivr7','El archivo a&uacute;n se est&aacute; subiendo'),('msge_error_media_server','Ya existe un Media Server con esa direcci&oacute;n IP'),('msge_error_outer_empty','Si seleccion&oacute; toque externo, no puede dejar vac&iacute;o el campo \'externo\''),('msge_error_poll','Ya existe una encuesta con ese nombre'),('msge_error_question','Ya existe una pregunta con ese nombre'),('msge_error_question2','Ya existe una pregunta con ese orden'),('msge_error_queue','Ya existe una Cola'),('msge_error_queue_inuse','Por favor, solucione los siguientes conflictos para eliminar la cola.'),('msge_error_queue_inuse_sd','La cola est&aacute; en uso por uno o m&aacute;s n&uacute;meros de marcado r&aacute;pido.'),('msge_error_queue_inuse_temp','La cola est&aacute; en uso por uno o m&aacute;s horarios.'),('msge_error_queue_inuse_que','La cola est&aacute; en uso por una o m&aacute;s colas.'),('msge_error_queue_inuse_tru','La cola est&aacute; en uso por uno o m&aacute;s troncales.'),('msge_error_queue_inuse_ivr','La cola est&aacute; en uso por uno o m&aacute;s IVRs.'),('msge_error_queue_inuse_disc','La cola est&aacute; en uso por uno o m&aacute;s Discadores.'),('msge_error_restriction','Ya existe esa Restricci&oacute;n'),('msge_error_server','Ya existe un Server con ese nombre'),('msge_error_server_IP_PORT','Ya existe un servidor con esa IP y ese puerto'),('msge_error_speeddial','Ya existe ese Marcado R&aacute;pido'),('msge_error_speeddial_2','Solo se permite n&uacute;meros de m&aacute;s de un d&iacute;gito'),('msge_error_time','Ya existe un Horario con ese nombre'),('msge_error_trunk2','Ya existe un Trunk con ese n&uacute;mero'),('msge_error_trunk4','No se logro parar los discadores correspondientes a este tronco'),('msge_error_user','Ya existe ese Usuario'),('msge_error_user2','La Corporaci&oacute;n no existe.'),('msge_ok','OK'),('msge_warning','AVISO'),('msge_okedit_corp','La Corporaci&oacute;n fu&eacute; actualizada con &eacute;xito'),('msge_ok_corp','La Corporaci&oacute;n fu&eacute; creada con &eacute;xito'),('msge_ok_destination','El Destino fu&eacute; creado con &eacute;xito.'),('msge_ok_destination_group','El Grupo de Destino fu&eacute; creado con &eacute;xito'),('msge_ok_dial','El Marcado R&aacute;pido fu&eacute; creado con &eacute;xito'),('msge_ok_dial_exten','El Marcado R&aacute;pido fu&eacute; creado con &eacute;xito'),('msge_ok_edit_dial_exten','El Marcado R&aacute;pido - Extensi&oacute;n fu&eacute; editada con &eacute;xito'),('msge_ok_exten','La Extensi&oacute;n fu&eacute; creada con &eacute;xito'),('msge_ok_follow','El Follow Me - Extensi&oacute;n fu&eacute; creada con &eacute;xito'),('msge_ok_integration','La integraci&oacute;n fue creada con &eacute;xito'),('msge_ok_ivr','El IVR fu&eacute; creado con &eacute;xito'),('msge_ok_media_server','El Media Server fu&eacute; creado con &eacute;xito'),('msge_ok_outboundvm','El voicemail fue creado con &eacute;xito'),('msge_ok_queue','La Cola fu&eacute; creada con &eacute;xito'),('msge_ok_restriction','La Restricci&oacute;n fu&eacute; creado con &eacute;xito'),('msge_ok_server','El Server fu&eacute; creado con &eacute;xito'),('msge_ok_time','El Horario fu&eacute; creado con &eacute;xito'),('msge_ok_trunk','El Trunk fu&eacute; creado con &eacute;xito'),('msge_ok_user','El Usuario fu&eacute; creado con &eacute;xito'),('msg_info_strategy','El timeout no se aplica a la estrategia tocar todos'),('msg_ok_poll','La Encuesta fu&eacute; creado con &eacute;xito'),('msj_confirm_delete','Confirmar borrado'),('nacional_fijo','LDN'),('nacional_movil','Celular LDN'),('new_corp','Nueva Corporaci&oacute;n'),('new_destination','Nuevo Destino'),('new_destination_group','Nuevo Grupo  de Destino'),('new_dial','Nuevo Marcado R&aacute;pido'),('new_exten','Nueva Extensi&oacute;n'),('new_integration','Nueva integraci&oacute;n'),('new_ivr','Nuevo IVR'),('new_media_server','Nuevo Media Server'),('new_outboundvm','Nuevo Voicemail'),('new_poll','Nueva Encuesta'),('new_question','Nueva Pregunta'),('new_queue','Nueva Cola'),('new_restriction','Nueva Regla'),('new_server','Nuevo Server'),('new_time','Nuevo Horario'),('new_trunk','Nuevo Trunk'),('new_user','Nuevo Usuario'),('NOANSWER','Sin respuesta'),('note2_panel','Para adicionar una Extensi&oacute;n a una Cola, debe hacer click en la Extensi&oacute;n'),('note3_panel','Fuera de las Colas'),('note4_panel','Ocupado'),('note5_panel','Indisponible'),('note6_panel','Disponible'),('not_data_monitor_dashboard','No existen Extensiones con qualify habilitado'),('not_data_statics_dashboard','No existen datos para la consulta'),('not_selected','Desactivado'),('no_data','Sin datos disponibles en la tabla'),('OK_ADD_DESTINATION','Destino agregado con &eacute;xito'),('OK_ADD_EXTEN','Extensi&oacute;n agregada con &eacute;xito'),('OK_ADD_FOLLOWS','Follow Me agregado con &eacute;xito'),('OK_ADD_IVR','IVR agregado con &eacute;xito'),('OK_ADD_IVROPTION','Opci&oacute;n de IVR agregada con &eacute;xito'),('OK_ADD_MEDIASERVER','Media Server agregado con &eacute;xito'),('OK_ADD_QUEUE','Cola agregada con &eacute;xito'),('OK_ADD_SERVER','Server agregado con &eacute;xito'),('OK_ADD_TIME','Horario agregado con &eacute;xito'),('OK_ADD_TIMEOPTION','Opci&oacute;n de Horario agregada con &eacute;xito'),('OK_ADD_TRUNK','Trunk agregado con &eacute;xito'),('OK_DELETE_EXTEN','Extensi&oacute;n borrada con &eacute;xito'),('OK_DELETE_FOLLOWS','Follow Me borrado con &eacute;xito'),('OK_DELETE_QUEUE','Cola borrada con &eacute;xito'),('OK_DELETE_TIME','Horario borrado con &eacute;xito'),('OK_DELETE_TIMEOPTION','Opci&oacute;n de Horario borrada con &eacute;xito'),('OK_LOGIN','Login - Correcto'),('OK_UPDATE_DESTINATION','Destino borrado con &eacute;xito'),('OK_UPDATE_EXTEN','Extensi&oacute;n actualizada con &eacute;xito'),('OK_UPDATE_FOLLOWS','Follow Me actualizado con &eacute;xito'),('OK_UPDATE_IVR','IVR actualizado con &eacute;xito'),('OK_UPDATE_MEDIASERVER','Media Server actualizado con &eacute;xito'),('OK_UPDATE_QUEUE','Cola actualizada con &eacute;xito'),('OK_UPDATE_ROUTE','Ruta actualizada con &eacute;xito'),('OK_UPDATE_SERVER','Server actualizado con &eacute;xito'),('OK_UPDATE_TIME','Horario actualizado con &eacute;xito'),('OK_UPDATE_TIMEOPTION','Opci&oacute;n de Horario actualizada con &eacute;xito'),('OK_UPDATE_TRUNK','Trunk actualizado con &eacute;xito'),('only_numbers','Solo n&uacute;meros'),('only_numbers_2dig','Solo n&uacute;meros de 1 a 2 d&iacute;gitos'),('only_numbers_4dig','Solo n&uacute;meros de 1 a 4 d&iacute;gitos'),('only_numbers_5dig','Solo n&uacute;meros de 1 a 5 d&iacute;gitos'),('order','Orden'),('outboundvm_status','Estado'),('outboundvm_status_listened','Escuchado'),('outboundvm_status_pending','Pendiente'),('outboundvm_status_urgent','Urgente'),('outboundvm_type_received','Recibido'),('outboundvm_type_sent','Enviado'),('panel_atention','Atenci&oacute;n'),('panel_bar','Panel'),('panel_ligacoes_em_espera','Llamadas en espera'),('panel_note1','Para adicionar una Extensi&oacute;n a una Cola, debe hacer click en la Extensi&oacute;n '),('panel_note2','Primero debe seleccionar una Extensi&oacute;n para insertarla en una Cola'),('panel_note3','La Extensi&oacute;n ya existe'),('panel_status1','Omisi&oacute;n'),('panel_status2','Disponible'),('panel_status3','Al llamar'),('panel_status4','Indisponible'),('permission_feaID','ID de funcionalidad'),('permission_list_title','Lista'),('permission_name','Nombre'),('pickup','Capturar llamada'),('play','Reproducir'),('poll','Encuesta'),('polls','Encuestas'),('poll_list_title','Lista de Encuestas'),('question','Pregunta'),('question_list_title','Lista de Preguntas'),('queue','Cola'),('QUEUE::setID','Error - Cargue el ID'),('QUEUE::setName','Error - Cargue el nombre'),('queuestats_atendidas','Atendidas'),('queuestats_desatendidas','No Atendidas'),('queuestats_estats','Datos de la Cola: '),('queuestats_horadesde','Hora desde'),('queuestats_horahasta','Hora hasta'),('queuestats_transferencias','Transferencias'),('queue_action_failover','Acci&oacute;n de Failover'),('queue_announce','Anuncio para Atendente'),('queue_CorpID','Corporaci&oacute;n'),('queue_empty_panel','No existen Colas creadas'),('queue_enqueue','Encolar'),('queue_fewestcalls','Menos Llamadas'),('queue_form_alert_update','Al optar por serie, el Centrex se reininiar&aacute; cuando no tenga tr&aacute;fico. Desea continuar?'),('queue_form_info_update','No es posible seleccionar el tipo de estrategia \"S&Eacute;RIE\", es necesario volver a crear la cola.'),('queue_form_title_add','Adicionar Cola'),('queue_form_title_update','Actualizar Cola'),('queue_leastrecent','&Uacute;ltimo Atendido'),('queue_linear','S&eacute;rie'),('queue_list_title','Lista de Colas'),('queue_login','Login Cola'),('queue_logout','Logout Cola'),('queue_Name','Nombre'),('queue_random','Aleatorio'),('queue_ringall','Ring Todos'),('queue_rrmemory','Pseudo Aleatorio'),('queue_strategy','Estrategia'),('queue_timeout','Timeout de estrategia'),('queue_timeout_failover','M&aacute;x. tiempo de espera'),('queue_wrandom','Aleatorio Inteligente'),('received','Recibidos'),('registered_destinations','Destinos cargados'),('remove','Eliminar'),('restriction','Restricci&oacute;n'),('restrictions','Restricciones'),('restriction_corp','Corporaci&oacute;n'),('restriction_CorpID','Corporaci&oacute;n'),('restriction_DesID','Destino'),('restriction_entityID','Entidad'),('restriction_exten','Restricci&oacute;n - Extensi&oacute;n'),('restriction_note','Puede ingresar un Patr&oacute;n, opciones predeterminadas como Correo de Voz o Sala de Conferencia o bien elegir un Grupo de Destino. Seleccione tambi&eacute;n su habilitaci&oacute;n, si marca la opci&oacute;n pin estar&aacute; permitiendo la llamada solo si se ingresa un pin.'),('restriction_pattern','Destino'),('restriction_Permit','Permitir'),('restriction_Pin','Pin'),('route_Cost','Costo de la Ruta'),('route_form_title_add','Adicionar Ruta'),('route_form_title_update','Actualizar Ruta'),('route_list_title','Rutas'),('route_Name','Nombre'),('route_Pattern','Prefijo'),('route_SerID','Server'),('search','Buscar'),('search_class','Clase'),('search_object','Objeto'),('sent','Enviados'),('server','Server'),('SERVER::setIP','Por favor, cargue la direcci&oacute;n IP'),('SERVER::setName','Por favor, cargue el nombre'),('SERVER::setPort','Por favor, cargue el puerto'),('servers','Servers'),('server_form_title_add','Adicionar Server'),('server_form_title_update','Actualizar Server'),('server_IP','Direcci&oacute;n IP o Dominio'),('server_list_title','Lista de Servers'),('server_Name','Nombre'),('server_Port','Puerto'),('sound1_integration','Solicitar ID del cliente'),('sound2_integration','Aviso de existencia de inconvenientes'),('sound_form_note','El cambio de archivo de audio s&oacute;lo ser&aacute; efectivo al enviar el formulario.'),('speeddial','Marcado R&aacute;pido'),('SPEEDDIAL::insert_SPEEDDIAL','Error - Cargar Marcado R&aacute;pido'),('SPEEDDIAL::setData','Error - Cargue la Fecha'),('SPEEDDIAL::setEntityID','Error - Cargue el ID de la entidad'),('SPEEDDIAL::setNumber','Error - Cargue el n&uacute;mero'),('SPEEDDIAL::setType','Error - Cargue el tipo'),('speeddial_action','Acci&oacute;n'),('speeddial_Action','Acci&oacute;n'),('speeddial_Data','Menu'),('speeddial_Entity','Entidad'),('speeddial_form_title_add','Adicionar Marcado R&aacute;pido'),('speeddial_form_title_update','Actualizar Marcado R&aacute;pido'),('speeddial_list_title','Lista de Marcado R&aacute;pido'),('speeddial_number','N&uacute;mero'),('speeddial_Position','Posici&oacute;n'),('speedial_number','N&uacute;mero de Marcado R&aacute;pido '),('statics_bar','Estad&iacute;sticas'),('tempo_new_action','Haz click aqu&iacute; para ir creando acciones'),('text_instructive_ivr','Debe habilitar cada opci&oacute;n a la que desea atribuir un valor'),('thead_status_monitor_dashboard','Estado'),('time','Horario'),('TIME::insert_TIMEMAIN','Error - Cargue el Horario'),('TIME::setCorpID','Por favor, cargue la Corporaci&oacute;n'),('TIME::setID','Error - Cargue el ID'),('TIME::setName','Por favor, cargue el nombre'),('TIMEOPTION::setTimeID','Por favor, cargue el Horario'),('timeoption_date_format','(HH:MM)'),('timeoption_Days','D&iacute;as'),('timeoption_From','Desde'),('timeoption_list_title','Opciones de Horario'),('timeoption_To','Hasta'),('time_Action','Acci&oacute;n'),('time_CorpID','Corporaci&oacute;n'),('time_Days','D&iacute;as'),('time_form_title_add','Adicionar Horario'),('time_form_title_options','Horario - Opciones'),('time_form_title_update','Actualizar Horario'),('time_From','Desde'),('time_ID','ID'),('time_list_title','Lista de Horarios'),('time_Name','Nombre'),('time_note','Toda llamada fuera de los int&eacute;rvalos ejecutara la opci&oacute;n default'),('time_note10','Horario borrado con &eacute;xito'),('time_note2','Seleccione los d&iacute;as, cliqueando en ellos'),('time_note3','Debe indicar la hora desde y la hora hasta para seleccionar una acci&oacute;n e indicar los d&iacute;as de la semana'),('time_note4','El horario elegido se superpone con uno existente'),('time_note5','Hora hasta siempre debe ser mayor que la hora desde'),('time_note6','Una vez creado el Horario con las opciones clic en enviar'),('time_note7','No hay acciones creadas para el Horario'),('time_note8',' Confirmar exclusi&oacute;n de la acci&oacute;n'),('time_note9','Una vez cambiado el nombre del Horario o la opci&oacute;n default puede hacer clic en enviar'),('time_pattern','Default'),('time_To','Hasta'),('titile_command3','Ocultar la consola'),('titile_filter','Filtro'),('title-sequencial','Secuencial'),('title-smart','Inteligente'),('title1_dashboard','Estad&iacute;sticas de las Colas'),('title2_dashboard','Monitor Qualify'),('title_command','Comando'),('title_command2','Presione Enter para ejecutar el comando'),('title_command3','Ocultar'),('title_command4','Presione Enter para aplicar el  filtro'),('title_command5','Borrar filtro'),('title_destinations_group','Click para seleccionar destinos'),('title_dg','-- GRUPOS DE DESTINOS --'),('title_filter','Filtro'),('title_monitor_dashboard','Monitor de Extensiones (Qualify)'),('title_monitor_waiting_dashboard','Por favor, aguarde 15 segundos'),('title_shorcut1','Opciones'),('title_shorcut2','Men&uacute;'),('title_site','VSC Centrex v4.0'),('title_statics_dashboard','Estad&iacute;sticas de las Colas'),('toggle_console','Ver consola'),('total','Total'),('total_calls','N&uacute;mero total de Llamadas'),('total_duration','Tiempo Total de Llamadas'),('total_duration_avg','Tiempo medio de Llamada'),('total_wait','Tiempo Total en Espera'),('total_wait_avg','Tiempo medio de Espera'),('trunk','DID'),('TRUNK::setCorpID','Por favor, cargue la Corporaci&oacute;n'),('TRUNK::setNumber','Por favor, cargue el N&uacute;mero'),('TRUNK::setPass','Por favor, cargue el contrase&ntilde;a'),('TRUNK::setSerID','Por favor, cargue el Server'),('trunk_Action','Acci&oacute;n'),('trunk_CorpID','Corporaci&oacute;n'),('trunk_Enabled','Habilitado'),('trunk_Follow','Follow Me'),('trunk_form_title_add','Adicionar Trunk'),('trunk_form_title_update','Actualizar Trunk'),('trunk_list_title','Lista de Trunks'),('trunk_Number','N&uacute;mero'),('trunk_Outgoing','Salida habilitada'),('trunk_Pass','Contrase&ntilde;a'),('trunk_Preference','Preferencia'),('trunk_SerID','Server'),('trunk_Timeout','Timeout'),('type_call_auto_reminder','Enviar mensaje de Autorecordatorio'),('type_call_Internacional','Internacional'),('type_call_LF','Local Fijo'),('type_call_LM','Local M&oacute;vil'),('type_call_MeetMe','Conferencia'),('type_call_NF','Nacional Fijo'),('type_call_NM','Nacional M&oacute;vil'),('type_call_outbound','Enviar mensaje de voz'),('type_call_reminder','Enviar Recordatorio'),('type_call_special','Especial'),('type_call_VoiceMail','VoiceMail'),('unknown','Desconocido'),('upload_error_uploading','Error actualizando los datos'),('upload_ok','Carga correcta'),('upload_send','Enviar'),('upload_title','Actualizar'),('user2','Usuarios'),('USER::setPass','Por favor, cargue el contrase&ntilde;a'),('USER::update_ID','Error - Actualizar ID'),('user_CorpID','Corporaci&oacute;n'),('user_Enabled','Habilitado'),('USER_INCORRECT_DATA','Datos incorrectos'),('user_Level','Nivel'),('user_level_administrador','Administrador'),('user_level_supervisor','Supervisor'),('user_level_usuario','Usuario'),('user_list_title','Lista de Usuarios'),('user_mail','E-mail'),('user_Nick','Usuario web'),('user_Pass','Contrase&ntilde;a'),('user_web','Usuario web'),('validator_field_required','Campo obligatorio'),('validator_pattern_not_match','Formato incorrecto'),('vendor_a','con'),('vendor_anterior','Anterior'),('vendor_copy','Copiado en la Memoria'),('vendor_copy1','Fue copiada una linea en la memoria'),('vendor_copyn','Se copiar&oacute;n'),('vendor_copyn1','lineas en la memoria'),('vendor_de','registros de'),('vendor_filas',''),('vendor_olhando',''),('vendor_olhando_ate','a'),('vendor_procurar','Buscar:'),('vendor_proximo','Siguiente'),('vendor_sd','Sin datos disponibles en la tabla'),('vsc_did_number','DID'),('vsc_distributor','Distribuidor'),('vsc_user_nick','Nombre'),('vsc_wsadmin_ip','IP del WS ADMIN'),('exten_limit','L&iacute;mite de llamadas simult&aacute;neas'),('label_limit','0 = ilimitado'),('exten_porttype','Tipo de puerto'),('queue_position','Posici&oacute;n de fila'),('refresh_note','La tabla no ser&aacute; actualizada hasta que recargue la p&aacute;gina'),('queue_announce_seconds','Segundos de announce frequency'),('label_seconds_queue','M&aacute;ximo: 10 segundos'),('queue_ringinuse','Ring in use'),('addContext','Adicionar contexto'),('addTrunk','Adicionar Trunk'),('add_dial','A&ntilde;adir nuevo marcado r&aacute;pido'),('add_followme','A&ntilde;adir nuevo Follow Me'),('all','Todos'),('announce_sound_format_note','Archivos (.wav) en formato PCM, 8Khz, 16 bits '),('answer','Respuesta'),('atention_dec_panel','Primero debe seleccionar una Extensi&oacute;n para insertarla en una Cola'),('atention_desc_panel','No hay una Extensi&oacute;n seleccionada para la Cola'),('atention_panel','Atenci&oacute;n'),('average_poll','Promedio'),('btn_exit','Salir'),('btn_view_corps','Ver Corporaciones'),('btn_view_destinations','Ver Destinos'),('btn_view_destinations_group','Ver Grupo de Destinos'),('btn_view_dial','Ver Marcado R&aacute;pido'),('btn_view_extens','Ver Extensiones'),('btn_view_integration','Ver integraciones'),('btn_view_ivrs','Ver IVRs'),('btn_view_media_servers','Ver Media Servers'),('btn_view_outboundvm','Ver voiceMails'),('btn_view_polls','Ver Encuesta'),('btn_view_queues','Ver Colas'),('btn_view_restrictions','Ver Restricciones'),('btn_view_servers','Ver Servers'),('btn_view_time','Lista de Horarios'),('btn_view_trunks','Ver Trunks'),('btn_view_users','Ver Usuarios'),('call_forward','Desv&iacute;o de llamadas'),('CALL_RESTRICTED','Llamada restringida'),('cal_April','Abril'),('cal_August','Agosto'),('cal_December','Diciembre'),('cal_February','Febrero'),('cal_Fr','Vie'),('cal_Friday','Viernes'),('cal_January','Enero'),('cal_July','Julio'),('cal_June','Junio'),('cal_May','Mayo'),('cal_Mo','Lun'),('cal_Monday','Lunes'),('cal_next_year','a&ntilde;o sig.'),('cal_November','Noviembre'),('cal_October','Octubre'),('cal_prev_year','a&ntilde;o ant.'),('cal_Saturday','S&aacute;bado'),('cal_September','Septiembre'),('cal_Su','Dom'),('cal_Sunday','Domingo'),('cal_Th','Jue'),('cal_Thursday','Jueves'),('cal_Tu','Mar'),('cal_Tuesday','Martes'),('cal_We','Mie'),('cal_Wednesday','Mi&eacute;rcoles'),('CANCEL','Cancelada'),('capture_by_size','Ingrese el tama&ntilde;o'),('capture_by_size_incorrect_input','Tama&ntilde;o incorrecto'),('capture_by_size_input','Ingrese el tama&ntilde;o [en MB]: '),('capture_by_time','Ingrese el tiempo'),('capture_by_time_incorrect_input','Tiempo incorrecto'),('capture_by_time_input','Ingrese el tiempo [en segundos, mayor o igual a 2]: '),('capture_packet','Captura de paquetes'),('capture_please_wait','La captura se est&aacute; generando, por favor aguarde...'),('cc_ddd','C&oacute;digo de Pa&iacute;s o DDD'),('cdr_audio','Audio'),('cdr_billsec','Duraci&oacute;n'),('cdr_called','Destino'),('cdr_caller','Origen'),('cdr_calltype','Tipo'),('cdr_calltype_quantity','Cantidad'),('cdr_date','Fecha'),('cdr_destination','Destino'),('cdr_destinationtype','Tipo de Destino'),('cdr_detailed','Detallado'),('cdr_exten','Extensi&oacute;n'),('cdr_from','Desde'),('cdr_list_title','CDRs'),('cdr_name','Nombre'),('cdr_note','El filtrado es hecho desde las 00:00 hs del d&iacute;a desde, hasta las 23:59 hs del d&iacute;a hasta.'),('cdr_restPattern','Prefijo'),('cdr_result','Resultados'),('cdr_search','Buscar'),('cdr_subtotal','Subtotal'),('cdr_to','Hasta'),('cdr_total','Total'),('cdr_total_billsec','Duraci&oacute;n Total'),('cdr_usercost','Costo'),('color_bg_active','Color de fondo de secci&oacute;n activa: '),('color_bg_default','Color de fondo de secciones: '),('color_blue_css','Color de men&uacute; lateral: '),('color_font_active','Color de fuente de la secci&oacute;n activa: '),('color_font_default','Color de fuente de secciones: '),('color_footer_bar','Color de pi&eacute; de p&aacute;gina: '),('color_nav_bar','Color de la barra de secciones: '),('col_title_exten_action','Acci&oacute;n'),('col_title_exten_actions','Acciones'),('col_title_exten_ID','ID'),('col_title_exten_number','N&uacute;mero'),('config_bar','Configuraci&oacute;n'),('CONGESTION','Congestionamiento'),('corp','Corporaci&oacute;n'),('CORP::delete_IVR_EXISTS','Error - Existe el IVR'),('CORP::delete_RESTRICTIONS_EXISTS','Borre las Restricciones'),('CORP::delete_TIMETABLES_COUNT','Error - Borrando Horario'),('corp_AllowCustom','Permitir cambiar Look & Feel'),('corp_AllowCustom_table','Look & Feel'),('corp_AllowDiscador','Habilitar Discador'),('corp_AllowDiscador_table','Discador'),('corp_Enabled','Habilitado'),('corp_ExtLen','Long. de la Extensi&oacute;n'),('corp_ExtMax','Cant. Max. de Extensiones'),('corp_form_title_add','Adicionar'),('corp_form_title_update','Actualizar'),('corp_MonEnabled','Grabaciones'),('corp_MonPath','Carpeta'),('corp_Name','Nombre'),('corp_noteAllowCustom','Este cambio ser&aacute; aplicado cuando el usuario ingrese nuevamente al navegador'),('corp_noteMaxExten','Si la long. de la Extensi&oacute;n es 3, el n&uacute;m. m&aacute;ximo de Extensiones es 799, y si es 4, el n&uacute;mero m&aacute;ximo de Extensiones ser&iacute;a 8999'),('corp_QueMax','Cant. Max. de Colas'),('dashboard_bar','Dashboard'),('del-restriction-exten-ok','Restricci&oacute;n borrada con &eacute;xito'),('delete_corp_ok','Corporaci&oacute;n borrada con &eacute;xito '),('delete_corp_text1',' Confirma exclusi&oacute;n de la Corporaci&oacute;n'),('delete_corp_text2','Ser&aacute;n borrado los Usuarios, las Colas, los Trunks, las Extensiones, los IVRs y las Restricciones que pertenecen a la Corporaci&oacute;n'),('delete_corp_title','Borrar Corporaci&oacute;n'),('delete_destinationgroup_text1',' Confirmar exclusi&oacute;n del Grupo de Destino'),('delete_destination_groups_title','Borrar Grupo de Destino'),('delete_destination_group_title','Borrar Grupo de Destino'),('delete_destination_ok','Destino borrado con &eacute;xito'),('delete_destination_text1',' Confirmar exclusi&oacute;n del Destino'),('delete_destination_title','Borrar Destino'),('delete_dgroup_text1',' Confirmar exclusi&oacute;n del Grupo de Destino'),('delete_dial_exten_ok','Extensi&oacute;n borrada con &eacute;xito'),('delete_dial_exten_title','Borrar Marcado R&aacute;pido - Extensi&oacute;n'),('delete_dial_ok','Marcado R&aacute;pido borrado con &eacute;xito'),('delete_dial_text1',' Confirmar exclusi&oacute;n del Marcado R&aacute;pido'),('delete_dial_title','Borrar Marcado R&aacute;pido'),('delete_exten_text1',' Confirmar exclusi&oacute;n de la Extensi&oacute;n'),('delete_exten_title','Borrar Extensi&oacute;n'),('delete_follow_exten_ok','Follow Me - Extensi&oacute;n borrada con &eacute;xito'),('delete_follow_exten_title','Borrar Follow Me - Extensi&oacute;n'),('delete_follow_text1',' Confirmar exclusi&oacute;n del Follow Me'),('delete_integration_ok','Integraci&oacute;n borrada con &eacute;xito'),('delete_integration_text1',' Confirmar exclusi&oacute;n de la integraci&oacute;n'),('delete_integration_title','Borrar integraci&oacute;n'),('delete_ivr_ok','IVR borrado con &eacute;xito'),('delete_ivr_text1',' Confirmar exclusi&oacute;n del IVR'),('delete_ivr_title','Borrar IVR'),('delete_mediaserver_text1',' Confirmar exclusi&oacute;n del Media Server'),('delete_media_server_title','Borrar Media Server'),('delete_outboundvm_ok','Voicemail borrado con &eacute;xito'),('delete_outboundvm_text1','Confirmar exclusi&oacute;n del Voicemail'),('delete_outboundvm_text2','Origen: '),('delete_outboundvm_text3','Destino: '),('delete_outboundvm_text4','Fecha: '),('delete_outboundvm_title','Borrar Voicemail'),('delete_poll_ok','Encuesta borrada con &eacute;xito'),('delete_poll_text1',' Confirmar exclusi&oacute;n de la Encuesta'),('delete_poll_title','Borrar Encuesta'),('delete_question_text1',' Confirmar exclusi&oacute;n de la Pregunta'),('delete_question_title','Borrar Pregunta'),('delete_queue_ok','Cola borrada con &eacute;xito'),('delete_queue_text1',' Confirmar exclusi&oacute;n de la Cola'),('delete_queue_title','Borrar Cola'),('delete_restriction_exten_title','Borrar Restricci&oacute;n'),('delete_restriction_ok','Restricci&oacute;n borrada con &eacute;xito'),('delete_restriction_text1',' Confirmar exclusi&oacute;n de la Restricci&oacute;n'),('delete_restriction_title','Borrar Restricci&oacute;n'),('delete_server_ok','El Server fu&eacute; borrado con &eacute;xito '),('delete_server_text1',' Confirmar exclusi&oacute;n del Server y sus Trunks asociados'),('delete_server_title','Borrar Server'),('delete_speeddial_text1',' Confirmar exclusi&oacute;n del Marcado R&aacute;pido'),('delete_time_ok','Horario borrado con &eacute;xito'),('delete_time_text1',' Confirmar exclusi&oacute;n del Horario'),('delete_time_title','Borrar Horario'),('delete_trunk_text1',' Confirmar exclusi&oacute;n del Trunk'),('delete_trunk_title','Borrar Trunk'),('delete_user_ok','Usuario borrado con &eacute;xito'),('delete_user_ok','Usuario borrado con &eacute;xito'),('delete_user_text1',' Confirmar exclusi&oacute;n del Usuario'),('delete_user_title','Borrar Usuario'),('destination','Destino'),('DESTINATION::setName','Error - Ingrese el Nombre'),('DESTINATION::setPattern','Error - Ingrese el Destino'),('destinations','Destinos'),('destination_form_title_add','Adicionar Destino'),('destination_form_title_update','Actualizar Destino'),('destination_group_form_title_add','Adicionar Grupo de Destinos'),('destination_group_form_title_update','Grupo de Destinos'),('destination_group_items','Items del Grupo'),('destination_group_list_title','Nombre del Grupo '),('destination_group_name','Nombre del Grupo'),('destination_ID','Destino'),('destination_list_title','Lista de Destinos'),('destination_Name','Nombre'),('destination_note','Usar .(punto) para un caracter o T para muchos caracteres. Ej.: 54..4T - Importante: Los prefijos deben incluir T en el final.  Por ejemplo: 54T para una ruta para cualquier destino en Argentina'),('destination_Pattern','Prefijo'),('dial_exten_title','Nuevo Marcado R&aacute;pido - Extensi&oacute;n'),('dial_exten_title2','Marcado R&aacute;pido - Extensi&oacute;n'),('download','Descargar'),('duration','Duraci&oacute;n'),('edit_corp_title','Editar Corporaci&oacute;n'),('edit_destination_group_title','Editar Grupo de Destino'),('edit_destination_title','Editar Destino'),('edit_dial_exten_title','Editar Marcado R&aacute;pido - Extensi&oacute;n'),('edit_dial_title','Editar Marcado R&aacute;pido'),('edit_exten_ok','Extensi&oacute;n editada con &eacute;xito'),('edit_exten_title','Editar Extensi&oacute;n'),('edit_integration_title','Editar integraci&oacute;n'),('edit_ivr_title','Editar IVR'),('exten_spied','Puede ser espiado'),('btn_queue_report','Ver reporte de la fila'),('edit_media_server_title','Editar Media Server'),('edit_outboundvm_title','Editar voicemail'),('edit_page_style','Editar Look & Feel'),('edit_page_style_login','Editar Look & Feel del Login'),('edit_poll_title','Editar Encuesta'),('edit_queue_title','Editar Cola'),('edit_restriction_title','Editar Restricci&oacute;n'),('edit_server_title','Editar Server'),('edit_time_ok','Horario editado con &eacute;xito'),('edit_time_title','Editar Horario'),('edit_trunk_title','Editar Trunk'),('edit_user_title','Editar Usuario'),('error1_panel','La Extensi&oacute;n ya existe dentro de la Cola'),('error2_panel','Debe seleccionar los dos elementos'),('ERROR_ADD_DESTINATION','Error - Agregando Destino'),('ERROR_ADD_EXTEN','Error - Agregando Extensi&oacute;n'),('ERROR_ADD_FOLLOWS','Error - Agregando Follow Me'),('ERROR_ADD_IVR','Error - Agregando IVR'),('ERROR_ADD_IVROPTION','Error - Agregando opci&oacute;n de IVR'),('ERROR_ADD_MEDIASERVER','Error - Agregando Media Server'),('ERROR_ADD_QUEUE','Error - Agregando Cola'),('ERROR_ADD_SERVER','Error - Agregando Server'),('ERROR_ADD_TIME','Error - Agregando Horario'),('ERROR_ADD_TIMEOPTION','Error - Agregando Opci&oacute;n en Horario'),('ERROR_ADD_TRUNK','Error - Agregando Trunk'),('ERROR_DELETE_EXTEN','Error - Borrando Extensi&oacute;n'),('ERROR_DELETE_TIMEOPTION','Error - Borrando Opci&oacute;n en Horario'),('error_empty','Datos sin cargar'),('error_exten_quantity_max','Excedi&oacute; la cantidad m&aacute;xima de Extensiones'),('error_ilegal_digits_exten','El n&uacute;mero de d&iacute;gitos de la Extensi&oacute;n no es correcto'),('error_ilegal_format_exten','La cantidad max. de extensiones no es correcta'),('ERROR_LOGIN','Error - Login'),('error_max_que','Cantidad Max. de Colas Alcanzada.'),('error_outboundvm_not_allowed','El tiempo est&aacute; mal configurado o no puede ser editado porque cambio de estado'),('error_outboundvm_schedule','El tiempo est&aacute; mal configurado'),('error_path_record','Selecciono activar grabaciones, no puede dejar la ruta de grabaciones vac&iacute;a'),('error_trunk_exist','Ya existe un Trunk con ese n&uacute;mero'),('ERROR_UPDATE_FOLLOWS','Error - Actualizando Follow Me'),('ERROR_UPDATE_QUEUE','Error - Actualizando Cola'),('error_user','Usuario o Contrase&ntilde;a incorrectos'),('especial','Especial'),('EXTEN::insert_EXTENS','Por favor cargue la Extensi&oacute;n'),('EXTEN::setCallgroup','Por favor cargue el n&uacute;mero del Grupo de Pickup'),('EXTEN::setNumber','Por favor cargue el n&uacute;mero'),('EXTEN::setPass','Por favor cargue el contrase&ntilde;a'),('extens','Extensiones'),('exten_Action','Acci&oacute;n'),('exten_action1','Features'),('exten_action2','Acci&oacute;n directa 2'),('exten_action3','Acci&oacute;n directa 3'),('exten_asign','Asign'),('exten_callgroup','Grupo'),('exten_CorpID','Corporaci&oacute;n'),('exten_create_user','Crear usuario web'),('exten_description','Descripci&oacute;n'),('exten_Enabled','Habilitado'),('exten_form_register_note','El n&uacute;mero de la Extensi&oacute;n no puede ser inferior a 200. Registrar usando'),('exten_form_register_note2','El n&uacute;mero de Extensi&oacute;n no puede ser inferior a 1000. Registrar usando'),('exten_form_title_add','Adicionar Extensi&oacute;n'),('exten_form_title_update','Actualizar Extensi&oacute;n'),('exten_HasVoiceMail','Tenes VoiceMail'),('exten_list_title','Lista de Extensiones'),('exten_Number','N&uacute;mero'),('exten_onbusy_action','Ocupado'),('exten_Outer','Externo'),('exten_Pass','Contrase&ntilde;a'),('exten_registered_ip','IP'),('exten_registered_port','Puerto'),('exten_selected_panel','Extensi&oacute;n seleccionado'),('exten_selected_panel2','Escoja la Cola donde desea insertar la Extensi&oacute;n en el lado derecho de la pantalla, haciendo clic en'),('exten_trunk','Trunk'),('exten_TrunkID','Trunk'),('exten_user','Usuario'),('exten_useragent','User Agent'),('exten_UserID','Usuario'),('exten_VMPass','Contrase&ntilde;a del VoiceMail'),('file_no_exist','El archivo no existe'),('followme','Follow Me'),('FOLLOWME::setExtID','Error - Cargar la Extensi&oacute;n'),('FOLLOWME::setNumber','Error - Cargar el N&uacute;mero'),('FOLLOWME::setOrder','Error - Cargar el orden'),('FOLLOWME::setTimeout','Error - Cargar el timeout'),('FOLLOWME::setType','Error - Cargar el tipo'),('FOLLOWME::update_FOLLOWS','Error actualizando el Follow Me'),('followme_exten_new_title','Nuevo Follow Me - Extensi&oacute;n'),('followme_exten_title','Follow Me  - Extensi&oacute;n'),('followme_ExtID','Extensi&oacute;n'),('followme_form_title_add','Adicionar'),('followme_form_title_update','Actualizar'),('followme_ID','ID'),('followme_list_title','Lista de Follow Me'),('followme_Name','Nombre'),('followme_Number','N&uacute;mero'),('followme_Order','Orden'),('followme_Timeout','Timeout'),('followme_Type','Tipo'),('followme_typeCall','Tipo de llamada'),('followme_type_call','Tipo de llamada'),('forget_password','Recuperar el contrase&ntilde;a'),('forms_bar','Altas'),('form_add','Adicionar'),('form_cancel','Cancelar'),('form_Dial','Discar'),('form_disabled','Desabilitado'),('form_dual_ring','Toque Simult&aacute;neo'),('form_enabled','Habilitado'),('form_enqueue','Encolar'),('form_extern','Externo'),('form_external_ring','Toque Externo'),('form_file_upload','Cargar archivo'),('form_followme','Follow Me'),('form_followme_extern','Follow Me - Externo'),('form_followme_intern','Follow Me - Extensi&oacute;n'),('form_fri','vie'),('form_import_from_VSC','Importar desde VSC'),('form_intern','Extensi&oacute;n'),('form_login','Login'),('form_logout','Logout'),('form_mon','lun'),('form_no','No'),('form_Pickup','Pickup'),('form_rest_sala','Sala de Conferencia'),('form_ring','Toque'),('form_send','Enviar'),('form_sun','dom'),('form_thu','jue'),('form_tue','mar'),('form_update','Actualizar'),('form_voicemail','VoiceMail'),('form_VoiceMailMain','VoiceMail'),('form_wed','mie'),('form_yes','Si'),('funcionalidades','Funciones'),('groups','Grupos'),('hangup','Terminar'),('incoming','Entrada'),('incorrect_sound','Opc. Inv.'),('input_pattern','Ingrese el Patr&oacute;n'),('integration_form_title_options','Integraci&oacute;n - Acciones'),('integration_list_title','Lista de integraciones'),('integration_option1','Op. No cliente'),('integration_option2','Op. Cliente sin problemas'),('integration_option3','Op. Cliente con problemas y con deudas'),('internacional','LDI'),('internal','Extensi&oacute;n'),('ivr','IVR'),('IVR::setName','Error - Cargue el Nombre'),('IVR::setSound','Error - Cargue el Audio'),('IVROPTION::setIvrID','Error - Cargue el IVR'),('ivroption_Action','Acci&oacute;n'),('ivroption_form_title_add','Adicionar'),('ivroption_form_title_update','Actualizar'),('ivroption_IvrID','IVR'),('ivroption_list_title','Lista de opciones'),('ivroption_Name','Nombre'),('ivroption_Order','Orden'),('ivrs','IVRs'),('ivr_form_title_add','Adicionar'),('ivr_form_title_options','IVR - Opciones'),('ivr_form_title_update','Actualizar'),('ivr_list_title','Lista de IVRs'),('ivr_Name','Nombre'),('ivr_opcion','Opci&oacute;n'),('ivr_option0','Op. 0'),('ivr_option1','Op. 1'),('ivr_option2','Op. 2'),('ivr_option3','Op. 3'),('ivr_option4','Op. 4'),('ivr_option5','Op. 5'),('ivr_option6','Op. 6'),('ivr_option7','Op. 7'),('ivr_option8','Op. 8'),('ivr_option9','Op. 9'),('ivr_pattern','Default'),('ivr_Sound','Audio'),('ivr_sound_format_note','Archivos (.wav) en formato PCM, 8Khz, 16 bits y tama&ntilde;o m&aacute;ximo de 2Mb'),('label_from_dashboard','Desde'),('label_queues_dashboard','Colas'),('label_to_dashboard','Hasta'),('label_view_password','Cliquear en el &aacute;rea de texto para ver el contrase&ntilde;a'),('list_add','Adicionar'),('list_ant','Anterior'),('list_delete','Borrar'),('list_download','Descargar'),('list_extern','Externo'),('list_intern','Extensi&oacute;n'),('list_no','No'),('list_pin','Pin'),('list_play_sound','Reproducir'),('list_sig','Siguiente'),('list_sublist','Sublista'),('list_update','Actualizar'),('list_yes','Si'),('list_zero_rows','Ninguna Cola'),('local_fijo','Local'),('local_movil','Celular Local'),('login_form_title','Login'),('login_pass','Contrase&ntilde;a'),('login_user','Usuario&#160;&#160;&#160;&#160;&#160;&#160;'),('logmon_bar','LogMonitor'),('logmon_filter_agi','AGI'),('logmon_filter_btn_restart','Reiniciar'),('logmon_filter_centrex','CENTREX'),('logmon_filter_centrex_sql','CENTREX SQL'),('logmon_filter_error','ERROR'),('logmon_filter_msje1','Solamente falta un minuto para reiniciar el Logmon'),('logmon_filter_msje2','Atenci&oacute;n'),('logmon_filter_msje3','El Logmon requiere reiniciar el proceso despu&eacute;s de 10 minutos'),('logmon_filter_notice','NOTICE'),('logmon_filter_verbose','VERBOSE'),('logmon_filter_warning','WARNING'),('logo','Imagen de la barra de secciones: '),('logo_fondo','Imagen de fondo: '),('max_duration','Tiempo m&aacute;ximo de Llamada'),('mediaserver_enabled','Habilitado'),('mediaserver_form_title_add','Adicionar Media Server'),('mediaserver_form_title_update','Actualizar Media Server'),('mediaserver_list_title','Media Server'),('mediaserver_number','N&uacute;mero'),('mediaserver_sound','Audio'),('mediaserver_sound_format_note','Archivos (.wav) en formato PCM, 8Khz, 16 bits'),('MEDIA_SERVER::insert_MEDIASERVERS','Error cargando Media Server'),('menu_cdr_list','Lista de CDRs'),('menu_corp_list','Corporaciones'),('menu_destinations_groups_list','Grupos de Destinos'),('menu_destination_list','Destinos'),('menu_discador','Discador'),('menu_exten_list','Extensiones'),('menu_integration','Integraciones'),('menu_ivr_list','IVRs'),('menu_logout','Salir'),('menu_mediaserver_list','Media Server'),('menu_moh','Moh de Corporaci&oacute;n'),('menu_outboundvm_list','Voicemail'),('menu_page_style','Look & Feel'),('menu_panel','Panel del Operador'),('menu_queue_list','Colas'),('menu_restrictions_list','Restricciones'),('menu_restriction_list','Restricciones'),('menu_route_list','Rutas'),('menu_server_list','Servers'),('menu_speeddial_list','Marcado R&aacute;pido'),('menu_time_list','Horarios'),('menu_title','Men&uacute;'),('menu_trunk_list','Trunks'),('menu_users_list','Usuarios'),('menu_user_list','Usuarios'),('min_duration','Tiempo m&aacute;ximo de Espera'),('moda_poll','Moda'),('msge-info-route','Si se deja el valor vac&iacute;o en la ruta se va a usar la imagen del supervisor.'),('msge-no-style-changed','No hay cambios.'),('msge-ok-set-style','Parametros actualizados, por favor inicie sesi&otilde;n nuevamente.'),('msge_error','ERROR'),('msge_error','ERROR'),('msge_error2','Hay un problema de conexi&oacute;n, verifiquelo e intente nuevamente'),('msge_error4','Escogi&oacute; como acci&oacute;n toque simult&aacute;neo y debe indicar un nro. externo'),('msge_error5','El n&uacte,mero que introdujo ya existe. Pueden existir Extensiones con el mismo n&uacte,mero'),('msge_error6','Error en la carga del archivo de audio'),('msge_error7','La Extensi&oacute;n no existe.'),('msge_error_exten_bad_description','La descripcion solo puede contener letras, numeros, espacios,  (, ), -, _ y . (punto)'),('msge_error_corp','Ya existe una Corporaci&oacute;n con ese nombre'),('msge_error_destination\r\n','Ya existe ese prefijo'),('msge_error_destination','Ya existe un Destino con ese prefijo'),('msge_error_destination_group','Ya existe un Grupo de Destino con ese nombre'),('msge_error_destination_group','Ya existe un Grupo de Destino co ese nombre'),('msge_error_dgroup_exist','Un Grupo de Destino ya existe con ese nombre'),('msge_error_dial','Ya existe un Marcado R&aacute;pido con ese n&uacute;mero'),('msge_error_dial_exten','El Marcado R&aacute;pido ya existe con ese n&uacute;mero'),('msge_error_edit_dial_exten','Marcado R&aacute;pido - Ya existe una Extensi&oacute;n con ese n&uacute;mero'),('msge_error_exten','Ya existe una Extensi&oacute;n con ese n&uacute;mero'),('msge_error_follow','Un Follow Me ya existe con esos datos'),('msge_error_integration','Ya existe una integraci&oacute;n con ese nombre'),('msge_error_ivr','Ya existe un IVR con ese nombre'),('msge_error_ivr7','El archivo a&uacute;n se est&aacute; subiendo'),('msge_error_media_server','Ya existe un Media Server con esa direcci&oacute;n IP'),('msge_error_outer_empty','Si seleccion&oacute; toque externo, no puede dejar vac&iacute;o el campo \'externo\''),('msge_error_poll','Ya existe una encuesta con ese nombre'),('msge_error_question','Ya existe una pregunta con ese nombre'),('msge_error_question2','Ya existe una pregunta con ese orden'),('msge_error_queue','Ya existe una Cola'),('msge_error_queue_inuse','Por favor, solucione los siguientes conflictos para eliminar la cola.'),('msge_error_queue_inuse_sd','La cola est&aacute; en uso por uno o m&aacute;s n&uacute;meros de marcado r&aacute;pido.'),('msge_error_queue_inuse_temp','La cola est&aacute; en uso por uno o m&aacute;s horarios.'),('msge_error_queue_inuse_que','La cola est&aacute; en uso por una o m&aacute;s colas.'),('msge_error_queue_inuse_tru','La cola est&aacute; en uso por uno o m&aacute;s troncales.'),('msge_error_queue_inuse_ivr','La cola est&aacute; en uso por uno o m&aacute;s IVRs.'),('msge_error_queue_inuse_disc','La cola est&aacute; en uso por uno o m&aacute;s Discadores.'),('msge_error_restriction','Ya existe esa Restricci&oacute;n'),('msge_error_server','Ya existe un Server con ese nombre'),('msge_error_server_IP_PORT','Ya existe un servidor con esa IP y ese puerto'),('msge_error_speeddial','Ya existe ese Marcado R&aacute;pido'),('msge_error_speeddial_2','Solo se permite n&uacute;meros de m&aacute;s de un d&iacute;gito'),('msge_error_time','Ya existe un Horario con ese nombre'),('msge_error_trunk2','Ya existe un Trunk con ese n&uacute;mero'),('msge_error_trunk4','No se logro parar los discadores correspondientes a este tronco'),('msge_error_user','Ya existe ese Usuario'),('msge_error_user2','La Corporaci&oacute;n no existe.'),('msge_ok','OK'),('msge_warning','AVISO'),('msge_okedit_corp','La Corporaci&oacute;n fu&eacute; actualizada con &eacute;xito'),('msge_ok_corp','La Corporaci&oacute;n fu&eacute; creada con &eacute;xito'),('msge_ok_destination','El Destino fu&eacute; creado con &eacute;xito.'),('msge_ok_destination_group','El Grupo de Destino fu&eacute; creado con &eacute;xito'),('msge_ok_dial','El Marcado R&aacute;pido fu&eacute; creado con &eacute;xito'),('msge_ok_dial_exten','El Marcado R&aacute;pido fu&eacute; creado con &eacute;xito'),('msge_ok_edit_dial_exten','El Marcado R&aacute;pido - Extensi&oacute;n fu&eacute; editada con &eacute;xito'),('msge_ok_exten','La Extensi&oacute;n fu&eacute; creada con &eacute;xito'),('msge_ok_follow','El Follow Me - Extensi&oacute;n fu&eacute; creada con &eacute;xito'),('msge_ok_integration','La integraci&oacute;n fue creada con &eacute;xito'),('msge_ok_ivr','El IVR fu&eacute; creado con &eacute;xito'),('msge_ok_media_server','El Media Server fu&eacute; creado con &eacute;xito'),('msge_ok_outboundvm','El voicemail fue creado con &eacute;xito'),('msge_ok_queue','La Cola fu&eacute; creada con &eacute;xito'),('msge_ok_restriction','La Restricci&oacute;n fu&eacute; creado con &eacute;xito'),('msge_ok_server','El Server fu&eacute; creado con &eacute;xito'),('msge_ok_time','El Horario fu&eacute; creado con &eacute;xito'),('msge_ok_trunk','El Trunk fu&eacute; creado con &eacute;xito'),('msge_ok_user','El Usuario fu&eacute; creado con &eacute;xito'),('msg_info_strategy','El timeout no se aplica a la estrategia tocar todos'),('msg_ok_poll','La Encuesta fu&eacute; creado con &eacute;xito'),('msj_confirm_delete','Confirmar borrado'),('nacional_fijo','LDN'),('nacional_movil','Celular LDN'),('new_corp','Nueva Corporaci&oacute;n'),('new_destination','Nuevo Destino'),('new_destination_group','Nuevo Grupo  de Destino'),('new_dial','Nuevo Marcado R&aacute;pido'),('new_exten','Nueva Extensi&oacute;n'),('new_integration','Nueva integraci&oacute;n'),('new_ivr','Nuevo IVR'),('new_media_server','Nuevo Media Server'),('new_outboundvm','Nuevo Voicemail'),('new_poll','Nueva Encuesta'),('new_question','Nueva Pregunta'),('new_queue','Nueva Cola'),('new_restriction','Nueva Regla'),('new_server','Nuevo Server'),('new_time','Nuevo Horario'),('new_trunk','Nuevo Trunk'),('new_user','Nuevo Usuario'),('NOANSWER','Sin respuesta'),('note2_panel','Para adicionar una Extensi&oacute;n a una Cola, debe hacer click en la Extensi&oacute;n'),('note3_panel','Fuera de las Colas'),('note4_panel','Ocupado'),('note5_panel','Indisponible'),('note6_panel','Disponible'),('not_data_monitor_dashboard','No existen Extensiones con qualify habilitado'),('not_data_statics_dashboard','No existen datos para la consulta'),('not_selected','Desactivado'),('no_data','Sin datos disponibles en la tabla'),('OK_ADD_DESTINATION','Destino agregado con &eacute;xito'),('OK_ADD_EXTEN','Extensi&oacute;n agregada con &eacute;xito'),('OK_ADD_FOLLOWS','Follow Me agregado con &eacute;xito'),('OK_ADD_IVR','IVR agregado con &eacute;xito'),('OK_ADD_IVROPTION','Opci&oacute;n de IVR agregada con &eacute;xito'),('OK_ADD_MEDIASERVER','Media Server agregado con &eacute;xito'),('OK_ADD_QUEUE','Cola agregada con &eacute;xito'),('OK_ADD_SERVER','Server agregado con &eacute;xito'),('OK_ADD_TIME','Horario agregado con &eacute;xito'),('OK_ADD_TIMEOPTION','Opci&oacute;n de Horario agregada con &eacute;xito'),('OK_ADD_TRUNK','Trunk agregado con &eacute;xito'),('OK_DELETE_EXTEN','Extensi&oacute;n borrada con &eacute;xito'),('OK_DELETE_FOLLOWS','Follow Me borrado con &eacute;xito'),('OK_DELETE_QUEUE','Cola borrada con &eacute;xito'),('OK_DELETE_TIME','Horario borrado con &eacute;xito'),('OK_DELETE_TIMEOPTION','Opci&oacute;n de Horario borrada con &eacute;xito'),('OK_LOGIN','Login - Correcto'),('OK_UPDATE_DESTINATION','Destino borrado con &eacute;xito'),('OK_UPDATE_EXTEN','Extensi&oacute;n actualizada con &eacute;xito'),('OK_UPDATE_FOLLOWS','Follow Me actualizado con &eacute;xito'),('OK_UPDATE_IVR','IVR actualizado con &eacute;xito'),('OK_UPDATE_MEDIASERVER','Media Server actualizado con &eacute;xito'),('OK_UPDATE_QUEUE','Cola actualizada con &eacute;xito'),('OK_UPDATE_ROUTE','Ruta actualizada con &eacute;xito'),('OK_UPDATE_SERVER','Server actualizado con &eacute;xito'),('OK_UPDATE_TIME','Horario actualizado con &eacute;xito'),('OK_UPDATE_TIMEOPTION','Opci&oacute;n de Horario actualizada con &eacute;xito'),('OK_UPDATE_TRUNK','Trunk actualizado con &eacute;xito'),('only_numbers','Solo n&uacute;meros'),('only_numbers_2dig','Solo n&uacute;meros de 1 a 2 d&iacute;gitos'),('only_numbers_4dig','Solo n&uacute;meros de 1 a 4 d&iacute;gitos'),('only_numbers_5dig','Solo n&uacute;meros de 1 a 5 d&iacute;gitos'),('order','Orden'),('outboundvm_status','Estado'),('outboundvm_status_listened','Escuchado'),('outboundvm_status_pending','Pendiente'),('outboundvm_status_urgent','Urgente'),('outboundvm_type_received','Recibido'),('outboundvm_type_sent','Enviado'),('panel_atention','Atenci&oacute;n'),('panel_bar','Panel'),('panel_ligacoes_em_espera','Llamadas en espera'),('panel_note1','Para adicionar una Extensi&oacute;n a una Cola, debe hacer click en la Extensi&oacute;n '),('panel_note2','Primero debe seleccionar una Extensi&oacute;n para insertarla en una Cola'),('panel_note3','La Extensi&oacute;n ya existe'),('panel_status1','Omisi&oacute;n'),('panel_status2','Disponible'),('panel_status3','Al llamar'),('panel_status4','Indisponible'),('permission_feaID','ID de funcionalidad'),('permission_list_title','Lista'),('permission_name','Nombre'),('pickup','Capturar llamada'),('play','Reproducir'),('poll','Encuesta'),('polls','Encuestas'),('poll_list_title','Lista de Encuestas'),('question','Pregunta'),('question_list_title','Lista de Preguntas'),('queue','Cola'),('QUEUE::setID','Error - Cargue el ID'),('QUEUE::setName','Error - Cargue el nombre'),('queuestats_atendidas','Atendidas'),('queuestats_desatendidas','No Atendidas'),('queuestats_estats','Datos de la Cola: '),('queuestats_horadesde','Hora desde'),('queuestats_horahasta','Hora hasta'),('queuestats_transferencias','Transferencias'),('queue_action_failover','Acci&oacute;n de Failover'),('queue_announce','Anuncio para Atendente'),('queue_CorpID','Corporaci&oacute;n'),('queue_empty_panel','No existen Colas creadas'),('queue_enqueue','Encolar'),('queue_fewestcalls','Menos Llamadas'),('queue_form_alert_update','Al optar por serie, el Centrex se reininiar&aacute; cuando no tenga tr&aacute;fico. Desea continuar?'),('queue_form_info_update','No es posible seleccionar el tipo de estrategia \"S&Eacute;RIE\", es necesario volver a crear la cola.'),('queue_form_title_add','Adicionar Cola'),('queue_form_title_update','Actualizar Cola'),('queue_leastrecent','&Uacute;ltimo Atendido'),('queue_linear','S&eacute;rie'),('queue_list_title','Lista de Colas'),('queue_login','Login Cola'),('queue_logout','Logout Cola'),('queue_Name','Nombre'),('queue_random','Aleatorio'),('queue_ringall','Ring Todos'),('queue_rrmemory','Pseudo Aleatorio'),('queue_strategy','Estrategia'),('queue_timeout','Timeout de estrategia'),('queue_timeout_failover','M&aacute;x. tiempo de espera'),('queue_wrandom','Aleatorio Inteligente'),('received','Recibidos'),('registered_destinations','Destinos cargados'),('remove','Eliminar'),('restriction','Restricci&oacute;n'),('restrictions','Restricciones'),('restriction_corp','Corporaci&oacute;n'),('restriction_CorpID','Corporaci&oacute;n'),('restriction_DesID','Destino'),('restriction_entityID','Entidad'),('restriction_exten','Restricci&oacute;n - Extensi&oacute;n'),('restriction_note','Puede ingresar un Patr&oacute;n, opciones predeterminadas como Correo de Voz o Sala de Conferencia o bien elegir un Grupo de Destino. Seleccione tambi&eacute;n su habilitaci&oacute;n, si marca la opci&oacute;n pin estar&aacute; permitiendo la llamada solo si se ingresa un pin.'),('restriction_pattern','Destino'),('restriction_Permit','Permitir'),('restriction_Pin','Pin'),('route_Cost','Costo de la Ruta'),('route_form_title_add','Adicionar Ruta'),('route_form_title_update','Actualizar Ruta'),('route_list_title','Rutas'),('route_Name','Nombre'),('route_Pattern','Prefijo'),('route_SerID','Server'),('search','Buscar'),('search_class','Clase'),('search_object','Objeto'),('sent','Enviados'),('server','Server'),('SERVER::setIP','Por favor, cargue la direcci&oacute;n IP'),('SERVER::setName','Por favor, cargue el nombre'),('SERVER::setPort','Por favor, cargue el puerto'),('servers','Servers'),('server_form_title_add','Adicionar Server'),('server_form_title_update','Actualizar Server'),('server_IP','Direcci&oacute;n IP o Dominio'),('server_list_title','Lista de Servers'),('server_Name','Nombre'),('server_Port','Puerto'),('sound1_integration','Solicitar ID del cliente'),('sound2_integration','Aviso de existencia de inconvenientes'),('sound_form_note','El cambio de archivo de audio s&oacute;lo ser&aacute; efectivo al enviar el formulario.'),('speeddial','Marcado R&aacute;pido'),('SPEEDDIAL::insert_SPEEDDIAL','Error - Cargar Marcado R&aacute;pido'),('SPEEDDIAL::setData','Error - Cargue la Fecha'),('SPEEDDIAL::setEntityID','Error - Cargue el ID de la entidad'),('SPEEDDIAL::setNumber','Error - Cargue el n&uacute;mero'),('SPEEDDIAL::setType','Error - Cargue el tipo'),('speeddial_action','Acci&oacute;n'),('speeddial_Action','Acci&oacute;n'),('speeddial_Data','Menu'),('speeddial_Entity','Entidad'),('speeddial_form_title_add','Adicionar Marcado R&aacute;pido'),('speeddial_form_title_update','Actualizar Marcado R&aacute;pido'),('speeddial_list_title','Lista de Marcado R&aacute;pido'),('speeddial_number','N&uacute;mero'),('speeddial_Position','Posici&oacute;n'),('speedial_number','N&uacute;mero de Marcado R&aacute;pido '),('statics_bar','Estad&iacute;sticas'),('tempo_new_action','Haz click aqu&iacute; para ir creando acciones'),('text_instructive_ivr','Debe habilitar cada opci&oacute;n a la que desea atribuir un valor'),('thead_status_monitor_dashboard','Estado'),('time','Horario'),('TIME::insert_TIMEMAIN','Error - Cargue el Horario'),('TIME::setCorpID','Por favor, cargue la Corporaci&oacute;n'),('TIME::setID','Error - Cargue el ID'),('TIME::setName','Por favor, cargue el nombre'),('TIMEOPTION::setTimeID','Por favor, cargue el Horario'),('timeoption_date_format','(HH:MM)'),('timeoption_Days','D&iacute;as'),('timeoption_From','Desde'),('timeoption_list_title','Opciones de Horario'),('timeoption_To','Hasta'),('time_Action','Acci&oacute;n'),('time_CorpID','Corporaci&oacute;n'),('time_Days','D&iacute;as'),('time_form_title_add','Adicionar Horario'),('time_form_title_options','Horario - Opciones'),('time_form_title_update','Actualizar Horario'),('time_From','Desde'),('time_ID','ID'),('time_list_title','Lista de Horarios'),('time_Name','Nombre'),('time_note','Toda llamada fuera de los int&eacute;rvalos ejecutara la opci&oacute;n default'),('time_note10','Horario borrado con &eacute;xito'),('time_note2','Seleccione los d&iacute;as, cliqueando en ellos'),('time_note3','Debe indicar la hora desde y la hora hasta para seleccionar una acci&oacute;n e indicar los d&iacute;as de la semana'),('time_note4','El horario elegido se superpone con uno existente'),('time_note5','Hora hasta siempre debe ser mayor que la hora desde'),('time_note6','Una vez creado el Horario con las opciones clic en enviar'),('time_note7','No hay acciones creadas para el Horario'),('time_note8',' Confirmar exclusi&oacute;n de la acci&oacute;n'),('time_note9','Una vez cambiado el nombre del Horario o la opci&oacute;n default puede hacer clic en enviar'),('time_pattern','Default'),('time_To','Hasta'),('titile_command3','Ocultar la consola'),('titile_filter','Filtro'),('title-sequencial','Secuencial'),('title-smart','Inteligente'),('title1_dashboard','Estad&iacute;sticas de las Colas'),('title2_dashboard','Monitor Qualify'),('title_command','Comando'),('title_command2','Presione Enter para ejecutar el comando'),('title_command3','Ocultar'),('title_command4','Presione Enter para aplicar el  filtro'),('title_command5','Borrar filtro'),('title_destinations_group','Click para seleccionar destinos'),('title_dg','-- GRUPOS DE DESTINOS --'),('title_filter','Filtro'),('title_monitor_dashboard','Monitor de Extensiones (Qualify)'),('title_monitor_waiting_dashboard','Por favor, aguarde 15 segundos'),('title_shorcut1','Opciones'),('title_shorcut2','Men&uacute;'),('title_site','VSC Centrex v4.0'),('title_statics_dashboard','Estad&iacute;sticas de las Colas'),('toggle_console','Ver consola'),('total','Total'),('total_calls','N&uacute;mero total de Llamadas'),('total_duration','Tiempo Total de Llamadas'),('total_duration_avg','Tiempo medio de Llamada'),('total_wait','Tiempo Total en Espera'),('total_wait_avg','Tiempo medio de Espera'),('trunk','DID'),('TRUNK::setCorpID','Por favor, cargue la Corporaci&oacute;n'),('TRUNK::setNumber','Por favor, cargue el N&uacute;mero'),('TRUNK::setPass','Por favor, cargue el contrase&ntilde;a'),('TRUNK::setSerID','Por favor, cargue el Server'),('trunk_Action','Acci&oacute;n'),('trunk_CorpID','Corporaci&oacute;n'),('trunk_Enabled','Habilitado'),('trunk_Follow','Follow Me'),('trunk_form_title_add','Adicionar Trunk'),('trunk_form_title_update','Actualizar Trunk'),('trunk_list_title','Lista de Trunks'),('trunk_Number','N&uacute;mero'),('trunk_Outgoing','Salida habilitada'),('trunk_Pass','Contrase&ntilde;a'),('trunk_Preference','Preferencia'),('trunk_SerID','Server'),('trunk_Timeout','Timeout'),('type_call_auto_reminder','Enviar mensaje de Autorecordatorio'),('type_call_Internacional','Internacional'),('type_call_LF','Local Fijo'),('type_call_LM','Local M&oacute;vil'),('type_call_MeetMe','Conferencia'),('type_call_NF','Nacional Fijo'),('type_call_NM','Nacional M&oacute;vil'),('type_call_outbound','Enviar mensaje de voz'),('type_call_reminder','Enviar Recordatorio'),('type_call_special','Especial'),('type_call_VoiceMail','VoiceMail'),('unknown','Desconocido'),('upload_error_uploading','Error actualizando los datos'),('upload_ok','Carga correcta'),('upload_send','Enviar'),('upload_title','Actualizar'),('user2','Usuarios'),('USER::setPass','Por favor, cargue el contrase&ntilde;a'),('USER::update_ID','Error - Actualizar ID'),('user_CorpID','Corporaci&oacute;n'),('user_Enabled','Habilitado'),('USER_INCORRECT_DATA','Datos incorrectos'),('user_Level','Nivel'),('user_level_administrador','Administrador'),('user_level_supervisor','Supervisor'),('user_level_usuario','Usuario'),('user_list_title','Lista de Usuarios'),('user_mail','E-mail'),('user_Nick','Usuario web'),('user_Pass','Contrase&ntilde;a'),('user_web','Usuario web'),('validator_field_required','Campo obligatorio'),('validator_pattern_not_match','Formato incorrecto'),('vendor_a','con'),('vendor_anterior','Anterior'),('vendor_copy','Copiado en la Memoria'),('vendor_copy1','Fue copiada una linea en la memoria'),('vendor_copyn','Se copiar&oacute;n'),('vendor_copyn1','lineas en la memoria'),('vendor_de','registros de'),('vendor_filas',''),('vendor_olhando',''),('vendor_olhando_ate','a'),('vendor_procurar','Buscar:'),('vendor_proximo','Siguiente'),('vendor_sd','Sin datos disponibles en la tabla'),('vsc_did_number','DID'),('vsc_distributor','Distribuidor'),('vsc_user_nick','Nombre'),('vsc_wsadmin_ip','IP del WS ADMIN'),('exten_limit','L&iacute;mite de llamadas simult&aacute;neas'),('label_limit','0 = ilimitado'),('exten_porttype','Tipo de puerto'),('queue_position','Posici&oacute;n de fila'),('refresh_note','La tabla no ser&aacute; actualizada hasta que recargue la p&aacute;gina'),('queue_announce_seconds','Segundos de announce frequency'),('label_seconds_queue','M&aacute;ximo: 10 segundos'),('queue_ringinuse','Ring in use');
/*!40000 ALTER TABLE `langses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langspt`
--

DROP TABLE IF EXISTS `langspt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langspt` (
  `en` varchar(550) NOT NULL,
  `pt` varchar(550) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langspt`
--

LOCK TABLES `langspt` WRITE;
/*!40000 ALTER TABLE `langspt` DISABLE KEYS */;
INSERT INTO `langspt` VALUES ('addContext','Adicionar contexto'),('addTrunk','Adicionar Tronco'),('add_dial','Adicionar novo discagem r&aacute;pido'),('add_followme','Adicionar novo Follow Me'),('all','Todos'),('announce_sound_format_note','Arquivos (.wav) devem ficar no formato PCM, 8Khz, 16 bits '),('answer','Resposta'),('atention_dec_panel','Primeiro voc&ecirc; deve selecionar um Ramal para inser&iacute;-lo em uma Fila'),('atention_desc_panel','N&atilde;o tem selecionado um Ramal para essa Fila'),('atention_panel','Aten&ccedil;&atilde;o'),('average_poll','M&eacute;dia'),('btn_exit','Sair'),('btn_view_corps','Olhar Corpora&ccedil;&otilde;es'),('btn_view_destinations','Olhar Destinos'),('btn_view_destinations_group','Olhar Grupo de Destinos'),('btn_view_dial','Olhar Discagem R&aacute;pida'),('btn_view_extens','Olhar Ramais'),('btn_view_integration','Olhar integra&ccedil;&otilde;es'),('btn_view_ivrs','Olhar URAs'),('btn_view_media_servers','Olhar Servidores de M&iacute;dia'),('btn_view_outboundvm','Olhar voicemails'),('btn_view_polls','Olhar Pesquisas'),('btn_view_queues','Olhar Filas'),('btn_view_restrictions','Olhar Restri&ccedil;&otilde;es'),('btn_view_servers','Olhar Servidores'),('btn_view_time','Lista de Tempos'),('btn_view_trunks','Olhar Troncos'),('btn_view_users','Olhar Usu&aacute;rios'),('btn_queue_report','Ver relat&oacute;rio da fila'),('call_forward','Encaminhar Chamadas'),('CALL_RESTRICTED','Liga&ccedil;&atilde;o restringida'),('cal_April','Abril'),('cal_August','Agosto'),('cal_December','Dezembro'),('cal_February','Fevereiro'),('cal_Fr','Sex'),('cal_Friday','Sexta'),('cal_January','Janeiro'),('cal_July','Julho'),('cal_June','Junho'),('cal_May','Maio'),('cal_Mo','Seg'),('cal_Monday','Segunda'),('cal_next_year','ano seg.'),('cal_November','Novembro'),('cal_October','Outubro'),('cal_prev_year','ano ant.'),('cal_Saturday','S&aacute;bado'),('cal_September','Setembro'),('cal_Su','Dom'),('cal_Sunday','Domingo'),('cal_Th','Qui'),('cal_Thursday','Quinta'),('cal_Tu','Ter'),('cal_Tuesday','Ter&ccedil;a'),('cal_We','Qua'),('cal_Wednesday','Quarta'),('CANCEL','Cancelada'),('exten_spied','Pode ser espionado'),('capture_by_size','Cadastre o tamanho'),('capture_by_size_incorrect_input','Tamanho incorreto'),('capture_by_size_input','Cadastre o tamanho [em MB]: '),('capture_by_time','Cadastre o tempo'),('capture_by_time_incorrect_input','Tempo incorreto'),('capture_by_time_input','Cadastre o tempo [em segundos, maior ou igual a 2]: '),('capture_packet','Captura de pacotes'),('capture_please_wait','Captura esta-se gerando, por favor aguarde...'),('cc_ddd','C&oacute;digo de Pa&iacute;s o DDD'),('cdr_audio','Audio'),('cdr_billsec','Dura&ccedil;&atilde;o'),('cdr_called','Destino'),('cdr_caller','Origem'),('cdr_calltype','Tipo'),('cdr_calltype_quantity','Quantidade'),('cdr_date','Data'),('cdr_destination','Destino'),('cdr_destinationtype','Tipo de Destino'),('cdr_detailed','Detalhado'),('cdr_exten','Ramal'),('cdr_from','Desde'),('cdr_list_title','CDRs'),('cdr_name','Nome'),('cdr_note','O filtrado &eacute; feito desde as 00:00 hs do dia da data desde, at&eacute; as 23:59 hs do dia da data at&eacute;.'),('cdr_restPattern','Prefixo'),('cdr_result','Resultados'),('cdr_search','Pesquisar'),('cdr_subtotal','Subtotal'),('cdr_to','At&eacute;'),('cdr_total','Total'),('cdr_total_billsec','Dura&ccedil;&atilde;o Total'),('cdr_usercost','Custo'),('color_bg_active','Cor de fundo da sec&ccedil;&atilde;o activa: '),('color_bg_default','Cor de fundo das sec&ccedil;&otilde;es: '),('color_blue_css','Cor do menu lateral: '),('color_font_active','Cor da fonte da sec&ccedil;&atilde;o activa: '),('color_font_default','Cor da fonte das sec&ccedil;&otilde;es: '),('color_footer_bar','Cor de rodap&eacute;: '),('color_nav_bar','Cor da barra das sec&ccedil;&otilde;es: '),('col_title_exten_action','A&ccedil;&atilde;o'),('col_title_exten_actions','A&ccedil;&otilde;es'),('col_title_exten_ID','ID'),('col_title_exten_number','N&uacute;mero'),('config_bar','Configura&ccedil;&atilde;o'),('CONGESTION','Congestionamento'),('corp','Corpora&ccedil;&atilde;o'),('CORP::delete_IVR_EXISTS','Erro - Existe a URA'),('CORP::delete_RESTRICTIONS_EXISTS','Apage as Restri&ccedil;oes'),('CORP::delete_TIMETABLES_COUNT','Erro - Apagando Tempo'),('corp_AllowCustom','Permitir mudar Look & Feel'),('corp_AllowCustom_table','Look & Feel'),('corp_AllowDiscador','Habilitar Discador'),('corp_AllowDiscador_table','Discador'),('corp_Enabled','Habilitado'),('corp_ExtLen','Long. de Ramal'),('corp_ExtMax','Qde. Max. de Ramais'),('corp_form_title_add','Adicionar'),('corp_form_title_update','Atualizar'),('corp_MonEnabled','Grava&ccedil;&otilde;es'),('corp_MonPath','Pasta'),('corp_Name','Nome'),('corp_noteAllowCustom','Para aplicar a mudan&ccedil;a &eacute; necess&aacute;rio fechar o navegador e acessar novamente'),('corp_noteMaxExten','Se a long. do ramal &eacute; 3, o n&uacute;m. m&aacute;ximo de ramais &eacute; 799, e se ele for 4, o n&uacute;mero m&aacute;ximo de ramais &eacute; 8999'),('corp_QueMax','Qde. Max. de Filas'),('dashboard_bar','Dashboard'),('del-restriction-exten-ok','Restri&ccedil;&atilde;o apagada com sucesso'),('delete_corp_ok','Corpora&ccedil;&atilde;o apagada com sucesso '),('delete_corp_text1',' Confirma exclus&atilde;o da Corpora&ccedil;&atilde;o'),('delete_corp_text2','Ser&atilde;o apagados os Usu&aacute;rios, as Filas, os Troncos, os Ramais, as URAs e as Restri&ccedil;oes que estejam atreladas na Corpora&ccedil;&atilde;o'),('delete_corp_title','Apagar Corpora&ccedil;&atilde;o'),('delete_destinationgroup_text1',' Confirmar exclus&atilde;o do Grupo de Destino'),('delete_destination_groups_title','Apagar Grupo de Destino'),('delete_destination_group_title','Apagar Grupo de Destino'),('delete_destination_ok','Destino apagado com sucesso'),('delete_destination_text1',' Confirmar exclus&atilde;o do Destino'),('delete_destination_title','Apagar Destino'),('delete_dgroup_text1',' Confirmar exclus&atilde;o do Grupo de Destino'),('delete_dial_exten_ok','Ramal apagado com sucesso'),('delete_dial_exten_title','Apagar Discagem R&aacute;pida - Ramal'),('delete_dial_ok','Discagem R&aacute;pida apagada com sucesso'),('delete_dial_text1',' Confirmar exclus&atilde;o da Discagem R&aacute;pida'),('delete_dial_title','Apagar Discagem R&aacute;pida'),('delete_exten_text1',' Confirmar exclus&atilde;o do Ramal'),('delete_exten_title','Apagar Ramal'),('delete_follow_exten_ok','Siga-Me - ramal apagado com sucesso'),('delete_follow_exten_title','Apagar Siga-Me - Ramal'),('delete_follow_text1',' Confirmar exclus&atilde;o do Siga-Me'),('delete_integration_ok','Integration apagado com sucesso'),('delete_integration_text1',' Confirmar exclus&atilde;o da integra&ccedil;&atilde;o '),('delete_integration_title','Apagar integra&ccedil;&atilde;o'),('delete_ivr_ok','URA apagada com sucesso'),('delete_ivr_text1',' Confirmar exclus&atilde;o da URA'),('delete_ivr_title','Apagar URA'),('delete_mediaserver_text1',' Confirmar exclus&atilde;o do Servidor de M&iacute;dia'),('delete_media_server_title','Apagar Servidor de M&iacute;dia'),('delete_outboundvm_ok','Voicemail apagado com sucesso'),('delete_outboundvm_text1','Confirmar exclus&atilde;o do Voicemail:'),('delete_outboundvm_text2','Origem: '),('delete_outboundvm_text3','Destino: '),('delete_outboundvm_text4','Data: '),('delete_outboundvm_title','Apagar Voicemail'),('delete_poll_ok','Pesquisa apagada com sucesso'),('delete_poll_text1',' Confirmar exclus&atilde;o da Pesquisa'),('delete_poll_title','Apagar Pesquisa'),('delete_question_text1',' Confirmar exclus&atilde;o da pergunta'),('delete_question_title','Apagar pergunta'),('delete_queue_ok','Fila apagada com sucesso'),('delete_queue_text1',' Confirmar exclus&atilde;o da Fila'),('delete_queue_title','Apagar Fila'),('delete_restriction_exten_title','Apagar Restri&ccedil;&atilde;o'),('delete_restriction_ok','Restri&ccedil;&atilde;o apagada com sucesso'),('delete_restriction_text1',' Confirmar exclus&atilde;o da Restri&ccedil;&atilde;o'),('delete_restriction_title','Apagar Restri&ccedil;&atilde;o'),('delete_server_ok','O Servidor foi apagado com sucesso '),('delete_server_text1',' Confirmar exclus&atilde;o do Servidor e todos os Troncos atribu&iacute;dos'),('delete_server_title','Apagar Servidor'),('delete_speeddial_text1',' Confirmar exclus&atilde;o da Discagem R&aacute;pida'),('delete_time_ok','Tempo apagado com sucesso'),('delete_time_text1',' Confirmar exclus&atilde;o do Tempo'),('delete_time_title','Apagar Tempo'),('delete_trunk_text1',' Confirmar exclus&atilde;o do Tronco'),('delete_trunk_title','Apagar Tronco'),('delete_user_ok','Usu&aacute;rio apagado com sucesso'),('delete_user_ok','Usu&aacute;rio apagado com sucesso'),('delete_user_text1',' Confirmar exclus&atilde;o do Usu&aacute;rio'),('delete_user_title','Apagar Usu&aacute;rio'),('destination','Destino'),('DESTINATION::setName','Erro - Cadastre o Nome'),('DESTINATION::setPattern','Erro - Cadastre o Destino'),('destinations','Destinos'),('destination_form_title_add','Adicionar Destino'),('destination_form_title_update','Atualizar Destino'),('destination_group_form_title_add','Adicionar Grupo de Destinos'),('destination_group_form_title_update','Grupo de Destinos'),('destination_group_items','Items do Grupo'),('destination_group_list_title','Nome do Grupo '),('destination_group_name','Nome do Grupo'),('destination_ID','Destino'),('destination_list_title','Lista de Destinos'),('destination_Name','Nome'),('destination_note','Usar .(ponto) para um caracter ou T para muitos caracteres. Ex: 55..6T - Importante: Agora, o prefixo deve incluir T no final.  Por exemplo: 55T para uma rota para qualquer destino no Brasil'),('destination_Pattern','Prefixo'),('dial_exten_title','Nova Discagem R&aacute;pida - Ramal'),('dial_exten_title2','Discagem R&aacute;pida - Ramais'),('download','Baixar'),('duration','Dura&ccedil;&atilde;o'),('edit_corp_title','Editar Corpora&ccedil;&atilde;o'),('edit_destination_group_title','Editar Grupo de Destino'),('edit_destination_title','Editar Destino'),('edit_dial_exten_title','Editar Discagem R&aacute;pida - Ramal'),('edit_dial_title','Editar Discagem R&aacute;pida'),('edit_exten_ok','Ramal editado com sucesso'),('edit_exten_title','Editar Ramal'),('edit_integration_title','Editar integra&ccedil;&atilde;o'),('edit_ivr_title','Editar URA'),('edit_media_server_title','Editar Servidor de M&iacute;dia'),('edit_outboundvm_title','Editar voicemail'),('edit_page_style','Editar Look & Feel'),('edit_page_style_login','Editar Look & Feel do Login'),('edit_poll_title','Editar Pesquisa'),('edit_queue_title','Editar Fila'),('edit_restriction_title','Editar Restri&ccedil;&atilde;o'),('edit_server_title','Editar Servidor'),('edit_time_ok','Tempo editado com sucesso'),('edit_time_title','Editar Tempo'),('edit_trunk_title','Editar Tronco'),('edit_user_title','Editar Usu&aacute;rio'),('error1_panel','O Ramal j&atilde; existe dentro da Fila'),('error2_panel','Deve selecionar os dois elementos'),('ERROR_ADD_DESTINATION','Erro - Adicionando Destino'),('ERROR_ADD_EXTEN','Erro - Adicionando Ramal'),('ERROR_ADD_FOLLOWS','Erro - Adicionando Encaminhamento'),('ERROR_ADD_IVR','Erro - Adicionando URA'),('ERROR_ADD_IVROPTION','Erro - Adicionando op&ccedil;&atilde;o de URA'),('ERROR_ADD_MEDIASERVER','Erro - Adicionando Servidor de M&iacute;dia'),('ERROR_ADD_QUEUE','Erro - Adicionando Fila de atendimento'),('ERROR_ADD_SERVER','Erro - Adicionando Servidor'),('ERROR_ADD_TIME','Erro - Adicionando Tempo'),('ERROR_ADD_TIMEOPTION','Erro - Adicionando Op&ccedil;&atilde;o de Tempo'),('ERROR_ADD_TRUNK','Erro - AdicionandoTronco'),('ERROR_DELETE_EXTEN','Erro - Apagando ramal'),('ERROR_DELETE_TIMEOPTION','Erro - Apagando Op&ccedil;&atilde;o de Tempo'),('error_empty','Dados sem preencher'),('error_exten_quantity_max','Voce excedeu a quantidade m&aacute;xima de Ramais'),('error_ilegal_digits_exten','O n&uacute;mero de d&iacute;gitos do ramal n&atilde;o &eacute; correcto'),('error_ilegal_format_exten','A quantidade max. de ramais n&atilde;o &eacute; correta'),('ERROR_LOGIN','Erro - Login'),('error_max_que','Quantidade Max. de Filas Alcan&ccedil;ada.'),('error_outboundvm_not_allowed','O tempo est&aacute; errado ou n&atilde;o pode ser editado porque mudou de status'),('error_outboundvm_schedule','O tempo est&aacute; errado'),('error_path_record','Voc&ecirc; selecionou ativar grava&ccedil;&otilde;es, n&atilde;o pode deixar a rota de grava&ccedil;&otilde;es vazia'),('error_trunk_exist','J&aacute; existe um tronco com esse n&uacute;mero'),('ERROR_UPDATE_FOLLOWS','Erro - Atualizando Siga-Me'),('ERROR_UPDATE_QUEUE','Erro - Atualizando Fila'),('error_user','Usu&aacute;rio ou senha incorretos'),('especial','Especial'),('EXTEN::insert_EXTENS','Por favor inserir o ramal'),('EXTEN::setCallgroup','Por favor inserir o n&uacute;mero do Grupo de Pickup'),('EXTEN::setNumber','Por favor inserir o n&uacute;mero'),('EXTEN::setPass','Por favor inserir a senha'),('extens','Ramais'),('exten_Action','A&ccedil;&atilde;o'),('exten_action1','Features'),('exten_action2','A&ccedil;&atilde;o direta 2'),('exten_action3','A&ccedil;&atilde;o direta 3'),('exten_asign','Asign'),('exten_callgroup','Grupo'),('exten_CorpID','Corpora&ccedil;&atilde;o'),('exten_create_user','Criar usu&aacute;rio web'),('exten_description','Descri&ccedil;&atilde;o'),('exten_Enabled','Habilitado'),('exten_form_register_note','O n&uacute;mero de Ramal n&atilde;o pode ser inferior a 200. Registrar usando'),('exten_form_register_note2','O n&uacute;mero de Ramal n&atilde;o pode ser inferior a 1000. Registrar usando'),('exten_form_title_add','Adicionar Ramal'),('exten_form_title_update','Atualizar Ramal'),('exten_HasVoiceMail','Tem Correio de Voz'),('exten_list_title','Lista de Ramais'),('exten_Number','N&uacute;mero'),('exten_onbusy_action','Ocupado'),('exten_Outer','Externo'),('exten_Pass','Senha'),('exten_registered_ip','IP'),('exten_registered_port','Porta'),('exten_selected_panel','Ramal seleccionado'),('exten_selected_panel2','Escolha a Fila onde deseja inserir o Ramal no lado direito da tela, fazendo clique em'),('exten_trunk','Tronco'),('exten_TrunkID','Tronco'),('exten_user','Usu&aacute;rio'),('exten_useragent','User Agent'),('exten_UserID','Usu&aacute;rio'),('exten_VMPass','Senha do Correio de Voz'),('file_no_exist','O arquivo n&atilde;o existe'),('followme','Siga-Me'),('FOLLOWME::setExtID','Erro - Inserir o Ramal'),('FOLLOWME::setNumber','Erro - Inserir o N&uacute;mero'),('FOLLOWME::setOrder','Erro - Inserir a ordem'),('FOLLOWME::setTimeout','Erro - Inserir o timeout'),('FOLLOWME::setType','Erro - Inserir o tipo'),('FOLLOWME::update_FOLLOWS','Erro atualizando o Siga-Me'),('followme_exten_new_title','Novo Siga-Me - Ramal'),('followme_exten_title','Siga-Me  - Ramal'),('followme_ExtID','Ramal'),('followme_form_title_add','Adicionar'),('followme_form_title_update','Atualizar'),('followme_ID','ID'),('followme_list_title','Lista de Siga-Me'),('followme_Name','Nome'),('followme_Number','N&uacute;mero'),('followme_Order','Ordem'),('followme_Timeout','Timeout'),('followme_Type','Tipo'),('followme_typeCall','Tipo de chamada'),('followme_type_call','Tipo de chamada'),('forget_password','Recuperar a senha'),('forms_bar','Cadastros'),('form_add','Adicionar'),('form_cancel','Cancelar'),('form_Dial','Discar'),('form_disabled','Desabilitado'),('form_dual_ring','Toque Simult&acirc;neo'),('form_enabled','Habilitado'),('form_enqueue','Enfileirar'),('form_extern','Externo'),('form_external_ring','Toque Externo'),('form_file_upload','Carregar arquivo'),('form_followme','Siga-Me'),('form_followme_extern','Siga-Me - Externo'),('form_followme_intern','Siga-Me - Interno'),('form_fri','sex'),('form_import_from_VSC','Importar desde VSC'),('form_intern','Interno'),('form_login','Login'),('form_logout','Logout'),('form_mon','seg'),('form_no','N&atilde;o'),('form_Pickup','Pickup'),('form_rest_sala','Sala de Confer&ecirc;ncia'),('form_ring','Toque'),('form_send','Enviar'),('form_sun','dom'),('form_thu','qui'),('form_tue','ter'),('form_update','Atualizar'),('form_voicemail','Correio de Voz'),('form_VoiceMailMain','Correio de Voz'),('form_wed','qua'),('form_yes','Sim'),('funcionalidades','Funcionalidades'),('groups','Grupos'),('hangup','Desligar'),('incoming','Entrada'),('incorrect_sound','Opc. Inv.'),('input_pattern','Cadastre o Padr&atilde;o'),('integration_form_title_options','Integra&ccedil;&atilde;o - A&ccedil;&otilde;es'),('integration_form_title_options','Integra&ccedil;&atilde;o - A&ccedil;&otilde;es'),('integration_list_title','Lista de integracoes'),('integration_option1','Op. N&atilde;o cliente'),('integration_option2','Op. Cliente sem pend&ecirc;ncia'),('integration_option3','Op. Cliente com pend&ecirc;ncia'),('internacional','LDI'),('internal','Interno'),('ivr','URA'),('IVR::setName','Erro - Insira o Nome'),('IVR::setSound','Erro - Insira o Som'),('IVROPTION::setIvrID','Erro - Insira a URA'),('ivroption_Action','A&ccedil;&atilde;o'),('ivroption_form_title_add','Adicionar'),('ivroption_form_title_update','Atualizar'),('ivroption_IvrID','URA'),('ivroption_list_title','Lista de op&ccedil;&otilde;es'),('ivroption_Name','Nome'),('ivroption_Order','Ordem'),('ivrs','URAs'),('ivr_form_title_add','Adicionar'),('ivr_form_title_options','URA - Op&ccedil;&otilde;es'),('ivr_form_title_update','Atualizar'),('ivr_list_title','Lista de URAs'),('ivr_Name','Nome'),('ivr_opcion','Op&ccedil;&atilde;o'),('ivr_option0','Op. 0'),('ivr_option1','Op. 1'),('ivr_option2','Op. 2'),('ivr_option3','Op. 3'),('ivr_option4','Op. 4'),('ivr_option5','Op. 5'),('ivr_option6','Op. 6'),('ivr_option7','Op. 7'),('ivr_option8','Op. 8'),('ivr_option9','Op. 9'),('ivr_pattern','Padr&atilde;o'),('ivr_Sound','Som'),('ivr_sound_format_note','Arquivos (.wav) devem ficar no formato PCM, 8Khz, 16 bits e tamanho m&aacute;ximo de 2Mb'),('label_from_dashboard','Desde'),('label_queues_dashboard','Filas'),('label_to_dashboard','At&eacute;'),('label_view_password','Clicar na &aacute;rea de texto para ver a senha'),('list_add','Adicionar'),('list_ant','Anterior'),('list_delete','Apagar'),('list_download','Descarregar'),('list_extern','Externo'),('list_intern','Interno'),('list_no','N&atilde;o'),('list_pin','Pin'),('list_play_sound','Tocar'),('list_sig','Seguinte'),('list_sublist','Sublista'),('list_update','Atualizar'),('list_yes','Sim'),('list_zero_rows','Nenhuma Fila'),('local_fijo','Local'),('local_movil','Celular Local'),('login_form_title','Login'),('login_pass','Senha&#160;&#160;'),('login_user','Usu&aacute;rio'),('logmon_bar','LogMonitor'),('logmon_filter_agi','AGI'),('logmon_filter_btn_restart','Restabelecer'),('logmon_filter_centrex','CENTREX'),('logmon_filter_centrex_sql','CENTREX SQL'),('logmon_filter_error','ERROR'),('logmon_filter_msje1','Somente falta um minuto para restabelecer o Logmon'),('logmon_filter_msje2','Aten&ccedil;ao'),('logmon_filter_msje3','O Logmon requer restabelecer o processo ap&oacute;s de 10 minutos'),('logmon_filter_notice','NOTICE'),('logmon_filter_verbose','VERBOSE'),('logmon_filter_warning','WARNING'),('logo','Imagem da barra das sec&ccedil;&otilde;es: '),('logo_fondo','Imagem de fundo: '),('max_duration','Tempo m&aacute;ximo de Liga&ccedil;&atilde;o'),('mediaserver_enabled','Habilitado'),('mediaserver_form_title_add','Adicionar Servidor de M&iacute;dia'),('mediaserver_form_title_update','Atualizar Servidor de M&iacute;dia'),('mediaserver_list_title','Servidor de M&iacute;dia'),('mediaserver_number','N&uacute;mero'),('mediaserver_sound','Som'),('mediaserver_sound_format_note','Arquivos (.wav) devem ficar no formato PCM, 8Khz, 16 bits'),('MEDIA_SERVER::insert_MEDIASERVERS','Erro inserindo Servidor de M&iacute;dia'),('menu_cdr_list','Lista de CDRs'),('menu_corp_list','Corpora&ccedil;&otilde;es'),('menu_destinations_groups_list','Grupos de Destinos'),('menu_destination_list','Destinos'),('menu_discador','Discador'),('menu_exten_list','Ramais'),('menu_integration','Integra&ccedil;&otilde;es'),('menu_ivr_list','URA'),('menu_logout','Sair'),('menu_mediaserver_list','Servidor de M&iacute;dia'),('menu_moh','Moh de Corpora&ccedil;&atilde;o'),('menu_outboundvm_list','Correio de voz'),('menu_page_style','Look & Feel'),('menu_panel','Painel do Operador'),('menu_queue_list','Filas'),('menu_restrictions_list','Restri&ccedil;oes'),('menu_restriction_list','Restri&ccedil;&otilde;es'),('menu_route_list','Rotas'),('menu_server_list','Servidores'),('menu_speeddial_list','Discagem R&aacute;pida'),('menu_time_list','Tempo'),('menu_title','Menu'),('menu_trunk_list','Troncos'),('menu_users_list','Usu&aacute;rios'),('menu_user_list','Usu&aacute;rios'),('min_duration','Tempo m&aacute;ximo de Espera'),('moda_poll','Moda'),('msge-info-route','Em caso de rota vazia ou incorreta ser&aacute; utilizada a imagem padr&atilde;o do n&iacute;vel Supervisor.'),('msge-no-style-changed','Sem altera&ccedil&otilde;es.'),('msge-ok-set-style','Par&acirc;metros atualizados, favor iniciar sess&atilde;o novamente.'),('msge_error','ERRO'),('msge_error2','H&aacute; um problema de cone&ccedil;ao, verifique e tente novamente'),('msge_error4','Voc&etilde; escolheu como a&ccedil;&atilde;o toque simult&aacute;neo e deve indicar um externo'),('msge_error5','O n&uacte,mero que introduziu j&aacute; existe. Pode existir ramais com o mesmo n&uacte,mero'),('msge_error6','Houve um erro no cadastro do arquivo de &aacute;udio'),('msge_error7','O Ramal tem atribu&iacute;do j&aacute; n&atilde;o existe.'),('msge_error_exten_bad_description','A descri&ccedil;&atilde;o pode conter apenas letras, espa&ccedil;os, numeros, ), (, -, _, e . (ponto)'),('msge_error_corp','J&aacute; existe uma Corpora&ccedil;&atilde;o com esse nome'),('msge_error_destination\r\n','J&aacute; existe esse prefixo'),('msge_error_destination','J&aacute; existe um Destino com esse prefixo'),('msge_error_destination_group','J&aacute; existe um Grupo de Destino com esse nome'),('msge_error_destination_group','J&aacute; existe um Grupo de Destino com esse nome'),('msge_error_dgroup_exist','Um Grupo de Destino j&aacute; existe com esse nome'),('msge_error_dial','J&aacute; existe uma Discagem R&aacute;pida com esse n&uacute;mero'),('msge_error_dial_exten','Discagem R&aacute;pida j&aacute; existe com esse n&uacute;mero'),('msge_error_edit_dial_exten','Discagem R&aacute;pida - j&aacute; existe um Ramal com esse n&uacute;mero'),('msge_error_exten','J&aacute; existe um Ramal com esse n&uacute;mero'),('msge_error_follow','Um Siga-Me j&aacute; existe com esses dados'),('msge_error_integration','J&aacute; existe uma integra&ccedil;&atilde;o com esse nome'),('msge_error_ivr','J&aacute; existe uma URA com esse nome'),('msge_error_ivr7','O arquivo ainda n&atilde;o se terminou de subir'),('msge_error_media_server','J&aacute; existe um Servidor de M&iacute;dia com esse endere&ccedil;o IP'),('msge_error_outer_empty','Se seleciono toque externo, voce n&atilde;o pode deixar vazio o campo \'externo\''),('msge_error_poll','J&aacute; existe uma Pesquisa com esse nome'),('msge_error_question','J&#227, existe uma Pergunta com esse nome'),('msge_error_question2','J&#227, existe uma pergunta com esse ordem'),('msge_error_queue','J&aacute; existe uma Fila'),('msge_error_queue_announce','El archivo se est&aacute; cargando'),('msge_error_queue_inuse','Por favor, resolva os seguintes conflitos para apagar a fila.'),('msge_error_queue_inuse_sd','A fila est&aacute; em uso por um ou mais n&uacute;meros de discagem r&aacute;pida.'),('msge_error_queue_inuse_temp','A fila est&aacute; em uso por um ou mais tempos.'),('msge_error_queue_inuse_que','A fila est&aacute; em uso por uma ou mais filas.'),('msge_error_queue_inuse_tru','A fila est&aacute; em uso por um ou mais troncos.'),('msge_error_queue_inuse_ivr','A fila est&aacute; em uso por uma ou mais URAs.'),('msge_error_queue_inuse_disc','A fila est&aacute; em uso por uma ou mais Discadores.'),('msge_error_restriction','J&aacute; existe essa Restri&ccedil;&aacute;o'),('msge_error_server','J&aacute; existe um Servidor com esse nome'),('msge_error_server_IP_PORT','J&aacute; existe um servidor com essa IP e porta'),('msge_error_speeddial','J&aacute; existe essa Discagem R&aacute;pida'),('msge_error_speeddial_2','O n&uacute;mero deve ter mais de um d&iacute;gito'),('msge_error_time','J&aacute; existe um Tempo com esse nome'),('msge_error_trunk2','J&aacute; existe um Tronco com esse n&uacute;mero no Servidor'),('msge_error_trunk4','N&atilde;o foi possivel parar os discadores correspondentes a este tronco'),('msge_error_user','J&aacute; existe esse Usu&aacute;rio'),('msge_error_user2','A Corpora&ccedil;&atilde;o j&aacute; n&atilde;o existe.'),('msge_ok','OK'),('msge_warning','AVISO'),('msge_okedit_corp','A Corpora&ccedil;&atilde;o foi editada com sucesso'),('msge_ok_corp','A Corpora&ccedil;&atilde;o foi criada com sucesso'),('msge_ok_destination','O Destino foi criado com sucesso.'),('msge_ok_destination_group','O Grupo de Destino foi criado com sucesso'),('msge_ok_dial','A Discagem R&aacute;pida  foi criado com sucesso'),('msge_ok_dial_exten','A Discagem R&aacute;pida foi criada com sucesso'),('msge_ok_edit_dial_exten','A Discagem R&aacute;pida - Ramal foi editada com sucesso'),('msge_ok_exten','O Ramal foi criado com sucesso'),('msge_ok_follow','O Siga-Me - Ramal  foi criado com sucesso'),('msge_ok_integration','A integra&ccedil;&atilde;o foi criada com sucesso'),('msge_ok_ivr','A URA foi criada com sucesso'),('msge_ok_media_server','O Servidor de M&iacute;dia foi criado com sucesso'),('msge_ok_outboundvm','A voicemail foi criado com sucesso'),('msge_ok_queue','A Fila  foi criada com sucesso'),('msge_ok_restriction','A Restri&ccedil;&aacute;o foi criada com sucesso'),('msge_ok_server','O Servidor foi criado com sucesso'),('msge_ok_time','O Tempo  foi criado com sucesso'),('msge_ok_trunk','O Tronco foi criado com sucesso'),('msge_ok_user','O Usu&aacute;rio foi criado com sucesso'),('msg_info_strategy','O timeout de estrat&eacute;gia n&atilde;o aplica para a a&ccedil;&atilde;o tocar todos'),('msg_ok_poll','A Pesquisa foi criada com sucesso'),('msj_confirm_delete','Confirmar apagamento'),('nacional_fijo','LDN'),('nacional_movil','Celular LDN'),('new_corp','Nova Corpora&ccedil;&atilde;o'),('new_destination','Novo Destino'),('new_destination_group','Novo Grupo  de Destino'),('new_dial','Nova Discagem R&aacute;pida'),('new_exten','Novo Ramal'),('new_integration','Nova integra&ccedil;&atilde;o'),('new_ivr','Nova URA'),('new_media_server','Novo Servidor de M&iacute;dia'),('new_outboundvm','Novo Voicemail'),('new_poll','Nova Pesquisa'),('new_question','Nova Pergunta'),('new_queue','Nova Fila'),('new_restriction','Nova Regra'),('new_server','Novo Servidor'),('new_time','Novo Tempo'),('new_trunk','Novo Tronco'),('new_user','Novo Usu&aacute;rio'),('NOANSWER','Sem resposta'),('note2_panel','Para adicionar um Ramal em uma Fila, deve fazer clique no Ramal'),('note3_panel','Fora das Filas'),('note4_panel','Ocupado'),('note5_panel','Indispon&iacute;vel'),('note6_panel','Dispon&iacute;vel'),('not_data_monitor_dashboard','Nao existe ramais com qualify habilitado'),('not_data_statics_dashboard','Nao existem dados para a consulta'),('not_selected','Desativado'),('no_data','Sem dados dispon&iacute;veis na tabela'),('OK_ADD_DESTINATION','Destino adicionado com sucesso'),('OK_ADD_EXTEN','Ramal adicionado com sucesso'),('OK_ADD_FOLLOWS','Siga-me adicionado com sucesso'),('OK_ADD_IVR','URA adicionada com sucesso'),('OK_ADD_IVROPTION','Op&ccedil;&aacute;oo da URA adicionada com sucesso'),('OK_ADD_MEDIASERVER','Servidor de M&iacute;dia adicionado com sucesso'),('OK_ADD_QUEUE','Fila adicionada com sucesso'),('OK_ADD_SERVER','Servidor adicionado com sucesso'),('OK_ADD_TIME','Tempo adicionado com sucesso'),('OK_ADD_TIMEOPTION','Op&ccedil;&aacute;o de Tempo adicionada com sucesso'),('OK_ADD_TRUNK','Tronco adicionado com sucesso'),('OK_DELETE_EXTEN','Ramal apagado com sucesso'),('OK_DELETE_FOLLOWS','Siga-me apagado com sucesso'),('OK_DELETE_QUEUE','Fila apagada com sucesso'),('OK_DELETE_TIME','Tempo apagado com sucesso'),('OK_DELETE_TIMEOPTION','Op&ccedil;&atilde;o de Tempo apagada com sucesso'),('OK_LOGIN','Login - Correto'),('OK_UPDATE_DESTINATION','Destino apagado com sucesso'),('OK_UPDATE_EXTEN','Ramal atualizado com sucesso'),('OK_UPDATE_FOLLOWS','Siga-me atualizado com sucesso'),('OK_UPDATE_IVR','URA atualizada com sucesso'),('OK_UPDATE_MEDIASERVER','Servidor de M&iacute;dia atualizado com sucesso'),('OK_UPDATE_QUEUE','Fila atualizada com sucesso'),('OK_UPDATE_ROUTE','Rota atualizada com sucesso'),('OK_UPDATE_SERVER','Servidor atualizado com sucesso'),('OK_UPDATE_TIME','Tempo atualizado com sucesso'),('OK_UPDATE_TIMEOPTION','Op&ccedil;&aacute;o de Tempo atualizada com sucesso'),('OK_UPDATE_TRUNK','Tronco atualizado com sucesso'),('only_numbers','Somente n&uacute;meros'),('only_numbers_2dig','Somente n&uacute;meros de 1 - 2 d&iacute;gitos'),('only_numbers_4dig','Somente n&uacute;meros de 1 - 4 d&iacute;gitos'),('only_numbers_5dig','Somente n&uacute;meros de 1 - 5 d&iacute;gitos'),('order','Ordem'),('outboundvm_status','Estado'),('outboundvm_status_listened','Ouviu'),('outboundvm_status_pending','Pendente'),('outboundvm_status_urgent','Urgente'),('outboundvm_type_received','Recibido'),('outboundvm_type_sent','Enviado'),('panel_atention','Aten&ccedil;&atilde;o'),('panel_bar','Painel'),('panel_ligacoes_em_espera','Liga&ccedil&otildees em espera'),('panel_note1','Para adicionar um Ramal em uma Fila, deve fazer clique no ramal '),('panel_note2','Primeiro voc&etilde; deve selecionar um Ramal para inseri-lo em uma Fila'),('panel_note3','O Ramal j&atilde; existe na linha ou n&atilde;o existem mais ramais'),('panel_status1','Omiss&atilde;o'),('panel_status2','Dispon&iacute;vel'),('panel_status3','Ao chamar'),('panel_status4','Indispon&iacute;vel'),('permission_feaID','ID da funcionalidade'),('permission_list_title','Lista'),('permission_name','Nome'),('pickup','Capturar chamada'),('play','Reproduzir'),('poll','Pesquisa'),('polls','Pesquisas'),('poll_list_title','Lista de Pesquisas'),('question','Pergunta'),('question_list_title','Lista de Quest&atilde;os'),('queue','Fila'),('QUEUE::setID','Erro - Cadastre o ID'),('QUEUE::setName','Erro - Insira o nome'),('queuestats_atendidas','Atendidas'),('queuestats_desatendidas','N&atilde;o Atendidas'),('queuestats_estats','Dados da Fila: '),('queuestats_horadesde','Hora desde'),('queuestats_horahasta','Hora at&eacute;'),('queuestats_transferencias','Transfer&ecirc;ncias'),('queue_action_failover','A&ccedil;&atilde;o de Failover'),('queue_announce','Cochicho Agente'),('queue_CorpID','Corpora&ccedil;&atilde;o'),('queue_empty_panel','N&atilde;o existem Filas criadas'),('queue_enqueue','Enfileirar'),('queue_fewestcalls','Menos Liga&ccedil;&otilde;es'),('queue_form_alert_update','Ao mudar para serie, o Centrex vai ser reiniciado quando n&atilde;o tiver trafego. Deseja continuar?'),('queue_form_info_update','N&atilde;o &eacute; poss&iacute;vel seleccionar o tipo de estrat&eacute;gia serial, a fila precisa ser recriada.'),('queue_form_title_add','Adicionar Fila'),('queue_form_title_update','Atualizar Fila'),('queue_leastrecent','&Uacute;ltimo Atendente'),('queue_linear','S&eacute;rie'),('queue_list_title','Lista de Filas'),('queue_login','Login Fila'),('queue_logout','Logout Fila '),('queue_Name','Nome'),('queue_random','Aleat&oacute;rio'),('queue_ringall','Tocar Todos'),('queue_rrmemory','Pseudo Aleatorio'),('queue_strategy','Estrat&eacute;gia'),('queue_timeout','Timeout de estrat&eacute;gia'),('queue_timeout_failover','Tempo m&aacute;ximo de espera'),('queue_wrandom','Aleat&oacute;rio Inteligente'),('received','Recebidos'),('registered_destinations','Destinos cadastrados'),('remove','Eliminar'),('restriction','Restri&ccedil;&atilde;o'),('restrictions','Restri&ccedil;&otilde;es'),('restriction_corp','Corpora&ccedil;&atilde;o'),('restriction_CorpID','Corpora&ccedil;&atilde;o'),('restriction_DesID','Destino'),('restriction_entityID','Entidade'),('restriction_exten','Restri&ccedil;&atilde;o - Ramal'),('restriction_note','Pode inserir um Padr&atilde;o, op&ccedil;&otilde;es padr&otilde;es como Correio de Voz ou Sala de Confer&ecirc;ncia, ou escolher um Grupo de Destinos. Selecione tamb&eacute;m a habilita&ccedil;&atilde;o ou rejei&ccedil;&atilde;o do destino, e se desejado, marque a op&ccedil;&atilde;o PIN para permitir a liga&ccedil;&atilde;o apenas quando for discado o PIN correspondente.'),('restriction_pattern','Destino'),('restriction_Permit','Permitir'),('restriction_Pin','Pin'),('route_Cost','Custo da Rota'),('route_form_title_add','Adicionar Rota'),('route_form_title_update','Atualizar Rota'),('route_list_title','Rotas'),('route_Name','Nome'),('route_Pattern','Prefixo'),('route_SerID','Servidor'),('search','Procurar'),('search_class','Classe'),('search_object','Objeto'),('sent','Enviados'),('server','Servidor'),('SERVER::setIP','Por favor, insira o endere&ccedil;o IP'),('SERVER::setName','Por favor, insira o nome'),('SERVER::setPort','Por favor, insira a porta'),('servers','Servidores'),('server_form_title_add','Adicionar Servidor'),('server_form_title_update','Atualizar Servidor'),('server_IP','Endere&ccedil;o IP ou Dom&iacute;nio'),('server_list_title','Lista de Servidores'),('server_Name','Nome'),('server_Port','Porta'),('sound1_integration','Solicitar ID do cliente'),('sound2_integration','Aviso de exist&ecirc;ncia de inconvenientes'),('sound_form_note','A altera&ccedil;&atilde;o do arquivo de &aacute;udio s&oacute; ser&aacute; efetiva ao enviar o formul&aacute;rio.'),('speeddial','Discagem R&aacute;pida'),('SPEEDDIAL::insert_SPEEDDIAL','Erro - Inserir Discagem R&aacute;pida'),('SPEEDDIAL::setData','Erro - Cadastre a Data'),('SPEEDDIAL::setEntityID','Erro - Cadastre o ID da entidade'),('SPEEDDIAL::setNumber','Erro - Cadastre o n&uacute;mero'),('SPEEDDIAL::setType','Erro - Cadastre o tipo'),('speeddial_action','A&ccedil;&atilde;o'),('speeddial_Action','A&ccedil;&atilde;o'),('speeddial_Data','Menu'),('speeddial_Entity','Entidade'),('speeddial_form_title_add','Adicionar Discagem R&aacute;pida'),('speeddial_form_title_update','Atualizar Discagem R&aacute;pida'),('speeddial_list_title','Lista de Discagem R&aacute;pida'),('speeddial_number','N&uacute;mero'),('speeddial_Position','Posi&ccedil;&atilde;o'),('speedial_number','N&uacute;mero de Discagem R&aacute;pida '),('statics_bar','Estat&iacute;sticas'),('tempo_new_action','Clique aqui para ir criando a&ccedil;&otilde;es'),('text_instructive_ivr','Deve habilitar cada op&ccedil;&atilde;o que deseje atribuir um valor'),('thead_status_monitor_dashboard','Estado'),('time','Tempo'),('TIME::insert_TIMEMAIN','Erro - Cadastre o Tempo'),('TIME::setCorpID','Por favor, inserir a Corpora&ccedil;&atilde;o'),('TIME::setID','Erro - Cadastre o ID'),('TIME::setName','Por favor, inserir o nome'),('TIMEOPTION::setTimeID','Por favor, inserir o Tempo'),('timeoption_date_format','(HH:MM)'),('timeoption_Days','Dias'),('timeoption_From','Desde'),('timeoption_list_title','Op&ccedil;&otilde;es de Tempo'),('timeoption_To','At&eacute;'),('time_Action','A&ccedil;&atilde;o'),('time_CorpID','Corpora&ccedil;&atilde;o'),('time_Days','Dias'),('time_form_title_add','Adicionar Tempo'),('time_form_title_options','Tempo - Op&ccedil;&otilde;es'),('time_form_title_update','Atualizar Tempo'),('time_From','Desde'),('time_ID','ID'),('time_list_title','Lista de Tempos'),('time_Name','Nome'),('time_note','Toda liga&ccedil;&atilde;o fora dos intervalos cadastrados rodar&aacute; o procedimento padr&atilde;o'),('time_note10','Tempo apagado com sucesso'),('time_note2','Selecione os dias, clicando neles'),('time_note3','Voc&ecirc; deve indicar a hora desde e a hora at&eacute; para selecionar uma a&ccedil;&atilde;o e indicar os dias da semana'),('time_note4','O horario escolhido se sobrep&otilde;e a um existente'),('time_note5','Hora at&eacute; sempre deve ser maior do que a hora desde'),('time_note6','Uma vez criado o Tempo com as op&ccedil;&otilde;es clique em enviar'),('time_note7','N&atilde;o h&aacute; ac&ccedil;&otilde;es criadas para o Tempo'),('time_note8',' Confirmar exclus&atilde;o do a&ccedil;&atilde;o'),('time_note9','Uma vez mudado o nome do Tempo ou a op&ccedil;&atilde;o padr&atilde;o pode fazer clique em enviar'),('time_pattern','Padr&atilde;o'),('time_To','At&eacute;'),('titile_command3','Ocultar a consola'),('titile_filter','Filtro'),('title-sequencial','Sequencial'),('title-smart','Inteligente'),('title1_dashboard','Est&iacute;sticas das Filas'),('title2_dashboard','Monitor Qualify'),('title_command','Comando'),('title_command2','Pressione Enter para rodar o comando'),('title_command3','Ocultar'),('title_command4','Pressione Enter para aplicar o  filtro'),('title_command5','Apagar filtro'),('title_destinations_group','Clique para selecionar destinos'),('title_dg','-- GRUPOS DE DESTINOS --'),('title_filter','Filtro'),('title_monitor_dashboard','Monitor de ramais (Qualify)'),('title_monitor_waiting_dashboard','Por favor, aguarde 15 segundos'),('title_shorcut1','Op&ccedil;&otilde;es'),('title_shorcut2','Menu'),('title_site','VSC Centrex v4.0'),('title_statics_dashboard','Estat&iacute;sticas das Filas'),('toggle_console','Ver consola'),('total','Total'),('total_calls','N&uacute;mero total de Chamadas'),('total_duration','Tempo Total de Liga&ccedil;&otilde;es'),('total_duration_avg','Tempo m&eacute;dio de Liga&ccedil;&atilde;o'),('total_wait','Tempo Total em Espera'),('total_wait_avg','Tempo m&eacute;dio de Espera'),('trunk','DID'),('TRUNK::setCorpID','Por favor, inserir a Corpora&ccedil;&atilde;o'),('TRUNK::setNumber','Por favor, inserir o N&uacute;mero'),('TRUNK::setPass','Por favor, inserir a Senha'),('TRUNK::setSerID','Por favor, inserir o Servidor'),('trunk_Action','A&ccedil;&atilde;o'),('trunk_CorpID','Corpora&ccedil;&atilde;o'),('trunk_Enabled','Habilitado'),('trunk_Follow','Siga-Me'),('trunk_form_title_add','Adicionar Tronco'),('trunk_form_title_update','Atualizar Tronco'),('trunk_list_title','Lista de Troncos'),('trunk_Number','N&uacute;mero'),('trunk_Outgoing','Sa&iacute;da habilitada'),('trunk_Pass','Senha'),('trunk_Preference','Prefer&ecirc;ncia'),('trunk_SerID','Servidor'),('trunk_Timeout','Timeout'),('type_call_Internacional','Internacional'),('type_call_LF','Local Fixo'),('type_call_LM','Local Movel'),('type_call_MeetMe','Confer&ecirc;ncia'),('type_call_NF','Nacional Fixo'),('type_call_NM','Nacional Movel'),('type_call_outbound','Enviar correio de voz'),('type_call_reminder','Enviar Recordat&oacute;rio'),('type_call_special','Especial'),('type_call_VoiceMail','Correio de voz'),('unknown','Desconocido'),('upload_error_uploading','Erro atualizando os dados'),('upload_ok','Carga correta'),('upload_send','Enviar'),('upload_title','Atualizar'),('user2','Usu&aacute;rios'),('USER::setPass','Por favor, inserir a Senha'),('USER::update_ID','Erro - Atualizar ID'),('user_CorpID','Corpora&ccedil;&atilde;o'),('user_Enabled','Habilitado'),('USER_INCORRECT_DATA','Dados incorretos'),('user_Level','N&iacute;vel'),('user_level_administrador','Administrador'),('user_level_supervisor','Supervisor'),('user_level_usuario','Usu&aacute;rio'),('user_list_title','Lista de Usu&aacute;rios'),('user_mail','E-mail'),('user_Nick','Usu&aacute;rio web'),('user_Pass','Senha'),('user_web','Usu&aacute;rio web'),('validator_field_required','Campo obrigat&oacute;rio'),('validator_pattern_not_match','Formato incorreto'),('vendor_a','a'),('vendor_anterior','Anterior'),('vendor_copy','Copiado na Memoria'),('vendor_copy1','Foi copiada una linea na memoria'),('vendor_copyn','Forom copiadas'),('vendor_copyn1','lineas na memoria'),('vendor_de','registros de'),('vendor_filas',''),('vendor_olhando',''),('vendor_olhando_ate','a'),('vendor_procurar','Procurar:'),('vendor_proximo','Pr&oacute;ximo'),('vendor_sd','Sem dados dispon&iacute;veis na tabela'),('vsc_did_number','DID'),('vsc_distributor','Distribuidor'),('vsc_user_nick','Nome'),('vsc_wsadmin_ip','IP do WS ADMIN'),('exten_limit','Limite de chamadas simultaneas'),('label_limit','0 = ilimitado'),('exten_porttype','Tipo de porta'),('queue_position','Posi&ccedil;&atilde;o da fila'),('refresh_note','A tabela n&atilde;o ser&aacute; atualizada at&eacute; que vo&ccedil;&eacute; atualize a p&aacute;gina'),('queue_announce_seconds','Segundos de announce frequency'),('label_seconds_queue','No m&aacute;ximo 10 segundos'),('queue_ringinuse','Ring in use');
/*!40000 ALTER TABLE `langspt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookAndFeel`
--

DROP TABLE IF EXISTS `lookAndFeel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookAndFeel` (
  `corpID` int(11) NOT NULL,
  `id` varchar(550) NOT NULL,
  `value` varchar(550) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookAndFeel`
--

LOCK TABLES `lookAndFeel` WRITE;
/*!40000 ALTER TABLE `lookAndFeel` DISABLE KEYS */;
INSERT INTO `lookAndFeel` VALUES (0,'BG_ACTIVE','#efefef'),(0,'FONT_DEFAULT','#efefef'),(0,'BG_DEFAULT','#BE1622'),(0,'FONT_ACTIVE','#BE1622'),(0,'BLUE_CSS','#BE1622'),(0,'NAV_BAR','#BE1622'),(0,'FOOTER_BAR','#BE1622'),(0,'LOGO','../images/logo.png'),(0,'LOGO_FONDO','../images/LogoFondo81_sup.png'),(-1,'NAV_BAR','#BE1622'),(-1,'FOOTER_BAR','#BE1622'),(-1,'LOGO','./images/logo.png'),(-1,'LOGO_FONDO','./images/LogoFondo81_login.png'),(1,'BG_ACTIVE','#efefef'),(1,'FONT_DEFAULT','#efefef'),(1,'BG_DEFAULT','#BE1622'),(1,'FONT_ACTIVE','#BE1622'),(1,'BLUE_CSS','#BE1622'),(1,'NAV_BAR','#BE1622'),(1,'FOOTER_BAR','#BE1622'),(1,'LOGO','../images/logo.png'),(1,'LOGO_FONDO','../images/LogoFondo81_sup.png'),(10,'BG_ACTIVE','#efefef'),(10,'FONT_DEFAULT','#efefef'),(10,'BG_DEFAULT','#BE1622'),(10,'FONT_ACTIVE','#BE1622'),(10,'BLUE_CSS','#BE1622'),(10,'NAV_BAR','#BE1622'),(10,'FOOTER_BAR','#BE1622'),(10,'LOGO','../images/logo.png'),(10,'LOGO_FONDO','../images/LogoFondo81_sup.png');
/*!40000 ALTER TABLE `lookAndFeel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediaservers`
--

DROP TABLE IF EXISTS `mediaservers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mediaservers` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(64) NOT NULL,
  `enabled` int(1) unsigned NOT NULL DEFAULT '0',
  `sound` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediaservers`
--

LOCK TABLES `mediaservers` WRITE;
/*!40000 ALTER TABLE `mediaservers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mediaservers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetme`
--

DROP TABLE IF EXISTS `meetme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetme` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `confno` varchar(80) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `pin` varchar(20) DEFAULT NULL,
  `adminpin` varchar(20) DEFAULT NULL,
  `opts` varchar(20) DEFAULT NULL,
  `adminopts` varchar(20) DEFAULT NULL,
  `recordingfilename` varchar(80) DEFAULT NULL,
  `recordingformat` varchar(10) DEFAULT NULL,
  `maxusers` int(11) DEFAULT NULL,
  `members` int(11) NOT NULL,
  PRIMARY KEY (`bookid`),
  KEY `meetme_confno_start_end` (`confno`,`starttime`,`endtime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetme`
--

LOCK TABLES `meetme` WRITE;
/*!40000 ALTER TABLE `meetme` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musiconhold`
--

DROP TABLE IF EXISTS `musiconhold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `musiconhold` (
  `name` varchar(80) NOT NULL,
  `mode` enum('custom','files','mp3nb','quietmp3nb','quietmp3','playlist') DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL,
  `application` varchar(255) DEFAULT NULL,
  `digit` varchar(1) DEFAULT NULL,
  `sort` varchar(10) DEFAULT NULL,
  `format` varchar(10) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musiconhold`
--

LOCK TABLES `musiconhold` WRITE;
/*!40000 ALTER TABLE `musiconhold` DISABLE KEYS */;
/*!40000 ALTER TABLE `musiconhold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musiconhold_entry`
--

DROP TABLE IF EXISTS `musiconhold_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `musiconhold_entry` (
  `name` varchar(80) NOT NULL,
  `position` int(11) NOT NULL,
  `entry` varchar(1024) NOT NULL,
  PRIMARY KEY (`name`,`position`),
  CONSTRAINT `fk_musiconhold_entry_name_musiconhold` FOREIGN KEY (`name`) REFERENCES `musiconhold` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musiconhold_entry`
--

LOCK TABLES `musiconhold_entry` WRITE;
/*!40000 ALTER TABLE `musiconhold_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `musiconhold_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `comments` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id_UNIQUE` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_users_clients`
--

DROP TABLE IF EXISTS `oauth_users_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_users_clients` (
  `user` bigint(20) unsigned NOT NULL,
  `client` bigint(20) unsigned NOT NULL,
  `scope` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `delivered` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `expire` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  UNIQUE KEY `user_client` (`user`,`client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_users_clients`
--

LOCK TABLES `oauth_users_clients` WRITE;
/*!40000 ALTER TABLE `oauth_users_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_users_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outboundvm`
--

DROP TABLE IF EXISTS `outboundvm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outboundvm` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `extenID` int(11) NOT NULL,
  `num` varchar(255) DEFAULT NULL,
  `sound` varchar(255) NOT NULL,
  `schedule` datetime DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `extenID` (`extenID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outboundvm`
--

LOCK TABLES `outboundvm` WRITE;
/*!40000 ALTER TABLE `outboundvm` DISABLE KEYS */;
INSERT INTO `outboundvm` VALUES (16,22,'2002','reminders-16.wav','2021-06-01 14:35:00',0,0),(17,22,'2002','reminders-17.wav','2021-06-01 14:41:00',0,0),(18,22,'2002','reminders-18.wav','2021-06-04 12:26:00',0,0),(19,22,'2002','reminders-19.wav','2021-06-04 15:31:00',0,0),(20,22,'2002','reminders-20.wav','2021-06-04 15:33:00',0,0),(21,22,'2002','reminders-21.wav','2021-06-04 15:55:00',0,1),(22,22,'2002','reminders-22.wav','2021-06-04 15:58:00',0,1),(23,22,'2002','reminders-23.wav','2021-06-07 13:05:00',0,1),(24,22,'2002','reminders-24.wav','2021-06-07 14:09:00',0,0),(25,22,'2002','reminders-25.wav','2021-06-07 14:15:00',0,1),(26,22,'2002','reminders-26.wav','2021-06-07 14:19:00',0,1),(28,22,'2002','reminders-28.wav','2021-06-07 14:30:00',0,1),(29,22,'2002','reminders-29.wav','2021-06-07 15:16:00',0,1);
/*!40000 ALTER TABLE `outboundvm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS `parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parameters` (
  `key` varchar(50) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameters`
--

LOCK TABLES `parameters` WRITE;
/*!40000 ALTER TABLE `parameters` DISABLE KEYS */;
INSERT INTO `parameters` VALUES ('AST_PASS','centrex123'),('AST_PORT','5038'),('AST_SERVER','127.0.0.1'),('AST_USER','centrex'),('db_updated','2021-03-15 12:22:31'),('db_version','1.0.0'),('delimiter_key','#'),('dialers','false'),('discador_callsPerInterval','1'),('discador_callsTimeInterval','1'),('discador_maxCallLimit','50'),('footer_text','VoIP Group | 2018    All Rights Reserved'),('integrations','false'),('language','pt'),('log_level','info'),('mailer_encryption','TLS'),('mailer_from_address',''),('mailer_from_name',''),('mailer_host',''),('mailer_pass',''),('mailer_port',''),('mailer_subject','Novo correio de voz'),('mailer_user',''),('smarty_debug','false'),('sound_folder','/var/www/sounds/'),('sound_path','/var/www/sounds/discador/'),('time_zone','America/Sao_Paulo');
/*!40000 ALTER TABLE `parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `params`
--

DROP TABLE IF EXISTS `params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `params` (
  `name` varchar(500) NOT NULL,
  `value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `params`
--

LOCK TABLES `params` WRITE;
/*!40000 ALTER TABLE `params` DISABLE KEYS */;
INSERT INTO `params` VALUES ('allow','ulaw;alaw'),('allowtransfer','yes'),('call-limit',NULL),('disallow',NULL),('dtmfmode','auto'),('language','pt_BR'),('qualify','60');
/*!40000 ALTER TABLE `params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_aors`
--

DROP TABLE IF EXISTS `ps_aors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_aors` (
  `id` varchar(40) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `default_expiration` int(11) DEFAULT NULL,
  `mailboxes` varchar(80) DEFAULT NULL,
  `max_contacts` int(11) DEFAULT NULL,
  `minimum_expiration` int(11) DEFAULT NULL,
  `remove_existing` enum('yes','no') DEFAULT NULL,
  `qualify_frequency` int(11) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `maximum_expiration` int(11) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_aors_id` (`id`),
  KEY `ps_aors_qualifyfreq_contact` (`qualify_frequency`,`contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_aors`
--

LOCK TABLES `ps_aors` WRITE;
/*!40000 ALTER TABLE `ps_aors` DISABLE KEYS */;
INSERT INTO `ps_aors` VALUES ('10_2000',NULL,NULL,NULL,1,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL),('10_2002',NULL,NULL,NULL,1,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL),('10_2003',NULL,NULL,NULL,1,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL),('1_1000',NULL,NULL,NULL,1,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL),('55354701650',NULL,NULL,NULL,1,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ps_aors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_asterisk_publications`
--

DROP TABLE IF EXISTS `ps_asterisk_publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_asterisk_publications` (
  `id` varchar(40) NOT NULL,
  `devicestate_publish` varchar(40) DEFAULT NULL,
  `mailboxstate_publish` varchar(40) DEFAULT NULL,
  `device_state` enum('yes','no') DEFAULT NULL,
  `device_state_filter` varchar(256) DEFAULT NULL,
  `mailbox_state` enum('yes','no') DEFAULT NULL,
  `mailbox_state_filter` varchar(256) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_asterisk_publications_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_asterisk_publications`
--

LOCK TABLES `ps_asterisk_publications` WRITE;
/*!40000 ALTER TABLE `ps_asterisk_publications` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_asterisk_publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_auths`
--

DROP TABLE IF EXISTS `ps_auths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_auths` (
  `id` varchar(40) NOT NULL,
  `auth_type` enum('md5','userpass') DEFAULT NULL,
  `nonce_lifetime` int(11) DEFAULT NULL,
  `md5_cred` varchar(40) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `realm` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_auths_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_auths`
--

LOCK TABLES `ps_auths` WRITE;
/*!40000 ALTER TABLE `ps_auths` DISABLE KEYS */;
INSERT INTO `ps_auths` VALUES ('10_2000','userpass',NULL,NULL,'2000aa2000',NULL,'10_2000'),('10_2002','userpass',NULL,NULL,'2002aa2002',NULL,'10_2002'),('10_2003','userpass',NULL,NULL,'2003aa2003',NULL,'10_2003'),('1_1000','userpass',NULL,NULL,'1000aa1000',NULL,'1_1000'),('55354701650','userpass',NULL,NULL,'55354701650',NULL,'55354701650');
/*!40000 ALTER TABLE `ps_auths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_contacts`
--

DROP TABLE IF EXISTS `ps_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_contacts` (
  `id` varchar(255) DEFAULT NULL,
  `uri` varchar(511) DEFAULT NULL,
  `expiration_time` bigint(20) DEFAULT NULL,
  `qualify_frequency` int(11) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `path` text,
  `user_agent` varchar(255) DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `reg_server` varchar(255) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `via_addr` varchar(40) DEFAULT NULL,
  `via_port` int(11) DEFAULT NULL,
  `call_id` varchar(255) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `prune_on_boot` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `ps_contacts_uq` (`id`,`reg_server`),
  KEY `ps_contacts_id` (`id`),
  KEY `ps_contacts_qualifyfreq_exp` (`qualify_frequency`,`expiration_time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_contacts`
--

LOCK TABLES `ps_contacts` WRITE;
/*!40000 ALTER TABLE `ps_contacts` DISABLE KEYS */;
INSERT INTO `ps_contacts` VALUES ('55354701650','55354701650@55354701650:192.168.0.202/55354718259',NULL,NULL,NULL,NULL,NULL,NULL,'192.168.0.202',NULL,NULL,NULL,NULL,'55354701650',NULL);
/*!40000 ALTER TABLE `ps_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_domain_aliases`
--

DROP TABLE IF EXISTS `ps_domain_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_domain_aliases` (
  `id` varchar(40) NOT NULL,
  `domain` varchar(80) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_domain_aliases_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_domain_aliases`
--

LOCK TABLES `ps_domain_aliases` WRITE;
/*!40000 ALTER TABLE `ps_domain_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_domain_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_endpoint_id_ips`
--

DROP TABLE IF EXISTS `ps_endpoint_id_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_endpoint_id_ips` (
  `id` varchar(40) NOT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `match` varchar(80) DEFAULT NULL,
  `srv_lookups` enum('yes','no') DEFAULT NULL,
  `match_header` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_endpoint_id_ips_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_endpoint_id_ips`
--

LOCK TABLES `ps_endpoint_id_ips` WRITE;
/*!40000 ALTER TABLE `ps_endpoint_id_ips` DISABLE KEYS */;
INSERT INTO `ps_endpoint_id_ips` VALUES ('55354701650','55354701650','192.168.0.202:5060',NULL,NULL);
/*!40000 ALTER TABLE `ps_endpoint_id_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_endpoints`
--

DROP TABLE IF EXISTS `ps_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_endpoints` (
  `id` varchar(40) NOT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `aors` varchar(200) DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `direct_media` enum('yes','no') DEFAULT NULL,
  `connected_line_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_glare_mitigation` enum('none','outgoing','incoming') DEFAULT NULL,
  `disable_direct_media_on_nat` enum('yes','no') DEFAULT NULL,
  `dtmf_mode` enum('rfc4733','inband','info','auto','auto_info') DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `force_rport` enum('yes','no') DEFAULT NULL,
  `ice_support` enum('yes','no') DEFAULT NULL,
  `identify_by` varchar(80) DEFAULT NULL,
  `mailboxes` varchar(40) DEFAULT NULL,
  `moh_suggest` varchar(40) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `rewrite_contact` enum('yes','no') DEFAULT NULL,
  `rtp_ipv6` enum('yes','no') DEFAULT NULL,
  `rtp_symmetric` enum('yes','no') DEFAULT NULL,
  `send_diversion` enum('yes','no') DEFAULT NULL,
  `send_pai` enum('yes','no') DEFAULT NULL,
  `send_rpid` enum('yes','no') DEFAULT NULL,
  `timers_min_se` int(11) DEFAULT NULL,
  `timers` enum('forced','no','required','yes') DEFAULT NULL,
  `timers_sess_expires` int(11) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `callerid_privacy` enum('allowed_not_screened','allowed_passed_screened','allowed_failed_screened','allowed','prohib_not_screened','prohib_passed_screened','prohib_failed_screened','prohib','unavailable') DEFAULT NULL,
  `callerid_tag` varchar(40) DEFAULT NULL,
  `100rel` enum('no','required','yes') DEFAULT NULL,
  `aggregate_mwi` enum('yes','no') DEFAULT NULL,
  `trust_id_inbound` enum('yes','no') DEFAULT NULL,
  `trust_id_outbound` enum('yes','no') DEFAULT NULL,
  `use_ptime` enum('yes','no') DEFAULT NULL,
  `use_avpf` enum('yes','no') DEFAULT NULL,
  `media_encryption` enum('no','sdes','dtls') DEFAULT NULL,
  `inband_progress` enum('yes','no') DEFAULT NULL,
  `call_group` varchar(40) DEFAULT NULL,
  `pickup_group` varchar(40) DEFAULT NULL,
  `named_call_group` varchar(40) DEFAULT NULL,
  `named_pickup_group` varchar(40) DEFAULT NULL,
  `device_state_busy_at` int(11) DEFAULT NULL,
  `fax_detect` enum('yes','no') DEFAULT NULL,
  `t38_udptl` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ec` enum('none','fec','redundancy') DEFAULT NULL,
  `t38_udptl_maxdatagram` int(11) DEFAULT NULL,
  `t38_udptl_nat` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ipv6` enum('yes','no') DEFAULT NULL,
  `tone_zone` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `one_touch_recording` enum('yes','no') DEFAULT NULL,
  `record_on_feature` varchar(40) DEFAULT NULL,
  `record_off_feature` varchar(40) DEFAULT NULL,
  `rtp_engine` varchar(40) DEFAULT NULL,
  `allow_transfer` enum('yes','no') DEFAULT NULL,
  `allow_subscribe` enum('yes','no') DEFAULT NULL,
  `sdp_owner` varchar(40) DEFAULT NULL,
  `sdp_session` varchar(40) DEFAULT NULL,
  `tos_audio` varchar(10) DEFAULT NULL,
  `tos_video` varchar(10) DEFAULT NULL,
  `sub_min_expiry` int(11) DEFAULT NULL,
  `from_domain` varchar(40) DEFAULT NULL,
  `from_user` varchar(40) DEFAULT NULL,
  `mwi_from_user` varchar(40) DEFAULT NULL,
  `dtls_verify` varchar(40) DEFAULT NULL,
  `dtls_rekey` varchar(40) DEFAULT NULL,
  `dtls_cert_file` varchar(200) DEFAULT NULL,
  `dtls_private_key` varchar(200) DEFAULT NULL,
  `dtls_cipher` varchar(200) DEFAULT NULL,
  `dtls_ca_file` varchar(200) DEFAULT NULL,
  `dtls_ca_path` varchar(200) DEFAULT NULL,
  `dtls_setup` enum('active','passive','actpass') DEFAULT NULL,
  `srtp_tag_32` enum('yes','no') DEFAULT NULL,
  `media_address` varchar(40) DEFAULT NULL,
  `redirect_method` enum('user','uri_core','uri_pjsip') DEFAULT NULL,
  `set_var` text,
  `cos_audio` int(11) DEFAULT NULL,
  `cos_video` int(11) DEFAULT NULL,
  `message_context` varchar(40) DEFAULT NULL,
  `force_avp` enum('yes','no') DEFAULT NULL,
  `media_use_received_transport` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `user_eq_phone` enum('yes','no') DEFAULT NULL,
  `moh_passthrough` enum('yes','no') DEFAULT NULL,
  `media_encryption_optimistic` enum('yes','no') DEFAULT NULL,
  `rpid_immediate` enum('yes','no') DEFAULT NULL,
  `g726_non_standard` enum('yes','no') DEFAULT NULL,
  `rtp_keepalive` int(11) DEFAULT NULL,
  `rtp_timeout` int(11) DEFAULT NULL,
  `rtp_timeout_hold` int(11) DEFAULT NULL,
  `bind_rtp_to_media_address` enum('yes','no') DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  `mwi_subscribe_replaces_unsolicited` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `acl` varchar(40) DEFAULT NULL,
  `contact_deny` varchar(95) DEFAULT NULL,
  `contact_permit` varchar(95) DEFAULT NULL,
  `contact_acl` varchar(40) DEFAULT NULL,
  `subscribe_context` varchar(40) DEFAULT NULL,
  `fax_detect_timeout` int(11) DEFAULT NULL,
  `contact_user` varchar(80) DEFAULT NULL,
  `preferred_codec_only` enum('yes','no') DEFAULT NULL,
  `asymmetric_rtp_codec` enum('yes','no') DEFAULT NULL,
  `rtcp_mux` enum('yes','no') DEFAULT NULL,
  `allow_overlap` enum('yes','no') DEFAULT NULL,
  `refer_blind_progress` enum('yes','no') DEFAULT NULL,
  `notify_early_inuse_ringing` enum('yes','no') DEFAULT NULL,
  `max_audio_streams` int(11) DEFAULT NULL,
  `max_video_streams` int(11) DEFAULT NULL,
  `webrtc` enum('yes','no') DEFAULT NULL,
  `dtls_fingerprint` enum('SHA-1','SHA-256') DEFAULT NULL,
  `incoming_mwi_mailbox` varchar(40) DEFAULT NULL,
  `bundle` enum('yes','no') DEFAULT NULL,
  `dtls_auto_generate_cert` enum('yes','no') DEFAULT NULL,
  `follow_early_media_fork` enum('yes','no') DEFAULT NULL,
  `accept_multiple_sdp_answers` enum('yes','no') DEFAULT NULL,
  `suppress_q850_reason_headers` enum('yes','no') DEFAULT NULL,
  `trust_connected_line` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `send_connected_line` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `ignore_183_without_sdp` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `send_history_info` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `stir_shaken` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_endpoints_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_endpoints`
--

LOCK TABLES `ps_endpoints` WRITE;
/*!40000 ALTER TABLE `ps_endpoints` DISABLE KEYS */;
INSERT INTO `ps_endpoints` VALUES ('10_2000','transport-udp','10_2000','10_2000','10',NULL,'ulaw;alaw','no',NULL,NULL,NULL,NULL,'auto',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pt_BR',NULL,NULL,NULL,NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('10_2002','transport-udp','10_2002','10_2002','10',NULL,'ulaw;alaw','no',NULL,NULL,NULL,NULL,'auto',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pt_BR',NULL,NULL,NULL,NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('10_2003','transport-udp','10_2003','10_2003','10',NULL,'ulaw;alaw','no',NULL,NULL,NULL,NULL,'auto',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pt_BR',NULL,NULL,NULL,NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1_1000','transport-udp','1_1000','1_1000','1',NULL,'ulaw;alaw','no',NULL,NULL,NULL,NULL,'auto',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pt_BR',NULL,NULL,NULL,NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('55354701650',NULL,'55354701650',NULL,'1',NULL,'ulaw;alaw',NULL,NULL,NULL,NULL,NULL,'auto',NULL,NULL,NULL,NULL,NULL,NULL,'55354701650',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'55354701650',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'55354701650',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ps_endpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_globals`
--

DROP TABLE IF EXISTS `ps_globals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_globals` (
  `id` varchar(40) NOT NULL,
  `max_forwards` int(11) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `default_outbound_endpoint` varchar(40) DEFAULT NULL,
  `debug` varchar(40) DEFAULT NULL,
  `endpoint_identifier_order` varchar(40) DEFAULT NULL,
  `max_initial_qualify_time` int(11) DEFAULT NULL,
  `default_from_user` varchar(80) DEFAULT NULL,
  `keep_alive_interval` int(11) DEFAULT NULL,
  `regcontext` varchar(80) DEFAULT NULL,
  `contact_expiration_check_interval` int(11) DEFAULT NULL,
  `default_voicemail_extension` varchar(40) DEFAULT NULL,
  `disable_multi_domain` enum('yes','no') DEFAULT NULL,
  `unidentified_request_count` int(11) DEFAULT NULL,
  `unidentified_request_period` int(11) DEFAULT NULL,
  `unidentified_request_prune_interval` int(11) DEFAULT NULL,
  `default_realm` varchar(40) DEFAULT NULL,
  `mwi_tps_queue_high` int(11) DEFAULT NULL,
  `mwi_tps_queue_low` int(11) DEFAULT NULL,
  `mwi_disable_initial_unsolicited` enum('yes','no') DEFAULT NULL,
  `ignore_uri_user_options` enum('yes','no') DEFAULT NULL,
  `use_callerid_contact` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `send_contact_status_on_update_registration` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `taskprocessor_overload_trigger` enum('none','global','pjsip_only') DEFAULT NULL,
  `norefersub` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_globals_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_globals`
--

LOCK TABLES `ps_globals` WRITE;
/*!40000 ALTER TABLE `ps_globals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_globals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_inbound_publications`
--

DROP TABLE IF EXISTS `ps_inbound_publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_inbound_publications` (
  `id` varchar(40) NOT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `event_asterisk-devicestate` varchar(40) DEFAULT NULL,
  `event_asterisk-mwi` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_inbound_publications_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_inbound_publications`
--

LOCK TABLES `ps_inbound_publications` WRITE;
/*!40000 ALTER TABLE `ps_inbound_publications` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_inbound_publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_outbound_publishes`
--

DROP TABLE IF EXISTS `ps_outbound_publishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_outbound_publishes` (
  `id` varchar(40) NOT NULL,
  `expiration` int(11) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(256) DEFAULT NULL,
  `server_uri` varchar(256) DEFAULT NULL,
  `from_uri` varchar(256) DEFAULT NULL,
  `to_uri` varchar(256) DEFAULT NULL,
  `event` varchar(40) DEFAULT NULL,
  `max_auth_attempts` int(11) DEFAULT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `multi_user` enum('yes','no') DEFAULT NULL,
  `@body` varchar(40) DEFAULT NULL,
  `@context` varchar(256) DEFAULT NULL,
  `@exten` varchar(256) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_outbound_publishes_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_outbound_publishes`
--

LOCK TABLES `ps_outbound_publishes` WRITE;
/*!40000 ALTER TABLE `ps_outbound_publishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_outbound_publishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_registrations`
--

DROP TABLE IF EXISTS `ps_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_registrations` (
  `id` varchar(40) NOT NULL,
  `auth_rejection_permanent` enum('yes','no') DEFAULT NULL,
  `client_uri` varchar(255) DEFAULT NULL,
  `contact_user` varchar(40) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `max_retries` int(11) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `retry_interval` int(11) DEFAULT NULL,
  `forbidden_retry_interval` int(11) DEFAULT NULL,
  `server_uri` varchar(255) DEFAULT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `fatal_retry_interval` int(11) DEFAULT NULL,
  `line` enum('yes','no') DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_registrations_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_registrations`
--

LOCK TABLES `ps_registrations` WRITE;
/*!40000 ALTER TABLE `ps_registrations` DISABLE KEYS */;
INSERT INTO `ps_registrations` VALUES ('55354701650',NULL,'sip:55354701650@192.168.0.202:5060','55354701650',NULL,NULL,'55354701650',NULL,60,NULL,'sip:192.168.0.202:5060','transport-udp',NULL,NULL,'yes','55354701650');
/*!40000 ALTER TABLE `ps_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_resource_list`
--

DROP TABLE IF EXISTS `ps_resource_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_resource_list` (
  `id` varchar(40) NOT NULL,
  `list_item` varchar(2048) DEFAULT NULL,
  `event` varchar(40) DEFAULT NULL,
  `full_state` enum('yes','no') DEFAULT NULL,
  `notification_batch_interval` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_resource_list_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_resource_list`
--

LOCK TABLES `ps_resource_list` WRITE;
/*!40000 ALTER TABLE `ps_resource_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_resource_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_subscription_persistence`
--

DROP TABLE IF EXISTS `ps_subscription_persistence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_subscription_persistence` (
  `id` varchar(40) NOT NULL,
  `packet` varchar(2048) DEFAULT NULL,
  `src_name` varchar(128) DEFAULT NULL,
  `src_port` int(11) DEFAULT NULL,
  `transport_key` varchar(64) DEFAULT NULL,
  `local_name` varchar(128) DEFAULT NULL,
  `local_port` int(11) DEFAULT NULL,
  `cseq` int(11) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `expires` int(11) DEFAULT NULL,
  `contact_uri` varchar(256) DEFAULT NULL,
  `prune_on_boot` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_subscription_persistence_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_subscription_persistence`
--

LOCK TABLES `ps_subscription_persistence` WRITE;
/*!40000 ALTER TABLE `ps_subscription_persistence` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_subscription_persistence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_systems`
--

DROP TABLE IF EXISTS `ps_systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_systems` (
  `id` varchar(40) NOT NULL,
  `timer_t1` int(11) DEFAULT NULL,
  `timer_b` int(11) DEFAULT NULL,
  `compact_headers` enum('yes','no') DEFAULT NULL,
  `threadpool_initial_size` int(11) DEFAULT NULL,
  `threadpool_auto_increment` int(11) DEFAULT NULL,
  `threadpool_idle_timeout` int(11) DEFAULT NULL,
  `threadpool_max_size` int(11) DEFAULT NULL,
  `disable_tcp_switch` enum('yes','no') DEFAULT NULL,
  `follow_early_media_fork` enum('yes','no') DEFAULT NULL,
  `accept_multiple_sdp_answers` enum('yes','no') DEFAULT NULL,
  `disable_rport` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_systems_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_systems`
--

LOCK TABLES `ps_systems` WRITE;
/*!40000 ALTER TABLE `ps_systems` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_transports`
--

DROP TABLE IF EXISTS `ps_transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_transports` (
  `id` varchar(40) NOT NULL,
  `async_operations` int(11) DEFAULT NULL,
  `bind` varchar(40) DEFAULT NULL,
  `ca_list_file` varchar(200) DEFAULT NULL,
  `cert_file` varchar(200) DEFAULT NULL,
  `cipher` varchar(200) DEFAULT NULL,
  `domain` varchar(40) DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `external_signaling_address` varchar(40) DEFAULT NULL,
  `external_signaling_port` int(11) DEFAULT NULL,
  `method` enum('default','unspecified','tlsv1','sslv2','sslv3','sslv23') DEFAULT NULL,
  `local_net` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `priv_key_file` varchar(200) DEFAULT NULL,
  `protocol` enum('udp','tcp','tls','ws','wss') DEFAULT NULL,
  `require_client_cert` enum('yes','no') DEFAULT NULL,
  `verify_client` enum('yes','no') DEFAULT NULL,
  `verify_server` enum('yes','no') DEFAULT NULL,
  `tos` varchar(10) DEFAULT NULL,
  `cos` int(11) DEFAULT NULL,
  `allow_reload` enum('yes','no') DEFAULT NULL,
  `symmetric_transport` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_transports_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_transports`
--

LOCK TABLES `ps_transports` WRITE;
/*!40000 ALTER TABLE `ps_transports` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_transports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_agent_status`
--

DROP TABLE IF EXISTS `queue_agent_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_agent_status` (
  `agentId` varchar(40) NOT NULL DEFAULT '',
  `agentName` varchar(40) DEFAULT NULL,
  `agentStatus` varchar(30) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `callid` varchar(40) DEFAULT '0.000000',
  `queue` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`agentId`),
  KEY `agentName` (`agentName`),
  KEY `agentStatus` (`agentStatus`,`timestamp`,`callid`),
  KEY `queue` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_agent_status`
--

LOCK TABLES `queue_agent_status` WRITE;
/*!40000 ALTER TABLE `queue_agent_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_agent_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_call_status`
--

DROP TABLE IF EXISTS `queue_call_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_call_status` (
  `callId` varchar(40) NOT NULL,
  `callerId` varchar(13) NOT NULL,
  `status` varchar(30) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `queue` varchar(25) NOT NULL,
  `position` int(11) NOT NULL,
  `originalPosition` varchar(11) NOT NULL,
  `holdtime` int(11) NOT NULL,
  `keyPressed` varchar(11) NOT NULL,
  `callduration` int(11) NOT NULL,
  PRIMARY KEY (`callId`),
  KEY `callerId` (`callerId`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`),
  KEY `queue` (`queue`),
  KEY `position` (`position`,`originalPosition`,`holdtime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_call_status`
--

LOCK TABLES `queue_call_status` WRITE;
/*!40000 ALTER TABLE `queue_call_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_call_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_log`
--

DROP TABLE IF EXISTS `queue_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` timestamp NULL DEFAULT NULL,
  `callid` varchar(32) NOT NULL DEFAULT '',
  `queuename` varchar(32) NOT NULL DEFAULT '',
  `agent` varchar(32) NOT NULL DEFAULT '',
  `event` varchar(32) NOT NULL DEFAULT '',
  `data` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_log`
--

LOCK TABLES `queue_log` WRITE;
/*!40000 ALTER TABLE `queue_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queues`
--

DROP TABLE IF EXISTS `queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queues` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `corpID` int(11) NOT NULL,
  `moh` varchar(80) NOT NULL DEFAULT 'default',
  `strategy` enum('ringall','leastrecent','fewestcalls','rrmemory','random','linear','wrandom') DEFAULT NULL,
  `timeout` tinyint(3) unsigned NOT NULL,
  `announce` varchar(225) DEFAULT '',
  `failovertimeout` varchar(3) DEFAULT '',
  `failoveraction` varchar(255) DEFAULT '',
  `ivr` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name_corpID` (`name`,`corpID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queues`
--

LOCK TABLES `queues` WRITE;
/*!40000 ALTER TABLE `queues` DISABLE KEYS */;
INSERT INTO `queues` VALUES (1,'fila_vendas',1,'default','ringall',0,'/var/www/sounds/','0','','ivr277');
/*!40000 ALTER TABLE `queues` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%.%.%.%`*/ /*!50003 TRIGGER `queuesInsert` BEFORE INSERT ON `queues` FOR EACH ROW BEGIN
	INSERT INTO astqueues (name,musiconhold,announce,context,strategy,timeout,reportholdtime) VALUES (concat(NEW.corpID,'_',NEW.ID),concat(NEW.corpID,'_',NEW.ID),NEW.announce,NEW.corpID,NEW.strategy,NEW.timeout,0);
	INSERT INTO astmusics (name,directory,application,mode,digit,sort,format) VALUES (concat(NEW.corpID,'_',NEW.ID),concat('/var/www/sounds/Queue',concat(NEW.corpID,'_',NEW.ID)),'','files','','','');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%.%.%.%`*/ /*!50003 TRIGGER `queuesUpdate` AFTER UPDATE ON `queues` FOR EACH ROW BEGIN
	UPDATE astqueues SET musiconhold = concat(NEW.corpID,'_',NEW.ID), announce = NEW.announce, timeout = NEW.timeout, strategy = NEW.strategy, reportholdtime = 0 WHERE name = concat(NEW.corpID,'_',NEW.ID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%.%.%.%`*/ /*!50003 TRIGGER `queuesDelete` BEFORE DELETE ON `queues` FOR EACH ROW BEGIN
		DELETE FROM astqueues WHERE name = concat(OLD.corpID,'_',OLD.ID) LIMIT 1;
		DELETE FROM astqueue_members WHERE queue_name = concat(OLD.corpID,'_',OLD.ID);
		DELETE FROM astmusics WHERE name = concat(OLD.corpID,'_',OLD.ID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `restrictions`
--

DROP TABLE IF EXISTS `restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restrictions` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(255) NOT NULL,
  `type` int(1) NOT NULL,
  `entityID` int(10) NOT NULL,
  `permit` int(1) NOT NULL DEFAULT '0',
  `groupID` int(10) DEFAULT NULL,
  `pin` varchar(5) DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `pattern_type_entityID_groupID` (`pattern`,`type`,`entityID`,`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restrictions`
--

LOCK TABLES `restrictions` WRITE;
/*!40000 ALTER TABLE `restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `IP` varchar(15) NOT NULL,
  `port` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `IP_port` (`IP`,`port`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` VALUES (1,'TEST202','192.168.0.202',5060),(2,'TEST203','192.168.0.203',5060);
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sip_routes`
--

DROP TABLE IF EXISTS `sip_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sip_routes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `corpID` int(11) unsigned NOT NULL,
  `pattern` varchar(50) NOT NULL,
  `translation` varchar(50) NOT NULL,
  `trunkID` int(11) unsigned NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sip_routes`
--

LOCK TABLES `sip_routes` WRITE;
/*!40000 ALTER TABLE `sip_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sip_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sippeers`
--

DROP TABLE IF EXISTS `sippeers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sippeers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `ipaddr` varchar(45) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `regseconds` int(11) DEFAULT NULL,
  `defaultuser` varchar(40) DEFAULT NULL,
  `fullcontact` varchar(80) DEFAULT NULL,
  `regserver` varchar(20) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `lastms` int(11) DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `md5secret` varchar(40) DEFAULT NULL,
  `remotesecret` varchar(40) DEFAULT NULL,
  `transport` enum('udp','tcp','tls','ws','wss','udp,tcp','tcp,udp') DEFAULT NULL,
  `dtmfmode` enum('rfc2833','info','shortinfo','inband','auto') DEFAULT NULL,
  `directmedia` enum('yes','no','nonat','update','outgoing') DEFAULT NULL,
  `nat` varchar(29) DEFAULT NULL,
  `callgroup` varchar(40) DEFAULT NULL,
  `pickupgroup` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `insecure` varchar(40) DEFAULT NULL,
  `trustrpid` enum('yes','no') DEFAULT NULL,
  `progressinband` enum('yes','no','never') DEFAULT NULL,
  `promiscredir` enum('yes','no') DEFAULT NULL,
  `useclientcode` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `amaflags` varchar(40) DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT NULL,
  `busylevel` int(11) DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT NULL,
  `allowsubscribe` enum('yes','no') DEFAULT NULL,
  `videosupport` enum('yes','no') DEFAULT NULL,
  `maxcallbitrate` int(11) DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `session-timers` enum('accept','refuse','originate') DEFAULT NULL,
  `session-expires` int(11) DEFAULT NULL,
  `session-minse` int(11) DEFAULT NULL,
  `session-refresher` enum('uac','uas') DEFAULT NULL,
  `t38pt_usertpsource` varchar(40) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `fromdomain` varchar(40) DEFAULT NULL,
  `fromuser` varchar(40) DEFAULT NULL,
  `qualify` varchar(40) DEFAULT NULL,
  `defaultip` varchar(45) DEFAULT NULL,
  `rtptimeout` int(11) DEFAULT NULL,
  `rtpholdtimeout` int(11) DEFAULT NULL,
  `sendrpid` enum('yes','no') DEFAULT NULL,
  `outboundproxy` varchar(40) DEFAULT NULL,
  `callbackextension` varchar(40) DEFAULT NULL,
  `timert1` int(11) DEFAULT NULL,
  `timerb` int(11) DEFAULT NULL,
  `qualifyfreq` int(11) DEFAULT NULL,
  `constantssrc` enum('yes','no') DEFAULT NULL,
  `contactpermit` varchar(95) DEFAULT NULL,
  `contactdeny` varchar(95) DEFAULT NULL,
  `usereqphone` enum('yes','no') DEFAULT NULL,
  `textsupport` enum('yes','no') DEFAULT NULL,
  `faxdetect` enum('yes','no') DEFAULT NULL,
  `buggymwi` enum('yes','no') DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunkname` varchar(40) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `callingpres` enum('allowed_not_screened','allowed_passed_screen','allowed_failed_screen','allowed','prohib_not_screened','prohib_passed_screen','prohib_failed_screen','prohib') DEFAULT NULL,
  `mohinterpret` varchar(40) DEFAULT NULL,
  `mohsuggest` varchar(40) DEFAULT NULL,
  `parkinglot` varchar(40) DEFAULT NULL,
  `hasvoicemail` enum('yes','no') DEFAULT NULL,
  `subscribemwi` enum('yes','no') DEFAULT NULL,
  `vmexten` varchar(40) DEFAULT NULL,
  `autoframing` enum('yes','no') DEFAULT NULL,
  `rtpkeepalive` int(11) DEFAULT NULL,
  `call-limit` int(11) DEFAULT NULL,
  `g726nonstandard` enum('yes','no') DEFAULT NULL,
  `ignoresdpversion` enum('yes','no') DEFAULT NULL,
  `allowtransfer` enum('yes','no') DEFAULT NULL,
  `dynamic` enum('yes','no') DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  `supportpath` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sippeers_name` (`name`),
  KEY `sippeers_name_host` (`name`,`host`),
  KEY `sippeers_ipaddr_port` (`ipaddr`,`port`),
  KEY `sippeers_host_port` (`host`,`port`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sippeers`
--

LOCK TABLES `sippeers` WRITE;
/*!40000 ALTER TABLE `sippeers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sippeers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speeddials`
--

DROP TABLE IF EXISTS `speeddials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `speeddials` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `number` int(10) NOT NULL,
  `action` varchar(100) NOT NULL,
  `data` varchar(100) DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `entityID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `number_type_entityID` (`number`,`type`,`entityID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speeddials`
--

LOCK TABLES `speeddials` WRITE;
/*!40000 ALTER TABLE `speeddials` DISABLE KEYS */;
INSERT INTO `speeddials` VALUES (1,11,'MeetMe',NULL,0,10),(2,12,'VoiceMailMain',NULL,0,10),(3,13,'Pickup',NULL,0,10),(4,14,'ChanSpy',NULL,0,10),(5,15,'Whisper',NULL,0,10),(6,21,'reminder',NULL,0,10),(7,22,'Forward',NULL,0,10);
/*!40000 ALTER TABLE `speeddials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sw_routes`
--

DROP TABLE IF EXISTS `sw_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sw_routes` (
  `id` varchar(255) NOT NULL,
  `method` varchar(45) NOT NULL,
  `route` varchar(255) NOT NULL,
  `pattern` varchar(255) NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `auth` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sw_routes`
--

LOCK TABLES `sw_routes` WRITE;
/*!40000 ALTER TABLE `sw_routes` DISABLE KEYS */;
INSERT INTO `sw_routes` VALUES ('agents','GET','/agents','^\\/agents\\/?$','Extens::search',NULL,NULL),('agents_edit','GET','/agents/[i:id]','^\\/agents\\/[0-9]+\\/?$','Extens::load',NULL,NULL),('agent_stats','GET','/agents/stats','^\\/agents\\/stats\\/?$','Extens::stats','agents_stats',NULL),('autologin','GET-POST','/centrex','^\\/centrex\\/?$','User::autologin','autologin',NULL),('cdrs','GET','/cdrs','^\\/cdrs\\/?$','Cdrs::search','cdrs',NULL),('cdrs_sound','GET','/cdrs/sound','^\\/cdrs\\/sound\\/?$','Cdrs::play_sound',NULL,NULL),('corps','GET-POST','/corps','^\\/corps\\/?$','Corps::search','corps',NULL),('corps_delete','POST','/corps/[i:id]/delete','^\\/corps\\/[0-9]+\\/delete\\/?$','Corps::delete',NULL,NULL),('corps_edit','GET-POST','/corps/[i:id]','^\\/corps\\/[0-9]+\\/?$','Corps::load','',NULL),('destination_groups','GET-POST','/dg','^\\/dg\\/?$','DestinationGroups::search','destination_groups',NULL),('destination_groups_delete','POST','/dg/[i:id]/delete','^\\/dg\\/[0-9]+\\/delete\\/?$','DestinationGroups::delete',NULL,NULL),('destination_groups_edit','GET-POST','/dg/[i:id]','^\\/dg\\/[0-9]+\\/?$','DestinationGroups::load',NULL,NULL),('dialers','GET','/dialers','^\\/dialers\\/?$','Discador::home','dialers',NULL),('dialers_add','GET-POST','/dialers/add','^\\/dialers\\/add\\/?$','Discador::add_dialer','dialers_add',NULL),('dialers_clients','GET','/dialers/clients','^\\/dialers\\/clients\\/?$','Discador::clients','dialers_clients',NULL),('dialers_clients_csv','GET','/dialers/clients_csv','^\\/dialers\\/clients_csv\\/?$','Discador::clients_csv',NULL,NULL),('dialers_concurrentcalls_csv','GET','/dialers/[i:id]/concurrentcalls_csv','^\\/dialers\\/[0-9]+\\/concurrentcalls_csv\\/?$','Discador::concurrentcalls_csv',NULL,NULL),('dialers_concurrentcalls_stats','GET','/dialers/[i:id]/concurrentcalls_stats','^\\/dialers\\/[0-9]+\\/concurrentcalls_stats\\/?$','Discador::concurrentcalls_stats','dialers_concurrentcalls_stats',NULL),('dialers_conversion_csv','GET','/dialers/[i:id]/conversion_csv','^\\/dialers\\/[0-9]+\\/conversion_csv\\/?$','Discador::conversion_csv',NULL,NULL),('dialers_conversion_stats','GET','/dialers/[i:id]/conversion_stats','^\\/dialers\\/[0-9]+\\/conversion_stats\\/?$','Discador::conversion_stats','dialers_pie_stats',NULL),('dialers_delete','GET','/dialers/[i:id]/delete','^\\/dialers\\/[0-9]+\\/delete\\/?$','Discador::delete_dialer','',NULL),('dialers_edit','GET-POST','/dialers/[i:id]','^\\/dialers\\/[0-9]+\\/?$','Discador::edit_dialer','dialers_add',NULL),('dialers_extens','GET','/dialers/extens','^\\/dialers\\/extens\\/?$','Discador::extens_stats','dialers_extens',NULL),('dialers_extens_csv','GET','/dialers/[i:id]/extens_csv','^\\/dialers\\/[0-9]+\\/extens_csv\\/?$','Discador::extens_csv',NULL,NULL),('dialers_extens_csv_all','GET','/dialers/extens_csv','^\\/dialers\\/extens_csv\\/?$','Discador::extens_csv',NULL,NULL),('dialers_extens_stats','GET','/dialers/[i:id]/extens_stats','^\\/dialers\\/[0-9]+\\/extens_stats\\/?$','Discador::extens_stats','dialers_extens_stats',NULL),('dialers_pause','GET','/dialers/[i:id]/pause','^\\/dialers\\/[0-9]+\\/pause\\/?$','Discador::pauseDiscador',NULL,NULL),('dialers_queue_csv','GET','/dialers/[i:id]/queue_csv','^\\/dialers\\/[0-9]+\\/queue_csv\\/?$','Discador::queue_csv',NULL,NULL),('dialers_queue_stats','GET','/dialers/[i:id]/queue_stats','^\\/dialers\\/[0-9]+\\/queue_stats\\/?$','Discador::queue_stats','dialers_queue_stats',NULL),('dialers_responses_csv','GET','/dialers/[i:id]/responses_csv','^\\/dialers\\/[0-9]+\\/responses_csv\\/?$','Discador::responses_csv',NULL,NULL),('dialers_responses_stats','GET','/dialers/[i:id]/responses_stats','^\\/dialers\\/[0-9]+\\/responses_stats\\/?$','Discador::responses_stats','dialers_pie_stats',NULL),('dialers_sound','GET','/dialers/[i:id]/sound','^\\/dialers\\/[0-9]+\\/sound\\/?$','Discador::download_sound_file',NULL,NULL),('dialers_start','GET','/dialers/[i:id]/start','^\\/dialers\\/[0-9]+\\/start\\/?$','Discador::startDiscador','',NULL),('dialers_stop','GET','/dialers/[i:id]/stop','^\\/dialers\\/[0-9]+\\/stop\\/?$','Discador::stopDiscador',NULL,NULL),('integrations','GET-POST','/integrations','^\\/integrations\\/?$','Integrations::search','integrations',NULL),('integrations_delete','POST','/integrations/[i:id]/delete','^\\/integrations\\/[0-9]+\\/delete\\/?$','Integrations::delete',NULL,NULL),('integrations_delete_audio','POST','/integrations/delete_sound/[i:id]','^\\/integrations\\/delete_sound\\/[0-9]+\\/?$','Integrations::delete_sound',NULL,NULL),('integrations_edit','GET-POST','/integrations/[i:id]','^\\/integrations\\/[0-9]+\\/?$','Integrations::load',NULL,NULL),('integrations_play_audio','GET','/integrations/sound/[i:id]','^\\/integrations\\/sound\\/[0-9]+\\/?$','Integrations::start_sound',NULL,NULL),('logout','GET','/logout','^\\/logout\\/?$','User::logout',NULL,NULL),('look_and_feel','GET-POST','/look_feel','^\\/look_feel\\/?$','LookAndFeel::search','look_and_feel',NULL),('media_servers','GET-POST','/ms','^\\/ms\\/?$','MediaServers::search','media_servers',NULL),('media_servers_delete','POST','/ms/[i:id]/delete','^\\/ms\\/[0-9]+\\/delete\\/?$','MediaServers::delete',NULL,NULL),('media_servers_edit','GET-POST','/ms/[i:id]','^\\/ms\\/[0-9]+\\/?$','MediaServers::load',NULL,NULL),('media_servers_play_audio','GET','/ms/sound/[i:id]','^\\/ms\\/sound\\/[0-9]+\\/?$','MediaServers::play_sound',NULL,NULL),('moh_corps','GET-POST','/corps/[i:id]/moh','^\\/corps\\/[0-9]+\\/moh\\/?$','Moh_corps::search','moh_corps',NULL),('moh_corps_delete','POST','/corps/[i:id]/moh/[i:index]/delete','^\\/corps\\/[0-9]+\\/moh\\/[0-9]+\\/delete\\/?$','Moh_corps::delete',NULL,NULL),('moh_corps_sound','GET','/corps/[i:id]/moh/[i:index]','^\\/corps\\/[0-9]+\\/moh\\/[0-9]+\\/?$','Moh_corps::play_sound',NULL,NULL),('panel','GET','/panel','^\\/panel\\/?$',NULL,'panel',NULL),('queues','GET','/queues','^\\/queues\\/?$','Queues::search',NULL,NULL),('queues_edit','GET','/queues/[i:id]','^\\/queues\\/[0-9]+\\/?$','Queues::load',NULL,NULL),('queues_stats','GET','/queues/stats','^\\/queues\\/stats\\/?$','Queues::stats','queues_stats',NULL),('queue_report','GET','/queue/report','^\\/queue\\/report\\/?$','QueueReport::getReport','queue_report',NULL),('queue_report_sound','GET','/queue/report/sound','^\\/queue\\/report\\/sound\\/?$','QueueReport::play_sound',NULL,NULL),('reminders','GET-POST','/reminders','^\\/reminders\\/?$','Reminders::search','reminders',NULL),('reminders_delete','POST','/reminders/[i:id]/delete','^\\/reminders\\/[0-9]+\\/delete\\/?$','Reminders::delete',NULL,NULL),('reminders_edit','GET-POST','/reminders/[i:id]','^\\/reminders\\/[0-9]+\\/?$','Reminders::load','',NULL),('reminders_play_sound','GET','/reminders/sound/[i:id]','^\\/reminders\\/sound\\/[0-9]+\\/?$','Reminders::start_sound',NULL,NULL),('restrictions','GET-POST','/restrictions','^\\/restrictions\\/?$','Restrictions::search','restrictions',NULL),('restrictions_delete','POST','/restrictions/[i:id]/delete','^\\/restrictions\\/[0-9]+\\/delete\\/?$','Restrictions::delete',NULL,NULL),('restrictions_edit','GET-POST','/restrictions/[i:id]','^\\/restrictions\\/[0-9]+\\/?$','Restrictions::load',NULL,NULL),('servers','GET-POST','/servers','^\\/servers\\/?$','Servers::search','servers',NULL),('servers_delete','POST','/servers/[i:id]/delete','^\\/servers\\/[0-9]+\\/delete\\/?$','Servers::delete',NULL,NULL),('servers_edit','GET-POST','/servers/[i:id]','^\\/servers\\/[0-9]+\\/?$','Servers::load',NULL,NULL),('speed_dials','GET','/sd','^\\/sd\\/?$','SpeedDials::search',NULL,NULL),('trunks','GET-POST','/trunks','^\\/trunks\\/?$','Trunks::search','trunks',NULL),('trunks_delete','POST','/trunks/[i:id]/delete','^\\/trunks\\/[0-9]+\\/delete\\/?$','Trunks::delete',NULL,NULL),('trunks_edit','GET-POST','/trunks/[i:id]','^\\/trunks\\/[0-9]+\\/?$','Trunks::load','',NULL),('users','GET-POST','/users','^\\/users\\/?$','Users::search','users',NULL),('users_delete','POST','/users/[i:id]/delete','^\\/users\\/[0-9]+\\/delete\\/?$','Users::delete',NULL,NULL),('users_edit','GET-POST','/users/[i:id]','^\\/users\\/[0-9]+\\/?$','Users::load','',NULL);
/*!40000 ALTER TABLE `sw_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tempcdrs`
--

DROP TABLE IF EXISTS `tempcdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tempcdrs` (
  `id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caller` varchar(150) NOT NULL,
  `dialed` varchar(150) NOT NULL,
  `destination` varchar(150) NOT NULL,
  `duration` varchar(150) DEFAULT '0',
  `billsec` varchar(150) DEFAULT '0',
  `restPattern` varchar(150) DEFAULT NULL,
  `destID` int(11) DEFAULT NULL,
  `result` varchar(150) DEFAULT NULL,
  `cdruniqueid` varchar(150) DEFAULT NULL,
  `callid` varchar(150) DEFAULT NULL,
  `trunk` varchar(150) DEFAULT NULL,
  `endcall` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tempcdrs`
--

LOCK TABLES `tempcdrs` WRITE;
/*!40000 ALTER TABLE `tempcdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tempcdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timemain`
--

DROP TABLE IF EXISTS `timemain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timemain` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `corpID` int(11) NOT NULL,
  `default` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name_corpID` (`name`,`corpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timemain`
--

LOCK TABLES `timemain` WRITE;
/*!40000 ALTER TABLE `timemain` DISABLE KEYS */;
/*!40000 ALTER TABLE `timemain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeoptions`
--

DROP TABLE IF EXISTS `timeoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeoptions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `timeID` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `days` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `timeID_from_to_days` (`timeID`,`from`,`to`,`days`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeoptions`
--

LOCK TABLES `timeoptions` WRITE;
/*!40000 ALTER TABLE `timeoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` varchar(255) NOT NULL,
  `es` varchar(255) NOT NULL,
  `pt` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES ('action','Acci&oacute;n','A&ccedil;&atilde;o'),('actions','Acciones','A&ccedil;&otilde;es'),('action_tooltip','Seleccione Mensaje para reproducir un audio en la campa&ntilde;a o Fila para contactar con agentes de una fila.','Selecionar &ldquo;Mensagem&rdquo; para reproducir uma audio ao atendente, ou &ldquo;Fila&rdquo; para entregar a liga&ccedil;&atilde;o nos agentes de uma Fila.'),('add','Agregar','Adicionar'),('add_dialer','Nueva Campa&ntilde;a','Nova Campanha'),('add_discador_help_header','Crear o editar campa&ntilde;a','Criar ou Editar Campanha'),('add_massive_help_header','Cargar ramales en forma masiva','Cargar ramais a granel'),('agents_stats_agents_tooltip','Extensi&oacute;n a Verificar','Ramal a verificar'),('agents_stats_from_tooltip','Fecha y horario de inicio de b&uacute;squeda','Data e hor&aacute;rio de inicio da pesquisa'),('agents_stats_queues_tooltip','Filtro de colas: solo ser&aacute;n consideradas para la b&uacute;squeda, llamadas que hayan entrado desde la cola seleccionada','Filtro de filas: s&oacute; ser&atilde;o consideradas na pesquisa aquelas liga&ccedil;&otilde;es que entraram pela fila selecionada'),('agents_stats_to_tooltip','Fecha y horario de fin de b&uacute;squeda','Data e hor&aacute;rio de fim da pesquisa'),('agent_data','Datos de Extensi&oacute;n','Dados de Ramal'),('agent_stats','Estad&iacute;sticas de Agentes','Estat&iacute;sticas de Agentes'),('all','Todos','Todos'),('allow','Permitir','Permitir'),('audio','Sonido','Som'),('avg_duration','Duraci&oacute;n promedio de llamadas','Dura&ccedil;ao m&eacute;dia de chamadas'),('avg_holdtime','Duraci&oacute;n promedio llamadas en espera','Dura&ccedil;ao m&eacute;dia de espera em chamadas'),('Busy','Ocupado','Ocupado'),('callLimit','L&iacute;mite de llamadas','Limite de Chamadas'),('callLimit_placeholder','0 es sin l&iacute;mite','0 = sem limite'),('callLimit_tooltip','Elija un l&iacute;mite de llamadas simultaneas. Por defecto este valor es 0, que significa que no hay l&iacute;mite.','Escolha o limite de chamadas simult&acirc;neas. Valor padr&atilde;o: 0 = sem limite.'),('calls','Llamadas totales','Total de chamadas'),('calls_abandon','Llamadas abandonadas','Chamadas abandonadas'),('calls_completeagent','Llamadas terminadas por el agente','Chamadas terminadas pelo agente'),('calls_completecaller','Llamadas terminadas por el llamante','Chamadas terminadas pelo chamador'),('calls_completed','Llamadas atendidas','Chamadas atendidas'),('calls_exitempty','Llamadas abandonadas por cola vac&iacute;a','Chamadas abandonadas por fila vazia'),('calls_exitwithkey','Llamadas abandonadas con tecla','Chamadas abandonas por discado de c&oacute;digo'),('calls_exitwithtimeout','Llamadas abandonadas por timeout de la cola','Chamadas abandonadas por timeout da fila'),('calls_transfer','Llamadas transferidas','Chamadas transferidas'),('calls_unattended','Llamadas no atendidas','Chamadas n&atilde;o atendidas'),('campaign','Campa&ntilde;a','Campanha'),('cancel','Cancelar','Cancelar'),('cant_create_dialer','No se pudo crear la campa&ntilde;a','A Campanha n&atilde;o p&ocirc;de ser criada'),('cant_edit_dialer','No se pudo editar la campa&ntilde;a','A Campanha n&atilde;o p&ocirc;de ser editada'),('cant_edit_in_curse','No se puede editar una campa&ntilde;a en curso.','Voc&ecirc; n&atilde;o pode editar uma campanha em andamento.'),('cdrs','Lista de CDRs','Lista de CDRs'),('cdrs_audio','Audio','Audio'),('cdrs_billsec','Duraci&oacute;n','Dura&ccedil;&atilde;o'),('cdrs_caller','Origen','Origem'),('cdrs_destination','Destino','Destino'),('cdrs_destinationtype','Tipo de Destino','Tipo de Destino'),('cdrs_destination_exten','Extensi&oacute;n de Destino','Ramal de Destino'),('cdrs_detailed','Detallado','Detalhado'),('cdrs_incoming','Entrantes','Recebidas'),('cdrs_note','El filtrado es hecho desde las 00:00 hs del d&iacute;a desde, hasta las 23:59 hs del d&iacute;a hasta.','O filtrado &eacute; feito desde as 00:00 hs do dia da data desde, at&eacute; as 23:59 hs do dia da data at&eacute;.'),('cdrs_outgoing','Salientes','Efetuadas'),('cdrs_quantity','Cantidad','Quantidade'),('cdrs_search_extension_invalid','La extensi&oacute;n es inv&aacute;lida','O ramal n&atilde;o &eacute; correto'),('cdrs_search_from_to_invalid','Las fechas son inv&aacute;lidas','As datas n&atilde;o s&atilde;o corretas'),('cdrs_search_from_to_invalid_format','Las fechas tienen formato inv&aacute;lido','O formato das datas n&atilde;o &eacute; correto'),('cdrs_search_from_to_invalid_range','Rango de fechas invalido','Range de datas invalido, deve de ser menor a 60 dias'),('cdrs_search_from_to_required','Las fechas son obligatorias','As datas s&atilde;o obrigat&oacute;rias'),('cdrs_usercost','Costo','Custo'),('clients','Clientes','Clientes'),('comments','Comentarios','Coment&aacute;rios'),('comments_tooltip','Ingrese una descripci&oacute;n para la campa&ntilde;a.','Insira uma descri&ccedil;&atilde;o para a Campanha.'),('concurrentcalls','Llamadas Concurrentes','Liga&ccedil;&otilde;es Simult&acirc;neas'),('concurrentCalls_label','Llamadas Concurrentes','Liga&ccedil;&otilde;es Simult&acirc;neas'),('concurrentcalls_stats','Llamadas Concurrentes','Liga&ccedil;&otilde;es Simult&acirc;neas'),('config','Configuraci&oacute;n','Configura&ccedil;&atilde;o'),('confirm_delete','Est&aacute; seguro que desea eliminar el discador?','Confirma o apagado do Discador?'),('confirm_stop','Al detener un discador se reiniciar&aacute;n  las estad&iacute;sticas. &iquest;Desea detener el discador?','Ao deter o discador, as estat&iacute;sticas ser&atilde;o restartadas. Deseja deter o discador?'),('Congestion','Congetionado','Congetionado'),('conversion','Conversi&oacute;n','Convers&atilde;o'),('conversion_stats','Estad&iacute;sticas de Conversi&oacute;n','Estat&iacute;sticas de Convers&atilde;o'),('corp','Corp','Corp'),('corporation','Corporaci&oacute;n','Corpora&ccedil;&atilde;o'),('corps_AllowCustom_tooltip','Permitir quel Administrador customice la interfaz.','Permite que o Administrador customize a interface'),('corps_AllowDiscador_tooltip','Permitir uso de Discador','Permitir uso do Discador'),('corps_Enabled_tooltip','Si se deshabilita la corporaci&oacute;n, todas las funcionalidades y extensiones de la misma quedar&aacute;n fuera de funcionamiento','Desabilitando a corpora&ccedil;&atilde;o, todas as funcionalidades e ramais da mesma ficar&atilde;o fora de servi&ccedil;o'),('corps_ExtLen_tooltip','Cantidad de d&iacute;gitos de las extensiones. Usar 3 para extensiones de 3 d&iacute;gitos (ej. 301) o 4 para extensiones de 4 d&iacute;gitos (ej. 3001)','Quantidade de d&iacute;gitos dos ramais. Usar 3 para ramais de 3 d&iacute;gitos (ex.301) ou 4 para ramais de 4 d&iacute;gitos (ex. 3001)'),('corps_ExtMax_tooltip','Cantidad m&aacute;xima de extensiones que el Administrador podr&aacute; crear','Quantidade m&acute;xima de extens&otilde;es que poder&aacute; criar o Administrador'),('corps_MonEnabled_tooltip','Habilita la grabaci&oacute;n de todas las llamadas','Habilita a grava&ccedil;&atilde;o de todas as liga&ccedil;&otilde;es'),('corps_MonPath_tooltip','Path donde ser&aacute;n almacenadas las grabaciones. La carpeta debe existir previamente y tener permisos de escritura','Path onde ser&atilde;o armazenadas as grava&ccedil;&otilde;es. A pasta deve existir previamente e ter permiss&otilde;es de escritura'),('corps_name_tooltip','Nombre o descripci&oacute;n de la Corporaci&oacute;n','Nome ou descri&ccedil;&atilde;o da Corpora&ccedil;&atilde;o'),('corps_QueMax_tooltip','Cantidad m&aacute;xima de colas que el Administrador podr&aacute; crear','Quantidade m&aacute;xima de filas que poder&aacute; criar o Administrador'),('corps_save_created_ok','La Corporaci&oacute;n fu&eacute; creada con &eacute;xito','A Corpora&ccedil;&atilde;o foi criada com sucesso'),('corps_save_edited_ok','La Corporaci&oacute;n fu&eacute; actualizada con &eacute;xito','A Corpora&ccedil;&atilde;o foi editada com sucesso'),('corps_save_extLen_invalid','La longitud de la extensi&oacute;n no es correcta','A longitude de ramais n%atilde;o &eacute; correta'),('corps_save_extMax_invalid','La cantidad max. de extensiones no es correcta','A quantidade max. de ramais n&atilde;o &eacute; correta'),('corps_save_monPath_invalid','La ruta de grabaciones no es correcta','A rota de grava&ccedil;&otilde;es n&atilde;o &eacute; correta'),('corps_save_monPath_required','Selecciono activar grabaciones, no puede dejar la ruta de grabaciones vac&iacute;a','Voc&ecirc; selecionou ativar grava&ccedil;&otilde;es, n&atilde;o pode deixar a rota de grava&ccedil;&otilde;es vazia'),('corps_save_name_invalid','El nombre de la Corporaci&oacute;n no es correcto','O nome da corpora&ccedil;&atilde;o n&atilde;o &eacute; correto'),('corps_save_name_repeated','Ya existe una Corporaci&oacute;n con ese nombre','J&aacute; existe uma Corpora&ccedil;&atilde;o com esse nome'),('corps_save_name_required','El nombre de la Corporaci&oacute;n es obligatorio','O nome da corpora&ccedil;&atilde;o &eacute; obrigat&oacute;rio'),('corps_save_queMax_invalid','La cantidad max. de colas no es correcta','A quantidade max. de filas n&atilde;o &eacute; correta'),('corp_AllowCustom','Permitir cambiar Look & Feel','Permitir mudar Look & Feel'),('corp_AllowCustom_table','Look & Feel','Look & Feel'),('corp_AllowDiscador','Habilitar Discador','Habilitar Discador'),('corp_CostEnabled','Costo Habilitado','Custo Habilitado'),('corp_ExtLen','Long. de la Extensi&oacute;n','Long. de Ramal'),('corp_ExtMax','Cant. Max. de Extensiones','Qde. Max. de Ramais'),('corp_MonEnabled','Grabaciones','Grava&ccedil;&otilde;es'),('corp_MonPath','Carpeta','Pasta'),('corp_noteAllowCustom','Este cambio ser&aacute; aplicado cuando el usuario ingrese nuevamente al navegador','Para aplicar a mudan&ccedil;a &eacute; necess&aacute;rio fechar o navegador e acessar novamente'),('corp_noteMaxExten','Si la long. de la Extensi&oacute;n es 3, el n&uacute;m. m&aacute;ximo de Extensiones es 799, y si es 4, el n&uacute;mero m&aacute;ximo de Extensiones ser&iacute;a 8999','Se a long. de ramais for 3, o n&uacute;m. m&aacute;ximo de ramais ser&aacute; 799, e se for 4, o n&uacute;mero m&aacute;ximo de ramais ser&aacute; 8999'),('corp_QueMax','Cant. Max. de Colas','Qde. Max. de Filas'),('csvFile','Archivo de n&uacute;meros','Arquivo de N&uacute;meros'),('csvFile_tooltip','Elija el archivo CSV con los n&uacute;meros a llamar en la campa&ntilde;a. Puede descargar el archivo disponible en el link para ver la estructura. Los n&uacute;meros deben respetar la configuraci&oacute;n regional del troncal de salida. ','Escolha o arquivo CSV com os n&uacute;meros a ligar na campanha. Pode descarregar o arquivo de exemplo abaixo para usar a estrutura correta. Os n&uacute;meros devem respetar a configura&ccedil;&atilde;o regional do Trunk de sa&iacute;da.'),('dashboard','Dashboard','Dashboard'),('data_table_info_empty','Mostrando registros del 0 al 0 de un total de 0 registros','Mostrando 0 at&eacute; 0 de 0 registros'),('data_table_zero_records','Sin datos disponibles en la tabla','Sem dados dispon&iacute;veis na tabela'),('date','Fecha','Data'),('days','D&iacute;as','Dias'),('days_tooltip','Elija los dias de la semana en los que la campa&ntilde;a realizar&aacute; llamadas. Si no selecciona ninguno, realizar&aacute; llamadas cualquier d&iacute;a.','Escolha os d&iacute;as da semana nos que funciona a Campanha. Se nenhum dia for selecionado, a Campanha funcionar&aacute; &agrave; demanda.'),('delete','Eliminar','Apagar'),('delete_corp_text1',' Confirma exclusi&oacute;n de la Corporaci&oacute;n',' Confirma exclus&atilde;o da Corpora&ccedil;&atilde;o'),('delete_corp_text2','Ser&aacute;n borrado los Usuarios, las Colas, los Trunks, las Extensiones, los IVRs y las Restricciones que pertenecen a la Corporaci&oacute;n','Ser&atilde;o apagados os Usu&aacute;rios, as Filas, os Troncos, os Ramais, as URAs e as Restri&ccedil;oes que estejam atreladas na Corpora&ccedil;&atilde;o'),('delete_corp_title','Borrar Corporaci&oacute;n','Apagar Corpora&ccedil;&atilde;o'),('delete_dest_groups',' Confirma exclusi&oacute;n del Grupo de Destino',' Confirma exclus&atilde;o do Grupo de Destino'),('delete_dest_groups_title','Borrar Grupo de Destino','Apagar Grupo de Destino'),('delete_integration_text',' Confirmar exclusi&oacute;n del Integraci&oacute;n',' Confirmar exclus&atilde;o do Integra&ccedil;&atilde;o'),('delete_integration_title','Borrar Integraci&oacute;n','Apagar Integra&ccedil;&atilde;o'),('delete_ms_body',' Confirma exclusi&oacute;n del Servidor de Media',' Confirma exclus&atilde;o do Servidor de M&iacute;dia'),('delete_ms_title','Borrar Servidor de Media','Apagar Servidor de M&iacute;dia'),('delete_reminder_text1','Confirmar exclusi&oacute;n de Recordatorio','Confirmar exclus&atilde;o do Lembrete'),('delete_reminder_title','Borrar Recordatorio','Apagar Lembrete'),('delete_restriction_body','Confirmar exclusi&oacute;n de Restricci&oacute;n','Confirmar exclus&atilde;o da Restri&ccedil;&atilde;o'),('delete_restriction_title','Borrar Restricci&oacute;n','Apagar Restri&ccedil;&atilde;o'),('delete_server_text1',' Confirmar exclusi&oacute;n del Server y sus Trunks asociados',' Confirmar exclus&atilde;o do Servidor e todos os Troncos atribu&iacute;dos'),('delete_server_title','Borrar Server','Apagar Servidor'),('delete_siproutes_text','Confirmar exlusi&oacute;n de la Sip Route','Confirmar exlusi&oacute;n de la Sip Route'),('delete_siproutes_title','Borrar Sip Route','Excluir Sip Route'),('delete_trunk_text1',' Confirmar exclusi&oacute;n del Trunk','Confirmar exclus&atilde;o do Tronco'),('delete_trunk_title','Borrar Trunk','Apagar Tronco'),('delete_user_text1',' Confirmar exclusi&oacute;n del Usuario',' Confirmar exclus&atilde;o do Usu&aacute;rio'),('delete_user_title','Borrar Usuario','Apagar Usu&aacute;rio'),('demo_csv_file','Descargar estructura de archivo','Descarregar Estrutura de Arquivo'),('destination','Destino','Destino'),('destination_groups_dest','Destinos','Destinos'),('destination_groups_dest_tooltip','',''),('destination_groups_items','Items del Grupo','Items do Grupo'),('destination_groups_name','Nombre del Grupo','Nome do Grupo'),('destination_groups_name_tooltip','Nombre o descripci&oacute;n del grupo de destino. Est&aacute;n permitidos caracteres alfanum&eacute;ricos, gui&oacute;n bajo y espaciados.','Nome ou descri&ccedil;&atilde;o do grupo de destino. Caracteres alfanum&eacute;ricos, sublinhado e espa&ccedil;amento s&atilde;o permitidos.'),('destination_groups_save_created_ok','El grupo de destino fue creado con &eacute;xito','O grupo de destino foi criado com sucesso'),('destination_groups_save_destination_invalid','El patr&oacute;n de destino ingresado no es correcto','O padr&atilde;o de destino inserido n&atilde;o &eacute; correto'),('destination_groups_save_destination_repeated','Ya existe un grupo de destino con ese patr&oacute;n','J&aacute; existe um grupo de destino com esse padr&atilde;o'),('destination_groups_save_edited_ok','El grupo de destino fue actualizado con &eacute;xito','O grupo de destino foi editado com sucesso'),('destination_groups_save_name_invalid','El nombre del grupo de destino no es correcto','O nome do grupo de destino n&atilde;o &eacute; correto'),('destination_groups_save_name_repeated','Ya existe un grupo de destino con ese nombre','J&aacute; existe um grupo de destino com esse nome'),('destination_groups_save_name_required','El nombre del Grupo de destino es obligatorio','O nome do Grupo de Destino &eacute; obrigat&oacute;rio'),('dialer','Discador','Discador'),('dialers','Campa&ntilde;as','Campanhas'),('disabled','Deshabilitado','Desabilitado'),('dont_exists_dialer','No existe el discador','O discador n&atilde;o existe'),('download_audio','Descargar audio','Descarregar Audio'),('download_csv','Descargar CSV','Descarregar CSV'),('edit','Editar','Editar'),('edit_corp_title','Editar Corporaci&oacute;n','Editar Corpora&ccedil;&atilde;o'),('edit_dg_title','Editar Grupo de Destino','Editar Grupo de Destino'),('edit_dialer','Editar Campa&ntilde;a','Editar Campanha'),('edit_integration_title','Editar Integraci&oacute;n','Editar Integra&ccedil;&atilde;o'),('edit_ms_title','Editar Servidor de Media','Editar Servidor de M&iacute;dia'),('edit_reminder_title','Editar Recordatorio','Editar Lembrete'),('edit_restriction_title','Editar Restricci&oacute;n','Editar Restri&ccedil;&atilde;o'),('edit_server_title','Editar Servidor','Editar Server'),('edit_siproutes_title','Editar Sip Routes','Editar Sip Routes'),('edit_trunk_title','Editar Trunk','Editar Tronco'),('edit_user_title','Editar Usuario','Editar Usu&aacute;rio'),('empty_name','Debe ingresar un nombre','Deve inserir um nome'),('empty_table','No existen datos para la consulta.','N&atilde;o existem dados para a consulta.'),('enabled','Habilitado','Habilitado'),('error_dialer_deleted','Error al eliminar el discador','Erro ao apagar Discador'),('error_number_deletedAll','Error al eliminar los n&uacute;meros','Erro ao apagar N&uacute;meros'),('error_number_history_deletedAll','Error al eliminar el historial de n&uacute;meros','Erro ao apagar Historial de N&uacute;meros'),('error_sound_format_discador','Archivos (.wav) en formato PCM, 8Khz, 16 bits, mono y tama&ntilde;o m&aacute;ximo de 2Mb','Arquivos (.wav) devem ficar no formato PCM, 8Khz, 16 bits, mono e tamanho m&aacute;ximo de 2Mb'),('exten','Extensi&oacute;n','Ramal'),('extens','Extensiones','Ramais'),('extens_stats','Estad&iacute;sticas de Ramales','Estat&iacute;sticas de Ramais'),('extens_stats_agent_required','La extensi&oacute;n es obligatoria','O ramal &eacute; obrigat&oacute;rio'),('extens_stats_exten_invalid','La extensi&oacute;n es inv&aacute;lida','O ramal n&atilde;o &eacute; correto'),('extens_stats_from_to_invalid','Las fechas son inv&aacute;lidas','As datas n&atilde;o s&atilde;o corretas'),('extens_stats_from_to_invalid_format','El formato de las fechas es inv&aacute;lido','O formato das datas n&atilde;o &eacute; correto'),('extens_stats_from_to_required','Las fechas son obligatorias','As datas s&atilde;o obrigat&oacute;rias'),('extens_stats_queue_invalid','La cola es inv&aacute;lida','A fila n&atilde;o &eacute; correta'),('extens_stats_queue_required','La cola es obligatoria','A fila &eacute; obrigat&oacute;ria'),('exten_dest','Extensiones de destino','Ramais de destino'),('exten_limit','L&iacute;mite de llamadas simult&aacute;neas','Limite de chamadas simultaneas'),('exten_origin','Extensi&oacute;n de origen','Ramal de origem'),('exten_porttype','Tipo de puerto','Tipo de porta'),('Failed (not busy or congested)','Falla (no congestionado u ocupado)','Falha (n&atilde;o ocupado ou congestionado)'),('form_yes','Si','Sim'),('friday','Viernes','Sexta'),('go_back','Volver','Voltar'),('Hang up','Colgado','Desligado'),('horaDesde','Desde','Desde'),('horaDesde_tooltip','Elija desde qu&eacute; hora la campa&ntilde;a realizar&aacute; llamadas. Si no define ninguna funcionar&aacute; a cualquier hora.','Escolha o hor&aacute;rio de come&ccedil;o da Campanha. Se nenhum hor&aacute;rio for definido a Campanha funcionar&aacute; &agrave; demanda.'),('horaHasta','Hasta','At&eacute;'),('horaHasta_min','hasta','at&eacute;'),('horaHasta_tooltip','Elija hasta qu&eacute; hora la campa&ntilde;a realizar&aacute; llamadas. Si no define ninguna funcionar&aacute; a cualquier hora.','Escolha o hor&aacute;rio de finaliza&ccedil;&atilde;o da Campanha. Se nenhum hor&aacute;rio for definido a Campanha funcionar&aacute; &agrave; demanda.'),('in','en','em'),('In Use','En uso','En uso'),('integrations','Integraciones','Integra&ccedil;&otilde;es'),('integrations_delete_sound1_dont_exist_file','No existe el archivo de audio de apertura. ','O arquivo de &aacute;udio de abertura &eacute; n&atilde;o existe.'),('integrations_delete_sound2_dont_exist_file','No existe el archivo de audio de solicitud de CPF/CNPJ. ','O arquivo de &aacute;udio de abertura &eacute; n&atilde;o existe.'),('integrations_delete_sound3_dont_exist_file','No existe el archivo de audio de clientes con problemas. ','O arquivo de clientes com problemas n&atilde;o existe.'),('integrations_delete_sound4_dont_exist_file','No existe el archivo de audio de cierre. ','O arquivo de &aacute;udio de encerramento n&atilde;o existe.'),('integrations_save_created_ok','La integraci&oacute;n fu&eacute; creada con &eacute;xito.','A integra&ccedil;&atilde;o foi criado com sucesso.'),('integrations_save_edited_ok','La integraci&oacute;n fu&eacute; editada con &eacute;xito.','A integra&ccedil;&atilde;o foi editada com sucesso.'),('integration_action','Acci&oacute;n','A&ccedil;&atilde;o'),('integration_action1','Acci&oacute;n para no clientes','A&ccedil;&atilde;o para n&atilde;o clientes'),('integration_action1_tooltip','Elija la acci&oacute;n que se ejecutar&aacute; cuando el origen no es cliente.','Escolha a a&ccedil;&atilde;o que ser&aacute; executada quando a origem n&atilde;o for um cliente.'),('integration_action2','Acci&oacute;n para clientes con deuda','A&ccedil;&atilde;o para n&atilde;o clientes com d&iacute;vida'),('integration_action2_tooltip','Elija la acci&oacute;n que se ejecutar&aacute; cuando el cliente tenga deuda.','Escolha a a&ccedil;&atilde;o que ser&aacute; executada quando o cliente tenha d&iacute;vida.'),('integration_action3','Acci&oacute;n para clientes sin deuda','A&ccedil;&atilde;o para n&atilde;o clientes sem d&iacute;vida'),('integration_action3_tooltip','Elija la acci&oacute;n que se ejecutar&aacute; cuando el cliente no tenga deuda.','Escolha a a&ccedil;&atilde;o que ser&aacute; executada quando o cliente n&atilde;o tenha d&iacute;vida.'),('integration_host','Host','Host'),('integration_host_tooltip','Ingrese IP o dominio del servidor ERP/CRM.','Insira o endere&ccedil;o IP ou dominio do servidor ERP/CRM.'),('integration_name','Nombre','Nome'),('integration_name_tooltip','Ingrese un nombre para la integraci&oacute;n.','Insira um nome para a integra&ccedil;&atilde;o.'),('integration_password','Contrase&ntilde;a','Senha'),('integration_password_tooltip','Ingrese contrase&ntilde;a para autenticar con el servidor ERP/CRM.','Insira a senha para autenticar com o servidor ERP/CRM.'),('integration_save_host_invalid_format','El formato del host es inv&aacute;lido.','O formato do host &eacute; inv&aacute;lido.'),('integration_save_name_invalid','tipo de  integraci&oacute;n invalido','tipo de integra&ccedil;&atilde;o invalido'),('integration_save_name_repeated','El nombe ingresado ya existe.','O nome inserido j&aacute; existe.'),('integration_save_name_required','Ingrese un nombre.','Insira um nome.'),('integration_save_sound1_invalid_format_file','El formato de audio de apertura es incorrecto. El archivo debe ser .wav, PCM, 8Khz, mono y 16 bits.','O formato de &aacute;udio de abertura &eacute; incorreto. O arquivo debe ser .wav, PCM, 8Khz, mono e 16 bits.'),('integration_save_sound1_uploading','Error al subir el archivo de audio de apertura. ','Erro ao carregar o arquivo de &aacute;udio de abertura &eacute;.'),('integration_save_sound2_invalid_format_file','El formato de audio de solicitud de CPF/CNPJ es incorrecto. El archivo debe ser .wav, PCM, 8Khz, mono y 16 bits.','O formato de &aacute;udio de solicita&ccedil;&atilde;o de CPF/CNPJ &eacute; incorreto. O arquivo debe ser .wav, PCM, 8Khz, mono e 16 bits.'),('integration_save_sound2_uploading','Error al subir el archivo de audio de solicitud de CPF/CNPJ. ','Erro ao carregar o arquivo de solicita&ccedil;&atilde;o de CPF/CNPJ.'),('integration_save_sound3_invalid_format_file','El formato de audio de clientes con problemas es incorrecto. El archivo debe ser .wav, PCM, 8Khz, mono y 16 bits.','O formato de &aacute;udio de clientes com problemas &eacute; incorreto. O arquivo debe ser .wav, PCM, 8Khz, mono e 16 bits.'),('integration_save_sound3_uploading','Error al subir el archivo de audio de clientes con problemas. ','Erro ao carregar o arquivo de clientes com problemas.'),('integration_save_sound4_invalid_format_file','El formato de audio de cierre es incorrecto. El archivo debe ser .wav, PCM, 8Khz, mono y 16 bits.','O formato de &aacute;udio de encerramento &eacute; incorreto. O arquivo debe ser .wav, PCM, 8Khz, mono e 16 bits.'),('integration_save_sound4_uploading','Error al subir el archivo de audio de cierre. ','Erro ao carregar o arquivo de &aacute;udio de encerramento.'),('integration_save_user_required','Ingrese un usuario/token.\r\n','Insira um usu&aacute;rio/token.'),('integration_sound1','Audio de apertura','&Aacute;udio de abertura'),('integration_sound1_tooltip','Elija el archivo de audio en formato wav que se utilizar&aacute; al inicio del ivr de integraci&oacute;n.','Escolha o arquivo de &aacute;udio em formato .wav que ser&aacute; utilizado ao come&ccedil;o do IVR de integra&ccedil;&atilde;o.'),('integration_sound2','Audio de solicitud de CPF/CNPJ','&Aacute;udio de solicitude de CPF/CNPJ'),('integration_sound2_tooltip','Elija el archivo de audio en formato wav que se utilizar&aacute; para solicitar CPF/CNPJ.','Escolha o arquivo de &aacute;udio em formato .wav que ser&aacute; utilizado para solicitar CPF/CNPJ.'),('integration_sound3','Audio de problemas con el cliente','&Aacute;udio de problemas com o cliente'),('integration_sound3_tooltip','Elija el archivo de audio en formato wav que se utilizar&aacute; para indicar que el cliente tiene problemas.','Escolha o arquivo de &aacute;udio em formato .wav que ser&aacute; utilizado para solicitar CPF/CNPJ.'),('integration_sound4','Audio de cierre','&Aacute;udio de encerramento'),('integration_sound4_tooltip','Elija el archivo de audio en formato wav que se utilizar&aacute; para cerrar el ivr de integraci&oacute;n.','Escolha o arquivo de &aacute;udio em formato .wav que ser&aacute; utilizado para fechar o IVR de integra&ccedil;&atilde;o.'),('integration_type','Tipo de integraci&oacute;n','Tipo de integra&ccedil;&atilde;o'),('integration_type_tooltip','Elija el tipo de integraci&oacute;n.','Escolha o tipo de integra&ccedil;&atilde;o.'),('integration_user_tooltip','Ingrese usuario o token para autenticar con el servidor ERP/CRM.','Insira o usu&aacute;rio ou token para autenticar com o servidor ERP/CRM.'),('inUse','Ocupado','Ocupado'),('invalid_callLimit','El L&iacute;mite de llamadas ingresado es inv&aacute;lido','O limite de chamadas inserido &eacute; inv&aacute;lido.'),('invalid_name','El nombre ingresado es inv&aacute;lido','O nome inserido &eacute; inv&aacute;lido'),('invalid_retries','N&uacute;mero de reintentos inv&aacute;lido','N&uacute;mero de tentativas inv&aacute;lido'),('invalid_timeout','Timeout inv&aacute;lido','Timeout inv&aacute;lido'),('label_limit','0 = ilimitado','0 = ilimitado'),('label_seconds_queue','M&aacute;ximo de 10 segundos','No m&aacute;ximo 10 segundos'),('label_view_password','Cliquear en el &aacute;rea de texto para ver el contrase&ntilde;a','Clicar na &aacute;rea de texto para ver a senha'),('lastUpdated','Fecha de gesti&oacute;n','&Uacute;ltima Atualiza&ccedil;&atilde;o'),('level','Nivel','N&iacute;vel'),('Listened','Escuchado','Ouvido'),('load_sound','Cargar audio','Carregar audio'),('logout','Salir','Sair'),('look_and_feel_bg_active','Color de fondo de secci&oacute;n activa','Cor de fundo da sec&ccedil;&atilde;o activa'),('look_and_feel_bg_default','Color de fondo de secciones','Cor de fundo das sec&ccedil;&otilde;es'),('look_and_feel_blue_css','Color de men&uacute; lateral','Cor do menu lateral'),('look_and_feel_edited_ok','Par&aacute;metros actualizados, por favor iniciar sesi&oacute;n nuevamente.','Par&acirc;metros atualizados, favor iniciar sess&atilde;o novamente.'),('look_and_feel_font_active','Color de fuente de la secci&oacute;n activa','Cor da fonte da sec&ccedil;&atilde;o activa'),('look_and_feel_font_default','Color de fuente de secciones','Cor da fonte das sec&ccedil;&otilde;es'),('look_and_feel_footer_bar','Color de pi&eacute; de p&aacute;gina\r\n','Cor de rodap&eacute;'),('look_and_feel_login_title','Editar Look & Feel de Login','Editar Look & Feel do Login'),('look_and_feel_logo','Imagen de la barra de secciones','Imagem da barra das sec&ccedil;&otilde;es'),('look_and_feel_logo_fondo','Imagen de fondo','Imagem de fundo'),('look_and_feel_msg_admin','Si se deja el valor vac&iacute;o en la ruta se va a usar la imagen del supervisor.','Em caso de rota vazia ou incorreta ser&aacute; utilizada a imagem padr&atilde;o do n&iacute;vel Supervisor.'),('look_and_feel_nav_bar','Color de la barra de secciones','Cor da barra das sec&ccedil;&otilde;es'),('look_and_feel_response_error','Alguno de los par&aacute;metros de personalizaci&oacute;n tiene un valor incorrecto.','Alguns dos par&acirc;metros de personaliza&ccedil;&atilde;o t&ecirc;m um valor incorreto.'),('look_and_feel_title','Editar Look & Feel','Editar Look & Feel'),('massive_title','Carga masiva','Carga a granel'),('max_duration','Duraci&oacute;n m&aacute;xima de llamadas','Dura&ccedil;ao m&aacute;xima de chamadas'),('max_holdtime','Duraci&oacute;n m&aacute;xima de llamadas en espera','Dura&ccedil;ao m&aacute;xima de espera em chamadas'),('media_servers_save_created_ok','El Servidor de Media fue creado con &eacute;xito','O Servidor de M&iacute;dia foi criado com sucesso'),('media_servers_save_edited_ok','El Servidor de Media fue actualizado con &eacute;xito','O Servidor de M&iacute;dia foi editado com sucesso'),('media_servers_save_number_invalid','El n&uacute;mero del Servidor de Media no es correcto','O n&uacute;mero do Servidor de M&iacute;dia n&atilde;o &eacute; correto'),('media_servers_save_number_repeated','Ya existe un Servidor de Media con ese n&uacute;mero','J&aacute; existe um Servidor de M&iacute;dia com esse n&uacute;mero'),('media_servers_save_number_required','El n&uacute;mero del Servidor de Media es obligatorio','O n&uacute;mero do Servidor de M&iacute;dia &eacute; obrigat&oacute;rio'),('media_servers_save_sound_invalid_format_file','El formato del archivo de audio no es correcto','O formato de arquivo de &aacute;udio n&atilde;o &eacute; correto'),('media_servers_save_sound_no_uploaded','Error al subir el archivo de audio.','Erro ao carregar o arquivo de &aacute;udio.'),('media_servers_save_sound_required','El archivo de audio es obligatorio','O arquivo de &aacute;udio &eacute; obrigat&oacute;rio'),('mensaje','Mensaje','Mensagem'),('menu_massive','Carga masiva','Carga a granel'),('moh_corps_save_add_ok','El archivo de audio fue agregado con &eacute;xito','O arquivo de &aacute;udio foi adicionado com sucesso'),('moh_corps_save_no_uploaded_sound','Error al subir el archivo de audio.','Erro ao carregar o arquivo de &aacute;udio.'),('moh_corps_save_sound_invalid_format_file','El formato del archivo de audio no es correcto','O formato de arquivo de &aacute;udio n&atilde;o &eacute; correto'),('moh_corps_title','Moh de corporaci&oacute;n','Moh de corpora&ccedil;&atilde;o'),('moh_sound_format_note','Archivos (.wav) en formato PCM, 8Khz, 16 bits, mono y tama&ntilde;o m&aacute;ximo de 2Mb','Arquivos (.wav) devem ficar no formato PCM, 8Khz, 16 bits, mono e tamanho m&aacute;ximo de 2Mb'),('monday','Lunes','Segunda'),('name','Nombre','Nome'),('name_tooltip','Ingrese un nombre para la campa&ntilde;a.','Insira um nome para a Campanha.'),('new_corp','Nueva Corporaci&oacute;n','Nova Corpora&ccedil;&atilde;o'),('new_dg','Nuevo Grupo de Destino','Novo Grupo de Destino'),('new_integration','Nueva integraci&oacute;n','Nova integra&ccedil;&atilde;o'),('new_ms','Nuevo Servidor de Media','Novo Servidor de M&iacute;dia'),('new_reminder','Nuevo Recordatorio','Novo Lembrete'),('new_restriction','Nueva Restricci&oacute;n','Nova Restri&ccedil;&atilde;o'),('new_server','Nuevo Server','Novo Servidor'),('new_siproutes','Nuevo Sip Routes','Novo Sip Routes'),('new_trunk','Nuevo Trunk','Novo Tronco'),('new_user','Nuevo Usuario','Novo Usu&aacute;rio'),('next','Siguiente','Seguinte'),('no','No','N&atilde;o'),('Not contacted','No contactado','N&atilde;o contatado'),('Not Listened','No escuchado','N&atilde;o ouvido'),('Not Reached','No alcanzado','N&atilde;o alcan&ccedil;ado'),('notInUse','Disponible','Dispon&iacute;vel'),('no_client_data','No existen datos para el cliente ingresado','N&atilde;o existem dados pro Cliente escolhido'),('no_data','No existen datos para esta campa&ntilde;a','N&atilde;o existem dados para essa Campanha'),('no_data_graph','No existen datos para la fecha elegida','N&atilde;o existem dados na data escolhida'),('no_exist_dialer','Sin datos disponibles en la tabla','Sem dados dispon&iacute;veis na tabela'),('number','N&uacute;mero','N&uacute;mero'),('optional','Este campo es opcional.','Campo Opcional'),('others_ext','Otras extensiones','Outros ramais'),('panel','Panel','Painel'),('Partially Listened','Parcialmente escuchado','Parcialmente ouvido'),('pattern','Patr&oacute;n','Padr&atilde;o'),('pause','Pausar','Pausa'),('paused','Pausado','Pausado'),('pin','Pin','Pin'),('play_audio','Reproducir audio','Reproduzir Audio'),('previous','Anterior','Anterior'),('quantity','Cantidad','Quantidade'),('queue','Cola','Fila'),('queue:','Cola:','Fila:'),('queues','Colas','Filas'),('queues_stats_from_tooltip','Fecha y horario de inicio de b&uacute;squeda','Data e hor&aacute;rio de inicio da pesquisa'),('queues_stats_from_to_invalid','Las fechas son inv&aacute;lidas','As datas n&atilde;o s&atilde;o corretas'),('queues_stats_from_to_invalid_format','Las fechas tienen formato inv&aacute;lido','O formato das datas n&atilde;o &eacute; correto'),('queues_stats_from_to_required','Las fechas son obligatorias','As datas s&atilde;o obrigat&oacute;rias'),('queues_stats_queues_tooltip','Cola a verificar','Fila a verificar'),('queues_stats_queue_invalid','La cola es inv&aacute;lida','A fila n&atilde;o &eacute; correta'),('queues_stats_queue_required','La cola es obligatoria','A fila &eacute; obrigat&oacute;ria'),('queues_stats_to_tooltip','Fecha y horario de fin de b&uacute;squeda','Data e hor&aacute;rio de fim da pesquisa'),('queue_announce_seconds','Segundos de announce frequency','Segundos de announce frequency'),('queue_data','Datos de la cola','Dados da fila'),('queue_position','Posici&oacute;n de fila','Posi&ccedil;&atilde;o da fila'),('queue_report_callduration','Duracion de la llamada','Dura&ccedil;&atilde;o'),('queue_report_caller','Origen','Origem'),('queue_report_date','Fecha','Data'),('queue_report_endcall','Extension','Ramal'),('queue_report_getReport_from_to_invalid','Fechas invalidas, la fecha desde debe ser menor a fecha hasta','Invalid date'),('queue_report_getReport_from_to_invalid_format','Formato de fechas invalido','Invalid date format'),('queue_report_getReport_from_to_invalid_range','Rango de fechas invalido','Invalid date range'),('queue_report_getReport_from_to_required','Las fechas no pueden estar vacias','Date from and date to cannot be empty'),('queue_report_getReport_queue_doesnt_exist','La fila no existe','Queue doesnt exist'),('queue_report_holdtime','Espera','Espera'),('queue_report_keypressed','Teclas presionadas','Pressionada'),('queue_report_name','Nombre','Nome'),('queue_report_status','Estado de la llamada','Status'),('queue_report_title','Reporte por fila','Relat&oacute;rio da fila'),('queue_ringinuse','Ring in use','Ring in use'),('queue_stats','Estad&iacute;sticas de Cola','Estat&iacute;sticas da Fila'),('queue_tooltip','Seleccione la fila que utilizar&aacute; para la campa&ntilde;a.','Escolha a fila que receber&aacute; as liga&ccedil;&otilde;es da Campanha.'),('Reached','Alcanzado','Alcanzado'),('refresh_note','La tabla no ser&aacute; actualizada hasta que recargue la p&aacute;gina','A tabela n&atilde;o ser&aacute; atualizada at&eacute; que vo&ccedil;&eacute; atualize a p&aacute;gina'),('reminders_date_tooltip','Fecha y horario en que se realizar&aacute; la llamada','Data e hor&aacute;rio em que ser&aacute; feita a liga&ccedil;&atilde;o'),('reminders_from_exten_tooltip','Extensi&oacute;n que generar&aacute; la llamada','Ramal que gerar&aacute; a liga&ccedil;&atilde;o'),('reminders_save_created_ok','El Recordatorio fue creado con &eacute;xito','O Lembrete foi criado com sucesso'),('reminders_save_date_invalid','La fecha no es correcta','A data n&atilde;o &eacute; correta'),('reminders_save_date_invalid_format','El formato de fecha no es correcto','O formato de data n&atilde;o &eacute; correto'),('reminders_save_date_required','La fecha del recordatorio es obligatoria','A data do lembrete &eacute; obrigat&oacute;ria'),('reminders_save_edited_ok','El Recordatorio fue actualizado con &eacute;xito','O Lembrete foi editado com sucesso'),('reminders_save_from_invalid','La extensi&oacute;n de origen no es correcta','O ramal de origem n&atilde;o &eacute; correto'),('reminders_save_from_required','La extensi&oacute;n de origen es obligatoria','O ramal de origem &eacute; obrigat&oacute;ria'),('reminders_save_sound_invalid_format_file','El formato del archivo de audio no es correcto','O formato de arquivo de &aacute;udio n&atilde;o &eacute; correto'),('reminders_save_sound_required','El archivo de audio es obligatorio','O arquivo de &aacute;udio &eacute; obrigat&oacute;rio'),('reminders_save_sound_uploading','No se pudo subir el archivo de audio','N&atilde;o &eacute; poss&iacute;vel fazer o upload do arquivo de &aacute;udio'),('reminders_save_to_exten_invalid','La extensi&oacute;n de destino no es correcta','O ramal de destino n&atilde;o &eacute; correto'),('reminders_save_to_exten_invalid_format','El formato de extensiones de destino no es correcto','O formato do ramal de destinon&atilde;o &eacute; correto'),('reminders_save_to_exten_required','La extensi&oacute;n de destino es obligatoria','O ramal de destino &eacute; obrigat&oacute;rio'),('reminders_sound_tooltip','Audio que ser&aacute; reproducido como mensaje','Audio a ser reproduzido como mensagem'),('reminders_to_exten_tooltip','Destino que recibir&aacute; el recordatorio','Destino que receber&aacute; o lembrete'),('repeated_name','El nombre ingresado ya existe','O nome inserido j&aacute; existe'),('required','Campos obligatorios','Campos obrigat&oacute;rios'),('responses','Respuestas','Respostas'),('responses_stats','Estad&iacute;sticas de Respuestas','Estat&iacute;sticas de Respostas'),('restrictions','Restricciones','Restri&ccedil;&otilde;es'),('restrictions_exten','Restricci&oacute;n - Extensi&oacute;n','Restri&ccedil;&atilde;o - Ramal'),('restrictions_form_dg','GRUPOS DE DESTINO','GRUPOS DE DESTINO'),('restrictions_form_pattern','Ingrese el Patr&oacute;n','Cadastre o Padr&atilde;o'),('restrictions_form_sala','Sala de Conferencia','Sala de Confer&ecirc;ncia'),('restrictions_note','Puede ingresar un Patr&oacute;n, opciones predeterminadas como Correo de Voz o Sala de Conferencia o bien elegir un Grupo de Destino. Seleccione tambi&eacute;n su habilitaci&oacute;n, si marca la opci&oacute;n pin estar&aacute; permitiendo la llamada solo','Pode inserir um Padr&atilde;o, op&ccedil;&otilde;es padr&otilde;es como Correio de Voz ou Sala de Confer&ecirc;ncia, ou escolher um Grupo de Destinos. Selecione tamb&eacute;m a habilita&ccedil;&atilde;o ou rejei&ccedil;&atilde;o do destino, e se desejado,'),('restrictions_save_allow_invalid','El valor del campo Permitir no es v&aacute;lido','O valor do campo Permitir n&atilde;o &eacute; v&aacute;lido'),('restrictions_save_created_ok','La Restricci&oacute;n fue creada con &eacute;xito','A Restri&ccedil;&atilde;o foi criada com sucesso'),('restrictions_save_destination_invalid','El destino no es correcto','O destino n&atilde;o &eacute; correto'),('restrictions_save_edited_ok','La Restricci&oacute;n fue editada con &eacute;xito','A Restri&ccedil;&atilde;o foi editada com sucesso'),('restrictions_save_entity_incorrect','El ID de la entidad no es correcto','O ID da entidade n&atilde;o &eacute; correto'),('restrictions_save_entity_invalid','El ID de la entidad no es correcto','O ID da entidade n&atilde;o &eacute; correto'),('restrictions_save_pattern_invalid','El patr&oacute;n ingresado no es v&aacute;lido','O padr&atilde;o inserido n&atilde;o &eacute; correto'),('restrictions_save_pattern_required','El patr&oacute;n es obligatorio','O padr&atilde;o &eacute; obrigat&oacute;rio'),('restrictions_save_pin_invalid','El pin ingresado no es v&aacute;lido','O pino inserido n&atilde;o &eacute; v&aacute;lido'),('restrictions_save_repeated_restriction','Ya existe una Restricci&oacute;n con esos campos','J&aacute; existe uma Restri&ccedil;&atilde;o com esses campos'),('resultCode','C&oacute;digo de conversi&oacute;n','C&oacute;digo de Convers&atilde;o'),('retries','Reintentos','Tentativas'),('retries_tooltip','Elija la cantidad de reintentos que realizar&aacute; la campa&ntilde;a cuando no pueda contactar un n&uacute;mero. Por defecto el valor es 0, es decir no har&aacute; reintentos.','Escolha a quantidade de tentativas de contato a realizar para cada n&uacute;mero. Valor padr&atilde;o: 0 = n&atilde;o tentar novamente.'),('Ring timeout','Tiempo limite de timbre','Tempo limite do toque'),('saturday','S&aacute;bado','S&aacute;bado'),('servers_Port_tooltip','Editar Sip Routes','Editar Sip Routes'),('servers_save_name_invalid','El nombre del Server no es correcto','O nome do Servidor n&atilde;o &eacute; correto'),('servers_save_name_repeated','Ya existe un Server con ese nombre','J&aacute; existe um Servidor com esse nome'),('servers_save_name_required','El nombre del Server es obligatorio','O nome do Servidor &eacute; obrigat&oacute;rio'),('servers_save_port','El puerto no es correcto','A porta n&atilde;o &eacute; correta'),('server_IP','Direcci&oacute;n IP o Dominio','Endere&ccedil;o IP ou Dom&iacute;nio'),('server_IP_tooltip','Ej. 185.168.0.223','Ej. 185.168.0.223'),('server_Port','Puerto','Porta'),('server_Port_tooltip','S&oacute;lo n&uacute;meros','Somente n&uacute;meros'),('siproutes_comment_required','Ingrese un comentario.','Insira um coment&aacute;rio.'),('siproutes_delete_cant_deleted_siproute','No se pudo borrar el Sip Route.','N&atilde;o foi poss&iacute;vel excluir o Sip Route.'),('siproutes_delete_doesnt_exist_siproute','No existe el Sip Route','O Sip Route n&atilde;o existe.'),('siproutes_delete_doesnt_load_siproute','No se carg&oacute; el Sip Route','O Sip Route n&atilde;o foi carregado.'),('siproutes_enabled_required','Campo obligatorio.','Campos obrigat&oacute;rio.'),('siproutes_pattern','Ingrese un patr&oacute;n.','Insira um patr&atilde;o'),('siproutes_pattern_required','Ingrese un patr&oacute;n.','Insira um patr&atilde;o'),('siproutes_title','Sip routes','Sip routes'),('siproutes_translation','Ingrese una traducci&oacute;n.','Insira uma tradu&ccdeil;&atilde;o.'),('siproutes_translation_required','Ingrese una traducci&oacute;n.','Insira uma tradu&ccdeil;&atilde;o.'),('siproutes_trunkid_required','Ingrese un ID de tronco','Insira um ID de tronco'),('siprouts_comment','Ingrese un comentario','Insira um coment&aacute;rio'),('siprouts_enabled','Seleccione','Seleccione'),('siprouts_trunkId','Ingrese un ID de tronco','Insira um ID de tronco'),('sound','Grabaci&oacute;n','Graba&ccedil;&atilde;o'),('sound_format_note','Archivos (.wav) en formato PCM, 8Khz, 16 bits, mono y tama&ntilde;o m&aacute;ximo de 2Mb','Arquivos (.wav) devem ficar no formato PCM, 8Khz, 16 bits, mono e tamanho m&aacute;ximo de 2Mb'),('sound_tooltip','Elija el archivo de audio en formato wav que se utilizar&aacute; para reproducir en la campa&ntilde;a.','Escolha o arquivo em formato wav que ser&aacute; reproduzido na Campanha.'),('speed_dial','Marcado R&aacute;pido','Discagem R&aacute;pida'),('start','Comenzar','Come&ccedil;ar'),('stats','Estad&iacute;sticas','Estat&iacute;sticas'),('status','Estado','Status'),('statusCode','C&oacute;digo de estado','C&oacute;digo de Status'),('stop','Detener','Deter'),('sunday','Domingo','Domingo'),('tempos','Horarios','Tempo'),('thursday','Jueves','Quinta'),('timeout','Timeout','Timeout'),('timeout_tooltip','Elija el tiempo de ring que se utilizar&aacute; en cada llamada. Por defecto este valor es de 30 segundos.','Escolha o timeout de cada chamada. Padr&atilde;o: 30seg.'),('total_duration','Duraci&oacute;n total de llamadas','Dura&ccedil;ao total de chamadas'),('total_holdtime','Duraci&oacute;n total de llamadas en espera','Dura&ccedil;ao total de espera em chamadas'),('trunk','Troncal','Tronco'),('trunks','Trunks','Troncos'),('trunks_corporation_tooltip','Corporaci&oacute;n que recibir&aacute; el Trunk','Corpora&ccedil;&atilde;o que receber&aacute; o Tronco'),('trunks_corp_Enabled_tooltip','Si se deshabilita el Trunk, no se podr&aacute;n realizar/recibir llamadas por &eacute;l','Se o Tronco for desabilitado, n&atilde;o poder&atilde;o ser feitas/recebidas liga&ccedil;&otilde;es atrav&eacute;s dele'),('trunks_number_tooltip','N&uacute;mero en el cu&aacute;l se recibir&aacute;n las llamadas. Funciona como USERNAME de registro SIP, y debe estar en el mismo formato en que env&iacute;e el servidor','N&uacute;mero de recebemento das liga&ccedil;&otilde;es. Funciona como USERNAME de autentica&ccedil;&atilde;o e deve ficar no mesmo formato em que o Servidor envia as liga&ccedil;&otilde;es'),('trunks_Outgoing_enabled_tooltip','Permite salida de llamadas por el trunk. Deshabilitar para crear un trunk que solo permite llamadas entrantes','Permite a sa&iacute;da de liga&ccedil;&otilde;es atrav&eacute;s do Tronco. Desabilitar para criar um tronco que permita apenas liga&ccedil;&otilde;es entrantes'),('trunks_Pass_tooltip','Password de Registro en el Server','Senha de registro no Servidor'),('trunks_save_action_invalid','La acci&oacute;n del troncal no es correcta','A a&ccedil;&atilde;o do tronco n&atilde;o &eacute; correta'),('trunks_save_corpId_invalid','El ID de la corporaci&oacute;n no es correcto','O ID do corpora&ccedil;&atilde;o n&atilde;o &eacute; correto'),('trunks_save_created_ok','El troncal fue creado con &eacute;xito','O tronco foi criado com sucesso'),('trunks_save_edited_ok','El troncal fue actualizado con &eacute;xito','O tronco foi editado com sucesso'),('trunks_save_number_invalid','El n&uacute;mero del troncal no es correcto','O n&uacute;mero do tronco n&atilde;o &eacute; correto'),('trunks_save_number_repeated','Ya existe un troncal con ese n&uacute;mero','J&aacute; existe um tronco com esse n&uacute;mero'),('trunks_save_number_required','El n&uacute;mero del troncal es obligatorio','O n&uacute;mero do tronco &eacute; obrigat&oacute;rio'),('trunks_save_password_invalid','La contrase&ntilde;a no es correcta','A senha n&atilde;o &eacute; correta'),('trunks_save_password_required','La contrase&ntilde;a del troncal es obligatoria','A senha do tronco &eacute; obrigat&oacute;ria'),('trunks_save_serverId_invalid','El ID del servidor no es correcto','O ID do servidor n&atilde;o &eacute; correto'),('trunks_server_tooltip','Server','Servidor'),('trunk_Outgoing','Salida Habilitada','Sa&iacute;da habilitada'),('trunk_Pass','Contrase&ntilde;a','Senha'),('trunk_tooltip','Seleccione el troncal por el cual se realizar&aacute;n las llamadas.','Escolha o tronco para enviar as liga&ccedil;&otilde;es.'),('tuesday','Martes','Ter&ccedil;a'),('unavailable','No disponible','Indispon&iacute;vel'),('uras','IVRs','URA'),('users','Usuarios','Usu&aacute;rios'),('users_corporation_tooltip','Corporaci&oacute;n a la que pertenece el usuario','Corpora&ccedil;&atilde;o &agrave; qual pertence o usu&aacute;rio'),('users_corp_Enabled_tooltip','Si se deshabilita el usuario, se le negar&aacute; el acceso a la web de Centrex','Se o usu&aacute;rio for desabilitado, ficar&aacute; sem acesso web'),('users_save_corpId_invalid','El ID de la corporaci&oacute;n no es correcto','O ID da corpora&ccedil;&atildes;o n&atilde;o &eacute; correto'),('users_save_created_ok','El usuario fue creado con &eacute;xito','O usu&aacute;rio foi criado com sucesso'),('users_save_edited_ok','El usuario fue actualizado con &eacute;xito','O usu&aacute;rio foi criado com sucesso'),('users_save_email_invalid','El e-mail no es correcto','O email n&atilde;o &eacute; correto'),('users_save_password_invalid','La contrase&ntilde;a no es correcta','A senha n&atilde;o &eacute; correta'),('users_save_password_required','La contrase&ntilde;a del usuario es obligatoria','A senha do Usu&aacute;rio &eacute; obrigat&oacute;ria'),('users_save_userlevel_invalid','El nivel de usuario no es correcto','O n&iacute;vel do Usu&aacute;rio n&atilde;o &eacute; correto'),('users_save_userlevel_not_allowed','El nivel de usuario no est&aacute; permitido','O n&iacute;vel do Usu&aacute;rio n&atilde;o &eacute; permitido'),('users_save_userweb_invalid','El nombre del Usuario no es correcto','O nome do Usuario n&atilde;o &eacute; correto'),('users_save_userweb_repeated','Ya existe un Usuario con ese nombre','J&aacute; existe um Usu&aacute;rio com esse nome'),('users_save_userweb_required','El nombre del Usuario es obligatorio','O nome do Usu&aacute;rio &eacute; obrigat&oacute;rio'),('users_trunk_Pass_tooltip','Password de acceso web','Senha de acesso web'),('users_user_email_tooltip','Email del usuario. Esta direcci&oacute;n tambi&eacute;n ser&aacute; utilizada para el env&iacute;o de mensajes voicemail','Email do usu&aacute;rio. Esse endere&ccedil;o ser&aacute; tamb&eacute;m utilizado para envio de mensagens de voicemail'),('users_user_Level_tooltip','Nivel de permisos del usuario','N&iacute;vel de permiss&otilde;es do usu&aacute;rio'),('users_user_web_tooltip','Nombre de usuario para acceso web','Nome de usu&aacute;rio para acesso web'),('user_Level','Nivel','N&iacute;vel'),('user_level_administrador','Administrador','Administrador'),('user_level_supervisor','Supervisor','Supervisor'),('user_level_usuario','Usuario','Usu&aacute;rio'),('user_mail','E-mail','E-mail'),('user_token','Usuario/Token','Usu&aacute;rio/Token'),('user_web','Usuario web','Usu&aacute;rio web'),('view_stats','Ver estad&iacute;sticas','Ver Estat&iacute;sticas'),('voicemail','Voicemail','Correio de voz'),('wednesday','Mi&eacute;rcoles','Quarta'),('yes','Si','Sim');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trunks`
--

DROP TABLE IF EXISTS `trunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trunks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) DEFAULT NULL,
  `pass` varchar(255) NOT NULL,
  `serID` int(11) NOT NULL,
  `corpID` int(11) NOT NULL,
  `enabled` int(1) NOT NULL DEFAULT '1',
  `action` varchar(255) DEFAULT NULL,
  `outgoing` int(1) NOT NULL DEFAULT '1',
  `preference` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `number_serID` (`number`,`serID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trunks`
--

LOCK TABLES `trunks` WRITE;
/*!40000 ALTER TABLE `trunks` DISABLE KEYS */;
INSERT INTO `trunks` VALUES (2,'55354701650','55354718259',1,1,1,NULL,1,NULL);
/*!40000 ALTER TABLE `trunks` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%.%.%.%`*/ /*!50003 TRIGGER `trunksInsert` AFTER INSERT ON `trunks` FOR EACH ROW BEGIN
   DECLARE ip VARCHAR(330) DEFAULT (SELECT IP from servers where ID = NEW.serID);
	DECLARE puerta VARCHAR(330) DEFAULT (SELECT port from servers where ID = NEW.serID);
	DECLARE dtmfmode VARCHAR(500) DEFAULT (SELECT value FROM params WHERE name='dtmfmode' LIMIT 1);
	DECLARE allow VARCHAR(500) DEFAULT (SELECT value FROM params WHERE name='allow' LIMIT 1);
	DECLARE disallow VARCHAR(500) DEFAULT (SELECT value FROM params WHERE name='disallow' LIMIT 1);
	DECLARE qualify VARCHAR(500) DEFAULT (SELECT value FROM params WHERE name='qualify' LIMIT 1);
	DECLARE `call-limit` VARCHAR(500) DEFAULT (SELECT value FROM params WHERE name='call-limit' LIMIT 1);
	DECLARE allowtransfer VARCHAR(500) DEFAULT (SELECT value FROM params WHERE name='allowtransfer' LIMIT 1);
	DECLARE disabled INT DEFAULT 1;
	DECLARE serverIp VARCHAR(330);
   SET serverIp = CONCAT(ip, ':', puerta);

   INSERT INTO ps_aors(id, max_contacts, qualify_frequency) VALUES 
	(NEW.number, '1', qualify);
   INSERT INTO ps_auths
	(id, auth_type, `password`, username) 
	VALUES 
	(NEW.number, 'userpass', NEW.pass, NEW.number);
   INSERT INTO ps_endpoints
   (id, context, disallow, allow, aors, outbound_auth, rewrite_contact, callerid, from_user, dtmf_mode, allow_transfer) 
   VALUES 
   (NEW.number, new.Corpid, disallow, allow, NEW.number, NEW.number, 'yes', NEW.number, NEW.number, dtmfmode, allowtransfer);
   INSERT INTO ps_endpoint_id_ips(id, `endpoint`, `match`) VALUES (NEW.number,NEW.number,serverIp);
   INSERT INTO ps_contacts(id, uri, reg_server, `endpoint`) VALUES 
   (new.number, concat(new.number, '@', new.number, ':', ip, '/', new.pass), ip, NEW.number);
   INSERT INTO ps_registrations
   (id, client_uri, outbound_auth, retry_interval, transport, line, endpoint, contact_user, server_uri) 
   VALUES 
   (NEW.number, concat('sip:', NEW.number, '@', serverIp), NEW.number, 60, 'transport-udp', 'yes', NEW.number, NEW.number, CONCAT('sip:', serverIp));
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%.%.%.%`*/ /*!50003 TRIGGER `trunksUpdate` AFTER UPDATE ON `trunks` FOR EACH ROW BEGIN 
    DECLARE ip VARCHAR(330) DEFAULT (SELECT IP from servers where ID = NEW.serID);
	DECLARE puerta VARCHAR(330) DEFAULT (SELECT port from servers where ID = NEW.serID);
    DECLARE serverIp VARCHAR(330);
    SET serverIp = CONCAT(ip, ':', puerta);

    update ps_aors set id = new.number where id = old.number;
    update ps_auths set id = new.number, `password`  = new.pass, username = new.number where id = old.number;
    update ps_endpoints set id = new.number, aors =  new.number, outbound_auth = new.number, callerid = new.number, from_user = new.number where id = old.number;
    update ps_endpoint_id_ips set id = new.number, `endpoint` = new.number, `match` = serverIp where id = old.number;
    update ps_contacts set id = new.number, uri = concat(new.number, '@', new.number, ':', ip, '/', new.pass), reg_server = ip, `endpoint` = new.number;
    update ps_registrations set 
    id = new.number, 
    client_uri = CONCAT('sip:', new.number, '@', serverIp),
    outbound_auth = new.number,
    `endpoint` = new.number,
    contact_user = new.number,
    server_uri = CONCAT('sip:', serverIp);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%.%.%.%`*/ /*!50003 TRIGGER `trunksDelete` BEFORE DELETE ON `trunks` FOR EACH ROW BEGIN
	DELETE FROM ps_aors WHERE id = OLD.number;
	DELETE FROM ps_auths WHERE id = OLD.number;
	DELETE FROM ps_endpoints WHERE id = OLD.number;
	DELETE FROM ps_endpoint_id_ips WHERE id = OLD.number;
	DELETE FROM ps_contacts WHERE id = OLD.number;
	DELETE FROM ps_registrations WHERE id = OLD.number;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `nick` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `corpID` int(11) DEFAULT NULL,
  `level` varchar(255) NOT NULL,
  `enabled` int(1) NOT NULL DEFAULT '1',
  `mail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `usrNick` (`nick`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'supvoip','22123',0,'supervisor',1,'support@voipgroup.com'),(2,'testing','testing',10,'administrador',1,''),(5,'testing1','testing1',10,'administrador',1,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versiondb`
--

DROP TABLE IF EXISTS `versiondb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versiondb` (
  `label` varchar(50) NOT NULL,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versiondb`
--

LOCK TABLES `versiondb` WRITE;
/*!40000 ALTER TABLE `versiondb` DISABLE KEYS */;
INSERT INTO `versiondb` VALUES ('PACKAGE DATABASE','57'),('VERSION DATABASE','4.0');
/*!40000 ALTER TABLE `versiondb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voicemail`
--

DROP TABLE IF EXISTS `voicemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voicemail` (
  `uniqueid` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(80) NOT NULL,
  `mailbox` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `fullname` varchar(80) DEFAULT NULL,
  `alias` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `pager` varchar(80) DEFAULT NULL,
  `attach` enum('yes','no') DEFAULT NULL,
  `attachfmt` varchar(10) DEFAULT NULL,
  `serveremail` varchar(80) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `tz` varchar(30) DEFAULT NULL,
  `deletevoicemail` enum('yes','no') DEFAULT NULL,
  `saycid` enum('yes','no') DEFAULT NULL,
  `sendvoicemail` enum('yes','no') DEFAULT NULL,
  `review` enum('yes','no') DEFAULT NULL,
  `tempgreetwarn` enum('yes','no') DEFAULT NULL,
  `operator` enum('yes','no') DEFAULT NULL,
  `envelope` enum('yes','no') DEFAULT NULL,
  `sayduration` int(11) DEFAULT NULL,
  `forcename` enum('yes','no') DEFAULT NULL,
  `forcegreetings` enum('yes','no') DEFAULT NULL,
  `callback` varchar(80) DEFAULT NULL,
  `dialout` varchar(80) DEFAULT NULL,
  `exitcontext` varchar(80) DEFAULT NULL,
  `maxmsg` int(11) DEFAULT NULL,
  `volgain` decimal(5,2) DEFAULT NULL,
  `imapuser` varchar(80) DEFAULT NULL,
  `imappassword` varchar(80) DEFAULT NULL,
  `imapserver` varchar(80) DEFAULT NULL,
  `imapport` varchar(8) DEFAULT NULL,
  `imapflags` varchar(80) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`uniqueid`),
  KEY `voicemail_mailbox` (`mailbox`),
  KEY `voicemail_context` (`context`),
  KEY `voicemail_mailbox_context` (`mailbox`,`context`),
  KEY `voicemail_imapuser` (`imapuser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voicemail`
--

LOCK TABLES `voicemail` WRITE;
/*!40000 ALTER TABLE `voicemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `voicemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yearmonth`
--

DROP TABLE IF EXISTS `yearmonth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yearmonth` (
  `yearmonthid` varchar(6) NOT NULL,
  `iscreated` int(11) DEFAULT '0',
  PRIMARY KEY (`yearmonthid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yearmonth`
--

LOCK TABLES `yearmonth` WRITE;
/*!40000 ALTER TABLE `yearmonth` DISABLE KEYS */;
/*!40000 ALTER TABLE `yearmonth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-08 11:22:31
