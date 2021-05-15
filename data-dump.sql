-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: homestead
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts` (
  `contractid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_fk` int(10) unsigned NOT NULL,
  `tid_fk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateexecuted` date DEFAULT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leaserbuyer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datesold` date DEFAULT NULL,
  `paymenttype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contractprice` double(20,2) DEFAULT NULL,
  `startcontract` date DEFAULT NULL,
  `endcontract` date DEFAULT NULL,
  `contractperiod` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amortprice` double(20,2) DEFAULT NULL,
  `leasedeposit` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downpayment` double(20,2) DEFAULT NULL,
  `interest` double(4,2) DEFAULT NULL,
  `installpaymenttype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installtimetopay` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installpayment` int(11) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`contractid`),
  KEY `contracts_user_fk_foreign` (`user_fk`),
  KEY `contracts_tid_fk_foreign` (`tid_fk`),
  CONSTRAINT `contracts_tid_fk_foreign` FOREIGN KEY (`tid_fk`) REFERENCES `transactions` (`tid`),
  CONSTRAINT `contracts_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (1,5,'sl1','2021-04-14','SM City','Ted','2021-04-14','Cash',5000000.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active');
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criterias`
--

DROP TABLE IF EXISTS `criterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criterias` (
  `cId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cdesc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cscore` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criterias`
--

LOCK TABLES `criterias` WRITE;
/*!40000 ALTER TABLE `criterias` DISABLE KEYS */;
INSERT INTO `criterias` VALUES (1,'pricereasonability',40),(2,'establishment',30),(3,'userpreference',20),(4,'proximity',10);
/*!40000 ALTER TABLE `criterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `dId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileExt` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filetype` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tid` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`dId`),
  KEY `documents_tid_foreign` (`tid`),
  CONSTRAINT `documents_tid_foreign` FOREIGN KEY (`tid`) REFERENCES `transactions` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'http://localhost:8000/storage/files/This is the SM Seaside commercial lot Title.docx','image','sl1'),(2,'http://localhost:8000/storage/files/This is SM seaside commercial lot property tax declaration.docx','image','sl1'),(8,'http://localhost:8000/storage/files/taxdec.jpg','image','sl2');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estabscores`
--

DROP TABLE IF EXISTS `estabscores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estabscores` (
  `eId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estab` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `escore` int(10) unsigned NOT NULL,
  PRIMARY KEY (`eId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estabscores`
--

LOCK TABLES `estabscores` WRITE;
/*!40000 ALTER TABLE `estabscores` DISABLE KEYS */;
INSERT INTO `estabscores` VALUES (1,'convenience_store',1),(2,'home_goods_store',2),(3,'department_store',3),(4,'pharmacy',4),(5,'police',5),(6,'fire_station',6),(7,'hospital',7),(8,'school',8);
/*!40000 ALTER TABLE `estabscores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemintents`
--

DROP TABLE IF EXISTS `itemintents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemintents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_fk` int(10) unsigned NOT NULL,
  `tid_fk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemintents_user_fk_foreign` (`user_fk`),
  KEY `itemintents_tid_fk_foreign` (`tid_fk`),
  CONSTRAINT `itemintents_tid_fk_foreign` FOREIGN KEY (`tid_fk`) REFERENCES `transactions` (`tid`),
  CONSTRAINT `itemintents_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemintents`
--

LOCK TABLES `itemintents` WRITE;
/*!40000 ALTER TABLE `itemintents` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemintents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itempurchases`
--

DROP TABLE IF EXISTS `itempurchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itempurchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_fk` int(10) unsigned NOT NULL,
  `tid_fk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itempurchases_user_fk_foreign` (`user_fk`),
  KEY `itempurchases_tid_fk_foreign` (`tid_fk`),
  CONSTRAINT `itempurchases_tid_fk_foreign` FOREIGN KEY (`tid_fk`) REFERENCES `transactions` (`tid`),
  CONSTRAINT `itempurchases_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itempurchases`
--

LOCK TABLES `itempurchases` WRITE;
/*!40000 ALTER TABLE `itempurchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `itempurchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemvieweds`
--

DROP TABLE IF EXISTS `itemvieweds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemvieweds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_fk` int(10) unsigned NOT NULL,
  `lotId_fk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemvieweds_user_fk_foreign` (`user_fk`),
  KEY `itemvieweds_lotid_fk_foreign` (`lotId_fk`),
  CONSTRAINT `itemvieweds_lotid_fk_foreign` FOREIGN KEY (`lotId_fk`) REFERENCES `lots` (`lotId`),
  CONSTRAINT `itemvieweds_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemvieweds`
--

LOCK TABLES `itemvieweds` WRITE;
/*!40000 ALTER TABLE `itemvieweds` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemvieweds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lothistories`
--

DROP TABLE IF EXISTS `lothistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lothistories` (
  `hId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lotId` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_fk` int(10) unsigned NOT NULL,
  `oldOwner` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`hId`),
  KEY `lothistories_lotid_foreign` (`lotId`),
  KEY `lothistories_user_fk_foreign` (`user_fk`),
  CONSTRAINT `lothistories_lotid_foreign` FOREIGN KEY (`lotId`) REFERENCES `lots` (`lotId`),
  CONSTRAINT `lothistories_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lothistories`
--

LOCK TABLES `lothistories` WRITE;
/*!40000 ALTER TABLE `lothistories` DISABLE KEYS */;
/*!40000 ALTER TABLE `lothistories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lots`
--

DROP TABLE IF EXISTS `lots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lots` (
  `lotId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lotNumber` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lotTitleNumber` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotAddress` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lotOwner` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lotCornerInfluence` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lotType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lotArea` double(30,4) NOT NULL,
  `unitOfMeasure` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lotUnitValue` int(11) NOT NULL,
  `lotAdjustment` int(11) NOT NULL,
  `rightOfWay` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lotMarketValue` int(11) DEFAULT NULL,
  `mortgage` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotNEBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotNWBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotSEBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotSWBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotNBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotEBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotSBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotWBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` double(20,17) DEFAULT NULL,
  `lng` double(20,17) DEFAULT NULL,
  `cityAdmin` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lotId`),
  KEY `lots_cityadmin_foreign` (`cityAdmin`),
  CONSTRAINT `lots_cityadmin_foreign` FOREIGN KEY (`cityAdmin`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lots`
--

LOCK TABLES `lots` WRITE;
/*!40000 ALTER TABLE `lots` DISABLE KEYS */;
INSERT INTO `lots` VALUES ('lot 0013','101784-PPSD','111213','W Geonzon St, Cebu City, Cebu','Ayala Land ','YES','Commercial Lot',10800.0000,'SQM',30000,100,'YES',324000000,'YES','Lot 3 ','Lot 1','NONE','NONE','Lot 20','NONE','NONE','NONE',10.33000000000000000,123.90600000000000000,9),('lot 0014','129132-PSD','111415','UP High School Covered Court, Molave St, Cebu City, Cebu','University of Philppines','YES','Commercial Lot',14000.0000,'SQM',50000,50,'YES',700000000,'YES','none','none','none','none','none','none','none','none',10.32200000000000000,123.90000000000000000,9),('lot 0015','231515-PSD','226143','V. Rama Ave., Cor. Quijada St., Guadalupe, Cebu City','Cebu Landmasters Inc','YES','Residential Lot',500.0000,'SQM',20000,100,'Motorcycle Car',10000000,'YES','NONE','NONE','NONE','NONE','LOT25','LOT23','NONE','NONE',10.32200000000000000,123.90000000000000000,9),('lot 0016','861240-PSD','138102','Salvador Street, Labangon, Cebu City','Cebu Landmasters Inc','YES','Residential Lot',300.0000,'SQM',15000,50,'YES',4500000,'YES','LOT5','LOT6','NONE','NONE','LOT7','LOT8','NONE','NONE',10.30100000000000000,123.87800000000000000,9),('lot 0017','591230-PSD','51235','Apas, Cebu City, Cebu','Cebu Landmasters Inc','YES','Residential Lot',150.0000,'SQM',15000,100,'YES',2250000,'YES','NONE\r\n','NONE','NONE','NONE','LOT6\r\n','LOT8','NONE','NONE',10.34000000000000000,123.90800000000000000,9),('lot001','lot 546 67673-PPSD','12345','SM Seaside City Cebu','SM City','YES','Commercial Lot',1000.0000,'sqm',50000,100,'Motorcycle Car DumpTruck TenWheelerTruck',50000000,'YES','30; 60','srp ROAD','OCEAN','OCEAN','NONE','NONE','NONE','NONE',10.28190000000000000,123.88540000000000000,9),('lot002','lot 724 12353-PPSD','23456','Monterrazas, Guadalupe, Cebu','Carlo Hernan','YES','Residential Lot',450.0000,'sqm',10000,20,'YES',45000000,'YES','51; 70','Guadalupe Mountain','Guadalupe Mountain','NONE','NONE','NONE','NONE','NONE',10.33370000000000000,123.87098000000000000,9),('lot003','lot 324 91353-PPSD','45678','San Carlos Heights Subdivision, Brgy. Quiot, Cebu City','Adrian Maglahus','YES','Residential Lot',770.0000,'sqm',13000,30,'10010000',10010000,'YES','Drainage','none','none','none','none','none','none','none',10.28989062427850000,123.85890739740100000,9),('lot004','lot 125 48623-PPSD','67900','Sto. Niño, Cebu City, Cebu','Sto. Nino Parish Church','YES','Commercial Lot',50.0000,'sqm',5000,5,'YES',250000,'YES','60; 40','Santo Nino Street','none','none','none','none','none','none',123.86006611169500000,10.29523205649300000,9),('lot005','lot 324 91353-PPSD','90122','Sunny Hills Subdivision, Talamban, Cebu','Bobby Uy','YES','Residential Lot',346.0000,'sqm',20000,50,'YES',6920000,'YES','30; 61','LOT15','NONE','NONE','NONE','NONE','NONE','NONE',10.36910000000000000,123.91558000000000000,9);
/*!40000 ALTER TABLE `lots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lottypes`
--

DROP TABLE IF EXISTS `lottypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lottypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lotType` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lottypes`
--

LOCK TABLES `lottypes` WRITE;
/*!40000 ALTER TABLE `lottypes` DISABLE KEYS */;
INSERT INTO `lottypes` VALUES (1,'Residential Lot'),(2,'Commercial Lot'),(3,'Agricultural Lot');
/*!40000 ALTER TABLE `lottypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_04_28_032953_create_lots_table',1),(4,'2018_05_19_111145_create_transactions_table',1),(5,'2018_05_19_111202_create_panoimages_table',1),(6,'2018_05_20_015943_create_transactiontrails_table',1),(7,'2018_05_22_103444_create_lottypes_table',1),(8,'2018_06_12_151546_create_profiles_table',1),(9,'2018_06_14_075002_create_documents_table',1),(10,'2018_06_15_081918_create_sellingtypes_table',1),(11,'2018_07_21_054440_create_lothistories_table',1),(12,'2018_07_24_082027_create_soldleasedlots_table',1),(13,'2018_09_10_012546_create_notifications_table',1),(14,'2018_09_30_013842_create_months_table',1),(15,'2018_09_30_014418_create_prices_table',1),(16,'2018_09_30_092207_create_payment_types_table',1),(17,'2018_12_10_135330_create_tertiarysectors_table',1),(18,'2019_03_11_235154_create_itemvieweds_table',1),(19,'2019_03_11_235358_create_itemintents_table',1),(20,'2019_03_12_020026_create_itempurchases_table',1),(21,'2019_03_12_223713_create_pending_owned_lots',1),(22,'2019_03_15_061709_create_properties_table',1),(23,'2019_03_18_122623_create_contracts_table',1),(24,'2019_03_23_121312_create_radiusscores_table',1),(25,'2019_03_23_121624_create_pricescores_table',1),(26,'2019_03_23_121732_create_criterias_table',1),(27,'2019_03_23_123930_create_estabscores_table',1),(28,'2019_03_23_132240_create_priceranges_table',1),(29,'2019_03_23_134720_create_radiusranges_table',1),(30,'2019_03_23_161516_create_userpreferences_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `months`
--

DROP TABLE IF EXISTS `months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `months` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `month` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `months`
--

LOCK TABLES `months` WRITE;
/*!40000 ALTER TABLE `months` DISABLE KEYS */;
INSERT INTO `months` VALUES (1,'1 month'),(2,'2 months'),(3,'3 months'),(4,'4 months'),(5,'5 months'),(6,'6 months'),(7,'7 months'),(8,'8 months'),(9,'9 months'),(10,'10 months'),(11,'11 months'),(12,'12 months'),(13,'2 years'),(14,'3 years'),(15,'4 years'),(16,'5 years'),(17,'6 years'),(18,'7 years'),(19,'8 years'),(20,'9 years'),(21,'10 years'),(22,'11 years'),(23,'12 years'),(24,'13 years'),(25,'14 years'),(26,'15 years'),(27,'16 years'),(28,'17 years'),(29,'18 years'),(30,'19 years'),(31,'20 years');
/*!40000 ALTER TABLE `months` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tid_fk` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('1a5d3a7b-12d9-419a-a915-180371a5fd99','sl1','App\\Notifications\\NotifyUser','App\\User',5,'\"A property posted by Juvjuv Recitas, located at SM Seaside City Cebu is marked as sold to you.\"','2021-04-14 01:21:09','2021-04-14 01:20:01','2021-04-14 01:21:09'),('e2023ecb-5c6b-46cc-a772-40bf613688c6','sl1','App\\Notifications\\NotifyUser','App\\User',3,'\"Ted is interested to buy your property located at SM Seaside City Cebu.\"','2021-04-14 01:18:32','2021-04-14 01:17:46','2021-04-14 01:18:32');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panoimages`
--

DROP TABLE IF EXISTS `panoimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panoimages` (
  `panoId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileExt` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filetype` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lotId_fk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`panoId`),
  KEY `panoimages_lotid_fk_foreign` (`lotId_fk`),
  CONSTRAINT `panoimages_lotid_fk_foreign` FOREIGN KEY (`lotId_fk`) REFERENCES `lots` (`lotId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panoimages`
--

LOCK TABLES `panoimages` WRITE;
/*!40000 ALTER TABLE `panoimages` DISABLE KEYS */;
INSERT INTO `panoimages` VALUES (2,'http://localhost:8000/storage/files/SM Seaside City Cebu_site.jpg','image','lot001'),(8,'http://localhost:8000/storage/files/pano.jpg','image','lot 0015');
/*!40000 ALTER TABLE `panoimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymenttypes`
--

DROP TABLE IF EXISTS `paymenttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymenttypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paymentType` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenttypes`
--

LOCK TABLES `paymenttypes` WRITE;
/*!40000 ALTER TABLE `paymenttypes` DISABLE KEYS */;
INSERT INTO `paymenttypes` VALUES (1,'Monthly'),(2,'Quarterly'),(3,'Semi-Annual'),(4,'Anually');
/*!40000 ALTER TABLE `paymenttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendingownedlots`
--

DROP TABLE IF EXISTS `pendingownedlots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pendingownedlots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_fk` int(10) unsigned NOT NULL,
  `lotOwner` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotNumber` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotTitleNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotArea` int(11) DEFAULT NULL,
  `unitOfMeasure` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotNorthWestBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotNorthEastBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotSouthWestBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotSouthEastBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotNorthBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotSouthBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotWestBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lotEastBoundary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pendingownedlots_user_fk_foreign` (`user_fk`),
  CONSTRAINT `pendingownedlots_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendingownedlots`
--

LOCK TABLES `pendingownedlots` WRITE;
/*!40000 ALTER TABLE `pendingownedlots` DISABLE KEYS */;
INSERT INTO `pendingownedlots` VALUES (1,3,'Cebu Landmasters Inc','861240-PSD','138102','Residential Lot',300,'sqm','lot 6','lot 5','lot 8','lot 7','none','none','none','none','pending','2021-04-14 22:34:41','2021-04-14 22:34:41');
/*!40000 ALTER TABLE `pendingownedlots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priceranges`
--

DROP TABLE IF EXISTS `priceranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priceranges` (
  `rangeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rangedesc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rangescore` int(11) NOT NULL,
  PRIMARY KEY (`rangeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priceranges`
--

LOCK TABLES `priceranges` WRITE;
/*!40000 ALTER TABLE `priceranges` DISABLE KEYS */;
INSERT INTO `priceranges` VALUES (1,'low',-500),(2,'fair',500);
/*!40000 ALTER TABLE `priceranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,1000),(2,5000),(3,10000),(4,20000),(5,30000),(6,40000),(7,50000),(8,60000),(9,70000),(10,80000),(11,90000),(12,100000),(13,200000),(14,500000),(15,600000),(16,700000),(17,800000),(18,900000),(19,1000000),(20,2000000),(21,3000000),(22,4000000),(23,5000000),(24,6000000),(25,7000000),(26,8000000),(27,9000000),(28,10000000),(29,11000000),(30,12000000),(31,13000000),(32,14000000),(33,15000000),(34,16000000),(35,17000000),(36,18000000),(37,19000000),(38,20000000);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricescores`
--

DROP TABLE IF EXISTS `pricescores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricescores` (
  `pId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pdesc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pscore` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricescores`
--

LOCK TABLES `pricescores` WRITE;
/*!40000 ALTER TABLE `pricescores` DISABLE KEYS */;
INSERT INTO `pricescores` VALUES (1,'low',100),(2,'fair',67),(3,'high',33);
/*!40000 ALTER TABLE `pricescores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `profileId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileExt` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_fk` int(10) unsigned NOT NULL,
  PRIMARY KEY (`profileId`),
  KEY `profiles_user_fk_foreign` (`user_fk`),
  CONSTRAINT `profiles_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lotId` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_fk` int(10) unsigned NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `properties_lotid_foreign` (`lotId`),
  KEY `properties_user_fk_foreign` (`user_fk`),
  CONSTRAINT `properties_lotid_foreign` FOREIGN KEY (`lotId`) REFERENCES `lots` (`lotId`),
  CONSTRAINT `properties_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,'lot001',5,'new','2021-04-14 00:56:08','2021-04-14 01:20:01'),(2,'lot 0015',3,'posted','2021-04-14 22:44:45','2021-04-14 22:52:11');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radiusranges`
--

DROP TABLE IF EXISTS `radiusranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radiusranges` (
  `radiusId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `radiusdesc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `radiuskm` int(10) unsigned NOT NULL,
  PRIMARY KEY (`radiusId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radiusranges`
--

LOCK TABLES `radiusranges` WRITE;
/*!40000 ALTER TABLE `radiusranges` DISABLE KEYS */;
INSERT INTO `radiusranges` VALUES (1,'near',10),(2,'fair',20);
/*!40000 ALTER TABLE `radiusranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radiusscores`
--

DROP TABLE IF EXISTS `radiusscores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radiusscores` (
  `rId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rdesc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rscore` int(10) unsigned NOT NULL,
  PRIMARY KEY (`rId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radiusscores`
--

LOCK TABLES `radiusscores` WRITE;
/*!40000 ALTER TABLE `radiusscores` DISABLE KEYS */;
INSERT INTO `radiusscores` VALUES (1,'near',100),(2,'fair',67),(3,'far',33);
/*!40000 ALTER TABLE `radiusscores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellingtypes`
--

DROP TABLE IF EXISTS `sellingtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellingtypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sellingType` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellingtypes`
--

LOCK TABLES `sellingtypes` WRITE;
/*!40000 ALTER TABLE `sellingtypes` DISABLE KEYS */;
INSERT INTO `sellingtypes` VALUES (1,'For Sale'),(2,'For Lease');
/*!40000 ALTER TABLE `sellingtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soldleasedlots`
--

DROP TABLE IF EXISTS `soldleasedlots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soldleasedlots` (
  `soldleased_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_fk` int(10) unsigned NOT NULL,
  `tid_fk` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`soldleased_id`),
  KEY `soldleasedlots_user_fk_foreign` (`user_fk`),
  KEY `soldleasedlots_tid_fk_foreign` (`tid_fk`),
  CONSTRAINT `soldleasedlots_tid_fk_foreign` FOREIGN KEY (`tid_fk`) REFERENCES `transactions` (`tid`),
  CONSTRAINT `soldleasedlots_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soldleasedlots`
--

LOCK TABLES `soldleasedlots` WRITE;
/*!40000 ALTER TABLE `soldleasedlots` DISABLE KEYS */;
/*!40000 ALTER TABLE `soldleasedlots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tertiarysectors`
--

DROP TABLE IF EXISTS `tertiarysectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tertiarysectors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` double(30,27) NOT NULL,
  `lat` double(30,27) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tertiarysectors`
--

LOCK TABLES `tertiarysectors` WRITE;
/*!40000 ALTER TABLE `tertiarysectors` DISABLE KEYS */;
INSERT INTO `tertiarysectors` VALUES (1,'convenience_store','Hingwa Agrivet Store',123.947520700000040000000000000,10.413852900000000000000000000),(2,'convenience_store','GY Convenience Store',123.891706000000000000000000000,10.313440000000000000000000000),(3,'convenience_store','7-Eleven',123.890204400000020000000000000,10.315792700000000000000000000),(4,'convenience_store','Asia Town Trading',123.891548199999990000000000000,10.313734400000000000000000000),(5,'convenience_store','Quik Stop',123.892163999999980000000000000,10.309933000000000000000000000),(6,'convenience_store','Hey Joe 24/7 Convenience Store Jllorente',123.893904300000030000000000000,10.311441400000000000000000000),(7,'convenience_store','Ministop',123.882275800000000000000000000,10.326353300000000000000000000),(8,'convenience_store','24 Seven Quick Mart',123.894815000000000000000000000,10.308852000000000000000000000),(9,'convenience_store','Kenshee Store',123.900925100000000000000000000,10.304904800000000000000000000),(10,'convenience_store','Asia Town Trading',123.891548199999990000000000000,10.313734400000000000000000000),(11,'convenience_store','7-Eleven',123.893935699999930000000000000,10.317499200000000000000000000),(12,'convenience_store','7-Eleven',123.895107800000000000000000000,10.310507700000000000000000000),(13,'convenience_store','7-Eleven',123.901124400000070000000000000,10.309576800000000000000000000),(14,'convenience_store','7-Eleven',123.884868999999980000000000000,10.298024900000000000000000000),(15,'convenience_store','7-Eleven',123.897917000000000000000000000,10.329683000000000000000000000),(16,'convenience_store','7-Eleven',123.888347699999940000000000000,10.297153600000000000000000000),(17,'convenience_store','7-Eleven',123.904384899999970000000000000,10.313056900000000000000000000),(18,'department_store','Robinsons Department Store - Fuente',123.894077899999960000000000000,10.309247700000000000000000000),(19,'department_store','Calvin Klein',123.903678000000010000000000000,10.317896000000000000000000000),(20,'department_store','Metro Department Store',123.903968999999960000000000000,10.317741000000000000000000000),(21,'department_store','Hotflops - Ayala Center Cebue',123.904606999999940000000000000,10.318466000000000000000000000),(22,'department_store','Officine Shoes And Bags',123.904618000000030000000000000,10.318550000000000000000000000),(23,'department_store','Loalde Boutique',123.904611100000010000000000000,10.318645300000000000000000000),(24,'department_store','Folded&Hung',123.904660299999930000000000000,10.318845200000000000000000000),(25,'home_goods_store','Mapulo',123.941918100000070000000000000,10.427546400000000000000000000),(26,'home_goods_store','Pit-os Hardware and General Merchamdise',123.921913500000070000000000000,10.396065600000000000000000000),(27,'home_goods_store','Nena Store',123.942008600000010000000000000,10.409175200000000000000000000),(28,'home_goods_store','Ermac Airconditioning Trading and Services Main',123.946735200000030000000000000,10.416668700000000000000000000),(29,'home_goods_store','Rolando Balili',123.914909399999940000000000000,10.387595100000000000000000000),(30,'home_goods_store','Limarie Cantano House And Sari Sari Store',123.941521800000030000000000000,10.394225800000000000000000000),(31,'home_goods_store','Janet Store',123.916550100000000000000000000,10.384752600000000000000000000),(32,'home_goods_store','Agua De Gloria Water Station',123.915874199999960000000000000,10.383843000000000000000000000),(33,'home_goods_store','Sm Appliance Center',123.917251999999960000000000000,10.311478000000000000000000000),(34,'home_goods_store','Imperial Appliance Plaza',123.902400299999950000000000000,10.294578100000000000000000000),(35,'home_goods_store','Robinsons Appliances',123.894224399999980000000000000,10.309485500000000000000000000),(36,'pharmacy','TGP The Generics Pharmacy',123.931423799999950000000000000,10.432057200000000000000000000),(37,'pharmacy','K&A Pharmacy',123.920942999999970000000000000,10.396554000000000000000000000),(38,'pharmacy','Melchizedek Pharmacy',123.921573999999960000000000000,10.396512900000000000000000000),(39,'pharmacy','Best Buy Pharmacy',123.921918000000000000000000000,10.395818000000000000000000000),(40,'pharmacy','JB Orhcid Pharmaceuticals Inc.',123.950279000000020000000000000,10.431345000000000000000000000),(41,'pharmacy','Subdivision Pharmacy and General Merchandise',123.918014099999940000000000000,10.386235000000000000000000000),(42,'pharmacy','Rx Pharmacy',123.917646099999960000000000000,10.386142000000000000000000000),(43,'bank','Consolacion Multi-Purpose Cooperative',123.934578900000020000000000000,10.431598500000000000000000000),(44,'bank','Guba Farmers Multi-Purpose Cooperative',123.890881799999990000000000000,10.427714000000000000000000000),(45,'bank','Consolacion Environmental Sanitation Services Multi-Purpose Cooperative',123.950114300000000000000000000,10.438182600000000000000000000),(46,'bank','P.J. Lhuillier Incorporated',123.920027099999970000000000000,10.378857100000000000000000000),(47,'bank','Cambinocot Multi-Purpose Cooperative',123.897501899999950000000000000,10.463154100000000000000000000),(48,'fire_station','Danao Fire Department',124.027217000000060000000000000,10.517291300000000000000000000),(49,'fire_station','Barangay Mactan Fire Sub-Station',124.011115900000050000000000000,10.309056800000000000000000000),(50,'fire_station','Apas Fire Sub Station',123.905203300000040000000000000,10.337264400000000000000000000),(51,'fire_station','Lapu-Lapu City Fire District - Fire Station 1',123.958844499999940000000000000,10.305250300000000000000000000),(52,'fire_station','Pari-an Fire Sub Station',123.903448400000000000000000000,10.299322200000000000000000000),(53,'fire_station','Mabolo Fire Sub Station',123.915725000000070000000000000,10.312292000000000000000000000),(54,'fire_station','Tropical Fire Extinguisher',123.925472000000010000000000000,10.349900900000000000000000000),(55,'fire_station','Mandaue City Fire Station',123.942252000000050000000000000,10.324404900000000000000000000),(56,'fire_station','Olango Fire Station - Fire Stn 6',124.060161200000040000000000000,10.271054400000000000000000000),(57,'fire_station','BFP Naga City Fire Station',123.759122800000000000000000000,10.204606200000000000000000000),(58,'fire_station','Tuburan Fire Station',123.825454700000020000000000000,10.728754900000000000000000000),(59,'fire_station','Talamban Fire Sub-Station',123.916740000000000000000000000,10.369873000000000000000000000),(60,'fire_station','Talamban Fire Station',123.916721199999980000000000000,10.369853300000000000000000000),(61,'fire_station','Consolacion Fire Station',123.957626399999980000000000000,10.376052800000000000000000000),(62,'fire_station','Basak Fire Station',123.950043199999980000000000000,10.354489100000000000000000000),(63,'fire_station','Liloan Fire Station',123.998980000000070000000000000,10.399834000000000000000000000),(64,'fire_station','MANDAUE FILIPINO CHINESE VOLUNTEER FIRE BRIGADE',123.934960100000010000000000000,10.335281100000000000000000000),(65,'fire_station','Tipolo Emergency Rescue Team',123.927480999999940000000000000,10.333105900000000000000000000),(66,'fire_station','Tipolo Fire Station',123.927629900000060000000000000,10.332946400000000000000000000),(67,'fire_station','Tubigon Fire Station',123.960760899999970000000000000,9.944184700000000000000000000),(68,'fire_station','Volunteers Fire Brigade Building',123.889219000000030000000000000,10.310616000000000000000000000),(69,'fire_station','Cebu Filipino-Chinese Volunteer Fire Brigade',123.889162700000040000000000000,10.310547000000000000000000000),(70,'fire_station','Guadalupe Fire Sub Station',123.884051499999940000000000000,10.322595600000000000000000000),(71,'fire_station','Lahug Fire Sub - Station',123.898485700000040000000000000,10.324289700000000000000000000),(72,'fire_station','Labangon Fire Station',123.881064700000020000000000000,10.299129400000000000000000000),(73,'fire_station','Pahina Central Fire Station',123.892182800000000000000000000,10.297981200000000000000000000),(74,'fire_station','hipodromo fire station',123.906650399999990000000000000,10.313918500000000000000000000),(75,'fire_station','Pari-An Fire Station',123.903477999999950000000000000,10.299282000000000000000000000),(76,'school','EMD Carmelite School',123.994628000000030000000000000,10.319498000000000000000000000),(77,'school','Banilad Elementary School',123.912346699999940000000000000,10.346548700000000000000000000),(78,'school','Calidngan Elementary School',123.629247000000080000000000000,10.171512200000000000000000000),(79,'school','Academia De Santa Monica',123.885245700000040000000000000,10.315768800000000000000000000),(80,'school','Liburon Elementary School',123.651882099999970000000000000,10.115545100000000000000000000),(81,'school','SMEAG 3nd Capital Campus',123.886907100000030000000000000,10.317337600000000000000000000),(82,'school','Sto. Niño Smart Child Learning Center',123.805037999999970000000000000,10.255592000000000000000000000),(83,'school','AITI',124.006038300000000000000000000,10.312127400000000000000000000),(84,'school','Cebu Institute of Technology - University',123.881411099999920000000000000,10.294336900000000000000000000),(85,'school','Carcar Christian School, Inc.',123.641654799999970000000000000,10.104379200000000000000000000),(86,'school','Cebu International School',123.920906000000060000000000000,10.392985000000000000000000000),(87,'school','CIE British School - Cebu',123.915830400000000000000000000,10.327108900000000000000000000),(88,'school','St. Theresa\'s College',123.895267099999960000000000000,10.311697500000000000000000000),(89,'school','Cebu City National Science High School',123.879148900000020000000000000,10.300328700000000000000000000),(90,'school','Harvest Homeschool Philippines',123.915344799999960000000000000,10.316977900000000000000000000),(91,'school','Sto. Nino Smart Child Learning Center (Sogod Campus)',124.010667000000010000000000000,10.735026000000000000000000000),(92,'school','English Fella 1-Cebu English Academy, Cebu language School',123.918265799999970000000000000,10.371854600000000000000000000),(93,'school','Bright Academy',123.914190400000050000000000000,10.347885000000000000000000000),(94,'school','Green Garden Christian School',123.951642999999990000000000000,10.302631900000000000000000000),(95,'school','Mandaue City Comprehensive National High School',123.943864900000000000000000000,10.324688000000000000000000000),(96,'school','Pit-os National High School',123.921395099999930000000000000,10.394099500000000000000000000),(97,'school','Agsungot National High School',123.904924299999950000000000000,10.438520300000000000000000000),(98,'school','SCI Tech Integrated Academy Inc.',123.919170000000010000000000000,10.396701000000000000000000000),(99,'school','Guba National High School',123.887844099999940000000000000,10.425998300000000000000000000),(100,'school','Pit - Os National',123.922020999999970000000000000,10.394167000000000000000000000),(101,'school','Gopher Wood Learning Center, Inc.',123.917241099999960000000000000,10.388025700000000000000000000),(102,'school','Bacayan Elementary School',123.921996000000040000000000000,10.387357000000000000000000000),(103,'school','Maria Montessori International School-Talamban Campus',123.914794000000030000000000000,10.381960000000000000000000000),(104,'school','Gopher Wood Learning Center',123.921614999999970000000000000,10.384974900000000000000000000),(105,'school','Cebu Doctor\'s University College of Medicine',123.886001599999990000000000000,10.453100200000000000000000000),(106,'school','San Jose Elementary School',123.913299699999920000000000000,10.379731000000000000000000000),(107,'school','Binaliw National High School',123.915776300000060000000000000,10.424192300000000000000000000),(108,'school','Binaliw NHS-Senior High School Building',10.424375900000000000000000000,123.915966700000010000000000000),(109,'school','Binaliw Elementary School',123.915930800000070000000000000,10.414073400000000000000000000),(110,'school','Agsungot Elementary School',123.911138100000020000000000000,10.434570800000000000000000000),(111,'school','Panoypoy Elementary School',123.928905999999980000000000000,10.417932700000000000000000000),(112,'school','Panas Elementary School',123.932773799999950000000000000,10.433640200000000000000000000),(113,'school','Cabangahan National High School Consolacion Cebu',123.930148100000000000000000000,10.404873000000000000000000000),(114,'school','Banawa Elementary School',123.877545100000020000000000000,10.317773200000000000000000000),(115,'school','Abellana National School',123.896001000000070000000000000,10.300830000000000000000000000),(116,'school','Fröbel iSchool',123.886553999999930000000000000,10.302309000000000000000000000),(117,'school','Buhisan Elementary School',123.865000000000010000000000000,10.298200000000000000000000000),(118,'school','Don Bosco Technology Center',123.863243300000020000000000000,10.297957100000000000000000000),(119,'school','Froebel School For Early Literacy',123.886663000000000000000000000,10.302212000000000000000000000),(120,'school','Oprra Elementary School',123.886449299999980000000000000,10.329179300000000000000000000),(121,'school','Childlink Learning Center',123.886414699999930000000000000,10.310260300000000000000000000),(122,'school','Sacred Heart School - Hijas de Jesus',123.894554999999970000000000000,10.316028000000000000000000000),(123,'school','CPILS',123.906107000000020000000000000,10.302635000000000000000000000),(124,'fire_station','San Nicolas Fire Substation',123.891329999999930000000000000,10.292185900000000000000000000),(125,'fire_station','Tipolo Emergency Rescue team',123.927474999999960000000000000,10.333074000000000000000000000),(126,'fire_station','Mabolo Fire Sub Station',123.915928899999930000000000000,10.312292700000000000000000000),(127,'police','Police Station 6 (Pasil Police Station) Cebu City',123.891367199999990000000000000,10.292185300000000000000000000),(128,'police','Police Station 5 - CCPO',123.891133500000020000000000000,10.292179700000000000000000000),(129,'police','Police Station 4 - CPPO',123.915830200000070000000000000,10.312428100000000000000000000),(130,'police','Cebu Provincial Highway Patrol Team',123.893032500000000000000000000,10.330717700000000000000000000),(131,'police','Police Station 1 (Parian Police Station) - Cebu City Police Office',123.903195699999970000000000000,10.299307500000000000000000000),(132,'police','Police Station - CCPO',123.892258999999970000000000000,10.296787200000000000000000000),(133,'police','Police Station 9 - CCPO',123.884591000000000000000000000,10.320440900000000000000000000),(134,'police','Police Outpost',123.890345000000020000000000000,10.309590000000000000000000000),(135,'police','Police Station 2 (Fuente Police Station) - Cebu City Police Office',123.895631999999980000000000000,10.302233000000000000000000000),(136,'police','Cebu Police Provincial Office',123.894102999999970000000000000,10.330992000000000000000000000),(137,'police','Cebu City Police Office Camp Sotero Cabahug',123.903652299999980000000000000,10.312597000000000000000000000),(138,'police','Regional Traffic Management Office-7',123.903768000000010000000000000,10.312616000000000000000000000),(139,'police','Napolcom',123.883740999999990000000000000,10.296002000000000000000000000),(140,'police','Police Station 10 (Punta Police Station) - Cebu City Police Office',123.871849600000020000000000000,10.295271400000000000000000000),(141,'police','Police Station 11 - CCPO',123.876590999999960000000000000,10.292304000000000000000000000),(142,'police','San Nicolas Police',123.891462899999960000000000000,10.292233900000000000000000000),(143,'police','Cebu City Police Office Station 5',123.897653999999990000000000000,10.291454000000000000000000000),(144,'police','Police Station 3 (Waterfront Police Station) - Cebu City Police Office',123.907016200000040000000000000,10.293198300000000000000000000),(145,'police','Cebu City Police Clearance',123.917940700000030000000000000,10.313732200000000000000000000),(146,'police','Police Station 2 - MCPO',123.925453899999980000000000000,10.320062000000000000000000000),(147,'hospital','Guba Community Hospital',123.889084299999920000000000000,10.427348200000000000000000000),(148,'hospital','St claire hospital',123.941551800000070000000000000,10.436784200000000000000000000),(149,'hospital','LIBH',123.922893499999990000000000000,10.393417900000000000000000000),(150,'hospital','Guba Emergency Hospital',123.889043799999970000000000000,10.427260200000000000000000000),(151,'hospital','Dr. Arco Medical Clinic',123.884949600000030000000000000,10.297176100000000000000000000),(152,'hospital','Perpetual Succour Hospital',123.900292300000050000000000000,10.314595000000000000000000000),(153,'hospital','Cebu Doctors’ University Hospital',123.891909800000010000000000000,10.314457900000000000000000000),(154,'hospital','VSMMC',123.891571900000030000000000000,10.308017100000000000000000000),(155,'hospital','St. Vincent General Hospital',123.894876999999950000000000000,10.301825000000000000000000000),(156,'hospital','Sacred Heart Hospital',123.892281799999980000000000000,10.303757500000000000000000000),(157,'hospital','Cebu City Medical Center',123.892100300000040000000000000,10.297948700000000000000000000),(158,'hospital','Adventist Hospital Cebu - Main Building (Miller Hospital)',123.887665700000070000000000000,10.295905100000000000000000000),(159,'hospital','Chong Hua Medical Arts Center',123.889436100000010000000000000,10.309814600000000000000000000),(160,'hospital','Cebu Puericulture Center & Maternity House, Inc.',123.892182100000010000000000000,10.308698500000000000000000000),(161,'hospital','Camp Lapulapu Hospital',123.903538799999980000000000000,10.337564300000000000000000000),(162,'hospital','St. Anthony Mother & Child Hospital',123.871389200000070000000000000,10.286248100000000000000000000),(163,'hospital','Women and Children’s Protection Unit or Pink Center',123.890668499999950000000000000,10.308134700000000000000000000),(164,'hospital','Maria Josefa Recio Therapeutic Center Inc',123.894581799999970000000000000,10.321590300000000000000000000),(165,'hospital','Biological Homeopathic Medical Corporation',123.891114199999950000000000000,10.312498900000000000000000000),(166,'hospital','Dr. Blesilda Pono',123.891742000000020000000000000,10.314206000000000000000000000),(167,'hospital','Centre for Imaging Interventional Radiology - Cebu Doctors\' University Hospital',123.891890999999990000000000000,10.314603000000000000000000000),(168,'hospital','CDUH Medical Arts Building 2',123.892654100000070000000000000,10.313956000000000000000000000),(169,'hospital','Glory Reborn Organization',123.870302499999980000000000000,10.287887900000000000000000000);
/*!40000 ALTER TABLE `tertiarysectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `tid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_fk` int(10) unsigned NOT NULL,
  `lotId_fk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sellingType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lotPrice` int(11) NOT NULL,
  `paymentType` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leaseDeposit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contractPeriod` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installDownPayment` int(11) DEFAULT NULL,
  `interest` double(4,2) DEFAULT NULL,
  `installPaymentType` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installTimeToPay` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installPayment` int(11) DEFAULT NULL,
  `lotDescription` varchar(10000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sellingStatus` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `transactions_user_fk_foreign` (`user_fk`),
  KEY `transactions_lotid_fk_foreign` (`lotId_fk`),
  CONSTRAINT `transactions_lotid_fk_foreign` FOREIGN KEY (`lotId_fk`) REFERENCES `lots` (`lotId`),
  CONSTRAINT `transactions_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES ('sl1',3,'lot001','For Sale',5000000,'Cash',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Very accessible site.','intended','sold','1','2021-04-14 01:03:49','2021-04-14 01:20:01'),('sl2',3,'lot 0015','For Sale',10000000,'Cash',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Best for family.','free',NULL,NULL,'2021-04-14 22:52:11','2021-04-15 00:29:46');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactiontrails`
--

DROP TABLE IF EXISTS `transactiontrails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactiontrails` (
  `trailId` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_fk` int(10) unsigned NOT NULL,
  `tid_fk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actions` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`trailId`),
  KEY `transactiontrails_user_fk_foreign` (`user_fk`),
  KEY `transactiontrails_tid_fk_foreign` (`tid_fk`),
  CONSTRAINT `transactiontrails_tid_fk_foreign` FOREIGN KEY (`tid_fk`) REFERENCES `transactions` (`tid`),
  CONSTRAINT `transactiontrails_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiontrails`
--

LOCK TABLES `transactiontrails` WRITE;
/*!40000 ALTER TABLE `transactiontrails` DISABLE KEYS */;
INSERT INTO `transactiontrails` VALUES ('trail1',5,'sl1','view',NULL,'2021-04-14 01:17:08','2021-04-14 01:17:08'),('trail2',5,'sl1','intent','1','2021-04-14 01:17:46','2021-04-14 01:20:01'),('trail3',5,'sl1','purchased',NULL,'2021-04-14 01:20:01','2021-04-14 01:20:01');
/*!40000 ALTER TABLE `transactiontrails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondaryContact` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userStatus` tinyint(1) DEFAULT NULL,
  `assessorOffice` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrator','instantadmin','09082220910',NULL,'Napo, Carcar City, Cebu','iplotadmin@gmail.com','$2y$10$b9erreTe5UnnxJkRPesrzuDi2gB9FDJQr4OSFSYHCh9I9dmklvJhS','2',NULL,NULL,'7sZ0zxYu1Z',NULL,NULL),(2,'Gabrielle','borbonadmin','null',NULL,'null','ZUe3VK1gvHZM2JTbR7cww8sR5MAVczcA','$2y$10$91Dk910Bvw5iA.pwH/lGrOBaGRnZHJBNx4bvwBn3mixo2R4KPkWQa','1',1,'Borbon',NULL,'2021-03-25 20:35:03','2021-03-25 20:38:31'),(3,'Juvjuv Recitas',NULL,'09155387577',NULL,'Minglanilla Cebu','recitasj@gmail.com','$2y$10$IzbIRKeONYspap3cCAdsBOH3gKxvaoXXT8IhVxlJmYgIaSzTpm22K','0',NULL,NULL,'zMNWV4ixX9VlV47pMbaPaDLvLhBEXMHEL85spWlXFOfIaHcGn6R8fHeFMkX3','2021-03-25 20:42:40','2021-03-25 20:42:40'),(4,'Wilkinson Canaria',NULL,'09271688027',NULL,'Pardo, Cebu City','wilkinson@gmail.com','$2y$10$H6W7rlq1JNav6BZ.p2oZ2uVVJ8o4sBa5F5v5xdht.z2qtjPZQbqBW','0',NULL,NULL,'uDYQGXCWWEQ08PjTbSkdiX0riB5hxYAIYH915UvgMrPpHsVqyd462ZnJDPBV','2021-03-28 21:47:31','2021-03-28 21:47:31'),(5,'Ted',NULL,'09356789890',NULL,'Bulacao, Pardo','ted@gmail.com','$2y$10$8G4GNIXIK4m7FRDJF1l0ZOWko3tGwL9qdy/FdM5tJawfwwz/XjH8K','0',NULL,NULL,'tUJ00g82D3oGRfM8hNwCIsyGht1I3XHNXeJbGcBMoUtuteAM3mitvDowQVJP','2021-03-28 21:49:42','2021-03-28 21:49:42'),(7,'Jona Canaria','minglaadmin','null',NULL,'null','bXZiaQ0Gzm9FUikYM9q7YMYyz3OD70Cr','$2y$10$aQsB7.EnaTFiG6rLdIOp3.IjAWYpNxnP/33UT6ftyCgAN5fYW/Aiy','1',1,'Minglanilla',NULL,'2021-04-12 04:35:17','2021-04-12 04:37:09'),(9,'Charlie Go','cebuadmin','null',NULL,'null','HyUQb6AglfblstdCZU7ob78f9pEBRADX','$2y$10$xszmVopKxLqEiix/VfimBOlsLpc9klOrdVWUrDOCnE1r5ekO6niX2','1',1,'Cebu City',NULL,'2021-04-12 21:27:12','2021-04-12 21:27:52'),(10,'Jona Ante','BantayanAdmin','null',NULL,'null','rtXo3DhsgkHdn7TMpHRPCkMbf3EgLF8L','$2y$10$JC9bzJFdOL8oYnjEjjy5Xu.JPJgUtEq.pxVc9I3ae2degone9ncUC','1',1,'Bantayan',NULL,'2021-05-13 01:38:32','2021-05-13 01:45:14');
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

-- Dump completed on 2021-05-15 17:31:18
