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
-- Table structure for table `field_project`
--

DROP TABLE IF EXISTS `field_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_project` (
  `field_id` int(11) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  KEY `FK_1brbj5l3u19rc8dylrghqislu` (`project_id`),
  KEY `FK_ayw1k43iwbt4scgvmg2bapdy7` (`field_id`),
  CONSTRAINT `FK_1brbj5l3u19rc8dylrghqislu` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `FK_ayw1k43iwbt4scgvmg2bapdy7` FOREIGN KEY (`field_id`) REFERENCES `field` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_project`
--

LOCK TABLES `field_project` WRITE;
/*!40000 ALTER TABLE `field_project` DISABLE KEYS */;
INSERT INTO `field_project` VALUES (2,1),(7,1),(5,1),(2,3),(3,3),(4,6),(5,6),(6,6),(7,6),(5,7),(6,8),(1,9),(2,10),(3,10),(6,10),(7,10),(1,11),(5,11),(1,12),(1,13),(1,14),(5,14),(2,15),(3,15),(5,16),(1,17),(5,18),(1,20),(2,21),(4,22),(5,22),(1,23),(3,24),(5,24),(1,25),(5,25),(5,26),(3,27),(2,28),(3,28),(6,29),(7,29),(2,30),(4,30),(5,30),(6,30),(7,30),(1,31),(4,31),(7,31);
/*!40000 ALTER TABLE `field_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-12 15:03:03
