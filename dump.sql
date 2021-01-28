-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `control`
--

DROP TABLE IF EXISTS `control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control` (
  `idControl` int NOT NULL AUTO_INCREMENT,
  `idLibros` int DEFAULT NULL,
  `Prestamos` tinyint DEFAULT NULL,
  `Retornos` tinyint DEFAULT NULL,
  `Diferencias` tinyint DEFAULT NULL,
  `Stock` tinyint DEFAULT NULL,
  PRIMARY KEY (`idControl`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control`
--

LOCK TABLES `control` WRITE;
/*!40000 ALTER TABLE `control` DISABLE KEYS */;
INSERT INTO `control` VALUES (1,0,0,0,0,5),(2,0,0,0,0,5),(3,0,0,0,0,5),(4,0,0,0,0,5),(5,0,0,0,0,5);
/*!40000 ALTER TABLE `control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `idLibros` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(200) DEFAULT NULL,
  `Autor` varchar(60) DEFAULT NULL,
  `Editorial` varchar(60) DEFAULT NULL,
  `Edicion` tinyint DEFAULT NULL,
  `Año_publicacion` int DEFAULT NULL,
  `Pais` varchar(30) DEFAULT NULL,
  `ISBN` varchar(200) DEFAULT NULL,
  `Deposito_legal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idLibros`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'Fundamentos De Circuitos Electronicos  ','Charls K. Alexander','Mc graw Gill',3,2004,'Mexico ','73268003',' '),(2,'Ecuaciones Diferenciales Con Aplicaciones De Modelo','Dennis G. Zill','International Tomas Editores ',6,1997,'Mexico','532955746',' '),(3,'Speech And Lenguage Processing ','Daniel Jurasfsky & James H. Martin','Pretice Hall',2,2000,'USA','130950696',' '),(4,'Electronics robotics and automotive mechanics conference volume 1','IEEE computer society ','IEEE computer society',1,2006,'USA','0769525695','2006921349'),(5,'Matematicas 1 para preuniversitario','Merco Antonio Garcia Juarez','Esfinge',3,2005,'Mexico','9706479880',' ');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `idPrestamos` int NOT NULL AUTO_INCREMENT,
  `idUsuarios` int DEFAULT NULL,
  `idLibros` int DEFAULT NULL,
  `Fecha_Prestamo` date DEFAULT NULL,
  `Fecha_Retorno` date DEFAULT NULL,
  `Cumplimiento_Remoto` tinyint DEFAULT NULL,
  `Fecha_Retornop` date DEFAULT NULL,
  PRIMARY KEY (`idPrestamos`),
  KEY `fkpres_usu_idx` (`idUsuarios`),
  KEY `fipres_lib_idx` (`idLibros`),
  CONSTRAINT `fipres_lib` FOREIGN KEY (`idLibros`) REFERENCES `libros` (`idLibros`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fkpres_usu` FOREIGN KEY (`idUsuarios`) REFERENCES `usuario` (`idUsuarios`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (46,1,2,'2020-01-12','2020-01-17',1,'0000-00-00'),(47,2,1,'2020-01-12','2020-01-17',0,'2020-01-19'),(48,5,5,'2020-01-13','2020-01-18',1,'0000-00-00'),(49,2,3,'2020-01-13','2020-01-18',1,'0000-00-00'),(50,8,5,'2020-01-14','2020-01-19',1,'0000-00-00'),(51,3,5,'2020-01-14','2020-01-19',1,'0000-00-00'),(52,6,3,'2020-01-20','2020-01-25',0,'2020-01-27'),(53,4,3,'2020-02-10','2020-02-15',1,'0000-00-00'),(54,7,3,'2020-02-10','2020-02-15',1,'0000-00-00'),(55,2,1,'2020-03-05','2020-03-10',0,'0000-00-00'),(56,4,4,'2020-03-07','2020-03-12',1,'0000-00-00'),(57,1,2,'2020-01-12','2020-01-17',1,'0000-00-00');
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuarios` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `Apellido_paterno` varchar(60) DEFAULT NULL,
  `Apellido_materno` varchar(60) DEFAULT NULL,
  `Edad` tinyint DEFAULT NULL,
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Luis angel','Davila','Cruz',21),(2,'Jennifer','Nuñez','Lopez',22),(3,'Sara','Gomez','Garcia',19),(4,'Valentina','Morales','Leon',20),(5,'Cesar','Luna','Nava',24),(6,'Daniela','Rosales','Nieto',27),(7,'Katya','Castillo','Ramos',23),(8,'Osvaldo','Morales','Negrete',25),(9,'Jennifer','Nuñez','Lopez',22);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-24 19:03:10
