-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: onestop2
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add register',7,'add_register'),(26,'Can change register',7,'change_register'),(27,'Can delete register',7,'delete_register'),(28,'Can view register',7,'view_register'),(29,'Can add posts',8,'add_posts'),(30,'Can change posts',8,'change_posts'),(31,'Can delete posts',8,'delete_posts'),(32,'Can view posts',8,'view_posts'),(33,'Can add cart',9,'add_cart'),(34,'Can change cart',9,'change_cart'),(35,'Can delete cart',9,'delete_cart'),(36,'Can view cart',9,'view_cart'),(37,'Can add otp',10,'add_otp'),(38,'Can change otp',10,'change_otp'),(39,'Can delete otp',10,'delete_otp'),(40,'Can view otp',10,'view_otp'),(41,'Can add cart items',11,'add_cartitems'),(42,'Can change cart items',11,'change_cartitems'),(43,'Can delete cart items',11,'delete_cartitems'),(44,'Can view cart items',11,'view_cartitems'),(45,'Can add cart item',12,'add_cartitem'),(46,'Can change cart item',12,'change_cartitem'),(47,'Can delete cart item',12,'delete_cartitem'),(48,'Can view cart item',12,'view_cartitem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$kKQ2dZOyKYNh1b8NJs3XwL$qB3X7dT+BZaJeKeWfMcdvbrwNgFcU1vlAEePcrvcWtA=','2025-03-18 14:51:28.973349',1,'aa','','','aa@gmail.com',1,1,'2025-03-18 14:50:44.767366'),(2,'pbkdf2_sha256$870000$jIs9UJqhOGQ9dEnIRpqJqn$Rnkt9IMwsZWIlnMfLGkQmJpWRjP+L6FP1s2R29GRmTU=',NULL,1,'dell','','','',1,1,'2025-03-18 14:51:14.103967');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_cart`
--

DROP TABLE IF EXISTS `delivery_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_cart_customer_id_0a08e5f4_fk_delivery_register_id` (`customer_id`),
  CONSTRAINT `delivery_cart_customer_id_0a08e5f4_fk_delivery_register_id` FOREIGN KEY (`customer_id`) REFERENCES `delivery_register` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_cart`
--

LOCK TABLES `delivery_cart` WRITE;
/*!40000 ALTER TABLE `delivery_cart` DISABLE KEYS */;
INSERT INTO `delivery_cart` VALUES (1,8),(2,9),(3,10);
/*!40000 ALTER TABLE `delivery_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_cartitem`
--

DROP TABLE IF EXISTS `delivery_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `cart_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_cartitem_cart_id_3a561466_fk_delivery_cart_id` (`cart_id`),
  KEY `delivery_cartitem_item_id_77cc8b22_fk_delivery_posts_id` (`item_id`),
  CONSTRAINT `delivery_cartitem_cart_id_3a561466_fk_delivery_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `delivery_cart` (`id`),
  CONSTRAINT `delivery_cartitem_item_id_77cc8b22_fk_delivery_posts_id` FOREIGN KEY (`item_id`) REFERENCES `delivery_posts` (`id`),
  CONSTRAINT `delivery_cartitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_cartitem`
--

LOCK TABLES `delivery_cartitem` WRITE;
/*!40000 ALTER TABLE `delivery_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_otp`
--

DROP TABLE IF EXISTS `delivery_otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_otp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `otp` varchar(6) NOT NULL,
  `otp_created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_otp_user_id_a39137a6_fk_delivery_register_id` (`user_id`),
  CONSTRAINT `delivery_otp_user_id_a39137a6_fk_delivery_register_id` FOREIGN KEY (`user_id`) REFERENCES `delivery_register` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_otp`
--

LOCK TABLES `delivery_otp` WRITE;
/*!40000 ALTER TABLE `delivery_otp` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_posts`
--

DROP TABLE IF EXISTS `delivery_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_posts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `bio` varchar(2000) NOT NULL,
  `picture` varchar(10000) NOT NULL,
  `price` double NOT NULL,
  `catagery` varchar(13) NOT NULL,
  `discount` int NOT NULL,
  `userId_id` bigint NOT NULL,
  `discount_price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_posts_userId_id_3779ec9b_fk_delivery_register_id` (`userId_id`),
  CONSTRAINT `delivery_posts_userId_id_3779ec9b_fk_delivery_register_id` FOREIGN KEY (`userId_id`) REFERENCES `delivery_register` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_posts`
--

