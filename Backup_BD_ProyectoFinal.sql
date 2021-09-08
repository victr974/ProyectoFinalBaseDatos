-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: admininventario
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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `codigoCategoria` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`codigoCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Comida'),(2,'Bebidas'),(3,'Bebidas con Alcohol'),(4,'Carnes');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `nit` int NOT NULL AUTO_INCREMENT,
  `dpi` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` int NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`nit`)
) ENGINE=InnoDB AUTO_INCREMENT=87344 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (12741,'6475 00524 28878','Edgar Rodriguez','Rabinal Baja Verapaz',52276323,'rodriguez@gmail.com'),(17343,'3113 00339 13503','Pedro Soto','Salama Baja Verapaz',24739273,'pedsoto@gmail.com'),(37445,'2465 00356 16873','Victor Cortez','Rabinal Baja Verapaz',58879318,'renecorte871@gmail.com'),(42345,'4255 01814 11442','Aracely Garcia','Coban',32531276,'araGarcia@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas` (
  `idEntrada` int NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL,
  `codigoProveedor` int NOT NULL,
  `cantidadProducto` int NOT NULL,
  PRIMARY KEY (`idEntrada`),
  KEY `codigoProveedor` (`codigoProveedor`),
  CONSTRAINT `entradas_ibfk_1` FOREIGN KEY (`codigoProveedor`) REFERENCES `proveedores` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
INSERT INTO `entradas` VALUES (1,'2021-05-12 07:28:32',1,32),(2,'2021-04-29 03:08:54',2,43),(3,'2021-03-22 02:12:19',3,54);
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `Nofactura` int NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL,
  `datosCliente` varchar(100) NOT NULL,
  `codigoProducto` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `cantidad` int NOT NULL,
  `totalFactura` int NOT NULL,
  `codigo_cliente` int NOT NULL,
  PRIMARY KEY (`Nofactura`),
  KEY `codigo_cliente` (`codigo_cliente`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `clientes` (`nit`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (2345,'2021-02-11 18:20:32','Aracely Alavarado','05','Pastel de Zanahoria',2,178,42345),(2422,'2021-03-29 03:20:32','Pedro Soto','02','Chuletas de Cerdo',12,600,17343),(4344,'2021-05-16 03:12:10','René Soto','2','Soda',4,356,12741);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `codigoProducto` int NOT NULL,
  `typeRegistro` int NOT NULL,
  `fecha` timestamp NOT NULL,
  `precio` varchar(255) NOT NULL,
  `entradas` int NOT NULL,
  `salidas` int NOT NULL,
  KEY `codigoProducto` (`codigoProducto`),
  KEY `typeRegistro` (`typeRegistro`),
  KEY `entradas` (`entradas`),
  KEY `salidas` (`salidas`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`codigoProducto`) REFERENCES `productos` (`codigoProducto`) ON DELETE CASCADE,
  CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`typeRegistro`) REFERENCES `tiporegistro` (`id`) ON DELETE CASCADE,
  CONSTRAINT `inventario_ibfk_3` FOREIGN KEY (`entradas`) REFERENCES `entradas` (`idEntrada`) ON DELETE CASCADE,
  CONSTRAINT `inventario_ibfk_4` FOREIGN KEY (`salidas`) REFERENCES `salidas` (`idSalida`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,'2021-03-11 17:00:32','574',1,1),(2,2,'2021-04-19 03:22:42','432',2,2),(3,3,'2021-03-13 02:10:11','53',3,3),(1,1,'2021-03-11 17:00:32','574',1,1),(2,2,'2021-04-19 03:22:42','432',2,2),(3,3,'2021-03-13 02:10:11','53',3,3);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `codigoProducto` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` varchar(50) NOT NULL,
  `unitario` int NOT NULL,
  `precioDocena` varchar(50) NOT NULL,
  `precioMayor` varchar(50) NOT NULL,
  `existencia` int NOT NULL,
  `tipoEmpaque` varchar(50) NOT NULL,
  `codigoProducto_categoria` int DEFAULT NULL,
  PRIMARY KEY (`codigoProducto`),
  KEY `codigoProducto_categoria` (`codigoProducto_categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`codigoProducto_categoria`) REFERENCES `categorias` (`codigoCategoria`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Café Americano','35',3,'420','490',15,'empaque primario',2),(2,'Chuletas de Cerdo','50',60,'600','650',31,'bosa',1),(3,'Pastel rosa','342',12,'644','786',110,'carton',4);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nit` int NOT NULL,
  `razonSocial` varchar(50) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` int NOT NULL,
  `paginaWeb` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contatoPrincipal` varchar(50) NOT NULL,
  `codigo_producto` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_producto` (`codigo_producto`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigoProducto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,92344,'Grupo Modesto','Salama B.V',58474723,'https://www.GrupoModesto.com','Grupm@gmail.com','Carmen Garcia',1),(2,932345,'Brothers Lopez','Rabinal B.V',47838732,'https://www.BrothersLopez.com','Brothers@gmail.com','Lesly Kastro',2),(3,235212,'Grupo Gastronomico S.A','Salama',38742123,'https://www.GarciaArmenteros.com','GarciaArmentero.com','Solis Garcia',3);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidas`
--

DROP TABLE IF EXISTS `salidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salidas` (
  `idSalida` int NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL,
  `cantidadProducto` int NOT NULL,
  PRIMARY KEY (`idSalida`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidas`
--

LOCK TABLES `salidas` WRITE;
/*!40000 ALTER TABLE `salidas` DISABLE KEYS */;
INSERT INTO `salidas` VALUES (1,'2021-01-15 08:23:13',45),(2,'2021-02-11 05:20:22',23),(3,'2021-03-10 03:10:32',76),(4,'2021-05-16 02:12:10',78);
/*!40000 ALTER TABLE `salidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiporegistro`
--

DROP TABLE IF EXISTS `tiporegistro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiporegistro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiporegistro`
--

LOCK TABLES `tiporegistro` WRITE;
/*!40000 ALTER TABLE `tiporegistro` DISABLE KEYS */;
INSERT INTO `tiporegistro` VALUES (1,'venta'),(2,'compra'),(3,'venta'),(4,'compra');
/*!40000 ALTER TABLE `tiporegistro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'admininventario'
--

--
-- Dumping routines for database 'admininventario'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-15  1:05:20
