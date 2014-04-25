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
-- Table structure for table `practicaestudio`
--

DROP TABLE IF EXISTS `practicaestudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practicaestudio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grupoPractica_fk` bigint(20) DEFAULT NULL,
  `estudio_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6C1B5D2437599FF6` (`grupoPractica_fk`),
  KEY `FK6C1B5D24EA82E776` (`estudio_fk`),
  CONSTRAINT `FK6C1B5D24EA82E776` FOREIGN KEY (`estudio_fk`) REFERENCES `estudio` (`id`),
  CONSTRAINT `FK6C1B5D2437599FF6` FOREIGN KEY (`grupoPractica_fk`) REFERENCES `grupopractica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practicaestudio`
--

LOCK TABLES `practicaestudio` WRITE;
/*!40000 ALTER TABLE `practicaestudio` DISABLE KEYS */;
/*!40000 ALTER TABLE `practicaestudio` ENABLE KEYS */;
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
  `unidad` varchar(255) DEFAULT NULL,
  `valorNormalDesde` varchar(255) DEFAULT NULL,
  `valorNormalHasta` varchar(255) DEFAULT NULL,
  `valorReferencia` varchar(255) DEFAULT NULL,
  `practica_fk` bigint(20) DEFAULT NULL,
  `grupoPractica_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB013E557F69A8452` (`practica_fk`),
  KEY `FKB013E55737599FF6` (`grupoPractica_fk`),
  CONSTRAINT `FKB013E55737599FF6` FOREIGN KEY (`grupoPractica_fk`) REFERENCES `grupopractica` (`id`),
  CONSTRAINT `FKB013E557F69A8452` FOREIGN KEY (`practica_fk`) REFERENCES `practica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practica`
--

