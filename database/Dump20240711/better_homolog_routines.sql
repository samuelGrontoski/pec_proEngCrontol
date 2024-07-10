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
-- Dumping events for database 'better_homolog'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `INDICATORS_RECORDER` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE EVENT `INDICATORS_RECORDER` ON SCHEDULE EVERY 1 DAY STARTS '2017-11-28 00:00:01' ON COMPLETION PRESERVE ENABLE DO BEGIN
		INSERT INTO indicadores (
			ind_data,
			ind_minutos_diario, 
			ind_atendimento_diario, 
			ind_atraso_diario, 
			ind_minutos_semanal, 
			ind_atendimento_semanal, 
			ind_atraso_semanal, 
			ind_minutos_mensal, 
			ind_atendimento_mensal, 
			ind_atraso_mensal)
		SELECT 
		(
			SELECT DATE_FORMAT((NOW() - INTERVAL 1 DAY), "%Y-%m-%d")
		) AS ind_data,
		(
			SELECT 
				pdp_total_horas * 60
			FROM
				planos_de_producao
			WHERE
				pdp_data = DATE(NOW() - INTERVAL 1 DAY)
		) AS ind_minutos_diario,
		(
			SELECT 
				SUM(TIMESTAMPDIFF(MINUTE, IF(cha_data_hora_abertura > cha_data_hora_atendimento, cha_data_hora_abertura, cha_data_hora_atendimento), cha_data_hora_termino)) AS dia_duracao_atendimento
			FROM 
				chamados 
				LEFT JOIN acoes_chamados ON cha_acao = ach_id
				LEFT JOIN detratores ON ach_detrator = dtr_id
			WHERE
				cha_status = 3
				AND cha_plano = 1
				AND DATE(cha_data_hora_abertura) = DATE(NOW() - INTERVAL 1 DAY)
				AND cha_data_hora_abertura < cha_data_hora_termino
				AND dtr_indicador > 0
		) AS ind_atendimento_diario,

		(
			SELECT 
				SUM(IF(cha_data_hora_abertura < cha_data_hora_atendimento, TIMESTAMPDIFF(MINUTE, cha_data_hora_abertura, cha_data_hora_atendimento), 0)) AS dia_duracao_atraso
			FROM 
				chamados 
				LEFT JOIN acoes_chamados ON cha_acao = ach_id
				LEFT JOIN detratores ON ach_detrator = dtr_id
			WHERE
				cha_status = 3
				AND cha_plano = 1
				AND DATE(cha_data_hora_abertura) = DATE(NOW() - INTERVAL 1 DAY)
				AND cha_data_hora_abertura < cha_data_hora_termino
				AND dtr_indicador > 0
		) AS ind_atraso_diario,

		(
			SELECT 
				SUM(pdp_total_horas * 60)
			FROM
				planos_de_producao
			WHERE
				WEEK(pdp_data) = WEEK(NOW() - INTERVAL 1 DAY)
				AND YEAR(pdp_data) = YEAR(NOW() - INTERVAL 1 DAY)
		) AS ind_minutos_semanal,

		(
			SELECT
				SUM(TIMESTAMPDIFF(MINUTE, IF(cha_data_hora_abertura > cha_data_hora_atendimento, cha_data_hora_abertura, cha_data_hora_atendimento), cha_data_hora_termino)) AS semana_duracao_atendimento
			FROM             
				chamados 
				LEFT JOIN acoes_chamados ON cha_acao = ach_id
				LEFT JOIN detratores ON ach_detrator = dtr_id
			WHERE
				cha_status = 3
				AND cha_plano = 1
				AND WEEK(cha_data_hora_abertura) = WEEK(NOW() - INTERVAL 1 DAY)
				AND YEAR(cha_data_hora_abertura) = YEAR(NOW() - INTERVAL 1 DAY)
				AND cha_data_hora_abertura < cha_data_hora_termino
				AND dtr_indicador > 0
		) AS ind_atendimento_semanal,

		(
			SELECT
				SUM(IF(cha_data_hora_abertura < cha_data_hora_atendimento, TIMESTAMPDIFF(MINUTE, cha_data_hora_abertura, cha_data_hora_atendimento), 0)) AS semana_duracao_atraso
			FROM             
				chamados 
				LEFT JOIN acoes_chamados ON cha_acao = ach_id
				LEFT JOIN detratores ON ach_detrator = dtr_id
			WHERE
				cha_status = 3
				AND cha_plano = 1
				AND WEEK(cha_data_hora_abertura) = WEEK(NOW() - INTERVAL 1 DAY)
				AND YEAR(cha_data_hora_abertura) = YEAR(NOW() - INTERVAL 1 DAY)
				AND cha_data_hora_abertura < cha_data_hora_termino
				AND dtr_indicador > 0
		) AS ind_atraso_semanal,

		(
			SELECT 
				SUM(pdp_total_horas * 60)
			FROM
				planos_de_producao
			WHERE
				MONTH(pdp_data) = MONTH(NOW() - INTERVAL 1 DAY)
				AND YEAR(pdp_data) = YEAR(NOW() - INTERVAL 1 DAY)
		) AS ind_minutos_mensal,
		(
			SELECT
				SUM(TIMESTAMPDIFF(MINUTE, IF(cha_data_hora_abertura > cha_data_hora_atendimento, cha_data_hora_abertura, cha_data_hora_atendimento), cha_data_hora_termino)) AS mes_duracao_atendimento
			FROM             
				chamados 
				LEFT JOIN acoes_chamados ON cha_acao = ach_id
				LEFT JOIN detratores ON ach_detrator = dtr_id
			WHERE
				cha_status = 3
				AND cha_plano = 1
				AND MONTH(cha_data_hora_abertura) = MONTH(NOW() - INTERVAL 1 DAY)
				AND YEAR(cha_data_hora_abertura) = YEAR(NOW() - INTERVAL 1 DAY)
				AND cha_data_hora_abertura < cha_data_hora_termino
				AND dtr_indicador > 0
		) AS ind_atendimento_mensal,

		(
			SELECT
				SUM(IF(cha_data_hora_abertura < cha_data_hora_atendimento, TIMESTAMPDIFF(MINUTE, cha_data_hora_abertura, cha_data_hora_atendimento), 0)) AS mes_duracao_atraso
			FROM             
				chamados 
				LEFT JOIN acoes_chamados ON cha_acao = ach_id
				LEFT JOIN detratores ON ach_detrator = dtr_id
			WHERE
				cha_status = 3
				AND cha_plano = 1
				AND MONTH(cha_data_hora_abertura) = MONTH(NOW() - INTERVAL 1 DAY)
				AND YEAR(cha_data_hora_abertura) = YEAR(NOW() - INTERVAL 1 DAY)
				AND cha_data_hora_abertura < cha_data_hora_termino
				AND dtr_indicador > 0
		) AS ind_atraso_mensal;
	END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'better_homolog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-10  9:25:04
