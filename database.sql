-- MySQL dump 10.13  Distrib 8.4.4, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: miranda
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'nPYEZSMPt3Z7M9SQlr9uWqz5gjkEULmS',1,'2025-07-27 20:45:43','2025-07-27 20:45:43','2025-07-27 20:45:43');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actor_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'General',0,'Rerum placeat incidunt quis quae suscipit aut unde. Velit provident autem qui amet. Corrupti nisi ea corporis possimus est eligendi veritatis tempore.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2025-07-27 20:45:09','2025-07-27 20:45:09'),(2,'Hotel',0,'At et facere praesentium. Occaecati iure dolor sint facilis quam illo. Delectus consequatur ullam cumque nihil.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-07-27 20:45:09','2025-07-27 20:45:09'),(3,'Booking',0,'Tenetur mollitia et error et temporibus nihil. Sit ut suscipit eum numquam. Minus dignissimos temporibus placeat sed et fuga alias.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-07-27 20:45:09','2025-07-27 20:45:09'),(4,'Resort',0,'Cupiditate eaque unde dolor qui deleniti aut. Voluptatem earum sunt distinctio tempore. Molestias omnis aut optio cupiditate. Sint aperiam aut aspernatur voluptate velit repellendus.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-07-27 20:45:09','2025-07-27 20:45:09'),(5,'Travel',0,'Eaque quia enim qui earum corrupti exercitationem quia. Incidunt repudiandae consectetur non voluptas illum. Ad dolor incidunt inventore est. Sint consectetur nesciunt molestiae nostrum dolorum aut.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-07-27 20:45:09','2025-07-27 20:45:09');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_tokens`
--

DROP TABLE IF EXISTS `device_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_tokens_token_unique` (`token`),
  KEY `device_tokens_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `device_tokens_platform_is_active_index` (`platform`,`is_active`),
  KEY `device_tokens_is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_tokens`
--

