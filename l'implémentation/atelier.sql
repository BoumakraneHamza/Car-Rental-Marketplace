CREATE DATABASE  IF NOT EXISTS `atelier` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `atelier`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: atelier
-- ------------------------------------------------------
-- Server version	8.0.28

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
  `adress` varchar(45) NOT NULL,
  `directeur_email` varchar(45) NOT NULL,
  PRIMARY KEY (`nom`),
  UNIQUE KEY `num_register_UNIQUE` (`num_register`),
  KEY `fk_Agence_Utilisateur1_idx` (`directeur_email`),
  CONSTRAINT `fk_Agence_Utilisateur1` FOREIGN KEY (`directeur_email`) REFERENCES `utilisateur` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
INSERT INTO `agence` VALUES ('agence01',251922,'constantine','d01@email.com');
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
  CONSTRAINT `fk_bureau_Utilisateur1` FOREIGN KEY (`secretaire_email`) REFERENCES `utilisateur` (`email`)
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
  CONSTRAINT `owner` FOREIGN KEY (`CardOwner`) REFERENCES `locataire` (`email`)
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
  PRIMARY KEY (`code`),
  KEY `fk_Depot_Agence1_idx` (`agence_nom`),
  KEY `fk_Depot_Utilisateur1_idx` (`garagiste_email`),
  CONSTRAINT `fk_Depot_Agence1` FOREIGN KEY (`agence_nom`) REFERENCES `agence` (`nom`),
  CONSTRAINT `fk_Depot_Utilisateur1` FOREIGN KEY (`garagiste_email`) REFERENCES `utilisateur` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depot`
--

LOCK TABLES `depot` WRITE;
/*!40000 ALTER TABLE `depot` DISABLE KEYS */;
INSERT INTO `depot` VALUES ('d01','constantine','12','11','agence01',NULL),('d02','batna','15','15','agence01',NULL);
/*!40000 ALTER TABLE `depot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locataire`
--

DROP TABLE IF EXISTS `locataire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locataire` (
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `num_carte` double NOT NULL,
  `email` varchar(45) NOT NULL,
  `telephone` int NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `sexe` enum('male','female') DEFAULT NULL,
  `mot_pass` varchar(45) NOT NULL,
  `etat` enum('regulier','bloquée') NOT NULL DEFAULT 'regulier',
  `alert` int NOT NULL DEFAULT '0',
  `image` varchar(50) NOT NULL,
  `type` varchar(9) NOT NULL DEFAULT 'locataire',
  `user_name` varchar(45) NOT NULL,
  `defaultPaymentMethod` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `num_carte_UNIQUE` (`num_carte`),
  KEY `CreditCard_idx` (`defaultPaymentMethod`),
  CONSTRAINT `CreditCard` FOREIGN KEY (`defaultPaymentMethod`) REFERENCES `creditcards` (`CardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locataire`
--

LOCK TABLES `locataire` WRITE;
/*!40000 ALTER TABLE `locataire` DISABLE KEYS */;
INSERT INTO `locataire` VALUES ('Nathanial ','Olson',549837,'1@email.com',666666666,'1990-01-01','male','12345678','regulier',0,'/assets/profile_pics/1email.png','locataire','@olson','1122 3344 5566 7788'),('Hamza','Boumakrane',123131,'Hamza@gmail.com',12312310,'2001-04-02','male','test','regulier',0,'/assets/profile_pics/hamzagmail.jpg','locataire','@Hamza','9879 2041 7230 1275');
/*!40000 ALTER TABLE `locataire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int NOT NULL,
  `locataire_email` varchar(45) NOT NULL,
  `vehicule_matricule` varchar(45) NOT NULL,
  `date_reservation` date NOT NULL,
  `date_retoure` date NOT NULL,
  `etat` enum('en cours','payée') NOT NULL DEFAULT 'en cours',
  `contrat` blob,
  `facture` blob,
  PRIMARY KEY (`id`),
  KEY `fk_Locataire_has_Vehicule_Vehicule1_idx` (`vehicule_matricule`),
  KEY `fk_Locataire_has_Vehicule_Locataire1_idx` (`locataire_email`),
  CONSTRAINT `fk_Locataire_has_Vehicule_Locataire1` FOREIGN KEY (`locataire_email`) REFERENCES `locataire` (`email`),
  CONSTRAINT `fk_Locataire_has_Vehicule_Vehicule1` FOREIGN KEY (`vehicule_matricule`) REFERENCES `vehicule` (`matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'1@email.com','202212522','2022-04-05','2022-04-15','payée',NULL,NULL);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `reservationID` int NOT NULL,
  `montant` int NOT NULL,
  `agence` varchar(45) NOT NULL,
  `method` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reservationID`),
  KEY `agence_idx` (`agence`),
  KEY `creditCards_idx` (`method`),
  CONSTRAINT `agence` FOREIGN KEY (`agence`) REFERENCES `agence` (`nom`),
  CONSTRAINT `creditCards` FOREIGN KEY (`method`) REFERENCES `creditcards` (`CardNumber`),
  CONSTRAINT `reservation` FOREIGN KEY (`reservationID`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `email` varchar(45) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `mot_pass` varchar(45) NOT NULL,
  `telephone` int NOT NULL,
  `sexe` enum('male','female') NOT NULL,
  `type` enum('utilisateur','directeur','secretaire','garagiste') NOT NULL DEFAULT 'utilisateur',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES ('d01@email.com','directeur','dir','12345678',666666666,'male','directeur');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
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
INSERT INTO `vehicule` VALUES ('202212522','default','defaul',100,15,'something','disponible','assets/car_pics/default.jpg','d01');
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

select v.*
from vehicule v join depot d 
on v.`depot_code` = d.`code`
where v.`matricule` not in (select vehicule_matricule from reservation where(datediff(return_date, date_reservation) >= 0 and datediff(date_retoure, pickUp_date) >= 0));

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

-- Dump completed on 2022-03-24 20:51:38
