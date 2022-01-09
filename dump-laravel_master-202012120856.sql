-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: laravel_master
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) DEFAULT NULL,
  `image_id` int(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_users` (`user_id`),
  KEY `fk_comments_images` (`image_id`),
  CONSTRAINT `fk_comments_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  CONSTRAINT `fk_comments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,4,'Buena foto de familia!!','2020-12-05 21:47:04','2020-12-05 21:47:04'),(2,2,1,'Buena foto de PLAYA!!','2020-12-05 21:47:04','2020-12-05 21:47:04'),(3,2,4,'que bueno!!','2020-12-05 21:47:04','2020-12-05 21:47:04'),(4,1,4,'Buena foto de familia!!','2020-12-05 21:47:16','2020-12-05 21:47:16'),(5,2,1,'Buena foto de PLAYA!!','2020-12-05 21:47:16','2020-12-05 21:47:16'),(6,2,4,'que bueno!!','2020-12-05 21:47:16','2020-12-05 21:47:16'),(7,9,9,'fafa','2020-12-08 07:22:55','2020-12-08 07:22:55'),(9,9,9,'adada','2020-12-09 04:00:32','2020-12-09 04:00:32'),(10,7,9,'asdasd','2020-12-09 04:16:09','2020-12-09 04:16:09'),(12,10,12,'asdasdasd','2020-12-10 05:27:13','2020-12-10 05:27:13');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_images_users` (`user_id`),
  CONSTRAINT `fk_images_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,'test.jpg','descripción de prueba 1','2020-12-05 21:47:04','2020-12-05 21:47:04'),(2,1,'playa.jpg','descripción de prueba 2','2020-12-05 21:47:04','2020-12-05 21:47:04'),(3,1,'arena.jpg','descripción de prueba 3','2020-12-05 21:47:04','2020-12-05 21:47:04'),(4,3,'familia.jpg','descripción de prueba 4','2020-12-05 21:47:04','2020-12-05 21:47:04'),(5,1,'test.jpg','descripción de prueba 1','2020-12-05 21:47:16','2020-12-05 21:47:16'),(6,1,'playa.jpg','descripción de prueba 2','2020-12-05 21:47:16','2020-12-05 21:47:16'),(7,1,'arena.jpg','descripción de prueba 3','2020-12-05 21:47:16','2020-12-05 21:47:16'),(8,3,'familia.jpg','descripción de prueba 4','2020-12-05 21:47:16','2020-12-05 21:47:16'),(9,9,'1607308972apple-fruit-fruits-vitamins.jpg','dsa','2020-12-07 02:42:52','2020-12-07 02:42:52'),(10,9,'1607312075003_pexels-photo.jpg','asd','2020-12-07 03:34:35','2020-12-07 03:34:35'),(12,10,'1607582579apple-tree-branch-apple-fruit-52517.jpeg','strawberry jajajajax','2020-12-10 05:26:42','2020-12-10 06:43:45');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) DEFAULT NULL,
  `image_id` int(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_likes_users` (`user_id`),
  KEY `fk_likes_images` (`image_id`),
  CONSTRAINT `fk_likes_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  CONSTRAINT `fk_likes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,4,'2020-12-05 21:47:04','2020-12-05 21:47:04'),(2,2,4,'2020-12-05 21:47:04','2020-12-05 21:47:04'),(3,3,1,'2020-12-05 21:47:04','2020-12-05 21:47:04'),(4,3,2,'2020-12-05 21:47:04','2020-12-05 21:47:04'),(5,2,1,'2020-12-05 21:47:04','2020-12-05 21:47:04'),(6,1,4,'2020-12-05 21:47:16','2020-12-05 21:47:16'),(7,2,4,'2020-12-05 21:47:16','2020-12-05 21:47:16'),(8,3,1,'2020-12-05 21:47:16','2020-12-05 21:47:16'),(9,3,2,'2020-12-05 21:47:16','2020-12-05 21:47:16'),(10,2,1,'2020-12-05 21:47:16','2020-12-05 21:47:16'),(14,9,9,'2020-12-09 05:56:14','2020-12-09 05:56:14'),(22,10,10,'2020-12-10 04:36:03','2020-12-10 04:36:03'),(24,10,12,'2020-12-10 05:26:51','2020-12-10 05:26:51');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(200) DEFAULT NULL,
  `nick` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user','Víctor','Robles','victorroblesweb','victor@victor.com','pass',NULL,'2020-12-05 21:47:04','2020-12-05 21:47:04',NULL),(2,'user','Juan','Lopez','juanlopez','juan@juan.com','pass',NULL,'2020-12-05 21:47:04','2020-12-05 21:47:04',NULL),(3,'user','Manolo','Garcia','manologarcia','manolo@manolo.com','pass',NULL,'2020-12-05 21:47:04','2020-12-05 21:47:04',NULL),(4,'user','Víctor','Robles','victorroblesweb','victor@victor.com','pass',NULL,'2020-12-05 21:47:16','2020-12-05 21:47:16',NULL),(5,'user','Juan','Lopez','juanlopez','juan@juan.com','$2y$10$NToZJZF.sheCZeODqZ4DkOkezXZPiHd/VVENAu9Q/Wzz1U7TVJZ0W',NULL,'2020-12-05 21:47:16','2020-12-05 21:47:16',NULL),(6,'user','Manolo','Garcia','manologarcia','manolo@manolo.com','pass',NULL,'2020-12-05 21:47:16','2020-12-05 21:47:16',NULL),(7,'admin','admin','admin','admin','admin@admin.com','$2y$10$vjbxn0vY3JuSuf0Z.5WIleMfBGSpc2i.40tBaNLMycB9FYzlnPtL6',NULL,'2020-12-06 15:47:41','2020-12-06 15:47:41','RIyR3Nrl18jfvbMAAbblCIMlBm7M1DYvN1dKYHSRVWW1Gthfa6nzBCQKhCDH'),(8,NULL,'admin2',NULL,NULL,'admin2@admin2.com','$2y$10$uvcmq1rFs5uu12C95A3AeuhKBoPNVfcHZQ4ZKDoA7BF.XvIoI1sfK',NULL,'2020-12-06 15:49:28','2020-12-06 15:49:28','BtHm2RLzyz0RoTwGSQtWTQ7lqXEM2HjpjzR37bqpQSPjReR5FqJvrrQsuuql'),(9,'user','pedrox','martinex','pedrox','pedro@pedro.com','$2y$10$NToZJZF.sheCZeODqZ4DkOkezXZPiHd/VVENAu9Q/Wzz1U7TVJZ0W','1607299802pexels-photo.jpg','2020-12-06 16:04:13','2020-12-07 00:10:02','TpjxLweN0lymx66u00cHFFiLbQcHgHzrrUUc8sVsF0IyJfDBFnXUHIq37NEu'),(10,'user','jorge','xd','jorgexd','jorge@jorge.com','$2y$10$nK1zR6B9Ovu9..SOWQvuReTbt6N2JdFt/gkCxQGWjGf59D7mLyoZW','1607574955pexels-photo-102104.jpeg','2020-12-10 04:35:30','2020-12-10 04:35:55',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'laravel_master'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-12  8:56:43
