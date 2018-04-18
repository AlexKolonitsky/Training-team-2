-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hr_application
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `salary` int(11) NOT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `job_title` varchar(100) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `date_publishing` date NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`status_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_candidate_status1_idx` (`status_id`),
  CONSTRAINT `fk_candidate_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` VALUES (1,'Ivan','Ivanov',1000,'http://via.placeholder.com/500x350/66bfff','Java Developer','+375(25)739-00-02','ivanov@gmail.com','27 Old Gloucester Street, London','2018-03-24',1),(2,'Ward','Jayme',500,'http://via.placeholder.com/500x350/66bfff','.Net Developer','+375(25)859-25-87','ward@gmail.com','123 6th St.Melbourne, FL 32904 ','2018-03-02',2),(3,'Augustine','Gaetana',450,'http://via.placeholder.com/500x350/66bfff','JavaScript Developer','+375(33)154-85-96','aug@gmail.com','71 Pilgrim Avenue, Chevy Chase, MD 20815','2018-03-03',3),(4,'Colombina','Marty',1000,'http://via.placeholder.com/500x350/66bfff','Java Developer','+375(29)200-85-96','gae@gmail.com','70 Bowman St. South Windsor, CT 06074','2018-03-03',4),(5,'Arseni','Balfour',400,'http://via.placeholder.com/500x350/66bfff','.Net Developer','+375(33)154-90-90','balf@gmail.com','4 Goldfield Rd. Honolulu, HI 96815','2018-03-01',1),(6,'Dove','Lexia',700,'http://via.placeholder.com/500x350/66bfff','Java Developer','+375(44)300-85-96','lex@gmail.com','44 Shirley Ave.,West Chicago, IL 60185','2018-03-03',2),(7,'Arianna','Venceslao',850,'http://via.placeholder.com/500x350/66bfff','JavaScript Developer','+375(33)154-85-96','vansen@gmail.com','514 S. Magnolia St., Orlando, FL 32806','2018-03-02',3),(8,'Star','Dorofey',2000,'http://via.placeholder.com/500x350/66bfff','.Net Developer','+375(29)200-85-96','dorof@gmail.com','71 Pilgrim Avenue, Chevy Chase, MD 20815','2018-03-01',4),(9,'Drina','Vladlen',300,'http://via.placeholder.com/500x350/66bfff','JavaScript Developer','+375(33)154-85-96','vladlen@gmail.com','123 6th St.Melbourne, FL 32904 ','2018-03-03',1),(10,'Dafne','Nellie',650,'http://via.placeholder.com/500x350/66bfff','Java Developer','+375(33)154-85-96','nellie@gmail.com','44 Shirley Ave.,West Chicago, IL 60185','2018-03-01',2),(11,'Meade','Corrine',1000,'http://via.placeholder.com/500x350/66bfff','JavaScript Developer','+375(29)200-85-96','corrine@gmail.com','71 Pilgrim Avenue, Chevy Chase, MD 20815','2018-03-01',3),(12,'Costanzo','Aydan',850,'http://via.placeholder.com/500x350/66bfff','Java Developer','+375(33)154-85-96','avdan@gmail.com','123 6th St.Melbourne, FL 32904 ','2018-03-03',4),(13,'Ustinya','Zinovi',900,'http://via.placeholder.com/500x350/66bfff','.Net Developer','+375(29)200-85-96','zinoviv@gmail.com','70 Bowman St. South Windsor, CT 06074','2018-03-01',4);
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `allDay` tinyint(4) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `description` text,
  `place` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'','2018-03-06 05:00:00','2018-03-06 05:00:00',0,NULL,NULL,NULL),(2,'','2018-03-06 05:00:00','2018-03-06 05:00:00',0,NULL,NULL,NULL),(3,'','2018-03-06 05:00:00','2018-03-06 07:00:00',0,NULL,NULL,NULL),(4,'','2018-03-07 05:00:00','2018-03-07 05:00:00',0,'D90429','test','test');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `period` varchar(100) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `company` varchar(100) NOT NULL,
  `description` varchar(700) DEFAULT NULL,
  `candidate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`candidate_id`),
  KEY `fk_experience_candidate1_idx` (`candidate_id`),
  CONSTRAINT `fk_experience_candidate1` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,'Apple Inc.','Mar 2012 - Mar 2013','Java Developer','Cupertino, CA, US','Apple Inc.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum',1),(2,'Samsung Electronics','Mar 2014 - Mar 2015','JavaScript Developer','Suwon, South Korea','Samsung Electronics','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum. Accusantium aliquid, aut autem consectetur eaque facilis illo labore modi obcaecati officia optio, provident, quas quod rem temporibus!',1),(3,'Amazon.com','Apr 2015 - Now','JavaScript Developer','Seattle, WA, US','Amazon.com','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum. Accusantium aliquid, aut autem consectetur eaque facilis illo labore modi obcaecati officia optio, provident, quas quod rem temporibus!',1),(4,'Foxconn','Mar 2014 - Mar 2015','Java Developer','New Taipei City, Taiwan','Foxconn','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum',2),(5,'Alphabet Inc.','Apr 2015 - Now','JavaScript Developer','Mountain View, CA, US','Alphabet Inc.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum. Accusantium aliquid, aut autem consectetur eaque facilis illo labore modi obcaecati officia optio, provident, quas quod rem temporibus!',2),(6,'Microsoft','Apr 2015 - Now','Java Developer','Redmond, WA, US','Microsoft','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum',3),(7,'Hitachi','Apr 2015 - Now','Java Developer','Tokyo, Japan','Hitachi','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum',4),(8,'IBM','Apr 2015 - Now','Java Developer','Armonk, NY, US','IBM','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum',5),(9,'Huawei','Apr 2015 - Now','Java Developer','Shenzhen, China','Huawei','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum',6),(10,'Dell Technologies','Apr 2015 - Now','Java Developer','Round Rock, TX, US','Dell Technologies','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum',7),(11,'Sony','Apr 2015 - Now','Java Developer','Tokyo, Japan','Sony','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum',8),(12,'Panasonic','Mar 2014 - Mar 2015','Java Developer','Osaka, Japan','Panasonic','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum',9),(13,'Intel','Apr 2015 - Now','JavaScript Developer','Santa Clara, CA, US','Intel','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum. Accusantium aliquid, aut autem consectetur eaque facilis illo labore modi obcaecati officia optio, provident, quas quod rem temporibus!',9),(14,'Hewlett Packard Enterprise','Mar 2012 - Mar 2013','Java Developer','Palo Alto, CA, US','Hewlett Packard Enterprise','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum',10),(15,'Cisco Systems','Mar 2014 - Mar 2015','JavaScript Developer','San Jose, CA, US','Cisco Systems','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum. Accusantium aliquid, aut autem consectetur eaque facilis illo labore modi obcaecati officia optio, provident, quas quod rem temporibus!',10),(16,'Apple Inc.','Apr 2015 - Now','JavaScript Developer','Cupertino, CA, US','Apple Inc.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum. Accusantium aliquid, aut autem consectetur eaque facilis illo labore modi obcaecati officia optio, provident, quas quod rem temporibus!',10),(17,'Samsung Electronics','Mar 2014 - Mar 2015','Java Developer','Suwon, South Korea','Samsung Electronics','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum',11),(18,'Amazon.com','Apr 2015 - Now','JavaScript Developer','Seattle, WA, US','Amazon.com','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum. Accusantium aliquid, aut autem consectetur eaque facilis illo labore modi obcaecati officia optio, provident, quas quod rem temporibus!',11),(19,'Foxconn','Mar 2014 - Mar 2015','Java Developer','	New Taipei City, Taiwan','Foxconn','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum',12),(20,'Alphabet Inc.','Apr 2015 - Now','JavaScript Developer','Mountain View, CA, US','Alphabet Inc.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum. Accusantium aliquid, aut autem consectetur eaque facilis illo labore modi obcaecati officia optio, provident, quas quod rem temporibus!',12),(21,'Microsoft','Mar 2012 - Mar 2013','Java Developer','Redmond, WA, US','Microsoft','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum',13),(22,'Hitachi','Mar 2014 - Mar 2015','JavaScript Developer','Tokyo, Japan','Hitachi','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum. Accusantium aliquid, aut autem consectetur eaque facilis illo labore modi obcaecati officia optio, provident, quas quod rem temporibus!',13),(23,'IBM','Apr 2015 - Now','JavaScript Developer','Armonk, NY, US','IBM','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quasi quos rerum. Accusantium aliquid, aut autem consectetur eaque facilis illo labore modi obcaecati officia optio, provident, quas quod rem temporibus!',13);
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text NOT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_id_idx` (`candidate_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (4,'2018-03-17 21:06:46','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`candidate_id`),
  KEY `fk_skill_candidate1_idx` (`candidate_id`),
  CONSTRAINT `fk_skill_candidate1` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'JavaScript',1),(2,'Node.js',1),(3,'Java',1),(4,'Maven',1),(5,'JSV',1),(6,'JPA',1),(7,'Design patterns',1),(8,'Hibernate',1),(9,'JavaScript',2),(10,'Node.js',2),(11,'Java',2),(12,'Maven',2),(13,'JSV',2),(14,'JavaScript',3),(15,'Node.js',3),(16,'Java',3),(17,'JavaScript',4),(18,'Node.js',4),(19,'Java',4),(20,'Maven',4),(21,'JSV',4),(22,'JavaScript',5),(23,'Node.js',5),(24,'Java',5),(25,'JavaScript',6),(26,'Node.js',6),(27,'Java',6),(28,'JavaScript',7),(29,'Node.js',7),(30,'Java',7),(31,'Maven',7),(32,'JavaScript',8),(33,'Node.js',8),(34,'Java',8),(35,'Maven',8),(36,'JSV',8),(37,'JPA',8),(38,'Design patterns',8),(39,'JavaScript',9),(40,'Node.js',9),(41,'JavaScript',10),(42,'Node.js',10),(43,'Java',10),(44,'Maven',10),(45,'JavaScript',11),(46,'Node.js',11),(47,'JavaScript',12),(48,'Node.js',12),(49,'Java',12),(50,'Maven',12),(51,'JSV',12),(52,'JPA',12),(53,'JavaScript',13),(54,'Node.js',13),(55,'Java',13),(56,'Maven',13),(57,'JSV',13),(58,'JPA',13),(59,'Design patterns',13),(60,'Hibernate',13);
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'New'),(2,'Accepted for Interview'),(3,'CV-Rejected'),(4,'CV-Accepted');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'testName','testSurname','testEmail@gmail.com','test','+375(33)457-89-63','http://via.placeholder.com/500x350/66bfff');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_event`
--

DROP TABLE IF EXISTS `user_has_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_event` (
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`user_id`,`candidate_id`),
  KEY `FK_user_has_event_event` (`event_id`),
  KEY `FK_user_has_event_candidate` (`candidate_id`),
  KEY `FK_user_has_event_user` (`user_id`),
  CONSTRAINT `FK_user_has_event_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_user_has_event_event` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_user_has_event_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_event`
--

LOCK TABLES `user_has_event` WRITE;
/*!40000 ALTER TABLE `user_has_event` DISABLE KEYS */;
INSERT INTO `user_has_event` VALUES (1,1,1),(1,1,2),(1,1,3);
/*!40000 ALTER TABLE `user_has_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacancy`
--

DROP TABLE IF EXISTS `vacancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacancy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(255) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  `description` varchar(700) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancy`
--

LOCK TABLES `vacancy` WRITE;
/*!40000 ALTER TABLE `vacancy` DISABLE KEYS */;
INSERT INTO `vacancy` VALUES (1,'Big Data Developer',1500,'Extensive experience with Hadoop v2, MapReduce, HDFS, Hive, Ambari'),(2,'Senior Java Developer',1000,'Significant Java, Javascript & AWS experience'),(3,'Full Stack Developer',2000,'Working knowledge of at least one JavaScript web application framework (E.g. Angular, React,'),(4,'React Native Developer',1000,'Extensive native mobile application development experience'),(5,'JavaScript Developer',1300,'Commercial Javascript development experience.'),(6,'Big Data Developer',1000,'Extensive experience with Hadoop v2, MapReduce, HDFS, Hive, Ambari'),(7,'Senior Java Developer',1500,'Significant Java, Javascript & AWS experience'),(8,'React Native Developer',800,'Experience with MySQL is preferable'),(9,'Big Data Developer',450,'Extensive experience with Hadoop v2, MapReduce, HDFS, Hive, Ambari'),(10,'Senior Java Developer',2000,'Experience with MySQL is preferable'),(11,'Full Stack Developer',850,'Experience with designing and maintaining web-enabled business reporting tools and portals.'),(12,'React Native Developer',900,'Experience with designing and maintaining web-enabled business reporting tools and portals.'),(13,'Senior Java Developer',1000,'Significant Java, Javascript & AWS experience'),(14,'Full Stack Developer',1000,'Experience with MySQL is preferable'),(15,'React Native Developer',950,'Experience with designing and maintaining web-enabled business reporting tools and portals.'),(16,'JavaScript Developer',1000,'Commercial Javascript development experience.'),(17,'Full Stack Developer',400,'Experience with designing and maintaining web-enabled business reporting tools and portals.'),(18,'JavaScript Developer',450,'Commercial Javascript development experience.'),(19,'Senior .NET Developer',1000,'10+ years experience  & a solid understanding of .NET (both Visual Basic and C#) ');
/*!40000 ALTER TABLE `vacancy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacancy_has_candidate`
--

DROP TABLE IF EXISTS `vacancy_has_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacancy_has_candidate` (
  `vacancy_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  PRIMARY KEY (`vacancy_id`,`candidate_id`),
  KEY `fk_vacancy_has_candidate_candidate1_idx` (`candidate_id`),
  KEY `fk_vacancy_has_candidate_vacancy_idx` (`vacancy_id`),
  CONSTRAINT `fk_vacancy_has_candidate_candidate1` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vacancy_has_candidate_vacancy` FOREIGN KEY (`vacancy_id`) REFERENCES `vacancy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancy_has_candidate`
--

LOCK TABLES `vacancy_has_candidate` WRITE;
/*!40000 ALTER TABLE `vacancy_has_candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacancy_has_candidate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-25  2:36:32
