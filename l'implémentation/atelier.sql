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
  PRIMARY KEY (`nom`),
  UNIQUE KEY `num_register_UNIQUE` (`num_register`),
  KEY `fk_Agence_Utilisateur1_idx` (`email_compte`),
  CONSTRAINT `fk_Agence_Utilisateur1` FOREIGN KEY (`email_compte`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
INSERT INTO `agence` VALUES ('agence02',52165,'batna','d02@gmail.com','030102301087','/assets/agency_pics/hertz-logo.png'),('Hertz',1231231,'constantine','d01@email.com','012031023011','/assets/agency_pics/hertz-logo.png');
/*!40000 ALTER TABLE `agence` ENABLE KEYS */;
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
  `num_carte` double NOT NULL,
  `email` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `sexe` enum('male','female') DEFAULT NULL,
  `etat` enum('regulier','bloquée') NOT NULL DEFAULT 'regulier',
  `alert` int NOT NULL DEFAULT '0',
  `image` varchar(50) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `defaultPaymentMethod` varchar(45) DEFAULT NULL,
  `currentLat` varchar(45) NOT NULL,
  `currentLong` varchar(45) NOT NULL,
  `Account_created` date NOT NULL,
  `Address` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `num_carte_UNIQUE` (`num_carte`),
  KEY `CreditCard_idx` (`defaultPaymentMethod`),
  CONSTRAINT `fk_CreditCard` FOREIGN KEY (`defaultPaymentMethod`) REFERENCES `creditcards` (`CardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('Nathanial ','Olson',549837,'1@email.com','111111111111','2001-01-01','male','regulier',0,'/assets/profile_pics/1email.png','@olson','1122 3344 5566 7788','36.1889','5.4039','2022-02-10','setif-algeria'),('Hamza','Boumakrane',123131,'Hamza@gmail.com','12312310','2001-04-02','male','regulier',0,'/assets/profile_pics/hamzagmail.jpg','@Hamza','9879 2041 7230 1275','35.5468','6.162','2022-04-20','batna-algeria');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `client_AFTER_INSERT` AFTER INSERT ON `client` FOR EACH ROW BEGIN
INSERT INTO `atelier`.`users` (`email`, `mot_pass`, `type`) VALUES (NEW.`email`, 12345678, 'client');
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
INSERT INTO `conversation` VALUES (23,'Problem with the contract signature','1@email.com','serviceClient@email.com','2022-04-22 19:04:05','Problem Report',0),(24,'New Problem ','1@email.com','serviceClient@email.com','2022-04-22 19:04:11','Reclamation',0),(25,'Hello world ','serviceClient@email.com','1@email.com','2022-04-20 19:46:37','Reclamation',0),(32,'Bug with Pdf files','1@email.com','serviceClient@email.com','2022-04-23 01:09:28','Bug Report',0),(67,'Title','s01@email.com','serviceClient@email.com','2022-04-30 18:08:01','Miss conduct',1),(68,'Garagiste Title','g01@email.com','serviceClient@email.com','2022-04-30 18:44:11','Miss conduct',1);
/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcards`
--

DROP TABLE IF EXISTS `creditcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcards` (
  `CardNumber` varchar(45) NOT NULL,
  `CardOwner` varchar(45) NOT NULL,
  `exp` varchar(45) NOT NULL,
  PRIMARY KEY (`CardNumber`,`CardOwner`),
  KEY `owner_idx` (`CardOwner`),
  CONSTRAINT `owner` FOREIGN KEY (`CardOwner`) REFERENCES `client` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcards`
--

LOCK TABLES `creditcards` WRITE;
/*!40000 ALTER TABLE `creditcards` DISABLE KEYS */;
INSERT INTO `creditcards` VALUES ('1122 3344 5566 7788','1@email.com','11/24'),('9879 2041 7230 1275','Hamza@gmail.com','08/22');
/*!40000 ALTER TABLE `creditcards` ENABLE KEYS */;
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
  `capacite_libre` int NOT NULL,
  `agence_nom` varchar(45) NOT NULL,
  `garagiste_email` varchar(45) DEFAULT NULL,
  `lat` varchar(45) DEFAULT NULL,
  `lon` varchar(45) DEFAULT NULL,
  `Bookings` int DEFAULT '0',
  PRIMARY KEY (`code`,`agence_nom`),
  UNIQUE KEY `garagiste_email_UNIQUE` (`garagiste_email`),
  KEY `fk_Depot_Utilisateur1_idx` (`garagiste_email`),
  KEY `agency_name_idx` (`agence_nom`),
  CONSTRAINT `agency_name` FOREIGN KEY (`agence_nom`) REFERENCES `agence` (`nom`),
  CONSTRAINT `fk_garagiste` FOREIGN KEY (`garagiste_email`) REFERENCES `garagiste` (`email`),
  CONSTRAINT `check_storage` CHECK (((`capacite` >= 0) and (`capacite_libre` >= 0) and (`capacite_libre` <= `capacite`)))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depot`
--

LOCK TABLES `depot` WRITE;
/*!40000 ALTER TABLE `depot` DISABLE KEYS */;
INSERT INTO `depot` VALUES (1,'constantine',20,19,'Hertz','g01@email.com','36.25023','6.57394',22),(2,'batna',15,13,'Hertz',NULL,'35.55216','6.17968',12),(3,'constantine',15,15,'agence02',NULL,'36.2650','6.5833',0),(6,'constantine',12,12,'agence02',NULL,'36.2333','6.5604',0),(7,'alger',20,18,'Hertz',NULL,'36.7734','3.0587',0),(8,'Khenchela District Khenchela Algeria',10,10,'Hertz','g02@email.com','35.474073','7.1419173',0),(9,'de Mascara District Mascara Algeria',10,10,'Hertz','g03@email.com','35.41229593023381','0.2316626583949343',0);
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
if(old.garagiste_email != null && old.garagiste_email != new.garagiste_email)THEN
	update garagiste set working_location = null where email = old.garagiste_email;
end if;
update garagiste set working_location = old.code where email = new.garagiste_email;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `Agency_Name` varchar(45) NOT NULL,
  `Employee_email` varchar(45) NOT NULL,
  `Type` enum('garagiste','secretaire') NOT NULL,
  PRIMARY KEY (`Agency_Name`),
  KEY `employee_idx` (`Employee_email`),
  CONSTRAINT `agence` FOREIGN KEY (`Agency_Name`) REFERENCES `agence` (`nom`),
  CONSTRAINT `employee` FOREIGN KEY (`Employee_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('Hertz','g01@email.com','garagiste');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `garagiste` VALUES ('g01@email.com','Boumakrane','Hamza','/assets/profile_pics/1email.png',1,'0000-00-00','Hertz'),('g02@email.com','Hamza','2','/assets/profile_pics/1email.png',8,NULL,'Hertz'),('g03@email.com','Hamza','3','/assets/profile_pics/1email.png',9,NULL,'Hertz');
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
INSERT INTO `meetings` VALUES ('1@email.com','s01@email.com','2022-04-27 08:01:00'),('1@email.com','s01@email.com','2022-04-28 14:16:00'),('1@email.com','s01@email.com','2022-04-28 15:01:00'),('1@email.com','s01@email.com','2022-04-29 08:01:00'),('1@email.com','s01@email.com','2022-04-30 10:01:00'),('Hamza@gmail.com','s01@email.com','2022-04-26 09:01:00'),('Hamza@gmail.com','s01@email.com','2022-04-28 14:01:00'),('Hamza@gmail.com','s01@email.com','2022-04-29 14:01:00'),('Hamza@gmail.com','s01@email.com','2022-05-02 13:01:00');
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
INSERT INTO `messages` VALUES (32,23,'1@email.com','serviceClient@email.com','Hello I have a problem with the pdf signature not showing even though I signed the contract thank you ','2022-04-17 13:05:59','read'),(33,24,'1@email.com','serviceClient@email.com','Hello Bye','2022-04-17 18:50:19','read'),(34,24,'1@email.com','serviceClient@email.com','Hello again bye','2022-04-17 19:10:52','read'),(104,23,'serviceClient@email.com','1@email.com','ff','2022-04-22 19:04:05','read'),(105,24,'serviceClient@email.com','1@email.com','ff','2022-04-22 19:04:11','read'),(106,32,'1@email.com','serviceClient@email.com','I found a bug with the pdf system Bye ','2022-04-23 01:08:58','read'),(107,32,'serviceClient@email.com','1@email.com','Fixing it','2022-04-23 01:09:28','read'),(142,67,'s01@email.com','serviceClient@email.com','CEO','2022-04-30 18:08:01','not read'),(143,68,'g01@email.com','serviceClient@email.com','Garagiste First Request','2022-04-30 18:44:11','not read');
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
  PRIMARY KEY (`code`,`agency_name`),
  UNIQUE KEY `email_secretaire_UNIQUE` (`email_secretaire`),
  KEY `fk_agency_idx` (`agency_name`),
  KEY `fk_secretary_idx` (`email_secretaire`),
  CONSTRAINT `fk_agency` FOREIGN KEY (`agency_name`) REFERENCES `agence` (`nom`),
  CONSTRAINT `fk_secretary` FOREIGN KEY (`email_secretaire`) REFERENCES `secretary` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offices`
--

LOCK TABLES `offices` WRITE;
/*!40000 ALTER TABLE `offices` DISABLE KEYS */;
INSERT INTO `offices` VALUES (1,'Hertz','constantine',0,'s01@email.com','36.3664','6.6093'),(2,'Hertz','Djelfa District Djelfa Algeria',0,'s03@email.com','34.6510735267218','3.248866793118921'),(3,'Hertz','Setif',0,'Secretary@email.com','36.191','5.407'),(4,'Hertz','M\'Sila District M\'Sila Algeria',0,'s02@email.com','35.698119264003076','4.556631683459123');
/*!40000 ALTER TABLE `offices` ENABLE KEYS */;
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
  `facture` varchar(45) DEFAULT NULL,
  `hour_1` time NOT NULL,
  `hour_2` time NOT NULL,
  `date_reservation` date NOT NULL,
  `location` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Locataire_has_Vehicule_Vehicule1_idx` (`vehicule_matricule`),
  KEY `fk_Locataire_has_Vehicule_Locataire1_idx` (`locataire_email`),
  CONSTRAINT `fk_Locataire_has_Vehicule_Locataire1` FOREIGN KEY (`locataire_email`) REFERENCES `client` (`email`),
  CONSTRAINT `fk_Locataire_has_Vehicule_Vehicule1` FOREIGN KEY (`vehicule_matricule`) REFERENCES `vehicule` (`matricule`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'1@email.com','202212522','2022-04-05','2022-04-15','payée',NULL,NULL,'00:00:00','00:00:00','2022-04-02','constantine'),(2,'1@email.com','202212401','2022-04-10','2022-04-12','en cours',NULL,NULL,'11:30:00','11:00:00','2022-04-08','Batna'),(14,'Hamza@gmail.com','202212522','2022-04-30','2022-05-07','en cours',NULL,NULL,'23:32:00','23:30:00','2022-04-03','Batna - Algeria'),(15,'Hamza@gmail.com','202212522','2022-04-30','2022-05-07','en cours',NULL,NULL,'23:32:00','23:30:00','2022-04-03','Batna - Algeria'),(16,'Hamza@gmail.com','202212401','2022-05-07','2022-04-30','en cours',NULL,NULL,'23:33:00','23:33:00','2022-04-03','Batna - Algeria'),(17,'Hamza@gmail.com','202212401','2022-05-07','2022-04-30','en cours',NULL,NULL,'23:33:00','23:33:00','2022-04-03','Batna - Algeria'),(18,'Hamza@gmail.com','202212401','2022-11-04','2023-04-16','en cours',NULL,NULL,'23:43:00','23:43:00','2022-04-03','Batna - Algeria'),(19,'Hamza@gmail.com','202212522','2022-04-19','2022-04-20','en cours',NULL,NULL,'00:22:00','00:23:00','2022-04-04','Batna - Algeria'),(20,'Hamza@gmail.com','202212522','2023-07-07','2023-11-04','en cours',NULL,NULL,'00:37:00','00:38:00','2022-04-04','batna'),(21,'Hamza@gmail.com','202212401','2023-07-07','2023-11-04','en cours',NULL,NULL,'00:37:00','00:38:00','2022-04-04','batna'),(23,'1@email.com','202212401','2022-03-01','2022-03-02','en cours','/assets/documents/contracts/23.pdf',NULL,'12:20:00','12:21:00','2022-04-06','constantine'),(24,'1@email.com','202212522','2022-03-03','2022-03-04','en cours','/assets/documents/contracts/24.pdf',NULL,'12:21:00','12:23:00','2022-04-06','constantine'),(45,'1@email.com','202212522','2022-04-01','2022-04-02','en cours','/assets/documents/contracts/31.pdf',NULL,'23:42:00','23:42:00','2022-04-28','Batna - Algeria');
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
INSERT INTO `secretary` VALUES ('s01@email.com','secr','secretary','/assets/profile_pics/1email.png',1,'Hertz'),('s02@email.com','secretary','secr','/assets/profile_pics/1email.png',2,'Hertz'),('s03@email.com','Nathanial','Olson','/assets/profile_pics/Secretaryemail.jpeg',NULL,'Hertz'),('Secretary@email.com','2','Hamza','/assets/profile_pics/Secretaryemail.jpeg',3,'Hertz');
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
-- Table structure for table `transactionhistory`
--

DROP TABLE IF EXISTS `transactionhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionhistory` (
  `payment_id` int NOT NULL,
  `reservationID` int NOT NULL,
  `montant` int NOT NULL,
  `agence_name` varchar(45) NOT NULL,
  `method` varchar(45) NOT NULL DEFAULT 'cash',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `agence_idx` (`agence_name`),
  KEY `fk_reservationID_idx` (`reservationID`),
  CONSTRAINT `fk_agence` FOREIGN KEY (`agence_name`) REFERENCES `agence` (`nom`),
  CONSTRAINT `fk_reservationID` FOREIGN KEY (`reservationID`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionhistory`
--

LOCK TABLES `transactionhistory` WRITE;
/*!40000 ALTER TABLE `transactionhistory` DISABLE KEYS */;
INSERT INTO `transactionhistory` VALUES (1,1,120,'Hertz','cash','2022-04-20'),(2,2,100,'Hertz','1122 3344 5566 7788','2022-04-15'),(3,1,120,'Hertz','cash','2022-05-20');
/*!40000 ALTER TABLE `transactionhistory` ENABLE KEYS */;
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
INSERT INTO `users` VALUES ('1@email.com','12345678','client'),('d01@email.com','12345678','directeur'),('d02@gmail.com','12345678','directeur'),('g01@email.com','test','depot manager'),('g02@email.com','test','depot manager'),('g03@email.com','12345678','depot manager'),('Hamza@gmail.com','test','client'),('s01@email.com','12345678','secretary'),('s02@email.com','12345678','secretary'),('s03@email.com','test','secretary'),('Secretary@email.com','Hamza','secretary'),('serviceClient@email.com','test','service_client');
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
  `PLJ` double NOT NULL,
  `PLH` double NOT NULL,
  `type` varchar(45) NOT NULL,
  `image` varchar(50) DEFAULT '/assets/car_pics/default.jpg',
  `Agence` varchar(45) NOT NULL,
  `depot_code` int NOT NULL,
  `year` int NOT NULL,
  `color` varchar(45) NOT NULL,
  `rating` double NOT NULL DEFAULT '0',
  `Sec-images` json DEFAULT NULL,
  `seats` int NOT NULL DEFAULT '4',
  `doors` int NOT NULL DEFAULT '4',
  `suit_case` int DEFAULT '0',
  `mileage` tinyint DEFAULT '0',
  `comfort_rating` double DEFAULT '0',
  `cleanliness_rating` double DEFAULT '0',
  `PickReturn_rating` double DEFAULT '0',
  `ValueMoney_rating` double DEFAULT '0',
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
INSERT INTO `vehicule` VALUES ('202212401','Peugot','e-208GT',120,20,'Premium','/assets/car_pics/car02.jpg','Hertz',2,2022,'Yellow',2.8,NULL,5,4,0,0,0,0,0,0),('202212519','porsche','macan',210,55,'premium','/assets/car_pics/default.jpg','Hertz',7,2019,'black',0,NULL,4,4,0,0,0,0,0,0),('202212520','mercedes','c-class',200,50,'coupe','/assets/car_pics/default.jpg','Hertz',7,2020,'white',0,NULL,4,4,0,0,0,0,0,0),('202212521','renault','captur',190,35,'suv','/assets/car_pics/default.jpg','Hertz',2,2021,'blue',0,NULL,4,4,0,0,0,0,0,0),('202212522','Mini','cooper Sl',100,15,'Compact','/assets/car_pics/default01.jpg','Hertz',1,2021,'Red',3.2,NULL,4,2,0,0,0,0,0,0);
/*!40000 ALTER TABLE `vehicule` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `vehicule_AFTER_INSERT` AFTER INSERT ON `vehicule` FOR EACH ROW BEGIN
UPDATE `atelier`.`depot` SET `capacite_libre` = `capacite_libre` - 1 WHERE (`code` = `NEW`.`depot_code` and agence_nom = NEW.agence);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `vehicule_AFTER_UPDATE` AFTER UPDATE ON `vehicule` FOR EACH ROW BEGIN
IF (`OLD`.`depot_code` != `NEW`.`depot_code`) THEN
UPDATE `atelier`.`depot` SET `capacite_libre` = `capacite_libre` + 1 WHERE (`code` = `OLD`.`depot_code` and agence_nom = OLD.agence);
UPDATE `atelier`.`depot` SET `capacite_libre` = `capacite_libre` - 1 WHERE (`code` = `NEW`.`depot_code` and agence_nom = NEW.agence);
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `vehicule_AFTER_DELETE` AFTER DELETE ON `vehicule` FOR EACH ROW BEGIN
UPDATE `atelier`.`depot` SET `capacite_libre` = `capacite_libre` + 1 WHERE (`code` = `OLD`.`depot_code`and agence_nom = OLD.agence);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
                                                         in price double,
                                                         in carRate int)
BEGIN
set @query = concat("SELECT * FROM vehicule as v join depot as d on v.depot_code = d.code
				   WHERE v.matricule not in (SELECT vehicule_matricule FROM reservation 
											 WHERE (datediff(", return_date, ", date_1) >= 0 
                                             AND datediff(date_2, ", pickUp_date, ") >= 0))");
if typeFilter is not null then
set @query = concat(@query, " AND find_in_set(v.type,'", typeFilter, "')");
end if;

if price != 0 then
set @query = concat(@query, " AND v.PLJ <=", price);
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

-- Dump completed on 2022-05-07 19:16:08
