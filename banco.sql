-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: banco_mexico
-- ------------------------------------------------------
-- Server version	5.6.24-enterprise-commercial-advanced-log

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `Usuario` varchar(50) NOT NULL,
  `contraseña` varchar(16) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `privilegio` int(1) NOT NULL,
  `id_admin` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES ('lopsanelcrack','lopsan777','makiki789@gmail.com',1,1);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historial` (
  `Usuario` varchar(40) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Tarjeta` varchar(25) NOT NULL,
  `Pago` varchar(25) NOT NULL,
  `Cargo` int(20) NOT NULL,
  `Fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Id_pago` mediumint(50) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` VALUES ('04f1d4d84dab42d3af0195b3dadb652b','makiki789@gmail.com','123456789456123','telefono',200,'2016-05-30 12:22:40',1),('04f1d4d84dab42d3af0195b3dadb652b','makiki789@gmail.com','123456789456123','luz',100,'2016-05-30 13:20:32',3),('6ea82ae0704946d9879ce7588636ba45','salazarpazomar@gmail.com','7894563214785692','telefono',200,'2016-05-30 22:40:58',4),('6ea82ae0704946d9879ce7588636ba45','salazarpazomar@gmail.com','7894563214785692','luz',100,'2016-05-31 13:27:34',5),('ebf0b456b5624af38540d7cda80cd241','zuluues@gmail.com','1234567891011121','telefono',926,'2016-06-01 00:49:01',6),('6ea82ae0704946d9879ce7588636ba45','salazarpazomar@gmail.com','7894563214785692','agua',100,'2016-06-01 00:56:59',7);
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos` (
  `Usuario` varchar(50) NOT NULL,
  `llamada_local` int(20) DEFAULT NULL,
  `llamada_inter` int(20) DEFAULT NULL,
  `agua` int(10) DEFAULT NULL,
  `luz` int(40) NOT NULL,
  PRIMARY KEY (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES ('04f1d4d84dab42d3af0195b3dadb652b',0,0,0,0),('0f267aa9ef3b410f9d14075a2fc1a87d',405,212,457,100),('6ea82ae0704946d9879ce7588636ba45',0,0,0,0),('7414918af43f4954a0bd7b742913a1d7',100,100,100,100),('80f277f6252f4517a1a15fe3d4ffbfae',100,100,100,100),('a6425f2514fa41849d2e07decdd096bc',100,100,100,100),('c49af7b416724215a43456b6a69d7b79',350,652,160,198),('e70b6b18e0d64a6496295c1734fbbcea',734,614,666,273),('ebf0b456b5624af38540d7cda80cd241',0,0,802,46),('ef18d6f01f114f8bb4a15d75959f1a39',73,650,260,343);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro` (
  `Email` varchar(50) NOT NULL,
  `Num_tar` varchar(16) NOT NULL,
  `CVV` int(3) NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Contra` varchar(50) NOT NULL,
  `Id_usu` mediumint(9) NOT NULL AUTO_INCREMENT,
  `id_lost` varchar(45) NOT NULL,
  `temp_us` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_usu`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES ('makiki789@gmail.com','123456789456123',123,'04f1d4d84dab42d3af0195b3dadb652b','no',1,'48f6ed55afad4ae5871bc7aa936e70db','makiki789'),('masterofhalo9000@hotmail.com','123456789456123',123,'80f277f6252f4517a1a15fe3d4ffbfae','90bbf325-8a38-4fa0-bf0c-cfcb07c5b108',2,'ea307743b9944377a34d91556847be66','masterofhalo9000'),('salazarpazomar@live.com.ar','7894563214785692',258,'6ea82ae0704946d9879ce7588636ba45','pololo',4,'a94f1c268ec24805a52dbb94dba42cc9','salazarpazomar'),('ianbalderas@hotmail.com','4915801078170112',256,'0f267aa9ef3b410f9d14075a2fc1a87d','tugfa',5,'915423d24a0447dfa3710f23cb45fcc3','ianbalderas'),('kakashi_hatake_97@hotnail.com','1234567894561234',123,'e70b6b18e0d64a6496295c1734fbbcea','647f8ff0-17c6-48d8-9987-61d4cf93d25c',6,'9140e3cafb904b6b8983ff40f5267782','kakashi_hatake_97@hotnail.com'),('kakashi_hatake_97@hotmail.com','1234567894561234',123,'c49af7b416724215a43456b6a69d7b79','hola',7,'c66f8bd4c265415485b3eef9877c9694','kakashi_hatake_97'),('zuluues@gmail.com','1234567891011121',321,'ebf0b456b5624af38540d7cda80cd241','HOLA',8,'8969fb3f702f43fb82f0f4f75805f173','zuluues');
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_baja`
--

DROP TABLE IF EXISTS `servicio_baja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio_baja` (
  `Usuario` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `razon` varchar(500) NOT NULL,
  `temporal` varchar(45) NOT NULL,
  `id_baja` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_baja`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_baja`
--

LOCK TABLES `servicio_baja` WRITE;
/*!40000 ALTER TABLE `servicio_baja` DISABLE KEYS */;
INSERT INTO `servicio_baja` VALUES ('6ea82ae0704946d9879ce7588636ba45','salazarpazomar@gmail.com','Quiero un perrito de malta','salazarpazomar',7),('6ea82ae0704946d9879ce7588636ba45','salazarpazomar@gmail.com','sdfsdfsdfsdfsdfsddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd','salazarpazomar',8);
/*!40000 ALTER TABLE `servicio_baja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjeta` (
  `Usuario` varchar(50) NOT NULL,
  `card` varchar(16) NOT NULL,
  `cvv` int(3) DEFAULT NULL,
  `m_vencimiento` int(2) NOT NULL,
  `a_vencimiento` int(4) NOT NULL,
  `fondos` int(20) NOT NULL,
  PRIMARY KEY (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` VALUES ('04f1d4d84dab42d3af0195b3dadb652b','123456789456123',123,12,1997,2600),('0f267aa9ef3b410f9d14075a2fc1a87d','4915801078170112',256,4,2020,3000),('6ea82ae0704946d9879ce7588636ba45','7894563214785692',258,6,2021,2600),('80f277f6252f4517a1a15fe3d4ffbfae','123456789456123',123,1,2017,3000),('a6425f2514fa41849d2e07decdd096bc','123456789456123',123,1,2017,3000),('c49af7b416724215a43456b6a69d7b79','1234567894561234',123,3,2026,1203),('e70b6b18e0d64a6496295c1734fbbcea','1234567894561234',123,3,2026,2871),('ebf0b456b5624af38540d7cda80cd241','1234567891011121',321,7,2017,163),('ef18d6f01f114f8bb4a15d75959f1a39','1234567891011121',321,7,2017,1773);
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-31 20:50:59
