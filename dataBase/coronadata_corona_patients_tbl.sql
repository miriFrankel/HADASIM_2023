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
-- Table structure for table `corona_patients_tbl`
--

DROP TABLE IF EXISTS `corona_patients_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corona_patients_tbl` (
  `Id` int NOT NULL,
  `vaccinationDate1` datetime DEFAULT NULL,
  `vaccinationDate2` datetime DEFAULT NULL,
  `vaccinationDate3` datetime DEFAULT NULL,
  `vaccinationDate4` datetime DEFAULT NULL,
  `vaccinationCompany1` int DEFAULT NULL,
  `vaccinationCompany2` int DEFAULT NULL,
  `vaccinationCompany3` int DEFAULT NULL,
  `vaccinationCompany4` int DEFAULT NULL,
  `positiveDate` datetime DEFAULT NULL,
  `recoveryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `vaccination_company1_idx` (`vaccinationCompany2`,`vaccinationCompany3`,`vaccinationCompany4`,`vaccinationCompany1`),
  KEY `vaccination_company1_idx1` (`vaccinationCompany1`),
  KEY `vaccination_company3_idx` (`vaccinationCompany3`),
  KEY `vaccination_company4_idx` (`vaccinationCompany4`),
  CONSTRAINT `Id` FOREIGN KEY (`Id`) REFERENCES `patientsdata_tbl` (`Id`),
  CONSTRAINT `vaccinationCompany1` FOREIGN KEY (`vaccinationCompany1`) REFERENCES `vaccinationcompany_tbl` (`companyCode`),
  CONSTRAINT `vaccinationCompany2` FOREIGN KEY (`vaccinationCompany2`) REFERENCES `vaccinationcompany_tbl` (`companyCode`),
  CONSTRAINT `vaccinationCompany3` FOREIGN KEY (`vaccinationCompany3`) REFERENCES `vaccinationcompany_tbl` (`companyCode`),
  CONSTRAINT `vaccinationCompany4` FOREIGN KEY (`vaccinationCompany4`) REFERENCES `vaccinationcompany_tbl` (`companyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corona_patients_tbl`
--

LOCK TABLES `corona_patients_tbl` WRITE;
/*!40000 ALTER TABLE `corona_patients_tbl` DISABLE KEYS */;
INSERT INTO `corona_patients_tbl` VALUES (23652489,'2021-02-02 00:00:00','2021-09-05 00:00:00','2021-12-06 00:00:00','2021-01-08 00:00:00',1,1,1,1,NULL,NULL),(25466985,'2020-06-06 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-15 00:00:00','2020-09-01 00:00:00'),(326566980,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-02-02 00:00:00',NULL),(569987440,'2021-01-12 00:00:00','2021-02-22 00:00:00','2021-04-02 00:00:00',NULL,2,1,2,NULL,NULL,NULL),(785499652,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `corona_patients_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28 16:10:19
