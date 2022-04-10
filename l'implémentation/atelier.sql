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
-- Table structure for table `bureau`
--

DROP TABLE IF EXISTS `bureau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bureau` (
  `code` varchar(45) NOT NULL,
  `adress` varchar(45) NOT NULL,
  `agence_nom` varchar(45) NOT NULL,
  `secretaire_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `fk_bureau_Agence_idx` (`agence_nom`),
  KEY `fk_bureau_Utilisateur1_idx` (`secretaire_email`),
  CONSTRAINT `fk_bureau_Agence` FOREIGN KEY (`agence_nom`) REFERENCES `agence` (`nom`),
  CONSTRAINT `fk_bureau_Utilisateur1` FOREIGN KEY (`secretaire_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bureau`
--

LOCK TABLES `bureau` WRITE;
/*!40000 ALTER TABLE `bureau` DISABLE KEYS */;
/*!40000 ALTER TABLE `bureau` ENABLE KEYS */;
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
  PRIMARY KEY (`email`),
  UNIQUE KEY `num_carte_UNIQUE` (`num_carte`),
  KEY `CreditCard_idx` (`defaultPaymentMethod`),
  CONSTRAINT `CreditCard` FOREIGN KEY (`defaultPaymentMethod`) REFERENCES `creditcards` (`CardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('Nathanial ','Olson',549837,'1@email.com','111111111111','2001-01-01','male','regulier',0,'/assets/profile_pics/1email.png','@olson','1122 3344 5566 7788'),('Hamza','Boumakrane',123131,'Hamza@gmail.com','12312310','2001-04-02','male','regulier',0,'/assets/profile_pics/hamzagmail.jpg','@Hamza','9879 2041 7230 1275');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
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
  `code` varchar(45) NOT NULL,
  `adress` varchar(45) NOT NULL,
  `capacite` varchar(45) NOT NULL,
  `capacite_libre` varchar(45) NOT NULL,
  `agence_nom` varchar(45) NOT NULL,
  `garagiste_email` varchar(45) DEFAULT NULL,
  `lat` varchar(45) DEFAULT NULL,
  `lon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `fk_Depot_Utilisateur1_idx` (`garagiste_email`),
  CONSTRAINT `fk_Depot_Utilisateur1` FOREIGN KEY (`garagiste_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depot`
--

LOCK TABLES `depot` WRITE;
/*!40000 ALTER TABLE `depot` DISABLE KEYS */;
INSERT INTO `depot` VALUES ('d01','constantine','12','11','Hertz',NULL,'36.25023','6.57394'),('d02','batna','15','15','Hertz',NULL,NULL,NULL),('d03','constantine','15','15','agence02',NULL,'36.2650','6.5833'),('d04','constantine','20','3','Hertz',NULL,'36.2536','6.5546'),('d05','constantine','10','5','agence02',NULL,'36.2493','6.5921'),('d06','constantine','12','6','agence02',NULL,'36.2333','6.5604');
/*!40000 ALTER TABLE `depot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL,
  `source` varchar(45) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `content` longtext NOT NULL,
  `time` date NOT NULL,
  `status` varchar(45) NOT NULL,
  `tags` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'Hamza@gmail.com','1@email.com','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dapibus sem nec tellus porta, eget venenatis dui gravida. Mauris ornare aliquet ipsum, ut suscipit ipsum interdum nec. Sed tincidunt euismod diam, non volutpat lorem blandit id. Quisque rutrum nisl et nisi euismod, eu scelerisque sem suscipit. Donec et tortor vel magna euismod ullamcorper. Donec id aliquam nisi. ','2022-04-20','not read','Problem report');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'1@email.com','202212522','2022-04-05','2022-04-15','payée',NULL,NULL,'00:00:00','00:00:00','2022-04-02','constantine'),(2,'1@email.com','202212401','2022-04-10','2022-04-12','en cours',NULL,NULL,'11:30:00','11:00:00','2022-04-08','Batna'),(14,'Hamza@gmail.com','202212522','2022-04-30','2022-05-07','en cours',NULL,NULL,'23:32:00','23:30:00','2022-04-03','Batna - Algeria'),(15,'Hamza@gmail.com','202212522','2022-04-30','2022-05-07','en cours',NULL,NULL,'23:32:00','23:30:00','2022-04-03','Batna - Algeria'),(16,'Hamza@gmail.com','202212401','2022-05-07','2022-04-30','en cours',NULL,NULL,'23:33:00','23:33:00','2022-04-03','Batna - Algeria'),(17,'Hamza@gmail.com','202212401','2022-05-07','2022-04-30','en cours',NULL,NULL,'23:33:00','23:33:00','2022-04-03','Batna - Algeria'),(18,'Hamza@gmail.com','202212401','2022-11-04','2023-04-16','en cours',NULL,NULL,'23:43:00','23:43:00','2022-04-03','Batna - Algeria'),(19,'Hamza@gmail.com','202212522','2022-04-19','2022-04-20','en cours',NULL,NULL,'00:22:00','00:23:00','2022-04-04','Batna - Algeria'),(20,'Hamza@gmail.com','202212522','2023-07-07','2023-11-04','en cours',NULL,NULL,'00:37:00','00:38:00','2022-04-04','batna'),(21,'Hamza@gmail.com','202212401','2023-07-07','2023-11-04','en cours',NULL,NULL,'00:37:00','00:38:00','2022-04-04','batna'),(22,'Hamza@gmail.com','202212522','2022-12-07','2022-12-30','en cours',NULL,NULL,'03:45:00','00:50:00','2022-04-04','batna'),(23,'1@email.com','202212401','2022-03-01','2022-03-02','en cours','/assets/documents/contracts/23.pdf',NULL,'12:20:00','12:21:00','2022-04-06','constantine'),(24,'1@email.com','202212522','2022-03-03','2022-03-04','en cours','/assets/documents/contracts/24.pdf',NULL,'12:21:00','12:23:00','2022-04-06','constantine'),(25,'1@email.com','202212401','2022-03-05','2022-03-06','en cours','/assets/documents/contracts/25.pdf',NULL,'12:24:00','13:25:00','2022-04-06','constantine');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reservation_BEFORE_UPDATE` BEFORE UPDATE ON `reservation` FOR EACH ROW BEGIN
SET `new`.`contrat` = concat("/assets/documents/contracts/", new.Id, ".pdf");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `method` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `agence_idx` (`agence_name`),
  KEY `creditCards_idx` (`method`),
  KEY `fk_reservationID_idx` (`reservationID`),
  CONSTRAINT `fk_agence` FOREIGN KEY (`agence_name`) REFERENCES `agence` (`nom`),
  CONSTRAINT `fk_creditCards` FOREIGN KEY (`method`) REFERENCES `creditcards` (`CardNumber`),
  CONSTRAINT `fk_reservationID` FOREIGN KEY (`reservationID`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionhistory`
