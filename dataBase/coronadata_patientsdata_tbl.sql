-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: coronadata
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `patientsdata_tbl`
--

DROP TABLE IF EXISTS `patientsdata_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patientsdata_tbl` (
  `Id` int NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `streetNumber` int DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `mobilePhone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientsdata_tbl`
--

LOCK TABLES `patientsdata_tbl` WRITE;
/*!40000 ALTER TABLE `patientsdata_tbl` DISABLE KEYS */;
INSERT INTO `patientsdata_tbl` VALUES (23652489,'Shoshana','Dabosh','Haifa','Hadar',49,'1956-06-02 00:00:00','05-6588545','052-2199421'),(25466985,'Yaron','Kahan','Ramat Gan','Ben Gurion',52,'2000-12-01 00:00:00','03-6211485','058-4572182'),(235621228,'Leah','Sharon','Tel Aviv','Hcovshim',22,'1966-12-12 00:00:00','03-9985662','055-3346294'),(326566980,'Dina','Asher','Tel Aviv','Alenbi',105,'1998-06-09 00:00:00','03-6522697','052-6245871'),(569987440,'Gil','dckdkmc','Jerusalem','Yafo',12,'1985-05-06 00:00:00','02-98556978','050-4672198'),(785499652,'Daniel','Frid','Bnei Barak','Bagno',18,NULL,'03-9411523','054-9658700');
/*!40000 ALTER TABLE `patientsdata_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28 16:10:21
