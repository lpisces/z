-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: z_development
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentications`
--

DROP TABLE IF EXISTS `authentications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentications`
--

LOCK TABLES `authentications` WRITE;
/*!40000 ALTER TABLE `authentications` DISABLE KEYS */;
INSERT INTO `authentications` VALUES (1,1,'identity','1','2014-05-24 15:46:13','2014-05-24 15:46:13');
/*!40000 ALTER TABLE `authentications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `parent_id` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'图书音像',0,0,'2014-05-24 15:46:31','2014-05-24 17:06:12',1),(2,'手机数码',1,0,'2014-05-24 15:46:55','2014-05-24 17:06:20',1),(3,'电脑办公',2,0,'2014-05-24 15:52:08','2014-05-24 17:06:33',1),(4,'家用电器',3,0,'2014-05-24 15:52:43','2014-05-24 17:06:40',1),(5,'家居厨具',4,0,'2014-05-24 15:53:05','2014-05-24 17:08:58',1),(6,'宠物汽车',5,0,'2014-05-24 15:54:12','2014-05-24 17:08:58',1),(7,'运动户外',6,0,'2014-05-24 15:54:27','2014-05-24 17:06:47',1),(8,'钟表首饰',7,0,'2014-05-24 15:54:41','2014-05-24 17:08:58',1),(9,'玩具母婴',8,0,'2014-05-24 16:15:35','2014-05-24 17:08:58',1),(10,'食品酒水',9,0,'2014-05-24 16:15:48','2014-05-24 17:08:58',1),(11,'个护化妆',9,0,'2014-05-24 16:16:15','2014-05-24 17:05:46',1),(12,'服装鞋包',9,0,'2014-05-24 16:16:42','2014-05-24 17:08:58',1),(13,'纸质图书',0,1,'2014-05-24 16:21:10','2014-05-24 16:21:10',0),(14,'kindle电纸书',1,1,'2014-05-24 16:21:46','2014-05-24 16:21:56',0),(15,'游戏软件',2,1,'2014-05-24 16:22:16','2014-05-24 16:22:16',0),(16,'手机',0,2,'2014-05-24 16:23:46','2014-05-24 16:23:46',0),(17,'相机',1,2,'2014-05-24 16:24:08','2014-05-24 16:24:08',0),(19,' 数码配件',3,2,'2014-05-24 16:36:02','2014-05-24 16:36:02',0),(20,'电脑外设',0,3,'2014-05-24 16:37:21','2014-05-24 16:37:21',0),(21,'电脑配件',1,3,'2014-05-24 16:37:39','2014-05-24 16:37:39',0),(22,'网络设备',2,3,'2014-05-24 16:38:04','2014-05-24 16:38:04',0),(23,'办公文具',3,3,'2014-05-24 16:38:34','2014-05-24 16:38:34',0),(24,'电脑整机',4,3,'2014-05-24 16:39:39','2014-05-24 16:39:39',0),(25,'电视音响',0,4,'2014-05-24 16:42:05','2014-05-24 16:42:05',0),(26,'大家电',1,4,'2014-05-24 16:42:29','2014-05-24 16:42:29',0),(27,'厨房电器',2,4,'2014-05-24 16:42:54','2014-05-24 16:42:54',0),(28,'居家电器',4,4,'2014-05-24 16:44:21','2014-05-24 16:44:21',0),(29,'厨房家具',0,5,'2014-05-24 16:46:48','2014-05-24 16:46:48',0),(30,'床上用品',1,5,'2014-05-24 16:52:45','2014-05-24 16:52:45',0),(31,'家居装修',2,5,'2014-05-24 16:54:25','2014-05-24 16:54:25',0),(32,'宠物用品',0,6,'2014-05-24 16:59:32','2014-05-24 16:59:32',0),(33,'汽车保养',0,6,'2014-05-24 16:59:54','2014-05-24 16:59:54',0),(34,'车载电器',3,6,'2014-05-24 17:00:13','2014-05-24 17:00:13',0),(35,'户外服装',0,7,'2014-05-24 17:11:18','2014-05-24 17:11:18',0),(36,'户外工具',0,7,'2014-05-24 17:11:31','2014-05-24 17:11:31',0),(37,'户外鞋',0,7,'2014-05-24 17:12:45','2014-05-24 17:12:45',0),(38,'体育用品',0,7,'2014-05-24 17:12:58','2014-05-24 17:12:58',0),(39,'钟表',0,8,'2014-05-24 17:13:29','2014-05-24 17:13:29',0),(40,'首饰',0,8,'2014-05-24 17:13:38','2014-05-24 17:13:38',0),(41,'眼镜',0,8,'2014-05-24 17:13:50','2014-05-24 17:13:50',0),(42,'玩具',0,9,'2014-05-24 17:14:07','2014-05-24 17:14:07',0),(43,'母婴用品',0,9,'2014-05-24 17:14:19','2014-05-24 17:14:19',0),(44,'食品',0,10,'2014-05-24 17:14:40','2014-05-24 17:14:40',0),(45,'保健品',0,10,'2014-05-24 17:14:49','2014-05-24 17:14:49',0),(46,'酒水',0,0,'2014-05-24 17:15:01','2014-05-24 17:15:01',0),(47,'粮油',0,10,'2014-05-24 17:15:22','2014-05-24 17:15:22',0),(48,'美容化妆',0,11,'2014-05-24 17:15:40','2014-05-24 17:15:40',0),(49,'个护保健',0,11,'2014-05-24 17:15:52','2014-05-24 17:15:52',0),(50,'医疗器械',0,10,'2014-05-24 17:16:04','2014-05-24 17:16:04',0),(51,'服装',0,0,'2014-05-24 17:16:35','2014-05-24 17:16:35',0),(52,'鞋靴',0,12,'2014-05-24 17:16:44','2014-05-24 17:16:44',0),(53,'箱包',0,12,'2014-05-24 17:16:53','2014-05-24 17:16:53',0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `page` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identities`
--

DROP TABLE IF EXISTS `identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identities`
--

LOCK TABLES `identities` WRITE;
/*!40000 ALTER TABLE `identities` DISABLE KEYS */;
INSERT INTO `identities` VALUES (1,'iamalazyrat@gmail.com','$2a$10$goOEkk.a7ekiA63qFSVjsORNF2MTAUqk35/MH7jz1PEexqPn9cQTS','2014-05-24 15:46:13','2014-05-24 15:46:13');
/*!40000 ALTER TABLE `identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140511133824'),('20140511134658'),('20140511134941'),('20140512194038'),('20140514155755'),('20140521142140'),('20140521183854'),('20140521192747'),('20140522110501'),('20140522111416'),('20140524170129');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_reset_sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'lpisces',NULL,'iamalazyrat@gmail.com','2014-05-24 15:46:13','2014-05-24 16:44:54',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-25 17:17:46
