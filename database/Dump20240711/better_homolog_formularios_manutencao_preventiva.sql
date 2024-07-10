CREATE DATABASE  IF NOT EXISTS `better_homolog` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `better_homolog`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 10.161.100.11    Database: better_homolog
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `formularios_manutencao_preventiva`
--

DROP TABLE IF EXISTS `formularios_manutencao_preventiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formularios_manutencao_preventiva` (
  `fmp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fmp_descricao` varchar(100) NOT NULL,
  `fmp_data_ultima_modificacao` datetime DEFAULT NULL,
  `fmp_modificador` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`fmp_id`),
  UNIQUE KEY `fmp_id_UNIQUE` (`fmp_id`),
  KEY `fmp_modificador_FK_idx` (`fmp_modificador`),
  CONSTRAINT `fmp_modificador_FK` FOREIGN KEY (`fmp_modificador`) REFERENCES `colaboradores` (`col_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formularios_manutencao_preventiva`
--

LOCK TABLES `formularios_manutencao_preventiva` WRITE;
/*!40000 ALTER TABLE `formularios_manutencao_preventiva` DISABLE KEYS */;
INSERT INTO `formularios_manutencao_preventiva` VALUES (1,'FORMULÁRIO DISPOSITIVO  DE AGULHAS','2023-08-03 15:36:04',8),(2,'FORMULÁRIO DISPOSITIVO DE CABOS','2019-04-23 09:50:54',8),(3,'FORMULÁRIO FIXTURE MDA','2023-07-24 14:34:11',14),(4,'FORMULÁRIO DISPOSITIVO  DE AGULHAS + IMPRESSORA','2019-04-29 22:48:35',2),(5,'FORMULÁRIO DISPOSITIVO  DE AGULHAS ALLIAGE','2019-09-05 09:11:42',2),(6,'FORMULÁRIO DISPOSITIVO SEM AGULHAS ','2019-04-29 22:26:33',2),(7,'FORMULÁRIO DE DISPOSITIVO TELIT ','2022-10-14 14:21:08',4),(8,'FORMULÁRIO MÁQUINAS','2019-09-02 17:25:41',8),(9,'FORMULÁRIO FIXTURE ICT','2023-07-24 14:34:44',14),(10,'SIM','2024-02-01 09:24:33',47);
/*!40000 ALTER TABLE `formularios_manutencao_preventiva` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-10  9:24:47
