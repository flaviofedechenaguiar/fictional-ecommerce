-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: database_project
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `Admins`
--

CREATE DATABASE IF NOT EXISTS `database_project`;
USE `database_project`;

DROP TABLE IF EXISTS `Admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admins`
--

LOCK TABLES `Admins` WRITE;
/*!40000 ALTER TABLE `Admins` DISABLE KEYS */;
INSERT INTO `Admins` VALUES (1,'admin','admin@admin.com','$2b$10$iu.bLduwHY00MnrjHxuaqO31Ruuswoa1PF466Tt2cleGbxoTd4TAe',1,'2021-04-06 18:45:03','2021-04-06 18:45:03'),(2,'Carlos','carlos@carlos.com','$2b$10$yh0wSXqphcqQ7Ekv7QYJK.Pu1jVXGkBOgjJh2Jenzut4ETwfjfude',1,'2021-04-08 07:35:54','2021-04-07 07:50:20'),(4,'fabio','fabio@fabio','$2b$10$PtrbDchwk01OYQtwtSCMf.9PCDgyrBFYtm/XkhXJSJGu/dvGi7KdW',0,'2021-04-08 09:29:03','2021-04-08 09:29:06');
/*!40000 ALTER TABLE `Admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Banners`
--

DROP TABLE IF EXISTS `Banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Banners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `linkOne` text NOT NULL,
  `linkTwo` text NOT NULL,
  `linkThree` text NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Banners`
--

LOCK TABLES `Banners` WRITE;
/*!40000 ALTER TABLE `Banners` DISABLE KEYS */;
INSERT INTO `Banners` VALUES (1,'https://http2.mlstatic.com/optimize/o:f_webp/resources/deals/exhibitors_resources/mlb-home-desktop-slider-picture-782dcbf4-d90b-46e0-a473-843a44c80df7.jpg','https://http2.mlstatic.com/optimize/o:f_webp/resources/deals/exhibitors_resources/mlb-home-desktop-slider-picture-8acde4ab-db86-456d-be2b-29d67ff893e1.jpg','https://http2.mlstatic.com/optimize/o:f_webp/resources/deals/exhibitors_resources/mlb-home-desktop-slider-picture-568a0e60-2447-476c-9907-ae5448af9085.jpg',1,'2021-04-06 19:24:31','2021-04-08 09:44:17');
/*!40000 ALTER TABLE `Banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (1,'Informática',1,'2021-04-06 18:45:55','2021-04-06 18:45:55'),(2,'Eletrônicos',1,'2021-04-06 18:46:06','2021-04-06 18:46:06'),(3,'Eletrodomésticos',1,'2021-04-06 18:46:58','2021-04-06 18:46:58'),(4,'Games',1,'2021-04-06 18:49:11','2021-04-06 18:49:11'),(5,'Ferramentas',1,'2021-04-06 18:52:29','2021-04-06 18:52:29'),(6,'Brinquedos',1,'2021-04-06 18:52:46','2021-04-06 18:52:46'),(7,'Livros',1,'2021-04-06 18:53:44','2021-04-06 18:53:44'),(8,'Vestuário',1,'2021-04-08 09:30:53','2021-04-08 09:30:53');
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Items`
--

DROP TABLE IF EXISTS `Order_Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_Items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProductId` int DEFAULT NULL,
  `OrderId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProductId` (`ProductId`),
  KEY `OrderId` (`OrderId`),
  CONSTRAINT `Order_Items_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Order_Items_ibfk_2` FOREIGN KEY (`OrderId`) REFERENCES `Orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Items`
--

LOCK TABLES `Order_Items` WRITE;
/*!40000 ALTER TABLE `Order_Items` DISABLE KEYS */;
INSERT INTO `Order_Items` VALUES (1,2,60.00,1,'2021-04-08 07:44:01','2021-04-08 07:44:01',2,1),(2,3,45.00,1,'2021-04-08 07:44:01','2021-04-08 07:44:01',4,1),(3,1,40.98,1,'2021-04-08 07:44:01','2021-04-08 07:44:01',11,1),(4,1,620.00,1,'2021-04-08 07:44:51','2021-04-08 07:44:51',1,2),(5,1,129.99,1,'2021-04-08 07:44:51','2021-04-08 07:44:51',12,2),(6,1,6899.00,1,'2021-04-08 07:48:25','2021-04-08 07:48:25',13,3),(7,1,1250.00,1,'2021-04-08 07:48:25','2021-04-08 07:48:25',9,3),(8,2,8999.88,1,'2021-04-08 07:48:25','2021-04-08 07:48:25',14,3),(9,1,3399.99,1,'2021-04-07 07:52:05','2021-04-07 07:52:05',6,4),(10,1,3399.99,1,'2021-04-08 09:26:13','2021-04-08 09:26:13',6,5),(11,4,620.00,1,'2021-04-08 09:49:39','2021-04-08 09:49:39',1,6),(12,5,620.00,1,'2021-04-08 09:50:47','2021-04-08 09:50:47',1,7);
/*!40000 ALTER TABLE `Order_Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,160.98,2,'2021-04-08 07:44:00','2021-04-08 09:42:15',1),(2,749.99,2,'2021-04-08 07:44:51','2021-04-08 07:49:07',1),(3,26148.76,3,'2021-04-08 07:48:25','2021-04-08 07:49:16',1),(4,3399.99,1,'2021-04-07 07:52:05','2021-04-07 07:52:05',1),(5,3399.99,1,'2021-04-08 09:26:13','2021-04-08 09:26:13',2),(6,2480.00,1,'2021-04-08 09:49:39','2021-04-08 09:49:39',1),(7,3100.00,1,'2021-04-08 09:50:47','2021-04-08 09:50:47',2);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Images`
--

DROP TABLE IF EXISTS `Product_Images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_Images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `imageLink` text NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProductId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProductId` (`ProductId`),
  CONSTRAINT `Product_Images_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Images`
--

LOCK TABLES `Product_Images` WRITE;
/*!40000 ALTER TABLE `Product_Images` DISABLE KEYS */;
INSERT INTO `Product_Images` VALUES (1,'Foto de cima','https://images.stockx.com/K-Swiss-One-Tap-MiBR-Black-2.png?fit=clip&bg=FFFFFF&h=500&auto=compress&q=90&dpr=2&trim=color&updated_at=1603481985&fm=webp&ixlib=react-9.0.3&w=1246',1,'2021-04-06 19:23:09','2021-04-08 09:37:24',1),(2,'Foto 02','https://http2.mlstatic.com/D_NQ_NP_711413-MLA44921120786_022021-O.webp',1,'2021-04-06 19:23:09','2021-04-06 19:23:09',1),(3,'Foto 01','https://http2.mlstatic.com/D_NQ_NP_731878-MLB44616925570_012021-O.webp',1,'2021-04-06 19:29:06','2021-04-06 19:29:06',2),(4,'Foto 02','https://http2.mlstatic.com/D_NQ_NP_747015-MLB44616925568_012021-O.webp',1,'2021-04-06 19:29:06','2021-04-06 19:29:06',2),(5,'Foto 03','https://http2.mlstatic.com/D_NQ_NP_630447-MLB44616925573_012021-O.webp',1,'2021-04-06 19:29:06','2021-04-06 19:29:06',2),(6,'Foto 04','https://http2.mlstatic.com/D_NQ_NP_890277-MLB44616925572_012021-O.webp',1,'2021-04-06 19:29:06','2021-04-06 19:29:06',2),(7,'','',1,'2021-04-06 19:32:41','2021-04-08 09:37:24',3),(8,'Monstro','https://http2.mlstatic.com/D_NQ_NP_880379-MLA44346739757_122020-O.webp',1,'2021-04-06 19:32:41','2021-04-06 19:44:07',3),(9,'Duo','https://http2.mlstatic.com/D_NQ_NP_974064-MLA44347011096_122020-O.webp',1,'2021-04-06 19:32:41','2021-04-06 19:44:07',3),(10,'Foto 01','https://http2.mlstatic.com/D_NQ_NP_988358-MLB31082106265_062019-O.webp',1,'2021-04-06 19:34:04','2021-04-06 19:34:04',4),(11,'Foto 02','https://http2.mlstatic.com/D_NQ_NP_978904-MLB31082111638_062019-O.webp',1,'2021-04-06 19:34:04','2021-04-06 19:34:04',4),(12,'Foto 03','https://http2.mlstatic.com/D_NQ_NP_961224-MLB31082105267_062019-O.webp',1,'2021-04-06 19:34:04','2021-04-06 19:34:04',4),(13,'Foto 01','https://http2.mlstatic.com/D_NQ_NP_875465-MLA41266678641_032020-O.webp',1,'2021-04-06 19:36:37','2021-04-06 19:36:37',5),(14,'Foto 01','https://http2.mlstatic.com/D_NQ_NP_807549-MLB45204107711_032021-O.webp',1,'2021-04-06 19:42:46','2021-04-06 19:42:46',6),(15,'Foto 02','https://http2.mlstatic.com/D_NQ_NP_605539-MLB45204112401_032021-O.webp',1,'2021-04-06 19:42:46','2021-04-06 19:42:46',6),(16,'Foto 03','https://http2.mlstatic.com/D_NQ_NP_942886-MLB45204105809_032021-O.webp',1,'2021-04-06 19:42:46','2021-04-06 19:42:46',6),(17,'Foto de cima','https://images.stockx.com/K-Swiss-One-Tap-MiBR-Black-2.png?fit=clip&bg=FFFFFF&h=500&auto=compress&q=90&dpr=2&trim=color&updated_at=1603481985&fm=webp&ixlib=react-9.0.3&w=1246',1,'2021-04-06 19:43:17','2021-04-06 19:43:17',7),(18,'Foto 01','https://http2.mlstatic.com/D_NQ_NP_917383-MLA40518962209_012020-O.webp',1,'2021-04-06 19:49:23','2021-04-06 19:49:23',8),(19,'Foto 02','https://http2.mlstatic.com/D_NQ_NP_830713-MLA40518682521_012020-O.webp',1,'2021-04-06 19:49:23','2021-04-06 19:49:23',8),(20,'Foto 03','https://http2.mlstatic.com/D_NQ_NP_744287-MLA40518962210_012020-O.webp',1,'2021-04-06 19:49:23','2021-04-06 19:49:23',8),(21,'Foto 04','https://http2.mlstatic.com/D_NQ_NP_815668-MLA40518682522_012020-O.webp',1,'2021-04-06 19:49:23','2021-04-06 19:49:23',8),(22,'Foto de cima','https://ae01.alicdn.com/kf/H6dc7fc919e8d42648050fbdbfba12470S/INTEL-XEON-E5-2695-V4-18-PROCESSADOR-CPU-CORE-2-1GHz-45MB-LGA-2011-3-L3.jpg_Q90.jpg_.webp',1,'2021-04-06 19:53:55','2021-04-06 19:53:55',9),(23,'Foto 01','https://http2.mlstatic.com/D_NQ_NP_604362-MLA32149626550_092019-O.webp',1,'2021-04-07 08:50:04','2021-04-07 08:50:04',10),(24,'Foto 02','https://http2.mlstatic.com/D_NQ_NP_703786-MLA32149634533_092019-O.webp',1,'2021-04-07 08:50:04','2021-04-07 08:50:04',10),(25,'Foto 01','https://http2.mlstatic.com/D_NQ_NP_775660-MLB31150571272_062019-O.webp',1,'2021-04-07 08:53:24','2021-04-07 08:53:24',11),(26,'Foto 02','https://http2.mlstatic.com/D_NQ_NP_936966-MLB31150576078_062019-O.webp',1,'2021-04-07 08:53:24','2021-04-07 08:53:24',11),(27,'Foto 01','https://http2.mlstatic.com/D_NQ_NP_767671-MLA44050683007_112020-O.webp',1,'2021-04-07 09:18:13','2021-04-07 09:18:13',12),(28,'Cima','https://http2.mlstatic.com/D_NQ_NP_910825-MLB45224898546_032021-O.webp',1,'2021-04-07 10:26:03','2021-04-07 10:26:03',13),(29,'Cima','https://http2.mlstatic.com/D_NQ_NP_775488-MLB45224935078_032021-O.webp',1,'2021-04-07 10:26:03','2021-04-07 10:26:03',13),(30,'Cima','https://media.pichau.com.br/media/catalog/product/cache/6ee86225acc73f593166d49264424d36/a/x/axrx-6800xt-16gbd6-3dheoc4.jpg',1,'2021-04-07 10:41:06','2021-04-07 10:41:06',14),(31,'Angulo','https://media.pichau.com.br/media/catalog/product/cache/6ee86225acc73f593166d49264424d36/a/x/axrx-6800xt-16gbd6-3dheoc1.jpg',1,'2021-04-07 10:41:06','2021-04-07 10:41:06',14),(32,'Angulo','https://media.pichau.com.br/media/catalog/product/cache/6ee86225acc73f593166d49264424d36/a/x/axrx-6800xt-16gbd6-3dheoc2.jpg',1,'2021-04-07 10:41:06','2021-04-07 10:41:06',14),(33,'Frente','https://http2.mlstatic.com/D_NQ_NP_601136-MLA43553973898_092020-O.web',1,'2021-04-07 10:54:55','2021-04-07 11:01:02',15),(34,'Frente','https://http2.mlstatic.com/D_NQ_NP_849925-MLA43554077671_092020-O.web',1,'2021-04-07 10:54:55','2021-04-07 11:01:02',15),(35,'Angulo','https://http2.mlstatic.com/D_NQ_NP_779075-MLA43553973899_092020-O.web',1,'2021-04-07 10:54:55','2021-04-07 11:01:02',15),(36,'Foto 01','https://http2.mlstatic.com/D_NQ_NP_947432-MLB43198135900_082020-O.webp',1,'2021-04-07 19:29:28','2021-04-07 19:29:28',16),(37,'Foto 03','https://http2.mlstatic.com/D_NQ_NP_872482-MLB43198152344_082020-O.webp',1,'2021-04-07 19:29:28','2021-04-07 19:29:28',16),(38,'Foto 02','https://http2.mlstatic.com/D_NQ_NP_960805-MLB43198151358_082020-O.webp',1,'2021-04-07 19:29:28','2021-04-07 19:29:28',16),(39,'Foto 01','https://http2.mlstatic.com/D_NQ_NP_768894-MLB44172480405_112020-O.webp',1,'2021-04-07 19:34:10','2021-04-07 19:34:10',17),(40,'Foto 03','https://http2.mlstatic.com/D_NQ_NP_837854-MLB44172480404_112020-O.webp',1,'2021-04-07 19:34:10','2021-04-07 19:34:10',17),(41,'Foto 04','https://http2.mlstatic.com/D_NQ_NP_908250-MLB44172480402_112020-O.webp',1,'2021-04-07 19:34:10','2021-04-07 19:34:10',17),(42,'Foto 04','https://http2.mlstatic.com/D_NQ_NP_777553-MLB44172480403_112020-O.webp',1,'2021-04-07 19:34:10','2021-04-07 19:34:10',17),(43,'Parte de trás','https://http2.mlstatic.com/D_NQ_NP_679690-MLB45455622547_042021-O.webp',1,'2021-04-08 09:36:07','2021-04-08 09:36:07',19),(44,'Parte da frente','https://http2.mlstatic.com/D_NQ_NP_652858-MLB45455601791_042021-O.webp',1,'2021-04-08 09:36:07','2021-04-08 09:36:07',19),(45,'Virado','https://http2.mlstatic.com/D_NQ_NP_951129-MLB45455622545_042021-O.webp',1,'2021-04-08 09:36:07','2021-04-08 09:36:07',19);
/*!40000 ALTER TABLE `Product_Images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `namePlusSmallDescription` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `refCode` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `purchasePrice` decimal(10,2) NOT NULL,
  `saleValue` decimal(10,2) NOT NULL,
  `stockQuantity` int NOT NULL,
  `imageLink` text NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProviderId` int DEFAULT NULL,
  `CategoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProviderId` (`ProviderId`),
  KEY `CategoryId` (`CategoryId`),
  CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`ProviderId`) REFERENCES `Providers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Products_ibfk_2` FOREIGN KEY (`CategoryId`) REFERENCES `Categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,'Teclado gamer Razer Cynosa V2 QWERTY','Razer','01','<p>Falar da Razer dentro do mundo dos jogadores &eacute; palavra maior. Esta empresa oferece produtos de alta qualidade para seus usu&aacute;rios. Sua linha de teclados &eacute; reconhecida por ter recebido v&aacute;rios pr&ecirc;mios internacionais por seu alto desempenho.</p>\r\n<p>Distin&ccedil;&atilde;o a toda cor<br />Sua retroilumina&ccedil;&atilde;o lhe d&aacute; um toque diferente ao seu dispositivo e destaca sua composi&ccedil;&atilde;o quando &eacute; usado em espa&ccedil;os mal iluminados.</p>',500.00,620.00,0,'https://http2.mlstatic.com/D_NQ_NP_601776-MLA44921557479_022021-O.webp',1,'2021-04-06 19:23:09','2021-04-08 09:50:48',5,1),(2,'Kit De Chaves Ferramentas Yaxun','Yaxun','02','<p>Excelente Kit profissional e amador de alta precis&atilde;o contendo chaves de fenda conjunto de bits mini para manuten&ccedil;&atilde;o em aparelhos de telefone celular, smartphone e eletr&ocirc;nico.<br />&nbsp;<br />INFORMA&Ccedil;&Otilde;ES T&Eacute;CNICAS DO KIT&nbsp;<br />&nbsp;<br />-Produto: Kit Chaves Ferramentas Yaxun Yx6028<br />-Marca do modelo: Yaxun<br /><br />Chave Torx: T2, T3, T4, T5, T6, T7, T8, T9, T10, T15<br />Chave Philips: 1.2, 1.5, 2.0<br />Chave de Fenda: 1.5, 2.0<br />Chave Hexagonal: 2.5, 3, 3.5, 4, 4.5, 5, 5.5<br />Chave Estrela (5 Pontas): 0.8, 1.2<br />Chave Y: 2.0<br />Chave PH2<br />Chave Triangulo: 2.3<br />Chave U1: 2.6<br />02 - chaves pl&aacute;sticas<br />01 - Ventosa<br />01 - Pin&ccedil;a<br />Chave Pentalobe 30mm</p>',41.90,60.00,18,'https://http2.mlstatic.com/D_NQ_NP_682561-MLB44692425927_012021-O.webp',0,'2021-04-06 19:29:06','2021-04-08 09:38:33',6,5),(3,'God of War (2018) Standard Edition Fis.','Sony','560','<p>Com este jogo de God of War, voc&ecirc; desfrutar&aacute; de horas de divers&atilde;o e novos desafios que permitir&atilde;o que voc&ecirc; se aprimore como jogador.</p>\r\n<p>&nbsp;</p>\r\n<div class=\"ui-pdp-container__row ui-pdp-container__row--highlighted-specs-title\">\r\n<p class=\"ui-vpp-text-alignment--left ui-pdp-color--BLACK ui-pdp-size--XLARGE ui-pdp-family--REGULAR highlighted-specs-title\">Caracter&iacute;sticas para God of War (2018) Standard Edition</p>\r\n</div>\r\n<div class=\"ui-pdp-container__row ui-pdp-container__row--attributes\">\r\n<div class=\"ui-vpp-highlighted-specs__attribute-columns\">\r\n<div class=\"ui-vpp-highlighted-specs__attribute-columns__column\">\r\n<div class=\"ui-pdp-container__row ui-vpp-highlighted-specs__attribute-columns__row\">\r\n<div class=\"ui-vpp-highlighted-specs__key-value\">\r\n<div class=\"ui-pdp-background-color--GRAY_40 ui-vpp-highlighted-specs__filled-icon ui-vpp-highlighted-specs__filled-icon--ROUNDED\"><img class=\"ui-pdp-image ui-vpp-image-component\" src=\"https://http2.mlstatic.com/resources/frontend/ft-extended-v00/assets/vectorial/default.svg\" />P<span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\">lataforma:</span>&nbsp;<span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--SEMIBOLD\">PS4</span></div>\r\n</div>\r\n</div>\r\n<div class=\"ui-pdp-container__row ui-vpp-highlighted-specs__attribute-columns__row\">\r\n<div class=\"ui-vpp-highlighted-specs__key-value\">\r\n<div class=\"ui-pdp-background-color--GRAY_40 ui-vpp-highlighted-specs__filled-icon ui-vpp-highlighted-specs__filled-icon--ROUNDED\"><img class=\"ui-pdp-image ui-vpp-image-component\" src=\"https://http2.mlstatic.com/resources/frontend/ft-extended-v00/assets/vectorial/default.svg\" /><span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\">&Eacute; multijogador:</span>&nbsp;<span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--SEMIBOLD\">N&atilde;o</span></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ui-vpp-highlighted-specs__attribute-columns__column\">\r\n<div class=\"ui-pdp-container__row ui-vpp-highlighted-specs__attribute-columns__row\">\r\n<div class=\"ui-vpp-highlighted-specs__key-value\">\r\n<div class=\"ui-pdp-background-color--GRAY_40 ui-vpp-highlighted-specs__filled-icon ui-vpp-highlighted-specs__filled-icon--ROUNDED\"><img class=\"ui-pdp-image ui-vpp-image-component\" src=\"https://http2.mlstatic.com/resources/frontend/ft-extended-v00/assets/vectorial/default.svg\" /><span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\">Formato:</span>&nbsp;<span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--SEMIBOLD\">F&iacute;sico</span></div>\r\n</div>\r\n</div>\r\n<div class=\"ui-pdp-container__row ui-vpp-highlighted-specs__attribute-columns__row\">\r\n<div class=\"ui-vpp-highlighted-specs__key-value\">\r\n<div class=\"ui-pdp-background-color--GRAY_40 ui-vpp-highlighted-specs__filled-icon ui-vpp-highlighted-specs__filled-icon--ROUNDED\"><img class=\"ui-pdp-image ui-vpp-image-component\" src=\"https://http2.mlstatic.com/resources/frontend/ft-extended-v00/assets/vectorial/default.svg\" /><span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\">&Eacute; online:</span>&nbsp;<span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--SEMIBOLD\">N&atilde;o</span></div>\r\n<div class=\"ui-pdp-background-color--GRAY_40 ui-vpp-highlighted-specs__filled-icon ui-vpp-highlighted-specs__filled-icon--ROUNDED\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>',40.00,69.60,100,'https://http2.mlstatic.com/D_NQ_NP_645956-MLA44347011095_122020-O.webp',1,'2021-04-06 19:32:41','2021-04-06 19:44:07',3,4),(4,'Bíblia Sagrada Capa C/ Detalhes Leão NAA','Bíblia Sabrada','542','<p>As novas edi&ccedil;&otilde;es da B&iacute;blia Sagrada na tradu&ccedil;&atilde;o Nova Almeida Atualizada trazem um conceito inovador.</p>\r\n<p>Com um visual moderno e atual, as edi&ccedil;&otilde;es s&atilde;o indicadas especialmente para o p&uacute;blico jovem.</p>\r\n<p>A Nova Almeida Atualizada &eacute; uma tradu&ccedil;&atilde;o lan&ccedil;ada em 2017 pela SBB, com o que h&aacute; de melhor e mais recente no campo dos estudos teol&oacute;gicos e cient&iacute;ficos sobre as Escrituras e seu contexto original.</p>\r\n<p>Resultado de uma profunda revis&atilde;o da consagrada tradu&ccedil;&atilde;o Almeida Revista e Atualizada, a Nova Almeida Atualizada apresenta um texto cl&aacute;ssico com uma linguagem atual, seguindo a norma padr&atilde;o do portugu&ecirc;s escrito e falado no Brasil.</p>\r\n<p>Tradu&ccedil;&atilde;o: Nova Almeida Atualizada</p>\r\n<p>Tamanho da Letra: Normal</p>\r\n<p>Capa: Ilustrada ( Detalhes em Le&atilde;o )</p>\r\n<p>Acabamento: Capa dura</p>\r\n<p>Medidas: 13,5 x 20,0 cm</p>\r\n<p>Formato: M&eacute;dio</p>\r\n<p>P&aacute;ginas: 960 p&aacute;ginas</p>\r\n<p>&Iacute;ndice: N&atilde;o</p>\r\n<p>Indicado para: Evangeliza&ccedil;&atilde;o, Jovens - Adolescentes</p>\r\n<p>Peso: 1,980Kg</p>\r\n<p><br />RECURSOS: - O que a B&iacute;blia diz sobre o perd&atilde;o de Deus</p>',20.00,45.00,47,'https://http2.mlstatic.com/D_NQ_NP_651785-MLB31082105265_062019-O.webp',1,'2021-04-06 19:34:04','2021-04-08 07:44:01',4,7),(5,'Geladeira inverter frost free Panasonic','Panasonic','264','<p>Desfrute da frescura de seus alimentos e armazene-os de maneira pr&aacute;tica e confort&aacute;vel na sua geladeira Panasonic, a protagonista da sua cozinha.<br /><br />Conforto para a sua casa<br />O seu sistema frost free evita a forma&ccedil;&atilde;o de gelo no freezer. Por outro lado, este sistema inovador preserva a umidade dos seus alimentos por mais tempo, conservando o sabor dos produtos.<br /><br />Frescura nos seus alimentos<br />Os 6 n&iacute;veis de temperatura ir&atilde;o ajudar &aacute; conserva&ccedil;&atilde;o de acordo com as suas necessidades e prefer&ecirc;ncias. Toda vez que voc&ecirc; abre a porta, o ar quente entra, portanto, com controle da temperatura, voc&ecirc; poder&aacute; controlar os graus para que os seus produtos fiquem sempre frescos. Al&eacute;m disso, devido &agrave; sua tecnologia inverter, este refrigerador esfria suas comidas atrav&eacute;s de um sistema inteligente com sensores que controlam a velocidade do motor, mantendo a temperatura uniforme no interior.<br /><br />Praticidade no interior<br />A organiza&ccedil;&atilde;o das 3 prateleiras oferece a voc&ecirc; uma grande economia do espa&ccedil;o e f&aacute;cil localiza&ccedil;&atilde;o dos seus produtos. Gra&ccedil;as ao seu material resistente, voc&ecirc; n&atilde;o ter&aacute; que se preocupar com o peso que vai colocar sobre eles e organizar&aacute; cada canto ao seu gosto para aproveitar ao m&aacute;ximo seu uso.Al&eacute;m disso, o seu freezer localizado na parte inferior</p>',2000.00,3199.98,10,'https://http2.mlstatic.com/D_NQ_NP_746471-MLA41266678640_032020-O.webp',1,'2021-04-06 19:36:37','2021-04-06 19:36:37',2,3),(6,'Lego Mindstorms Ev3','Lego','9234','<p>Conhe&ccedil;a o LEGO MINDSTORMS EV3! Combinando a versatilidade do sistema de constru&ccedil;&atilde;o LEGO com a tecnologia mais avan&ccedil;ada que j&aacute; foi desenvolvida pela marca. Conhe&ccedil;a os poderes criativos do novo LEGO MINDSTORMS EV3 para criar rob&ocirc;s com comandos de andar, falar, pensar e fazer qualquer coisa que voc&ecirc; pode imaginar. Siga o passo-a-passo de constru&ccedil;&atilde;o em 3D para criar 5 projetos de rob&oacute;tica pr&eacute;-definidos:<br /><br />Traga esses modelos para a vida com uma f&aacute;cil e intuitiva programa&ccedil;&atilde;o amig&aacute;vel baseada em &iacute;cones na interface de programa&ccedil;&atilde;o do software gratuito EV3 que ser&aacute; disponibilizado ap&oacute;s a compra do Kit Rob&oacute;tica. Pegue o controle remoto e assuma desafiadoras miss&otilde;es prontas ou comande o seu rob&ocirc; usando o dispositivo inteligente.<br /><br />Crie e comande incr&iacute;veis Lego Mindstorms Ev3 rob&ocirc;s com sensores de toque, sensor de cor, sensor infravermelho e mais de 550 elementos LEGO Technic!<br /><br />Sobre o produto:<br /><br />No cora&ccedil;&atilde;o do produto est&aacute; o EV3 Brick inteligente com um poderoso processador ARM9, porta USB para WiFi e conectividade de Internet, leitor de cart&atilde;o Micro SD, bot&otilde;es retro-iluminados e quatro portas de motor<br />Inclui tr&ecirc;s servo-motores interativos, controle remoto, melhorado e redesenhado sensor de cor, sensor de toque redesenhado, sensor infravermelho e mais de 550 elementos LEGO Technic.<br />Controle seu rob&ocirc; atrav&eacute;s do sistema de sensor infravermelho<br />Inclui mais de 550 elementos LEGO Technic - tudo que voc&ecirc; precisa para criar rob&ocirc;s incr&iacute;veis<br />Pilhas n&atilde;o inclu&iacute;das</p>',2098.00,3399.99,8,'https://http2.mlstatic.com/D_NQ_NP_680837-MLB45204112490_032021-O.webp',1,'2021-04-06 19:42:46','2021-04-08 09:26:13',1,6),(7,'K-Swiss One Tap MiBR Black','K-swiss','888','<p>FOTOS REAIS DO PRODUTO<br />&Oacute;TIMA QUALIDADE<br /><br />Estilo: Corrida (Parte Superior Externa)<br /><br />Material sint&eacute;tico resistente Entressola: Tecnologia Air - sistema de amortecimento que se espalha por toda a entressola. Sua fun&ccedil;&atilde;o &eacute; guiar o p&eacute; com seguran&ccedil;a durante toda a movimenta&ccedil;&atilde;o do atleta, absorvendo impactos e impulsionando cada passada Solado: Emborrachado que garante maior tra&ccedil;&atilde;o e<br />ader&ecirc;ncia Lingueta: Acolchoada Palmilha: Injetada Forro T&ecirc;xtil:<br />Interno com refor&ccedil;o acolchoado no calcanhar para maior prote&ccedil;&atilde;o e conforto Ajuste:<br /><br />Cadar&ccedil;o sim&eacute;trico Cano Alto Peso Aproximado: 420 g (o peso varia de acordo com a numera&ccedil;&atilde;o)<br />Origem: Importado Garantia: Contra defeitos de fabrica&ccedil;&atilde;o<br /><br />Diferenciais: Enviamos em at&eacute; 24 horas ap&oacute;s a compra!<br /><br />Produto de &oacute;tima qualidade, n&atilde;o desbota ao ser lavado<br /><br />Palmilha remov&iacute;vel (pode tirar para lavar)<br /><br />Itens que vai junto na embalagem: 01 par de t&ecirc;nis, 01 par de palmilhas, 01 par de cadar&ccedil;os e 01 caixa do produto<br /><br />Todas as fotos s&atilde;o reais do produto, voc&ecirc; vai receber na sua resid&ecirc;ncia exatamente como esta nas fotos<br /><br />Todos eles tem a forma padr&atilde;o, recomendamos comprar o real tamanho do seu p&eacute;<br /><br />Caso n&atilde;o d&ecirc; ou n&atilde;o tiver satisfeito, pode devolver gratuitamente em at&eacute; 7 dias uteis a partir do momento que chegar na sua casa! basta clicar em \'\'&eacute; o que pedi mas n&atilde;o serve\'\' qualquer duvida entra em contato conosco e passamos os procedimentos<br /><br /><br />Trocas por tamanho ou cores fica por conta do cliente, apenas fica por nossa conta trocas por envio errado ou com defeito (trabalhamos com treinamento e total aten&ccedil;&atilde;o para isso n&atilde;o acontecer, mas caso aconte&ccedil;a fique despreocupado pois resolvemos sem nenhuma burocracia!)</p>\r\n<p>&nbsp;</p>',120.00,209.00,10,'https://images.stockx.com/K-Swiss-One-Tap-MiBR-Black.png?fit=clip&bg=FFFFFF&h=500&auto=compress&q=90&dpr=2&trim=color&updated_at=1603481985&fm=webp&ixlib=react-9.0.3&w=1246',1,'2021-04-06 19:43:17','2021-04-08 09:37:24',7,8),(8,'Xiaomi Redmi 8 Dual SIM 64 GB preto-ônix','Xiaomi','6241','<p>Inteligente e preditivo<br />O Xiaomi 8 tem o sistema operacional avan&ccedil;ado Android9.0 Pie que aprende seus h&aacute;bitos para se adaptar &agrave; sua rotina e alcan&ccedil;ar a m&aacute;xima efici&ecirc;ncia de sua equipe. Essa tecnologia torna seu dispositivo t&atilde;o aut&ocirc;nomo que pode reduzir o consumo de energia, ajustar automaticamente o brilho e gerenciar a bateria de forma inteligente.<br /><br />C&acirc;mera dupla e mais detalhes<br />Suas 2 c&acirc;meras traseiras de 12 Mpx/2 Mpx permitir&atilde;o que voc&ecirc; tire fotos mais detalhadas e obtenha efeitos &uacute;nicos, como a famosa profundidade rasa do modo retrato de campo.<br /><br />Al&eacute;m disso, o dispositivo possui uma c&acirc;mera frontal de 8 Mpx para que voc&ecirc; possa tirar selfies divertidas ou fazer videochamadas.<br /><br />Mais para ver<br />Com sua tela IPS de 6.22 \", desfrute de cores intensas e maior clareza em todo o seu conte&uacute;do.<br /><br />Desbloqueio facial e de impress&atilde;o digital<br />M&aacute;xima seguran&ccedil;a para que apenas voc&ecirc; possa acessar o sua equipe. Voc&ecirc; pode escolher entre o sensor de impress&atilde;o digital para ativar seu telefone com um toque, ou o reconhecimento facial que permite desbloquear at&eacute; 30% mais r&aacute;pido.<br /><br />Vida &uacute;til da bateria mais longa<br />Desconecte-se! Com a super bateria de 5000 mAh voc&ecirc; ter&aacute; energia por muito mais tempo para jogar, assistir s&eacute;ries ou trabalhar sem recarregar.<br /><br />Grande capacidade de armazenamento<br />Com sua mem&oacute;ria interna de 64 GB voc&ecirc; sempre ter&aacute; espa&ccedil;o para armazenar arquivos e documentos importantes. Al&eacute;m disso, voc&ecirc; poder&aacute; salvar filmes, s&eacute;ries e v&iacute;deos para reproduzi-los sempre que quiser offline.</p>',980.00,1200.00,9,'https://http2.mlstatic.com/D_NQ_NP_930119-MLA40518962208_012020-O.webp',1,'2021-04-06 19:49:23','2021-04-06 19:49:23',2,2),(9,'INTEL XEON E5 2695 V4','Intel','475','<div align=\"start\">Especifica&ccedil;&otilde;es:</div>\r\n<div align=\"start\">\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>S&eacute;rie do processador: intel xeon</div>\r\n<div>N&uacute;mero modelo: E5 2695 V4</div>\r\n<div>Velocidade do processador: 2.1ghz</div>\r\n<div>Soquete do processador: 2011-3</div>\r\n<div>Passo a passo: SR2J1</div>\r\n<div data-spm-anchor-id=\"a2g0o.detail.1000023.i1.f14d7d43U2zBkQ\">O n&uacute;mero de n&uacute;cleos de cpu: 18</div>\r\n<div>O n&uacute;mero de t&oacute;picos: 36</div>\r\n<div>Tamanho do cache l3 (mb): 45mb</div>\r\n<div>Pot&ecirc;ncia: 120Watt</div>\r\n<div>Estado: Novo</div>\r\n<div>&nbsp;</div>\r\n<div>\r\n<div align=\"start\"><span data-spm-anchor-id=\"a2g0o.detail.1000023.i4.f14d7d43U2zBkQ\">Dicas:</span></div>\r\n<div align=\"start\">Por favor, verifique antes de comprar se o seu computador e as pe&ccedil;as s&atilde;o compat&iacute;veis com este processador para evitar custos extras de envio e atrasos.</div>\r\n<div align=\"start\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>',1000.00,1250.00,19,'https://ae01.alicdn.com/kf/H26eccfa153f449b990f372aa40b984e0h/INTEL-XEON-E5-2695-V4-18-PROCESSADOR-CPU-CORE-2-1GHz-45MB-LGA-2011-3-L3.jpg_Q90.jpg_.webp',1,'2021-04-06 19:53:55','2021-04-08 07:48:25',5,1),(10,'Fogão cooktop a gás Itatiaia NG 5 Bocas','Itatiaia','9375','<p>Que seus preparativos sejam um sucesso! Com este produto, voc&ecirc; poder&aacute; brilhar com seus talentos gastron&ocirc;micos. Delicie-se com sua fam&iacute;lia e amigos pelas comidas mais saborosas.<br /><br />Uma cozinha que se adapta &agrave; sua vida<br />Com sua igni&ccedil;&atilde;o autom&aacute;tico, voc&ecirc; poder&aacute; ativ&aacute;-lo de maneira r&aacute;pida e f&aacute;cil. Sendo de embutir, voc&ecirc; poder&aacute; coloc&aacute;-lo em qualquer lugar, tendo em considera&ccedil;&atilde;o as dimens&otilde;es do soquete.</p>',298.56,389.00,10,'https://http2.mlstatic.com/D_NQ_NP_617715-MLA32149276292_092019-O.webp',1,'2021-04-07 08:50:04','2021-04-07 08:50:04',2,3),(11,'Ferro De Soldar Hikari Prof. Sc-60','Hikari','7735','<p>Produto certificado pelo INMETRO<br />Menor consumo de energia<br />Aquecimento r&aacute;pido<br />Pot&ecirc;ncia de consumo: 50W<br />Temperatura m&aacute;xima: 510&deg;C<br />Acompanha suporte para ferro<br />Conjunto de resist&ecirc;ncia e tubo met&aacute;lico substitu&iacute;vel<br />Resist&ecirc;ncia de mica<br />Ponta de longa durabilidade tratada com ferro e alum&iacute;nio<br />Comprimento: 210mm<br />Peso: 155g</p>',20.98,40.98,19,'https://http2.mlstatic.com/D_NQ_NP_891824-MLB31150576088_062019-O.webp',1,'2021-04-07 08:53:24','2021-04-08 07:44:01',6,5),(12,'Mouse para jogo Redragon Cobra','Redragon','7355','<p>Com mais de 20 anos de experi&ecirc;ncia na fabrica&ccedil;&atilde;o de produtos, a Redragon inova dia a dia no design e na qualidade. Seu objetivo &eacute; produzir equipamento de alta qualidade para os jogadores, com excelente desempenho e a um pre&ccedil;o acess&iacute;vel. Os mouses da Redragon s&atilde;o adequados para todas as ocasi&otilde;es, seja para se entreter em casa ou us&aacute;-lo no trabalho. Experimente o design confort&aacute;vel e elegante deste dispositivo.<br /><br />Adaptado aos seus movimentos<br />O mouse de jogo vai oferecer a voc&ecirc; a possibilidade de fazer a diferen&ccedil;a e tirar proveito dos seus jogos. Sua conectividade e sensor suave ajudar&atilde;o a voc&ecirc; se mover rapidamente pela tela.<br /><br />A funcionalidade ao alcance da sua m&atilde;o<br />O sistema de detec&ccedil;&atilde;o de movimento &oacute;ptico lhe permitir&aacute; mover o cursor de uma forma mais precisa e sens&iacute;vel do que os sistemas tradicionais.<br /><br />Velocidade e confiabilidade dos bot&otilde;es<br />Com os seus 8 bot&otilde;es voc&ecirc; poder&aacute; ter maior controle e independ&ecirc;ncia para executar.<br /><br />Adequado para f&aacute;cil transporte<br />Navegue rapidamente pelos documentos e sites da web gra&ccedil;as ao seu design ultra-fino, ergon&ocirc;mico, leve e conveniente para transportar onde voc&ecirc; quiser ou viajar.</p>',109.90,129.99,18,'https://http2.mlstatic.com/D_NQ_NP_617158-MLA44050684005_112020-O.webp',1,'2021-04-07 09:18:13','2021-04-08 07:44:51',5,1),(13,'Placa De Video Galax Rtx 3060 12gb','Galax','54','<p>PLACA DE V&Iacute;DEO GALAX RTX 3060 1-CLICK OC 12GB GDDR6<br />Equipado com fans g&ecirc;meos de 90 mm e design pr&aacute;tico especial para dissipa&ccedil;&atilde;o de calor, a textura e apar&ecirc;ncia de carbono exclusivas trazem o m&aacute;ximo de frescor da placa.<br /><br />TECNOLOGIA SILENT EXTREME<br />Novo mecanismo de parada de ventoinha que monitora a temperatura da GPU e da mem&oacute;ria, liga / desliga os fans de maneira inteligente para um equil&iacute;brio perfeito entre ru&iacute;do e desempenho.<br /><br />Marca:<br />Galax<br /><br />Modelo:<br />RTX 3060 (1-Click OC)<br />36NOL7MD1VOC<br /><br />Especifica&ccedil;&otilde;es do mecanismo de GPU:<br />- CUDA Cores 3584<br />- Boost Clock (MHz) 1777<br />- 1-Click OC Clock (MHz) 1792 (instalando o software Xtreme Tuner Plus e usando 1-Click OC)<br /><br />Especifica&ccedil;&otilde;es de mem&oacute;ria:<br />- Velocidade de mem&oacute;ria 15 Gbps<br />- Mem&oacute;ria padr&atilde;o Config 12GB<br />- Largura da interface de mem&oacute;ria 192 bits GDDR6<br />- Largura de banda da mem&oacute;ria (GB / seg) 360<br /><br />Suporte de recurso:<br />- PCI-E 4.0<br />- Windows 10 64-bit, Linux 64-bit<br /><br />Fan Feature:<br />- 2 90mm<br />- Fan stop Idle (Todos os ventiladores)<br /><br />Suporte de exibi&ccedil;&atilde;o:<br />- DisplayPort 1.4ax 3,<br /><br />requisito HDMI 2.1<br />- Placa-m&atilde;e compat&iacute;vel com PCI Express com um slot gr&aacute;fico de largura dupla x 16<br />- Espa&ccedil;o de sistema para placa de 2 slots necess&aacute;rio<br />- 1 x conectores de alimenta&ccedil;&atilde;o suplementares PCIe de 8 pinos<br />- Fonte de alimenta&ccedil;&atilde;o do sistema m&iacute;nimo de 550 W ou mais<br />- mem&oacute;ria do sistema de 32 GB recomendada)<br />- Microsoft Windows 10 de 64 bits (Build 2004 ou posterior recomendado) ou Linux de 64 bits</p>\r\n<p>&nbsp;</p>',4000.00,6899.00,5,'https://http2.mlstatic.com/D_NQ_NP_716263-MLB45224915289_032021-O.webp',1,'2021-04-07 10:26:03','2021-04-08 07:48:25',5,1),(14,'POWERCOLOR RADEON RX 6800 16GB','Powercolor','241','<table class=\"table table-specification\" style=\"width: 73.4053%; height: 447px; float: left;\" cellspacing=\"0\">\r\n<tbody>\r\n<tr style=\"height: 21px;\">\r\n<th class=\"name-field Marca\" style=\"width: 40.9384%; height: 21px; text-align: left;\" scope=\"row\">Marca:</th>\r\n<td class=\"value-field Marca\" style=\"width: 55.2432%; height: 21px;\">PowerColor</td>\r\n</tr>\r\n<tr style=\"height: 21px;\">\r\n<th class=\"name-field Modelo\" style=\"width: 40.9384%; height: 21px; text-align: left;\" scope=\"row\">Modelo:</th>\r\n<td class=\"value-field Modelo\" style=\"width: 55.2432%; height: 21px;\">AXRX 6800XT 16GBD6-3DHE/OC</td>\r\n</tr>\r\n<tr style=\"height: 21px;\">\r\n<th class=\"name-field Memoria\" style=\"width: 40.9384%; height: 21px; text-align: left;\" scope=\"row\">Mem&oacute;ria de V&iacute;deo:</th>\r\n<td class=\"value-field Memoria\" style=\"width: 55.2432%; height: 21px;\">16GB GDDR6</td>\r\n</tr>\r\n<tr style=\"height: 21px;\">\r\n<th class=\"name-field Processador\" style=\"width: 40.9384%; height: 21px; text-align: left;\" scope=\"row\">Processador de Fluxo:</th>\r\n<td class=\"value-field Processador\" style=\"width: 55.2432%; height: 21px;\">4608 unidades</td>\r\n</tr>\r\n<tr style=\"height: 43px;\">\r\n<th class=\"name-field Clock\" style=\"width: 40.9384%; height: 43px; text-align: left;\" scope=\"row\">Clock:</th>\r\n<td class=\"value-field Clock\" style=\"width: 55.2432%; height: 43px;\">OC: 2090 MHz (game) / at&eacute; 2340 MHz (boost)<br />STD / silencioso: 2015 MHz (game) / at&eacute; 2250 MHz (boost)</td>\r\n</tr>\r\n<tr style=\"height: 21px;\">\r\n<th class=\"name-field Clock-mem\" style=\"width: 40.9384%; height: 21px; text-align: left;\" scope=\"row\">Clock de mem&oacute;ria:</th>\r\n<td class=\"value-field Clock-mem\" style=\"width: 55.2432%; height: 21px;\">16,0 Gbps</td>\r\n</tr>\r\n<tr style=\"height: 21px;\">\r\n<th class=\"name-field Interface\" style=\"width: 40.9384%; height: 21px; text-align: left;\" scope=\"row\">Interface de Mem&oacute;ria:</th>\r\n<td class=\"value-field Interface\" style=\"width: 55.2432%; height: 21px;\">256 bits</td>\r\n</tr>\r\n<tr style=\"height: 21px;\">\r\n<th class=\"name-field Suporte\" style=\"width: 40.9384%; height: 21px; text-align: left;\" scope=\"row\">Suporte DirectX&reg;:</th>\r\n<td class=\"value-field Suporte\" style=\"width: 55.2432%; height: 21px;\">12</td>\r\n</tr>\r\n<tr style=\"height: 21px;\">\r\n<th class=\"name-field Padrao\" style=\"width: 40.9384%; height: 21px; text-align: left;\" scope=\"row\">Padr&atilde;o de &ocirc;nibus:</th>\r\n<td class=\"value-field Padrao\" style=\"width: 55.2432%; height: 21px;\">PCIE 4.0</td>\r\n</tr>\r\n<tr style=\"height: 43px;\">\r\n<th class=\"name-field Entradas\" style=\"width: 40.9384%; height: 43px; text-align: left;\" scope=\"row\">Entradas:</th>\r\n<td class=\"value-field Entradas\" style=\"width: 55.2432%; height: 43px;\">1 x HDMI 2.1<br />3 x DisplayPort 1.4</td>\r\n</tr>\r\n<tr style=\"height: 65px;\">\r\n<th class=\"name-field Tecnologias\" style=\"width: 40.9384%; height: 65px; text-align: left;\" scope=\"row\">Tecnologias:</th>\r\n<td class=\"value-field Tecnologias\" style=\"width: 55.2432%; height: 65px;\">CrossFireX &trade;: suporte (DirectX&reg; 12 / Vulkan &trade;)<br />AMD Stream<br />AMD Eyefinity</td>\r\n</tr>\r\n<tr style=\"height: 43px;\">\r\n<th class=\"name-field Resolucao\" style=\"width: 40.9384%; height: 43px; text-align: left;\" scope=\"row\">Resolu&ccedil;&atilde;o M&aacute;xima:</th>\r\n<td class=\"value-field Resolucao\" style=\"width: 55.2432%; height: 43px;\">DisplayPort: 7680 x 4320<br />HDMI: 7680 x 4320</td>\r\n</tr>\r\n<tr style=\"height: 43px;\">\r\n<th class=\"name-field Requisito\" style=\"width: 40.9384%; height: 43px; text-align: left;\" scope=\"row\">Requisito m&iacute;nimo de energia do sistema:</th>\r\n<td class=\"value-field Requisito\" style=\"width: 55.2432%; height: 43px;\">850 W</td>\r\n</tr>\r\n<tr style=\"height: 21px;\">\r\n<th class=\"name-field Conector\" style=\"width: 40.9384%; height: 21px; text-align: left;\" scope=\"row\">Conector:</th>\r\n<td class=\"value-field Conector\" style=\"width: 55.2432%; height: 21px;\">2 x 8 pinos</td>\r\n</tr>\r\n<tr style=\"height: 21px;\">\r\n<th class=\"name-field Dimensoes\" style=\"width: 40.9384%; height: 21px; text-align: left;\" scope=\"row\">Dimens&otilde;es da placa:</th>\r\n<td class=\"value-field Dimensoes\" style=\"width: 55.2432%; height: 21px;\">320 x 135 x 62 mm</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>',5000.00,8999.88,7,'https://media.pichau.com.br/media/catalog/product/cache/6ee86225acc73f593166d49264424d36/a/x/axrx-6800xt-16gbd6-3dheoc3.jpg',1,'2021-04-07 10:41:06','2021-04-08 07:48:25',5,1),(15,'Smart TV Philips 6600 Series 4K 50','Philips','145','<div class=\"ui-vpp-highlighted-specs__attribute-columns__column\">\r\n<div class=\"ui-pdp-container__row ui-vpp-highlighted-specs__attribute-columns__row\">\r\n<div class=\"ui-vpp-highlighted-specs__key-value\">\r\n<div class=\"ui-pdp-background-color--GRAY_40 ui-vpp-highlighted-specs__filled-icon ui-vpp-highlighted-specs__filled-icon--ROUNDED\"><img class=\"ui-pdp-image ui-vpp-image-component\" src=\"https://http2.mlstatic.com/resources/frontend/ft-extended-v00/assets/vectorial/resolution_type.svg\" /><span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\">Resolu&ccedil;&atilde;o:</span>&nbsp;<span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--SEMIBOLD\">4K</span></div>\r\n</div>\r\n</div>\r\n<div class=\"ui-pdp-container__row ui-vpp-highlighted-specs__attribute-columns__row\">\r\n<div class=\"ui-vpp-highlighted-specs__key-value\">\r\n<div class=\"ui-pdp-background-color--GRAY_40 ui-vpp-highlighted-specs__filled-icon ui-vpp-highlighted-specs__filled-icon--ROUNDED\"><img class=\"ui-pdp-image ui-vpp-image-component\" src=\"https://http2.mlstatic.com/resources/frontend/ft-extended-v00/assets/vectorial/smart.svg\" /><span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\">&Eacute; smart:</span>&nbsp;<span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--SEMIBOLD\">Sim</span></div>\r\n</div>\r\n</div>\r\n<div class=\"ui-pdp-container__row ui-vpp-highlighted-specs__attribute-columns__row\">\r\n<div class=\"ui-vpp-highlighted-specs__key-value\">\r\n<div class=\"ui-pdp-background-color--GRAY_40 ui-vpp-highlighted-specs__filled-icon ui-vpp-highlighted-specs__filled-icon--ROUNDED\"><img class=\"ui-pdp-image ui-vpp-image-component\" src=\"https://http2.mlstatic.com/resources/frontend/ft-extended-v00/assets/vectorial/hdmi.svg\" /><span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\">Quantidade de portas HDMI:</span>&nbsp;<span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--SEMIBOLD\">3</span></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ui-vpp-highlighted-specs__attribute-columns__column\">\r\n<div class=\"ui-pdp-container__row ui-vpp-highlighted-specs__attribute-columns__row\">\r\n<div class=\"ui-vpp-highlighted-specs__key-value\">\r\n<div class=\"ui-pdp-background-color--GRAY_40 ui-vpp-highlighted-specs__filled-icon ui-vpp-highlighted-specs__filled-icon--ROUNDED\"><img class=\"ui-pdp-image ui-vpp-image-component\" src=\"https://http2.mlstatic.com/resources/frontend/ft-extended-v00/assets/vectorial/screen_type.svg\" /><span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\">Tipo de tela:</span>&nbsp;<span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--SEMIBOLD\">LED</span></div>\r\n</div>\r\n</div>\r\n<div class=\"ui-pdp-container__row ui-vpp-highlighted-specs__attribute-columns__row\">\r\n<div class=\"ui-vpp-highlighted-specs__key-value\">\r\n<div class=\"ui-pdp-background-color--GRAY_40 ui-vpp-highlighted-specs__filled-icon ui-vpp-highlighted-specs__filled-icon--ROUNDED\"><img class=\"ui-pdp-image ui-vpp-image-component\" src=\"https://http2.mlstatic.com/resources/frontend/ft-extended-v00/assets/vectorial/integrated_apps.svg\" /><span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\">Aplicativos incorporados:</span>&nbsp;<span class=\"ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--SEMIBOLD\">Youtube, Netflix, Web browser</span></div>\r\n</div>\r\n</div>\r\n</div>\r\n<p>A Philips est&aacute; comprometida em trazer tecnologias novas e inovadoras para seus usu&aacute;rios. &Eacute; por isso que aposta nos detalhes para oferecer produtos que fa&ccedil;am a diferen&ccedil;a e criem uma experi&ecirc;ncia visual mais incr&iacute;vel e aut&ecirc;ntica.<br />Com Smart TV 50PUG6654 voc&ecirc; poder&aacute; acessar os aplicativos onde seu conte&uacute;do favorito est&aacute; localizado. Al&eacute;m disso, voc&ecirc; pode navegar na web, interagir em redes sociais e se divertir com jogos de v&iacute;deo.<br /><br />Eu vivi em 4K<br />O n&uacute;mero de pixels que oferece &eacute; 4 vezes maior do que Full HD, o resultado? Cenas muito mais realistas com um n&iacute;vel incr&iacute;vel de detalhes. Agora voc&ecirc; vai conhecer uma aventura imersiva que n&atilde;o deixar&aacute; de surpreend&ecirc;-lo.<br /><br />Um som que o rodeia<br />Voc&ecirc; sentir&aacute; que vem de todas as dire&ccedil;&otilde;es poss&iacute;veis, o que enriquece a percep&ccedil;&atilde;o disso. O di&aacute;logo de sua s&eacute;rie de fim de semana ou a m&uacute;sica de seus cantores favoritos assumir&aacute; um significado diferente.<br /><br />Al&eacute;m de assistir TV<br />Sua fun&ccedil;&atilde;o Screen Share permite duplicar a tela do seu smartphone, tablet ou PC para aparecer na sua TV. Desta forma, voc&ecirc; poder&aacute; visualizar todo tipo de conte&uacute;do: material audiovisual, documentos de trabalho, e-mails e muito mais.</p>\r\n<p>&nbsp;</p>',1599.00,2199.00,5,'https://http2.mlstatic.com/D_NQ_NP_968489-MLA43554077672_092020-O.web',1,'2021-04-07 10:54:55','2021-04-07 11:01:01',2,3),(16,'Teclado Musical Para Iniciantes Queens','Queens','3545','<p>O Teclado Queen s &eacute; ideal para usu&aacute;rios que est&atilde;o iniciando. Possui 61 teclas e controle de velocidade, al&eacute;m de 10 m&uacute;sicas demonstrativas e 100 tons<br /><br />Especifica&ccedil;&otilde;es:<br />- 61 Teclas<br />- Possui controle de velocidade<br />- 10 Musicas demonstrativas<br />- 100 Tons digital<br />- Funcionamento: Pilhas ou Fonte de energia (2x1,5W)<br /><br />Dimens&otilde;es:<br />- Altura: 13 cm<br />- Largura: 30 cm<br />- Comprimento: 86 cm<br /><br />Conte&uacute;do da embalagem:<br />- 1 x Teclado Musical Iniciante Queens 61 Teclas Preto<br />- 1 x Microfone<br />- 1 x Fonte de Energia</p>',498.45,610.99,13,'https://http2.mlstatic.com/D_NQ_NP_743878-MLB44114014415_112020-O.webp',1,'2021-04-07 19:29:28','2021-04-07 19:29:28',4,2),(17,'Gabinete Gamer Eternity Rgb Mymax','Mymax','3635','<p>O Gabinete Gamer Eternity faz parte da fam&iacute;lia de gabinetes Mymax. Projetado para quem busca um gabinete diferenciado e com design exclusivo. Conta com painel frontal com ilumina&ccedil;&atilde;o LED RGB e um cooler RGB na traseira. Compat&iacute;vel com placa m&atilde;e Full ATX, Micro-ATX e ITX, al&eacute;m de suportar watercooler e contar com portas USB 3.0, 2.0 e &aacute;udio digital.</p>\r\n<p>Caracter&iacute;sticas</p>\r\n<p>Modelo: Eternity<br />Tipo: Mid Tower<br />Cor: Preto Fosco<br />Cor Led: RGB 256C<br />Espessura: 0.60mm<br />Drive 5.25: Incompat&iacute;vel<br />Drive 3.5: 2<br />Drive 2.5: 2<br />Tipo Placa M&atilde;e: Full ATX, Micro-ATX e ITX<br />Conex&atilde;o: 1x Audio in/out High, 1x USB 3.0 e 2x USB 2.0<br />Fonte de Alimenta&ccedil;&atilde;o: N&atilde;o Acompanha Produto - vendido separadamente<br />Tampa Lateral: Esquerda Vidro Temperado/Direita metal<br />Fan Frontal: Opcional - Compat&iacute;vel com at&eacute; 3x fan 120 mm<br />Fan Lateral: Incompat&iacute;vel<br />Fan Topo: Opcional - Compat&iacute;vel com 2x Fan 120mm<br />Fan Traseira: Incluso - 1x Fan 120mm RGB 256 cores<br />Tampa anti-poeira: N&atilde;o possu&iacute;<br />Suporte Placa M&atilde;e: Informa&ccedil;&atilde;o indispon&iacute;vel<br />Suporte Placa de V&iacute;deo: At&eacute; 300mm<br />Suporte CPU Cooler: At&eacute; 160mm<br />Suporte Water Cooler: Frontal 120/240mm<br />Topo 120/240mm<br />Controladora LED: N&atilde;o possu&iacute;<br />Slots expans&atilde;o: N&atilde;o possu&iacute;<br />Dimens&atilde;o da estrutura (LxAxP): Informa&ccedil;&atilde;o indispon&iacute;vel<br />EAN: 7898554980106<br />Informativo de Garantia: 12 meses de garantia (9 meses de garantia contratual junto ao fabricante + 3 meses referentes &agrave; garantia legal, nos termos do artigo 26, II, do C&oacute;digo de Defesa do Consumidor)</p>\r\n<p><br />Peso: 5,600Kg<br />Medidas do produto: Largura: 220,00mm / Altura: 452,00mm / Profundidade: 395,00mm<br />Medidas da embalagem: Largura: 508,00mm / Altura: 278,00mm / Profundidade: 458,00mm</p>',199.87,298.99,12,'https://http2.mlstatic.com/D_NQ_NP_879051-MLB44172480401_112020-O.webp',1,'2021-04-07 19:34:09','2021-04-07 19:34:09',5,1),(18,'Livro Os Elementos De Euclides','Zahar','173','<p>DESCRI&Ccedil;&Atilde;O DO PRODUTO<br /><br />Por mais de 2 mil anos, toda a geometria esteve diretamente associada ao mais antigo e completo tratado matem&aacute;tico: Elementos, obra m&aacute;xima de Euclides de Alexandria que descreve um sistema axiom&aacute;tico l&oacute;gico de proposi&ccedil;&otilde;es sobre linhas, c&iacute;rculos, pol&iacute;gonos e at&eacute; mesmo n&uacute;meros propor&ccedil;&otilde;es e magnitudes. O trabalho intrigou homens e mulheres<br />por s&eacute;culos, e &eacute; at&eacute; hoje ensinado em salas de aula no mundo todo.<br /><br />Nesse livro o professor e escritor internacionalmente respeitado David Berlinski lan&ccedil;a luz sobre v&aacute;rios aspectos da geometria euclidiana, explorando o universo de axiomas, teoremas e demonstra&ccedil;&otilde;es sistematizado pelo ge&ocirc;metra grego.<br /><br />Com seu estilo acess&iacute;vel e vibrante, Berlinski destaca como Euclides e sua obra se tornaram a base de grande parte da matem&aacute;tica moderna e da forma como entendemos o mundo. E apresenta ainda as mais diversas leituras e cr&iacute;ticas &agrave; geometria euclidiana surgidas ao longo dos s&eacute;culos.<br /><br />Muito al&eacute;m de uma hist&oacute;ria de Euclides e de sua geometria, este breve e instigante livro &eacute; acima de tudo um rico relato sobre o poder das ideias, capaz de arrebatar desde professores, alunos e interessados em matem&aacute;tica quanto aqueles mais avessos &agrave; disciplina.<br /><br />FICHA T&Eacute;CNICA<br /><br />Autor: David Berlinski<br />P&aacute;ginas: 160<br />Editora: Zahar<br />Idioma: PORTUGUES<br />ISBN-13: 9788537817384<br /><br />ASSUNTO<br /><br />Matem&aacute;tica<br /><br />DIMENS&Otilde;ES<br /><br />Altura: 21,00cm<br />Largura: 14,00cm<br />Espessura: 0,90cm<br />Peso: 0,220kg</p>',20.88,41.00,12,'https://http2.mlstatic.com/D_NQ_NP_949821-MLB45017363224_022021-O.webp',1,'2021-04-07 20:13:52','2021-04-07 20:13:52',4,7),(19,'Boné Fitão Aba Curva ','Anth','222','<p><span style=\"font-weight: 400;\">Descri&ccedil;&atilde;o</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-weight: 400;\"> </span><span style=\"font-weight: 400;\">Produto enviado em caixa e embalado para conserva&ccedil;&atilde;o sem amassar, mantendo a forma de f&aacute;brica</span></p>\r\n<p><span style=\"font-weight: 400;\">Modelo Fit&atilde;o</span></p>\r\n<p><span style=\"font-weight: 400;\">- Aba Curva com Regulagem Ajust&aacute;vel Strapback</span></p>\r\n<p><span style=\"font-weight: 400;\">Medidas: 12 cm de altura; 18 cm de largura; 6,5 cm aba</span></p>\r\n<p><span style=\"font-weight: 400;\">- Bon&eacute; com excelente caimento e conforto</span></p>',59.99,79.99,20,'https://http2.mlstatic.com/D_NQ_NP_857412-MLB45455584326_042021-O.webp',1,'2021-04-08 09:36:06','2021-04-08 09:36:06',7,8);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Providers`
--

DROP TABLE IF EXISTS `Providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Providers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fantasyName` varchar(255) NOT NULL,
  `socialReason` varchar(255) NOT NULL,
  `cnpj_cpf` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `addressNumber` varchar(255) NOT NULL,
  `neighborhood` varchar(255) NOT NULL,
  `complement` text NOT NULL,
  `zipCode` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Providers`
--

LOCK TABLES `Providers` WRITE;
/*!40000 ALTER TABLE `Providers` DISABLE KEYS */;
INSERT INTO `Providers` VALUES (1,'Brinquedos e Cia Divet','Brinquedos & Cia LTDA.','41.229.850/0001-43','brinquedosecia@gmail.com','44999999999','Umuarama','PR','Rua das flores','2321','Jardim nova bangu','Galpão','87506170',1,'2021-04-06 18:57:30','2021-04-06 18:57:30'),(2,'Magalu','Magazine Luiza LTDA','29.593.863/0001-00','philco@gmail.com','44999999999','Umuarama','MT','Av. Tiradentes','8690','Zona 1','Loja','87506170',1,'2021-04-06 18:59:40','2021-04-06 19:19:13'),(3,'Sony','Sony LTDA.','15.027.214/0001-29','sony@gmail.com','44999999999','São Paulo','SP','Av. Tiradentes','1122','Santa Efigênia','Loja','87506160',1,'2021-04-06 19:02:08','2021-04-06 19:02:08'),(4,'Amazon','Amazon LTDA.','60.672.622/0001-98','amazon@amazon.com','44999999999','Brasília','GO','Av. Copacabana','7458','Jardim Senna','Galpão','87512331',1,'2021-04-06 19:04:12','2021-04-06 19:04:12'),(5,'Terabyte Shop','Terabyte LTDA.','04.021.827/0001-32','nvidia@gmail.com','44999999999','São Paulo','SP','Rua dos bobos','1234','Jardim Nova Java','Casa','87506123',1,'2021-04-06 19:16:40','2021-04-06 19:17:54'),(6,'Bati Forti Ferramentas','Bati Forti Ferramentas LTDA.','10.248.928/0001-43','ferramentas@gmail.com','44999999999','São Paulo','RR','Av. Tiradentes','1266','Jardim Novo Bangu','Casa','87506199',1,'2021-04-06 19:21:51','2021-04-06 19:21:51'),(7,'Boné SHOP ','Boné SHOP LTDA','59.804.028/0001-24','boneshop@gmail.com','44999999999','Umuarama','PR','Rua das Flores','9999','Jardim nova america','Galpão','87506190',1,'2021-04-08 09:33:32','2021-04-08 09:33:32');
/*!40000 ALTER TABLE `Providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `completeName` varchar(255) NOT NULL,
  `birth` datetime NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `addressNumber` varchar(255) NOT NULL,
  `neighborhood` varchar(255) NOT NULL,
  `complement` text NOT NULL,
  `zipCode` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Jose Santos Silva','2002-05-02 01:00:00','034.543.883-33','jose@jose.com','$2b$10$36o90T1NkFghXvrHeb3xb.A0mOkyNsXp9Zl2ERG1VG1nIJycYIDZu','44985621278','Umuarama','PR','Rua dos Comerciantes','2245','Jd. Primeiro de Maio','Casa','87504387',1,'2021-04-08 07:41:53','2021-04-08 07:41:53'),(2,'flavio fedechen aguiar','2000-10-30 00:00:00','730.827.463-22','flavio@flavio.com','$2b$10$X1jtJVkN51v4IpYO35ZDwOiorWonRVNUDWJbEynyFGHTRsCKttdva','44984568502','Umuarama','PR','Rua das Flores','3256','Jd. Petropolis','Casa','87506190',1,'2021-04-08 09:24:48','2021-04-08 09:48:03');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-20 21:54:28
