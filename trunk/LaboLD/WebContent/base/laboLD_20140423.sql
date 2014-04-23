CREATE DATABASE  IF NOT EXISTS `labold` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `labold`;
-- MySQL dump 10.13  Distrib 5.1.40, for Win32 (ia32)
--
-- Host: localhost    Database: labold
-- ------------------------------------------------------
-- Server version	5.1.72-community

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
-- Table structure for table `estudio`
--

DROP TABLE IF EXISTS `estudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `numero` bigint(20) NOT NULL,
  `solicitadoPor` varchar(255) NOT NULL,
  `paciente_fk` bigint(20) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCE4A25BC5F3A212` (`paciente_fk`),
  CONSTRAINT `FKCE4A25BC5F3A212` FOREIGN KEY (`paciente_fk`) REFERENCES `paciente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudio`
--

LOCK TABLES `estudio` WRITE;
/*!40000 ALTER TABLE `estudio` DISABLE KEYS */;
INSERT INTO `estudio` VALUES (1,1,'Dr Muñoz Alberto',2,'2014-04-18 00:00:00'),(2,3,'Dr Muñoz Alberto',2,'2014-04-22 00:00:00');
/*!40000 ALTER TABLE `estudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `dni` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `fechaNacimiento` datetime DEFAULT NULL,
  `obraSocial_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK308177913F6E71F2` (`obraSocial_fk`),
  CONSTRAINT `FK308177913F6E71F2` FOREIGN KEY (`obraSocial_fk`) REFERENCES `obrasocial` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Gomez','45 n° 234',15125654,'','Ricardo','15-5442589','1960-10-20 00:00:00',1),(2,'Carnevale','66 n° 568',20258663,'','Elsa','15-5226398','1971-04-21 00:00:00',4);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obrasocial`
--

DROP TABLE IF EXISTS `obrasocial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obrasocial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obrasocial`
--

LOCK TABLES `obrasocial` WRITE;
/*!40000 ALTER TABLE `obrasocial` DISABLE KEYS */;
INSERT INTO `obrasocial` VALUES (1,'IOMA'),(2,'OSDE'),(4,'OSPE'),(5,'OSECAC');
/*!40000 ALTER TABLE `obrasocial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_item`
--

DROP TABLE IF EXISTS `rol_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_item` (
  `rol_fk` bigint(20) NOT NULL,
  `item_fk` bigint(20) NOT NULL,
  KEY `FKEFD143835DAE7FF6` (`rol_fk`),
  KEY `FKEFD1438316CAAED1` (`item_fk`),
  CONSTRAINT `FKEFD1438316CAAED1` FOREIGN KEY (`item_fk`) REFERENCES `itemmenu` (`id`),
  CONSTRAINT `FKEFD143835DAE7FF6` FOREIGN KEY (`rol_fk`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_item`
--

LOCK TABLES `rol_item` WRITE;
/*!40000 ALTER TABLE `rol_item` DISABLE KEYS */;
INSERT INTO `rol_item` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19);
/*!40000 ALTER TABLE `rol_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practica`
--

DROP TABLE IF EXISTS `practica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practica`
--

LOCK TABLES `practica` WRITE;
/*!40000 ALTER TABLE `practica` DISABLE KEYS */;
INSERT INTO `practica` VALUES (1,'Urocultivo'),(2,'Coprocultivo'),(3,'Urea'),(4,'Creatinina');
/*!40000 ALTER TABLE `practica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemmenu`
--

DROP TABLE IF EXISTS `itemmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemmenu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `item_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4A06A73216CAAED1` (`item_fk`),
  CONSTRAINT `FK4A06A73216CAAED1` FOREIGN KEY (`item_fk`) REFERENCES `itemmenu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemmenu`
--

LOCK TABLES `itemmenu` WRITE;
/*!40000 ALTER TABLE `itemmenu` DISABLE KEYS */;
INSERT INTO `itemmenu` VALUES (1,'Salir',7,NULL,NULL),(2,'Salir de la Aplicacion',NULL,'/login.do?metodo=logout',1),(3,'Usuarios',6,NULL,NULL),(4,'Alta de Usuario',NULL,'/usuario.do?metodo=cargarAltaUsuario',3),(5,'Modificacion de Usuario',NULL,'/cargarUsuariosAModificar.do?metodo=cargarUsuariosAModificar',3),(6,'Pacientes',2,NULL,NULL),(7,'Alta de Paciente',NULL,'/paciente.do?metodo=cargarAltaPaciente',6),(8,'Obras Sociales',5,NULL,NULL),(9,'Alta de Obra Social',NULL,'/jsp.do?page=.altaObraSocial',8),(10,'Modificación de Paciente',NULL,'/paciente.do?metodo=recuperarPacientes',6),(11,'Modificación de Obra Social',NULL,'/obraSocial.do?metodo=recuperarObrasSociales',8),(12,'Prácticas',4,NULL,NULL),(13,'Alta de Práctica',NULL,'/jsp.do?page=.altaPractica',12),(14,'Modificación de Práctica',NULL,'/practica.do?metodo=recuperarPracticas',12),(15,'Estudios',1,NULL,NULL),(16,'Alta de Estudio',NULL,'/estudio.do?metodo=cargarAltaEstudio',15),(17,'Modificación Estudio',NULL,'/estudio.do?metodo=cargarRecuperarEstudios',15),(18,'Reportes',3,NULL,NULL),(19,'Estudios a Realizar entre Fechas',NULL,'/jsp.do?page=.reporteEstudiosARealizarEntreFechas&metodo=generarReporteEstudiosARealizarEntreFechas',18);
/*!40000 ALTER TABLE `itemmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `habilitado` bit(1) NOT NULL,
  `nombreUsuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5B4D8B0E5DAE7FF6` (`rol_fk`),
  CONSTRAINT `FK5B4D8B0E5DAE7FF6` FOREIGN KEY (`rol_fk`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'','l','l',1),(2,'','ll','ll',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte` (
  `idReporte` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivoReporte` blob NOT NULL,
  `nombreReporte` varchar(255) NOT NULL,
  `nombreReportePadre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idReporte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-23 15:47:59
