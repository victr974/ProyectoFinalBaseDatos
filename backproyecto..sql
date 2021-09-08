-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: controlpersonal
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `asigna`
--

DROP TABLE IF EXISTS `asigna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asigna` (
  `CodigoAsigna` int NOT NULL,
  `CodPersona` varchar(45) DEFAULT NULL,
  `CodDep` varchar(45) DEFAULT NULL,
  `CodPuesto` varchar(45) DEFAULT NULL,
  `FechaAsigna` timestamp NULL DEFAULT NULL,
  `FechincioLa` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`CodigoAsigna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asigna`
--

LOCK TABLES `asigna` WRITE;
/*!40000 ALTER TABLE `asigna` DISABLE KEYS */;
INSERT INTO `asigna` VALUES (1,'1287 88883 0101','0411','001','2020-02-12 17:11:04','2021-02-12 17:18:04'),(2,'2320 55432 0103','0512','002','2020-04-03 03:12:03','2021-02-12 23:01:11'),(3,'2349 31345 0808','0613','003','2020-01-24 02:11:23','2021-02-13 03:19:16'),(4,'7319 24572 2112','0114','004','2020-02-22 23:10:14','2021-02-13 01:18:19'),(5,'1923 23321 1235','5234','005','2020-03-25 08:01:24','2021-02-13 03:14:02');
/*!40000 ALTER TABLE `asigna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `CodDepto` int NOT NULL,
  `NombreDepto` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `CantEmpleados` varchar(45) DEFAULT NULL,
  `Asigna_CodigoAsigna` int NOT NULL,
  PRIMARY KEY (`CodDepto`),
  KEY `Asigna_CodigoAsigna` (`Asigna_CodigoAsigna`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`Asigna_CodigoAsigna`) REFERENCES `asigna` (`CodigoAsigna`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (114,'Marketing','Esstudio del mercado','3',4),(411,'Logistica','Gestion empresas de logistica','3',1),(512,'Compras','Control de calidad','4',2),(613,'Produccion','Control cajas y atender pagos','2',3),(5234,'Comercial','Presupuesto de ventas','1',5);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `CodPersonal` int NOT NULL,
  `Nombres` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `FechaNacimiento` timestamp NULL DEFAULT NULL,
  `Puesto_CodPuesto` int NOT NULL,
  `Departamento_CodDepto` int NOT NULL,
  `Asigna_CodigoAsigna` int NOT NULL,
  PRIMARY KEY (`CodPersonal`),
  KEY `Puesto_CodPuesto` (`Puesto_CodPuesto`),
  KEY `Departamento_CodDepto` (`Departamento_CodDepto`),
  KEY `Asigna_CodigoAsigna` (`Asigna_CodigoAsigna`),
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`Puesto_CodPuesto`) REFERENCES `puesto` (`CodPuesto`) ON DELETE CASCADE,
  CONSTRAINT `personal_ibfk_2` FOREIGN KEY (`Departamento_CodDepto`) REFERENCES `departamento` (`CodDepto`) ON DELETE CASCADE,
  CONSTRAINT `personal_ibfk_3` FOREIGN KEY (`Asigna_CodigoAsigna`) REFERENCES `asigna` (`CodigoAsigna`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Victor Rene','Cortez Sis','renecortez871@gmail.com','1999-02-04 06:00:00',1223,114,1),(2,'Sheyli Ely','Tecu Alvarado','sheelyta@gmail.com','2000-08-04 06:00:00',1345,411,2),(3,'Karen Adrina','Chur Garcia','kachurg@gmail.com','1995-10-01 06:00:00',2221,512,3),(4,'Sonia','Cortez','soniacortez@gmail.com','1998-12-12 06:00:00',2322,613,4),(5,'Perla','Garcia','perg@gmail.com','1997-02-01 06:00:00',3122,5234,5);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `savebitacora` AFTER UPDATE ON `personal` FOR EACH ROW insert into bitacora(codPersona, fecha, usuario) values(CURRENT_USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puesto` (
  `CodPuesto` int NOT NULL,
  `NombrePuesto` varchar(45) DEFAULT NULL,
  `Descrip` varchar(45) DEFAULT NULL,
  `SueldoBase` varchar(45) DEFAULT NULL,
  `Bono` varchar(45) DEFAULT NULL,
  `Bonificación` varchar(45) DEFAULT NULL,
  `Asigna_CodigoAsigna` int NOT NULL,
  PRIMARY KEY (`CodPuesto`),
  KEY `Asigna_CodigoAsigna` (`Asigna_CodigoAsigna`),
  CONSTRAINT `puesto_ibfk_1` FOREIGN KEY (`Asigna_CodigoAsigna`) REFERENCES `asigna` (`CodigoAsigna`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
INSERT INTO `puesto` VALUES (1223,'Gerente','A cargo de direccion o cordinacion','7000','800','300',4),(1345,'Cajero','Llevar el contro de caja','5000','500','250',5),(2221,'Admin de redes','Funcion gestionar y cordinador','8000','1100','500',2),(2322,'Supervisor','Responsable de asesorar','7890','1000','400',1),(3122,'Admin de proyectos','Responsable para llevar a cabo el proyecto','7500','900','350',3);
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'controlpersonal'
--

--
-- Dumping routines for database 'controlpersonal'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-17 15:44:26