LOCK TABLES `delivery_posts` WRITE;
/*!40000 ALTER TABLE `delivery_posts` DISABLE KEYS */;
INSERT INTO `delivery_posts` VALUES (23,'wallet','Brown Leather wallet','https://apisap.fabindia.com/medias/20194758-01.jpg?context=bWFzdGVyfGltYWdlc3w4Mjg3MnxpbWFnZS9qcGVnfGFEaG1MMmd6TWk4Mk9ERTROVGswTmpreE5EZzBOaTh5TURFNU5EYzFPRjh3TVM1cWNHY3xlY2IyM2IyMDc4MDMxNmFhMWI5Y2ZjMGI2MWE1NWE4ZDcwMzczYjkwNWNlYTgzODVjMzBhOWM5YjkzYTgxZTIx',500,'accessories',15,1,425),(27,'Womens T-shirt','size M','https://cdn.dribbble.com/userupload/34625151/file/original-ac3a8c40aa0f35c7ef79e26f2f6d44bf.jpg?resize=1504x1315&vertical=center',1500,'shirt',8,2,1380),(28,'semi formals','Bule Shirt','https://filohevis.com/cdn/shop/files/cnm.jpg?v=1733733245&width=1000',500,'shirt',1,2,495),(30,'White pant','Effortlessly chic and undeniably versatile, these white pants are crafted for those who appreciate elegance in simplicity. Designed with a tailored fit, they offer a flattering silhouette that complements any body type. The pristine white color exudes freshness and refinement, making them perfect for both formal occasions and casual outings','https://th.bing.com/th/id/OIP.isWG7AHunbvheOCQZO8R7QHaJQ?rs=1&pid=ImgDetMain',900,'pants',5,1,855),(31,'Classic Denim Jacket','Rugged and timeless, this denim jacket is a wardrobe staple. Featuring a durable fabric and versatile style, it pairs perfectly with jeans, chinos, or casual trousers for any season.','https://th.bing.com/th/id/OIP.14vwQknS-OOtF9m5kkjcNQHaJn?rs=1&pid=ImgDetMain',1500,'shirt',2,1,1470),(32,'Slim-Fit Chinos','A modern twist on a classic style, these slim-fit chinos offer unparalleled comfort and a sleek look. Ideal for both office and weekend wear','https://th.bing.com/th/id/OIP.bjW9hz0cxrVYTOj1dV-wVwAAAA?rs=1&pid=ImgDetMain',500,'pants',1,1,495),(33,'Crew Neck T-Shirt','Crafted from 100% breathable cotton, this T-shirt features a classic crew neck and a soft finish, perfect for layering or wearing solo on a sunny day','https://images-na.ssl-images-amazon.com/images/I/61TGJ3NCLNL._AC_UX466_.jpg',200,'shirt',6,1,188),(34,'Tailored Suit','Elevate your formal wardrobe with this impeccably tailored suit. Designed for sophistication and comfort, it’s perfect for weddings, business meetings, or special events.','https://i.pinimg.com/736x/f9/37/c8/f937c88855a19fc54fe1abbd254319e4.jpg',10000,'shirt',5,1,9500),(35,'Knitted Sweater','Made from premium wool, this sweater combines warmth and style. The intricate knit pattern adds texture, making it a great pick for chilly evenings.','https://th.bing.com/th/id/OIP.W-LtxqNX5T3ANL1nBuM1UwHaLH?rs=1&pid=ImgDetMain',900,'shirt',3,1,873),(36,'Athletic Joggers','Designed for both style and performance, these joggers offer a snug fit with moisture-wicking fabric, making them great for workouts or lounging.','https://i5.walmartimages.com/asr/c7811c0a-3376-4065-b6f1-5d73eab9f630_1.91b18dfe82db2ede4330632aafa3c505.jpeg',900,'pants',15,2,765),(37,'Graphic Tee','Make a statement with this bold graphic tee. Soft, lightweight, and packed with personality, it’s a standout piece in any casual collection.','https://i5.walmartimages.com/seo/Men-s-Overflow-Graphic-Tees-for-Men-S-4XL_79dd3134-5689-42c6-a520-a606199e42ea.d105831f4ff8f53ee7cd67f6c7778d9e.jpeg',190,'shirt',2,2,186.2),(38,'Classic Polo Shirt','This iconic polo shirt features a breathable fabric and a timeless design, ideal for casual gatherings or outdoor activities.','https://th.bing.com/th/id/OIP.KCluQOnh8XXL6R8HXBRZXQHaIZ?rs=1&pid=ImgDetMain',800,'shirt',20,2,640),(39,'High-Waisted Jeans','These high-waisted jeans are a blend of style and comfort. Crafted with stretchable denim, they hug your curves while offering all-day ease.','https://th.bing.com/th/id/OIP._6kZT9Cd0n-W1n4BGdKlxQHaLG?w=204&h=306&c=7&r=0&o=5&dpr=1.3&pid=1.7',15000,'pants',15,2,12750),(40,'Bohemian Tunic','Free-spirited and flowy, this bohemian tunic showcases intricate embroidery and a relaxed fit for effortless charm.','https://th.bing.com/th/id/OIP.l9xGUGsnGmU2mK42OYQ4aAHaKq?w=208&h=299&c=7&r=0&o=5&dpr=1.3&pid=1.7',1800,'shirt',5,2,1710),(41,'Sweater','This cozy turtleneck sweater brings a retro vibe to your outfit, while its unisex design ensures it looks great on anyone.','https://th.bing.com/th/id/OIP.TtWM6YtRvb3sXvdHrBFbhgHaJ4?rs=1&pid=ImgDetMain',1580,'shirt',9,2,1437.8),(42,'watch','Dynamic black watch','https://th.bing.com/th/id/OIP.2FhYSQT91VIipHlxrqoOzQHaHa?rs=1&pid=ImgDetMain',400,'accessories',6,1,376);
/*!40000 ALTER TABLE `delivery_posts` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `delivery_register` WRITE;
/*!40000 ALTER TABLE `delivery_register` DISABLE KEYS */;
INSERT INTO `delivery_register` VALUES (1,'anieef','pbkdf2_sha256$870000$cwtttZ27bGSpQbR1IF38gl$mPM8+Ap0ZwiRKWmVOUhvN3Vx3nfl6pyUGvLb7heBSMo=','anifn@gmail.com','fghjkjhgvcvbnmbj','000000000','admin'),(2,'hh','pbkdf2_sha256$870000$cwtttZ27bGSpQbR1IF38gl$mPM8+Ap0ZwiRKWmVOUhvN3Vx3nfl6pyUGvLb7heBSMo=','h@gmail.com','dfbvdfvdfv','100000000','admin'),(3,'nn','pbkdf2_sha256$870000$OmuyvfV5T0IGo6wE4OCquq$gsXfFKpYiSoPrCuLBB76f0FL7HucuWqXsgspdlCTJu4=','n@gmail.com','dfsvsvcsd','01245263','customer'),(5,'ii','pbkdf2_sha256$870000$uRjILcPFczCf2rNkChNYxi$zBD9kRfFCIwZdQGYjF/pLQgsNogJ6KX7rrLZBY8zhzE=','ii','csdccvdvdvdsvsdv','00','customer'),(6,'ff','pbkdf2_sha256$870000$Cp9A0thMwBTJoLMzpA8Dij$PZLiO3NdeCrko/XhWhcJEQ463Y5/1vzpbY9HwLnPM2o=','fs@gmail.com','grgtrg iuyhj jk','012','customer'),(7,'ff','pbkdf2_sha256$870000$EYuH1XBe3BXJs1LekjpJDI$2gFMsVzM9dZp8gKtF0JeBdkp6BfklxVNdWXSq6/u9n0=','fn@gmIL.COM',' c sscdssd dfdf df ','012345','customer'),(8,'fameeda','pbkdf2_sha256$870000$mIBQm6qvMnuFKCw7zoNhd3$WVrG/PhdfrJazJc5/3IxKl0NFIVIQ7iaTFyRXxDX0Ro=','anieef342@gmail.com','Guntur (GNT) District Siripuramu','+916304983610','customer'),(9,'hou','pbkdf2_sha256$870000$e6wFisMcAHa8j1YLMUpm3D$tL46YCSBRi8o2ukf51LEsskPKgEeqLXJQLHU+G6holQ=','hou@gmail.com','qwdfbnmlihgfdzxcvb','0123456799','customer'),(10,'HoushikN','pbkdf2_sha256$1000000$6LgGG5BBB1NO6zKqLgaRe0$8surte9sK3659GIddsbdB8RwCIl1pI0ki7NIZlW5xpI=','aanieefbasha@gmail.com','Anantapur (ATP)','1254555588','customer');
/*!40000 ALTER TABLE `delivery_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_register_saved_posts`
--

DROP TABLE IF EXISTS `delivery_register_saved_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_register_saved_posts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `register_id` bigint NOT NULL,
  `posts_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `delivery_register_saved_posts_register_id_posts_id_afdfd389_uniq` (`register_id`,`posts_id`),
  KEY `delivery_register_sa_posts_id_73eae6e5_fk_delivery_` (`posts_id`),
  CONSTRAINT `delivery_register_sa_posts_id_73eae6e5_fk_delivery_` FOREIGN KEY (`posts_id`) REFERENCES `delivery_posts` (`id`),
  CONSTRAINT `delivery_register_sa_register_id_d7366fde_fk_delivery_` FOREIGN KEY (`register_id`) REFERENCES `delivery_register` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_register_saved_posts`
--

LOCK TABLES `delivery_register_saved_posts` WRITE;
/*!40000 ALTER TABLE `delivery_register_saved_posts` DISABLE KEYS */;
INSERT INTO `delivery_register_saved_posts` VALUES (8,8,23),(1,8,27),(4,8,28),(11,8,41),(17,10,30);
/*!40000 ALTER TABLE `delivery_register_saved_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-03-18 14:52:23.629963','1','Posts object (1)',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'delivery','cart'),(12,'delivery','cartitem'),(11,'delivery','cartitems'),(10,'delivery','otp'),(8,'delivery','posts'),(7,'delivery','register'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-18 13:19:15.041218'),(2,'auth','0001_initial','2025-03-18 13:19:20.039676'),(3,'admin','0001_initial','2025-03-18 13:19:20.873745'),(4,'admin','0002_logentry_remove_auto_add','2025-03-18 13:19:20.897786'),(5,'admin','0003_logentry_add_action_flag_choices','2025-03-18 13:19:20.944899'),(6,'contenttypes','0002_remove_content_type_name','2025-03-18 13:19:21.736985'),(7,'auth','0002_alter_permission_name_max_length','2025-03-18 13:19:22.144414'),(8,'auth','0003_alter_user_email_max_length','2025-03-18 13:19:22.271917'),(9,'auth','0004_alter_user_username_opts','2025-03-18 13:19:22.335841'),(10,'auth','0005_alter_user_last_login_null','2025-03-18 13:19:22.741194'),(11,'auth','0006_require_contenttypes_0002','2025-03-18 13:19:22.751497'),(12,'auth','0007_alter_validators_add_error_messages','2025-03-18 13:19:22.772538'),(13,'auth','0008_alter_user_username_max_length','2025-03-18 13:19:23.179428'),(14,'auth','0009_alter_user_last_name_max_length','2025-03-18 13:19:23.455663'),(15,'auth','0010_alter_group_name_max_length','2025-03-18 13:19:23.580937'),(16,'auth','0011_update_proxy_permissions','2025-03-18 13:19:23.624599'),(17,'auth','0012_alter_user_first_name_max_length','2025-03-18 13:19:23.966960'),(18,'delivery','0001_initial','2025-03-18 13:19:25.866782'),(19,'delivery','0002_posts_catagery_register_phonenumber','2025-03-18 13:19:26.598517'),(20,'delivery','0003_alter_register_phonenumber','2025-03-18 13:19:26.675435'),(21,'delivery','0004_alter_register_password','2025-03-18 13:19:27.043059'),(22,'delivery','0005_remove_posts_user','2025-03-18 13:19:27.472878'),(23,'delivery','0006_alter_posts_img','2025-03-18 13:19:27.516886'),(24,'delivery','0007_posts_user','2025-03-18 13:19:27.932125'),(25,'delivery','0008_remove_posts_user_posts_userid','2025-03-18 13:19:28.588796'),(26,'delivery','0009_remove_posts_userid_delete_cart_delete_posts_and_more','2025-03-18 13:19:29.192760'),(27,'delivery','0010_initial','2025-03-18 13:19:31.641795'),(28,'sessions','0001_initial','2025-03-18 13:19:31.842486'),(29,'delivery','0011_posts_discount_price','2025-03-19 02:30:55.594320'),(30,'delivery','0012_rename_img_posts_picture','2025-03-19 02:36:13.468039'),(31,'delivery','0013_register_saved_posts','2025-03-22 04:14:30.319653'),(32,'delivery','0014_alter_posts_bio','2025-03-24 05:47:46.606794'),(33,'delivery','0015_alter_posts_bio','2025-03-24 05:57:56.768405'),(34,'delivery','0016_alter_posts_name_alter_posts_picture_and_more','2025-03-24 06:17:36.680942'),(35,'delivery','0017_otp','2025-03-26 04:59:30.919208'),(36,'delivery','0018_remove_cart_items_cartitems','2025-03-26 08:10:52.432503'),(37,'delivery','0019_rename_post_cartitems_item_alter_cartitems_cart','2025-03-26 09:20:56.024904'),(38,'delivery','0020_cart_items_delete_cartitems','2025-03-26 10:00:04.575521'),(39,'delivery','0021_remove_cart_items_cartitem','2025-03-28 04:02:44.798840'),(40,'delivery','0022_alter_register_phonenumber','2025-03-29 02:36:47.346102');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-10 17:06:44
