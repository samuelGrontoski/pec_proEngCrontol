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
-- Table structure for table `colaboradores`
--

DROP TABLE IF EXISTS `colaboradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaboradores` (
  `col_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `col_nome` varchar(50) NOT NULL,
  `col_categoria` int(10) unsigned NOT NULL,
  `col_ativo` int(1) unsigned zerofill NOT NULL,
  `col_senha` varchar(50) NOT NULL,
  `col_login` varchar(50) NOT NULL,
  PRIMARY KEY (`col_id`),
  UNIQUE KEY `col_id_UNIQUE` (`col_id`),
  UNIQUE KEY `col_login_UNIQUE` (`col_login`),
  KEY `Categoria Colaborador_idx` (`col_categoria`),
  CONSTRAINT `col_categoria_FK` FOREIGN KEY (`col_categoria`) REFERENCES `categorias_colaboradores` (`cac_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaboradores`
--

LOCK TABLES `colaboradores` WRITE;
/*!40000 ALTER TABLE `colaboradores` DISABLE KEYS */;
INSERT INTO `colaboradores` VALUES (1,'LEANDRO JOSÉ BIESEK',20,1,'7c538fe50d0b81ac09841cef9b5b02a3','leandro.biesek'),(2,'SIMONE ANGELA NONNEMACHER 	',20,1,'2159edc72bb0b3631cfbd8d8a899652f','simone.nonnemacher'),(3,'MARCELO AUGUSTO CARDOSO',40,0,'97f1dc2a0abe6ce58fb45cdbda0e2107','marcelo.cardoso'),(4,'FRANCISCO DOS SANTOS',30,1,'c1988a70fe5d2f8a66703b8da1727f6b','francisco.santos'),(5,'FABIO FRANZOI DALBELO ',20,1,'e10adc3949ba59abbe56e057f20f883e','fabio.dalbelo'),(6,'BRUNO LUCAS MUNARINI',100,0,'be395a401184e7bc3c71ef877a9965d3','bruno.munarini'),(7,'HENRIQUE JOSE THIESEN',20,1,'ed2998a980c8dd8deec9861e33f8f74f','henrique.thiesen'),(8,'WILSON GASPAR VEIGA',20,1,'bc7316929fe1545bf0b98d114ee3ecb8','wilson.veiga'),(9,'LEANDRO DA SILVA FERREIRA',20,1,'827ccb0eea8a706c4c34a16891f84e7b','leandro.ferreira'),(10,'LUIZ FERNANDO SOARES',20,1,'31e0a92a2f51422d0982dd8ae4ebe248','luiz.soares'),(11,'GIOCONDO FRACARO DA SILVA',100,0,'827ccb0eea8a706c4c34a16891f84e7b','giocondo.silva'),(12,'DARLAN ANTONIO RIGO',100,1,'c3f42ad56f9d9d8f53c1600239df65fc','darlan.rigo'),(13,'MAX ALEXANDER VIACELLI',5,1,'827ccb0eea8a706c4c34a16891f84e7b','max.viacelli'),(14,'REGINALDO PANGARTE',10,1,'af3c1bad4e4ac134635c863e421038f1','reginaldo.pangarte'),(15,'THOMAS ERIK GASPAR DA SILVA',100,1,'2607d6c7bb6a2c8e23ca1249616c3b60','thomas.silva'),(16,'EDUARDO ROMANI PANAZZOLO',100,0,'80f18e785b259ac8f3d6a7da79a19f1d','eduardo.panazzolo'),(17,'RAFAEL DE OLIVEIRA MACHADO',20,0,'03262587626cb89039c4bf52d4e993ba','rafael.machado'),(18,'EDUARDO ANTONIO MALACARNE',100,0,'9be1c622e2ba1a3d08e25bfffd1396f8','eduardo.malacarne'),(19,'ADMINISTRADOR',1,1,'4b96d5c1ff312eea069ddc760794963d','administrador'),(20,'ERICK FERREIRA',100,1,'6bb3617a35b7a8f97fdfa5fee57486c6','erick.ferreira'),(21,'ALEXSSANDRO FANTINATO',5,1,'827ccb0eea8a706c4c34a16891f84e7b','alex.fantinato'),(23,'GABRIEL WERLICH RODRIGUES BARBOSA',20,1,'647431b5ca55b04fdf3c2fce31ef1915','gabriel.barbosa'),(24,'LUIS RAMON ZENI',100,1,'6e701f34faf390e258a544a2f3104c7e','luis.zeni'),(25,'FERNANDO HENRIQUE CARDOSO1',100,1,'46577ea9e58c27274af99af32aaa05cf','fernando1.cardoso1'),(26,'FRANCINE FONSECA',20,1,'2159edc72bb0b3631cfbd8d8a899652f','francine.fonseca'),(27,'WELINTON SANTOS BORGES',100,1,'fcd5353d75b0e310170dcf15d8343b3a','welinton.borges'),(28,'RAMON BAPTISTA DOS SANTOS VIEIRA',30,1,'8a66ffd589b1e7aeb6d009db13074837','ramon.vieira'),(29,'LEONARDO GABRIEL PANOZZO',100,1,'4e3f75baf626c8b1374d83ada40e1b16','leonardo.panozzo'),(30,'ADRIANO HARTMANN DE OLIVEIRA',20,1,'f49dd8becfec6445cc5054bb55de28e8','adriano.oliveira'),(31,'CLAUDIOVANI ANSCHAU',20,1,'124bd1296bec0d9d93c7b52a71ad8d5b','claudiovani.anschau'),(32,'DENILSON LOPES RODRIGUES',100,1,'49abc03bef1b90f6fdb3472ebafd36ce','denilson.rodrigues'),(33,'DOUGLAS IVATIUK MARTIM',1,1,'dcf45583ce5b6e58c5186e4d935d9e9d','douglas.martim'),(34,'GUILHERME CALDATO',100,1,'4e3f75baf626c8b1374d83ada40e1b16','guilherme.caldato'),(35,'ROQUE DEYVIS HOLDEFER',30,1,'4e3f75baf626c8b1374d83ada40e1b16','roque.holdefer'),(36,'EZEQUIEL GONSCHOROWSKI',30,1,'4e3f75baf626c8b1374d83ada40e1b16','ezequiel.g'),(38,'VILSON KALINOSKI JUNIOR',30,1,'5f2bf7ddfcd5e902a463d9d8a84d2426','vilson.junior'),(39,'ANDRE MIGUEL CRESTANI',20,0,'4e3f75baf626c8b1374d83ada40e1b16','andre.crestani'),(40,'LENON JOSE OSMARINI',30,1,'4e3f75baf626c8b1374d83ada40e1b16','lenon.osmarini'),(41,'MARCELO LOPES RODRIGUES',40,1,'61ee732e773cf70ae196762a1a725a8b','marcelo.rodrigues'),(42,'RAFAEL MANCUSO PARAISO CAVALCANTI',100,1,'012a7845ffbe2c6f192b2ae544a6e53a','rafael.cavalcanti'),(43,'MATHEUS HENRIQUE LUBIAN',30,1,'f3857a477b4ca254967f9229ebbadabd','matheus.lubian'),(44,'ERICCSON UCHOA FARIA',30,1,'d1ce1e4e69b6bb8913e0dcc75467fb31','ericcson.faria'),(45,'DOUGLAS FELIPE DE OLIVEIRA',20,1,'124bd1296bec0d9d93c7b52a71ad8d5b','douglas.oliveira'),(46,'KLEBER AUGUSTO MARQUES',30,1,'827ccb0eea8a706c4c34a16891f84e7b','kleber.marques'),(47,'VINICIUS BUZZACARO',30,1,'2eca99b8573f6c57d77444711f61f1e3','vinicius.buzzacaro'),(48,'LUIS TOCCOLINI',30,1,'124bd1296bec0d9d93c7b52a71ad8d5b','luis.toccolini'),(49,'MARCOS TULLIO SILVA DE SOUZA',5,1,'124bd1296bec0d9d93c7b52a71ad8d5b','marcos.souza'),(50,'VITOR HUGO MEGIOLARO',20,1,'827ccb0eea8a706c4c34a16891f84e7b','vitor.megiolaro'),(51,'Samuel Grontoski',10,1,'124bd1296bec0d9d93c7b52a71ad8d5b','samuel.grontoski'),(55,'OTAVIO AUGUSTO ZANOELO',30,1,'e10adc3949ba59abbe56e057f20f883e','otavio.zanoelo');
/*!40000 ALTER TABLE `colaboradores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-10  9:25:00
