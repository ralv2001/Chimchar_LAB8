CREATE DATABASE  IF NOT EXISTS `lab8` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lab8`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab8
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `empresa_seguro`
--

DROP TABLE IF EXISTS `empresa_seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_seguro` (
  `id_empresa_seguro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_empresa_seguro`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_seguro`
--

LOCK TABLES `empresa_seguro` WRITE;
/*!40000 ALTER TABLE `empresa_seguro` DISABLE KEYS */;
INSERT INTO `empresa_seguro` VALUES (1,'Rimac'),(2,'Pacifico'),(3,'La positiva'),(4,'Seguro internacional'),(5,'Otro');
/*!40000 ALTER TABLE `empresa_seguro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mis_viajes`
--

DROP TABLE IF EXISTS `mis_viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_viajes` (
  `id_mis_viajes` int NOT NULL,
  `fecha_reserva` date NOT NULL,
  `fecha_viaje` date NOT NULL,
  `ciudad_origen` varchar(100) NOT NULL,
  `ciudad_destino` varchar(100) NOT NULL,
  `empresa_seguro_id_empresa_seguro` int NOT NULL,
  `usuarios_id_usuarios` int NOT NULL,
  `costo_unitario` double NOT NULL,
  `numero_de_boletos` int NOT NULL,
  PRIMARY KEY (`id_mis_viajes`),
  KEY `fk_viajes_empresa_seguro1_idx` (`empresa_seguro_id_empresa_seguro`),
  KEY `fk_viajes_usuarios1_idx` (`usuarios_id_usuarios`),
  CONSTRAINT `fk_viajes_empresa_seguro1` FOREIGN KEY (`empresa_seguro_id_empresa_seguro`) REFERENCES `empresa_seguro` (`id_empresa_seguro`),
  CONSTRAINT `fk_viajes_usuarios1` FOREIGN KEY (`usuarios_id_usuarios`) REFERENCES `usuarios` (`id_usuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mis_viajes`
--

LOCK TABLES `mis_viajes` WRITE;
/*!40000 ALTER TABLE `mis_viajes` DISABLE KEYS */;
INSERT INTO `mis_viajes` VALUES (10012323,'2025-10-30','2026-02-28','Lima','Medellín',4,8,350,2),(10054523,'2024-11-18','2025-02-28','Lima','Medellín',4,8,350,1),(10231223,'2026-11-12','2027-03-10','Lima','Medellín',4,8,350,1),(11223444,'2024-12-25','2025-04-15','Lima','Río de Janeiro',5,10,380,3),(11227544,'2025-12-05','2026-04-20','Lima','Río de Janeiro',5,2,380,1),(11263344,'2024-02-14','2024-05-30','Lima','Río de Janeiro',5,8,380,1),(12343344,'2026-12-20','2027-04-30','Lima','Río de Janeiro',5,10,380,3),(12345678,'2023-05-14','2023-08-15','Lima','Buenos Aires',1,1,150,2),(22332355,'2026-01-10','2026-05-15','Arequipa','Cusco',1,9,170,2),(22334755,'2024-03-22','2024-06-20','Arequipa','Cusco',1,11,170,4),(22337555,'2025-01-30','2025-05-20','Arequipa','Cusco',1,4,170,2),(22534455,'2027-01-25','2027-05-20','Arequipa','Cusco',1,4,170,2),(23456789,'2023-06-20','2023-09-10','Cusco','Machu Picchu',2,3,200,1),(33235566,'2027-03-02','2027-07-10','Lima','Buenos Aires',2,9,300,2),(33442366,'2026-02-20','2026-06-10','Lima','Buenos Aires',2,6,300,3),(33442666,'2025-02-15','2025-06-05','Lima','Buenos Aires',2,9,300,2),(33445556,'2024-04-28','2024-08-10','Lima','Buenos Aires',2,3,300,2),(34557890,'2023-07-05','2023-08-30','Lima','Santiago',3,5,300,4),(44552377,'2025-03-22','2025-07-10','Lima','Santiago',3,5,250,3),(44555677,'2026-03-30','2026-07-20','Lima','Santiago',3,5,250,3),(44556657,'2024-05-30','2024-09-05','Lima','Santiago',3,9,250,3),(44646677,'2027-04-10','2027-08-15','Lima','Santiago',3,5,250,3),(45628901,'2023-08-02','2023-10-15','Cusco','Lima',4,2,180,3),(55623488,'2025-04-30','2025-08-15','Cusco','Arequipa',4,3,200,1),(55667488,'2024-06-15','2024-08-30','Cusco','Machu Picchu',4,5,200,1),(55675788,'2026-05-07','2026-09-05','Piura','Bogota',4,3,200,1),(55757788,'2027-05-15','2027-09-30','Lima','Paris',4,3,500,1),(56389012,'2023-09-10','2023-11-20','Arequipa','Lima',5,7,250,2),(66723499,'2025-06-05','2025-09-30','Lima','Arequipa',5,7,180,2),(66772399,'2026-06-15','2026-10-15','Lima','Arequipa',5,7,180,2),(66773599,'2024-07-20','2024-10-15','Lima','Arequipa',5,1,180,2),(67390123,'2023-10-18','2024-01-05','Lima','Sao Paulo',1,9,350,1),(77883200,'2024-08-28','2024-12-10','Lima','Sao Paulo',1,7,320,1),(77883500,'2026-07-20','2026-11-20','Lima','Sao Paulo',1,11,320,4),(77886500,'2025-07-12','2025-11-10','Lima','Sao Paulo',1,6,320,4),(78101234,'2023-11-25','2024-03-10','Lima','Bogotá',2,6,280,3),(82012345,'2023-12-30','2024-02-28','Cusco','Lima',3,10,200,2),(88992241,'2026-08-30','2026-12-30','Lima','Bogotá',2,6,280,1),(88992311,'2025-08-20','2026-01-05','Lima','Bogotá',2,11,280,1),(88992411,'2024-09-05','2025-01-20','Lima','Bogotá',2,6,280,4),(96123456,'2024-01-06','2024-04-15','Lima','Medellín',4,4,320,2),(99002322,'2024-10-12','2025-03-05','Cusco','Lima',3,2,200,2),(99005322,'2025-09-28','2026-03-15','Cusco','Lima',3,4,200,3),(99461122,'2026-10-05','2027-01-15','Cusco','Lima',3,2,200,2);
/*!40000 ALTER TABLE `mis_viajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Normal'),(2,'Silver'),(3,'Gold'),(4,'Platinum');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuarios` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `edad` int NOT NULL,
  `codigoPUCP` int NOT NULL,
  `correo` varchar(100) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `contrasenia` varchar(200) NOT NULL,
  `status_idstatus` int NOT NULL,
  PRIMARY KEY (`id_usuarios`),
  KEY `fk_usuarios_status1_idx` (`status_idstatus`),
  CONSTRAINT `fk_usuarios_status1` FOREIGN KEY (`status_idstatus`) REFERENCES `status` (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Ricardo','Alvarado',20,12345678,'a12345678@pucp.edu.pe','Telecomunicaciones','ralvarado',1),(2,'Aracelli','La Rosa',20,20206456,'a20206456@pucp.edu.pe','Telecomunicaciones','alarosa',1),(3,'Pablo','Flores',23,20203315,'a20203315@pucp.edu.pe','Telecomunicaciones','pflores',2),(4,'Joselin','Raimundo',18,20201236,'a20201236@pucp.edu.pe','Telecomunicaciones','jraimundo',2),(5,'Sebastian','Fuentes',26,20201478,'a20201478@pucp.edu.pe','Telecomunicaciones','sfuentes',3),(6,'Leonardo','Garcia',23,20178541,'a20178541@pucp.edu.pe','Telecomunicaciones','lgarcia',3),(7,'Maria','Mendoza',27,20154512,'a20154512@pucp.edu.pe','Telecomunicaciones','mmendoza',4),(8,'Clara','Ramirez',19,20212415,'a20212415@pucp.edu.pe','Telecomunicaciones','cramirez',4),(9,'Ronald','Perez',22,20197854,'a20197854@pucp.edu.pe','Arquitectura','rperez',3),(10,'Samuel','Linares',25,20181524,'a20181524@pucp.edu.pe','Civil','slinares',2),(11,'Pedro','Ramos',35,201012345,'a201012345@pucp.edu.pe','Derecho','pramos',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lab8'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-17 14:12:22
