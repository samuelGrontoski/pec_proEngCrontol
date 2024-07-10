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
-- Table structure for table `controle_calibracao`
--

DROP TABLE IF EXISTS `controle_calibracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controle_calibracao` (
  `cal_id` int(10) NOT NULL AUTO_INCREMENT,
  `cal_codigo_sgi` varchar(20) DEFAULT NULL,
  `cal_num_patrimonio` varchar(20) DEFAULT NULL,
  `cal_codigo_sap` int(10) DEFAULT NULL,
  `cal_propriedade` int(10) DEFAULT NULL,
  `cal_marca` varchar(50) DEFAULT NULL,
  `cal_modelo` varchar(50) DEFAULT NULL,
  `cal_serial_number` varchar(50) DEFAULT NULL,
  `cal_descricao` varchar(100) DEFAULT NULL,
  `cal_local_uso` varchar(50) DEFAULT NULL,
  `cal_data_certificado_calibracao_avaliacao` date DEFAULT NULL,
  `cal_data_validade_certificado_calibracao_avaliacao` date DEFAULT NULL,
  `cal_freq_calibracao` int(4) DEFAULT NULL,
  `cal_situacao_equipamento` varchar(50) DEFAULT NULL,
  `cal_tipo_calibracao` char(1) DEFAULT NULL,
  `cal_criterio_aceitacao` varchar(50) DEFAULT NULL,
  `cal_laboratorio_calibracao` varchar(50) DEFAULT NULL,
  `cal_data_validade_garantia` date DEFAULT NULL,
  `cal_equip_necessitou_reparo` tinyint(1) DEFAULT NULL,
  `cal_data_reparo` date DEFAULT NULL,
  `cal_observacao` tinytext,
  PRIMARY KEY (`cal_id`),
  KEY `cal_propriedade` (`cal_propriedade`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controle_calibracao`
--

LOCK TABLES `controle_calibracao` WRITE;
/*!40000 ALTER TABLE `controle_calibracao` DISABLE KEYS */;
/*!40000 ALTER TABLE `controle_calibracao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-10  9:24:52
