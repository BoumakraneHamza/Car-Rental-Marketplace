CREATE DATABASE  IF NOT EXISTS `atelier` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `atelier`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: atelier
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `email` varchar(45) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `Prenom` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('O01@email.com','Owner','00','/assets/profile_pics/admin00.jpg');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agence`
--

DROP TABLE IF EXISTS `agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agence` (
  `nom` varchar(45) NOT NULL,
  `num_register` int NOT NULL,
  `address` varchar(45) NOT NULL,
  `email_compte` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `photo` varchar(45) NOT NULL,
  `number_followers` int DEFAULT '0',
  PRIMARY KEY (`nom`),
  UNIQUE KEY `num_register_UNIQUE` (`num_register`),
  KEY `fk_Agence_Utilisateur1_idx` (`email_compte`),
  CONSTRAINT `fk_Agence_Utilisateur1` FOREIGN KEY (`email_compte`) REFERENCES `users` (`email`),
  CONSTRAINT `positive_follow_num` CHECK ((`number_followers` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
INSERT INTO `agence` VALUES ('agence02',52165,'batna','d02@gmail.com','030102301087','/assets/agency_pics/hertz-logo.png',0),('Hertz',1231231,'constantine','d01@email.com','012031023011','/assets/agency_pics/hertz-logo.png',0);
/*!40000 ALTER TABLE `agence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `reservationId` int NOT NULL,
  `Total` int DEFAULT NULL,
  `Insurance` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `method` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reservationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carproblem`
--

DROP TABLE IF EXISTS `carproblem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carproblem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `car_matricule` varchar(45) NOT NULL,
  `description` varchar(70) NOT NULL,
  `type` varchar(45) NOT NULL,
  `status` enum('pending','active','completed') NOT NULL DEFAULT 'pending',
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_car_idx` (`car_matricule`),
  CONSTRAINT `fk_car_mat` FOREIGN KEY (`car_matricule`) REFERENCES `vehicule` (`matricule`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carproblem`
--

