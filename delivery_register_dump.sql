-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: onestop2
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `delivery_register`
--

DROP TABLE IF EXISTS `delivery_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_register` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(90) NOT NULL,
  `password` varchar(400) NOT NULL,
  `email` varchar(250) NOT NULL,
  `address` varchar(1500) NOT NULL,
  `phonenumber` varchar(14) NOT NULL,
  `role` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phonenumber` (`phonenumber`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_register`
--
-- WHERE:  username IS NOT NULL

LOCK TABLES `delivery_register` WRITE;
/*!40000 ALTER TABLE `delivery_register` DISABLE KEYS */;
INSERT INTO `delivery_register` VALUES (1,'anieef','pbkdf2_sha256$870000$cwtttZ27bGSpQbR1IF38gl$mPM8+Ap0ZwiRKWmVOUhvN3Vx3nfl6pyUGvLb7heBSMo=','anifn@gmail.com','fghjkjhgvcvbnmbj','000000000','admin'),(2,'hh','pbkdf2_sha256$870000$cwtttZ27bGSpQbR1IF38gl$mPM8+Ap0ZwiRKWmVOUhvN3Vx3nfl6pyUGvLb7heBSMo=','h@gmail.com','dfbvdfvdfv','100000000','admin'),(3,'nn','pbkdf2_sha256$870000$OmuyvfV5T0IGo6wE4OCquq$gsXfFKpYiSoPrCuLBB76f0FL7HucuWqXsgspdlCTJu4=','n@gmail.com','dfsvsvcsd','01245263','customer'),(5,'ii','pbkdf2_sha256$870000$uRjILcPFczCf2rNkChNYxi$zBD9kRfFCIwZdQGYjF/pLQgsNogJ6KX7rrLZBY8zhzE=','ii','csdccvdvdvdsvsdv','00','customer'),(6,'ff','pbkdf2_sha256$870000$Cp9A0thMwBTJoLMzpA8Dij$PZLiO3NdeCrko/XhWhcJEQ463Y5/1vzpbY9HwLnPM2o=','fs@gmail.com','grgtrg iuyhj jk','012','customer'),(7,'ff','pbkdf2_sha256$870000$EYuH1XBe3BXJs1LekjpJDI$2gFMsVzM9dZp8gKtF0JeBdkp6BfklxVNdWXSq6/u9n0=','fn@gmIL.COM',' c sscdssd dfdf df ','012345','customer'),(8,'fameeda','pbkdf2_sha256$870000$mIBQm6qvMnuFKCw7zoNhd3$WVrG/PhdfrJazJc5/3IxKl0NFIVIQ7iaTFyRXxDX0Ro=','anieef342@gmail.com','Guntur (GNT) District Siripuramu','+916304983610','customer'),(9,'hou','pbkdf2_sha256$870000$e6wFisMcAHa8j1YLMUpm3D$tL46YCSBRi8o2ukf51LEsskPKgEeqLXJQLHU+G6holQ=','hou@gmail.com','qwdfbnmlihgfdzxcvb','0123456799','customer'),(10,'HoushikN','pbkdf2_sha256$1000000$6LgGG5BBB1NO6zKqLgaRe0$8surte9sK3659GIddsbdB8RwCIl1pI0ki7NIZlW5xpI=','aanieefbasha@gmail.com','Anantapur (ATP)','1254555588','customer');
/*!40000 ALTER TABLE `delivery_register` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-10 17:15:32
