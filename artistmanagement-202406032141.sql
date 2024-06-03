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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'test',2012,4,'1990-07-12 00:00:00','m','ktm','2024-06-03 08:32:21',NULL,NULL,'2024-06-03 08:29:13','2024-06-03 08:30:48'),(2,'test',2012,6,'1990-07-12 00:00:00','m','ktm','2024-06-03 10:09:53',101,101,'2024-06-03 08:30:35','2024-06-03 09:29:11'),(3,'test',2012,4,'1990-07-12 00:00:00','m','ktm','2024-06-03 10:09:50',101,NULL,'2024-06-03 09:54:06','2024-06-03 09:54:06'),(4,'test',2012,4,'1990-07-12 00:00:00','m','ktm',NULL,101,NULL,'2024-06-03 09:54:41','2024-06-03 09:54:41');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (1,'sdd','sdd','country',2,NULL,101,NULL,'2024-06-03 08:32:32','2024-06-03 08:35:23'),(2,'prajwol','asd','classics',2,101,NULL,NULL,'2024-06-03 08:35:46',NULL);
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
INSERT INTO `oauth_access_tokens` VALUES ('47ff5faeabb87e44d269fe930ef771b60b2655f478121907efb63c2f57705bb29bbe6c2afccac9d1',101,1,'Personal Access Token','[]',1,'2024-06-03 09:41:41','2024-06-03 09:43:01','2025-06-03 15:26:41'),('542e9c661b34bdfddbd6e8712e9f24a2d5d6ee092ad64f1ef1a595355d6be2557a0880728a3df8d7',101,1,'Personal Access Token','[]',1,'2024-06-03 08:15:50','2024-06-03 09:39:53','2025-06-03 14:00:50'),('f6d0bca3bdabcbfc5b67c39516bee49d972937464b50cf6a487cbe912c0164886b9d8ea76ceae61a',101,1,'Personal Access Token','[]',0,'2024-06-03 09:44:36','2024-06-03 09:44:36','2025-06-03 15:29:36');
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
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','n8XQTxUPgepFf2QlKsk8EQdycEUdoPGFd2OdjKAq',NULL,'http://localhost',1,0,0,'2024-06-03 08:14:07','2024-06-03 08:14:07');
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
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2024-06-03 08:14:07','2024-06-03 08:14:07');
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
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` datetime NOT NULL,
  `gender` enum('m','f','o') COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Brittany','Wyman','+1 (561) 904-8052','2020-05-31 00:00:00','o','874 Carroll Port Suite 498\nWest Charleyton, WY 78764-8114','sarai.stoltenberg@example.com','anissa99','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','gBkkJ3FEGL',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(2,'Shawna','Pfeffer','+1-559-907-4938','1970-10-06 00:00:00','m','62022 Lockman Stream Suite 420\nRahsaanberg, MA 58939','alittle@example.org','peggie.kuhlman','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','T3aSHivLJa',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(3,'Verner','Rempel','1-458-538-1053','2014-01-21 00:00:00','o','8249 Pollich Square Apt. 409\nNew Lunashire, MT 51983-2972','erik30@example.com','kacey11','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','mifcBq1eKV',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(4,'Stacey','Casper','+15408749505','1986-07-29 00:00:00','f','8999 Jacques Islands Suite 794\nLake Herta, TN 47356','buckridge.hulda@example.org','osenger','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','1ItwOtszI6',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(5,'Romaine','Mayert','940.689.8732','2005-01-19 00:00:00','f','708 Gottlieb Islands Suite 883\nRusselview, KS 77189','torey01@example.net','jrenner','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','KVtgM6ZarJ',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(6,'Jovany','Goyette','+1.520.981.7987','1986-03-21 00:00:00','o','92493 Champlin Dale\nDoylehaven, ME 15428','domenica.lueilwitz@example.net','aurore23','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','jytAgNx5V5',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(7,'Olaf','Welch','+1-828-415-1510','2001-01-15 00:00:00','f','480 Jakubowski Springs Suite 415\nNew Elnora, WV 10351-3518','johann02@example.com','caitlyn.skiles','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','VricctyoHb',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(8,'Jayme','Kunde','+1.520.275.2582','1989-04-14 00:00:00','f','75061 Rey Meadow Apt. 135\nLake Ricky, CA 17242-3176','vandervort.colt@example.net','dhegmann','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','mkIxITVKxZ',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(9,'Dillan','Brekke','+1-517-587-5215','2013-06-16 00:00:00','o','2385 Kulas Causeway\nJasenville, UT 42357','hsanford@example.org','mark15','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','uiDK5jsBRu',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(10,'Vella','Wilkinson','+15416724188','2006-08-10 00:00:00','m','5709 Lia Ports\nDanielleburgh, AZ 32245-7694','sporer.dominic@example.org','margarett.ratke','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','lHNTDofHK6',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(11,'Martine','Metz','508.688.7241','1991-11-16 00:00:00','m','321 Camylle Manors\nNew Aidenview, NJ 20773-1657','sage91@example.net','casper.zora','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','NatBtgso1y',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(12,'June','Schuppe','+1.361.789.8016','2014-03-10 00:00:00','f','1650 Doyle Curve\nNew Jefferyshire, CA 20510-6383','adeckow@example.org','alverta16','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','IMvhkrvt3P',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(13,'Elinore','Kulas','949.310.5255','2015-06-15 00:00:00','f','5938 Leilani Lane\nWest Katelin, HI 49979-0429','cielo67@example.com','garland74','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','lFDQ1WmwKs',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(14,'Elaina','Bailey','+1 (315) 363-6463','2023-09-26 00:00:00','m','65960 Ben Freeway Suite 557\nEloisaberg, NC 58315','smcdermott@example.org','providenci95','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','HoaDKOXTLI',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(15,'Markus','Paucek','(319) 221-3742','2003-01-13 00:00:00','f','62759 Hoeger Village\nPort Charlie, SD 14541','zbartoletti@example.net','okoepp','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','dUmYRwZWBW',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(16,'Arely','Roob','+15135718202','1990-05-10 00:00:00','o','998 Annetta Grove Apt. 049\nWiegandburgh, AK 50315','jackeline41@example.net','schuppe.kelsie','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','zOXeHxbz8z',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(17,'Novella','Kassulke','470.933.7560','1986-07-15 00:00:00','f','94486 Orn Spurs\nNoblefort, UT 71765-4345','verlie.gibson@example.com','jed.hauck','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','edOuR4AVCM',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(18,'Shanna','Cronin','+1.678.614.0239','2008-11-16 00:00:00','o','391 Bessie Loop Apt. 806\nNew Joaquin, ND 98833-1872','lschowalter@example.com','rosalia70','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','s4GUkbeHxo',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(19,'Franco','McKenzie','+1-386-364-4185','1984-12-18 00:00:00','o','44931 Sporer Parkway\nJacobsside, FL 39720-3171','billie38@example.net','wallace.goodwin','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','SUs21t57oW',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(20,'Augustine','Jacobson','351-906-3610','2017-12-24 00:00:00','m','616 Greenfelder Mountain Suite 332\nBergeland, MN 30361','treva26@example.org','monica67','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','NBUzm2hDIr',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(21,'Roxanne','Corwin','(339) 874-0849','1970-08-04 00:00:00','o','9459 Germaine Estate Suite 919\nGlovermouth, VA 46668-1556','voreilly@example.com','npfannerstill','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','z9jMI4Thva',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(22,'Araceli','Huel','+1 (618) 480-3019','1978-11-13 00:00:00','o','453 Abigail Branch\nSouth Dillanbury, NJ 46575','rutherford.madelyn@example.com','evangeline.bayer','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','b8rUt35AgR',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(23,'Rosina','Nitzsche','+1.831.970.1150','1970-07-21 00:00:00','o','84966 Clinton Ridge Apt. 983\nHammesfurt, ND 25770-0017','ziemann.bryon@example.com','harley13','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','hnlbFLey2P',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(24,'Samanta','Fritsch','(678) 267-8347','2018-03-28 00:00:00','m','9594 Skiles Ville\nSouth Kevonburgh, NV 81022','billie.homenick@example.org','hadams','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','s62w73L8lY',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(25,'Jaleel','Nienow','+1.701.909.8731','2021-02-15 00:00:00','m','6758 Kuvalis Square Suite 391\nWeldonshire, VA 38216','mariane18@example.org','runolfsson.alexandre','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','YErx0IgM7Q',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(26,'Cicero','Schimmel','678.692.8241','2004-07-16 00:00:00','o','96744 Davion Lodge Suite 602\nWehnerstad, PA 91957','neha.littel@example.net','ocrist','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','eWGZjX4Pmx',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(27,'Jamir','Towne','1-938-909-1101','2002-09-29 00:00:00','m','54044 Hoeger Drive\nLangworthview, IL 75152','bernadine.beahan@example.com','blaise.wyman','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','K9GXNyCHOY',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(28,'Zachary','Beahan','802.552.6942','2009-07-16 00:00:00','f','7131 Bergnaum Road\nPort Kirstinstad, VT 33109','schristiansen@example.org','stefanie65','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','DYhGFx0N0q',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(29,'Terrill','Predovic','651-551-9192','1993-06-04 00:00:00','o','7132 Littel Via Suite 547\nWest Daphnee, RI 21651','borer.darryl@example.net','anya.romaguera','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','xprY2roMq7',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(30,'Lacy','Haag','+1 (805) 926-2221','2018-05-21 00:00:00','f','287 Abshire Square Suite 331\nLake Ivaville, NY 43251','rohan.kaela@example.org','kolby66','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','2HxkZEkXwS',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(31,'Easter','Walter','947-998-5614','2018-07-07 00:00:00','m','318 McDermott Plain Apt. 401\nHeaneyshire, NV 96746-0248','lenore32@example.com','nrogahn','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ZlpvkqTeZB',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(32,'Lauriane','Lindgren','831-871-6021','2012-01-18 00:00:00','o','3108 Terry Centers Suite 418\nAdamsburgh, DC 75463-6296','mreinger@example.net','charley31','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Ceo2xLoBEQ',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(33,'Bradly','Kuphal','1-626-488-8797','2023-09-20 00:00:00','o','8336 White Junction Suite 585\nSouth Cale, DE 67708','chelsea.bartoletti@example.com','zlehner','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rOxmxEeMjk',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(34,'Randy','Wiza','865-589-3834','1994-09-01 00:00:00','m','26028 Brakus Mountain\nScotside, KS 37345','pacocha.randy@example.org','bonnie.murphy','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','4ie6SW9J6D',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(35,'Elian','Rutherford','762-224-2277','2004-02-20 00:00:00','o','2348 Adams Port\nTorpburgh, AR 03076-9231','felix.hane@example.net','kessler.richie','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fEUeY13QaF',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(36,'Kobe','Glover','217.618.4804','1991-02-26 00:00:00','f','8742 Doris Alley\nLake Candiceville, HI 73951-2483','arnold84@example.com','brandi.altenwerth','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','oNIxPzHWXc',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(37,'Drew','Kunde','1-980-740-2696','2022-11-05 00:00:00','o','707 Jordyn Rue Suite 855\nCartwrightchester, NH 61728-9035','presley08@example.net','kerluke.waylon','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','bIo8zGzT0E',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(38,'Isabel','Durgan','+1-641-752-1205','1980-04-18 00:00:00','o','4514 Kihn Falls\nCronafurt, RI 89684-3419','zcollier@example.net','homenick.yesenia','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','DtB1xjiOsC',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(39,'Jacky','Fay','940.208.3274','1996-02-26 00:00:00','f','9651 West Rapid\nRuntestad, NV 42491-3224','shany.skiles@example.net','maud91','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qPXMVU5GeU',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(40,'Garth','Hoeger','+1.785.791.2405','2000-02-16 00:00:00','f','94843 Lewis Village\nIrwinchester, DC 74482-3094','pratke@example.org','wilderman.amari','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','evuW9uADT0',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(41,'Onie','Greenholt','(323) 697-6332','2020-12-23 00:00:00','o','249 Gislason Spur Suite 211\nJermeyfurt, MD 26882-6513','chet43@example.net','gerhold.edmund','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','zn3t3eV0j1',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(42,'Ona','Torp','517-663-7522','2010-02-04 00:00:00','m','643 Gideon Turnpike\nNew Rethashire, WI 34371-7218','mmayer@example.net','weissnat.graciela','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','moLQA9Q0RS',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(43,'Dexter','Swift','+14323355208','1995-01-02 00:00:00','o','2247 Welch Stravenue\nPort Lylamouth, LA 62252-5621','jerde.willa@example.org','rohan.ubaldo','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','HtwJa5OK0K',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(44,'Fiona','Douglas','+13647546490','1980-06-13 00:00:00','m','36696 Jordane Mountain Apt. 782\nLake Myafurt, HI 65393-4980','desiree28@example.org','freeman.kemmer','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','WiDnv8KXSH',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(45,'Pattie','Terry','+1-386-985-1639','1980-10-11 00:00:00','f','636 Cassin Neck\nHesselbury, PA 24838-6095','batz.horace@example.com','bsanford','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','TO9Fnxb6TN',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(46,'Assunta','Bode','231-430-9142','1986-11-04 00:00:00','f','3015 Moore Springs Apt. 876\nAnnieville, SD 62205','marjorie.morissette@example.com','tillman.arely','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','s2A8XaiZWV',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(47,'Hollis','Wintheiser','(769) 792-2499','1996-04-07 00:00:00','m','77098 Jayme Station\nMikaylaville, TX 92019-3437','lori.wolff@example.org','norene.connelly','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','BhYPzdsH5p',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(48,'Jackeline','Durgan','854.391.6672','1970-08-02 00:00:00','o','169 Fadel Grove\nNew Raymond, SC 53419','romaguera.rosina@example.com','eloisa.streich','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','KVlzWUaGur',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(49,'Damian','McDermott','762-908-0907','2021-04-05 00:00:00','m','593 Maurice Corner\nNorth Jerod, SC 02405','wiegand.verda@example.org','hailey.altenwerth','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','r0aCjzNFnS',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(50,'Macie','Konopelski','+1 (615) 399-8433','2021-11-26 00:00:00','m','4330 Jenkins Burg Apt. 974\nNew Rocioberg, AL 24788','michelle93@example.net','schiller.alessia','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','cOHimtoSY9',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(51,'Margarette','Goldner','602.273.2850','2019-04-14 00:00:00','f','314 Franecki Meadows\nVirgilside, CO 39778','wrippin@example.com','rau.bonnie','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','LLBX2s0ZXI',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(52,'Enrique','Terry','(445) 656-6524','2009-06-14 00:00:00','f','2223 Constantin Crossing Suite 572\nSouth Kiera, MD 56938-3870','uwalsh@example.com','konopelski.raul','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qX4Ffw96DT',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(53,'Frederic','Auer','256-547-8975','1997-02-05 00:00:00','m','5910 Meta Radial Apt. 053\nWestshire, NE 38569-1418','garry25@example.com','kcruickshank','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','FdaTvgmQiS',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(54,'Clifton','Leuschke','+1-580-806-2105','1995-06-11 00:00:00','o','464 Kathleen Meadows Apt. 545\nIsabelhaven, AZ 21031','christiansen.keaton@example.com','srempel','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','pvGI09VlqV',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(55,'Ora','Hagenes','920-755-6650','1970-08-22 00:00:00','o','689 Louie Keys\nVedaport, ME 70876-1743','kirstin35@example.net','stracke.aaliyah','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','IE1G3GKPHp',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(56,'Pat','Hauck','1-360-217-8459','1998-06-02 00:00:00','f','7883 Arjun Heights Apt. 021\nLake Arianna, CA 51378','lgleason@example.net','jlynch','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','izsCtpJngW',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(57,'Beaulah','Hand','(765) 744-5364','1985-01-18 00:00:00','o','44943 Fahey Route Suite 895\nClaudineview, FL 09981','runolfsdottir.yasmin@example.org','grayson.schmidt','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','2NCF0J7riZ',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(58,'Chet','Durgan','+1 (607) 461-5582','1973-08-30 00:00:00','f','919 Beer Row\nBayerfurt, UT 53301-6089','muller.fiona@example.net','wyman.harold','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','d8lUCgqUip',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(59,'Orrin','Weber','(947) 739-2561','1983-10-03 00:00:00','f','97928 Carli Mall Suite 589\nBergeside, VT 75463-6227','delores53@example.com','carroll.jayda','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','CwFir7o39z',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(60,'Aniyah','Johnston','1-918-920-0637','2006-11-07 00:00:00','f','48040 Emmanuelle Circles Apt. 986\nBeerbury, LA 29954-9822','helen79@example.com','madisen.leffler','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','26VP9aJaKD',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(61,'Margie','Spinka','1-832-833-6511','2001-12-30 00:00:00','o','30494 Hane Junction\nKonopelskiport, TN 80450-9028','npagac@example.org','zorn','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','sNBw7thFOA',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(62,'Yesenia','Pfannerstill','+1-956-888-6024','1970-10-13 00:00:00','o','2681 Macie Radial\nPort Jany, NE 66232-2290','turcotte.emmet@example.net','hahn.emmalee','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','XwH7nNtmrQ',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(63,'Pablo','Aufderhar','(605) 673-1177','1990-08-27 00:00:00','f','9964 Alaina Mill Apt. 284\nLake Barney, IA 33321','bstiedemann@example.net','carter.estefania','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','HQrGETvZ6r',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(64,'Yasmin','Cremin','762.393.1871','1981-11-13 00:00:00','f','7439 O\'Reilly Glens\nTurnerhaven, VA 51247','gortiz@example.net','cleveland.senger','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','M852PCOt25',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(65,'Travis','Gerlach','+13466217721','2004-11-14 00:00:00','o','5829 Kozey Locks\nNew Eulaliachester, UT 16703','eparisian@example.org','jacey.osinski','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fyuMe5sq5q',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(66,'Wilton','Goldner','1-520-905-2505','2002-05-05 00:00:00','f','568 Vanessa Vista\nWest Laurettahaven, UT 98636-1625','chauncey.parker@example.org','alize88','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','davA9ddDtq',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(67,'Rhianna','Brown','+1 (252) 406-9627','1989-08-14 00:00:00','m','6877 Giovanni Oval\nPort Emmanuelle, MD 22713','vandervort.kassandra@example.com','gtillman','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','p3IRGgG20X',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(68,'Hilma','Hill','1-848-874-9065','1979-06-30 00:00:00','f','2792 Conn Wells Apt. 531\nNew Assunta, RI 87157','wkuvalis@example.org','ivy55','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','lrZaAYtzGj',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(69,'Adonis','Skiles','484-663-9848','2017-03-01 00:00:00','f','82778 Autumn Plain Apt. 783\nWest Tiara, KS 83007','devan.zboncak@example.net','henri33','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','3ZUulXldLW',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(70,'Quentin','Glover','+1 (970) 912-9687','2001-07-04 00:00:00','o','9404 Torrey Vista Suite 178\nEbertbury, NV 63142-8158','jaqueline.leannon@example.com','grayson43','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ofgWsjnKxj',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(71,'Dolores','Heaney','+1-404-278-1926','1976-12-17 00:00:00','f','17092 Nolan Estates Suite 623\nWest Dexter, MD 36235','mosciski.israel@example.net','adrianna58','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','wj7RTirrZe',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(72,'Anahi','Carroll','(269) 325-5441','2024-04-25 00:00:00','m','66493 Reggie Track Suite 366\nKuhicville, MS 13650-8247','rowena.stokes@example.org','schmeler.henry','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','5laNPfwT0O',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(73,'Annalise','Kuphal','804-731-9478','2007-07-05 00:00:00','f','13433 Arno Lodge\nNorth Leonora, MD 03944-2052','alexa.blanda@example.com','carmine.nicolas','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','hs9K8DKPiP',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(74,'Jettie','Schowalter','+1-720-276-7031','1977-04-13 00:00:00','f','87352 Tiara Port\nLake Hiram, IA 19566','wmante@example.com','gstreich','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ffrkPkO7Mp',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(75,'Waino','Hermiston','934.319.8159','1979-07-23 00:00:00','o','7701 O\'Hara Run\nJaymeton, OR 08823','bradly81@example.org','king.myrna','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','EbdZgOrtOh',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(76,'Elinore','Purdy','475-905-0816','1990-09-17 00:00:00','f','32065 Kerluke Walks Suite 775\nWest Annaliseport, ND 93236-0215','aconsidine@example.com','bryce.waters','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','LW4xtFD6W7',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(77,'Meaghan','Hansen','+1.689.246.2098','2011-09-29 00:00:00','m','15343 Tatyana Plaza Suite 836\nNew Darrin, HI 48808','gjaskolski@example.com','metz.pascale','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','kfryBosRpU',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(78,'Nelle','Gorczany','321.515.9768','2006-12-06 00:00:00','f','50052 Pouros Pine Suite 279\nEast Damion, SC 69792-4289','evalyn.leannon@example.org','fwilkinson','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','jFkiYJgDVM',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(79,'Nicola','Kreiger','+1-413-430-9826','2018-07-25 00:00:00','f','411 Katherine Drive\nNew Jacinto, OH 94057','connelly.gladys@example.org','estella82','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','1Wm0KBxSMU',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(80,'Annabel','Quitzon','+1-334-803-4517','2011-05-04 00:00:00','f','372 Arlene Burgs\nLake Percyshire, PA 89171','hettie06@example.org','miguel.halvorson','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','FyBcjRp01Q',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(81,'Dianna','Lebsack','262-849-3312','1985-08-31 00:00:00','o','954 Keara Parks Suite 030\nNorth Camila, ND 20018','raymundo01@example.com','antonia59','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','p2NIKSlOGU',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(82,'Abagail','Pagac','(931) 876-0762','2023-11-25 00:00:00','o','250 Block Park\nRunolfssonfurt, OR 46950-7013','camren.streich@example.com','ashly29','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','oSc471fDVH',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(83,'Carmine','Douglas','+1 (272) 820-8749','1975-02-05 00:00:00','f','7288 Phyllis Course Apt. 236\nBoehmside, IL 75296-6456','gleichner.maria@example.net','celestine.smitham','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','bjqjpln5TK',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(84,'Bianka','Hudson','+1.956.412.1466','1998-06-20 00:00:00','f','8093 Beth Manor Apt. 122\nChaseside, MI 15865-6965','jones.madaline@example.com','fwolf','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','lDpr7sp9px',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(85,'Randal','Wiegand','+1-534-229-8372','2010-03-23 00:00:00','m','2746 Elinor Curve Suite 836\nNorth Rosalee, MS 78141','fkoss@example.org','deja48','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','CQJq1Awzz2',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(86,'Hadley','Kshlerin','+1-820-931-2600','1983-02-01 00:00:00','o','3023 Rebekah Lakes\nNorth Jordyn, ME 89688','kemmer.lenore@example.com','mariana.shields','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','vYYlJjOrXe',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(87,'Moriah','Zboncak','1-762-341-5186','1978-11-29 00:00:00','f','8886 Williamson Haven\nLake Clementfort, NC 08610-8606','ondricka.jennyfer@example.com','obarrows','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','6SdMVlevUC',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(88,'Rodrick','Kulas','+1.615.962.8486','1998-07-10 00:00:00','m','356 Breitenberg Wall Suite 405\nNorth Ashleighhaven, WV 29822','jgreen@example.net','icrist','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','dvUIalZIbP',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(89,'Mary','Stokes','+1-559-348-6900','2006-11-30 00:00:00','o','57459 Shawna Port\nWeissnatstad, WA 96684','green.elza@example.net','nrunolfsdottir','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','r55NRTRTzH',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(90,'Tyreek','Herzog','+1.660.556.6747','2010-01-18 00:00:00','f','178 Imani Port Suite 404\nLake Fosterchester, TN 90375','eugenia77@example.com','obartell','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rAMXl3pbfm',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(91,'Sonya','Rosenbaum','+1.281.580.8385','2014-03-06 00:00:00','f','56366 Rath Motorway Suite 062\nSchambergerport, NH 27747-9652','jaskolski.joy@example.com','katelyn79','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Yd72DJ1rU3',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(92,'Jaquan','West','+1-986-882-1297','1990-02-16 00:00:00','f','9594 McKenzie Mountain Suite 840\nOralmouth, MD 41009','bheaney@example.org','frami.tara','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','4wYTNqfVxF',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(93,'Fredy','Thiel','+1-336-624-6708','2003-09-27 00:00:00','f','39500 Gislason Manors Apt. 464\nHoppehaven, NM 84533-2773','prohaska.rhea@example.org','kyla.schmitt','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','lWZzgVDl4l',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(94,'Yolanda','Donnelly','380-445-7626','2016-10-24 00:00:00','m','292 Gavin Creek\nHillardton, AR 35772','ashton.west@example.com','gunner91','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','sXZk3LFAaI',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(95,'Marie','Gerlach','+1-717-338-0065','1995-05-01 00:00:00','f','932 Ashton Forest\nSouth Ricky, KS 19333-3496','sydnie66@example.net','xwillms','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','S1gMY6uLow',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(96,'Vince','Frami','480.591.0110','1999-01-21 00:00:00','o','9626 Tito Loop Apt. 742\nMoriahfurt, CO 11155-7635','ecormier@example.net','adams.hilton','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','aoGGVeLBc3',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(97,'Mckenzie','Zboncak','+1 (585) 898-0812','1998-06-25 00:00:00','f','895 Olson Freeway Apt. 461\nHildegardview, VA 69597-1883','clarabelle.denesik@example.net','lonny99','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','k77pfyxfdA',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(98,'Derek','Kris','(732) 464-7106','2018-11-23 00:00:00','m','11866 Thiel Springs\nLake Warrenhaven, WA 45345-6690','ecruickshank@example.com','hassie62','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','v2SnXy3qFw',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(99,'Joanny','Langworth','971-816-1071','2009-09-16 00:00:00','f','20925 Domenick Ranch Apt. 572\nCarrollstad, MA 46104','bosco.felicity@example.org','eyost','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','XhUbyQor67',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(100,'Rosemarie','Lemke','1-928-313-9603','1976-03-06 00:00:00','o','3672 Hessel Park\nSouth Torey, TN 30829-2301','bvon@example.org','myriam.hane','2024-06-03 08:14:00','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qGnoxFQcP3',NULL,NULL,NULL,'2024-06-03 08:14:00','2024-06-03 08:14:00'),(101,'prajwol','shakay','1234567891','2012-05-03 01:55:00','m','ktm','prajwol@gmail.com','prajwol',NULL,'$2y$10$8nU/DMUU9s2c3QEsKUXye.WTx57OZeDmLrK4YzlmNH1xFmHQ43eMK',NULL,NULL,NULL,101,'2024-06-03 08:15:39','2024-06-03 08:16:40');
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

-- Dump completed on 2024-06-03 21:41:48
