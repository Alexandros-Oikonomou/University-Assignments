DROP SCHEMA IF EXISTS busdb;
CREATE SCHEMA busdb;
USE busdb;

CREATE DATABASE  IF NOT EXISTS `busdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `busdb`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: busdb
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB

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
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus` (
  `busID` int(11) NOT NULL,
  `license_plates` varchar(35) DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `class` enum('standard','luxury','premium') NOT NULL,
  `model` varchar(35) NOT NULL,
  PRIMARY KEY (`busID`),
  UNIQUE KEY `license_plates_UNIQUE` (`license_plates`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (1,'NIA4567',52,'luxury','Tourismo RH'),(2,'NAI3466',52,'standard','Tourismo'),(3,'NII9082',20,'premium','Tourismo RH'),(4,'NIP9318',52,'premium','Tourismo RH'),(5,'NIO1585',20,'premium','T1'),(6,'NAX1452',52,'standard','Tourismo'),(7,'XII4527',20,'premium','Tourismo RH'),(8,'XIN7585',52,'standard','T1'),(9,'NIP2314',20,'standard','T1'),(10,'XAI2134',52,'standard','Tourismo RH'),(11,'NIE3345',20,'premium','Tourismo RH'),(12,'NII3245',52,'premium','Tourismo'),(13,'XAO7854',52,'premium','Tourismo RH'),(14,'XOA8592',52,'standard','T1'),(15,'NXE1345',52,'standard','Tourismo RH'),(16,'NKI1234',20,'luxury','Tourismo RH'),(17,'NKP5676',20,'luxury','T1'),(18,'PKN3430',52,'luxury','Tourismo'),(19,'KIO4322',20,'standard','Tourismo'),(20,'NAA1234',52,'premium','Tourismo RH');
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Bus_BEFORE_INSERT`
BEFORE INSERT ON `busdb`.`bus`
FOR EACH ROW
BEGIN
	IF (NEW.busID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (NEW.capacity < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (LENGTH(NEW.license_plates) <> 7) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Bus_BEFORE_UPDATE`
BEFORE UPDATE ON `busdb`.`bus`
FOR EACH ROW
BEGIN
	IF (NEW.busID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (NEW.capacity < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (LENGTH(NEW.license_plates) <> 7) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `full_name` varchar(35) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Alexandros Oikonomou','6970624528',22),(2,'Demis Dimitriadis','6949166249',65),(3,'Euaggelia Mastropaulou','6984178328',27),(4,'Anastasia Mpoumpopoulou','6942440494',28),(5,'Dimos Katsaros','6976907885',20),(6,'Nikos Moskofidis','6989873604',25),(7,'Alexandros Oikonomou','6970624529',25),(8,'Alexandros Petridis','6949390541',30),(9,'Christos Athanasiadis','6936033672',45),(10,'Foris Amanatidis','6936033673',33),(11,'Paulos Mpeltes','6936033674',52),(12,'Ioanna Oikonomou','6936033675',30),(13,'Christos Kechagias','6936954076',25),(14,'Athanasios Loules','6955033677',18),(15,'Vaggelis Loules','6936563678',18),(16,'Alexandros Kosmas','6939833679',23),(17,'Petros Koumantzias','6936033680',24),(18,'Andreas Mpallos','6936253681',24),(19,'Nikoleta Mpellou','6936066682',22),(20,'Eirini Xrysikopoulou','6936443683',23),(21,'Dimitra Tousi','6977033684',36),(22,'Themis Diamantopoulos','6974033685',27),(23,'Stavros Dokouzgiannis','6947033686',60),(24,'Dimitris Rekanos','6936025687',46),(25,'Spyros Poulis','6936036388',50),(26,'Kostantinos Tzinis','6936033689',55),(27,'Antonis Gogas','6936014690',32),(28,'Stavros Madanis','6936033691',33),(29,'Melina Kyriakidou','6936038692',25),(30,'Iordanis Mpoulis','6938033693',26);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Customer_BEFORE_INSERT`
BEFORE INSERT ON `busdb`.`customer`
FOR EACH ROW
BEGIN
	IF (NEW.customerID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (LENGTH(NEW.phone_number) <> 10) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (NEW.age < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Customer_BEFORE_UPDATE`
BEFORE UPDATE ON `busdb`.`customer`
FOR EACH ROW
BEGIN
	IF (NEW.customerID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (LENGTH(NEW.phone_number) <> 10) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (NEW.age < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destination` (
  `destinationID` int(11) NOT NULL,
  `city_name` varchar(35) NOT NULL,
  `country_name` varchar(35) NOT NULL,
  PRIMARY KEY (`destinationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` VALUES (1,'Barcelona','Spain'),(2,'Milan','Italy'),(3,'Prague','Czech Republic'),(4,'Rome','Italy'),(5,'Hockenheim','Germany'),(6,'Rotterdam','Netherlands'),(7,'Strasbourg','France'),(8,'Berlin','Germany'),(9,'Paris','France'),(10,'Lyon','France'),(11,'Munich','Germany'),(12,'London','England'),(13,'Manchester','England'),(14,'Florence','Italy'),(15,'Amsterdam','Netherlands'),(16,'Edinburgh','Scotland'),(17,'Galway ','Ireland'),(18,'Nice ','France'),(19,'Warsaw','Poland'),(20,'Stockholm ','Sweden');
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Destination_BEFORE_INSERT`
BEFORE INSERT ON `busdb`.`destination`
FOR EACH ROW
BEGIN
	IF (NEW.destinationID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Destination_BEFORE_UPDATE`
BEFORE UPDATE ON `busdb`.`destination`
FOR EACH ROW
BEGIN
	IF (NEW.destinationID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `destinationsofcustomer`
--

DROP TABLE IF EXISTS `destinationsofcustomer`;
/*!50001 DROP VIEW IF EXISTS `destinationsofcustomer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `destinationsofcustomer` AS SELECT 
 1 AS `full_name`,
 1 AS `city_name`,
 1 AS `country_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver` (
  `driverID` int(11) NOT NULL,
  `car_license_ID` varchar(11) NOT NULL,
  `Employee_employeeID` int(11) NOT NULL,
  PRIMARY KEY (`Employee_employeeID`),
  UNIQUE KEY `driverID_UNIQUE` (`driverID`),
  UNIQUE KEY `car_license_ID_UNIQUE` (`car_license_ID`),
  CONSTRAINT `fk_Driver_Employee1` FOREIGN KEY (`Employee_employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'B077RRE2155',7),(2,'A367REE2558',8),(3,'O339GEY2837',9),(4,'P118REY1948',10),(5,'P481REG1948',11),(6,'M095GET1418',12),(7,'O339GEY2389',13),(8,'M061GET1418',14),(9,'M095GET2543',15),(10,'P228REY1948',20),(11,'P118REY1148',21),(12,'B028RRE2155',22),(13,'A322REE2558',23),(14,'M095SAS1418',24),(15,'B077RGE2145',25);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Driver_BEFORE_INSERT`
BEFORE INSERT ON `busdb`.`driver`
FOR EACH ROW
BEGIN
	IF (NEW.driverID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    IF (NEW.car_license_ID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Driver_BEFORE_UPDATE`
BEFORE UPDATE ON `busdb`.`driver`
FOR EACH ROW
BEGIN
	IF (NEW.driverID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    IF (NEW.car_license_ID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `full_name` varchar(35) NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `salary` int(11) NOT NULL,
  `contract_duration` int(11) NOT NULL,
  `Office_officeID` int(11) NOT NULL,
  PRIMARY KEY (`employeeID`),
  KEY `fk_Employee_Office_idx` (`Office_officeID`),
  CONSTRAINT `fk_Employee_Office` FOREIGN KEY (`Office_officeID`) REFERENCES `office` (`officeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Nick Galis',28,'6984585957',820,24,1),(2,'George Pantelis',27,'6987485968',640,36,1),(3,'Giannis Xasapis',31,'6921748569',640,24,1),(4,'Fotis Athanasiou',42,'6985721522',1000,12,1),(5,'Xaris Aleksiou',53,'6923663571',820,24,1),(6,'Marios Almpanis',37,'6982175864',640,12,1),(7,'Alekos Kapoutzis',41,'6985721664',820,36,1),(8,'Tzimis Themis',29,'6983724718',640,36,1),(9,'Christos Athanas',32,'6981275802',820,12,1),(10,'Giannis Panagiotou',35,'6982741513',640,24,1),(11,'Nikos Arnatolis',40,'6937489134',1000,24,1),(12,'Alekos Giannou',45,'6957859624',820,48,1),(13,'Vasileios Makrhs',51,'6958741526',640,24,1),(14,'Ioannis Giannopoulos',35,'6958741527',640,12,1),(15,'Sotirios Langaris',58,'6958741528',640,12,1),(16,'Giannis Giannou',24,'6958741529',820,24,2),(17,'Makis Dimakis',35,'6958741530',820,24,2),(18,'Foteinh Makrh',24,'6958741531',1000,36,2),(19,'Kleanthi Ioannou',42,'6958741532',640,12,2),(20,'Katerina Maki',47,'6958741533',820,36,2),(21,'Maria Ntouma',25,'6958741534',640,24,2),(22,'Marios Alioni',36,'6958741535',640,24,2),(23,'Ksanti Fotiadou',51,'6958741536',820,36,2),(24,'Periklhs Perhs',28,'6958741537',640,12,2),(25,'Fotis Xarikliou',48,'6958741538',820,12,2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Employee_BEFORE_INSERT`
BEFORE INSERT ON `busdb`.`employee`
FOR EACH ROW
BEGIN
    IF (NEW.employeeID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    IF (NEW.age < 18) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    
    IF (NEW.salary < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    
	IF (NEW.contract_duration < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Employee_BEFORE_UPDATE`
BEFORE UPDATE ON `busdb`.`employee`
FOR EACH ROW
BEGIN
    IF (NEW.employeeID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    IF (NEW.age < 18) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    
    IF (NEW.salary < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    
	IF (NEW.contract_duration < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `employeesinoffice`
--

DROP TABLE IF EXISTS `employeesinoffice`;
/*!50001 DROP VIEW IF EXISTS `employeesinoffice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `employeesinoffice` AS SELECT 
 1 AS `full_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `includes`
--

DROP TABLE IF EXISTS `includes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `includes` (
  `Trip_tripID` int(11) NOT NULL,
  `Destination_destinationID` int(11) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `num_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`Trip_tripID`,`Destination_destinationID`),
  KEY `fk_Trip_has_Destination_Destination1_idx` (`Destination_destinationID`),
  KEY `fk_Trip_has_Destination_Trip1_idx` (`Trip_tripID`),
  CONSTRAINT `fk_Trip_has_Destination_Trip1` FOREIGN KEY (`Trip_tripID`) REFERENCES `trip` (`tripID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trip_has_Destination_Destination1` FOREIGN KEY (`Destination_destinationID`) REFERENCES `destination` (`destinationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `includes`
--

LOCK TABLES `includes` WRITE;
/*!40000 ALTER TABLE `includes` DISABLE KEYS */;
INSERT INTO `includes` VALUES (1,1,0,1),(2,5,1,1),(3,4,0,1),(4,6,1,1),(5,8,0,1),(6,1,4,2),(7,9,1,1),(8,3,0,1),(9,8,3,2),(10,10,2,1),(11,16,1,1),(12,18,2,1),(13,19,3,3),(14,2,1,1),(15,4,4,2),(16,14,2,2),(17,13,0,1),(18,18,1,1),(19,19,2,2),(20,20,3,3);
/*!40000 ALTER TABLE `includes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`includes_BEFORE_INSERT`
BEFORE INSERT ON `busdb`.`includes`
FOR EACH ROW
BEGIN
	IF (NEW.duration < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (NEW.num_order < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`includes_BEFORE_UPDATE`
BEFORE UPDATE ON `busdb`.`includes`
FOR EACH ROW
BEGIN
	IF (NEW.duration < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (NEW.num_order < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office` (
  `officeID` int(11) NOT NULL,
  `num_employees` int(11) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `street` varchar(25) NOT NULL,
  `city` varchar(35) NOT NULL,
  `zip` int(11) NOT NULL,
  PRIMARY KEY (`officeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES (1,4,'2310942455','Dagkli 4','Thessaloniki',55337),(2,4,'2374092544','Eparxiaki odos afytou','Afytos',63077),(3,4,'2103482477','Piraios 153','Athens',11854),(4,4,'2310942245','Egnatia 24','Thessaloniki',55337),(5,4,'2374055643','22nd April 45','Polygiros',57006),(6,5,'2103484567','22nd April 45','Athens',11854);
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Office_BEFORE_INSERT`
BEFORE INSERT ON `busdb`.`office`
FOR EACH ROW
BEGIN
	IF (NEW.officeID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    IF (NEW.num_employees < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    
    IF (LENGTH(NEW.phone) <> 10) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    
	IF (LENGTH(NEW.zip) <> 5) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Office_BEFORE_UPDATE`
BEFORE UPDATE ON `busdb`.`office`
FOR EACH ROW
BEGIN
	IF (NEW.officeID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    IF (NEW.num_employees < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    
    IF (LENGTH(NEW.phone) <> 10) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
    
	IF (LENGTH(NEW.zip) <> 5) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `Trip_tripID` int(11) NOT NULL,
  `Customer_customerID` int(11) NOT NULL,
  `price` float NOT NULL,
  `seat_num` int(11) NOT NULL,
  PRIMARY KEY (`Trip_tripID`,`Customer_customerID`),
  KEY `fk_Trip_has_Customer_Customer1_idx` (`Customer_customerID`),
  KEY `fk_Trip_has_Customer_Trip1_idx` (`Trip_tripID`),
  CONSTRAINT `fk_Trip_has_Customer_Customer1` FOREIGN KEY (`Customer_customerID`) REFERENCES `customer` (`customerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trip_has_Customer_Trip1` FOREIGN KEY (`Trip_tripID`) REFERENCES `trip` (`tripID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,150,30),(1,2,200,36),(2,1,150,15),(3,1,150,52),(4,1,150,24),(5,2,200,40),(7,2,200,5),(8,2,200,35),(9,5,200,10),(10,5,200,12),(11,5,200,25),(12,6,300,52),(13,6,300,52),(14,6,300,36),(15,6,300,36),(16,6,300,27),(18,7,250,28),(19,6,300,27),(20,7,250,28);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`reservation_BEFORE_INSERT`
BEFORE INSERT ON `busdb`.`reservation`
FOR EACH ROW
BEGIN
	IF (NEW.price < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (NEW.seat_num < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`reservation_BEFORE_UPDATE`
BEFORE UPDATE ON `busdb`.`reservation`
FOR EACH ROW
BEGIN
	IF (NEW.price < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (NEW.seat_num < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `secretary`
--

DROP TABLE IF EXISTS `secretary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secretary` (
  `secretaryID` int(11) NOT NULL,
  `Wokrplace_phone_line` int(11) NOT NULL,
  `Employee_employeeID` int(11) NOT NULL,
  PRIMARY KEY (`Employee_employeeID`),
  UNIQUE KEY `secretaryID_UNIQUE` (`secretaryID`),
  CONSTRAINT `fk_Secretary_Employee1` FOREIGN KEY (`Employee_employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secretary`
--

LOCK TABLES `secretary` WRITE;
/*!40000 ALTER TABLE `secretary` DISABLE KEYS */;
INSERT INTO `secretary` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,1,16),(8,2,17),(9,3,18),(10,4,19);
/*!40000 ALTER TABLE `secretary` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Secretary_BEFORE_INSERT`
BEFORE INSERT ON `busdb`.`secretary`
FOR EACH ROW
BEGIN
	IF (NEW.secretaryID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Secretary_BEFORE_UPDATE`
BEFORE UPDATE ON `busdb`.`secretary`
FOR EACH ROW
BEGIN
	IF (NEW.secretaryID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `secretary_city`
--

DROP TABLE IF EXISTS `secretary_city`;
/*!50001 DROP VIEW IF EXISTS `secretary_city`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `secretary_city` AS SELECT 
 1 AS `city_name`,
 1 AS `full_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel` (
  `Trip_tripID` int(11) NOT NULL,
  `Driver_Employee_employeeID` int(11) NOT NULL,
  `Bus_busID` int(11) NOT NULL,
  PRIMARY KEY (`Trip_tripID`,`Driver_Employee_employeeID`,`Bus_busID`),
  KEY `fk_Trip_has_Driver_Driver1_idx` (`Driver_Employee_employeeID`),
  KEY `fk_Trip_has_Driver_Trip1_idx` (`Trip_tripID`),
  KEY `fk_Trip_has_Driver_Bus1_idx` (`Bus_busID`),
  CONSTRAINT `fk_Trip_has_Driver_Trip1` FOREIGN KEY (`Trip_tripID`) REFERENCES `trip` (`tripID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trip_has_Driver_Driver1` FOREIGN KEY (`Driver_Employee_employeeID`) REFERENCES `driver` (`Employee_employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trip_has_Driver_Bus1` FOREIGN KEY (`Bus_busID`) REFERENCES `bus` (`busID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` VALUES (1,11,1),(2,12,2),(3,13,3),(4,14,4),(5,15,5),(6,13,6),(7,12,7),(8,11,8),(9,11,9),(10,20,10),(11,21,4),(12,22,5),(13,23,3),(14,24,4),(15,25,20),(16,25,19),(17,24,12),(18,23,15),(19,22,7),(20,21,15);
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trip` (
  `tripID` int(11) NOT NULL,
  `date_of_departure` date NOT NULL,
  `time_of_departure` time NOT NULL,
  `date_of_return` date NOT NULL,
  `time_of_return` time NOT NULL,
  `Secretary_Employee_employeeID` int(11) NOT NULL,
  PRIMARY KEY (`tripID`),
  KEY `fk_Trip_Secretary1_idx` (`Secretary_Employee_employeeID`),
  CONSTRAINT `fk_Trip_Secretary1` FOREIGN KEY (`Secretary_Employee_employeeID`) REFERENCES `secretary` (`Employee_employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,'2020-07-20','08:30:00','2020-07-27','17:30:00',1),(2,'2020-08-17','08:30:00','2020-08-20','18:30:00',2),(3,'2020-08-23','10:30:00','2020-08-30','19:30:00',3),(4,'2020-09-10','08:30:00','2020-09-10','10:30:00',4),(5,'2020-12-20','09:00:00','2020-12-24','09:00:00',5),(6,'2021-03-05','09:00:00','2021-03-10','17:00:00',6),(7,'2021-03-10','09:30:00','2021-03-13','09:00:00',16),(8,'2021-04-15','09:00:00','2021-04-20','19:00:00',19),(9,'2021-05-23','10:00:00','2021-05-30','18:30:00',18),(10,'2021-05-24','11:00:00','2021-05-31','19:30:00',17),(11,'2021-05-30','12:00:00','2021-06-01','20:30:00',19),(12,'2021-06-10','13:00:00','2021-06-14','21:30:00',5),(13,'2021-06-27','14:00:00','2021-06-30','22:30:00',4),(14,'2021-08-10','15:00:00','2021-08-13','13:30:00',1),(15,'2021-08-15','16:00:00','2021-08-20','18:30:00',6),(16,'2021-09-30','17:00:00','2021-10-06','17:30:00',5),(17,'2021-10-31','18:00:00','2021-11-03','09:00:00',4),(18,'2021-11-01','19:00:00','2021-11-08','08:30:00',3),(19,'2021-12-18','20:00:00','2021-12-24','14:30:00',2),(20,'2022-02-03','21:00:00','2022-02-07','16:30:00',1);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Trip_BEFORE_INSERT`
BEFORE INSERT ON `busdb`.`trip`
FOR EACH ROW
BEGIN
	IF (NEW.tripID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (NEW.date_of_departure > NEW.date_of_return) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `busdb`.`Trip_BEFORE_UPDATE`
BEFORE UPDATE ON `busdb`.`trip`
FOR EACH ROW
BEGIN
	IF (NEW.tripID < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
	IF (NEW.date_of_departure > NEW.date_of_return) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'busdb'
--

--
-- Final view structure for view `destinationsofcustomer`
--

/*!50001 DROP VIEW IF EXISTS `destinationsofcustomer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `destinationsofcustomer` AS select `customer`.`full_name` AS `full_name`,`destination`.`city_name` AS `city_name`,`destination`.`country_name` AS `country_name` from ((((`destination` join `includes` on((`includes`.`Destination_destinationID` = `destination`.`destinationID`))) join `trip` on((`trip`.`tripID` = `includes`.`Trip_tripID`))) join `reservation` on((`reservation`.`Trip_tripID` = `trip`.`tripID`))) join `customer` on((`customer`.`customerID` = `reservation`.`Customer_customerID`))) where (`customer`.`customerID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeesinoffice`
--

/*!50001 DROP VIEW IF EXISTS `employeesinoffice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeesinoffice` AS select `employee`.`full_name` AS `full_name` from (`employee` join `office` on((`office`.`officeID` = `employee`.`Office_officeID`))) where (`office`.`officeID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `secretary_city`
--

/*!50001 DROP VIEW IF EXISTS `secretary_city`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `secretary_city` AS select `destination`.`city_name` AS `city_name`,`employee`.`full_name` AS `full_name` from (((`destination` join `includes` on((`destination`.`destinationID` = `includes`.`Destination_destinationID`))) join `trip` on((`includes`.`Trip_tripID` = `trip`.`tripID`))) join `employee` on((`trip`.`Secretary_Employee_employeeID` = `employee`.`employeeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-20 15:55:59