LOCK TABLES `practica` WRITE;
/*!40000 ALTER TABLE `practica` DISABLE KEYS */;
INSERT INTO `practica` VALUES (1,'Globulos Rojos',NULL,NULL,NULL,NULL,NULL,1),(2,'Hemoglobina',NULL,NULL,NULL,NULL,NULL,1),(3,'Globulos Blancos',NULL,NULL,NULL,NULL,NULL,1),(4,'Recuento de Plaquetas',NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `practica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupopractica`
--

DROP TABLE IF EXISTS `grupopractica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupopractica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupopractica`
--

LOCK TABLES `grupopractica` WRITE;
/*!40000 ALTER TABLE `grupopractica` DISABLE KEYS */;
INSERT INTO `grupopractica` VALUES (1,'Hemograma'),(2,'Eritrosedimentacion'),(3,'Grupo y Factor'),(4,'Cuagulograma'),(5,'Quimica Clinica');
/*!40000 ALTER TABLE `grupopractica` ENABLE KEYS */;
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
-- Table structure for table `valorpractica`
--

DROP TABLE IF EXISTS `valorpractica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valorpractica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) NOT NULL,
  `practica_fk` bigint(20) DEFAULT NULL,
  `practicaEstudio_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7D34A1FBF69A8452` (`practica_fk`),
  KEY `FK7D34A1FB7C4418B6` (`practicaEstudio_fk`),
  CONSTRAINT `FK7D34A1FB7C4418B6` FOREIGN KEY (`practicaEstudio_fk`) REFERENCES `practicaestudio` (`id`),
  CONSTRAINT `FK7D34A1FBF69A8452` FOREIGN KEY (`practica_fk`) REFERENCES `practica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valorpractica`
--

LOCK TABLES `valorpractica` WRITE;
/*!40000 ALTER TABLE `valorpractica` DISABLE KEYS */;
/*!40000 ALTER TABLE `valorpractica` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
INSERT INTO `reporte` VALUES (1,'��\0sr\0(net.sf.jasperreports.engine.JasperReport\0\0\0\0\0\0\'�\0L\0compileDatat\0Ljava/io/Serializable;L\0compileNameSuffixt\0Ljava/lang/String;L\0\rcompilerClassq\0~\0xr\0-net.sf.jasperreports.engine.base.JRBaseReport\0\0\0\0\0\0\'�\0*I\0PSEUDO_SERIAL_VERSION_UIDI\0bottomMarginI\0columnCountI\0\rcolumnSpacingI\0columnWidthZ\0ignorePaginationZ\0isFloatColumnFooterZ\0isSummaryNewPageZ\0 isSummaryWithPageHeaderAndFooterZ\0isTitleNewPageI\0\nleftMarginB\0orientationI\0\npageHeightI\0	pageWidthB\0\nprintOrderI\0rightMarginI\0	topMarginB\0whenNoDataTypeL\0\nbackgroundt\0$Lnet/sf/jasperreports/engine/JRBand;L\0columnDirectiont\03Lnet/sf/jasperreports/engine/type/RunDirectionEnum;L\0columnFooterq\0~\0L\0columnHeaderq\0~\0[\0datasetst\0([Lnet/sf/jasperreports/engine/JRDataset;L\0defaultStylet\0%Lnet/sf/jasperreports/engine/JRStyle;L\0detailq\0~\0L\0\rdetailSectiont\0\'Lnet/sf/jasperreports/engine/JRSection;L\0formatFactoryClassq\0~\0L\0\nimportsSett\0Ljava/util/Set;L\0languageq\0~\0L\0lastPageFooterq\0~\0L\0mainDatasett\0\'Lnet/sf/jasperreports/engine/JRDataset;L\0nameq\0~\0L\0noDataq\0~\0L\0orientationValuet\02Lnet/sf/jasperreports/engine/type/OrientationEnum;L\0\npageFooterq\0~\0L\0\npageHeaderq\0~\0L\0printOrderValuet\01Lnet/sf/jasperreports/engine/type/PrintOrderEnum;[\0stylest\0&[Lnet/sf/jasperreports/engine/JRStyle;L\0summaryq\0~\0[\0	templatest\0/[Lnet/sf/jasperreports/engine/JRReportTemplate;L\0titleq\0~\0L\0whenNoDataTypeValuet\05Lnet/sf/jasperreports/engine/type/WhenNoDataTypeEnum;xp\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0R\0\0S\0\0\0\0\0\0\0.\0sr\0+net.sf.jasperreports.engine.base.JRBaseBand\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDI\0heightZ\0isSplitAllowedL\0printWhenExpressiont\0*Lnet/sf/jasperreports/engine/JRExpression;L\0	splitTypet\0Ljava/lang/Byte;L\0splitTypeValuet\00Lnet/sf/jasperreports/engine/type/SplitTypeEnum;xr\03net.sf.jasperreports.engine.base.JRBaseElementGroup\0\0\0\0\0\0\'�\0L\0childrent\0Ljava/util/List;L\0elementGroupt\0,Lnet/sf/jasperreports/engine/JRElementGroup;xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0\0pp~r\0.net.sf.jasperreports.engine.type.SplitTypeEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0STRETCH~r\01net.sf.jasperreports.engine.type.RunDirectionEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0LTRsq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0\0ppq\0~\0sq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0\0ppq\0~\0pppsr\0.net.sf.jasperreports.engine.base.JRBaseSection\0\0\0\0\0\0\'�\0[\0bandst\0%[Lnet/sf/jasperreports/engine/JRBand;xpur\0%[Lnet.sf.jasperreports.engine.JRBand;��~�ʅ5\0\0xp\0\0\0sq\0~\0sq\0~\0\0\0\0w\0\0\0\nsr\00net.sf.jasperreports.engine.base.JRBaseTextField\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDI\0\rbookmarkLevelB\0evaluationTimeB\0hyperlinkTargetB\0\rhyperlinkTypeZ\0isStretchWithOverflowL\0anchorNameExpressionq\0~\0L\0evaluationGroupt\0%Lnet/sf/jasperreports/engine/JRGroup;L\0evaluationTimeValuet\05Lnet/sf/jasperreports/engine/type/EvaluationTimeEnum;L\0\nexpressionq\0~\0L\0hyperlinkAnchorExpressionq\0~\0L\0hyperlinkPageExpressionq\0~\0[\0hyperlinkParameterst\03[Lnet/sf/jasperreports/engine/JRHyperlinkParameter;L\0hyperlinkReferenceExpressionq\0~\0L\0\ZhyperlinkTooltipExpressionq\0~\0L\0isBlankWhenNullt\0Ljava/lang/Boolean;L\0\nlinkTargetq\0~\0L\0linkTypeq\0~\0L\0patternq\0~\0L\0patternExpressionq\0~\0xr\02net.sf.jasperreports.engine.base.JRBaseTextElement\0\0\0\0\0\0\'�\0%I\0PSEUDO_SERIAL_VERSION_UIDL\0borderq\0~\0L\0borderColort\0Ljava/awt/Color;L\0bottomBorderq\0~\0L\0bottomBorderColorq\0~\03L\0\rbottomPaddingt\0Ljava/lang/Integer;L\0fontNameq\0~\0L\0fontSizeq\0~\04L\0horizontalAlignmentq\0~\0L\0horizontalAlignmentValuet\06Lnet/sf/jasperreports/engine/type/HorizontalAlignEnum;L\0isBoldq\0~\01L\0isItalicq\0~\01L\0\risPdfEmbeddedq\0~\01L\0isStrikeThroughq\0~\01L\0isStyledTextq\0~\01L\0isUnderlineq\0~\01L\0\nleftBorderq\0~\0L\0leftBorderColorq\0~\03L\0leftPaddingq\0~\04L\0lineBoxt\0\'Lnet/sf/jasperreports/engine/JRLineBox;L\0lineSpacingq\0~\0L\0lineSpacingValuet\02Lnet/sf/jasperreports/engine/type/LineSpacingEnum;L\0markupq\0~\0L\0paddingq\0~\04L\0	paragrapht\0)Lnet/sf/jasperreports/engine/JRParagraph;L\0pdfEncodingq\0~\0L\0pdfFontNameq\0~\0L\0rightBorderq\0~\0L\0rightBorderColorq\0~\03L\0rightPaddingq\0~\04L\0rotationq\0~\0L\0\rrotationValuet\0/Lnet/sf/jasperreports/engine/type/RotationEnum;L\0	topBorderq\0~\0L\0topBorderColorq\0~\03L\0\ntopPaddingq\0~\04L\0verticalAlignmentq\0~\0L\0verticalAlignmentValuet\04Lnet/sf/jasperreports/engine/type/VerticalAlignEnum;xr\0.net.sf.jasperreports.engine.base.JRBaseElement\0\0\0\0\0\0\'�\0\ZI\0PSEUDO_SERIAL_VERSION_UIDI\0heightZ\0isPrintInFirstWholeBandZ\0isPrintRepeatedValuesZ\0\ZisPrintWhenDetailOverflowsZ\0isRemoveLineWhenBlankB\0positionTypeB\0stretchTypeI\0widthI\0xI\0yL\0	backcolorq\0~\03L\0defaultStyleProvidert\04Lnet/sf/jasperreports/engine/JRDefaultStyleProvider;L\0elementGroupq\0~\0L\0	forecolorq\0~\03L\0keyq\0~\0L\0modeq\0~\0L\0	modeValuet\0+Lnet/sf/jasperreports/engine/type/ModeEnum;L\0parentStyleq\0~\0L\0parentStyleNameReferenceq\0~\0L\0positionTypeValuet\03Lnet/sf/jasperreports/engine/type/PositionTypeEnum;L\0printWhenExpressionq\0~\0L\0printWhenGroupChangesq\0~\0.L\0\rpropertiesMapt\0-Lnet/sf/jasperreports/engine/JRPropertiesMap;[\0propertyExpressionst\03[Lnet/sf/jasperreports/engine/JRPropertyExpression;L\0stretchTypeValuet\02Lnet/sf/jasperreports/engine/type/StretchTypeEnum;xp\0\0��\0\0\0\0\0\0\0\0\0\0\0@\0\0\0X\0\0\0\0sr\0java.awt.Color���3u\0F\0falphaI\0valueL\0cst\0Ljava/awt/color/ColorSpace;[\0	frgbvaluet\0[F[\0fvalueq\0~\0Exp\0\0\0\0����pppq\0~\0q\0~\0+sq\0~\0C\0\0\0\0�\0\0\0pppt\0textField-15p~r\0)net.sf.jasperreports.engine.type.ModeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0TRANSPARENTpp~r\01net.sf.jasperreports.engine.type.PositionTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0FIX_RELATIVE_TO_TOPpppp~r\00net.sf.jasperreports.engine.type.StretchTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0\nNO_STRETCH\0\0��pppppt\0Arialsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0p~r\04net.sf.jasperreports.engine.type.HorizontalAlignEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0CENTERsr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsr\0.net.sf.jasperreports.engine.base.JRBaseLineBox\0\0\0\0\0\0\'�\0L\0\rbottomPaddingq\0~\04L\0	bottomPent\0+Lnet/sf/jasperreports/engine/base/JRBoxPen;L\0boxContainert\0,Lnet/sf/jasperreports/engine/JRBoxContainer;L\0leftPaddingq\0~\04L\0leftPenq\0~\0\\L\0paddingq\0~\04L\0penq\0~\0\\L\0rightPaddingq\0~\04L\0rightPenq\0~\0\\L\0\ntopPaddingq\0~\04L\0topPenq\0~\0\\xppsr\03net.sf.jasperreports.engine.base.JRBaseBoxBottomPen\0\0\0\0\0\0\'�\0\0xr\0-net.sf.jasperreports.engine.base.JRBaseBoxPen\0\0\0\0\0\0\'�\0L\0lineBoxq\0~\06xr\0*net.sf.jasperreports.engine.base.JRBasePen\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDL\0	lineColorq\0~\03L\0	lineStyleq\0~\0L\0lineStyleValuet\00Lnet/sf/jasperreports/engine/type/LineStyleEnum;L\0	lineWidtht\0Ljava/lang/Float;L\0penContainert\0,Lnet/sf/jasperreports/engine/JRPenContainer;xp\0\0��sq\0~\0C\0\0\0\0����pppp~r\0.net.sf.jasperreports.engine.type.LineStyleEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0SOLIDsr\0java.lang.Float��ɢ�<��\0F\0valuexq\0~\0T>�\0\0q\0~\0^q\0~\0^q\0~\0Bpsr\01net.sf.jasperreports.engine.base.JRBaseBoxLeftPen\0\0\0\0\0\0\'�\0\0xq\0~\0`\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0^q\0~\0^psq\0~\0`\0\0��ppppq\0~\0^q\0~\0^psr\02net.sf.jasperreports.engine.base.JRBaseBoxRightPen\0\0\0\0\0\0\'�\0\0xq\0~\0`\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0^q\0~\0^psr\00net.sf.jasperreports.engine.base.JRBaseBoxTopPen\0\0\0\0\0\0\'�\0\0xq\0~\0`\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0^q\0~\0^ppppsr\00net.sf.jasperreports.engine.base.JRBaseParagraph\0\0\0\0\0\0\'�\0\nL\0firstLineIndentq\0~\04L\0\nleftIndentq\0~\04L\0lineSpacingq\0~\07L\0lineSpacingSizeq\0~\0cL\0paragraphContainert\02Lnet/sf/jasperreports/engine/JRParagraphContainer;L\0rightIndentq\0~\04L\0spacingAfterq\0~\04L\0\rspacingBeforeq\0~\04L\0tabStopWidthq\0~\04L\0tabStopsq\0~\0xppp~r\00net.sf.jasperreports.engine.type.LineSpacingEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0SINGLEpq\0~\0Bpppppt\0Cp1252t\0	Helveticapppp~r\0-net.sf.jasperreports.engine.type.RotationEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NONEpppp~r\02net.sf.jasperreports.engine.type.VerticalAlignEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0MIDDLE\0\0��\0\0\0\0\0\0\0\0pp~r\03net.sf.jasperreports.engine.type.EvaluationTimeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NOWsr\01net.sf.jasperreports.engine.base.JRBaseExpression\0\0\0\0\0\0\'�\0I\0id[\0chunkst\00[Lnet/sf/jasperreports/engine/JRExpressionChunk;L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xp\0\0\0ur\00[Lnet.sf.jasperreports.engine.JRExpressionChunk;mY��iK�U\0\0xp\0\0\0sr\06net.sf.jasperreports.engine.base.JRBaseExpressionChunk\0\0\0\0\0\0\'�\0B\0typeL\0textq\0~\0xpt\0numeropppppppq\0~\0Zppt\0###0psq\0~\0-\0\0��\0\0\0\0\0\0\0\0\0\0\0k\0\0\0�\0\0\0\0sq\0~\0C\0\0\0\0����pppq\0~\0q\0~\0+sq\0~\0C\0\0\0\0�\0\0\0pppt\0textField-13pq\0~\0Jppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~\0Zq\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0����ppppq\0~\0hsq\0~\0j>�\0\0q\0~\0�q\0~\0�q\0~\0�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�psq\0~\0`\0\0��ppppq\0~\0�q\0~\0�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�ppppsq\0~\0yppq\0~\0}pq\0~\0�pppppt\0Cp1252t\0	Helveticappppq\0~\0�ppppq\0~\0�\0\0��\0\0\0\0\0\0\0\0ppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0nombresq\0~\0�t\0+\",\"+sq\0~\0�t\0apellidopppppppq\0~\0Zppt\0\0psq\0~\0-\0\0��\0\0\0\0\0\0\0\0\0\0\0z\0\0\0\0\0\0sq\0~\0C\0\0\0\0����pppq\0~\0q\0~\0+sq\0~\0C\0\0\0\0�\0\0\0pppt\0textField-15pq\0~\0Jppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~\0Zq\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0����ppppq\0~\0hsq\0~\0j>�\0\0q\0~\0�q\0~\0�q\0~\0�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�psq\0~\0`\0\0��ppppq\0~\0�q\0~\0�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�ppppsq\0~\0yppq\0~\0}pq\0~\0�pppppt\0Cp1252t\0	Helveticappppq\0~\0�ppppq\0~\0�\0\0��\0\0\0\0\0\0\0\0ppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0fechapppppppq\0~\0Zppt\0\ndd/MM/yyyypxp\0\0��\0\0\0ppq\0~\0psr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0\"net.sf.jasperreports.engine.data.*t\0net.sf.jasperreports.engine.*t\0java.util.*xt\0javapsr\0.net.sf.jasperreports.engine.base.JRBaseDataset\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDZ\0isMainB\0whenResourceMissingType[\0fieldst\0&[Lnet/sf/jasperreports/engine/JRField;L\0filterExpressionq\0~\0[\0groupst\0&[Lnet/sf/jasperreports/engine/JRGroup;L\0nameq\0~\0[\0\nparameterst\0*[Lnet/sf/jasperreports/engine/JRParameter;L\0\rpropertiesMapq\0~\0?L\0queryt\0%Lnet/sf/jasperreports/engine/JRQuery;L\0resourceBundleq\0~\0L\0scriptletClassq\0~\0[\0\nscriptletst\0*[Lnet/sf/jasperreports/engine/JRScriptlet;[\0\nsortFieldst\0*[Lnet/sf/jasperreports/engine/JRSortField;[\0	variablest\0)[Lnet/sf/jasperreports/engine/JRVariable;L\0whenResourceMissingTypeValuet\0>Lnet/sf/jasperreports/engine/type/WhenResourceMissingTypeEnum;xp\0\0��\0ur\0&[Lnet.sf.jasperreports.engine.JRField;<��N*�p\0\0xp\0\0\0sr\0,net.sf.jasperreports.engine.base.JRBaseField\0\0\0\0\0\0\'�\0L\0descriptionq\0~\0L\0nameq\0~\0L\0\rpropertiesMapq\0~\0?L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xppt\0numerosr\0+net.sf.jasperreports.engine.JRPropertiesMap\0\0\0\0\0\0\'�\0L\0baseq\0~\0?L\0propertiesListq\0~\0L\0\rpropertiesMapt\0Ljava/util/Map;xppppt\0java.lang.Longpsq\0~\0�pt\0nombresq\0~\0�pppt\0java.lang.Stringpsq\0~\0�pt\0apellidosq\0~\0�pppt\0java.lang.Stringpsq\0~\0�pt\0fechasq\0~\0�pppt\0java.sql.Timestampppur\0&[Lnet.sf.jasperreports.engine.JRGroup;@�_zL�x�\0\0xp\0\0\0sr\0,net.sf.jasperreports.engine.base.JRBaseGroup\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDB\0footerPositionZ\0isReprintHeaderOnEachPageZ\0isResetPageNumberZ\0isStartNewColumnZ\0isStartNewPageZ\0keepTogetherI\0minHeightToStartNewPageL\0\rcountVariablet\0(Lnet/sf/jasperreports/engine/JRVariable;L\0\nexpressionq\0~\0L\0footerPositionValuet\05Lnet/sf/jasperreports/engine/type/FooterPositionEnum;L\0groupFooterq\0~\0L\0groupFooterSectionq\0~\0L\0groupHeaderq\0~\0L\0groupHeaderSectionq\0~\0L\0nameq\0~\0xp\0\0��\0\0\0\0\0\0\0\0\0\0sr\0/net.sf.jasperreports.engine.base.JRBaseVariable\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDB\0calculationB\0\rincrementTypeZ\0isSystemDefinedB\0	resetTypeL\0calculationValuet\02Lnet/sf/jasperreports/engine/type/CalculationEnum;L\0\nexpressionq\0~\0L\0incrementGroupq\0~\0.L\0incrementTypeValuet\04Lnet/sf/jasperreports/engine/type/IncrementTypeEnum;L\0incrementerFactoryClassNameq\0~\0L\0incrementerFactoryClassRealNameq\0~\0L\0initialValueExpressionq\0~\0L\0nameq\0~\0L\0\nresetGroupq\0~\0.L\0resetTypeValuet\00Lnet/sf/jasperreports/engine/type/ResetTypeEnum;L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xp\0\0w�\0\0\0~r\00net.sf.jasperreports.engine.type.CalculationEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0COUNTsq\0~\0�\0\0\0	uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(1)ppp~r\02net.sf.jasperreports.engine.type.IncrementTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NONEppsq\0~\0�\0\0\0\nuq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(0)ppt\0group1_COUNTq\0~\0�~r\0.net.sf.jasperreports.engine.type.ResetTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0GROUPt\0java.lang.Integerpsq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0nullpp~r\03net.sf.jasperreports.engine.type.FooterPositionEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NORMALpsq\0~\0&uq\0~\0)\0\0\0sq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0sq\0~\0�\0\0\0\ruq\0~\0�\0\0\0sq\0~\0�t\0new Boolean(sq\0~\0�t\0nombresq\0~\0�t\0	 != null)pppq\0~\0psq\0~\0&uq\0~\0)\0\0\0sq\0~\0sq\0~\0\0\0\0w\0\0\0\nsr\01net.sf.jasperreports.engine.base.JRBaseStaticText\0\0\0\0\0\0\'�\0L\0textq\0~\0xq\0~\02\0\0��\0\0\0\0\0\0\0\0\0\0\0@\0\0\0X\0\0\0sq\0~\0C\0\0\0\0�xxxpppq\0~\0q\0~%sq\0~\0C\0\0\0\0����pppt\0\rstaticText-18p~q\0~\0It\0OPAQUEppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wsq\0~\0Yq\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~0q\0~0q\0~(psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~0q\0~0psq\0~\0`\0\0��ppppq\0~0q\0~0psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~0q\0~0psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~0q\0~0ppppsq\0~\0yppq\0~\0}pq\0~(pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0Númerosq\0~\'\0\0��\0\0\0\0\0\0\0\0\0\0\0k\0\0\0�\0\0\0sq\0~\0C\0\0\0\0�xxxpppq\0~\0q\0~%sq\0~\0C\0\0\0\0����pppt\0\rstaticText-18pq\0~,ppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~/q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~Gq\0~Gq\0~Bpsq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~Gq\0~Gpsq\0~\0`\0\0��ppppq\0~Gq\0~Gpsq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~Gq\0~Gpsq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~Gq\0~Gppppsq\0~\0yppq\0~\0}pq\0~Bpppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0Nombresq\0~\'\0\0��\0\0\0\0\0\0\0\0\0\0\0z\0\0\0\0\0sq\0~\0C\0\0\0\0�xxxpppq\0~\0q\0~%sq\0~\0C\0\0\0\0����pppt\0\rstaticText-20pq\0~,ppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~/q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~^q\0~^q\0~Ypsq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~^q\0~^psq\0~\0`\0\0��ppppq\0~^q\0~^psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~^q\0~^psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~^q\0~^ppppsq\0~\0yppq\0~\0}pq\0~Ypppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0Fechaxp\0\0��\0\0\0(sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new Boolean(sq\0~\0�t\0nombresq\0~\0�t\0	 != null)pppq\0~\0t\0group1t\0#reporteEstudiosARealizarEntreFechasur\0*[Lnet.sf.jasperreports.engine.JRParameter;\"\0�*�`!\0\0xp\0\0\0sr\00net.sf.jasperreports.engine.base.JRBaseParameter\0\0\0\0\0\0\'�\0	Z\0isForPromptingZ\0isSystemDefinedL\0defaultValueExpressionq\0~\0L\0descriptionq\0~\0L\0nameq\0~\0L\0nestedTypeNameq\0~\0L\0\rpropertiesMapq\0~\0?L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xpppt\0REPORT_CONTEXTpsq\0~\0�pppt\0)net.sf.jasperreports.engine.ReportContextpsq\0~|ppt\0REPORT_PARAMETERS_MAPpsq\0~\0�pppt\0\rjava.util.Mappsq\0~|ppt\0\rJASPER_REPORTpsq\0~\0�pppt\0(net.sf.jasperreports.engine.JasperReportpsq\0~|ppt\0REPORT_CONNECTIONpsq\0~\0�pppt\0java.sql.Connectionpsq\0~|ppt\0REPORT_MAX_COUNTpsq\0~\0�pppq\0~psq\0~|ppt\0REPORT_DATA_SOURCEpsq\0~\0�pppt\0(net.sf.jasperreports.engine.JRDataSourcepsq\0~|ppt\0REPORT_SCRIPTLETpsq\0~\0�pppt\0/net.sf.jasperreports.engine.JRAbstractScriptletpsq\0~|ppt\0\rREPORT_LOCALEpsq\0~\0�pppt\0java.util.Localepsq\0~|ppt\0REPORT_RESOURCE_BUNDLEpsq\0~\0�pppt\0java.util.ResourceBundlepsq\0~|ppt\0REPORT_TIME_ZONEpsq\0~\0�pppt\0java.util.TimeZonepsq\0~|ppt\0REPORT_FORMAT_FACTORYpsq\0~\0�pppt\0.net.sf.jasperreports.engine.util.FormatFactorypsq\0~|ppt\0REPORT_CLASS_LOADERpsq\0~\0�pppt\0java.lang.ClassLoaderpsq\0~|ppt\0\ZREPORT_URL_HANDLER_FACTORYpsq\0~\0�pppt\0 java.net.URLStreamHandlerFactorypsq\0~|ppt\0REPORT_FILE_RESOLVERpsq\0~\0�pppt\0-net.sf.jasperreports.engine.util.FileResolverpsq\0~|ppt\0REPORT_TEMPLATESpsq\0~\0�pppt\0java.util.Collectionpsq\0~|ppt\0SORT_FIELDSpsq\0~\0�pppt\0java.util.Listpsq\0~|ppt\0FILTERpsq\0~\0�pppt\0)net.sf.jasperreports.engine.DatasetFilterpsq\0~|ppt\0REPORT_VIRTUALIZERpsq\0~\0�pppt\0)net.sf.jasperreports.engine.JRVirtualizerpsq\0~|ppt\0IS_IGNORE_PAGINATIONpsq\0~\0�pppt\0java.lang.Booleanpsq\0~|\0\0sq\0~\0�\0\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0\".\\\\\"pppt\0PATH_SUB_REPORTESpsq\0~\0�pppt\0java.lang.Stringpsq\0~|\0ppt\0\nfechaHastapsq\0~\0�pppt\0java.util.Datepsq\0~|\0ppt\0\nfechaDesdepsq\0~\0�pppt\0java.util.Datepsq\0~\0�psq\0~\0\0\0\0w\0\0\0\nt\0ireport.scriptlethandlingt\0ireport.encodingt\0ireport.zoomt\0	ireport.xt\0	ireport.yxsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0q\0~�t\01.5q\0~�t\0UTF-8q\0~�t\00q\0~�t\0228q\0~�t\00xsr\0,net.sf.jasperreports.engine.base.JRBaseQuery\0\0\0\0\0\0\'�\0[\0chunkst\0+[Lnet/sf/jasperreports/engine/JRQueryChunk;L\0languageq\0~\0xpur\0+[Lnet.sf.jasperreports.engine.JRQueryChunk;@�\0��4�\0\0xp\0\0\0sr\01net.sf.jasperreports.engine.base.JRBaseQueryChunk\0\0\0\0\0\0\'�\0B\0typeL\0textq\0~\0[\0tokenst\0[Ljava/lang/String;xpt\0�SELECT e.numero, p.nombre, p.apellido, e.fecha\nFROM `labold`.`estudio` e inner join `labold`.`paciente` p\non e.paciente_fk = p.id\nWHERE e.fecha >= psq\0~�t\0\nfechaDesdepsq\0~�t\0 and e.fecha <= psq\0~�t\0\nfechaHastapt\0sqlppppur\0)[Lnet.sf.jasperreports.engine.JRVariable;b�|�,�D\0\0xp\0\0\0sq\0~\0�\0\0w�\0\0\0~q\0~\0�t\0SYSTEMppq\0~ppsq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(1)ppt\0PAGE_NUMBERp~q\0~t\0REPORTq\0~psq\0~\0�\0\0w�\0\0\0q\0~�ppq\0~ppsq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(1)ppt\0\rCOLUMN_NUMBERp~q\0~t\0PAGEq\0~psq\0~\0�\0\0w�\0\0\0q\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(1)pppq\0~ppsq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(0)ppt\0REPORT_COUNTpq\0~\0q\0~psq\0~\0�\0\0w�\0\0\0q\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(1)pppq\0~ppsq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(0)ppt\0\nPAGE_COUNTpq\0~q\0~psq\0~\0�\0\0w�\0\0\0q\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(1)pppq\0~ppsq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(0)ppt\0COLUMN_COUNTp~q\0~t\0COLUMNq\0~pq\0~\0�~r\0<net.sf.jasperreports.engine.type.WhenResourceMissingTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NULLq\0~yp~r\00net.sf.jasperreports.engine.type.OrientationEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0PORTRAITsq\0~\0sq\0~\0\0\0\0w\0\0\0\nsr\0+net.sf.jasperreports.engine.base.JRBaseLine\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDB\0	directionL\0directionValuet\04Lnet/sf/jasperreports/engine/type/LineDirectionEnum;xr\05net.sf.jasperreports.engine.base.JRBaseGraphicElement\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDL\0fillq\0~\0L\0	fillValuet\0+Lnet/sf/jasperreports/engine/type/FillEnum;L\0linePent\0#Lnet/sf/jasperreports/engine/JRPen;L\0penq\0~\0xq\0~\0;\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0pq\0~\0q\0~0sq\0~\0C\0\0\0\0����ppppppppq\0~\0Mppppq\0~\0P\0\0w�ppsq\0~\0a\0\0��ppppq\0~7p\0\0��\0~r\02net.sf.jasperreports.engine.type.LineDirectionEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0TOP_DOWNsq\0~\'\0\0��\0\0\0\0\0\0\0\0\0\0f\0\0\0X\0\0\0sq\0~\0C\0\0\0\0����pppq\0~\0q\0~0sq\0~\0C\0\0\0\0����pppt\0\rstaticText-24pq\0~\0Jppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialsq\0~\0S\0\0\0pq\0~\0Wq\0~/q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~Cq\0~Cq\0~=psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~Cq\0~Cpsq\0~\0`\0\0��ppppq\0~Cq\0~Cpsq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~Cq\0~Cpsq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~Cq\0~Cppppsq\0~\0yppq\0~\0}pq\0~=pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0�SISTEMA INTEGRAL DE INFORMACION FORESTAL - Versión 1.0\nGEOINGENIERIA - Desarrollo RIDIERGROUP\nContacto: tel 02901-15561782 - geo.ingenieria@yahoo.com.arsq\0~\0-\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0pq\0~\0q\0~0sq\0~\0C\0\0\0\0����ppppppppq\0~\0Mppppq\0~\0P\0\0��ppppppppppppppppppsq\0~\0[psq\0~\0_\0\0��ppppq\0~Wq\0~Wq\0~Upsq\0~\0l\0\0��ppppq\0~Wq\0~Wpsq\0~\0`\0\0��ppppq\0~Wq\0~Wpsq\0~\0q\0\0��ppppq\0~Wq\0~Wpsq\0~\0u\0\0��ppppq\0~Wq\0~Wppppsq\0~\0yppppq\0~Uppppppppppppppppq\0~\0�\0\0��\0\0\0\0\0\0\0\0ppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0PAGE_NUMBERppppppppppppsq\0~\0-\0\0��\0\0\0\0\0\0\0\0\0\0\0}\0\0\0\0\0\0\0sq\0~\0C\0\0\0\0����pppq\0~\0q\0~0sq\0~\0C\0\0\0\0����pppt\0textField-15pq\0~\0Jppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Up~q\0~\0Vt\0LEFTq\0~\0Zq\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~iq\0~iq\0~bpsq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~iq\0~ipsq\0~\0`\0\0��ppppq\0~iq\0~ipsq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~iq\0~ipsq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~iq\0~ippppsq\0~\0yppq\0~\0}pq\0~bpppppt\0Cp1252t\0	Helveticappppq\0~\0�ppppq\0~\0�\0\0��\0\0\0\0\0\0\0\0ppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0\nnew Date()pppppppq\0~/ppt\0\ndd/MM/yyyypxp\0\0��\0\0\0$ppq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0\nsq\0~\'\0\0��\0\0\0\0\0\0\0\0\0\0\0�\0\0\0�\0\0\0msq\0~\0C\0\0\0\0����pppq\0~\0q\0~sq\0~\0C\0\0\0\0�\0\0\0pppt\0\rstaticText-24pq\0~\0Jppq\0~\0Msq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new Boolean(sq\0~\0�t\0nombresq\0~\0�t\0	 == null)pppppq\0~\0P\0\0��pppppt\0Arialsq\0~\0S\0\0\0pq\0~\0Wq\0~/q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�q\0~�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0`\0\0��ppppq\0~�q\0~�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�ppppsq\0~\0yppq\0~\0}pq\0~�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0\ZNo hay datos para procesarxp\0\0��\0\0\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new Boolean(sq\0~\0�t\0nombresq\0~\0�t\0	 == null)pppq\0~\0~r\0/net.sf.jasperreports.engine.type.PrintOrderEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0VERTICALpsq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0\0ppq\0~\0psq\0~\0sq\0~\0\0\0\0w\0\0\0\nsr\00net.sf.jasperreports.engine.base.JRBaseRectangle\0\0\0\0\0\0\'�\0L\0radiusq\0~\04xq\0~4\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Psq\0~\0C\0\0\0\0�\0\0\0pppq\0~\0q\0~�ppppppq\0~\0Mppppq\0~\0P\0\0w�ppsq\0~\0a\0\0��ppppq\0~�ppsq\0~\'\0\0��\0\0\0\0\0\0\0\0\0\0S\0\0\0\0\0\0\0pq\0~\0q\0~�sq\0~\0C\0\0\0\0�\0\0\0ppppppppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialsq\0~\0S\0\0\0ppq\0~/ppppppppsq\0~\0[psq\0~\0_\0\0��ppppq\0~�q\0~�q\0~�psq\0~\0l\0\0��ppppq\0~�q\0~�psq\0~\0`\0\0��ppppq\0~�q\0~�psq\0~\0q\0\0��ppppq\0~�q\0~�psq\0~\0u\0\0��ppppq\0~�q\0~�ppppsq\0~\0yppppq\0~�ppppppt\0Helvetica-Boldpppppppppq\0~\0�t\0Estudios a Realizarsr\0,net.sf.jasperreports.engine.base.JRBaseImage\0\0\0\0\0\0\'�\0*I\0PSEUDO_SERIAL_VERSION_UIDI\0\rbookmarkLevelB\0evaluationTimeB\0hyperlinkTargetB\0\rhyperlinkTypeZ\0isLazyB\0onErrorTypeL\0anchorNameExpressionq\0~\0L\0borderq\0~\0L\0borderColorq\0~\03L\0bottomBorderq\0~\0L\0bottomBorderColorq\0~\03L\0\rbottomPaddingq\0~\04L\0evaluationGroupq\0~\0.L\0evaluationTimeValueq\0~\0/L\0\nexpressionq\0~\0L\0horizontalAlignmentq\0~\0L\0horizontalAlignmentValueq\0~\05L\0hyperlinkAnchorExpressionq\0~\0L\0hyperlinkPageExpressionq\0~\0[\0hyperlinkParametersq\0~\00L\0hyperlinkReferenceExpressionq\0~\0L\0\ZhyperlinkTooltipExpressionq\0~\0L\0isUsingCacheq\0~\01L\0\nleftBorderq\0~\0L\0leftBorderColorq\0~\03L\0leftPaddingq\0~\04L\0lineBoxq\0~\06L\0\nlinkTargetq\0~\0L\0linkTypeq\0~\0L\0onErrorTypeValuet\02Lnet/sf/jasperreports/engine/type/OnErrorTypeEnum;L\0paddingq\0~\04L\0rightBorderq\0~\0L\0rightBorderColorq\0~\03L\0rightPaddingq\0~\04L\0\nscaleImageq\0~\0L\0scaleImageValuet\01Lnet/sf/jasperreports/engine/type/ScaleImageEnum;L\0	topBorderq\0~\0L\0topBorderColorq\0~\03L\0\ntopPaddingq\0~\04L\0verticalAlignmentq\0~\0L\0verticalAlignmentValueq\0~\0:xq\0~4\0\0��\0\0\07\0\0\0\0\0\0\0\0}\0\0�\0\0\0\0sq\0~\0C\0\0\0\0����pppq\0~\0q\0~�sq\0~\0C\0\0\0\0�\0\0\0pppt\0image-1pq\0~,ppq\0~\0Mppppq\0~\0P\0\0w�p~r\0)net.sf.jasperreports.engine.type.FillEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0SOLIDsq\0~\0a\0\0��ppq\0~\0hsq\0~\0j\0\0\0\0q\0~�p\0\0��\0\0\0\0\0\0\0\0\0pppppppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0PATH_SUB_REPORTESsq\0~\0�t\05+System.getProperty(\"file.separator\")+\"LOGOSIIF2.jpg\"pppq\0~gpppppq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�q\0~�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0`\0\0��ppppq\0~�q\0~�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�pp~r\00net.sf.jasperreports.engine.type.OnErrorTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0ERRORppppp~r\0/net.sf.jasperreports.engine.type.ScaleImageEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0\nFILL_FRAMEpppp~q\0~\0�t\0TOPsq\0~�\0\0��\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0Fsq\0~\0C\0\0\0\0�xxxpppq\0~\0q\0~�sq\0~\0C\0\0\0\0�xxxppppppppq\0~\0Mppppq\0~\0P\0\0w�ppsq\0~\0a\0\0��ppppq\0~�ppsq\0~\'\0\0��\0\0\0\0\0\0\0\0\0\0S\0\0\0\0\0\0\0\0pq\0~\0q\0~�sq\0~\0C\0\0\0\0�xxxppppppppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~�ppq\0~/ppppppppsq\0~\0[psq\0~\0_\0\0��ppppq\0~�q\0~�q\0~�psq\0~\0l\0\0��ppppq\0~�q\0~�psq\0~\0`\0\0��ppppq\0~�q\0~�psq\0~\0q\0\0��ppppq\0~�q\0~�psq\0~\0u\0\0��ppppq\0~�q\0~�ppppsq\0~\0yppppq\0~�ppppppt\0Helvetica-Boldpppppppppq\0~\0�t\0)Sistema Integral de Información Forestalxp\0\0��\0\0\0Zppq\0~\0~r\03net.sf.jasperreports.engine.type.WhenNoDataTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0ALL_SECTIONS_NO_DETAILsr\06net.sf.jasperreports.engine.design.JRReportCompileData\0\0\0\0\0\0\'�\0L\0crosstabCompileDataq\0~\0�L\0datasetCompileDataq\0~\0�L\0mainDatasetCompileDataq\0~\0xpsq\0~�?@\0\0\0\0\0w\0\0\0\0\0\0\0xsq\0~�?@\0\0\0\0\0w\0\0\0\0\0\0\0xur\0[B���T�\0\0xp\0\0-����\0\0\0.\r\08reporteEstudiosARealizarEntreFechas_1398434024320_629413\0\0,net/sf/jasperreports/engine/fill/JREvaluator\0\0parameter_REPORT_LOCALE\02Lnet/sf/jasperreports/engine/fill/JRFillParameter;\0parameter_fechaDesde\0parameter_PATH_SUB_REPORTES\0parameter_JASPER_REPORT\0parameter_REPORT_VIRTUALIZER\0\Zparameter_REPORT_TIME_ZONE\0parameter_fechaHasta\0parameter_SORT_FIELDS\0parameter_REPORT_FILE_RESOLVER\0\Zparameter_REPORT_SCRIPTLET\0parameter_REPORT_PARAMETERS_MAP\0parameter_REPORT_CONNECTION\0parameter_REPORT_CONTEXT\0parameter_REPORT_CLASS_LOADER\0parameter_REPORT_DATA_SOURCE\0$parameter_REPORT_URL_HANDLER_FACTORY\0parameter_IS_IGNORE_PAGINATION\0parameter_FILTER\0parameter_REPORT_FORMAT_FACTORY\0\Zparameter_REPORT_MAX_COUNT\0\Zparameter_REPORT_TEMPLATES\0 parameter_REPORT_RESOURCE_BUNDLE\0field_apellido\0.Lnet/sf/jasperreports/engine/fill/JRFillField;\0field_nombre\0field_fecha\0field_numero\0variable_PAGE_NUMBER\01Lnet/sf/jasperreports/engine/fill/JRFillVariable;\0variable_COLUMN_NUMBER\0variable_REPORT_COUNT\0variable_PAGE_COUNT\0variable_COLUMN_COUNT\0variable_group1_COUNT\0<init>\0()V\0Code\0(\0)\n\0\0+\0\0	\0\0-\0\0	\0\0/\0\0	\0\01\0	\0	\0\03\0\n\0	\0\05\0\0	\0\07\0\0	\0\09\0\r\0	\0\0;\0\0	\0\0=\0\0	\0\0?\0\0	\0\0A\0\0	\0\0C\0\0	\0\0E\0\0	\0\0G\0\0	\0\0I\0\0	\0\0K\0\0	\0\0M\0\0	\0\0O\0\0	\0\0Q\0\0	\0\0S\0\Z\0	\0\0U\0\0	\0\0W\0\0	\0\0Y\0\0	\0\0[\0\0	\0\0]\0 \0	\0\0_\0!\0\"	\0\0a\0#\0\"	\0\0c\0$\0\"	\0\0e\0%\0\"	\0\0g\0&\0\"	\0\0i\0\'\0\"	\0\0k\0LineNumberTable\0customizedInit\00(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V\0\ninitParams\0(Ljava/util/Map;)V\0p\0q\n\0\0r\0\ninitFields\0t\0q\n\0\0u\0initVars\0w\0q\n\0\0x\0\rREPORT_LOCALE\0z\0\rjava/util/Map\0|\0get\0&(Ljava/lang/Object;)Ljava/lang/Object;\0~\0\0}\0�\00net/sf/jasperreports/engine/fill/JRFillParameter\0�\0\nfechaDesde\0�\0PATH_SUB_REPORTES\0�\0\rJASPER_REPORT\0�\0REPORT_VIRTUALIZER\0�\0REPORT_TIME_ZONE\0�\0\nfechaHasta\0�\0SORT_FIELDS\0�\0REPORT_FILE_RESOLVER\0�\0REPORT_SCRIPTLET\0�\0REPORT_PARAMETERS_MAP\0�\0REPORT_CONNECTION\0�\0REPORT_CONTEXT\0�\0REPORT_CLASS_LOADER\0�\0REPORT_DATA_SOURCE\0�\0\ZREPORT_URL_HANDLER_FACTORY\0�\0IS_IGNORE_PAGINATION\0�\0FILTER\0�\0REPORT_FORMAT_FACTORY\0�\0REPORT_MAX_COUNT\0�\0REPORT_TEMPLATES\0�\0REPORT_RESOURCE_BUNDLE\0�\0apellido\0�\0,net/sf/jasperreports/engine/fill/JRFillField\0�\0nombre\0�\0fecha\0�\0numero\0�\0PAGE_NUMBER\0�\0/net/sf/jasperreports/engine/fill/JRFillVariable\0�\0\rCOLUMN_NUMBER\0�\0REPORT_COUNT\0�\0\nPAGE_COUNT\0�\0COLUMN_COUNT\0�\0group1_COUNT\0�\0evaluate\0(I)Ljava/lang/Object;\0\nExceptions\0java/lang/Throwable\0�\0.\\\0�\0java/lang/Integer\0�\0(I)V\0(\0�\n\0�\0�\0java/lang/Boolean\0�\0getValue\0()Ljava/lang/Object;\0�\0�\n\0�\0�\0java/lang/String\0�\0(Z)V\0(\0�\n\0�\0�\0java/lang/StringBuffer\0�\n\0�\0�\0valueOf\0&(Ljava/lang/Object;)Ljava/lang/String;\0�\0�\n\0�\0�\0(Ljava/lang/String;)V\0(\0�\n\0�\0�\0file.separator\0�\0java/lang/System\0�\0getProperty\0&(Ljava/lang/String;)Ljava/lang/String;\0�\0�\n\0�\0�\0append\0,(Ljava/lang/String;)Ljava/lang/StringBuffer;\0�\0�\n\0�\0�\0\rLOGOSIIF2.jpg\0�\0toString\0()Ljava/lang/String;\0�\0�\n\0�\0�\0java/lang/Long\0�\0,\0�\0java/sql/Timestamp\0�\n\0�\0�\0java/util/Date\0\n\0+\0evaluateOld\0getOldValue\0�\n\0�\n\0�\0evaluateEstimated\0getEstimatedValue	\0�\n\0�\n\0\nSourceFile\0!\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0!\0\"\0\0\0\0#\0\"\0\0\0\0$\0\"\0\0\0\0%\0\"\0\0\0\0&\0\"\0\0\0\0\'\0\"\0\0\0\0\0(\0)\0\0*\0\0A\0\0\0\0\0�*�\0,*�\0.*�\00*�\02*�\04*�\06*�\08*�\0:*�\0<*�\0>*�\0@*�\0B*�\0D*�\0F*�\0H*�\0J*�\0L*�\0N*�\0P*�\0R*�\0T*�\0V*�\0X*�\0Z*�\0\\*�\0^*�\0`*�\0b*�\0d*�\0f*�\0h*�\0j*�\0l�\0\0\0\0m\0\0\0�\0\"\0\0\0\0\0\0	\0\0\0\0\0\0\0 \0\0!\0\"\0\"\0\'\0#\0,\0$\01\0%\06\0&\0;\0\'\0@\0(\0E\0)\0J\0*\0O\0+\0T\0,\0Y\0-\0^\0.\0c\0/\0h\00\0m\01\0r\02\0w\03\0|\04\0�\05\0�\06\0�\07\0�\08\0�\09\0�\0:\0�\0;\0�\0\0\0n\0o\0\0*\0\0\04\0\0\0\0\0*+�\0s*,�\0v*-�\0y�\0\0\0\0m\0\0\0\0\0\0\0G\0\0H\0\n\0I\0\0J\0\0p\0q\0\0*\0\0�\0\0\0\0�*+{�\0�\0�\0��\0��\0.*+��\0�\0�\0��\0��\00*+��\0�\0�\0��\0��\02*+��\0�\0�\0��\0��\04*+��\0�\0�\0��\0��\06*+��\0�\0�\0��\0��\08*+��\0�\0�\0��\0��\0:*+��\0�\0�\0��\0��\0<*+��\0�\0�\0��\0��\0>*+��\0�\0�\0��\0��\0@*+��\0�\0�\0��\0��\0B*+��\0�\0�\0��\0��\0D*+��\0�\0�\0��\0��\0F*+��\0�\0�\0��\0��\0H*+��\0�\0�\0��\0��\0J*+��\0�\0�\0��\0��\0L*+��\0�\0�\0��\0��\0N*+��\0�\0�\0��\0��\0P*+��\0�\0�\0��\0��\0R*+��\0�\0�\0��\0��\0T*+��\0�\0�\0��\0��\0V*+��\0�\0�\0��\0��\0X�\0\0\0\0m\0\0\0^\0\0\0\0R\0\0S\0$\0T\06\0U\0H\0V\0Z\0W\0l\0X\0~\0Y\0�\0Z\0�\0[\0�\0\\\0�\0]\0�\0^\0�\0_\0�\0`\0a \0b2\0cD\0dV\0eh\0fz\0g�\0h\0\0t\0q\0\0*\0\0\0q\0\0\0\0\0I*+��\0�\0�\0��\0��\0Z*+��\0�\0�\0��\0��\0\\*+��\0�\0�\0��\0��\0^*+��\0�\0�\0��\0��\0`�\0\0\0\0m\0\0\0\0\0\0\0p\0\0q\0$\0r\06\0s\0H\0t\0\0w\0q\0\0*\0\0\0�\0\0\0\0\0m*+��\0�\0�\0��\0��\0b*+��\0�\0�\0��\0��\0d*+��\0�\0�\0��\0��\0f*+��\0�\0�\0��\0��\0h*+ù\0�\0�\0��\0��\0j*+Ź\0�\0�\0��\0��\0l�\0\0\0\0m\0\0\0\0\0\0\0|\0\0}\0$\0~\06\0\0H\0�\0Z\0�\0l\0�\0\0�\0�\0\0�\0\0\0\0\0�\0*\0\0�\0\0\0\0�M�\0\0�\0\0\0\0\0\0\0\0\0\0e\0\0\0k\0\0\0w\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0\0\"\0\0J\0\0g\0\0�\0\0�\0\0�\0\0�\0\0��M�{�\0�Y�\0�M�o�\0�Y�\0�M�c�\0�Y�\0�M�W�\0�Y�\0�M�K�\0�Y�\0�M�?�\0�Y�\0�M�3�\0�Y�\0�M�\'�\0�Y�\0�M��\0�Y�\0�M��\0�Y�\0�M�M�\0��\0�Y*�\0\\�\0��\0��\0�\0�\0�M�\0�\0�Y*�\0\\�\0��\0��\0�\0�\0�M�\0Ļ\0�Y*�\02�\0��\0ٸ\0�\0��\0�\0���\0�\0�M�\0��\0�Y*�\0\\�\0��\0��\0�\0�\0�M�\0�\0�Y*�\0\\�\0��\0��\0�\0�\0�M�\0b*�\0`�\0��\0�M�\0T�\0�Y*�\0\\�\0��\0ٸ\0�\0���\0�*�\0Z�\0��\0ٶ\0�\0�M�\0\'*�\0^�\0��\0�M�\0*�\0b�\0��\0�M�\0�Y�M,�\0\0\0\0m\0\0\0�\0.\0\0\0�\0\0�\0h\0�\0k\0�\0n\0�\0w\0�\0z\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\"\0�%\0�J\0�M\0�g\0�j\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0\0�\0\0�\0\0\0\0\0�\0*\0\0�\0\0\0\0�M�\0\0�\0\0\0\0\0\0\0\0\0\0e\0\0\0k\0\0\0w\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0\0\"\0\0J\0\0g\0\0�\0\0�\0\0�\0\0�\0\0��M�{�\0�Y�\0�M�o�\0�Y�\0�M�c�\0�Y�\0�M�W�\0�Y�\0�M�K�\0�Y�\0�M�?�\0�Y�\0�M�3�\0�Y�\0�M�\'�\0�Y�\0�M��\0�Y�\0�M��\0�Y�\0�M�M�\0��\0�Y*�\0\\��\0��\0�\0�\0�M�\0�\0�Y*�\0\\��\0��\0�\0�\0�M�\0Ļ\0�Y*�\02�\0��\0ٸ\0�\0��\0�\0���\0�\0�M�\0��\0�Y*�\0\\��\0��\0�\0�\0�M�\0�\0�Y*�\0\\��\0��\0�\0�\0�M�\0b*�\0`��\0�M�\0T�\0�Y*�\0\\��\0ٸ\0�\0���\0�*�\0Z��\0ٶ\0�\0�M�\0\'*�\0^��\0�M�\0*�\0b��\0�M�\0�Y�M,�\0\0\0\0m\0\0\0�\0.\0\0\n\0\0h\0k\0n\0w\0z\Z\0�\0�\0� \0�$\0�%\0�)\0�*\0�.\0�/\0�3\0�4\0�8\0�9\0�=\0�>\0�B\0�C\0�G\0�H\0�LMQ\"R%VJWM[g\\j`�a�e�f�j�k�o�p�t�u�y��\0\0�\0\0�\0\0\0\0\0�\0*\0\0�\0\0\0\0�M�\0\0�\0\0\0\0\0\0\0\0\0\0e\0\0\0k\0\0\0w\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0\0\"\0\0J\0\0g\0\0�\0\0�\0\0�\0\0�\0\0��M�{�\0�Y�\0�M�o�\0�Y�\0�M�c�\0�Y�\0�M�W�\0�Y�\0�M�K�\0�Y�\0�M�?�\0�Y�\0�M�3�\0�Y�\0�M�\'�\0�Y�\0�M��\0�Y�\0�M��\0�Y�\0�M�M�\0��\0�Y*�\0\\�\0��\0��\0�\0�\0�M�\0�\0�Y*�\0\\�\0��\0��\0�\0�\0�M�\0Ļ\0�Y*�\02�\0��\0ٸ\0�\0��\0�\0���\0�\0�M�\0��\0�Y*�\0\\�\0��\0��\0�\0�\0�M�\0�\0�Y*�\0\\�\0��\0��\0�\0�\0�M�\0b*�\0`�\0��\0�M�\0T�\0�Y*�\0\\�\0��\0ٸ\0�\0���\0�*�\0Z�\0��\0ٶ\0�\0�M�\0\'*�\0^�\0��\0�M�\0*�\0b��\0�M�\0�Y�M,�\0\0\0\0m\0\0\0�\0.\0\0�\0�\0h�\0k�\0n�\0w�\0z�\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0����\"�%�J�M�g�j����������������������\0\0\0\0\0t\0_1398434024320_629413t\02net.sf.jasperreports.engine.design.JRJavacCompiler','reporteEstudiosARealizarEntreFechas',NULL);
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

-- Dump completed on 2014-04-25 15:51:41
