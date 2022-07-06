-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_app_db2
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
-- Table structure for table `REG_AMIZADE`
--

DROP TABLE IF EXISTS `REG_AMIZADE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REG_AMIZADE` (
  `numb` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_AMIZADE`
--

LOCK TABLES `REG_AMIZADE` WRITE;
/*!40000 ALTER TABLE `REG_AMIZADE` DISABLE KEYS */;
INSERT INTO `REG_AMIZADE` VALUES (7),(7),(7),(7),(7),(7),(7),(7),(7),(7),(7),(7),(7),(7);
/*!40000 ALTER TABLE `REG_AMIZADE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amizade`
--

DROP TABLE IF EXISTS `amizade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amizade` (
  `amizade_leitor_id_fk` int DEFAULT NULL,
  `amizade_leitor_amigo_id_fk` int DEFAULT NULL,
  UNIQUE KEY `amizade_uq` (`amizade_leitor_id_fk`,`amizade_leitor_amigo_id_fk`),
  UNIQUE KEY `amizade_uq_2` (`amizade_leitor_amigo_id_fk`,`amizade_leitor_id_fk`),
  CONSTRAINT `amizade_leitor_amigo_fk` FOREIGN KEY (`amizade_leitor_amigo_id_fk`) REFERENCES `leitor` (`leitor_id`),
  CONSTRAINT `amizade_leitor_fk` FOREIGN KEY (`amizade_leitor_id_fk`) REFERENCES `leitor` (`leitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amizade`
--

LOCK TABLES `amizade` WRITE;
/*!40000 ALTER TABLE `amizade` DISABLE KEYS */;
INSERT INTO `amizade` VALUES (100,101),(100,104),(100,105),(101,102),(101,103),(102,103),(103,105);
/*!40000 ALTER TABLE `amizade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `autor_id` int NOT NULL AUTO_INCREMENT,
  `autor_nome` varchar(100) DEFAULT NULL,
  `autor_nascimento` date DEFAULT NULL,
  `autor_nacionalidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`autor_id`),
  UNIQUE KEY `autor_uq` (`autor_nome`,`autor_nascimento`,`autor_nacionalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (104,'Ashlee Vance','1977-01-01','Sul-Africano'),(101,'Carol Dweck','1946-10-17','Americana'),(103,'Cristina Martín Jiménez','1974-05-04','Espanhola'),(105,'Mário Sergio Cortella','1954-03-05','Brasileiro'),(102,'Neil Gaiman','1960-11-10','Britânico'),(100,'Robert Cecil Martin','1952-01-01','Americano');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca` (
  `biblioteca_leitor_id_fk` int DEFAULT NULL,
  `biblioteca_livro_id_fk` int DEFAULT NULL,
  KEY `biblioteca_leitor_fk` (`biblioteca_leitor_id_fk`),
  KEY `biblioteca_livro_fk` (`biblioteca_livro_id_fk`),
  CONSTRAINT `biblioteca_leitor_fk` FOREIGN KEY (`biblioteca_leitor_id_fk`) REFERENCES `leitor` (`leitor_id`),
  CONSTRAINT `biblioteca_livro_fk` FOREIGN KEY (`biblioteca_livro_id_fk`) REFERENCES `livro` (`livro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES (102,1007),(101,1001),(101,1003),(105,1000),(101,1007),(105,1006),(105,1003),(101,1005),(103,1005),(105,1005),(100,1005),(100,1004);
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitor`
--

DROP TABLE IF EXISTS `leitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitor` (
  `leitor_id` int NOT NULL AUTO_INCREMENT,
  `leitor_cpf` varchar(11) DEFAULT NULL,
  `leitor_nome` varchar(100) DEFAULT NULL,
  `leitor_nascimento` date DEFAULT NULL,
  PRIMARY KEY (`leitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitor`
--

LOCK TABLES `leitor` WRITE;
/*!40000 ALTER TABLE `leitor` DISABLE KEYS */;
INSERT INTO `leitor` VALUES (100,'90854530037','Daniela Avila Neutzling','2002-12-20'),(101,'01256335698','Henrique Avila Neutzling','2011-02-18'),(102,'01258965892','Daniel Barão','1982-02-27'),(103,'23665485910','Carla Medeiros','1982-05-13'),(104,'15495569823','Paulo André','1997-10-20'),(105,'65478552152','Júlia Lehmann','2003-04-13');
/*!40000 ALTER TABLE `leitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitura`
--

DROP TABLE IF EXISTS `leitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitura` (
  `leitura_leitor_id_fk` int DEFAULT NULL,
  `leitura_livro_id_fk` int DEFAULT NULL,
  `leitura_data_inicio` date DEFAULT NULL,
  `leitura_data_fim` date DEFAULT NULL,
  `leitura_classificacao` int DEFAULT NULL,
  UNIQUE KEY `leitura_uq` (`leitura_leitor_id_fk`,`leitura_livro_id_fk`),
  KEY `leitura_livro_fk` (`leitura_livro_id_fk`),
  CONSTRAINT `leitura_leitor_fk` FOREIGN KEY (`leitura_leitor_id_fk`) REFERENCES `leitor` (`leitor_id`),
  CONSTRAINT `leitura_livro_fk` FOREIGN KEY (`leitura_livro_id_fk`) REFERENCES `livro` (`livro_id`),
  CONSTRAINT `classificacao_chk` CHECK (((`leitura_classificacao` >= 0) and (`leitura_classificacao` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitura`
--

LOCK TABLES `leitura` WRITE;
/*!40000 ALTER TABLE `leitura` DISABLE KEYS */;
INSERT INTO `leitura` VALUES (100,1004,'2008-04-15','2008-05-09',5),(105,1000,'2021-12-08','2022-03-01',2),(103,1007,'2021-02-18','2021-03-16',4),(102,1002,'2021-09-15','2021-12-31',3),(104,1001,'2022-02-17','2022-03-20',1),(101,1006,'2022-03-31','2022-05-01',3),(100,1005,'2021-12-20','2022-02-18',5),(100,1000,'2022-06-15',NULL,NULL),(105,1007,'2022-05-30',NULL,NULL),(102,1007,'2022-04-25',NULL,NULL),(103,1001,'2022-04-16',NULL,NULL),(103,1002,'2022-04-20',NULL,NULL),(104,1002,'2022-05-10',NULL,NULL),(100,1003,'2022-06-01',NULL,NULL),(100,1001,'2022-06-01',NULL,NULL),(100,1002,'2022-06-01',NULL,NULL);
/*!40000 ALTER TABLE `leitura` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `tg_aft_ins_leitura` AFTER INSERT ON `leitura` FOR EACH ROW BEGIN
  INSERT INTO leitura_log (data_log) VALUES ( NOW() ); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `leitura_log`
--

DROP TABLE IF EXISTS `leitura_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitura_log` (
  `data_log` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitura_log`
--

LOCK TABLES `leitura_log` WRITE;
/*!40000 ALTER TABLE `leitura_log` DISABLE KEYS */;
INSERT INTO `leitura_log` VALUES ('2022-07-06 21:57:25');
/*!40000 ALTER TABLE `leitura_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `leituras_finalizadas_leitor`
--

DROP TABLE IF EXISTS `leituras_finalizadas_leitor`;
/*!50001 DROP VIEW IF EXISTS `leituras_finalizadas_leitor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `leituras_finalizadas_leitor` AS SELECT 
 1 AS `leitor_nome`,
 1 AS `livro_nome`,
 1 AS `autor_nome`,
 1 AS `livro_categoria`,
 1 AS `leitura_classificacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `leituras_nao_finalizadas_leitor`
--

DROP TABLE IF EXISTS `leituras_nao_finalizadas_leitor`;
/*!50001 DROP VIEW IF EXISTS `leituras_nao_finalizadas_leitor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `leituras_nao_finalizadas_leitor` AS SELECT 
 1 AS `leitor_nome`,
 1 AS `livro_nome`,
 1 AS `autor_nome`,
 1 AS `livro_categoria`,
 1 AS `leitura_classificacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `livro_id` int NOT NULL AUTO_INCREMENT,
  `livro_nome` varchar(100) DEFAULT NULL,
  `livro_edicao` int DEFAULT NULL,
  `livro_data_edicao` date DEFAULT NULL,
  `livro_categoria` varchar(100) DEFAULT NULL,
  `livro_autor_id_fk` int DEFAULT NULL,
  PRIMARY KEY (`livro_id`),
  UNIQUE KEY `livro_uq` (`livro_nome`,`livro_categoria`,`livro_autor_id_fk`),
  KEY `livro_autor_fk` (`livro_autor_id_fk`),
  CONSTRAINT `livro_autor_fk` FOREIGN KEY (`livro_autor_id_fk`) REFERENCES `autor` (`autor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1000,'Código limpo: Habilidades práticas do Agile Software',1,'2008-08-01','Programação',100),(1001,'Mindset: A nova psicologia do sucesso',1,'2017-01-24','Psicologia',101),(1002,'Os donos do mundo',1,'2020-08-06','Política',103),(1003,'Mitologia Nórdica',1,'2017-03-13','Mitologia',102),(1004,'Por que fazemos o que fazemos?',1,'2016-06-28','Filosofia',105),(1005,'Elon Musk: Como o CEO bilionário da SpaceX e da Tesla está moldando nosso futuro',1,'2015-09-16','Biografia',104),(1006,'A sorte segue a coragem!',1,'2018-01-26','Filosofia',105),(1007,'Agile Software Development, Principles, Patterns, and Practices',1,'2002-10-25','Programação',100);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_app_db2'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `conta_amizades` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`%`*/ /*!50106 EVENT `conta_amizades` ON SCHEDULE EVERY 30 SECOND STARTS '2022-07-06 22:17:17' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
set @f = (SELECT COUNT(*) FROM amizade);
insert into REG_AMIZADE values (@f);
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'db_app_db2'
--
/*!50003 DROP FUNCTION IF EXISTS `retorna_classificacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `retorna_classificacao`(f_leitor int) RETURNS double
BEGIN

set @h = (SELECT (SUM(leitura.leitura_classificacao) / COUNT(leitura.leitura_livro_id_fk) ) AS media_classificacao
  FROM leitura 
  JOIN leitor ON (leitor.leitor_id = leitura.leitura_leitor_id_fk)
 WHERE f_leitor = leitor.leitor_id
   AND leitura.leitura_classificacao IS NOT NULL);

RETURN @h;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insere_leitor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `insere_leitor`( IN leitor_cpf_p        VARCHAR(11),
													 IN leitor_nome_p       VARCHAR(100),
													 IN leitor_nascimento_p DATE )
BEGIN
   INSERT INTO leitor ( leitor_cpf       
                      , leitor_nome      
                      , leitor_nascimento
                      ) VALUES (
                        leitor_cpf_p    
                      , leitor_nome_p      
                      , leitor_nascimento_p
                      );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `leituras_finalizadas_leitor`
--

/*!50001 DROP VIEW IF EXISTS `leituras_finalizadas_leitor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `leituras_finalizadas_leitor` AS select `LE`.`leitor_nome` AS `leitor_nome`,`LI`.`livro_nome` AS `livro_nome`,`A`.`autor_nome` AS `autor_nome`,`LI`.`livro_categoria` AS `livro_categoria`,`L`.`leitura_classificacao` AS `leitura_classificacao` from (((`leitura` `L` join `leitor` `LE` on((`L`.`leitura_leitor_id_fk` = `LE`.`leitor_id`))) join `livro` `LI` on((`L`.`leitura_livro_id_fk` = `LI`.`livro_id`))) join `autor` `A` on((`A`.`autor_id` = `LI`.`livro_autor_id_fk`))) where (`L`.`leitura_data_fim` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `leituras_nao_finalizadas_leitor`
--

/*!50001 DROP VIEW IF EXISTS `leituras_nao_finalizadas_leitor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `leituras_nao_finalizadas_leitor` AS select `LE`.`leitor_nome` AS `leitor_nome`,`LI`.`livro_nome` AS `livro_nome`,`A`.`autor_nome` AS `autor_nome`,`LI`.`livro_categoria` AS `livro_categoria`,`L`.`leitura_classificacao` AS `leitura_classificacao` from (((`leitura` `L` join `leitor` `LE` on((`L`.`leitura_leitor_id_fk` = `LE`.`leitor_id`))) join `livro` `LI` on((`L`.`leitura_livro_id_fk` = `LI`.`livro_id`))) join `autor` `A` on((`A`.`autor_id` = `LI`.`livro_autor_id_fk`))) where (`L`.`leitura_data_fim` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-06 19:24:05
