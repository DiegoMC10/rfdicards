CREATE DATABASE  IF NOT EXISTS `tarjetasdb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tarjetasdb`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: tarjetasdb
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
-- Table structure for table `acount_type_catalogo`
--

DROP TABLE IF EXISTS `acount_type_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acount_type_catalogo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUser` int NOT NULL,
  `vendedorID` int NOT NULL,
  `orderID` varchar(100) DEFAULT NULL,
  `fechaCompra` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaExpiracion` timestamp NULL DEFAULT NULL,
  `metodoPago` varchar(45) DEFAULT 'online',
  `mail` varchar(70) NOT NULL,
  `planDuration` varchar(45) DEFAULT NULL,
  `notas` varchar(250) DEFAULT NULL,
  `planType` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `userid-compras_idx` (`idUser`),
  KEY `vendorid-compras_idx` (`vendedorID`),
  CONSTRAINT `userid-compras` FOREIGN KEY (`idUser`) REFERENCES `users` (`idusers`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vendorid-compras` FOREIGN KEY (`vendedorID`) REFERENCES `vendedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `linksinfo`
--

DROP TABLE IF EXISTS `linksinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linksinfo` (
  `idlinksInfo` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `uuid` int NOT NULL,
  `alias` varchar(20) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '0',
  `isLinksOTarjeta` tinyint(1) DEFAULT '1',
  `isPublicidadActive` tinyint(1) DEFAULT '1',
  `photoID` varchar(200) DEFAULT 'https://flubulbuket.us-southeast-1.linodeobjects.com/Mostrando persona.png',
  `photoEmpresa` varchar(200) DEFAULT '.',
  `nombre` varchar(80) DEFAULT 'Tu Nombre',
  `apellido` varchar(45) DEFAULT 'Tu Apellido',
  `puesto` varchar(40) DEFAULT 'Tu Puesto',
  `linksRedes` varchar(600) DEFAULT '[{"icon":"flubul","link":"flubul","style":"none"}]',
  `about` varchar(255) DEFAULT '.',
  `linksGenerales` varchar(600) DEFAULT '[{"link":"https://flubul.com","name":"Flubul!!"}]',
  `videoLink` varchar(255) DEFAULT 'https://www.youtube.com/watch?v=jfKfPfyJRdk',
  `IsAboutOn` tinyint(1) DEFAULT '1',
  `IsLinksRedesOn` tinyint(1) DEFAULT '1',
  `IsVideoLinksOn` tinyint(1) DEFAULT '1',
  `IsGeneralLinksOn` tinyint(1) DEFAULT '1',
  `celular` varchar(20) DEFAULT '0',
  `telefono` varchar(20) DEFAULT '0',
  `empresa` varchar(45) DEFAULT '.',
  `mail` varchar(45) DEFAULT '.',
  `webPageUrl` varchar(80) DEFAULT '.',
  `adress` varchar(255) DEFAULT '.',
  `IsVendorEdit` int DEFAULT '1',
  `isMainProfile` varchar(45) DEFAULT NULL,
  `colorCaja` varchar(10) DEFAULT '#0F2D48',
  `colorFondo` varchar(10) DEFAULT '#286399',
  `colorBoton` varchar(10) DEFAULT '#FF4742',
  `colorBotonLetras` varchar(10) DEFAULT '#ffffff',
  `colorLetras` varchar(10) DEFAULT '#ffffff',
  `colorFondoBajo` varchar(10) DEFAULT '#f5f5f5',
  PRIMARY KEY (`idlinksInfo`),
  UNIQUE KEY `idlinksInfo_UNIQUE` (`idlinksInfo`),
  UNIQUE KEY `alias_UNIQUE` (`alias`),
  KEY `usersLinks_idx` (`userid`),
  CONSTRAINT `userToLinksinfo` FOREIGN KEY (`userid`) REFERENCES `users` (`idusers`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_type`
--

DROP TABLE IF EXISTS `plan_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `plan_active` tinyint(1) DEFAULT '1',
  `precio_publico` int DEFAULT NULL,
  `meses` int DEFAULT '12',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tarjetas_prepago_batch`
--

DROP TABLE IF EXISTS `tarjetas_prepago_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjetas_prepago_batch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `batch_alias` varchar(45) NOT NULL,
  `id_vendedor` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `batch_alias_UNIQUE` (`batch_alias`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temas_perfil`
--

DROP TABLE IF EXISTS `temas_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temas_perfil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) DEFAULT NULL,
  `ColorCaja` varchar(15) DEFAULT NULL,
  `ColorFondo` varchar(15) DEFAULT NULL,
  `ColorBoton` varchar(15) DEFAULT NULL,
  `ColorBotonLetras` varchar(15) DEFAULT NULL,
  `ColorLetras` varchar(15) DEFAULT NULL,
  `ColorFondoBajo` varchar(15) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_profile_clicks`
--

DROP TABLE IF EXISTS `user_profile_clicks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile_clicks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profileId` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uuid` int DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `device` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1971 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idusers` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(100) NOT NULL,
  `nombre` varchar(70) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `isActive` tinyint DEFAULT '1',
  `confirmationPass` varchar(45) DEFAULT NULL,
  `confirmationGenerated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `vendedorID` int DEFAULT NULL,
  `changePassToken` varchar(45) DEFAULT NULL,
  `sendMailsTry` int DEFAULT '0',
  `IsVendorEdit` tinyint DEFAULT '0',
  `accountCreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isVeryfy` tinyint(1) DEFAULT '0',
  `isTermsAndConditionsAccepted` tinyint(1) DEFAULT '0',
  `prepago` tinyint(1) DEFAULT '0',
  `type` int DEFAULT '0',
  `coment` varchar(45) DEFAULT '.',
  `batch` int DEFAULT '0',
  `planType` int NOT NULL DEFAULT '0',
  `fechaExpiracion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idusers`),
  UNIQUE KEY `Mail_UNIQUE` (`mail`),
  UNIQUE KEY `idusers_UNIQUE` (`idusers`),
  KEY `users-batch_idx` (`batch`),
  KEY `users-card-type_idx` (`type`),
  CONSTRAINT `users-batch` FOREIGN KEY (`batch`) REFERENCES `tarjetas_prepago_batch` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users-type` FOREIGN KEY (`type`) REFERENCES `acount_type_catalogo` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(60) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `IsVendorActive` tinyint(1) DEFAULT '1',
  `permisos` int DEFAULT '1',
  `fechaDeCreacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `isTermsAndConditionsAccepted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `mail_UNIQUE` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- 