LOCK TABLES `carproblem` WRITE;
/*!40000 ALTER TABLE `carproblem` DISABLE KEYS */;
INSERT INTO `carproblem` VALUES (1,'202212522','problem with the engine','engine','completed','2022-05-12'),(2,'202212521','problem with the brakes','brakes','active','2022-05-08'),(3,'202212520','accident accured','accident','completed','2022-05-13');
/*!40000 ALTER TABLE `carproblem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreviews`
--

DROP TABLE IF EXISTS `carreviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `car_matricule` varchar(45) NOT NULL,
  `client_email` varchar(45) NOT NULL,
  `review` varchar(80) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_idx` (`client_email`),
  KEY `fk_car_idx` (`car_matricule`),
  CONSTRAINT `fk_car` FOREIGN KEY (`car_matricule`) REFERENCES `vehicule` (`matricule`),
  CONSTRAINT `fk_client` FOREIGN KEY (`client_email`) REFERENCES `client` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreviews`
--

LOCK TABLES `carreviews` WRITE;
/*!40000 ALTER TABLE `carreviews` DISABLE KEYS */;
INSERT INTO `carreviews` VALUES (1,'202212522','1@email.com','Great Car , I recommend','2022-05-08 10:00:00'),(2,'202212522','Hamza@gmail.com','Great Car , Great Team , awsome cutomer service , I recommend','2022-05-08 10:00:00'),(3,'202212520','1@email.com','Great Car , Great Team , awsome cutomer service , I recommend','2022-05-08 10:00:00');
/*!40000 ALTER TABLE `carreviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `num_carte` double NOT NULL DEFAULT '0',
  `email` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL DEFAULT '0',
  `date_naissance` date DEFAULT NULL,
  `sexe` enum('male','female') DEFAULT NULL,
  `etat` enum('regulier','bloquée') NOT NULL DEFAULT 'regulier',
  `alert` int NOT NULL DEFAULT '0',
  `image` longtext NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `currentLat` varchar(45) DEFAULT NULL,
  `currentLong` varchar(45) DEFAULT NULL,
  `Account_created` date DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `customer_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('Hamza','NewAccount',2130103010,'02@email.com','10203102301','2001-04-02','male','regulier',0,'/assets/profile_pics/220611102535635.jpeg','@Hamza','35.702418886472444','4.523486362663717','2022-06-11','M\'Sila District M\'Sila Algeria','cus_Lr9rV85oCm8hzF'),('Nathanial ','Olson',549837,'1@email.com','111111111111','2001-01-01','male','regulier',0,'/assets/profile_pics/1email.png','@olson','36.1889','5.4039','2022-02-10','setif-algeria','cus_LjRtnEp6Wil43W'),('Hamza','Boumakrane',123131,'Hamza@gmail.com','12312310','2001-04-02','male','regulier',0,'/assets/profile_pics/hamzagmail.jpg','@Hamza','35.5468','6.162','2022-04-20','batna-algeria','cus_LjUOVE3WMIDMo0');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `client_AFTER_DELETE` AFTER DELETE ON `client` FOR EACH ROW BEGIN
DELETE FROM `atelier`.`users` WHERE (`email` = OLD.email);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `source` varchar(45) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  `tags` varchar(45) NOT NULL,
  `not_read_count` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `source_idx` (`source`),
  KEY `destination_idx` (`destination`),
  KEY `initiator` (`source`),
  KEY `reciever` (`destination`),
  CONSTRAINT `initiator` FOREIGN KEY (`source`) REFERENCES `users` (`email`),
  CONSTRAINT `reciever` FOREIGN KEY (`destination`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation`
--

LOCK TABLES `conversation` WRITE;
/*!40000 ALTER TABLE `conversation` DISABLE KEYS */;
INSERT INTO `conversation` VALUES (23,'Problem with the contract signature','1@email.com','serviceClient@email.com','2022-04-22 19:04:05','Problem Report',0),(24,'New Problem ','1@email.com','serviceClient@email.com','2022-04-22 19:04:11','Reclamation',0),(25,'Hello world ','serviceClient@email.com','1@email.com','2022-04-20 19:46:37','Reclamation',0),(32,'Bug with Pdf files','1@email.com','serviceClient@email.com','2022-04-23 01:09:28','Bug Report',0),(67,'Client miss conduct during Meeting','s01@email.com','serviceClient@email.com','2022-04-30 18:08:01','Miss conduct',1),(68,'Client missed booking ','g01@email.com','serviceClient@email.com','2022-04-30 18:44:11','Miss conduct',1);
/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depot`
--

DROP TABLE IF EXISTS `depot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depot` (
  `code` int NOT NULL AUTO_INCREMENT,
  `adress` varchar(45) NOT NULL,
  `capacite` int NOT NULL,
  `agence_nom` varchar(45) NOT NULL,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL,
  `Bookings` int DEFAULT '0',
  PRIMARY KEY (`code`,`agence_nom`),
  KEY `agency_name_idx` (`agence_nom`),
  CONSTRAINT `agency_name` FOREIGN KEY (`agence_nom`) REFERENCES `agence` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depot`
--

