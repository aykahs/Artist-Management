-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: artistmanagement
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_release_year` year NOT NULL,
  `no_of_album_release` int NOT NULL,
  `dob` datetime NOT NULL,
  `gender` enum('m','f','o') COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'test',2012,1,'1990-07-12 00:00:00','m','ktm',NULL,101,101,'2024-06-03 11:17:41','2024-06-03 11:17:49'),(2,'prajwol',1907,2,'1985-06-13 17:47:00','m','ktm',NULL,101,101,'2024-06-03 11:47:36','2024-06-03 12:12:02');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',1),(10,'2024_05_31_013117_create_table_artist',1),(11,'2024_05_31_015623_create_table_music',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `album_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` enum('rmb','country','classics','rock','jazz') COLLATE utf8mb4_unicode_ci NOT NULL,
  `artist_id` bigint unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `music_artist_id_foreign` (`artist_id`),
  CONSTRAINT `music_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (1,'test','test','country',1,101,NULL,NULL,'2024-06-03 11:18:20',NULL),(2,'prajwol','prajwol','rmb',2,101,101,NULL,'2024-06-03 11:53:59','2024-06-03 12:12:18'),(3,'prajwol2','prajwol2','classics',2,101,NULL,NULL,'2024-06-03 12:12:56',NULL);
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('1daff8e008487454ae950a3b252fc135a31814f07195e42787f34ebb0ae21a4ccd1bd5107d3d3488',101,1,'Personal Access Token','[]',1,'2024-06-03 11:33:04','2024-06-03 12:07:14','2025-06-03 17:18:04'),('8e4da1d1a77f6121a2e79399fa8609c23be71470bac387d41612114767ede200856c2684c2b370c8',101,1,'Personal Access Token','[]',0,'2024-06-03 12:07:22','2024-06-03 12:07:22','2025-06-03 17:52:22'),('8e5cc5d5d64462e804631959eb0a1ee8c3cee4f5c1f2a5cae682864bdc1aba3ea61800578be01d09',101,1,'Personal Access Token','[]',1,'2024-06-03 11:14:13','2024-06-03 11:32:27','2025-06-03 16:59:13');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','9OclUWCHHxMShu2rxEGxCL9p4gIbzXj8EQvsz1fA',NULL,'http://localhost',1,0,0,'2024-06-03 11:14:09','2024-06-03 11:14:09');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2024-06-03 11:14:09','2024-06-03 11:14:09');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `gender` enum('m','f','o') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usertype` enum('admin','user') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'America','Vandervort','972.407.2216','1974-12-23 00:00:00','m','539 Jany Curve Suite 487\nErnieberg, KY 75943-4419','littel.daniella@example.net','gerry75','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'qvUTzlM7P2',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(2,'Alisa','Kozey','1-458-364-1913','1988-06-25 00:00:00','o','535 Ransom Bridge\nSouth Lacy, TN 72322','frances.bosco@example.com','jimmy.nader','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'uHNNYLF7TY',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(3,'Marielle','Kuhlman','+1 (740) 585-9605','2013-08-08 00:00:00','f','259 Dooley Prairie Suite 223\nWest Leathachester, UT 86656-7387','osinski.gabriel@example.com','lebsack.maymie','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'NFq1wNYUeN',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(4,'Celestine','Stoltenberg','(352) 281-0270','1984-08-22 00:00:00','m','433 Nathan Plains\nZboncakbury, RI 53720-4015','skiles.ellsworth@example.com','lubowitz.jacquelyn','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'KwIgkh9Rav',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(5,'Aliyah','Klocko','+1-785-406-4815','2000-05-26 00:00:00','f','326 Dedric Estates\nLake Francomouth, NJ 45728-3745','vandervort.cloyd@example.org','vthiel','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'h6mx0WMvn9',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(6,'Britney','Cronin','769.225.2186','2005-08-29 00:00:00','m','4278 Gibson Neck Apt. 405\nMoorebury, CT 35267','furman62@example.com','liam.lakin','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'wbsnnvjxBt',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(7,'Demarco','Rippin','+1 (786) 870-9546','2001-03-09 00:00:00','o','3179 Barton Unions Suite 439\nKihnport, MD 12029','lnolan@example.org','parker.marlee','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'XWf5O6ZwTD',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(8,'Joan','Stoltenberg','540-671-4149','2001-07-12 00:00:00','f','841 Torp Greens\nLilyanfurt, NJ 58101','kamron66@example.com','ueffertz','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'5gpQuLTbs5',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(9,'Erna','Monahan','1-408-753-9273','1994-12-24 00:00:00','m','785 Isobel Grove\nHaleighmouth, MN 64512-0131','leann49@example.net','wilkinson.katrine','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'DZygn4GiVT',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(10,'Kaycee','Aufderhar','+1-854-700-2933','2007-02-08 00:00:00','f','8868 Spencer Walks\nLake Ezequielberg, ID 90181','hackett.isadore@example.com','jocelyn34','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'wIa3ylMduj',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(11,'Donnell','Mraz','908.662.7491','1998-11-03 00:00:00','o','8269 Laury Forges Apt. 214\nPort Derecktown, OR 11180-5948','jailyn.walter@example.com','orion.rath','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'5a76m1sx4j',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(12,'Cole','Bailey','417-204-1659','2013-10-01 00:00:00','o','8801 Hirthe Canyon\nWest Angelaside, TX 46570-0377','isobel.lubowitz@example.org','tlarson','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'pmXdTttpW7',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(13,'Kendra','Rogahn','1-980-861-7364','1984-08-06 00:00:00','o','36233 Carroll Ranch\nEast Benjamin, GA 10772-0656','torrey82@example.net','bailee74','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'vurZZjZu7Q',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(14,'Leonie','Balistreri','949-270-9668','1998-02-22 00:00:00','f','891 Pacocha Islands\nAlfordberg, CO 20171','zconnelly@example.org','katherine78','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'DlmFpYZ84a',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(15,'Javonte','Kris','(408) 603-8783','2006-03-26 00:00:00','f','4715 Emery Dale\nPort Gregoriotown, IL 22038-7053','brendan89@example.com','reinhold11','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'hhtGDUUTFn',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(16,'Ian','Lowe','(872) 241-2979','2011-07-03 00:00:00','o','8736 Cloyd Divide Apt. 105\nNew Asia, IA 02366-4993','hettinger.julius@example.com','padberg.wendell','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'as2K4eZCfw',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(17,'Marilie','Denesik','+1-732-848-6042','1987-08-27 00:00:00','o','4022 Nikki Corner Apt. 522\nElnaport, MS 35842','mdubuque@example.net','ethel.kautzer','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'2jZinRgKTQ',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(18,'Muhammad','Sanford','520-714-7254','2011-10-01 00:00:00','o','5300 Sheila Flats\nSauerbury, OK 37850-9540','wschimmel@example.org','frederick01','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'KxKEPKdtEx',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(19,'Jana','Shanahan','828.834.3010','2003-06-22 00:00:00','o','4226 Kellie Stravenue Apt. 725\nFeestfort, KS 09798','gcummerata@example.net','spinka.jairo','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'szoEiSfIOP',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(20,'Samanta','Johnston','423.297.2399','2019-02-05 00:00:00','o','359 Aufderhar Passage Suite 884\nEast Zaneborough, IN 46534-5812','yryan@example.com','nelson67','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'mhCX1NXyMZ',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(21,'Demario','Kris','573-455-9589','2023-03-13 00:00:00','o','77696 VonRueden Common\nNew Elsaborough, KY 81113','adriel.russel@example.org','cfadel','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'9624Elblq1',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(22,'Mylene','Bergnaum','+1 (316) 470-7110','2008-10-05 00:00:00','f','77095 Bechtelar Squares\nVicentabury, NE 59481','ymcclure@example.net','yrogahn','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'l6V722pvFd',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(23,'Roslyn','Brown','714-557-8780','2017-07-23 00:00:00','m','739 Annalise Court Apt. 050\nFredatown, AR 99966','paltenwerth@example.net','volkman.mandy','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'6ApvjPnJnd',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(24,'Ron','Predovic','1-934-324-8608','1980-11-17 00:00:00','o','524 Alexandrine Union Apt. 383\nEast Bertmouth, ID 53095','polson@example.net','hquitzon','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'yJhb8GT7XI',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(25,'Cheyenne','Reinger','820-521-3696','1975-12-22 00:00:00','f','771 Marianne Wells\nEast Joellechester, AZ 73738','weston82@example.net','cruickshank.susan','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'cE0IPHZ2J7',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(26,'Sarai','Morissette','+14306957863','1977-03-20 00:00:00','f','90036 Goyette Gateway Apt. 419\nUptonstad, NV 01583-1582','candice.schiller@example.net','deckow.viva','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'R2kA5Iks4h',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(27,'Noemi','Padberg','+1.346.614.0113','2019-06-22 00:00:00','m','671 Brook Valleys Suite 386\nLake Viviennehaven, NM 78662','marc11@example.net','keshawn87','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'q2rITILxZY',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(28,'Graham','Kemmer','+1-804-612-1824','2011-06-26 00:00:00','o','3725 Mertz Loop\nPort Rosemarieton, PA 51213','metz.janelle@example.com','robel.enoch','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'NIPEuWrBk3',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(29,'Grayson','Legros','240.769.4119','2006-05-15 00:00:00','f','491 Issac Mission\nKelvinmouth, SC 71535','schamberger.jovany@example.net','shea15','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'zeRbAOKKlX',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(30,'Sylvester','Bosco','(351) 781-0729','2013-02-08 00:00:00','f','509 Frank Centers\nTurcottebury, IL 76126-8676','abshire.wyman@example.net','welch.jamey','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'vwd9tFsSbs',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(31,'Queen','Boehm','+1.283.353.6869','1992-04-10 00:00:00','m','8221 Brenden Fall Suite 492\nLukaschester, CA 50830-3021','dusty34@example.com','zterry','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Bas6sZfIlN',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(32,'Karolann','Tillman','+18474435126','1973-06-30 00:00:00','m','1016 Frami Fork Suite 710\nKiptown, SD 87566-7032','marquardt.clarissa@example.org','baron77','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'7rzsKDO07L',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(33,'Jerome','Bode','(754) 584-0214','1980-09-18 00:00:00','o','391 Maida Mount Suite 806\nWest Weldonland, UT 50037','jenkins.kyra@example.org','mann.uriah','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'AZ98A805iq',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(34,'Trenton','Grady','1-989-376-9906','1975-08-03 00:00:00','f','9478 Marlon Tunnel\nDeckowstad, MO 86174','ecarroll@example.net','carson82','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'ixCTMbLwHo',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(35,'Vern','Douglas','475-203-2995','1987-03-12 00:00:00','o','12922 Karli Centers\nTurcotteton, OR 18856-2041','leslie21@example.com','lakin.constantin','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'ERWULhEn7D',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(36,'Clare','Oberbrunner','+1.775.582.3163','1973-09-18 00:00:00','m','4828 Eichmann Mall\nWest Aylin, IA 77846','ybrekke@example.com','reichert.elza','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'5W9FwHsY08',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(37,'Marjolaine','Cartwright','+1-740-861-2532','2024-05-06 00:00:00','m','75632 Iliana Court\nRunolfsdottirstad, VA 26066-0736','julia28@example.org','thiel.dante','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'y1fvhcPNBL',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(38,'Nona','Schumm','857.588.7677','1991-01-07 00:00:00','m','213 Darrel Valleys\nLake Jaden, AZ 41720-9008','fpacocha@example.com','kcummerata','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'M1lDj2HRAH',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(39,'Minnie','Flatley','+1 (854) 336-4395','2011-07-17 00:00:00','m','93517 William Turnpike Apt. 723\nNew Cory, SC 68238-9138','luis31@example.org','roger.rowe','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'T2tgZ0UIOy',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(40,'Dannie','O\'Hara','(269) 228-9476','1978-06-29 00:00:00','f','873 Michelle Expressway Apt. 663\nMoenshire, TN 39199','chyna.johnson@example.net','reba.conroy','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'oYJ27LrKg5',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(41,'Lavonne','Bode','+1-678-717-5494','1973-05-24 00:00:00','f','412 Stroman Village\nProsaccofurt, TN 46912','orville82@example.net','casimir50','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'D4cvn99IpX',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(42,'Katelin','Spinka','(215) 669-8325','1987-06-17 00:00:00','o','639 Labadie Streets\nLake America, RI 62730','grimes.ryann@example.org','xjacobson','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'ZO7UBjCNrF',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(43,'Nelson','Kling','651.562.3292','1983-05-28 00:00:00','f','2989 Zetta Springs Suite 581\nIsabelborough, AK 90080-2923','annabelle31@example.com','mokeefe','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'czDh1N1mxd',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(44,'Bruce','Barrows','1-614-731-1193','2000-01-14 00:00:00','f','47406 Carmela Drives\nWest Sonny, WI 19426','otho.stark@example.com','briana.shields','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'o5SkXSykq5',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(45,'Isobel','Hackett','321-464-1801','2018-04-13 00:00:00','f','5347 Aufderhar Port Apt. 466\nHegmannmouth, IL 78881','runolfsson.jadon@example.net','helen30','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'RFVTYUqCjh',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(46,'Alyson','Koch','267.759.1737','1993-11-28 00:00:00','m','492 Gerald Burgs Suite 009\nLake Devantestad, OR 14684-7314','rosina.schneider@example.org','orn.jayda','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Eu1Jr2Khdm',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(47,'Ilene','Batz','406-343-1725','2003-01-05 00:00:00','m','598 Sonya Streets Apt. 796\nNorth Nichole, MS 55174','garrick.buckridge@example.com','carey.fadel','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'ajGo3n1S7f',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(48,'Evangeline','Jaskolski','+17377094229','1972-10-19 00:00:00','f','19366 Kristina Island Suite 055\nWizahaven, HI 26512','etha.weimann@example.org','xtorp','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'UlzXzrGpzR',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(49,'Elian','Baumbach','1-862-612-0110','1985-09-02 00:00:00','o','54516 Boyle Rue\nEast Wilfred, AL 40972','botsford.yesenia@example.net','rbosco','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'kZIYMipaCo',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(50,'Estel','Jenkins','469-525-5070','1999-10-30 00:00:00','m','4644 Alexandrea Dale Apt. 773\nNorth Rick, IN 02723','ndietrich@example.com','lorna26','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'cHzKtF3810',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(51,'Antonio','Morissette','(323) 320-4922','2013-02-23 00:00:00','m','898 Wunsch Locks Suite 509\nNew Niko, NM 94227','estevan04@example.net','angus.corwin','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'fsSyC18xGz',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(52,'Linnie','Grant','+1.651.673.4722','2016-09-18 00:00:00','o','4220 Konopelski Squares Suite 802\nQuitzonberg, UT 44483','abshire.jordan@example.net','kurtis90','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'sFBvdppja6',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(53,'Foster','Wolff','212.379.5930','1984-11-18 00:00:00','f','14858 Chelsea Ridge\nLake Elwynborough, VA 33547','jacey92@example.net','lorenza.smith','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'vuJvuw0Pi8',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(54,'Eunice','McLaughlin','1-845-719-7190','1994-10-26 00:00:00','o','5212 Margot Lights Suite 872\nNorth Pamelaside, CT 56043-8354','marvin.cleta@example.com','aliyah.mcglynn','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'tgfCo34mKQ',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(55,'Nora','Mann','(352) 719-0421','1981-07-16 00:00:00','m','3684 Gerhold Gardens\nKeonville, OR 86323-0119','charlotte61@example.net','gibson.jules','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'jYreGwfKjN',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(56,'Tina','Jast','+1.689.752.2101','1984-10-27 00:00:00','m','288 Rau Mission Suite 407\nEast Ashlynn, DC 06896-9896','jennings.price@example.com','hschimmel','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'fbNH8EYd3u',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(57,'Benedict','Kiehn','(442) 796-5549','1991-09-09 00:00:00','m','33077 Donato Trafficway\nWest Unique, UT 08510','damore.abelardo@example.com','hortense06','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Sf2T2RjIL0',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(58,'Rebeca','Schoen','1-951-680-3576','2023-04-30 00:00:00','o','6692 Jakob Underpass Apt. 318\nMargebury, NC 85541','ucartwright@example.net','woconner','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'sSwfxvbkMa',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(59,'Elisa','Treutel','+12628401218','2021-10-11 00:00:00','m','53241 Gussie Key Suite 477\nJantown, VT 92181','fbaumbach@example.net','caleigh.windler','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'pbbrTjoOhI',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(60,'Jordon','Kuphal','(229) 460-3252','1993-03-26 00:00:00','m','1182 Donnelly Lights Suite 197\nNew Mckenziemouth, OR 31055','everette12@example.com','ohermann','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'g2F4CuXtY0',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(61,'Lazaro','Gulgowski','+1-458-323-4958','2012-06-05 00:00:00','m','330 Langosh Expressway Suite 963\nSporerchester, OR 03466','waylon48@example.net','mafalda.kirlin','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'VB7gE4cJL0',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(62,'Arvel','Dickinson','(321) 816-9758','2002-08-01 00:00:00','m','35970 Irving Forks Apt. 357\nJaceburgh, IA 93858-6577','garnet.maggio@example.org','jessie.kihn','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'7YlzWczXmo',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(63,'Stephan','Welch','+15858959996','1972-08-25 00:00:00','f','9004 Scotty Crossing Apt. 875\nWest Dillon, IL 66941','hlakin@example.org','yschaden','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'k2pXO3NQCu',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(64,'Beaulah','Bergnaum','267-220-0858','1973-01-28 00:00:00','o','34286 Ladarius Coves Apt. 333\nDaleton, MT 77813','zreynolds@example.com','marisa.mraz','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'9bYVRcgUnA',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(65,'Sigurd','Kassulke','+1-775-413-9534','2014-04-04 00:00:00','f','172 Scotty Loop\nHarveyhaven, NM 78983','andreanne.lehner@example.org','price.maddison','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'kVMZcpQDcx',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(66,'Willy','Roberts','423-657-3054','1971-05-28 00:00:00','m','182 Evelyn Island\nSimeonburgh, OH 06488-9121','fmiller@example.org','lfranecki','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'GZcuYS8TaC',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(67,'Thea','Thompson','571-278-8262','1975-08-13 00:00:00','m','32004 Pattie Mews\nCronaland, MD 83166-9150','gernser@example.com','alexzander.ernser','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'KhDvDWFXE8',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(68,'Myrtle','Carroll','+1-256-852-6860','1975-04-10 00:00:00','f','92637 Littel Parkway\nNorth Marjoryside, CA 66328-9316','alfredo.jones@example.org','sawayn.deshaun','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'UnnpXy8ayX',NULL,NULL,NULL,'2024-06-03 11:06:48','2024-06-03 11:06:48'),(69,'Richie','Hoppe','+1-351-326-2239','1974-09-28 00:00:00','o','11989 Klocko Hollow\nSouth Blake, ME 41044-2403','madge26@example.com','becker.kaela','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'ScoVhsEAKO',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(70,'Danielle','Kuphal','458.866.5264','2003-11-20 00:00:00','m','185 Hodkiewicz Isle Apt. 144\nPort Kingville, SD 98286-5189','tracy.upton@example.net','roob.nick','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'GE89NmjFPq',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(71,'Juanita','Abshire','351-281-9997','1995-06-05 00:00:00','f','296 Zieme Square Apt. 035\nEast Novellatown, KS 68809','gladyce66@example.net','olin59','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'msr4SQmss0',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(72,'Kaci','Durgan','724-407-6528','1971-12-15 00:00:00','f','743 Monahan Points\nWilhelminefort, IA 68168-6432','kenya.feest@example.net','dolores31','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'3U28k1cNyp',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(73,'Lonny','Harris','+17476646157','2004-11-14 00:00:00','f','2962 Laury Lock Suite 803\nWilhelminebury, IA 24781-8116','christiansen.chelsea@example.com','elroy82','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'GZ5g6WbPj8',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(74,'Sadye','Schumm','+1-239-697-4892','2005-10-15 00:00:00','m','887 Ines Motorway\nEast Shayna, ME 38321','waylon.brakus@example.org','miguel33','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'my2bnms8bm',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(75,'Gus','Wilderman','1-585-921-0838','2022-12-09 00:00:00','o','41567 Jerry Junctions Apt. 648\nFeilchester, MS 56243-7025','woconner@example.net','mertz.stanford','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'82ch9wKuBt',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(76,'Kailee','Senger','(386) 885-1482','2009-08-09 00:00:00','f','667 Alicia Passage\nMcKenzieside, WV 94357','erwin.cronin@example.com','belle.grimes','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'PRGxs5ZeUh',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(77,'Preston','McDermott','1-409-254-0108','1979-09-12 00:00:00','m','9710 Abbey Summit Apt. 033\nWisozkland, CT 27238-5951','iblanda@example.org','ykutch','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'DTp8Ua8yCf',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(78,'Jolie','Reilly','248.858.4635','2005-11-09 00:00:00','f','4471 Fabiola Shores Apt. 666\nSouth Baileytown, NC 09743-4317','elfrieda.tromp@example.net','btrantow','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'CFfKZvRb0k',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(79,'Mae','Grant','+1.915.967.5401','1997-03-15 00:00:00','o','773 Beahan Inlet Suite 837\nRolfsonburgh, TN 67579','mitchell.fannie@example.com','ulittel','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'gx0C7Q9kpM',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(80,'Stephen','Hamill','1-747-904-0969','1993-10-25 00:00:00','o','520 Crystel Turnpike\nWest Dulce, GA 04007','dward@example.com','kiara.effertz','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'60wdHS6sqS',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(81,'Carter','O\'Keefe','(878) 477-3187','1985-05-06 00:00:00','m','2006 Earnest Circle Apt. 900\nMoorehaven, MA 97062','dayton.lesch@example.net','sglover','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'WIkitVzoCL',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(82,'Mercedes','Littel','1-850-404-8569','2013-09-24 00:00:00','m','21046 Delpha Circles Suite 701\nNorth Enricoview, WV 00012','daniel.izaiah@example.com','burley21','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'7uqZfVjr8w',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(83,'Caesar','Pagac','+1-475-857-8993','1990-06-06 00:00:00','o','79739 Sanford Parks Suite 431\nSouth Paxton, NM 65288-0996','niko.schmitt@example.net','pollich.bernadette','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'ph2MjpnOlF',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(84,'Esta','Heathcote','(872) 912-8790','2022-01-18 00:00:00','m','809 Sanford Tunnel\nHiramside, MO 87231-5163','nmorissette@example.org','schimmel.zoie','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'0ocVoBvgW3',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(85,'Ewell','Kreiger','301-627-6815','1990-09-17 00:00:00','f','865 Schroeder Points Apt. 328\nHalvorsonborough, MD 00388-9275','owitting@example.com','vivianne83','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'HSyUyBmcKX',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(86,'Kaci','Emard','+16266695203','1987-11-13 00:00:00','m','127 Rowe Flat\nAracelyfurt, AK 29894','carli96@example.org','roger.grimes','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'lgT7zWr7nS',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(87,'Johanna','Kuvalis','212-705-0250','1987-02-21 00:00:00','m','7206 Wunsch Road Apt. 910\nEast Marciaton, MN 86569-1658','ibayer@example.net','gwhite','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'FsHGc6iyee',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(88,'Jermey','Pfeffer','+19786079749','1988-09-27 00:00:00','o','3192 Brigitte Isle Suite 350\nNorth Presley, ND 28142-9268','mcglynn.koby@example.com','emelie02','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'3fnhyhkwhV',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(89,'Keely','Reilly','+1 (814) 508-2655','2008-11-06 00:00:00','f','22051 Greta Overpass\nAngelineville, WY 04608','tlind@example.net','madaline28','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'k3I4U2flbo',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(90,'Elmore','Brakus','1-617-467-4820','1975-01-25 00:00:00','o','731 Tyreek Rapid Suite 965\nPort Richmond, RI 66695-7603','dkozey@example.net','dovie26','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'dZB6zOrteZ',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(91,'Immanuel','Cormier','1-201-540-4251','2009-07-18 00:00:00','f','5971 Terrill Valleys\nMurrayside, GA 76219-5513','aruecker@example.com','tatyana.koss','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'MjY8prTcBI',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(92,'Bernita','Champlin','(248) 290-5209','2022-11-26 00:00:00','m','9666 Morar Station Apt. 477\nReingerland, GA 12589','leuschke.helmer@example.net','kunze.thalia','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'XHOmA75Stv',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(93,'Vickie','Cruickshank','813.418.2652','2012-01-25 00:00:00','f','5592 Violet Flats\nGreenholtbury, MN 94137-5852','eleanora67@example.com','fpadberg','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'6kOnr94EAI',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(94,'Doug','Runte','+14233223373','1992-11-16 00:00:00','m','87756 Nicklaus Haven Apt. 755\nNorth Afton, ID 33030-1513','johnson.haley@example.net','destin.mueller','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'3f7J9Kn9TR',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(95,'Elva','Lesch','646.818.7801','1985-10-23 00:00:00','o','465 Koepp Hollow Suite 385\nNew Quinton, NM 00592','adouglas@example.net','qsipes','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'o7SSnFi7yl',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(96,'Julian','Wiegand','+1.352.816.4586','2024-01-31 00:00:00','o','50481 Mitchel Dale Apt. 465\nEldredside, IL 13734-8807','blanca.hauck@example.com','tarmstrong','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'A9M2bMXeEz',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(97,'Leopold','Yundt','435-631-3394','1998-02-28 00:00:00','f','3562 Myra Rapids Apt. 536\nAdelemouth, ND 56401-1981','kirk.lockman@example.net','halle89','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'mgifrjD1zU',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(98,'Abbey','Balistreri','(559) 312-5721','1994-04-21 00:00:00','o','9695 Cordia View\nWolfstad, KS 51017-7909','ullrich.electa@example.net','markus60','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Dp47Gcgznk',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(99,'Adelia','Reinger','(530) 879-5236','1980-02-23 00:00:00','o','73015 Hammes Parkways Apt. 365\nWatsicaberg, NE 77204-9868','hickle.eliezer@example.com','marlene.hessel','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'IcKK3BBeFq',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(100,'Brendan','Lindgren','+1.970.326.7924','2008-07-04 00:00:00','f','22788 Swaniawski Pine\nLake Lavern, VT 90772','turner.murray@example.org','ohayes','2024-06-03 11:06:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'O93RbOHvdi',NULL,NULL,NULL,'2024-06-03 11:06:49','2024-06-03 11:06:49'),(101,'prajwol','shakya','1234567891','2009-06-05 02:05:00','m','ktn','prajwol@gmail.com','prajwol',NULL,'$2y$10$yhlzG1RigVlVTEinvKp5feYjhsudlhVWPD264JWU33AdYhxWuQAtC','user',NULL,NULL,NULL,101,'2024-06-03 11:11:17','2024-06-03 12:08:23');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'artistmanagement'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-03 23:43:57
