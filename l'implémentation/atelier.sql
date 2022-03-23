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
  `Utilisateur_email` varchar(45) NOT NULL,
  PRIMARY KEY (`nom`),
  UNIQUE KEY `num_register_UNIQUE` (`num_register`),
  KEY `fk_Agence_Utilisateur1_idx` (`Utilisateur_email`),
  CONSTRAINT `fk_Agence_Utilisateur1` FOREIGN KEY (`Utilisateur_email`) REFERENCES `utilisateur` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
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
  `Agence_nom` varchar(45) NOT NULL,
  `Utilisateur_email` varchar(45) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `fk_bureau_Agence_idx` (`Agence_nom`),
  KEY `fk_bureau_Utilisateur1_idx` (`Utilisateur_email`),
  CONSTRAINT `fk_bureau_Agence` FOREIGN KEY (`Agence_nom`) REFERENCES `agence` (`nom`),
  CONSTRAINT `fk_bureau_Utilisateur1` FOREIGN KEY (`Utilisateur_email`) REFERENCES `utilisateur` (`email`)
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
  `Agence_nom` varchar(45) NOT NULL,
  `Utilisateur_email` varchar(45) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `fk_Depot_Agence1_idx` (`Agence_nom`),
  KEY `fk_Depot_Utilisateur1_idx` (`Utilisateur_email`),
  CONSTRAINT `fk_Depot_Agence1` FOREIGN KEY (`Agence_nom`) REFERENCES `agence` (`nom`),
  CONSTRAINT `fk_Depot_Utilisateur1` FOREIGN KEY (`Utilisateur_email`) REFERENCES `utilisateur` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depot`
--

LOCK TABLES `depot` WRITE;
/*!40000 ALTER TABLE `depot` DISABLE KEYS */;
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
  PRIMARY KEY (`email`),
  UNIQUE KEY `num_carte_UNIQUE` (`num_carte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locataire`
--

LOCK TABLES `locataire` WRITE;
/*!40000 ALTER TABLE `locataire` DISABLE KEYS */;
INSERT INTO `locataire` VALUES ('Nathanial ','Olson',549837,'1@email.com',666666666,'1990-01-01','male','12345678','regulier',0,'1@','locataire');
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
  `Locataire_email` varchar(45) NOT NULL,
  `Vehicule_matricule` varchar(45) NOT NULL,
  `date_reservation` date NOT NULL,
  `date_retoure` date NOT NULL,
  `etat` enum('en cours','payée') NOT NULL DEFAULT 'en cours',
  `contrat` blob NOT NULL,
  `facture` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Locataire_has_Vehicule_Vehicule1_idx` (`Vehicule_matricule`),
  KEY `fk_Locataire_has_Vehicule_Locataire1_idx` (`Locataire_email`),
  CONSTRAINT `fk_Locataire_has_Vehicule_Locataire1` FOREIGN KEY (`Locataire_email`) REFERENCES `locataire` (`email`),
  CONSTRAINT `fk_Locataire_has_Vehicule_Vehicule1` FOREIGN KEY (`Vehicule_matricule`) REFERENCES `vehicule` (`matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
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
  `type` varchar(11) NOT NULL DEFAULT 'utilisateur',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
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
  `Depot_code` varchar(45) NOT NULL,
  PRIMARY KEY (`matricule`),
  KEY `fk_Vehicule_Depot1_idx` (`Depot_code`),
  CONSTRAINT `fk_Vehicule_Depot1` FOREIGN KEY (`Depot_code`) REFERENCES `depot` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicule`
--

LOCK TABLES `vehicule` WRITE;
/*!40000 ALTER TABLE `vehicule` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'atelier'
--

--
-- Dumping routines for database 'atelier'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-23 19:04:13