LOCK TABLES `depot` WRITE;
/*!40000 ALTER TABLE `depot` DISABLE KEYS */;
INSERT INTO `depot` VALUES (1,'Guidjel District Setif Algeria',25,'Hertz',36.1892751,5.403493,193),(2,'batna',15,'Hertz',35.55216,6.17968,12),(3,'constantine',15,'agence02',36.265,6.5833,80),(11,'Bejaia District Bejaia Algeria',20,'Hertz',36.73397103451364,5.048895145822205,0),(13,'Setif District Setif Algeria',10,'agence02',36.182615350000006,5.4023142721312,11);
/*!40000 ALTER TABLE `depot` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `depot_AFTER_UPDATE` AFTER UPDATE ON `depot` FOR EACH ROW BEGIN
UPDATE `atelier`.`garagiste` SET `working_location` = NULL WHERE (`working_location` = OLD.`code`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `clientemail` varchar(45) NOT NULL,
  `agencyName` varchar(45) NOT NULL,
  PRIMARY KEY (`clientemail`,`agencyName`),
  KEY `followingagency_idx` (`agencyName`),
  CONSTRAINT `followingagency` FOREIGN KEY (`agencyName`) REFERENCES `agence` (`nom`),
  CONSTRAINT `followingclient` FOREIGN KEY (`clientemail`) REFERENCES `client` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `follow_AFTER_INSERT` AFTER INSERT ON `follow` FOR EACH ROW BEGIN
update agence set number_followers = number_followers +1 where nom = new.agencyName;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `follow_AFTER_DELETE` AFTER DELETE ON `follow` FOR EACH ROW BEGIN
IF (SELECT `number_followers` FROM `agence` WHERE `nom` = OLD.`agencyName`) <= 0 THEN
UPDATE `agence` SET `number_followers` = 0 WHERE `nom` = OLD.`agencyName`;
ELSE
UPDATE `agence` SET `number_followers` = `number_followers` - 1 WHERE `nom` = OLD.`agencyName`;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `garagiste`
--

DROP TABLE IF EXISTS `garagiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garagiste` (
  `email` varchar(45) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT '/assets/profile_pics/default.png',
  `working_location` int DEFAULT NULL,
  `monthly_session` date DEFAULT NULL,
  `agency_name` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `location_idx` (`working_location`),
  CONSTRAINT `location` FOREIGN KEY (`working_location`) REFERENCES `depot` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garagiste`
--

LOCK TABLES `garagiste` WRITE;
/*!40000 ALTER TABLE `garagiste` DISABLE KEYS */;
INSERT INTO `garagiste` VALUES ('g01@email.com','Boumakrane','Hamza','/assets/profile_pics/1email.png',NULL,'0000-00-00','Hertz'),('g02@email.com','Oussama','Ghodbane','/assets/profile_pics/g02email.jpeg',2,NULL,'Hertz');
/*!40000 ALTER TABLE `garagiste` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `garagiste_BEFORE_UPDATE` BEFORE UPDATE ON `garagiste` FOR EACH ROW BEGIN
if(old.working_location != new.working_location)then
update depot set garagiste_email = null where depot.code = old.working_location;
update depot set garagiste_email = new.email where depot.code = new.working_location;
end if;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `garagiste_AFTER_DELETE` AFTER DELETE ON `garagiste` FOR EACH ROW BEGIN
DELETE FROM `atelier`.`users` WHERE (`email` = OLD.email);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `client` varchar(45) NOT NULL,
  `secretary` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(45) NOT NULL,
  `booking_id` int DEFAULT NULL,
  PRIMARY KEY (`client`,`date`),
  KEY `secretary_idx` (`secretary`),
  CONSTRAINT `client` FOREIGN KEY (`client`) REFERENCES `client` (`email`),
  CONSTRAINT `secretary` FOREIGN KEY (`secretary`) REFERENCES `secretary` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_conversation` int NOT NULL,
  `source` varchar(45) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `content` longtext NOT NULL,
  `creationTime` datetime NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'not read',
  PRIMARY KEY (`id`,`id_conversation`),
  KEY `conversation_idx` (`id_conversation`),
  CONSTRAINT `conversation` FOREIGN KEY (`id_conversation`) REFERENCES `conversation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (32,23,'1@email.com','serviceClient@email.com','Hello I have a problem with the pdf signature not showing even though I signed the contract thank you ','2022-04-17 13:05:59','read'),(33,24,'1@email.com','serviceClient@email.com','Hello Bye','2022-04-17 18:50:19','read'),(34,24,'1@email.com','serviceClient@email.com','Hello again bye','2022-04-17 19:10:52','read'),(104,23,'serviceClient@email.com','1@email.com','ff','2022-04-22 19:04:05','read'),(105,24,'serviceClient@email.com','1@email.com','ff','2022-04-22 19:04:11','read'),(106,32,'1@email.com','serviceClient@email.com','I found a bug with the pdf system Bye ','2022-04-23 01:08:58','read'),(107,32,'serviceClient@email.com','1@email.com','Fixing it','2022-04-23 01:09:28','read'),(142,67,'s01@email.com','serviceClient@email.com','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent et nulla vel ligula posuere rutrum. Vivamus iaculis, ipsum non sollicitudin tempus, orci nulla commodo metus, vulputate dapibus felis justo vitae massa.','2022-04-30 18:08:01','not read'),(143,68,'g01@email.com','serviceClient@email.com','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent et nulla vel ligula posuere rutrum. Vivamus iaculis, ipsum non sollicitudin tempus, orci nulla commodo metus, vulputate dapibus felis justo vitae massa.','2022-04-30 18:44:11','not read');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `messages_BEFORE_INSERT` BEFORE INSERT ON `messages` FOR EACH ROW BEGIN
SET NEW.creationTime = NOW();
update conversation set last_updated = Now() where conversation.id = New.id_conversation; 
update conversation set conversation.not_read_count = conversation.not_read_count +1  where conversation.id = New.id_conversation; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `offices`
--

DROP TABLE IF EXISTS `offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offices` (
  `code` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `Bookings` int DEFAULT '0',
  `email_secretaire` varchar(45) DEFAULT NULL,
  `lat` varchar(45) DEFAULT NULL,
  `lon` varchar(45) DEFAULT NULL,
  `AvailableMeetingTime` datetime DEFAULT NULL,
  PRIMARY KEY (`code`,`agency_name`),
  UNIQUE KEY `email_secretaire_UNIQUE` (`email_secretaire`),
  KEY `fk_agency_idx` (`agency_name`),
  KEY `fk_secretary_idx` (`email_secretaire`),
  CONSTRAINT `fk_agency` FOREIGN KEY (`agency_name`) REFERENCES `agence` (`nom`),
  CONSTRAINT `fk_secretary` FOREIGN KEY (`email_secretaire`) REFERENCES `secretary` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offices`
--

LOCK TABLES `offices` WRITE;
/*!40000 ALTER TABLE `offices` DISABLE KEYS */;
INSERT INTO `offices` VALUES (1,'Hertz','Constantine District Constantine Algeria',0,'s01@email.com','36.3479208','6.629260552496815','2022-12-10 10:00:00'),(2,'Hertz','Djelfa District Djelfa Algeria',0,'d09@email.com','34.6510735267218','3.248866793118921','2022-12-11 12:00:00'),(3,'Hertz','Setif',0,'Secretary@email.com','36.191','5.407','2022-12-12 13:00:00'),(4,'Hertz','M\'Sila District M\'Sila Algeria',0,'s02@email.com','35.698119264003076','4.556631683459123','2022-12-13 14:00:00'),(13,'agence02','constantine',0,'s03@email.com','36.3479208','6.7',NULL);
/*!40000 ALTER TABLE `offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recentsearch`
--

DROP TABLE IF EXISTS `recentsearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recentsearch` (
  `client_id` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `pick_up_date` date NOT NULL,
  `return_date` date NOT NULL,
  `locationLat` varchar(45) DEFAULT NULL,
  `locationLon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  CONSTRAINT `client_email` FOREIGN KEY (`client_id`) REFERENCES `client` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recentsearch`
--

LOCK TABLES `recentsearch` WRITE;
/*!40000 ALTER TABLE `recentsearch` DISABLE KEYS */;
INSERT INTO `recentsearch` VALUES ('02@email.com','setif','2022-06-11','2022-06-25','36.1892751','5.403493'),('1@email.com','setif','2022-05-26','2022-05-31','36.1892751','5.403493'),('Hamza@gmail.com','constantine','2022-05-23','2022-05-27',NULL,NULL);
/*!40000 ALTER TABLE `recentsearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL,
  `status` varchar(45) NOT NULL,
  `additional_info` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,23,'not_available',''),(2,24,'not_available',''),(4,32,'not_available',''),(37,67,'available','C:\\Users\\Hamza\\eclipseJee-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\Atelier\\assets\\documents\\UploadedFiles\\diagramme de class (6).png'),(38,68,'available','C:\\Users\\Hamza\\eclipseJee-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\Atelier\\assets\\documents\\UploadedFiles\\Blank diagram (3).png');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `locataire_email` varchar(45) NOT NULL,
  `vehicule_matricule` varchar(45) NOT NULL,
  `date_1` date NOT NULL,
  `date_2` date NOT NULL,
  `etat` enum('en cours','payée') NOT NULL DEFAULT 'en cours',
  `contrat` varchar(45) DEFAULT NULL,
  `date_reservation` date NOT NULL,
  `location` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Locataire_has_Vehicule_Vehicule1_idx` (`vehicule_matricule`),
  KEY `fk_Locataire_has_Vehicule_Locataire1_idx` (`locataire_email`),
  CONSTRAINT `fk_Locataire_has_Vehicule_Locataire1` FOREIGN KEY (`locataire_email`) REFERENCES `client` (`email`),
  CONSTRAINT `fk_Locataire_has_Vehicule_Vehicule1` FOREIGN KEY (`vehicule_matricule`) REFERENCES `vehicule` (`matricule`)
) ENGINE=InnoDB AUTO_INCREMENT=959 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reservation_BEFORE_INSERT` BEFORE INSERT ON `reservation` FOR EACH ROW BEGIN
declare theId int;
SELECT `AUTO_INCREMENT` INTO theId
FROM  INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'atelier'
AND   TABLE_NAME   = 'reservation';
SET `new`.`contrat` = concat("/assets/documents/contracts/", theId, ".pdf");
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reservation_AFTER_INSERT` AFTER INSERT ON `reservation` FOR EACH ROW BEGIN
declare codeDepot varchar(10);
declare agencyName varchar(10);
SELECT `depot_code` INTO codeDepot FROM `vehicule` where `matricule` = NEW.`vehicule_matricule`;
SELECT `agence_nom` INTO agencyName FROM `depot` WHERE `code` = codeDepot;
UPDATE `atelier`.`depot` 
SET `Bookings` = `Bookings`+1 
WHERE (`code` = codeDepot) and (`agence_nom` = agencyName);
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reservation_BEFORE_UPDATE` BEFORE UPDATE ON `reservation` FOR EACH ROW BEGIN
SET `new`.`contrat` = concat("/assets/documents/contracts/", new.Id, ".pdf");
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secretary` (
  `email` varchar(45) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT '/assets/profile_pics/default.png',
  `working_location` int DEFAULT NULL,
  `agency_name` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_location_idx` (`working_location`),
  CONSTRAINT `fk_location` FOREIGN KEY (`working_location`) REFERENCES `offices` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secretary`
--

LOCK TABLES `secretary` WRITE;
/*!40000 ALTER TABLE `secretary` DISABLE KEYS */;
INSERT INTO `secretary` VALUES ('d09@email.com',NULL,NULL,'/assets/profile_pics/default.png',2,'Hertz'),('s01@email.com','secr','secretary','/assets/profile_pics/1email.png',1,'Hertz'),('s02@email.com','secretary','secr','/assets/profile_pics/1email.png',2,'Hertz'),('s03@email.com','Secretary','01','/assets/profile_pics/s03email.jpeg',13,'agence02'),('Secretary@email.com','2','Hamza','/assets/profile_pics/Secretaryemail.jpeg',3,'Hertz');
/*!40000 ALTER TABLE `secretary` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `secretary_BEFORE_DELETE` BEFORE DELETE ON `secretary` FOR EACH ROW BEGIN
DELETE FROM `atelier`.`users` WHERE (`email` = OLD.email);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `serviceclient`
--

DROP TABLE IF EXISTS `serviceclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviceclient` (
  `email` varchar(45) NOT NULL,
  `image` varchar(45) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceclient`
--

LOCK TABLES `serviceclient` WRITE;
/*!40000 ALTER TABLE `serviceclient` DISABLE KEYS */;
INSERT INTO `serviceclient` VALUES ('serviceClient@email.com','/assets/profile_pics/serviceClient.svg','Service','Client','Service Client');
/*!40000 ALTER TABLE `serviceclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(45) NOT NULL,
  `mot_pass` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('02@email.com','1234','client'),('1@email.com','12345678','client'),('d01@email.com','12345678','directeur'),('d02@gmail.com','12345678','directeur'),('d09@email.com','azerty','secretary'),('g01@email.com','test','depot manager'),('g02@email.com','test','depot manager'),('Hamza@gmail.com','test','client'),('O01@email.com','test','owner'),('s01@email.com','12345678','secretary'),('s02@email.com','12345678','secretary'),('s03@email.com','test','secretary'),('Secretary@email.com','Hamza','secretary'),('serviceClient@email.com','test','service_client');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicule` (
  `matricule` varchar(45) NOT NULL,
  `marque` varchar(45) NOT NULL,
  `modele` varchar(45) NOT NULL,
  `carFullName` varchar(90) NOT NULL,
  `PLJ` double NOT NULL,
  `type` varchar(45) NOT NULL,
  `image` varchar(50) DEFAULT '/assets/car_pics/default.jpg',
  `Sec-images` json DEFAULT NULL,
  `allImages` json DEFAULT NULL,
  `mileage` enum('unlimited','limited') DEFAULT 'limited',
  `Agence` varchar(45) NOT NULL,
  `depot_code` int NOT NULL,
  `year` int NOT NULL,
  `color` varchar(45) NOT NULL,
  `rating` double NOT NULL DEFAULT '0',
  `seats` int NOT NULL DEFAULT '4',
  `doors` int NOT NULL DEFAULT '4',
  `suit_case` int DEFAULT '0',
  `comfort_rating` double DEFAULT '0',
  `cleanliness_rating` double DEFAULT '0',
  `PickReturn_rating` double DEFAULT '0',
  `ValueMoney_rating` double DEFAULT '0',
  `carDescription` longtext NOT NULL,
  PRIMARY KEY (`matricule`),
  KEY `code_depot_idx` (`depot_code`),
  KEY `Vehicule_agence_idx` (`Agence`),
  CONSTRAINT `depot` FOREIGN KEY (`depot_code`) REFERENCES `depot` (`code`),
  CONSTRAINT `Vehicule_agence` FOREIGN KEY (`Agence`) REFERENCES `agence` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicule`
--

LOCK TABLES `vehicule` WRITE;
/*!40000 ALTER TABLE `vehicule` DISABLE KEYS */;
INSERT INTO `vehicule` VALUES ('202212401','Peugot','e-208GT','2020 Peugeot e-208 GT Line | Faro Yellow',120,'Premium','/assets/car_pics/car02.jpg','{\"1\": \"/assets/car_pics/peugot208GT-sec.jpeg\", \"2\": \"/assets/car_pics/car02-sec01.jpg\"}','{\"1\": \"/assets/car_pics/car02.jpg\", \"2\": \"/assets/car_pics/peugot208GT-sec.jpeg\", \"3\": \"/assets/car_pics/car02-sec01.jpg\"}','unlimited','agence02',3,2022,'Yellow',2.8,4,4,1,0,0,0,0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,'),('202212519','porsche','911','2021 Porsche 911 Turbo S Coupe',210,'premium','/assets/car_pics/car03.jpg','{\"1\": \"/assets/car_pics/car03-sec.jpg\", \"2\": \"/assets/car_pics/car03-sec01.jpg\"}','{\"1\": \"/assets/car_pics/car03.jpg\", \"2\": \"/assets/car_pics/car03-sec.jpg\", \"3\": \"/assets/car_pics/car03-sec01.jpg\"}','unlimited','Hertz',1,2019,'black',0,2,2,1,0,0,0,0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,'),('202212520','mercedes','c-class','2016 Mercedes-Benz, C-Class , C205, coupe',200,'coupe','/assets/car_pics/mercedes-benz-c-class.jpg','{\"1\": \"/assets/car_pics/mercedes-benz-c-class01.jpg\", \"2\": \"/assets/car_pics/mercedes-benz-c-class02.jpg\"}','{\"1\": \"/assets/car_pics/mercedes-benz-c-class.jpg\", \"2\": \"/assets/car_pics/mercedes-benz-c-class01.jpg\", \"3\": \"/assets/car_pics/mercedes-benz-c-class02.jpg\"}','unlimited','Hertz',1,2020,'white',0,2,2,1,0,0,0,0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,'),('202212521','renault','captur','2021 Renault Captur Zen',190,'suv','/assets/car_pics/RC01.jpg','{\"1\": \"/assets/car_pics/RC02.jpg\", \"2\": \"/assets/car_pics/RC03.jpg\"}','{\"1\": \"/assets/car_pics/RC01.jpg\", \"2\": \"/assets/car_pics/RC02.jpg\", \"3\": \"/assets/car_pics/RC03.jpg\"}','unlimited','Hertz',1,2021,'blue',0,4,4,1,0,0,0,0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,'),('202212522','Mini','cooper Sl','2020 Mini Cooper S Hardtop Red',100,'Compact','/assets/car_pics/default01.jpg','{\"1\": \"/assets/car_pics/sec-image01.jpg\", \"2\": \"/assets/car_pics/sec-image02.jpg\"}','{\"1\": \"/assets/car_pics/default01.jpg\", \"2\": \"/assets/car_pics/sec-image01.jpg\", \"3\": \"/assets/car_pics/sec-image02.jpg\", \"4\": \"/assets/car_pics/sec-image03.jpg\"}','unlimited','Hertz',2,2021,'Red',3.2,2,2,1,0,0,0,0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,'),('202212523','Audi','Berliner A3','2022 Audi A3 Berline 35 TFSI',135,'Sedan','/assets/car_pics/auditA3.jpg','{\"1\": \"/assets/car_pics/auditA3R01.jpg\", \"2\": \"/assets/car_pics/auditA3R02.jpg\", \"3\": \"/assets/car_pics/auditA3R03.jpg\"}','{\"1\": \"/assets/car_pics/auditA3.jpg\", \"2\": \"/assets/car_pics/auditA3R01.jpg\", \"3\": \"/assets/car_pics/auditA3R02.jpg\", \"4\": \"/assets/car_pics/auditA3R03.jpg\"}','unlimited','agence02',13,2022,'Black',2.3,4,4,2,0,0,0,0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet felis vel tellus tempor, blandit vulputate felis eleifend. Donec ut libero scelerisque, fringilla tortor varius,');
/*!40000 ALTER TABLE `vehicule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'atelier'
--

--
-- Dumping routines for database 'atelier'
--
/*!50003 DROP PROCEDURE IF EXISTS `car_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `car_search`(in pickUp_date date, 
														 in return_date date,
                                                         in typeFilter varchar(40),
                                                         in PriceMinBound int,
                                                         in PriceMaxBound int,
                                                         in carRate int,
                                                         in lat double,
                                                         in lon double)
BEGIN
set @query = concat("SELECT * FROM vehicule as v join depot as d on v.depot_code = d.code
				   WHERE d.lat >= ",lat-0.5,"and d.lat <=",lat+0.5," and d.lon >=",lon-0.5," and d.lon <=",lon+0.5," and v.matricule not in (SELECT vehicule_matricule FROM reservation 
											 WHERE (datediff(", return_date, ", date_1) >= 0 
                                             AND datediff(date_2, ", pickUp_date, ") >= 0))");
if typeFilter is not null then
set @query = concat(@query, " AND find_in_set(v.type,'", typeFilter, "')");
end if;

if PriceMinBound != 0 or PriceMaxBound!= 0 then
set @query = concat(@query, " AND v.PLJ <=", PriceMaxBound);
set @query = concat(@query, " AND v.PLJ >=", PriceMinBound);
end if;

if carRate != 0 then
set @query = concat(@query, " AND v.rating >=", carRate);
end if;

PREPARE stmt FROM @query;
execute stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-12 13:24:46