LOCK TABLES `device_tokens` WRITE;
/*!40000 ALTER TABLE `device_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Duplex Restaurant','Corrupti quae sequi debitis. Molestias vitae ipsa dolore omnis. Nihil vitae mollitia est officia qui fugit autem aut.',1,0,'galleries/01.jpg',1,'published','2025-07-27 20:45:42','2025-07-27 20:45:42'),(2,'Luxury room','Enim qui sed odio ea. Ut distinctio sed quas laborum. Laudantium sit error vel ipsa non reiciendis. Beatae illo officiis est repellendus.',1,0,'galleries/02.jpg',1,'published','2025-07-27 20:45:42','2025-07-27 20:45:42'),(3,'Pacific Room','Dolorum sed amet aut. Sequi nihil sint minus quidem. Praesentium et sunt quia sint.',1,0,'galleries/03.jpg',1,'published','2025-07-27 20:45:42','2025-07-27 20:45:42'),(4,'Family Room','Consectetur nesciunt quo soluta sequi. Consequatur sint laborum est praesentium sint. Et voluptas odit enim voluptatem natus quo.',1,0,'galleries/04.jpg',1,'published','2025-07-27 20:45:42','2025-07-27 20:45:42'),(5,'King Bed','Exercitationem maiores et dolor architecto non possimus nulla. Molestias consectetur occaecati exercitationem officia quam nesciunt quasi dolore.',1,0,'galleries/05.jpg',1,'published','2025-07-27 20:45:42','2025-07-27 20:45:42'),(6,'Special Foods','Ea numquam ut accusamus laudantium quas repellendus. Sunt dignissimos vel ipsa voluptas odit voluptas vitae neque. Quis nobis quae suscipit.',1,0,'galleries/06.jpg',1,'published','2025-07-27 20:45:42','2025-07-27 20:45:42');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'\"[{\\\"img\\\":\\\"galleries\\\\\\/01.jpg\\\",\\\"description\\\":\\\"Asperiores saepe maxime distinctio suscipit aut beatae sit recusandae. Et veniam veniam magni eos inventore in sit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/02.jpg\\\",\\\"description\\\":\\\"Quod voluptatem culpa et repudiandae est sunt. Adipisci sapiente voluptatum ad dolorem. Sapiente consequatur magni blanditiis qui rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/03.jpg\\\",\\\"description\\\":\\\"Officiis soluta non ut error fugiat. Facere iusto corrupti ut dolorem quaerat necessitatibus. Quaerat laboriosam corrupti aliquam aut est omnis sed.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/04.jpg\\\",\\\"description\\\":\\\"Nostrum et praesentium sint quis ea voluptatem. Sint voluptatem aspernatur odio quod maxime. Ratione officiis debitis eum voluptate minima officiis.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/05.jpg\\\",\\\"description\\\":\\\"Similique atque nesciunt possimus quo quos soluta. Ducimus non sed aut dolor minus asperiores optio.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/06.jpg\\\",\\\"description\\\":\\\"Sed adipisci vitae qui omnis a. Veniam rerum eum dolor ullam omnis sunt. Modi aut inventore dolores. Cupiditate impedit explicabo reiciendis velit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/07.jpg\\\",\\\"description\\\":\\\"Veritatis sit ad aspernatur totam deserunt quas. Fugit numquam recusandae et accusamus possimus sed. Cum quis nemo aliquid non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/08.jpg\\\",\\\"description\\\":\\\"Non quis vel qui. Debitis sunt maiores doloribus est laboriosam et consectetur. Sed est asperiores ab quaerat.\\\"}]\"',1,'Botble\\Gallery\\Models\\Gallery','2025-07-27 20:45:42','2025-07-27 20:45:42'),(2,'\"[{\\\"img\\\":\\\"galleries\\\\\\/01.jpg\\\",\\\"description\\\":\\\"Asperiores saepe maxime distinctio suscipit aut beatae sit recusandae. Et veniam veniam magni eos inventore in sit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/02.jpg\\\",\\\"description\\\":\\\"Quod voluptatem culpa et repudiandae est sunt. Adipisci sapiente voluptatum ad dolorem. Sapiente consequatur magni blanditiis qui rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/03.jpg\\\",\\\"description\\\":\\\"Officiis soluta non ut error fugiat. Facere iusto corrupti ut dolorem quaerat necessitatibus. Quaerat laboriosam corrupti aliquam aut est omnis sed.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/04.jpg\\\",\\\"description\\\":\\\"Nostrum et praesentium sint quis ea voluptatem. Sint voluptatem aspernatur odio quod maxime. Ratione officiis debitis eum voluptate minima officiis.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/05.jpg\\\",\\\"description\\\":\\\"Similique atque nesciunt possimus quo quos soluta. Ducimus non sed aut dolor minus asperiores optio.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/06.jpg\\\",\\\"description\\\":\\\"Sed adipisci vitae qui omnis a. Veniam rerum eum dolor ullam omnis sunt. Modi aut inventore dolores. Cupiditate impedit explicabo reiciendis velit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/07.jpg\\\",\\\"description\\\":\\\"Veritatis sit ad aspernatur totam deserunt quas. Fugit numquam recusandae et accusamus possimus sed. Cum quis nemo aliquid non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/08.jpg\\\",\\\"description\\\":\\\"Non quis vel qui. Debitis sunt maiores doloribus est laboriosam et consectetur. Sed est asperiores ab quaerat.\\\"}]\"',2,'Botble\\Gallery\\Models\\Gallery','2025-07-27 20:45:42','2025-07-27 20:45:42'),(3,'\"[{\\\"img\\\":\\\"galleries\\\\\\/01.jpg\\\",\\\"description\\\":\\\"Asperiores saepe maxime distinctio suscipit aut beatae sit recusandae. Et veniam veniam magni eos inventore in sit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/02.jpg\\\",\\\"description\\\":\\\"Quod voluptatem culpa et repudiandae est sunt. Adipisci sapiente voluptatum ad dolorem. Sapiente consequatur magni blanditiis qui rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/03.jpg\\\",\\\"description\\\":\\\"Officiis soluta non ut error fugiat. Facere iusto corrupti ut dolorem quaerat necessitatibus. Quaerat laboriosam corrupti aliquam aut est omnis sed.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/04.jpg\\\",\\\"description\\\":\\\"Nostrum et praesentium sint quis ea voluptatem. Sint voluptatem aspernatur odio quod maxime. Ratione officiis debitis eum voluptate minima officiis.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/05.jpg\\\",\\\"description\\\":\\\"Similique atque nesciunt possimus quo quos soluta. Ducimus non sed aut dolor minus asperiores optio.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/06.jpg\\\",\\\"description\\\":\\\"Sed adipisci vitae qui omnis a. Veniam rerum eum dolor ullam omnis sunt. Modi aut inventore dolores. Cupiditate impedit explicabo reiciendis velit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/07.jpg\\\",\\\"description\\\":\\\"Veritatis sit ad aspernatur totam deserunt quas. Fugit numquam recusandae et accusamus possimus sed. Cum quis nemo aliquid non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/08.jpg\\\",\\\"description\\\":\\\"Non quis vel qui. Debitis sunt maiores doloribus est laboriosam et consectetur. Sed est asperiores ab quaerat.\\\"}]\"',3,'Botble\\Gallery\\Models\\Gallery','2025-07-27 20:45:42','2025-07-27 20:45:42'),(4,'\"[{\\\"img\\\":\\\"galleries\\\\\\/01.jpg\\\",\\\"description\\\":\\\"Asperiores saepe maxime distinctio suscipit aut beatae sit recusandae. Et veniam veniam magni eos inventore in sit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/02.jpg\\\",\\\"description\\\":\\\"Quod voluptatem culpa et repudiandae est sunt. Adipisci sapiente voluptatum ad dolorem. Sapiente consequatur magni blanditiis qui rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/03.jpg\\\",\\\"description\\\":\\\"Officiis soluta non ut error fugiat. Facere iusto corrupti ut dolorem quaerat necessitatibus. Quaerat laboriosam corrupti aliquam aut est omnis sed.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/04.jpg\\\",\\\"description\\\":\\\"Nostrum et praesentium sint quis ea voluptatem. Sint voluptatem aspernatur odio quod maxime. Ratione officiis debitis eum voluptate minima officiis.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/05.jpg\\\",\\\"description\\\":\\\"Similique atque nesciunt possimus quo quos soluta. Ducimus non sed aut dolor minus asperiores optio.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/06.jpg\\\",\\\"description\\\":\\\"Sed adipisci vitae qui omnis a. Veniam rerum eum dolor ullam omnis sunt. Modi aut inventore dolores. Cupiditate impedit explicabo reiciendis velit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/07.jpg\\\",\\\"description\\\":\\\"Veritatis sit ad aspernatur totam deserunt quas. Fugit numquam recusandae et accusamus possimus sed. Cum quis nemo aliquid non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/08.jpg\\\",\\\"description\\\":\\\"Non quis vel qui. Debitis sunt maiores doloribus est laboriosam et consectetur. Sed est asperiores ab quaerat.\\\"}]\"',4,'Botble\\Gallery\\Models\\Gallery','2025-07-27 20:45:42','2025-07-27 20:45:42'),(5,'\"[{\\\"img\\\":\\\"galleries\\\\\\/01.jpg\\\",\\\"description\\\":\\\"Asperiores saepe maxime distinctio suscipit aut beatae sit recusandae. Et veniam veniam magni eos inventore in sit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/02.jpg\\\",\\\"description\\\":\\\"Quod voluptatem culpa et repudiandae est sunt. Adipisci sapiente voluptatum ad dolorem. Sapiente consequatur magni blanditiis qui rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/03.jpg\\\",\\\"description\\\":\\\"Officiis soluta non ut error fugiat. Facere iusto corrupti ut dolorem quaerat necessitatibus. Quaerat laboriosam corrupti aliquam aut est omnis sed.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/04.jpg\\\",\\\"description\\\":\\\"Nostrum et praesentium sint quis ea voluptatem. Sint voluptatem aspernatur odio quod maxime. Ratione officiis debitis eum voluptate minima officiis.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/05.jpg\\\",\\\"description\\\":\\\"Similique atque nesciunt possimus quo quos soluta. Ducimus non sed aut dolor minus asperiores optio.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/06.jpg\\\",\\\"description\\\":\\\"Sed adipisci vitae qui omnis a. Veniam rerum eum dolor ullam omnis sunt. Modi aut inventore dolores. Cupiditate impedit explicabo reiciendis velit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/07.jpg\\\",\\\"description\\\":\\\"Veritatis sit ad aspernatur totam deserunt quas. Fugit numquam recusandae et accusamus possimus sed. Cum quis nemo aliquid non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/08.jpg\\\",\\\"description\\\":\\\"Non quis vel qui. Debitis sunt maiores doloribus est laboriosam et consectetur. Sed est asperiores ab quaerat.\\\"}]\"',5,'Botble\\Gallery\\Models\\Gallery','2025-07-27 20:45:42','2025-07-27 20:45:42'),(6,'\"[{\\\"img\\\":\\\"galleries\\\\\\/01.jpg\\\",\\\"description\\\":\\\"Asperiores saepe maxime distinctio suscipit aut beatae sit recusandae. Et veniam veniam magni eos inventore in sit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/02.jpg\\\",\\\"description\\\":\\\"Quod voluptatem culpa et repudiandae est sunt. Adipisci sapiente voluptatum ad dolorem. Sapiente consequatur magni blanditiis qui rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/03.jpg\\\",\\\"description\\\":\\\"Officiis soluta non ut error fugiat. Facere iusto corrupti ut dolorem quaerat necessitatibus. Quaerat laboriosam corrupti aliquam aut est omnis sed.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/04.jpg\\\",\\\"description\\\":\\\"Nostrum et praesentium sint quis ea voluptatem. Sint voluptatem aspernatur odio quod maxime. Ratione officiis debitis eum voluptate minima officiis.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/05.jpg\\\",\\\"description\\\":\\\"Similique atque nesciunt possimus quo quos soluta. Ducimus non sed aut dolor minus asperiores optio.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/06.jpg\\\",\\\"description\\\":\\\"Sed adipisci vitae qui omnis a. Veniam rerum eum dolor ullam omnis sunt. Modi aut inventore dolores. Cupiditate impedit explicabo reiciendis velit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/07.jpg\\\",\\\"description\\\":\\\"Veritatis sit ad aspernatur totam deserunt quas. Fugit numquam recusandae et accusamus possimus sed. Cum quis nemo aliquid non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/08.jpg\\\",\\\"description\\\":\\\"Non quis vel qui. Debitis sunt maiores doloribus est laboriosam et consectetur. Sed est asperiores ab quaerat.\\\"}]\"',6,'Botble\\Gallery\\Models\\Gallery','2025-07-27 20:45:42','2025-07-27 20:45:42');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_amenities`
--

DROP TABLE IF EXISTS `ht_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_amenities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_amenities`
--

LOCK TABLES `ht_amenities` WRITE;
/*!40000 ALTER TABLE `ht_amenities` DISABLE KEYS */;
INSERT INTO `ht_amenities` VALUES (1,'Air conditioner','fal fa-bath','published','2025-07-27 20:45:10','2025-07-27 20:45:10'),(2,'High speed WiFi','fal fa-wifi','published','2025-07-27 20:45:10','2025-07-27 20:45:10'),(3,'Strong Locker','fal fa-key','published','2025-07-27 20:45:10','2025-07-27 20:45:10'),(4,'Breakfast','fal fa-cut','published','2025-07-27 20:45:10','2025-07-27 20:45:10'),(5,'Kitchen','fal fa-guitar','published','2025-07-27 20:45:10','2025-07-27 20:45:10'),(6,'Smart Security','fal fa-lock','published','2025-07-27 20:45:10','2025-07-27 20:45:10'),(7,'Cleaning','fal fa-broom','published','2025-07-27 20:45:10','2025-07-27 20:45:10'),(8,'Shower','fal fa-shower','published','2025-07-27 20:45:10','2025-07-27 20:45:10'),(9,'24/7 Online Support','fal fa-headphones-alt','published','2025-07-27 20:45:10','2025-07-27 20:45:10'),(10,'Grocery','fal fa-shopping-basket','published','2025-07-27 20:45:10','2025-07-27 20:45:10'),(11,'Single bed','fal fa-bed','published','2025-07-27 20:45:10','2025-07-27 20:45:10'),(12,'Expert Team','fal fa-users','published','2025-07-27 20:45:10','2025-07-27 20:45:10'),(13,'Shop near','fal fa-shopping-cart','published','2025-07-27 20:45:10','2025-07-27 20:45:10'),(14,'Towels','fal fa-bus','published','2025-07-27 20:45:10','2025-07-27 20:45:10');
/*!40000 ALTER TABLE `ht_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_amenities_translations`
--

DROP TABLE IF EXISTS `ht_amenities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_amenities_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_amenities_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_amenities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_amenities_translations`
--

LOCK TABLES `ht_amenities_translations` WRITE;
/*!40000 ALTER TABLE `ht_amenities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_amenities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_addresses`
--

DROP TABLE IF EXISTS `ht_booking_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_addresses`
--

LOCK TABLES `ht_booking_addresses` WRITE;
/*!40000 ALTER TABLE `ht_booking_addresses` DISABLE KEYS */;
INSERT INTO `ht_booking_addresses` VALUES (1,'Orland','Witting','1-847-519-7747','aditya.koepp@example.net','Paraguay','Lake Joannytown','North Vanside','97366-3381','4100 Cruz Mill\nDeangeloburgh, NC 93573-4471',1,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(2,'Angelita','Wisozk','1-947-219-9866','anne59@example.org','American Samoa','Keyonstad','East Gerryport','12758','39252 Linnie Villages Apt. 723\nEast Adalineton, MN 43118-8661',2,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(3,'Terrell','Cummerata','+1-908-264-9718','paucek.dejah@example.com','Libyan Arab Jamahiriya','Connhaven','South Sandra','63953','350 Ellen Summit Suite 646\nLake Dereck, UT 01365-8439',3,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(4,'Judge','Robel','432.403.6371','clotilde05@example.org','Slovakia (Slovak Republic)','Kaciview','South Shayleeport','13738-9776','527 Hal Street\nLake Camilla, ND 58601',4,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(5,'Agustin','O\'Connell','+1-952-512-1933','fredy36@example.net','Nauru','Arnoldoview','North Aniyahland','12723-2815','514 Giles Lane Apt. 555\nLake Elinormouth, CT 75688-4327',5,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(6,'Lolita','Kuvalis','1-801-255-5650','haley.imogene@example.org','Estonia','North Trystanburgh','Corytown','82993-7523','8246 Runolfsdottir Corner\nWest Christelle, KS 38145',6,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(7,'Christiana','Weber','469-715-8405','roselyn19@example.com','Barbados','Port Leoneltown','Lake Mabelleland','61983-8873','589 Mitchell Roads\nWolfburgh, AK 66676-6517',7,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(8,'Roy','Heidenreich','+1.770.252.3313','schulist.hoyt@example.com','South Africa','West Marceloville','East Noe','56857','1730 Heller Inlet\nMathildeburgh, MN 41257',8,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(9,'Pasquale','Pfeffer','+1-662-545-4563','eheller@example.com','Comoros','Lake Joanny','Kianaville','77464-6630','239 Jovany Meadow\nSouth Keeleyton, PA 23871',9,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(10,'Sean','Greenholt','+1-781-294-3743','frami.walton@example.net','Tanzania','Port Kraig','Brekkeberg','45273-7996','2153 Cummerata Inlet Apt. 607\nNew Luigi, CT 43795',10,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(11,'Oleta','Mante','1-440-975-6585','koconnell@example.org','Heard Island and McDonald Islands','West Rodborough','Lake Ceasarmouth','81022-7556','6348 Reggie Corner Apt. 174\nEast Rylee, SD 05669-1897',11,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(12,'Jasen','Spencer','252.332.5820','hills.ayana@example.com','Indonesia','Port Allanshire','West Sanford','09531-8610','9833 Jamarcus Center Suite 573\nGorczanybury, TN 00050-3938',12,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(13,'Paul','Champlin','1-814-916-4644','lauriane39@example.net','Nepal','Ullrichchester','Wilfredoside','46746','32547 Buckridge Plains Apt. 742\nPort Laurymouth, KS 47230-4111',13,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(14,'Elwin','Block','(912) 913-2308','sylvia24@example.com','Timor-Leste','Charleneshire','Port Alvina','56489','24862 Franecki Inlet Suite 624\nPort Zulachester, GA 17560',14,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(15,'Gaetano','Weissnat','269-908-8499','kbergnaum@example.com','Malta','Port Burdette','South Helene','82756-8398','10898 Kulas Burg Apt. 627\nLake Forrestmouth, MT 09317',15,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(16,'Teresa','Kuhn','1-479-704-0059','leo82@example.net','Uzbekistan','South Jenniferview','East Wendellton','75964-6265','9775 Parker Port\nJacobsonberg, WA 63403',16,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(17,'Pascale','Rutherford','1-931-265-5389','randall06@example.net','Japan','Jenaville','Weldonbury','77036-2269','342 Doyle Ports\nKayleighshire, IA 27172',17,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(18,'Janie','Wolf','602.558.2253','sammie38@example.org','Monaco','New Chadrickchester','Lake Ulisesshire','06306-8728','442 Larkin Trace Suite 301\nTrevafort, UT 62902',18,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(19,'Leola','Koch','1-838-466-1632','pfeffer.lilly@example.net','Serbia','Borerbury','Coleville','90181-3717','23302 Weissnat Roads Suite 341\nOzellastad, WY 87153-7570',19,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(20,'Kenneth','Dietrich','1-435-828-2438','pshanahan@example.net','Dominican Republic','Lake Esmeraldaberg','Gottliebfurt','29702-0592','77210 Randy Fords\nConniefurt, NC 55730-0450',20,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(21,'Chaim','Volkman','909-767-7863','jamey39@example.net','Anguilla','New Noemibury','Rafaelmouth','94040','494 Chadd Road Suite 889\nEast Jermey, KS 42575-0318',21,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(22,'Lucy','Friesen','+1.410.696.7315','conner04@example.org','Saint Vincent and the Grenadines','Bradtkefort','Lake Codyshire','56681-7670','506 Windler Radial\nLouveniaburgh, NM 13937-1438',22,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(23,'Kirstin','Zulauf','+1 (743) 919-2403','mmaggio@example.org','Central African Republic','North Kamron','Lonniemouth','31103','39260 Ferry Walk\nPort Dereckfort, NC 04052-6853',23,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(24,'Blaze','Hyatt','(651) 430-5879','trycia.harvey@example.com','Japan','Berniecemouth','West Gisselle','27704','869 Harry Court\nHintzberg, UT 27010-2496',24,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(25,'Lane','Weber','(803) 672-6796','guido93@example.org','Senegal','South Justenfurt','Kaitlynstad','70044-8574','71704 Arianna Way Suite 852\nKochland, SD 92456-4924',25,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(26,'Elda','Runolfsson','(614) 900-1637','edyth78@example.com','Tuvalu','Hayestown','Schusterchester','13274','7881 Heaven Key Apt. 675\nSalvatorebury, NE 92551',26,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(27,'Mercedes','Schuster','+17013646406','daniel.corbin@example.net','Uganda','Champlinburgh','North Gennaroside','04267','17531 Bella Shores Apt. 248\nSouth Roxannebury, KY 68151',27,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(28,'Kayden','Grady','+1-570-759-0852','tokon@example.com','Cayman Islands','Ritchiechester','West Alf','08084','61143 Kuhic Springs Apt. 727\nLake Vivianneburgh, CT 12712',28,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(29,'Xzavier','Grimes','516-257-7802','xgutmann@example.com','Western Sahara','Rafaelfort','South Mazie','41582-2026','4676 Maude Tunnel\nLake Holden, IN 15241-6160',29,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(30,'Mariane','Predovic','+1 (731) 469-2890','russ.beer@example.net','San Marino','Pagacland','Port Tyshawnland','96071-6126','1846 Kshlerin Stream Apt. 282\nNorth Fosterland, MO 27903',30,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(31,'Elijah','Denesik','1-443-548-2943','qdare@example.net','Poland','Morarville','Feilton','93961-9682','1120 Marcel Ramp\nNealview, KY 14462-6528',31,'2025-07-27 20:45:53','2025-07-27 20:45:53');
/*!40000 ALTER TABLE `ht_booking_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_foods`
--

DROP TABLE IF EXISTS `ht_booking_foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_foods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `food_id` bigint unsigned NOT NULL,
  `quantity` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_booking_foods_booking_id_food_id_unique` (`booking_id`,`food_id`),
  KEY `ht_booking_foods_booking_id_index` (`booking_id`),
  KEY `ht_booking_foods_food_id_index` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_foods`
--

LOCK TABLES `ht_booking_foods` WRITE;
/*!40000 ALTER TABLE `ht_booking_foods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_booking_foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_rooms`
--

DROP TABLE IF EXISTS `ht_booking_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned DEFAULT NULL,
  `room_image` text COLLATE utf8mb4_unicode_ci,
  `room_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `number_of_rooms` int NOT NULL DEFAULT '1',
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_rooms`
--

LOCK TABLES `ht_booking_rooms` WRITE;
/*!40000 ALTER TABLE `ht_booking_rooms` DISABLE KEYS */;
INSERT INTO `ht_booking_rooms` VALUES (1,1,4,'rooms/04.jpg','Junior Suite',163.00,NULL,3,'2025-07-01','2025-07-03','2025-07-27 20:45:51','2025-07-27 20:45:51'),(2,2,4,'rooms/04.jpg','Junior Suite',163.00,NULL,3,'2025-07-02','2025-07-03','2025-07-27 20:45:51','2025-07-27 20:45:51'),(3,3,6,'rooms/06.jpg','Relax Suite',121.00,NULL,2,'2025-07-03','2025-07-05','2025-07-27 20:45:51','2025-07-27 20:45:51'),(4,4,8,'rooms/02.jpg','President Room',143.00,NULL,3,'2025-07-04','2025-07-05','2025-07-27 20:45:51','2025-07-27 20:45:51'),(5,5,7,'rooms/01.jpg','Luxury Suite',152.00,NULL,2,'2025-07-05','2025-07-06','2025-07-27 20:45:51','2025-07-27 20:45:51'),(6,6,4,'rooms/04.jpg','Junior Suite',163.00,NULL,1,'2025-07-06','2025-07-09','2025-07-27 20:45:51','2025-07-27 20:45:51'),(7,7,6,'rooms/06.jpg','Relax Suite',121.00,NULL,3,'2025-07-07','2025-07-08','2025-07-27 20:45:51','2025-07-27 20:45:51'),(8,8,6,'rooms/06.jpg','Relax Suite',121.00,NULL,2,'2025-07-08','2025-07-11','2025-07-27 20:45:51','2025-07-27 20:45:51'),(9,9,4,'rooms/04.jpg','Junior Suite',163.00,NULL,2,'2025-07-09','2025-07-11','2025-07-27 20:45:51','2025-07-27 20:45:51'),(10,10,2,'rooms/02.jpg','Pendora Fame',200.00,NULL,1,'2025-07-10','2025-07-12','2025-07-27 20:45:51','2025-07-27 20:45:51'),(11,11,6,'rooms/06.jpg','Relax Suite',121.00,NULL,3,'2025-07-11','2025-07-14','2025-07-27 20:45:51','2025-07-27 20:45:51'),(12,12,5,'rooms/05.jpg','Family Suite',134.00,NULL,3,'2025-07-12','2025-07-14','2025-07-27 20:45:51','2025-07-27 20:45:51'),(13,13,8,'rooms/02.jpg','President Room',143.00,NULL,3,'2025-07-13','2025-07-14','2025-07-27 20:45:51','2025-07-27 20:45:51'),(14,14,6,'rooms/06.jpg','Relax Suite',121.00,NULL,3,'2025-07-14','2025-07-15','2025-07-27 20:45:52','2025-07-27 20:45:52'),(15,15,5,'rooms/05.jpg','Family Suite',134.00,NULL,3,'2025-07-15','2025-07-18','2025-07-27 20:45:52','2025-07-27 20:45:52'),(16,16,8,'rooms/02.jpg','President Room',143.00,NULL,1,'2025-07-16','2025-07-19','2025-07-27 20:45:52','2025-07-27 20:45:52'),(17,17,4,'rooms/04.jpg','Junior Suite',163.00,NULL,3,'2025-07-17','2025-07-19','2025-07-27 20:45:52','2025-07-27 20:45:52'),(18,18,1,'rooms/01.jpg','Luxury Hall Of Fame',176.00,NULL,1,'2025-07-18','2025-07-21','2025-07-27 20:45:52','2025-07-27 20:45:52'),(19,19,5,'rooms/05.jpg','Family Suite',134.00,NULL,1,'2025-07-19','2025-07-20','2025-07-27 20:45:52','2025-07-27 20:45:52'),(20,20,5,'rooms/05.jpg','Family Suite',134.00,NULL,3,'2025-07-20','2025-07-22','2025-07-27 20:45:52','2025-07-27 20:45:52'),(21,21,1,'rooms/01.jpg','Luxury Hall Of Fame',176.00,NULL,2,'2025-07-21','2025-07-22','2025-07-27 20:45:52','2025-07-27 20:45:52'),(22,22,1,'rooms/01.jpg','Luxury Hall Of Fame',176.00,NULL,2,'2025-07-22','2025-07-25','2025-07-27 20:45:52','2025-07-27 20:45:52'),(23,23,4,'rooms/04.jpg','Junior Suite',163.00,NULL,2,'2025-07-23','2025-07-26','2025-07-27 20:45:52','2025-07-27 20:45:52'),(24,24,2,'rooms/02.jpg','Pendora Fame',200.00,NULL,1,'2025-07-24','2025-07-25','2025-07-27 20:45:52','2025-07-27 20:45:52'),(25,25,8,'rooms/02.jpg','President Room',143.00,NULL,3,'2025-07-25','2025-07-26','2025-07-27 20:45:52','2025-07-27 20:45:52'),(26,26,3,'rooms/03.jpg','Pacific Room',185.00,NULL,2,'2025-07-26','2025-07-27','2025-07-27 20:45:52','2025-07-27 20:45:52'),(27,27,3,'rooms/03.jpg','Pacific Room',185.00,NULL,3,'2025-07-27','2025-07-30','2025-07-27 20:45:53','2025-07-27 20:45:53'),(28,28,8,'rooms/02.jpg','President Room',143.00,NULL,1,'2025-07-28','2025-07-30','2025-07-27 20:45:53','2025-07-27 20:45:53'),(29,29,8,'rooms/02.jpg','President Room',143.00,NULL,2,'2025-07-29','2025-07-30','2025-07-27 20:45:53','2025-07-27 20:45:53'),(30,30,3,'rooms/03.jpg','Pacific Room',185.00,NULL,2,'2025-07-30','2025-08-02','2025-07-27 20:45:53','2025-07-27 20:45:53'),(31,31,7,'rooms/01.jpg','Luxury Suite',152.00,NULL,2,'2025-07-31','2025-08-02','2025-07-27 20:45:53','2025-07-27 20:45:53');
/*!40000 ALTER TABLE `ht_booking_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_services`
--

DROP TABLE IF EXISTS `ht_booking_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `service_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_services`
--

LOCK TABLES `ht_booking_services` WRITE;
/*!40000 ALTER TABLE `ht_booking_services` DISABLE KEYS */;
INSERT INTO `ht_booking_services` VALUES (1,1,6),(2,2,5),(3,3,6),(4,4,1),(5,5,3),(6,6,4),(7,7,4),(8,8,3),(9,9,6),(10,10,5),(11,11,1),(12,12,4),(13,13,4),(14,14,5),(15,15,3),(16,16,2),(17,17,1),(18,18,4),(19,19,2),(20,20,3),(21,21,5),(22,22,5),(23,23,1),(24,24,4),(25,25,2),(26,26,3),(27,27,2),(28,28,1),(29,29,2),(30,30,5),(31,31,2);
/*!40000 ALTER TABLE `ht_booking_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_bookings`
--

DROP TABLE IF EXISTS `ht_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `coupon_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `requests` text COLLATE utf8mb4_unicode_ci,
  `arrival_time` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_guests` int DEFAULT NULL,
  `number_of_children` int NOT NULL DEFAULT '0',
  `payment_id` bigint unsigned DEFAULT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `transaction_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_bookings_booking_number_unique` (`booking_number`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_bookings`
--

LOCK TABLES `ht_bookings` WRITE;
/*!40000 ALTER TABLE `ht_bookings` DISABLE KEYS */;
INSERT INTO `ht_bookings` VALUES (1,'#1000001',489.00,489.00,0.00,NULL,0.00,NULL,'Earum sit sunt nulla hic qui.',NULL,9,0,1,10,'DvgevE8sLMLYestszfeA','completed','2025-07-27 20:45:51','2025-07-27 20:45:51'),(2,'#1000002',489.00,489.00,0.00,NULL,0.00,NULL,'Et laudantium perspiciatis est ut consequuntur non.',NULL,9,0,2,5,'AmhdA4jMkjCbwCR0rUuh','processing','2025-07-27 20:45:51','2025-07-27 20:45:51'),(3,'#1000003',242.00,242.00,0.00,NULL,0.00,NULL,'Non fuga officiis praesentium perspiciatis.',NULL,4,0,3,4,'LX5WX7JA9oi0ZjSzxVlh','pending','2025-07-27 20:45:51','2025-07-27 20:45:51'),(4,'#1000004',429.00,429.00,0.00,NULL,0.00,NULL,'Alias voluptate debitis ea ut facere nihil quis.',NULL,9,0,4,1,'WHKchfRUeZaaRFx0Zzxy','processing','2025-07-27 20:45:51','2025-07-27 20:45:51'),(5,'#1000005',304.00,304.00,0.00,NULL,0.00,NULL,'Nihil dolore dolore ut distinctio.',NULL,6,0,5,9,'ZryDKc1WVWbVxXlPubvY','processing','2025-07-27 20:45:51','2025-07-27 20:45:51'),(6,'#1000006',163.00,163.00,0.00,NULL,0.00,NULL,'Voluptates quis quod architecto voluptatem dicta enim.',NULL,3,0,6,11,'cZPTGVkAEtZtBrzrLNeK','pending','2025-07-27 20:45:51','2025-07-27 20:45:51'),(7,'#1000007',363.00,363.00,0.00,NULL,0.00,NULL,'Totam veritatis voluptatem voluptatem autem et quo.',NULL,6,0,7,3,'qJUCHvY5GzkDLa1MZqYn','completed','2025-07-27 20:45:51','2025-07-27 20:45:51'),(8,'#1000008',242.00,242.00,0.00,NULL,0.00,NULL,'Id et quo architecto nihil et nisi temporibus dolores.',NULL,6,0,8,5,'ZW89uMZiwuKkLoZlwJ4i','completed','2025-07-27 20:45:51','2025-07-27 20:45:51'),(9,'#1000009',326.00,326.00,0.00,NULL,0.00,NULL,'Pariatur sequi quia incidunt dicta harum quam animi sapiente.',NULL,2,0,9,10,'1ihKTshAdeRrMgI9AEL9','cancelled','2025-07-27 20:45:51','2025-07-27 20:45:51'),(10,'#1000010',200.00,200.00,0.00,NULL,0.00,NULL,'Cupiditate ipsam fugiat molestiae numquam maiores beatae.',NULL,3,0,10,7,'yeTMa51c1T6EELdSMfRx','cancelled','2025-07-27 20:45:51','2025-07-27 20:45:51'),(11,'#1000011',363.00,363.00,0.00,NULL,0.00,NULL,'Quia soluta quidem nam voluptas magnam.',NULL,6,0,11,2,'TpLmeYdG9OjvAO0qv3wE','cancelled','2025-07-27 20:45:51','2025-07-27 20:45:51'),(12,'#1000012',402.00,402.00,0.00,NULL,0.00,NULL,'Est rerum fugiat explicabo saepe eum eveniet.',NULL,9,0,12,3,'kWMsUv7PZyCuqmuTwIia','pending','2025-07-27 20:45:51','2025-07-27 20:45:51'),(13,'#1000013',429.00,429.00,0.00,NULL,0.00,NULL,'Officiis accusantium repellendus accusamus ea aliquam cupiditate alias quam.',NULL,6,0,13,4,'3u2rN4ZfYjSiHwcaGeQK','cancelled','2025-07-27 20:45:51','2025-07-27 20:45:51'),(14,'#1000014',363.00,363.00,0.00,NULL,0.00,NULL,'Perferendis modi minus quis et iste.',NULL,3,0,14,2,'xIO3r7ou72ad0qkY95ra','processing','2025-07-27 20:45:52','2025-07-27 20:45:52'),(15,'#1000015',402.00,402.00,0.00,NULL,0.00,NULL,'Architecto id blanditiis et quidem eaque.',NULL,6,0,15,1,'8y9wFi08kb9dLanhNNvA','completed','2025-07-27 20:45:52','2025-07-27 20:45:52'),(16,'#1000016',143.00,143.00,0.00,NULL,0.00,NULL,'Corporis consectetur ipsum iste dolores.',NULL,3,0,16,4,'LTx6eJiRJWXpZwoR9dAU','pending','2025-07-27 20:45:52','2025-07-27 20:45:52'),(17,'#1000017',489.00,489.00,0.00,NULL,0.00,NULL,'Harum atque dolor harum ipsum.',NULL,9,0,17,10,'KVNkUbmjE7i7F7Piyt0P','completed','2025-07-27 20:45:52','2025-07-27 20:45:52'),(18,'#1000018',176.00,176.00,0.00,NULL,0.00,NULL,'Qui ut odio suscipit illum libero atque accusantium.',NULL,2,0,18,9,'WIB92hB2mMcaNOYDAsKG','processing','2025-07-27 20:45:52','2025-07-27 20:45:52'),(19,'#1000019',134.00,134.00,0.00,NULL,0.00,NULL,'Consectetur saepe cupiditate earum nihil ut ex asperiores consequatur.',NULL,1,0,19,5,'fkhfxSX5JY0A0QisNOOM','processing','2025-07-27 20:45:52','2025-07-27 20:45:52'),(20,'#1000020',402.00,402.00,0.00,NULL,0.00,NULL,'Nam sit quaerat est laudantium odit illo.',NULL,9,0,20,2,'ki9ffFMkUaIKPwYrw0Fy','completed','2025-07-27 20:45:52','2025-07-27 20:45:52'),(21,'#1000021',352.00,352.00,0.00,NULL,0.00,NULL,'Possimus dolor voluptas et aut.',NULL,4,0,21,8,'TGWmsp3Z3X3mGUGXTnCh','processing','2025-07-27 20:45:52','2025-07-27 20:45:52'),(22,'#1000022',352.00,352.00,0.00,NULL,0.00,NULL,'Enim tempore nemo ipsum cupiditate ipsam.',NULL,6,0,22,10,'ajqVFHuDEfSYAO9QrQ9f','cancelled','2025-07-27 20:45:52','2025-07-27 20:45:52'),(23,'#1000023',326.00,326.00,0.00,NULL,0.00,NULL,'Adipisci ut libero harum.',NULL,2,0,23,11,'pBSxfR3VLGjIeh4W8Dtf','processing','2025-07-27 20:45:52','2025-07-27 20:45:52'),(24,'#1000024',200.00,200.00,0.00,NULL,0.00,NULL,'Reiciendis id nihil voluptatum alias delectus.',NULL,3,0,24,7,'y1Wveo5Hf6xzGEjmHyv2','processing','2025-07-27 20:45:52','2025-07-27 20:45:52'),(25,'#1000025',429.00,429.00,0.00,NULL,0.00,NULL,'Aut quia doloribus quia possimus adipisci voluptatum molestiae earum.',NULL,9,0,25,4,'4m5r4XpYtfrqDosRSkqJ','processing','2025-07-27 20:45:52','2025-07-27 20:45:52'),(26,'#1000026',370.00,370.00,0.00,NULL,0.00,NULL,'Aut fuga illo mollitia architecto et aliquid.',NULL,4,0,26,1,'mm4QKJQD66ALIgRqVWTL','completed','2025-07-27 20:45:52','2025-07-27 20:45:52'),(27,'#1000027',555.00,555.00,0.00,NULL,0.00,NULL,'Fugit rerum qui officiis corrupti.',NULL,6,0,27,9,'xWcVJHJ0u3NXo2v3OlWE','cancelled','2025-07-27 20:45:53','2025-07-27 20:45:53'),(28,'#1000028',143.00,143.00,0.00,NULL,0.00,NULL,'Quod consequatur commodi modi rerum velit.',NULL,3,0,28,11,'qyRv2Buu9wp5Z5UxBnfJ','cancelled','2025-07-27 20:45:53','2025-07-27 20:45:53'),(29,'#1000029',286.00,286.00,0.00,NULL,0.00,NULL,'Animi et saepe enim perferendis tenetur voluptas corporis.',NULL,4,0,29,9,'e0OcmTXYZhtDQx5wqEgM','pending','2025-07-27 20:45:53','2025-07-27 20:45:53'),(30,'#1000030',370.00,370.00,0.00,NULL,0.00,NULL,'Perspiciatis nihil consequatur error dolorem possimus rerum necessitatibus ad.',NULL,2,0,30,2,'TMNYrF7ly8kWxsrB4yG6','completed','2025-07-27 20:45:53','2025-07-27 20:45:53'),(31,'#1000031',304.00,304.00,0.00,NULL,0.00,NULL,'Et sed facere ea in rerum dolores ipsam.',NULL,2,0,31,10,'Z6bL3ylIvHu9retLdjN9','pending','2025-07-27 20:45:53','2025-07-27 20:45:53');
/*!40000 ALTER TABLE `ht_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_coupons`
--

DROP TABLE IF EXISTS `ht_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_coupons`
--

LOCK TABLES `ht_coupons` WRITE;
/*!40000 ALTER TABLE `ht_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_currencies`
--

DROP TABLE IF EXISTS `ht_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_currencies`
--

LOCK TABLES `ht_currencies` WRITE;
/*!40000 ALTER TABLE `ht_currencies` DISABLE KEYS */;
INSERT INTO `ht_currencies` VALUES (1,'USD','$',1,2,0,1,1,'2025-07-27 20:45:10','2025-07-27 20:45:10'),(2,'EUR','€',0,2,1,0,0.91,'2025-07-27 20:45:10','2025-07-27 20:45:10'),(3,'VND','₫',0,0,2,0,23717.5,'2025-07-27 20:45:10','2025-07-27 20:45:10');
/*!40000 ALTER TABLE `ht_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_customer_password_resets`
--

DROP TABLE IF EXISTS `ht_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_customer_password_resets`
--

LOCK TABLES `ht_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ht_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_customers`
--

DROP TABLE IF EXISTS `ht_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_customers`
--

LOCK TABLES `ht_customers` WRITE;
/*!40000 ALTER TABLE `ht_customers` DISABLE KEYS */;
INSERT INTO `ht_customers` VALUES (1,'Gussie','Zboncak','qconsidine@example.net','$2y$12$QkTO0ewkj3WcQ.h5QLyzHuJd1bX7jOYr3Zv7XyRsCGe5sXJetSR.W','customers/1.jpg',NULL,'+18317159283',NULL,NULL,NULL,NULL,NULL,'2025-07-27 20:45:33','2025-07-27 20:45:33',NULL,NULL),(2,'Ena','Klocko','madalyn29@example.net','$2y$12$jKv2MhkXOfoJByBMVUeyL.ysuza6zNOLEq8q7l0qr84AHOPbiberG','customers/2.jpg',NULL,'+18315089436',NULL,NULL,NULL,NULL,NULL,'2025-07-27 20:45:33','2025-07-27 20:45:33',NULL,NULL),(3,'Albina','Prohaska','tterry@example.com','$2y$12$4x94SCHD2EPTE5rzAPH2vehQcuQIHN7IzKQIV64xJkoToyki4WdAS','customers/3.jpg',NULL,'+18386618089',NULL,NULL,NULL,NULL,NULL,'2025-07-27 20:45:33','2025-07-27 20:45:33',NULL,NULL),(4,'Brice','Thompson','dangelo.hayes@example.net','$2y$12$pWPU8vufDiksAKxkw2FHmOLwSfGFQp6GCFu2SD1ZJThsPy4mpcJFS','customers/4.jpg',NULL,'+12072263148',NULL,NULL,NULL,NULL,NULL,'2025-07-27 20:45:33','2025-07-27 20:45:33',NULL,NULL),(5,'Alexandrea','Leffler','hickle.marcus@example.com','$2y$12$iC7HglFNn.wUguze/xvNuOUKGMx38RwoRKH/ddBerGYmLHUqS9DVa','customers/5.jpg',NULL,'+18782951630',NULL,NULL,NULL,NULL,NULL,'2025-07-27 20:45:33','2025-07-27 20:45:33',NULL,NULL),(6,'Issac','Haley','pkreiger@example.com','$2y$12$8pszX0PlB0/37LLZ6o8uM.fl./NjyBWvCh/P6TUjFWzZFEMsvZ0L.','customers/6.jpg',NULL,'+12126349321',NULL,NULL,NULL,NULL,NULL,'2025-07-27 20:45:33','2025-07-27 20:45:33',NULL,NULL),(7,'Santos','Simonis','brycen06@example.com','$2y$12$IjVsQkA/HMvoz1uYYExWrOetwpxAlifueL0OyPiBm.MnLlHYV8LoG','customers/7.jpg',NULL,'+18723904153',NULL,NULL,NULL,NULL,NULL,'2025-07-27 20:45:33','2025-07-27 20:45:33',NULL,NULL),(8,'Rachael','Davis','erika93@example.com','$2y$12$WlGyFZj4e.0fnGR38daglO5TNxQ/kBJZmerjUI6Daeb1WUQsRDpA2','customers/8.jpg',NULL,'+16188630850',NULL,NULL,NULL,NULL,NULL,'2025-07-27 20:45:33','2025-07-27 20:45:33',NULL,NULL),(9,'Raven','Lindgren','orpha.nikolaus@example.org','$2y$12$q4UcwDzDb02dSoHBkyCXGOEILhtKNsxCCwBIEd5cAdcpEUd86GNQC','customers/9.jpg',NULL,'+18318596787',NULL,NULL,NULL,NULL,NULL,'2025-07-27 20:45:33','2025-07-27 20:45:33',NULL,NULL),(10,'Marina','Durgan','kozey.annabelle@example.org','$2y$12$FNDAjFLWl7uAoRMCxOriwuIE0AoUQAjdgCpI4hvRLQSNU3tXS/N2O','customers/10.jpg',NULL,'+12699265315',NULL,NULL,NULL,NULL,NULL,'2025-07-27 20:45:33','2025-07-27 20:45:33',NULL,NULL),(11,'Cecilia','Christiansen','customer@botble.com','$2y$12$t99E6EZvIEJQ2t2yDS6oTOzHgX.kKcDePCf36VP9VZguX90Gx8h9O','customers/3.jpg',NULL,'+12709277068',NULL,NULL,NULL,NULL,NULL,'2025-07-27 20:45:33','2025-07-27 20:45:33',NULL,NULL);
/*!40000 ALTER TABLE `ht_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_features`
--

DROP TABLE IF EXISTS `ht_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_features`
--

LOCK TABLES `ht_features` WRITE;
/*!40000 ALTER TABLE `ht_features` DISABLE KEYS */;
INSERT INTO `ht_features` VALUES (1,'Have High Rating','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-rating',1,'published','2025-07-27 20:45:22','2025-07-27 20:45:22'),(2,'Quiet Hours','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-clock',1,'published','2025-07-27 20:45:22','2025-07-27 20:45:22'),(3,'Best Locations','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-location-pin',1,'published','2025-07-27 20:45:22','2025-07-27 20:45:22'),(4,'Free Cancellation','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-clock-1',0,'published','2025-07-27 20:45:22','2025-07-27 20:45:22'),(5,'Payment Options','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-credit-card',0,'published','2025-07-27 20:45:22','2025-07-27 20:45:22'),(6,'Special Offers','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-discount',0,'published','2025-07-27 20:45:22','2025-07-27 20:45:22');
/*!40000 ALTER TABLE `ht_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_features_translations`
--

DROP TABLE IF EXISTS `ht_features_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_features_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_features_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_features_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_features_translations`
--

LOCK TABLES `ht_features_translations` WRITE;
/*!40000 ALTER TABLE `ht_features_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_features_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_food_types`
--

DROP TABLE IF EXISTS `ht_food_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_food_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_food_types`
--

LOCK TABLES `ht_food_types` WRITE;
/*!40000 ALTER TABLE `ht_food_types` DISABLE KEYS */;
INSERT INTO `ht_food_types` VALUES (1,'Chicken','flaticon-boiled','published','2025-07-27 20:45:15','2025-07-27 20:45:15'),(2,'Italian','flaticon-pizza','published','2025-07-27 20:45:15','2025-07-27 20:45:15'),(3,'Coffee','flaticon-coffee','published','2025-07-27 20:45:15','2025-07-27 20:45:15'),(4,'Bake Cake','flaticon-cake','published','2025-07-27 20:45:15','2025-07-27 20:45:15'),(5,'Cookies','flaticon-cookie','published','2025-07-27 20:45:15','2025-07-27 20:45:15'),(6,'Cocktail','flaticon-cocktail','published','2025-07-27 20:45:15','2025-07-27 20:45:15');
/*!40000 ALTER TABLE `ht_food_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_food_types_translations`
--

DROP TABLE IF EXISTS `ht_food_types_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_food_types_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_food_types_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ht_food_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_food_types_translations`
--

LOCK TABLES `ht_food_types_translations` WRITE;
/*!40000 ALTER TABLE `ht_food_types_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_food_types_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_foods`
--

DROP TABLE IF EXISTS `ht_foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_foods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,0) unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `food_type_id` bigint unsigned NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_foods`
--

LOCK TABLES `ht_foods` WRITE;
/*!40000 ALTER TABLE `ht_foods` DISABLE KEYS */;
INSERT INTO `ht_foods` VALUES (1,'Eggs &amp; Bacon','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,128,NULL,1,'foods/01.jpg','published','2025-07-27 20:45:21','2025-07-27 20:45:21'),(2,'Tea or Coffee','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,175,NULL,1,'foods/02.jpg','published','2025-07-27 20:45:21','2025-07-27 20:45:21'),(3,'Chia Oatmeal','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,125,NULL,1,'foods/03.jpg','published','2025-07-27 20:45:21','2025-07-27 20:45:21'),(4,'Juice','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,169,NULL,1,'foods/04.jpg','published','2025-07-27 20:45:21','2025-07-27 20:45:21'),(5,'Chia Oatmeal','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,177,NULL,2,'foods/05.jpg','published','2025-07-27 20:45:21','2025-07-27 20:45:21'),(6,'Fruit Parfait','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,137,NULL,2,'foods/06.jpg','published','2025-07-27 20:45:21','2025-07-27 20:45:21'),(7,'Marmalade Selection','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,165,NULL,3,'foods/07.jpg','published','2025-07-27 20:45:21','2025-07-27 20:45:21'),(8,'Cheese Platen','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,193,NULL,4,'foods/08.jpg','published','2025-07-27 20:45:21','2025-07-27 20:45:21'),(9,'Avocado Toast','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,140,NULL,5,'foods/09.jpg','published','2025-07-27 20:45:22','2025-07-27 20:45:22'),(10,'Avocado Toast','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,196,NULL,6,'foods/10.jpg','published','2025-07-27 20:45:22','2025-07-27 20:45:22');
/*!40000 ALTER TABLE `ht_foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_foods_translations`
--

DROP TABLE IF EXISTS `ht_foods_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_foods_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_foods_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_foods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_foods_translations`
--

LOCK TABLES `ht_foods_translations` WRITE;
/*!40000 ALTER TABLE `ht_foods_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_foods_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_ical_sync_logs`
--

DROP TABLE IF EXISTS `ht_ical_sync_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_ical_sync_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned NOT NULL,
  `calendar_id` bigint unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ht_ical_sync_logs_room_id_index` (`room_id`),
  KEY `ht_ical_sync_logs_calendar_id_index` (`calendar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_ical_sync_logs`
--

LOCK TABLES `ht_ical_sync_logs` WRITE;
/*!40000 ALTER TABLE `ht_ical_sync_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_ical_sync_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_invoice_items`
--

DROP TABLE IF EXISTS `ht_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_invoice_items`
--

LOCK TABLES `ht_invoice_items` WRITE;
/*!40000 ALTER TABLE `ht_invoice_items` DISABLE KEYS */;
INSERT INTO `ht_invoice_items` VALUES (1,1,'Junior Suite','',1,163.00,0.00,0.00,163.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(2,1,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(3,2,'Junior Suite','',1,163.00,0.00,0.00,163.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(4,2,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(5,3,'Relax Suite','',1,121.00,0.00,0.00,121.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(6,3,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(7,4,'President Room','',1,143.00,0.00,0.00,143.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(8,4,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(9,5,'Luxury Suite','',1,152.00,0.00,0.00,152.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(10,5,'Best Accommodation (extra service)','',1,50.00,0.00,0.00,50.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(11,6,'Junior Suite','',1,163.00,0.00,0.00,163.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(12,6,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(13,7,'Relax Suite','',1,121.00,0.00,0.00,121.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(14,7,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(15,8,'Relax Suite','',1,121.00,0.00,0.00,121.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(16,8,'Best Accommodation (extra service)','',1,50.00,0.00,0.00,50.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(17,9,'Junior Suite','',1,163.00,0.00,0.00,163.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(18,9,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(19,10,'Pendora Fame','',1,200.00,0.00,0.00,200.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(20,10,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(21,11,'Relax Suite','',1,121.00,0.00,0.00,121.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(22,11,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(23,12,'Family Suite','',1,134.00,0.00,0.00,134.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(24,12,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(25,13,'President Room','',1,143.00,0.00,0.00,143.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(26,13,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(27,14,'Relax Suite','',1,121.00,0.00,0.00,121.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(28,14,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(29,15,'Family Suite','',1,134.00,0.00,0.00,134.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(30,15,'Best Accommodation (extra service)','',1,50.00,0.00,0.00,50.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(31,16,'President Room','',1,143.00,0.00,0.00,143.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(32,16,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(33,17,'Junior Suite','',1,163.00,0.00,0.00,163.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(34,17,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(35,18,'Luxury Hall Of Fame','',1,176.00,0.00,0.00,176.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(36,18,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(37,19,'Family Suite','',1,134.00,0.00,0.00,134.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(38,19,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(39,20,'Family Suite','',1,134.00,0.00,0.00,134.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(40,20,'Best Accommodation (extra service)','',1,50.00,0.00,0.00,50.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(41,21,'Luxury Hall Of Fame','',1,176.00,0.00,0.00,176.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(42,21,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(43,22,'Luxury Hall Of Fame','',1,176.00,0.00,0.00,176.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(44,22,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(45,23,'Junior Suite','',1,163.00,0.00,0.00,163.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(46,23,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(47,24,'Pendora Fame','',1,200.00,0.00,0.00,200.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(48,24,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(49,25,'President Room','',1,143.00,0.00,0.00,143.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(50,25,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(51,26,'Pacific Room','',1,185.00,0.00,0.00,185.00,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(52,26,'Best Accommodation (extra service)','',1,50.00,0.00,0.00,50.00,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(53,27,'Pacific Room','',1,185.00,0.00,0.00,185.00,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(54,27,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(55,28,'President Room','',1,143.00,0.00,0.00,143.00,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(56,28,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(57,29,'President Room','',1,143.00,0.00,0.00,143.00,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(58,29,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(59,30,'Pacific Room','',1,185.00,0.00,0.00,185.00,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(60,30,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(61,31,'Luxury Suite','',1,152.00,0.00,0.00,152.00,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(62,31,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2025-07-27 20:45:53','2025-07-27 20:45:53');
/*!40000 ALTER TABLE `ht_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_invoices`
--

DROP TABLE IF EXISTS `ht_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_invoices_code_unique` (`code`),
  KEY `ht_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `ht_invoices_payment_id_index` (`payment_id`),
  KEY `ht_invoices_status_index` (`status`),
  KEY `ht_invoices_customer_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_invoices`
--

LOCK TABLES `ht_invoices` WRITE;
/*!40000 ALTER TABLE `ht_invoices` DISABLE KEYS */;
INSERT INTO `ht_invoices` VALUES (1,10,'OrlandWitting','aditya.koepp@example.net','1-847-519-7747','4100 Cruz Mill\nDeangeloburgh, NC 93573-4471, North Vanside, Lake Joannytown, Paraguay, 97366-3381, ','Earum sit sunt nulla hic qui.',1,'Botble\\Hotel\\Models\\Booking',1,'INV-1',489.00,0.00,0.00,489.00,'pending',NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(2,5,'AngelitaWisozk','anne59@example.org','1-947-219-9866','39252 Linnie Villages Apt. 723\nEast Adalineton, MN 43118-8661, East Gerryport, Keyonstad, American Samoa, 12758, ','Et laudantium perspiciatis est ut consequuntur non.',2,'Botble\\Hotel\\Models\\Booking',2,'INV-2',489.00,0.00,0.00,489.00,'canceled',NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(3,4,'TerrellCummerata','paucek.dejah@example.com','+1-908-264-9718','350 Ellen Summit Suite 646\nLake Dereck, UT 01365-8439, South Sandra, Connhaven, Libyan Arab Jamahiriya, 63953, ','Non fuga officiis praesentium perspiciatis.',3,'Botble\\Hotel\\Models\\Booking',3,'INV-3',242.00,0.00,0.00,242.00,'canceled',NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(4,1,'JudgeRobel','clotilde05@example.org','432.403.6371','527 Hal Street\nLake Camilla, ND 58601, South Shayleeport, Kaciview, Slovakia (Slovak Republic), 13738-9776, ','Alias voluptate debitis ea ut facere nihil quis.',4,'Botble\\Hotel\\Models\\Booking',4,'INV-4',429.00,0.00,0.00,429.00,'canceled',NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(5,9,'AgustinO\'Connell','fredy36@example.net','+1-952-512-1933','514 Giles Lane Apt. 555\nLake Elinormouth, CT 75688-4327, North Aniyahland, Arnoldoview, Nauru, 12723-2815, ','Nihil dolore dolore ut distinctio.',5,'Botble\\Hotel\\Models\\Booking',5,'INV-5',304.00,0.00,0.00,304.00,'completed',NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(6,11,'LolitaKuvalis','haley.imogene@example.org','1-801-255-5650','8246 Runolfsdottir Corner\nWest Christelle, KS 38145, Corytown, North Trystanburgh, Estonia, 82993-7523, ','Voluptates quis quod architecto voluptatem dicta enim.',6,'Botble\\Hotel\\Models\\Booking',6,'INV-6',163.00,0.00,0.00,163.00,'pending',NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(7,3,'ChristianaWeber','roselyn19@example.com','469-715-8405','589 Mitchell Roads\nWolfburgh, AK 66676-6517, Lake Mabelleland, Port Leoneltown, Barbados, 61983-8873, ','Totam veritatis voluptatem voluptatem autem et quo.',7,'Botble\\Hotel\\Models\\Booking',7,'INV-7',363.00,0.00,0.00,363.00,'canceled',NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(8,5,'RoyHeidenreich','schulist.hoyt@example.com','+1.770.252.3313','1730 Heller Inlet\nMathildeburgh, MN 41257, East Noe, West Marceloville, South Africa, 56857, ','Id et quo architecto nihil et nisi temporibus dolores.',8,'Botble\\Hotel\\Models\\Booking',8,'INV-8',242.00,0.00,0.00,242.00,'canceled',NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(9,10,'PasqualePfeffer','eheller@example.com','+1-662-545-4563','239 Jovany Meadow\nSouth Keeleyton, PA 23871, Kianaville, Lake Joanny, Comoros, 77464-6630, ','Pariatur sequi quia incidunt dicta harum quam animi sapiente.',9,'Botble\\Hotel\\Models\\Booking',9,'INV-9',326.00,0.00,0.00,326.00,'canceled',NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(10,7,'SeanGreenholt','frami.walton@example.net','+1-781-294-3743','2153 Cummerata Inlet Apt. 607\nNew Luigi, CT 43795, Brekkeberg, Port Kraig, Tanzania, 45273-7996, ','Cupiditate ipsam fugiat molestiae numquam maiores beatae.',10,'Botble\\Hotel\\Models\\Booking',10,'INV-10',200.00,0.00,0.00,200.00,'pending',NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(11,2,'OletaMante','koconnell@example.org','1-440-975-6585','6348 Reggie Corner Apt. 174\nEast Rylee, SD 05669-1897, Lake Ceasarmouth, West Rodborough, Heard Island and McDonald Islands, 81022-7556, ','Quia soluta quidem nam voluptas magnam.',11,'Botble\\Hotel\\Models\\Booking',11,'INV-11',363.00,0.00,0.00,363.00,'canceled',NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(12,3,'JasenSpencer','hills.ayana@example.com','252.332.5820','9833 Jamarcus Center Suite 573\nGorczanybury, TN 00050-3938, West Sanford, Port Allanshire, Indonesia, 09531-8610, ','Est rerum fugiat explicabo saepe eum eveniet.',12,'Botble\\Hotel\\Models\\Booking',12,'INV-12',402.00,0.00,0.00,402.00,'canceled',NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(13,4,'PaulChamplin','lauriane39@example.net','1-814-916-4644','32547 Buckridge Plains Apt. 742\nPort Laurymouth, KS 47230-4111, Wilfredoside, Ullrichchester, Nepal, 46746, ','Officiis accusantium repellendus accusamus ea aliquam cupiditate alias quam.',13,'Botble\\Hotel\\Models\\Booking',13,'INV-13',429.00,0.00,0.00,429.00,'canceled',NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51'),(14,2,'ElwinBlock','sylvia24@example.com','(912) 913-2308','24862 Franecki Inlet Suite 624\nPort Zulachester, GA 17560, Port Alvina, Charleneshire, Timor-Leste, 56489, ','Perferendis modi minus quis et iste.',14,'Botble\\Hotel\\Models\\Booking',14,'INV-14',363.00,0.00,0.00,363.00,'canceled',NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(15,1,'GaetanoWeissnat','kbergnaum@example.com','269-908-8499','10898 Kulas Burg Apt. 627\nLake Forrestmouth, MT 09317, South Helene, Port Burdette, Malta, 82756-8398, ','Architecto id blanditiis et quidem eaque.',15,'Botble\\Hotel\\Models\\Booking',15,'INV-15',402.00,0.00,0.00,402.00,'completed','2025-07-27 20:45:52','2025-07-27 20:45:52','2025-07-27 20:45:52'),(16,4,'TeresaKuhn','leo82@example.net','1-479-704-0059','9775 Parker Port\nJacobsonberg, WA 63403, East Wendellton, South Jenniferview, Uzbekistan, 75964-6265, ','Corporis consectetur ipsum iste dolores.',16,'Botble\\Hotel\\Models\\Booking',16,'INV-16',143.00,0.00,0.00,143.00,'canceled',NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(17,10,'PascaleRutherford','randall06@example.net','1-931-265-5389','342 Doyle Ports\nKayleighshire, IA 27172, Weldonbury, Jenaville, Japan, 77036-2269, ','Harum atque dolor harum ipsum.',17,'Botble\\Hotel\\Models\\Booking',17,'INV-17',489.00,0.00,0.00,489.00,'pending',NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(18,9,'JanieWolf','sammie38@example.org','602.558.2253','442 Larkin Trace Suite 301\nTrevafort, UT 62902, Lake Ulisesshire, New Chadrickchester, Monaco, 06306-8728, ','Qui ut odio suscipit illum libero atque accusantium.',18,'Botble\\Hotel\\Models\\Booking',18,'INV-18',176.00,0.00,0.00,176.00,'pending',NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(19,5,'LeolaKoch','pfeffer.lilly@example.net','1-838-466-1632','23302 Weissnat Roads Suite 341\nOzellastad, WY 87153-7570, Coleville, Borerbury, Serbia, 90181-3717, ','Consectetur saepe cupiditate earum nihil ut ex asperiores consequatur.',19,'Botble\\Hotel\\Models\\Booking',19,'INV-19',134.00,0.00,0.00,134.00,'canceled',NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(20,2,'KennethDietrich','pshanahan@example.net','1-435-828-2438','77210 Randy Fords\nConniefurt, NC 55730-0450, Gottliebfurt, Lake Esmeraldaberg, Dominican Republic, 29702-0592, ','Nam sit quaerat est laudantium odit illo.',20,'Botble\\Hotel\\Models\\Booking',20,'INV-20',402.00,0.00,0.00,402.00,'pending',NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(21,8,'ChaimVolkman','jamey39@example.net','909-767-7863','494 Chadd Road Suite 889\nEast Jermey, KS 42575-0318, Rafaelmouth, New Noemibury, Anguilla, 94040, ','Possimus dolor voluptas et aut.',21,'Botble\\Hotel\\Models\\Booking',21,'INV-21',352.00,0.00,0.00,352.00,'canceled',NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(22,10,'LucyFriesen','conner04@example.org','+1.410.696.7315','506 Windler Radial\nLouveniaburgh, NM 13937-1438, Lake Codyshire, Bradtkefort, Saint Vincent and the Grenadines, 56681-7670, ','Enim tempore nemo ipsum cupiditate ipsam.',22,'Botble\\Hotel\\Models\\Booking',22,'INV-22',352.00,0.00,0.00,352.00,'pending',NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(23,11,'KirstinZulauf','mmaggio@example.org','+1 (743) 919-2403','39260 Ferry Walk\nPort Dereckfort, NC 04052-6853, Lonniemouth, North Kamron, Central African Republic, 31103, ','Adipisci ut libero harum.',23,'Botble\\Hotel\\Models\\Booking',23,'INV-23',326.00,0.00,0.00,326.00,'canceled',NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(24,7,'BlazeHyatt','trycia.harvey@example.com','(651) 430-5879','869 Harry Court\nHintzberg, UT 27010-2496, West Gisselle, Berniecemouth, Japan, 27704, ','Reiciendis id nihil voluptatum alias delectus.',24,'Botble\\Hotel\\Models\\Booking',24,'INV-24',200.00,0.00,0.00,200.00,'canceled',NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(25,4,'LaneWeber','guido93@example.org','(803) 672-6796','71704 Arianna Way Suite 852\nKochland, SD 92456-4924, Kaitlynstad, South Justenfurt, Senegal, 70044-8574, ','Aut quia doloribus quia possimus adipisci voluptatum molestiae earum.',25,'Botble\\Hotel\\Models\\Booking',25,'INV-25',429.00,0.00,0.00,429.00,'canceled',NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52'),(26,1,'EldaRunolfsson','edyth78@example.com','(614) 900-1637','7881 Heaven Key Apt. 675\nSalvatorebury, NE 92551, Schusterchester, Hayestown, Tuvalu, 13274, ','Aut fuga illo mollitia architecto et aliquid.',26,'Botble\\Hotel\\Models\\Booking',26,'INV-26',370.00,0.00,0.00,370.00,'canceled',NULL,'2025-07-27 20:45:52','2025-07-27 20:45:53'),(27,9,'MercedesSchuster','daniel.corbin@example.net','+17013646406','17531 Bella Shores Apt. 248\nSouth Roxannebury, KY 68151, North Gennaroside, Champlinburgh, Uganda, 04267, ','Fugit rerum qui officiis corrupti.',27,'Botble\\Hotel\\Models\\Booking',27,'INV-27',555.00,0.00,0.00,555.00,'canceled',NULL,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(28,11,'KaydenGrady','tokon@example.com','+1-570-759-0852','61143 Kuhic Springs Apt. 727\nLake Vivianneburgh, CT 12712, West Alf, Ritchiechester, Cayman Islands, 08084, ','Quod consequatur commodi modi rerum velit.',28,'Botble\\Hotel\\Models\\Booking',28,'INV-28',143.00,0.00,0.00,143.00,'canceled',NULL,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(29,9,'XzavierGrimes','xgutmann@example.com','516-257-7802','4676 Maude Tunnel\nLake Holden, IN 15241-6160, South Mazie, Rafaelfort, Western Sahara, 41582-2026, ','Animi et saepe enim perferendis tenetur voluptas corporis.',29,'Botble\\Hotel\\Models\\Booking',29,'INV-29',286.00,0.00,0.00,286.00,'completed',NULL,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(30,2,'MarianePredovic','russ.beer@example.net','+1 (731) 469-2890','1846 Kshlerin Stream Apt. 282\nNorth Fosterland, MO 27903, Port Tyshawnland, Pagacland, San Marino, 96071-6126, ','Perspiciatis nihil consequatur error dolorem possimus rerum necessitatibus ad.',30,'Botble\\Hotel\\Models\\Booking',30,'INV-30',370.00,0.00,0.00,370.00,'pending',NULL,'2025-07-27 20:45:53','2025-07-27 20:45:53'),(31,10,'ElijahDenesik','qdare@example.net','1-443-548-2943','1120 Marcel Ramp\nNealview, KY 14462-6528, Feilton, Morarville, Poland, 93961-9682, ','Et sed facere ea in rerum dolores ipsam.',31,'Botble\\Hotel\\Models\\Booking',31,'INV-31',304.00,0.00,0.00,304.00,'completed',NULL,'2025-07-27 20:45:53','2025-07-27 20:45:53');
/*!40000 ALTER TABLE `ht_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_places`
--

DROP TABLE IF EXISTS `ht_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_places` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_places`
--

LOCK TABLES `ht_places` WRITE;
/*!40000 ALTER TABLE `ht_places` DISABLE KEYS */;
INSERT INTO `ht_places` VALUES (1,'Duplex Restaurant','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/01.jpg','published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(2,'Overnight Bars','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/02.jpg','published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(3,'Beautiful Beach','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/03.jpg','published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(4,'Beautiful Spa','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/04.jpg','published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(5,'Duplex Golf','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/05.jpg','published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(6,'Luxury Restaurant','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/06.jpg','published','2025-07-27 20:45:36','2025-07-27 20:45:36');
/*!40000 ALTER TABLE `ht_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_places_translations`
--

DROP TABLE IF EXISTS `ht_places_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_places_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_places_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_places_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_places_translations`
--

LOCK TABLES `ht_places_translations` WRITE;
/*!40000 ALTER TABLE `ht_places_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_places_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_calendars`
--

DROP TABLE IF EXISTS `ht_room_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_calendars` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_synced_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ht_room_calendars_room_id_index` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_calendars`
--

LOCK TABLES `ht_room_calendars` WRITE;
/*!40000 ALTER TABLE `ht_room_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_room_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_categories`
--

DROP TABLE IF EXISTS `ht_room_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_categories`
--

LOCK TABLES `ht_room_categories` WRITE;
/*!40000 ALTER TABLE `ht_room_categories` DISABLE KEYS */;
INSERT INTO `ht_room_categories` VALUES (1,'Luxury','published','2025-07-27 20:45:10','2025-07-27 20:45:10',0,1),(2,'Family','published','2025-07-27 20:45:10','2025-07-27 20:45:10',0,1),(3,'Double Bed','published','2025-07-27 20:45:10','2025-07-27 20:45:10',0,1),(4,'Relax','published','2025-07-27 20:45:10','2025-07-27 20:45:10',0,1);
/*!40000 ALTER TABLE `ht_room_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_categories_translations`
--

DROP TABLE IF EXISTS `ht_room_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_room_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ht_room_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_categories_translations`
--

LOCK TABLES `ht_room_categories_translations` WRITE;
/*!40000 ALTER TABLE `ht_room_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_room_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_dates`
--

DROP TABLE IF EXISTS `ht_room_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_dates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `value` decimal(15,2) DEFAULT NULL,
  `value_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `max_guests` tinyint DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `note_to_customer` text COLLATE utf8mb4_unicode_ci,
  `note_to_admin` text COLLATE utf8mb4_unicode_ci,
  `number_of_rooms` smallint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_dates`
--

LOCK TABLES `ht_room_dates` WRITE;
/*!40000 ALTER TABLE `ht_room_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_room_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_reviews`
--

DROP TABLE IF EXISTS `ht_room_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `room_id` int NOT NULL,
  `star` tinyint NOT NULL,
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_reviews`
--

LOCK TABLES `ht_room_reviews` WRITE;
/*!40000 ALTER TABLE `ht_room_reviews` DISABLE KEYS */;
INSERT INTO `ht_room_reviews` VALUES (1,7,1,5,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(2,5,5,5,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(3,3,2,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(4,11,3,5,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(5,3,6,4,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(6,7,3,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(7,4,4,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(8,3,6,4,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(9,4,2,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(10,8,3,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(11,2,4,5,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(12,11,6,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(13,9,5,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(14,9,8,5,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(15,4,2,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(16,3,3,5,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(17,9,3,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(18,7,5,5,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(19,7,5,5,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(20,1,4,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(21,1,5,5,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(22,10,3,5,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(23,1,2,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(24,7,7,5,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(25,9,1,4,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(26,3,8,5,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(27,4,6,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(28,1,6,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(29,3,2,4,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(30,2,3,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(31,5,7,4,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(32,1,8,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(33,10,2,5,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(34,7,5,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(35,6,5,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(36,6,5,5,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(37,11,7,5,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(38,7,4,4,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(39,4,7,5,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(40,5,2,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(41,2,3,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(42,10,7,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(43,4,8,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(44,7,2,4,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(45,2,4,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(46,9,5,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(47,2,6,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(48,9,7,4,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(49,2,5,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-07-27 20:45:33','2025-07-27 20:45:33'),(50,11,7,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2025-07-27 20:45:33','2025-07-27 20:45:33');
/*!40000 ALTER TABLE `ht_room_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_rooms`
--

DROP TABLE IF EXISTS `ht_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,0) unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `number_of_rooms` int unsigned DEFAULT '0',
  `number_of_beds` int unsigned DEFAULT '0',
  `size` int unsigned DEFAULT '0',
  `max_adults` int DEFAULT '0',
  `max_children` int DEFAULT '0',
  `room_category_id` bigint unsigned DEFAULT NULL,
  `tax_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_rooms`
--

LOCK TABLES `ht_rooms` WRITE;
/*!40000 ALTER TABLE `ht_rooms` DISABLE KEYS */;
INSERT INTO `ht_rooms` VALUES (1,'Luxury Hall Of Fame','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',176,NULL,4,2,112,2,2,1,1,'published','2025-07-27 20:45:15','2025-07-27 20:45:15',0),(2,'Pendora Fame','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,0,'[\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',200,NULL,1,1,175,5,2,1,1,'published','2025-07-27 20:45:15','2025-07-27 20:45:15',0),(3,'Pacific Room','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/03.jpg\",\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',185,NULL,8,3,118,5,1,1,1,'published','2025-07-27 20:45:15','2025-07-27 20:45:15',0),(4,'Junior Suite','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,0,'[\"rooms\\/04.jpg\",\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',163,NULL,9,3,153,6,3,1,1,'published','2025-07-27 20:45:15','2025-07-27 20:45:15',0),(5,'Family Suite','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,0,'[\"rooms\\/05.jpg\"]',134,NULL,2,4,149,3,2,1,1,'published','2025-07-27 20:45:15','2025-07-27 20:45:15',0),(6,'Relax Suite','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/06.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/01.jpg\"]',121,NULL,6,4,178,6,1,3,1,'published','2025-07-27 20:45:15','2025-07-27 20:45:15',0),(7,'Luxury Suite','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,0,'[\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',152,NULL,4,4,192,5,1,4,1,'published','2025-07-27 20:45:15','2025-07-27 20:45:15',0),(8,'President Room','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',143,NULL,9,1,136,3,3,3,1,'published','2025-07-27 20:45:15','2025-07-27 20:45:15',0);
/*!40000 ALTER TABLE `ht_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_rooms_amenities`
--

DROP TABLE IF EXISTS `ht_rooms_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_rooms_amenities` (
  `amenity_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`amenity_id`,`room_id`),
  KEY `ht_rooms_amenities_amenity_id_index` (`amenity_id`),
  KEY `ht_rooms_amenities_room_id_index` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_rooms_amenities`
--

LOCK TABLES `ht_rooms_amenities` WRITE;
/*!40000 ALTER TABLE `ht_rooms_amenities` DISABLE KEYS */;
INSERT INTO `ht_rooms_amenities` VALUES (1,1,NULL,NULL),(1,2,NULL,NULL),(1,3,NULL,NULL),(1,4,NULL,NULL),(1,5,NULL,NULL),(1,6,NULL,NULL),(1,7,NULL,NULL),(1,8,NULL,NULL),(2,1,NULL,NULL),(2,2,NULL,NULL),(2,3,NULL,NULL),(2,4,NULL,NULL),(2,5,NULL,NULL),(2,6,NULL,NULL),(2,7,NULL,NULL),(2,8,NULL,NULL),(3,1,NULL,NULL),(3,2,NULL,NULL),(3,3,NULL,NULL),(3,4,NULL,NULL),(3,5,NULL,NULL),(3,6,NULL,NULL),(3,7,NULL,NULL),(3,8,NULL,NULL),(4,1,NULL,NULL),(4,2,NULL,NULL),(4,3,NULL,NULL),(4,4,NULL,NULL),(4,5,NULL,NULL),(4,6,NULL,NULL),(4,7,NULL,NULL),(4,8,NULL,NULL),(6,1,NULL,NULL),(6,2,NULL,NULL),(6,3,NULL,NULL),(6,4,NULL,NULL),(6,5,NULL,NULL),(6,6,NULL,NULL),(6,7,NULL,NULL),(6,8,NULL,NULL),(7,1,NULL,NULL),(7,2,NULL,NULL),(7,3,NULL,NULL),(7,4,NULL,NULL),(7,5,NULL,NULL),(7,6,NULL,NULL),(7,7,NULL,NULL),(7,8,NULL,NULL),(9,1,NULL,NULL),(9,2,NULL,NULL),(9,3,NULL,NULL),(9,4,NULL,NULL),(9,5,NULL,NULL),(9,6,NULL,NULL),(9,7,NULL,NULL),(9,8,NULL,NULL),(11,1,NULL,NULL),(11,2,NULL,NULL),(11,3,NULL,NULL),(11,4,NULL,NULL),(11,5,NULL,NULL),(11,6,NULL,NULL),(11,7,NULL,NULL),(11,8,NULL,NULL);
/*!40000 ALTER TABLE `ht_rooms_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_rooms_translations`
--

DROP TABLE IF EXISTS `ht_rooms_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_rooms_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_rooms_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_rooms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_rooms_translations`
--

LOCK TABLES `ht_rooms_translations` WRITE;
/*!40000 ALTER TABLE `ht_rooms_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_rooms_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_services`
--

DROP TABLE IF EXISTS `ht_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,0) unsigned DEFAULT NULL,
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'once',
  `currency_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_services`
--

LOCK TABLES `ht_services` WRITE;
/*!40000 ALTER TABLE `ht_services` DISABLE KEYS */;
INSERT INTO `ht_services` VALUES (1,'Quality Room','Indulge in the epitome of comfort and style with our Quality Room. Immerse yourself in elegant furnishings, unwind in a plush bed, and enjoy modern amenities. From the private ensuite bathroom to the high-speed Wi-Fi, every detail is designed for your relaxation. Choose between city, garden, or pool views, and experience a retreat that embodies luxury and convenience.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <br>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/general/video-background-02.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <br>\n\n        <h3>Why Choose This Service</h3>\n        <br>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <br>\n        <h3>We guarantee to deliver</h3>\n        <br>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/general/04.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n        <br>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',100,'once',NULL,'amenities/icon-1.png','published','2025-07-27 20:45:24','2025-07-27 20:45:24'),(2,'Privet Beach','Discover a world of exclusivity with our Private Beach Access service. Step onto a pristine shore reserved for our guests, where sun, sand, and waves meet ultimate tranquility. Lounge in comfortable beachside seating, enjoy dedicated service, and bask in the beauty of a secluded paradise.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <br>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/general/video-background-02.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <br>\n\n        <h3>Why Choose This Service</h3>\n        <br>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <br>\n        <h3>We guarantee to deliver</h3>\n        <br>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/general/04.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n        <br>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',30,'once',NULL,'amenities/icon-2.png','published','2025-07-27 20:45:24','2025-07-27 20:45:24'),(3,'Best Accommodation','Experience the pinnacle of luxury with our Best Accommodation service. Immerse yourself in meticulously designed spaces that combine opulence and comfort. From elegant furnishings to cutting-edge amenities, every detail is curated to exceed your expectations.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <br>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/general/video-background-02.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <br>\n\n        <h3>Why Choose This Service</h3>\n        <br>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <br>\n        <h3>We guarantee to deliver</h3>\n        <br>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/general/04.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n        <br>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',50,'once',NULL,'amenities/icon-3.png','published','2025-07-27 20:45:24','2025-07-27 20:45:24'),(4,'Wellness &amp; Spa','Embark on a journey of rejuvenation and self-care with our Wellness &amp; Spa service. Immerse yourself in a sanctuary of relaxation, where skilled therapists pamper you with a range of invigorating treatments.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <br>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/general/video-background-02.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <br>\n\n        <h3>Why Choose This Service</h3>\n        <br>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <br>\n        <h3>We guarantee to deliver</h3>\n        <br>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/general/04.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n        <br>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',10,'once',NULL,'amenities/icon-4.png','published','2025-07-27 20:45:24','2025-07-27 20:45:24'),(5,'Restaurants &amp; Bars','Savor a world of flavors at our Restaurants &amp; Bars. Indulge in culinary delights crafted by talented chefs, offering a diverse range of cuisines to tantalize your taste buds. From elegant dining to vibrant social hubs, our venues provide a gastronomic journey paired with a selection of beverages that cater to every palate. .','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <br>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/general/video-background-02.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <br>\n\n        <h3>Why Choose This Service</h3>\n        <br>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <br>\n        <h3>We guarantee to deliver</h3>\n        <br>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/general/04.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n        <br>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',10,'once',NULL,'amenities/icon-5.png','published','2025-07-27 20:45:24','2025-07-27 20:45:24'),(6,'Special Offers','Unlock unbeatable value with our Special Offers. Experience the luxury of Hotel at exceptional rates, whether you\'re planning a romantic getaway, a family vacation, or a business retreat. Our exclusive packages cater to every traveler\'s needs, providing an unforgettable stay enriched with added perks.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <br>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/general/video-background-02.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <br>\n\n        <h3>Why Choose This Service</h3>\n        <br>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <br>\n        <h3>We guarantee to deliver</h3>\n        <br>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"http://miranda.test/storage/general/04.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n        <br>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',10,'once',NULL,'amenities/icon-6.png','published','2025-07-27 20:45:24','2025-07-27 20:45:24');
/*!40000 ALTER TABLE `ht_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_services_translations`
--

DROP TABLE IF EXISTS `ht_services_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_services_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_services_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_services_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_services_translations`
--

LOCK TABLES `ht_services_translations` WRITE;
/*!40000 ALTER TABLE `ht_services_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_services_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_taxes`
--

DROP TABLE IF EXISTS `ht_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_taxes`
--

LOCK TABLES `ht_taxes` WRITE;
/*!40000 ALTER TABLE `ht_taxes` DISABLE KEYS */;
INSERT INTO `ht_taxes` VALUES (1,'VAT',10,1,'published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(2,'None',0,2,'published','2025-07-27 20:45:36','2025-07-27 20:45:36');
/*!40000 ALTER TABLE `ht_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','d49faa273b32296f5b8810638b6be0d6',1,'Botble\\Testimonial\\Models\\Testimonial'),(2,'en_US','b4aae860bd5d0a4b8da4f82a1498f211',2,'Botble\\Testimonial\\Models\\Testimonial'),(3,'en_US','d4fccd8ee8a966992d3ee38792cf443d',3,'Botble\\Testimonial\\Models\\Testimonial'),(4,'en_US','50261769bcd09ef38b146afa87b4250c',1,'Botble\\Menu\\Models\\MenuLocation'),(5,'en_US','3a6d77650bd103379a815bd1bcecd8de',1,'Botble\\Menu\\Models\\Menu'),(6,'en_US','fd68e52645191cf778a41f6e702b5b5d',2,'Botble\\Menu\\Models\\MenuLocation'),(7,'en_US','73771c84925379b87eecc4e427eff4d8',2,'Botble\\Menu\\Models\\Menu'),(8,'en_US','5df727aeab6ecca1d7861fa57e616925',3,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'01','01',1,'image/jpeg',9425,'news/01.jpg','[]','2025-07-27 20:45:06','2025-07-27 20:45:06',NULL,'public'),(2,0,'02','02',1,'image/jpeg',9425,'news/02.jpg','[]','2025-07-27 20:45:07','2025-07-27 20:45:07',NULL,'public'),(3,0,'03','03',1,'image/jpeg',9425,'news/03.jpg','[]','2025-07-27 20:45:07','2025-07-27 20:45:07',NULL,'public'),(4,0,'04','04',1,'image/jpeg',9425,'news/04.jpg','[]','2025-07-27 20:45:08','2025-07-27 20:45:08',NULL,'public'),(5,0,'05','05',1,'image/jpeg',9425,'news/05.jpg','[]','2025-07-27 20:45:08','2025-07-27 20:45:08',NULL,'public'),(6,0,'06','06',1,'image/jpeg',9425,'news/06.jpg','[]','2025-07-27 20:45:09','2025-07-27 20:45:09',NULL,'public'),(7,0,'01','01',2,'image/jpeg',10738,'rooms/01.jpg','[]','2025-07-27 20:45:10','2025-07-27 20:45:10',NULL,'public'),(8,0,'02','02',2,'image/jpeg',10738,'rooms/02.jpg','[]','2025-07-27 20:45:11','2025-07-27 20:45:11',NULL,'public'),(9,0,'03','03',2,'image/jpeg',10738,'rooms/03.jpg','[]','2025-07-27 20:45:11','2025-07-27 20:45:11',NULL,'public'),(10,0,'04','04',2,'image/jpeg',10738,'rooms/04.jpg','[]','2025-07-27 20:45:12','2025-07-27 20:45:12',NULL,'public'),(11,0,'05','05',2,'image/jpeg',10738,'rooms/05.jpg','[]','2025-07-27 20:45:13','2025-07-27 20:45:13',NULL,'public'),(12,0,'06','06',2,'image/jpeg',10738,'rooms/06.jpg','[]','2025-07-27 20:45:14','2025-07-27 20:45:14',NULL,'public'),(13,0,'01','01',3,'image/jpeg',9803,'foods/01.jpg','[]','2025-07-27 20:45:15','2025-07-27 20:45:15',NULL,'public'),(14,0,'02','02',3,'image/jpeg',9803,'foods/02.jpg','[]','2025-07-27 20:45:16','2025-07-27 20:45:16',NULL,'public'),(15,0,'03','03',3,'image/jpeg',9803,'foods/03.jpg','[]','2025-07-27 20:45:16','2025-07-27 20:45:16',NULL,'public'),(16,0,'04','04',3,'image/jpeg',9803,'foods/04.jpg','[]','2025-07-27 20:45:17','2025-07-27 20:45:17',NULL,'public'),(17,0,'05','05',3,'image/jpeg',9803,'foods/05.jpg','[]','2025-07-27 20:45:18','2025-07-27 20:45:18',NULL,'public'),(18,0,'06','06',3,'image/jpeg',9803,'foods/06.jpg','[]','2025-07-27 20:45:19','2025-07-27 20:45:19',NULL,'public'),(19,0,'07','07',3,'image/jpeg',9803,'foods/07.jpg','[]','2025-07-27 20:45:19','2025-07-27 20:45:19',NULL,'public'),(20,0,'08','08',3,'image/jpeg',9803,'foods/08.jpg','[]','2025-07-27 20:45:20','2025-07-27 20:45:20',NULL,'public'),(21,0,'09','09',3,'image/jpeg',9803,'foods/09.jpg','[]','2025-07-27 20:45:20','2025-07-27 20:45:20',NULL,'public'),(22,0,'10','10',3,'image/jpeg',9803,'foods/10.jpg','[]','2025-07-27 20:45:21','2025-07-27 20:45:21',NULL,'public'),(23,0,'icon-1','icon-1',4,'image/png',4963,'amenities/icon-1.png','[]','2025-07-27 20:45:22','2025-07-27 20:45:22',NULL,'public'),(24,0,'icon-2','icon-2',4,'image/png',7875,'amenities/icon-2.png','[]','2025-07-27 20:45:22','2025-07-27 20:45:22',NULL,'public'),(25,0,'icon-3','icon-3',4,'image/png',3358,'amenities/icon-3.png','[]','2025-07-27 20:45:22','2025-07-27 20:45:22',NULL,'public'),(26,0,'icon-4','icon-4',4,'image/png',9266,'amenities/icon-4.png','[]','2025-07-27 20:45:23','2025-07-27 20:45:23',NULL,'public'),(27,0,'icon-5','icon-5',4,'image/png',6771,'amenities/icon-5.png','[]','2025-07-27 20:45:23','2025-07-27 20:45:23',NULL,'public'),(28,0,'icon-6','icon-6',4,'image/png',10671,'amenities/icon-6.png','[]','2025-07-27 20:45:24','2025-07-27 20:45:24',NULL,'public'),(29,0,'1','1',5,'image/jpeg',8581,'customers/1.jpg','[]','2025-07-27 20:45:24','2025-07-27 20:45:24',NULL,'public'),(30,0,'10','10',5,'image/jpeg',20004,'customers/10.jpg','[]','2025-07-27 20:45:24','2025-07-27 20:45:24',NULL,'public'),(31,0,'2','2',5,'image/jpeg',14257,'customers/2.jpg','[]','2025-07-27 20:45:25','2025-07-27 20:45:25',NULL,'public'),(32,0,'3','3',5,'image/jpeg',14702,'customers/3.jpg','[]','2025-07-27 20:45:25','2025-07-27 20:45:25',NULL,'public'),(33,0,'4','4',5,'image/jpeg',19699,'customers/4.jpg','[]','2025-07-27 20:45:25','2025-07-27 20:45:25',NULL,'public'),(34,0,'5','5',5,'image/jpeg',10260,'customers/5.jpg','[]','2025-07-27 20:45:26','2025-07-27 20:45:26',NULL,'public'),(35,0,'6','6',5,'image/jpeg',8476,'customers/6.jpg','[]','2025-07-27 20:45:26','2025-07-27 20:45:26',NULL,'public'),(36,0,'7','7',5,'image/jpeg',14388,'customers/7.jpg','[]','2025-07-27 20:45:26','2025-07-27 20:45:26',NULL,'public'),(37,0,'8','8',5,'image/jpeg',14340,'customers/8.jpg','[]','2025-07-27 20:45:27','2025-07-27 20:45:27',NULL,'public'),(38,0,'9','9',5,'image/jpeg',4396,'customers/9.jpg','[]','2025-07-27 20:45:27','2025-07-27 20:45:27',NULL,'public'),(39,0,'01','01',6,'image/jpeg',8820,'places/01.jpg','[]','2025-07-27 20:45:34','2025-07-27 20:45:34',NULL,'public'),(40,0,'02','02',6,'image/jpeg',8820,'places/02.jpg','[]','2025-07-27 20:45:34','2025-07-27 20:45:34',NULL,'public'),(41,0,'03','03',6,'image/jpeg',8820,'places/03.jpg','[]','2025-07-27 20:45:34','2025-07-27 20:45:34',NULL,'public'),(42,0,'04','04',6,'image/jpeg',8820,'places/04.jpg','[]','2025-07-27 20:45:35','2025-07-27 20:45:35',NULL,'public'),(43,0,'05','05',6,'image/jpeg',8820,'places/05.jpg','[]','2025-07-27 20:45:35','2025-07-27 20:45:35',NULL,'public'),(44,0,'06','06',6,'image/jpeg',8820,'places/06.jpg','[]','2025-07-27 20:45:36','2025-07-27 20:45:36',NULL,'public'),(45,0,'01','01',7,'image/png',9803,'testimonials/01.png','[]','2025-07-27 20:45:36','2025-07-27 20:45:36',NULL,'public'),(46,0,'02','02',7,'image/png',9803,'testimonials/02.png','[]','2025-07-27 20:45:37','2025-07-27 20:45:37',NULL,'public'),(47,0,'03','03',7,'image/png',9803,'testimonials/03.png','[]','2025-07-27 20:45:37','2025-07-27 20:45:37',NULL,'public'),(48,0,'01','01',8,'image/jpeg',9803,'galleries/01.jpg','[]','2025-07-27 20:45:38','2025-07-27 20:45:38',NULL,'public'),(49,0,'02','02',8,'image/jpeg',9803,'galleries/02.jpg','[]','2025-07-27 20:45:38','2025-07-27 20:45:38',NULL,'public'),(50,0,'03','03',8,'image/jpeg',9803,'galleries/03.jpg','[]','2025-07-27 20:45:39','2025-07-27 20:45:39',NULL,'public'),(51,0,'04','04',8,'image/jpeg',9803,'galleries/04.jpg','[]','2025-07-27 20:45:39','2025-07-27 20:45:39',NULL,'public'),(52,0,'05','05',8,'image/jpeg',9803,'galleries/05.jpg','[]','2025-07-27 20:45:40','2025-07-27 20:45:40',NULL,'public'),(53,0,'06','06',8,'image/jpeg',9803,'galleries/06.jpg','[]','2025-07-27 20:45:40','2025-07-27 20:45:40',NULL,'public'),(54,0,'07','07',8,'image/jpeg',9803,'galleries/07.jpg','[]','2025-07-27 20:45:41','2025-07-27 20:45:41',NULL,'public'),(55,0,'08','08',8,'image/jpeg',9803,'galleries/08.jpg','[]','2025-07-27 20:45:41','2025-07-27 20:45:41',NULL,'public'),(56,0,'1','1',9,'image/jpeg',9803,'users/1.jpg','[]','2025-07-27 20:45:42','2025-07-27 20:45:42',NULL,'public'),(57,0,'01','01',10,'image/jpeg',4038,'general/01.jpg','[]','2025-07-27 20:45:43','2025-07-27 20:45:43',NULL,'public'),(58,0,'02','02',10,'image/jpeg',2960,'general/02.jpg','[]','2025-07-27 20:45:44','2025-07-27 20:45:44',NULL,'public'),(59,0,'03','03',10,'image/jpeg',5120,'general/03.jpg','[]','2025-07-27 20:45:44','2025-07-27 20:45:44',NULL,'public'),(60,0,'04','04',10,'image/jpeg',15702,'general/04.jpg','[]','2025-07-27 20:45:45','2025-07-27 20:45:45',NULL,'public'),(61,0,'banner-news','banner-news',10,'image/jpeg',8643,'general/banner-news.jpg','[]','2025-07-27 20:45:45','2025-07-27 20:45:45',NULL,'public'),(62,0,'bg','bg',10,'image/jpeg',20558,'general/bg.jpg','[]','2025-07-27 20:45:46','2025-07-27 20:45:46',NULL,'public'),(63,0,'favicon','favicon',10,'image/png',897,'general/favicon.png','[]','2025-07-27 20:45:46','2025-07-27 20:45:46',NULL,'public'),(64,0,'logo-white','logo-white',10,'image/png',2209,'general/logo-white.png','[]','2025-07-27 20:45:47','2025-07-27 20:45:47',NULL,'public'),(65,0,'logo','logo',10,'image/png',2378,'general/logo.png','[]','2025-07-27 20:45:47','2025-07-27 20:45:47',NULL,'public'),(66,0,'video-background-02','video-background-02',10,'image/jpeg',20022,'general/video-background-02.jpg','[]','2025-07-27 20:45:48','2025-07-27 20:45:48',NULL,'public'),(67,0,'video-banner-01','video-banner-01',10,'image/jpeg',11520,'general/video-banner-01.jpg','[]','2025-07-27 20:45:48','2025-07-27 20:45:48',NULL,'public'),(68,0,'04','04',11,'image/jpeg',27493,'sliders/04.jpg','[]','2025-07-27 20:45:49','2025-07-27 20:45:49',NULL,'public'),(69,0,'05','05',11,'image/jpeg',27493,'sliders/05.jpg','[]','2025-07-27 20:45:50','2025-07-27 20:45:50',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'news',NULL,'news',0,'2025-07-27 20:45:06','2025-07-27 20:45:06',NULL),(2,0,'rooms',NULL,'rooms',0,'2025-07-27 20:45:10','2025-07-27 20:45:10',NULL),(3,0,'foods',NULL,'foods',0,'2025-07-27 20:45:15','2025-07-27 20:45:15',NULL),(4,0,'amenities',NULL,'amenities',0,'2025-07-27 20:45:22','2025-07-27 20:45:22',NULL),(5,0,'customers',NULL,'customers',0,'2025-07-27 20:45:24','2025-07-27 20:45:24',NULL),(6,0,'places',NULL,'places',0,'2025-07-27 20:45:34','2025-07-27 20:45:34',NULL),(7,0,'testimonials',NULL,'testimonials',0,'2025-07-27 20:45:36','2025-07-27 20:45:36',NULL),(8,0,'galleries',NULL,'galleries',0,'2025-07-27 20:45:38','2025-07-27 20:45:38',NULL),(9,0,'users',NULL,'users',0,'2025-07-27 20:45:42','2025-07-27 20:45:42',NULL),(10,0,'general',NULL,'general',0,'2025-07-27 20:45:43','2025-07-27 20:45:43',NULL),(11,0,'sliders',NULL,'sliders',0,'2025-07-27 20:45:49','2025-07-27 20:45:49',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'header-menu','2025-07-27 20:45:43','2025-07-27 20:45:43'),(2,2,'side-menu','2025-07-27 20:45:43','2025-07-27 20:45:43');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(2,1,0,NULL,NULL,'/rooms',NULL,0,'Rooms',NULL,'_self',1,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(3,1,2,NULL,NULL,'/rooms/luxury-hall-of-fame',NULL,0,'Luxury Hall Of Fame',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(4,1,2,NULL,NULL,'/rooms/pendora-fame',NULL,0,'Pendora Fame',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(5,1,0,2,'Botble\\Page\\Models\\Page','/news',NULL,0,'News',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(6,1,0,3,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(7,2,0,6,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(8,2,0,5,'Botble\\Page\\Models\\Page','/our-gallery',NULL,0,'Our Gallery',NULL,'_self',1,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(9,2,8,NULL,NULL,'/galleries/king-bed',NULL,0,'King Bed',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(10,2,8,NULL,NULL,'/galleries/duplex-restaurant',NULL,0,'Duplex Restaurant',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(11,2,0,4,'Botble\\Page\\Models\\Page','/restaurant',NULL,0,'Restaurant',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(12,2,0,7,'Botble\\Page\\Models\\Page','/places',NULL,0,'Places',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(13,2,0,8,'Botble\\Page\\Models\\Page','/our-offers',NULL,0,'Our Offers',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(14,3,0,NULL,NULL,'#',NULL,0,'Restaurant & Bar',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(15,3,0,NULL,NULL,'#',NULL,0,'Swimming Pool',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(16,3,0,NULL,NULL,'#',NULL,0,'Restaurant',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(17,3,0,NULL,NULL,'#',NULL,0,'Conference Room',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(18,3,0,NULL,NULL,'#',NULL,0,'Cocktail Party Houses',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(19,3,0,NULL,NULL,'#',NULL,0,'Gaming Zone',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(20,3,0,NULL,NULL,'#',NULL,0,'Marriage Party',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(21,3,0,NULL,NULL,'#',NULL,0,'Party Planning',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43'),(22,3,0,NULL,NULL,'#',NULL,0,'Tour Consultancy',NULL,'_self',0,'2025-07-27 20:45:43','2025-07-27 20:45:43');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Header menu','header-menu','published','2025-07-27 20:45:43','2025-07-27 20:45:43'),(2,'Our pages','our-pages','published','2025-07-27 20:45:43','2025-07-27 20:45:43'),(3,'Services.','services','published','2025-07-27 20:45:43','2025-07-27 20:45:43');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2016_06_10_230148_create_acl_tables',1),(7,'2016_06_14_230857_create_menus_table',1),(8,'2016_06_28_221418_create_pages_table',1),(9,'2016_10_05_074239_create_setting_table',1),(10,'2016_11_28_032840_create_dashboard_widget_tables',1),(11,'2016_12_16_084601_create_widgets_table',1),(12,'2017_05_09_070343_create_media_tables',1),(13,'2017_11_03_070450_create_slug_table',1),(14,'2019_01_05_053554_create_jobs_table',1),(15,'2019_08_19_000000_create_failed_jobs_table',1),(16,'2019_12_14_000001_create_personal_access_tokens_table',1),(17,'2021_08_05_134214_fix_social_link_theme_options',1),(18,'2022_04_20_100851_add_index_to_media_table',1),(19,'2022_04_20_101046_add_index_to_menu_table',1),(20,'2022_07_10_034813_move_lang_folder_to_root',1),(21,'2022_08_04_051940_add_missing_column_expires_at',1),(22,'2022_09_01_000001_create_admin_notifications_tables',1),(23,'2022_10_14_024629_drop_column_is_featured',1),(24,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(25,'2022_12_02_093615_update_slug_index_columns',1),(26,'2023_01_30_024431_add_alt_to_media_table',1),(27,'2023_02_16_042611_drop_table_password_resets',1),(28,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(29,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(30,'2023_08_21_090810_make_page_content_nullable',1),(31,'2023_09_14_021936_update_index_for_slugs_table',1),(32,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(33,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(34,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(35,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(36,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(37,'2024_07_12_100000_change_random_hash_for_media',1),(38,'2024_09_30_024515_create_sessions_table',1),(39,'2024_12_19_000001_create_device_tokens_table',1),(40,'2024_12_19_000002_create_push_notifications_table',1),(41,'2024_12_19_000003_create_push_notification_recipients_table',1),(42,'2024_12_30_000001_create_user_settings_table',1),(43,'2025_07_06_030754_add_phone_to_users_table',1),(44,'2024_04_27_100730_improve_analytics_setting',2),(45,'2015_06_29_025744_create_audit_history',3),(46,'2023_11_14_033417_change_request_column_in_table_audit_histories',3),(47,'2025_05_05_000001_add_user_type_to_audit_histories_table',3),(48,'2015_06_18_033822_create_blog_table',4),(49,'2021_02_16_092633_remove_default_value_for_author_type',4),(50,'2021_12_03_030600_create_blog_translations',4),(51,'2022_04_19_113923_add_index_to_table_posts',4),(52,'2023_08_29_074620_make_column_author_id_nullable',4),(53,'2024_07_30_091615_fix_order_column_in_categories_table',4),(54,'2025_01_06_033807_add_default_value_for_categories_author_type',4),(55,'2016_06_17_091537_create_contacts_table',5),(56,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',5),(57,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',5),(58,'2024_03_25_000001_update_captcha_settings_for_contact',5),(59,'2024_04_19_063914_create_custom_fields_table',5),(60,'2016_10_13_150201_create_galleries_table',6),(61,'2021_12_03_082953_create_gallery_translations',6),(62,'2022_04_30_034048_create_gallery_meta_translations_table',6),(63,'2023_08_29_075308_make_column_user_id_nullable',6),(64,'2020_09_02_033611_hotel_create_table',7),(65,'2021_06_25_084734_fix_theme_options',7),(66,'2021_08_18_011425_add_column_order_into_rooms',7),(67,'2021_08_25_153801_update_table_ht_room_categories',7),(68,'2021_08_29_031421_add_translations_tables_for_hotel',7),(69,'2023_04_09_083713_update_hotel_customers_table',7),(70,'2023_04_17_033111_add_booking_number_of_guests',7),(71,'2023_08_11_090349_add_column_password_customers_table',7),(72,'2023_08_14_090449_create_reset_password_table',7),(73,'2023_08_16_063152_update_ht_booking_room_table',7),(74,'2023_08_18_022454_add_new_field_to_ht_customers_table',7),(75,'2023_08_23_022361_create_ht_invoices_table',7),(76,'2023_08_23_041912_create_hotel_review_table',7),(77,'2023_08_23_443543_add_sub_total_to_booking_table',7),(78,'2023_08_23_904382_update_field_customer_id_to_invoice_table',7),(79,'2023_08_24_534892_add_fields_to_invoice_table',7),(80,'2023_08_24_745332_add_field_description_to_invoice_table',7),(81,'2023_08_25_061510_add_adjust_type_and_amount_column',7),(82,'2023_09_05_083354_create_ht_coupons_table',7),(83,'2023_09_06_062315_add_coupon_columns_to_booking_table',7),(84,'2023_10_18_024658_add_price_type_column_to_services_table',7),(85,'2023_10_24_014726_drop_unique_in_room_name',7),(86,'2024_06_10_000000_add_content_ht_services_translations',7),(87,'2024_07_11_052139_add_number_of_children_column_to_ht_bookings_table',7),(88,'2024_07_16_234051_add_booking_number_into_table_ht_bookings',7),(89,'2024_12_10_140304_fix_wrong_customer_account',7),(90,'2025_01_22_031331_add_field_content_for_ht_foods_table',7),(91,'2025_03_31_111809_create_ht_booking_foods',7),(92,'2025_05_16_000001_create_room_calendars_table',7),(93,'2025_05_16_000002_create_ical_sync_logs_table',7),(94,'2016_10_03_032336_create_languages_table',8),(95,'2023_09_14_022423_add_index_for_language_table',8),(96,'2021_10_25_021023_fix-priority-load-for-language-advanced',9),(97,'2021_12_03_075608_create_page_translations',9),(98,'2023_07_06_011444_create_slug_translations_table',9),(99,'2017_10_24_154832_create_newsletter_table',10),(100,'2024_03_25_000001_update_captcha_settings_for_newsletter',10),(101,'2017_05_18_080441_create_payment_tables',11),(102,'2021_03_27_144913_add_customer_type_into_table_payments',11),(103,'2021_05_24_034720_make_column_currency_nullable',11),(104,'2021_08_09_161302_add_metadata_column_to_payments_table',11),(105,'2021_10_19_020859_update_metadata_field',11),(106,'2022_06_28_151901_activate_paypal_stripe_plugin',11),(107,'2022_07_07_153354_update_charge_id_in_table_payments',11),(108,'2024_07_04_083133_create_payment_logs_table',11),(109,'2025_04_12_000003_add_payment_fee_to_payments_table',11),(110,'2025_05_22_000001_add_payment_fee_type_to_settings_table',11),(111,'2025_04_08_040931_create_social_logins_table',12),(112,'2018_07_09_214610_create_testimonial_table',13),(113,'2021_12_03_083642_create_testimonials_translations',13),(114,'2016_10_07_193005_create_translations_table',14),(115,'2023_12_12_105220_drop_translations_table',14);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[home-banner][/home-banner]</div><div>[check-availability-form][/check-availability-form]</div><div>[hotel-about title=\"since 1994\" subtitle=\"Situated In Prime Position At The Foot Of The Slopes Of Courchevel Moriond.\" block_icon_1=\"flaticon-coffee\" block_text_1=\"Breakfast\" block_link_1=\"#\" block_icon_2=\"flaticon-air-freight\" block_text_2=\"Airport Pickup\" block_link_2=\"#\" block_icon_3=\"flaticon-marker\" block_text_3=\"City Guide\" block_link_3=\"#\" block_icon_4=\"flaticon-barbecue\" block_text_4=\"BBQ Party\" block_link_4=\"#\" block_icon_5=\"flaticon-hotel\" block_text_5=\"Luxury Room\" block_link_5=\"#\" enable_lazy_loading=\"yes\"][/hotel-about]</div><div>[room-categories title=\"Room Type\" subtitle=\"Inspired Loading\" background_image=\"general/bg.jpg\" enable_lazy_loading=\"yes\"][/room-categories]</div><div>[hotel-featured-features title=\"The Thin Escape\" subtitle=\"Miranda has everything for your trip & every single things.\" button_text=\"Take a tour\" button_url=\"/rooms\" enable_lazy_loading=\"yes\"][/hotel-featured-features]</div><div>[rooms enable_lazy_loading=\"yes\"][/rooms]</div><div>[video-introduction title=\"Take a tour\" subtitle=\"Discover Our Underground.\" content=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\" background_image=\"general/video-background-02.jpg\" video_image=\"general/video-banner-01.jpg\" video_url=\"https://www.youtube.com/watch?v=EEJFMdfraVY\" button_text=\"Book Now\" button_url=\"/rooms\" enable_lazy_loading=\"yes\"][/video-introduction]</div><div>[testimonial title=\"testimonials\" subtitle=\"Client Feedback\" enable_lazy_loading=\"yes\"][/testimonial]</div><div>[rooms-introduction title=\"Our rooms\" subtitle=\"Each of our nine lovely double guest rooms feature a private bath, wi-fi, cable television and include full breakfast.\" background_image=\"general/bg.jpg\" first_image=\"general/01.jpg\" second_image=\"general/02.jpg\" third_image=\"general/03.jpg\" button_text=\"Take a tour\" button_url=\"/rooms\" enable_lazy_loading=\"yes\"][/rooms-introduction]</div><div>[featured-news title=\"Blog\" subtitle=\"News Feeds\" enable_lazy_loading=\"yes\"][/featured-news]</div>',1,NULL,'homepage',NULL,'published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(2,'News','<p>--</p>',1,NULL,'default',NULL,'published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(3,'Contact','<div>[contact-info][/contact-info]</div><div>[google-map]19/A, Cirikon City hall Tower New York, NYC[/google-map]</div><div>[contact-form][/contact-form]</div>',1,NULL,'no-sidebar',NULL,'published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(4,'Restaurant','<div>[food-types][/food-types]</div><div>[foods title=\"Restaurant\" subtitle=\"Trending Menu\"][/foods]</div>',1,NULL,'no-sidebar',NULL,'published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(5,'Our Gallery','<div>[all-galleries title=\"Gallery\" subtitle=\"Our Rooms\"][/all-galleries]</div>',1,NULL,'no-sidebar',NULL,'published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(6,'About us','<div>[youtube-video url=\"https://www.youtube.com/watch?v=EEJFMdfraVY\" background_image=\"general/04.jpg\"][/youtube-video]</div><p>Hello. Our hotel has been present for over 20 years. We make the best or all our customers. Hello. Our hotel has been present for over 20 years. We make the best or all our customers. Hello. Our hotel has been present for over 20 years. We make the best or all our customers.</p><div>[hotel-core-features title=\"Facilities\" subtitle=\"Core Features\"][/hotel-core-features]</div><div>[featured-news title=\"Blog\" subtitle=\"News Feeds\"][/featured-news]</div>',1,NULL,'no-sidebar',NULL,'published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(7,'Places','<div>[places][/places]</div>',1,NULL,'no-sidebar',NULL,'published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(8,'Our Offers','<div>[our-offers][/our-offers]</div>',1,NULL,'no-sidebar',NULL,'published','2025-07-27 20:45:36','2025-07-27 20:45:36'),(9,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',NULL,'published','2025-07-27 20:45:36','2025-07-27 20:45:36');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `payment_logs`
--

DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `response` longtext COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_logs`
--

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `payment_fee` decimal(15,2) DEFAULT '0.00',
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'USD',10,'taoAOrSVGqMipWVsMNGo','sslcommerz',NULL,489.00,0.00,1,'pending','direct',10,NULL,NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51','Botble\\Hotel\\Models\\Customer',NULL),(2,'USD',5,'qdDUVrDauAPVbQvTVORR','paystack',NULL,489.00,0.00,2,'failed','direct',5,NULL,NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51','Botble\\Hotel\\Models\\Customer',NULL),(3,'USD',4,'trW04QkpkJRpQMGTqupq','razorpay',NULL,242.00,0.00,3,'failed','direct',4,NULL,NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51','Botble\\Hotel\\Models\\Customer',NULL),(4,'USD',1,'WGDWt48pSaetkH9SaZqw','sslcommerz',NULL,429.00,0.00,4,'refunding','direct',1,NULL,NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51','Botble\\Hotel\\Models\\Customer',NULL),(5,'USD',9,'FU1aFagq7A4wnP5KV8Pa','stripe',NULL,304.00,0.00,5,'canceled','direct',9,NULL,NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51','Botble\\Hotel\\Models\\Customer',NULL),(6,'USD',11,'D0UbBD3EZBCUUS3Bs6pJ','stripe',NULL,163.00,0.00,6,'pending','direct',11,NULL,NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51','Botble\\Hotel\\Models\\Customer',NULL),(7,'USD',3,'HEVWPAFjq2WQTibaACpa','bank_transfer',NULL,363.00,0.00,7,'failed','direct',3,NULL,NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51','Botble\\Hotel\\Models\\Customer',NULL),(8,'USD',5,'ofrp9KWwx4yksm6IWu48','cod',NULL,242.00,0.00,8,'refunded','direct',5,NULL,NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51','Botble\\Hotel\\Models\\Customer',NULL),(9,'USD',10,'GUjXy0LahqMYvmTUArd4','bank_transfer',NULL,326.00,0.00,9,'refunding','direct',10,NULL,NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51','Botble\\Hotel\\Models\\Customer',NULL),(10,'USD',7,'h4s35y5yabPPckbyyZJZ','cod',NULL,200.00,0.00,10,'pending','direct',7,NULL,NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51','Botble\\Hotel\\Models\\Customer',NULL),(11,'USD',2,'dwAJYDzKi1oEDf4XMh6q','paypal',NULL,363.00,0.00,11,'fraud','direct',2,NULL,NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51','Botble\\Hotel\\Models\\Customer',NULL),(12,'USD',3,'X7TsJQin3q7IpS4Tz2fq','bank_transfer',NULL,402.00,0.00,12,'fraud','direct',3,NULL,NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51','Botble\\Hotel\\Models\\Customer',NULL),(13,'USD',4,'ojYlNQqNoYzaBWuG2Y1S','cod',NULL,429.00,0.00,13,'fraud','direct',4,NULL,NULL,'2025-07-27 20:45:51','2025-07-27 20:45:51','Botble\\Hotel\\Models\\Customer',NULL),(14,'USD',2,'VsfLRrCHAVhiDOswfUva','cod',NULL,363.00,0.00,14,'failed','direct',2,NULL,NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52','Botble\\Hotel\\Models\\Customer',NULL),(15,'USD',1,'ev8WDz5npbDONuvksphl','stripe',NULL,402.00,0.00,15,'completed','direct',1,NULL,NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52','Botble\\Hotel\\Models\\Customer',NULL),(16,'USD',4,'mrAZkzCDEhUeIelNPpmS','cod',NULL,143.00,0.00,16,'failed','direct',4,NULL,NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52','Botble\\Hotel\\Models\\Customer',NULL),(17,'USD',10,'TphRrQkuIGDIYcI5UXNc','sslcommerz',NULL,489.00,0.00,17,'pending','direct',10,NULL,NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52','Botble\\Hotel\\Models\\Customer',NULL),(18,'USD',9,'9QACvl31tAGooSFrkAGM','razorpay',NULL,176.00,0.00,18,'pending','direct',9,NULL,NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52','Botble\\Hotel\\Models\\Customer',NULL),(19,'USD',5,'ez2mSpRbp4zkPy6zhOXp','cod',NULL,134.00,0.00,19,'refunded','direct',5,NULL,NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52','Botble\\Hotel\\Models\\Customer',NULL),(20,'USD',2,'bd2MEgPl6mpM5TZOCG42','bank_transfer',NULL,402.00,0.00,20,'pending','direct',2,NULL,NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52','Botble\\Hotel\\Models\\Customer',NULL),(21,'USD',8,'NB94vg1i0fiwszvLeP4l','sslcommerz',NULL,352.00,0.00,21,'fraud','direct',8,NULL,NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52','Botble\\Hotel\\Models\\Customer',NULL),(22,'USD',10,'04ianRGGGQ8c4hJUF4gk','razorpay',NULL,352.00,0.00,22,'pending','direct',10,NULL,NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52','Botble\\Hotel\\Models\\Customer',NULL),(23,'USD',11,'QVlA7Tuw6dUq8i5dxlZN','bank_transfer',NULL,326.00,0.00,23,'refunded','direct',11,NULL,NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52','Botble\\Hotel\\Models\\Customer',NULL),(24,'USD',7,'w650GLafflrL4sH5z1zd','paypal',NULL,200.00,0.00,24,'fraud','direct',7,NULL,NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52','Botble\\Hotel\\Models\\Customer',NULL),(25,'USD',4,'uAB3a9l36qP9le9Xw3MX','razorpay',NULL,429.00,0.00,25,'failed','direct',4,NULL,NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52','Botble\\Hotel\\Models\\Customer',NULL),(26,'USD',1,'MAtT3Opx0iex7oPQuEv1','paypal',NULL,370.00,0.00,26,'failed','direct',1,NULL,NULL,'2025-07-27 20:45:52','2025-07-27 20:45:52','Botble\\Hotel\\Models\\Customer',NULL),(27,'USD',9,'ka4WZZupYO1VVfrfr3LM','sslcommerz',NULL,555.00,0.00,27,'fraud','direct',9,NULL,NULL,'2025-07-27 20:45:53','2025-07-27 20:45:53','Botble\\Hotel\\Models\\Customer',NULL),(28,'USD',11,'5DIQQ2nfuY9zima5jsYm','bank_transfer',NULL,143.00,0.00,28,'fraud','direct',11,NULL,NULL,'2025-07-27 20:45:53','2025-07-27 20:45:53','Botble\\Hotel\\Models\\Customer',NULL),(29,'USD',9,'mDN5QvPud3dPgg573Ef6','paystack',NULL,286.00,0.00,29,'canceled','direct',9,NULL,NULL,'2025-07-27 20:45:53','2025-07-27 20:45:53','Botble\\Hotel\\Models\\Customer',NULL),(30,'USD',2,'Cbrmr2RAdkzMzNHUV4gk','stripe',NULL,370.00,0.00,30,'pending','direct',2,NULL,NULL,'2025-07-27 20:45:53','2025-07-27 20:45:53','Botble\\Hotel\\Models\\Customer',NULL),(31,'USD',10,'gaAfnY3wDaRvTOhUYq0i','cod',NULL,304.00,0.00,31,'canceled','direct',10,NULL,NULL,'2025-07-27 20:45:53','2025-07-27 20:45:53','Botble\\Hotel\\Models\\Customer',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (2,1),(3,1),(2,2),(3,2),(1,3),(4,3),(1,4),(3,4),(1,5),(4,5),(1,6),(4,6);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4),(5,4),(1,5),(2,5),(3,5),(4,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Each of our 8 double rooms has its own distinct.','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/01.jpg',964,NULL,'2025-07-27 20:45:10','2025-07-27 20:45:10'),(2,'Essential Qualities of Highly Successful Music','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/02.jpg',1286,NULL,'2025-07-27 20:45:10','2025-07-27 20:45:10'),(3,'9 Things I Love About Shaving My Head','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/03.jpg',1747,NULL,'2025-07-27 20:45:10','2025-07-27 20:45:10'),(4,'Why Teamwork Really Makes The Dream Work','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/04.jpg',2068,NULL,'2025-07-27 20:45:10','2025-07-27 20:45:10'),(5,'The World Caters to Average People','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/05.jpg',262,NULL,'2025-07-27 20:45:10','2025-07-27 20:45:10'),(6,'The litigants on the screen are not actors','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/06.jpg',2438,NULL,'2025-07-27 20:45:10','2025-07-27 20:45:10');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notification_recipients`
--

DROP TABLE IF EXISTS `push_notification_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notification_recipients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `push_notification_id` bigint unsigned NOT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `fcm_response` json DEFAULT NULL,
  `error_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pnr_notification_user_index` (`push_notification_id`,`user_type`,`user_id`),
  KEY `pnr_user_status_index` (`user_type`,`user_id`,`status`),
  KEY `pnr_user_read_index` (`user_type`,`user_id`,`read_at`),
  KEY `pnr_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notification_recipients`
--

LOCK TABLES `push_notification_recipients` WRITE;
/*!40000 ALTER TABLE `push_notification_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notification_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notifications`
--

DROP TABLE IF EXISTS `push_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_count` int NOT NULL DEFAULT '0',
  `failed_count` int NOT NULL DEFAULT '0',
  `delivered_count` int NOT NULL DEFAULT '0',
  `read_count` int NOT NULL DEFAULT '0',
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `push_notifications_type_created_at_index` (`type`,`created_at`),
  KEY `push_notifications_status_scheduled_at_index` (`status`,`scheduled_at`),
  KEY `push_notifications_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notifications`
--

LOCK TABLES `push_notifications` WRITE;
/*!40000 ALTER TABLE `push_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"sitemap.settings\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"room.index\":true,\"room.create\":true,\"room.edit\":true,\"room.destroy\":true,\"amenity.index\":true,\"amenity.create\":true,\"amenity.edit\":true,\"amenity.destroy\":true,\"food.index\":true,\"food.create\":true,\"food.edit\":true,\"food.destroy\":true,\"food-type.index\":true,\"food-type.create\":true,\"food-type.edit\":true,\"food-type.destroy\":true,\"booking.index\":true,\"booking.create\":true,\"booking.edit\":true,\"booking.destroy\":true,\"invoices.index\":true,\"invoices.edit\":true,\"invoices.destroy\":true,\"booking.reports.index\":true,\"booking.calendar.index\":true,\"booking-address.index\":true,\"booking-address.create\":true,\"booking-address.edit\":true,\"booking-address.destroy\":true,\"booking-room.index\":true,\"booking-room.create\":true,\"booking-room.edit\":true,\"booking-room.destroy\":true,\"customer.index\":true,\"customer.create\":true,\"customer.edit\":true,\"customer.destroy\":true,\"room-category.index\":true,\"room-category.create\":true,\"room-category.edit\":true,\"room-category.destroy\":true,\"feature.index\":true,\"feature.create\":true,\"feature.edit\":true,\"feature.destroy\":true,\"service.index\":true,\"service.create\":true,\"service.edit\":true,\"service.destroy\":true,\"place.index\":true,\"place.create\":true,\"place.edit\":true,\"place.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"invoice.template\":true,\"coupons.index\":true,\"coupons.create\":true,\"coupons.edit\":true,\"coupons.destroy\":true,\"hotel.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"translations.import\":true,\"translations.export\":true,\"property-translations.import\":true,\"property-translations.export\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"payments.logs\":true,\"payments.logs.show\":true,\"payments.logs.destroy\":true,\"social-login.settings\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2025-07-27 20:45:43','2025-07-27 20:45:43');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2025-07-27 20:45:50'),(3,'analytics_dashboard_widgets','0','2025-07-27 20:45:03','2025-07-27 20:45:03'),(4,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"gallery\",\"hotel\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"social-login\",\"sslcommerz\",\"stripe\",\"testimonial\",\"translation\"]',NULL,'2025-07-27 20:45:50'),(5,'enable_recaptcha_botble_contact_forms_fronts_contact_form','1','2025-07-27 20:45:04','2025-07-27 20:45:04'),(6,'enable_recaptcha_botble_newsletter_forms_fronts_newsletter_form','1','2025-07-27 20:45:06','2025-07-27 20:45:06'),(7,'payment_cod_fee_type','fixed',NULL,'2025-07-27 20:45:50'),(8,'payment_bank_transfer_fee_type','fixed',NULL,'2025-07-27 20:45:50'),(11,'language_hide_default','1',NULL,'2025-07-27 20:45:50'),(13,'language_display','all',NULL,'2025-07-27 20:45:50'),(14,'language_hide_languages','[]',NULL,'2025-07-27 20:45:50'),(15,'media_random_hash','779207b9d5d7406e0da94cf78bdd131d',NULL,'2025-07-27 20:45:50'),(16,'theme','miranda',NULL,'2025-07-27 20:45:50'),(17,'show_admin_bar','1',NULL,'2025-07-27 20:45:50'),(18,'language_switcher_display','dropdown',NULL,'2025-07-27 20:45:50'),(19,'admin_favicon','general/favicon.png',NULL,'2025-07-27 20:45:50'),(20,'admin_logo','general/logo-white.png',NULL,'2025-07-27 20:45:50'),(21,'permalink-botble-blog-models-post','news',NULL,'2025-07-27 20:45:50'),(22,'permalink-botble-blog-models-category','news',NULL,'2025-07-27 20:45:50'),(23,'payment_cod_status','1',NULL,'2025-07-27 20:45:50'),(24,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2025-07-27 20:45:50'),(25,'payment_bank_transfer_status','1',NULL,'2025-07-27 20:45:50'),(26,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,'2025-07-27 20:45:50'),(27,'payment_stripe_payment_type','stripe_checkout',NULL,'2025-07-27 20:45:50'),(28,'theme-miranda-site_title','Hotel Miranda',NULL,NULL),(29,'theme-miranda-seo_description','Miranda - Laravel Hotel & Resort Multilingual Booking System',NULL,NULL),(30,'theme-miranda-copyright','©%Y Miranda. All right reserved.',NULL,NULL),(31,'theme-miranda-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(32,'theme-miranda-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(33,'theme-miranda-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(34,'theme-miranda-homepage_id','1',NULL,NULL),(35,'theme-miranda-blog_page_id','2',NULL,NULL),(36,'theme-miranda-logo','general/logo.png',NULL,NULL),(37,'theme-miranda-logo_white','general/logo-white.png',NULL,NULL),(38,'theme-miranda-favicon','general/favicon.png',NULL,NULL),(39,'theme-miranda-email','info@webmail.com',NULL,NULL),(40,'theme-miranda-address','14/A, Miranda City, NYC',NULL,NULL),(41,'theme-miranda-hotline','+908 987 877 09',NULL,NULL),(42,'theme-miranda-news_banner','general/banner-news.jpg',NULL,NULL),(43,'theme-miranda-rooms_banner','general/banner-news.jpg',NULL,NULL),(44,'theme-miranda-term_of_use_url','#',NULL,NULL),(45,'theme-miranda-privacy_policy_url','#',NULL,NULL),(46,'theme-miranda-preloader_enabled','no',NULL,NULL),(47,'theme-miranda-about-us','Lorem ipsum dolor sit amet, consect etur adipisicing elit, sed doing eius mod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat ion ullamco laboris nisi.',NULL,NULL),(48,'theme-miranda-hotel_rules','<ul><li>No smoking, parties or events.</li><li>Check-in time from 2 PM, check-out by 10 AM.</li><li>Time to time car parking</li><li>Download Our minimal app</li><li>Browse regular our website</li></ul>',NULL,NULL),(49,'theme-miranda-cancellation','<p>Phasellus volutpat neque a tellus venenatis, a euismod augue facilisis. Fusce ut metus mattis, consequat metus nec, luctus lectus. Pellentesque orci quis hendrerit sed eu dolor. <strong>Cancel up</strong> to <strong>14 days</strong> to get a full refund.</p>',NULL,NULL),(50,'theme-miranda-slider-image-1','sliders/04.jpg',NULL,NULL),(51,'theme-miranda-slider-title-1','The ultimate luxury experience',NULL,NULL),(52,'theme-miranda-slider-description-1','<p>The Perfect<br>Base For You</p>',NULL,NULL),(53,'theme-miranda-slider-primary-button-text-1','Take A tour',NULL,NULL),(54,'theme-miranda-slider-primary-button-url-1','/rooms',NULL,NULL),(55,'theme-miranda-slider-secondary-button-text-1','About us',NULL,NULL),(56,'theme-miranda-slider-secondary-button-url-1','/about-us',NULL,NULL),(57,'theme-miranda-slider-image-2','sliders/05.jpg',NULL,NULL),(58,'theme-miranda-slider-title-2','The ultimate luxury experience',NULL,NULL),(59,'theme-miranda-slider-description-2','<p>The Perfect<br>Base For You</p>',NULL,NULL),(60,'theme-miranda-slider-primary-button-text-2','Take A tour',NULL,NULL),(61,'theme-miranda-slider-primary-button-url-2','/rooms',NULL,NULL),(62,'theme-miranda-slider-secondary-button-text-2','About us',NULL,NULL),(63,'theme-miranda-slider-secondary-button-url-2','/about-us',NULL,NULL),(64,'theme-miranda-primary_font','Archivo',NULL,NULL),(65,'theme-miranda-secondary_font','Old Standard TT',NULL,NULL),(66,'theme-miranda-tertiary_font','Roboto',NULL,NULL),(67,'theme-miranda-social_links','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\"}],[{\"key\":\"name\",\"value\":\"X (Twitter)\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/x.com\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.linkedin.com\"}]]',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'general',1,'Botble\\Blog\\Models\\Category','news','2025-07-27 20:45:09','2025-07-27 20:45:43'),(2,'hotel',2,'Botble\\Blog\\Models\\Category','news','2025-07-27 20:45:09','2025-07-27 20:45:43'),(3,'booking',3,'Botble\\Blog\\Models\\Category','news','2025-07-27 20:45:09','2025-07-27 20:45:43'),(4,'resort',4,'Botble\\Blog\\Models\\Category','news','2025-07-27 20:45:09','2025-07-27 20:45:43'),(5,'travel',5,'Botble\\Blog\\Models\\Category','news','2025-07-27 20:45:09','2025-07-27 20:45:43'),(6,'general',1,'Botble\\Blog\\Models\\Tag','tag','2025-07-27 20:45:09','2025-07-27 20:45:09'),(7,'hotel',2,'Botble\\Blog\\Models\\Tag','tag','2025-07-27 20:45:09','2025-07-27 20:45:09'),(8,'booking',3,'Botble\\Blog\\Models\\Tag','tag','2025-07-27 20:45:09','2025-07-27 20:45:09'),(9,'resort',4,'Botble\\Blog\\Models\\Tag','tag','2025-07-27 20:45:09','2025-07-27 20:45:09'),(10,'travel',5,'Botble\\Blog\\Models\\Tag','tag','2025-07-27 20:45:10','2025-07-27 20:45:10'),(11,'each-of-our-8-double-rooms-has-its-own-distinct',1,'Botble\\Blog\\Models\\Post','news','2025-07-27 20:45:10','2025-07-27 20:45:43'),(12,'essential-qualities-of-highly-successful-music',2,'Botble\\Blog\\Models\\Post','news','2025-07-27 20:45:10','2025-07-27 20:45:43'),(13,'9-things-i-love-about-shaving-my-head',3,'Botble\\Blog\\Models\\Post','news','2025-07-27 20:45:10','2025-07-27 20:45:43'),(14,'why-teamwork-really-makes-the-dream-work',4,'Botble\\Blog\\Models\\Post','news','2025-07-27 20:45:10','2025-07-27 20:45:43'),(15,'the-world-caters-to-average-people',5,'Botble\\Blog\\Models\\Post','news','2025-07-27 20:45:10','2025-07-27 20:45:43'),(16,'the-litigants-on-the-screen-are-not-actors',6,'Botble\\Blog\\Models\\Post','news','2025-07-27 20:45:10','2025-07-27 20:45:43'),(17,'luxury-hall-of-fame',1,'Botble\\Hotel\\Models\\Room','rooms','2025-07-27 20:45:15','2025-07-27 20:45:15'),(18,'pendora-fame',2,'Botble\\Hotel\\Models\\Room','rooms','2025-07-27 20:45:15','2025-07-27 20:45:15'),(19,'pacific-room',3,'Botble\\Hotel\\Models\\Room','rooms','2025-07-27 20:45:15','2025-07-27 20:45:15'),(20,'junior-suite',4,'Botble\\Hotel\\Models\\Room','rooms','2025-07-27 20:45:15','2025-07-27 20:45:15'),(21,'family-suite',5,'Botble\\Hotel\\Models\\Room','rooms','2025-07-27 20:45:15','2025-07-27 20:45:15'),(22,'relax-suite',6,'Botble\\Hotel\\Models\\Room','rooms','2025-07-27 20:45:15','2025-07-27 20:45:15'),(23,'luxury-suite',7,'Botble\\Hotel\\Models\\Room','rooms','2025-07-27 20:45:15','2025-07-27 20:45:15'),(24,'president-room',8,'Botble\\Hotel\\Models\\Room','rooms','2025-07-27 20:45:15','2025-07-27 20:45:15'),(25,'quality-room',1,'Botble\\Hotel\\Models\\Service','services','2025-07-27 20:45:24','2025-07-27 20:45:24'),(26,'privet-beach',2,'Botble\\Hotel\\Models\\Service','services','2025-07-27 20:45:24','2025-07-27 20:45:24'),(27,'best-accommodation',3,'Botble\\Hotel\\Models\\Service','services','2025-07-27 20:45:24','2025-07-27 20:45:24'),(28,'wellness-spa',4,'Botble\\Hotel\\Models\\Service','services','2025-07-27 20:45:24','2025-07-27 20:45:24'),(29,'restaurants-bars',5,'Botble\\Hotel\\Models\\Service','services','2025-07-27 20:45:24','2025-07-27 20:45:24'),(30,'special-offers',6,'Botble\\Hotel\\Models\\Service','services','2025-07-27 20:45:24','2025-07-27 20:45:24'),(31,'duplex-restaurant',1,'Botble\\Hotel\\Models\\Place','places','2025-07-27 20:45:36','2025-07-27 20:45:36'),(32,'overnight-bars',2,'Botble\\Hotel\\Models\\Place','places','2025-07-27 20:45:36','2025-07-27 20:45:36'),(33,'beautiful-beach',3,'Botble\\Hotel\\Models\\Place','places','2025-07-27 20:45:36','2025-07-27 20:45:36'),(34,'beautiful-spa',4,'Botble\\Hotel\\Models\\Place','places','2025-07-27 20:45:36','2025-07-27 20:45:36'),(35,'duplex-golf',5,'Botble\\Hotel\\Models\\Place','places','2025-07-27 20:45:36','2025-07-27 20:45:36'),(36,'luxury-restaurant',6,'Botble\\Hotel\\Models\\Place','places','2025-07-27 20:45:36','2025-07-27 20:45:36'),(37,'homepage',1,'Botble\\Page\\Models\\Page','','2025-07-27 20:45:36','2025-07-27 20:45:36'),(38,'news',2,'Botble\\Page\\Models\\Page','','2025-07-27 20:45:36','2025-07-27 20:45:36'),(39,'contact',3,'Botble\\Page\\Models\\Page','','2025-07-27 20:45:36','2025-07-27 20:45:36'),(40,'restaurant',4,'Botble\\Page\\Models\\Page','','2025-07-27 20:45:36','2025-07-27 20:45:36'),(41,'our-gallery',5,'Botble\\Page\\Models\\Page','','2025-07-27 20:45:36','2025-07-27 20:45:36'),(42,'about-us',6,'Botble\\Page\\Models\\Page','','2025-07-27 20:45:36','2025-07-27 20:45:36'),(43,'places',7,'Botble\\Page\\Models\\Page','','2025-07-27 20:45:36','2025-07-27 20:45:36'),(44,'our-offers',8,'Botble\\Page\\Models\\Page','','2025-07-27 20:45:36','2025-07-27 20:45:36'),(45,'cookie-policy',9,'Botble\\Page\\Models\\Page','','2025-07-27 20:45:36','2025-07-27 20:45:36'),(46,'duplex-restaurant',1,'Botble\\Gallery\\Models\\Gallery','galleries','2025-07-27 20:45:42','2025-07-27 20:45:42'),(47,'luxury-room',2,'Botble\\Gallery\\Models\\Gallery','galleries','2025-07-27 20:45:42','2025-07-27 20:45:42'),(48,'pacific-room',3,'Botble\\Gallery\\Models\\Gallery','galleries','2025-07-27 20:45:42','2025-07-27 20:45:42'),(49,'family-room',4,'Botble\\Gallery\\Models\\Gallery','galleries','2025-07-27 20:45:42','2025-07-27 20:45:42'),(50,'king-bed',5,'Botble\\Gallery\\Models\\Gallery','galleries','2025-07-27 20:45:42','2025-07-27 20:45:42'),(51,'special-foods',6,'Botble\\Gallery\\Models\\Gallery','galleries','2025-07-27 20:45:42','2025-07-27 20:45:42'),(52,'luxury',1,'Botble\\Hotel\\Models\\RoomCategory','room-categories','2025-07-27 20:45:53','2025-07-27 20:45:53'),(53,'family',2,'Botble\\Hotel\\Models\\RoomCategory','room-categories','2025-07-27 20:45:53','2025-07-27 20:45:53'),(54,'double-bed',3,'Botble\\Hotel\\Models\\RoomCategory','room-categories','2025-07-27 20:45:53','2025-07-27 20:45:53'),(55,'relax',4,'Botble\\Hotel\\Models\\RoomCategory','room-categories','2025-07-27 20:45:53','2025-07-27 20:45:53'),(56,'eggs-bacon',1,'Botble\\Hotel\\Models\\Food','foods','2025-07-27 20:45:53','2025-07-27 20:45:53'),(57,'tea-or-coffee',2,'Botble\\Hotel\\Models\\Food','foods','2025-07-27 20:45:53','2025-07-27 20:45:53'),(58,'chia-oatmeal',3,'Botble\\Hotel\\Models\\Food','foods','2025-07-27 20:45:53','2025-07-27 20:45:53'),(59,'juice',4,'Botble\\Hotel\\Models\\Food','foods','2025-07-27 20:45:53','2025-07-27 20:45:53'),(60,'chia-oatmeal',5,'Botble\\Hotel\\Models\\Food','foods','2025-07-27 20:45:53','2025-07-27 20:45:53'),(61,'fruit-parfait',6,'Botble\\Hotel\\Models\\Food','foods','2025-07-27 20:45:53','2025-07-27 20:45:53'),(62,'marmalade-selection',7,'Botble\\Hotel\\Models\\Food','foods','2025-07-27 20:45:53','2025-07-27 20:45:53'),(63,'cheese-platen',8,'Botble\\Hotel\\Models\\Food','foods','2025-07-27 20:45:53','2025-07-27 20:45:53'),(64,'avocado-toast',9,'Botble\\Hotel\\Models\\Food','foods','2025-07-27 20:45:53','2025-07-27 20:45:53'),(65,'avocado-toast',10,'Botble\\Hotel\\Models\\Food','foods','2025-07-27 20:45:53','2025-07-27 20:45:53');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `provider_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_logins_provider_provider_id_unique` (`provider`,`provider_id`),
  KEY `social_logins_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `social_logins_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_logins`
--

LOCK TABLES `social_logins` WRITE;
/*!40000 ALTER TABLE `social_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-07-27 20:45:09','2025-07-27 20:45:09'),(2,'Hotel',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-07-27 20:45:09','2025-07-27 20:45:09'),(3,'Booking',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-07-27 20:45:09','2025-07-27 20:45:09'),(4,'Resort',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-07-27 20:45:09','2025-07-27 20:45:09'),(5,'Travel',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-07-27 20:45:09','2025-07-27 20:45:09');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Adam Williams','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/01.png','CEO Of Microsoft','published','2025-07-27 20:45:38','2025-07-27 20:45:38'),(2,'Retha Deowalim','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/02.png','CEO Of Apple','published','2025-07-27 20:45:38','2025-07-27 20:45:38'),(3,'Sam J. Wasim','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/03.png','Pio Founder','published','2025-07-27 20:45:38','2025-07-27 20:45:38');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_settings_user_type_user_id_key_unique` (`user_type`,`user_id`,`key`),
  KEY `user_settings_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `user_settings_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'emmett58@hodkiewicz.net',NULL,NULL,'$2y$12$hrmaTOqk253T7sqVg07K9uPgoPimfSKI32fl7gkCpXpMiLQdBPQKy',NULL,'2025-07-27 20:45:43','2025-07-27 20:45:43','Krystel','Hessel','admin',56,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'CustomMenuWidget','footer_sidebar','miranda',0,'{\"id\":\"CustomMenuWidget\",\"name\":\"Services.\",\"menu_id\":\"services\"}','2025-07-27 20:45:50','2025-07-27 20:45:50'),(2,'RecentPostsWidget','primary_sidebar','miranda',0,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent posts\",\"number_display\":5}','2025-07-27 20:45:50','2025-07-27 20:45:50'),(3,'BlogCategoriesWidget','primary_sidebar','miranda',1,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\",\"number_display\":5}','2025-07-27 20:45:50','2025-07-27 20:45:50'),(4,'BlogTagsWidget','primary_sidebar','miranda',2,'{\"id\":\"BlogTagsWidget\",\"name\":\"Popular Tags\",\"number_display\":5}','2025-07-27 20:45:50','2025-07-27 20:45:50');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-28 10:45:55
