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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `about_me` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `web_site` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Prvi probni admin','XYZ','Venecuela','mile@mile.mil','Miroslav','Milic','123456',NULL,'Active','mile123',NULL),(3,'DBA','Stara Pazova',NULL,'pera@co.yu','Pera','Peric','asdasd',NULL,'Active','pera123',NULL),(4,'Prvi korisnik','Beograd','Srbija','laki@gmail.com','Laza','Lazić','qweqwe',NULL,'Active','laza123',NULL),(5,'Zika umetnik najbolji','Beograd','Srbija','zika123@gmail.com','Zika ','Zikic','asdasd',NULL,'Active','zika123',NULL),(6,'Da li ce dobiti profil','Petrovac','Crna Gora','peraperic@gmail.com','Petar','Petrovic','asdasd',NULL,'Active','petar',NULL),(7,'Bavi se raznim tipovima umetnosti, zavrsio skole 1 i 2 i zivi i radi tu i tu','Beograd','Srbija','marko@gmail.com','Marko','Markov','asdasd',NULL,'Active','marko123',NULL),(8,'o Ani Anic...','Sombor','Srbija','ana@anic.rs','Ana','Anic','asdasd',NULL,'Active','ana123',NULL),(9,'Ja sam Janko','Beograd','///','janko@gmail.com','Janko','Jankovic','asdasd',NULL,'Active','janko123',NULL),(10,'','','','rista@gmail.com','Rista','Ristic','asdasd',NULL,'Active','rista123',NULL),(11,'','','','aaaaa@aaa.aa','aaaa','aaa','aaaaaa',NULL,'Inactive','aaaaaaaaa',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