--

LOCK TABLES `transactionhistory` WRITE;
/*!40000 ALTER TABLE `transactionhistory` DISABLE KEYS */;
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
  `type` enum('client','directeur','secretaire','garagiste') NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1@email.com','12345678','client'),('d01@email.com','12345678','directeur'),('d02@gmail.com','12345678','directeur'),('Hamza@gmail.com','test','client');
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
  `etat` enum('disponible','indisponible') NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `depot_code` varchar(45) NOT NULL,
  `year` int NOT NULL,
  `color` varchar(45) NOT NULL,
  PRIMARY KEY (`matricule`),
  KEY `fk_Vehicule_Depot1_idx` (`depot_code`),
  CONSTRAINT `fk_Vehicule_Depot1` FOREIGN KEY (`depot_code`) REFERENCES `depot` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicule`
--

LOCK TABLES `vehicule` WRITE;
/*!40000 ALTER TABLE `vehicule` DISABLE KEYS */;
INSERT INTO `vehicule` VALUES ('202212401','Peugot','e-208GT',120,20,'something','disponible','/assets/car_pics/car02.jpg','d02',2022,'Yellow'),('202212522','Mini','cooper Sl',100,15,'something','disponible','/assets/car_pics/default01.jpg','d01',2021,'Red');
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `car_search`(in pickUp_date date, in return_date date)
BEGIN
SELECT * FROM vehicule as v join depot as d on v.depot_code = d.code 
where v.matricule not in (select vehicule_matricule from reservation where (datediff(return_date, date_1) >= 0 and datediff(date_2, pickUp_date) >= 0));
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

-- Dump completed on 2022-04-10  0:58:30
