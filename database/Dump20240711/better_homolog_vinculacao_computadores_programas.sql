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
-- Table structure for table `vinculacao_computadores_programas`
--

DROP TABLE IF EXISTS `vinculacao_computadores_programas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vinculacao_computadores_programas` (
  `vpc_id` int(10) NOT NULL AUTO_INCREMENT,
  `vpc_computadores_cmp_id` int(10) NOT NULL,
  `vpc_programas_pgr_id` int(10) NOT NULL,
  PRIMARY KEY (`vpc_id`,`vpc_computadores_cmp_id`,`vpc_programas_pgr_id`),
  KEY `fk_computadores_has_programas_programas1_idx` (`vpc_programas_pgr_id`),
  KEY `fk_computadores_has_programas_computadores1_idx` (`vpc_computadores_cmp_id`),
  CONSTRAINT `fk_computadores_has_programas_computadores1` FOREIGN KEY (`vpc_computadores_cmp_id`) REFERENCES `computadores` (`cmp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_computadores_has_programas_programas1` FOREIGN KEY (`vpc_programas_pgr_id`) REFERENCES `programas` (`pgr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vinculacao_computadores_programas`
--

LOCK TABLES `vinculacao_computadores_programas` WRITE;
/*!40000 ALTER TABLE `vinculacao_computadores_programas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vinculacao_computadores_programas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-10  9:24:31
