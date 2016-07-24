-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: portfolio
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `project_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `like_count` int(11) DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `view_count` int(11) DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `coverImage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `FK_60d0g900v88hwu1mfng1nbewq` (`user_id`),
  CONSTRAINT `FK_60d0g900v88hwu1mfng1nbewq` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'opis za prvi projekat',0,'projekat 1a',0,1,0,NULL),(3,'opis za novi projekat',0,'Novi projekat',0,1,1,NULL),(6,'wqwqw',0,'wweee',0,1,0,NULL),(7,'najbolje Lazino delo',0,'Lazart',0,4,1,NULL),(8,'Skulptura necega',0,'Lazino drugo delo',0,4,1,NULL),(9,'zikina ilustracija',0,'ILUSTRACIJA',0,5,1,NULL),(10,'Fotografije sa putovanja',0,'Fotografije zgrada i skulptura',0,6,1,NULL),(11,'Radovi nastali u tom i tom periodu tu i tu zato i zato',0,'Digitalne grafike #5',0,7,0,NULL),(12,'cudo ako radi',0,'SW',0,7,0,NULL),(13,'Ovo Ima Da Radi',0,'SW Logo',0,7,0,NULL),(14,'!!!!!!',0,'SW LOGO',0,7,0,NULL),(15,'asda',0,'asda',0,7,0,NULL),(16,'adad',0,'ad',0,7,0,NULL),(17,'sw',0,'SW XM',0,7,0,NULL),(18,'swswswswswsw',0,'swwwwwwwwwwwwww',0,7,0,NULL),(20,'haos',0,'HAOS',0,7,0,NULL),(21,'opis',0,'Ime Dela 1',0,5,0,NULL),(22,'tri slike',0,'Provera',0,7,1,NULL),(23,'aaaaaaa',0,'star wars cover',0,7,1,'AXwVRMlw1468159357006.jpg'),(24,'opis projekta ',0,'Lepe umetnosti',0,8,1,'uptSu6Gn1468177417689.jpg'),(25,'',0,'4 tipa licnosti',0,9,1,'U5VzwVIz1468177673990.jpg'),(26,'',0,'Jankov projekat #2',0,9,1,NULL),(27,'',0,'Rad',0,9,1,'KikYGVJk1468229953747.jpg'),(28,'',0,'Rad #3',0,9,1,NULL),(29,'Ristina skulptura',0,'Skulptura #1',0,10,1,'as7bo7oO1468307395796.jpg'),(30,'',0,'Zavrsna proba',0,10,1,'vr9Pawbt1468309100254.jpg'),(31,'Slike iz oblasti grafickog dizajna i ilustracije',0,'Proba #2',0,7,1,'HRtjBFzI1468316452928.jpg');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-12 15:03:02
