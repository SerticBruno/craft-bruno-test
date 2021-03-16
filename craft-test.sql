-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: craft-test
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

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
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_orrdpidwsbjbttopwshxwnnyfpvtfrzntobl` (`sessionId`,`volumeId`),
  KEY `idx_zwwcpramtizilzrvcmjmkiwlykvgqmmhjlim` (`volumeId`),
  CONSTRAINT `fk_meuqblqqzumjqkethktpbweaqdcyjqwpufuu` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qqrvxewqhuivxvoyoffumtosfugvirziqykl` (`filename`,`folderId`),
  KEY `idx_owrhtlefbmveimdwoesdzrcpthwjlrzdxoka` (`folderId`),
  KEY `idx_hlnabmwlwqkpsalsszcxnubgffnvpelbxhld` (`volumeId`),
  KEY `fk_rowqagldrcszqmdtiqckzyaqoldmjeaiajpq` (`uploaderId`),
  CONSTRAINT `fk_avwpjbwstiwqarhtguaczghbnlweqsthviiu` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ejzczkiszauxkmhtrptfsnghipxuvdyevscc` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rowqagldrcszqmdtiqckzyaqoldmjeaiajpq` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ynrmroqrrrpaswhipvmxhesdmwwfsrfxvuqj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (7,1,1,1,'headerImageShadow2.png','image',1920,1080,772051,NULL,NULL,NULL,'2021-03-15 12:16:35','2021-03-15 12:16:35','2021-03-15 12:16:35','b1f1ac2d-2978-4ed0-bd12-8d22f7b87881'),(39,1,1,1,'contactImage.png','image',1600,1200,149485,NULL,NULL,NULL,'2021-03-15 15:40:07','2021-03-15 15:40:07','2021-03-15 15:40:07','fd446964-2415-4c33-8c16-550eb0f9c1e2'),(42,1,1,1,'servicesImage2.jpg','image',1600,1200,169279,NULL,NULL,NULL,'2021-03-15 15:41:50','2021-03-15 15:41:50','2021-03-15 15:41:50','61779672-d3cf-4f8c-882d-96b6c6e059c0');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zsqmlydjznvzhyhttrxrzjnlonvaicejotwy` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransformindex`
--

LOCK TABLES `assettransformindex` WRITE;
/*!40000 ALTER TABLE `assettransformindex` DISABLE KEYS */;
INSERT INTO `assettransformindex` VALUES (1,7,'headerImageShadow2.png',NULL,'_medium',1,1,0,0,'2021-03-15 12:18:27','2021-03-15 12:18:27','2021-03-15 12:18:28','8a94f518-ab5e-43ce-b66d-ee023ee2030b'),(2,39,'contactImage.png',NULL,'_medium',1,1,0,0,'2021-03-15 15:41:07','2021-03-15 15:41:07','2021-03-15 15:41:08','0e7f7f90-847f-4cde-aaf3-551db2ede3f2'),(3,42,'servicesImage2.jpg',NULL,'_medium',1,1,0,0,'2021-03-15 15:41:57','2021-03-15 15:41:57','2021-03-15 15:41:59','c6721bee-778b-4ce3-bd32-503ba50dae26');
/*!40000 ALTER TABLE `assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bxdzkgapojasypzvluzyhryydlgvpqzblnha` (`name`),
  KEY `idx_nbtlhamslikcbdhgozstukvveiepsmixaalh` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
INSERT INTO `assettransforms` VALUES (1,'Medium','medium','fit','center-center',700,500,NULL,NULL,'none','2021-03-15 12:18:06','2021-03-15 12:18:06','2021-03-15 12:18:06','7348f8a9-ba26-46f0-b3bb-8108dd2ce824');
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hhnwtefrgmmndpeimfdybwxjxmnnwfwlnaqq` (`groupId`),
  KEY `fk_izluyziqskyoqsczsjrnschpodpgbxgcejbh` (`parentId`),
  CONSTRAINT `fk_cpkgqrcinlfenvcqcfvwmvnwvjsdnircfjrz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_izluyziqskyoqsczsjrnschpodpgbxgcejbh` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_uwfrbjxxbfifnmhmhbhiorlwfthzbhxjoxnw` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ccehgecmisshnwnbxnadfwigvaqbuoelaiif` (`name`),
  KEY `idx_xrkzxqsyxtbrgdmgigkebymwxjeyrzxipzwq` (`handle`),
  KEY `idx_ugjhjbbbrpcruvbtgzqjbsmhgcpmsebwhmgo` (`structureId`),
  KEY `idx_hyhmtgsqtcytvyuxwgiinaxzsxruqsiudvjq` (`fieldLayoutId`),
  KEY `idx_zmjfanzxwnmsesbotrkfargwmegxuaxqjfyf` (`dateDeleted`),
  CONSTRAINT `fk_rfitpjrhhyrdnxlyqirmvwwfqoaliiiprytd` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tzxnxhndivzodbpxpyvcinradwihfxewyjag` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gqlxhxharavplsxrkbkxevdowpgupccwyvsa` (`groupId`,`siteId`),
  KEY `idx_xrurunfdbhhgedilfflsizznvzryektesmfj` (`siteId`),
  CONSTRAINT `fk_doqtcftankmvolwxjcimigheldimspqdvsyp` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zhkxypercemnwgqrygmkrwucoqcyuihiugem` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_vpitfkkguolcwyyamfcfsdfbbggvfsnpuxel` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_gqopgwxqowunvavgguhrumlqudzswhnytfgg` (`siteId`),
  KEY `fk_akszzrwtobhzuvewwavcslbpgegihwcwobkb` (`userId`),
  CONSTRAINT `fk_akszzrwtobhzuvewwavcslbpgegihwcwobkb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_gqopgwxqowunvavgguhrumlqudzswhnytfgg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_plkvvaccsfeovsymybracwcynhlmqeqvypql` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_gwtxvzklwjnjaulcoxnrpuxanjqtaekihuuu` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_jadsttkirphwhllqqazvlaatguwximgefvsn` (`siteId`),
  KEY `fk_txwukgvmplflctbvxwkunwoxadqkdybhaifw` (`fieldId`),
  KEY `fk_eqstyoivbtbypxsnuukptsoimjyveahccskx` (`userId`),
  CONSTRAINT `fk_eqstyoivbtbypxsnuukptsoimjyveahccskx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_jadsttkirphwhllqqazvlaatguwximgefvsn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_txwukgvmplflctbvxwkunwoxadqkdybhaifw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vbdygyelmdmhlfyzaqhjwohiauwhiafnqtyt` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (2,1,1,'2021-03-15 15:39:04',0,1),(2,1,2,'2021-03-15 12:16:40',0,1),(11,1,1,'2021-03-15 12:26:55',0,1),(11,1,2,'2021-03-15 15:41:53',0,1),(14,1,1,'2021-03-15 12:27:06',0,1),(14,1,2,'2021-03-15 15:40:25',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_richText` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uredomzowyhndhrjumqmxcgiytnmsedfujea` (`elementId`,`siteId`),
  KEY `idx_iveqhxqstcsfbhhqmqwkknvvhiwwjzaxyyub` (`siteId`),
  KEY `idx_genvhikptwgjpogaoaqgyezkhzvtnrlqmxca` (`title`),
  CONSTRAINT `fk_fifgmtnzoqmsbxuzmkdceunvruosltjiygfd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wtmwwdywplgriogbuttkjsqiftqpgqchjgva` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2021-03-15 11:37:34','2021-03-15 11:37:34','afae67d4-5d57-4396-a24d-a2370227cd54',NULL),(2,2,1,'Home','2021-03-15 11:39:45','2021-03-15 15:39:04','94e66315-93eb-41a6-85a8-115da1e3ae51','<h1>Lorem ipsum dolor sit amet</h1>\r\n<pre>Maecenas diam odio, gravida eu</pre>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam odio, gravida eu dictum et, euismod et enim. Curabitur iaculis tincidunt nisi, pretium porta nibh iaculis non. Aenean rutrum non nibh vitae vestibulum. Curabitur fringilla purus ac lacus consequat, a mollis elit tristique. Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In tempus ante imperdiet ante tincidunt, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. Curabitur fermentum a lectus vel facilisis.</p>\r\n<ul><li>Aenean rutrum non nibh vitae</li><li>Curabitur fringilla purus ac lacus</li><li>Pellentesque id risus aliquet</li></ul>\r\n<h1>Maecenas diam odio, gravida eu dictum et, euismod et enim</h1>\r\n<h3>Curabitur fringilla purus ac lacus consequat</h3>\r\n<p>Curabitur fringilla purus ac lacus consequat, a <strong>mollis elit tristique</strong>. Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In tempus ante imperdiet ante tincidunt, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. </p>\r\n<h2>Sed aliquet magna vitae erat tempus, in iaculis est lobortis</h2>\r\n<p>Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In <strong>tempus ante imperdiet ante tincidunt</strong>, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. </p>\r\n<p><br /></p>'),(3,3,1,'Home','2021-03-15 11:39:45','2021-03-15 11:39:45','7d4551e2-a4ca-4c6a-8e59-983a2eb3dbe2',NULL),(4,4,1,'Home','2021-03-15 11:58:54','2021-03-15 11:58:54','eb683787-e0ee-4365-bcd9-882426bc8be5',NULL),(5,5,1,'Home','2021-03-15 12:00:29','2021-03-15 12:00:29','cce15507-0b1d-4029-8cdb-d754ce01adb0','<p>Paragraph list</p>\r\n<ul><li>Wow</li><li>Cool</li><li>Such</li></ul>\r\n<h2>Subheading</h2>'),(6,6,1,'Home','2021-03-15 12:16:01','2021-03-15 12:16:01','8fe34e85-ffc6-43b7-950e-9f7e5a4f6515','<p>Paragraph list</p>\r\n<ul><li>Wow</li><li>Cool</li><li>Such</li></ul>\r\n<h2>Subheading</h2>'),(7,7,1,'Header Image Shadow2','2021-03-15 12:16:28','2021-03-15 12:16:28','94570b4b-931c-4193-a40e-c7e9f5730613',NULL),(8,8,1,'Home','2021-03-15 12:16:39','2021-03-15 12:16:39','37274ffe-ba4f-49f7-b2cb-38d1f031e3cf','<p>Paragraph list</p>\r\n<ul><li>Wow</li><li>Cool</li><li>Such</li></ul>\r\n<h2>Subheading</h2>'),(9,9,1,'Home','2021-03-15 12:20:01','2021-03-15 12:20:01','b7e9cfed-c10e-4c6e-9913-531eb93e1c18','<p>Paragraph list</p>\r\n<ul><li>Wow</li><li>Cool</li><li>Such</li></ul>\r\n<h2>Subheading</h2>'),(10,10,1,'Home','2021-03-15 12:20:02','2021-03-15 12:20:02','418f3b36-091a-47d5-a328-235548ecbab7','<p>Paragraph list</p>\r\n<ul><li>Wow</li><li>Cool</li><li>Such</li></ul>\r\n<h2>Subheading</h2>'),(11,11,1,'About Us','2021-03-15 12:25:17','2021-03-15 15:41:53','d4eb12cc-66de-4848-b98d-e986f089b09d','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. </p>\r\n<p>Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(12,12,1,'About Us','2021-03-15 12:25:18','2021-03-15 12:25:18','9a4c40f9-1130-40bd-bc7f-1a912877f1bd',NULL),(13,13,1,'About Us','2021-03-15 12:25:18','2021-03-15 12:25:18','8711afe7-5e3b-4fb3-878e-4aa74363107e',NULL),(14,14,1,'Contact','2021-03-15 12:25:37','2021-03-15 15:46:03','2a86117f-33eb-4c34-b542-cc2c91c9d1b9','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. </p>\r\n<p>Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(15,15,1,'Contact','2021-03-15 12:25:37','2021-03-15 12:25:37','e3eeaef3-a5d5-4c3e-b763-09ad43ce2c0f',NULL),(16,16,1,'About Us','2021-03-15 12:26:21','2021-03-15 12:26:21','47c8b51d-d92b-4537-b1cf-17aa3a7643c1',NULL),(17,17,1,'Contact','2021-03-15 12:26:36','2021-03-15 12:26:36','152e102d-c2c4-466a-8ad5-74fc947d8924',NULL),(18,18,1,'About Us','2021-03-15 12:26:54','2021-03-15 12:26:54','a88322a1-dd7e-4ff7-bc9c-634867df7389','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. </p>\r\n<p>Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(19,19,1,'Contact','2021-03-15 12:27:05','2021-03-15 12:27:05','d3fd0b1a-1e14-4f2b-bfd9-31889b1d4f60','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. </p>\r\n<p>Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(20,20,1,'About Us','2021-03-15 12:27:39','2021-03-15 12:27:39','097decb2-9ded-40fa-aea8-afeb134c689e','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. </p>\r\n<p>Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(21,21,1,'About Us','2021-03-15 12:27:39','2021-03-15 12:27:39','6edf6484-6948-433c-947e-709ff37b5fab','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. </p>\r\n<p>Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(22,22,1,'About Us','2021-03-15 12:28:22','2021-03-15 12:28:22','a4f3a18f-a909-452d-b907-f6a5bca2edfb','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. </p>\r\n<p>Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(23,23,1,NULL,'2021-03-15 12:31:07','2021-03-15 15:48:04','324fcb9f-c75a-41e8-a179-c931b5ae9dd2',NULL),(24,26,1,NULL,'2021-03-15 12:37:19','2021-03-15 12:38:00','893026f7-ab98-456b-a58f-3ec1d7816ceb','<p>© Copyright 2020 GAMESARAAA Inc. All rights reserved.</p>'),(25,27,1,'First blog post','2021-03-15 12:43:56','2021-03-15 12:44:12','12d3ed96-4e2e-4766-9c70-aa23d6d4c688','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. </p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. </p>\r\n<p>Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(26,28,1,'Second blog post','2021-03-15 12:44:17','2021-03-15 12:44:30','30d0194a-9efb-4708-a72b-f9dee72b6c2e','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. </p>\r\n<p>Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(27,29,1,'Third post','2021-03-15 12:44:35','2021-03-15 12:44:45','9c997412-b993-4480-8306-333a35f5e628','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. </p>\r\n<p><br /></p>\r\n<p>Sed interdum laoreet egestas.Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(28,30,1,'Blog','2021-03-15 15:31:10','2021-03-15 15:31:10','617d5f98-7667-45bd-ae04-d82f8ad87426',NULL),(29,31,1,'Blog','2021-03-15 15:31:10','2021-03-15 15:31:10','e11a8d00-94c9-4b8e-bbba-2377bd71d152',NULL),(30,33,1,'Home','2021-03-15 15:36:49','2021-03-15 15:36:49','2c27149a-1b16-43c0-9804-91c9a0d547ae','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam odio, gravida eu dictum et, euismod et enim. Curabitur iaculis tincidunt nisi, pretium porta nibh iaculis non. Aenean rutrum non nibh vitae vestibulum. Curabitur fringilla purus ac lacus consequat, a mollis elit tristique. Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In tempus ante imperdiet ante tincidunt, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. Curabitur fermentum a lectus vel facilisis.</p>\r\n<ul><li>Aenean rutrum non nibh vitae</li><li>Curabitur fringilla purus ac lacus</li><li>Pellentesque id risus aliquet</li></ul><h1>Maecenas diam odio, gravida eu dictum et, euismod et enim</h1><h3>Curabitur fringilla purus ac lacus consequat</h3>\r\n<p>Curabitur fringilla purus ac lacus consequat, a <strong>mollis elit tristique</strong>. Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In tempus ante imperdiet ante tincidunt, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. </p>\r\n<h2>Sed aliquet magna vitae erat tempus, in iaculis est lobortis</h2>\r\n<p>Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In <strong>tempus ante imperdiet ante tincidunt</strong>, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. </p>\r\n<p><br /></p>'),(31,34,1,'Home','2021-03-15 15:37:26','2021-03-15 15:37:26','750317c5-7de9-4b34-b0de-023acffc267d','<blockquote><br />Lorem ipsum dolor sit amet</blockquote>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam odio, gravida eu dictum et, euismod et enim. Curabitur iaculis tincidunt nisi, pretium porta nibh iaculis non. Aenean rutrum non nibh vitae vestibulum. Curabitur fringilla purus ac lacus consequat, a mollis elit tristique. Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In tempus ante imperdiet ante tincidunt, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. Curabitur fermentum a lectus vel facilisis.</p>\r\n<ul><li>Aenean rutrum non nibh vitae</li><li>Curabitur fringilla purus ac lacus</li><li>Pellentesque id risus aliquet</li></ul>\r\n<h1>Maecenas diam odio, gravida eu dictum et, euismod et enim</h1>\r\n<h3>Curabitur fringilla purus ac lacus consequat</h3>\r\n<p>Curabitur fringilla purus ac lacus consequat, a <strong>mollis elit tristique</strong>. Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In tempus ante imperdiet ante tincidunt, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. </p>\r\n<h2>Sed aliquet magna vitae erat tempus, in iaculis est lobortis</h2>\r\n<p>Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In <strong>tempus ante imperdiet ante tincidunt</strong>, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. </p>\r\n<p><br /></p>'),(32,35,1,'Home','2021-03-15 15:37:44','2021-03-15 15:37:44','dbf16910-6402-4c44-b524-2348d757d1c3','<pre><br />Lorem ipsum dolor sit amet</pre>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam odio, gravida eu dictum et, euismod et enim. Curabitur iaculis tincidunt nisi, pretium porta nibh iaculis non. Aenean rutrum non nibh vitae vestibulum. Curabitur fringilla purus ac lacus consequat, a mollis elit tristique. Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In tempus ante imperdiet ante tincidunt, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. Curabitur fermentum a lectus vel facilisis.</p>\r\n<ul><li>Aenean rutrum non nibh vitae</li><li>Curabitur fringilla purus ac lacus</li><li>Pellentesque id risus aliquet</li></ul>\r\n<h1>Maecenas diam odio, gravida eu dictum et, euismod et enim</h1>\r\n<h3>Curabitur fringilla purus ac lacus consequat</h3>\r\n<p>Curabitur fringilla purus ac lacus consequat, a <strong>mollis elit tristique</strong>. Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In tempus ante imperdiet ante tincidunt, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. </p>\r\n<h2>Sed aliquet magna vitae erat tempus, in iaculis est lobortis</h2>\r\n<p>Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In <strong>tempus ante imperdiet ante tincidunt</strong>, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. </p>\r\n<p><br /></p>'),(33,36,1,'Home','2021-03-15 15:38:46','2021-03-15 15:38:46','25a379f1-378b-4a77-863d-c2274db7bec3','<h1>Lorem ipsum dolor sit amet</h1>\r\n<blockquote>Maecenas diam odio, gravida eu</blockquote>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam odio, gravida eu dictum et, euismod et enim. Curabitur iaculis tincidunt nisi, pretium porta nibh iaculis non. Aenean rutrum non nibh vitae vestibulum. Curabitur fringilla purus ac lacus consequat, a mollis elit tristique. Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In tempus ante imperdiet ante tincidunt, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. Curabitur fermentum a lectus vel facilisis.</p>\r\n<ul><li>Aenean rutrum non nibh vitae</li><li>Curabitur fringilla purus ac lacus</li><li>Pellentesque id risus aliquet</li></ul>\r\n<h1>Maecenas diam odio, gravida eu dictum et, euismod et enim</h1>\r\n<h3>Curabitur fringilla purus ac lacus consequat</h3>\r\n<p>Curabitur fringilla purus ac lacus consequat, a <strong>mollis elit tristique</strong>. Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In tempus ante imperdiet ante tincidunt, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. </p>\r\n<h2>Sed aliquet magna vitae erat tempus, in iaculis est lobortis</h2>\r\n<p>Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In <strong>tempus ante imperdiet ante tincidunt</strong>, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. </p>\r\n<p><br /></p>'),(34,37,1,'Home','2021-03-15 15:39:04','2021-03-15 15:39:04','e161ccab-1bca-4717-a7a3-bb084587da44','<h1>Lorem ipsum dolor sit amet</h1>\r\n<pre>Maecenas diam odio, gravida eu</pre>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam odio, gravida eu dictum et, euismod et enim. Curabitur iaculis tincidunt nisi, pretium porta nibh iaculis non. Aenean rutrum non nibh vitae vestibulum. Curabitur fringilla purus ac lacus consequat, a mollis elit tristique. Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In tempus ante imperdiet ante tincidunt, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. Curabitur fermentum a lectus vel facilisis.</p>\r\n<ul><li>Aenean rutrum non nibh vitae</li><li>Curabitur fringilla purus ac lacus</li><li>Pellentesque id risus aliquet</li></ul>\r\n<h1>Maecenas diam odio, gravida eu dictum et, euismod et enim</h1>\r\n<h3>Curabitur fringilla purus ac lacus consequat</h3>\r\n<p>Curabitur fringilla purus ac lacus consequat, a <strong>mollis elit tristique</strong>. Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In tempus ante imperdiet ante tincidunt, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. </p>\r\n<h2>Sed aliquet magna vitae erat tempus, in iaculis est lobortis</h2>\r\n<p>Sed aliquet magna vitae erat tempus, in iaculis est lobortis. In <strong>tempus ante imperdiet ante tincidunt</strong>, in tempus ex aliquet. Pellentesque id risus aliquet, luctus nunc vel, luctus nisl. </p>\r\n<p><br /></p>'),(35,38,1,'Contact','2021-03-15 15:39:48','2021-03-15 15:39:48','8e0a71b0-47e9-4647-a5fa-8374933ee933','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. </p>\r\n<p>Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(36,39,1,'Contact Image','2021-03-15 15:40:06','2021-03-15 15:40:06','99056018-f949-41e6-9b27-f46de9807c8f',NULL),(37,40,1,'Contact','2021-03-15 15:40:24','2021-03-15 15:40:24','a140aa8c-b8c9-4b22-96f4-f5c9d1f1a62d','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. </p>\r\n<p>Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(38,41,1,'About Us','2021-03-15 15:41:32','2021-03-15 15:41:32','db42005b-b584-4282-ac58-053576ee16d2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. </p>\r\n<p>Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(39,42,1,'Services Image2','2021-03-15 15:41:50','2021-03-15 15:41:50','0d2a2e2b-80b9-46e1-b8de-9cbf51789262',NULL),(40,43,1,'About Us','2021-03-15 15:41:53','2021-03-15 15:41:53','d80ca83c-ce5b-4d51-9b98-eaebf683782c','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. </p>\r\n<p>Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(41,44,1,'Contact','2021-03-15 15:44:56','2021-03-15 15:44:56','ccc9443a-6968-41dd-9bd3-ef70064a2820','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. </p>\r\n<p>Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(42,45,1,'Contact','2021-03-15 15:44:57','2021-03-15 15:44:57','739d371d-9752-4f2e-84c0-d1d44c6255f0','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. </p>\r\n<p>Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(43,46,1,'Contact','2021-03-15 15:45:32','2021-03-15 15:45:32','6025f14e-ef6d-4e18-bb9b-22a0dfb0ead7','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. </p>\r\n<p>Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>'),(44,48,1,'Contact','2021-03-15 15:46:03','2021-03-15 15:46:03','4311b216-3ec6-46d2-8216-7ac047485a9f','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempor dui ac elementum accumsan. Maecenas eros quam, pharetra sed orci a, fermentum cursus eros. Sed non eros ac turpis elementum scelerisque id eu eros. Nam porta vitae diam eu efficitur. </p>\r\n<p>Cras accumsan ligula massa. Aliquam scelerisque egestas tincidunt. Praesent interdum metus elit, a sagittis justo elementum in. Morbi nibh justo, eleifend sit amet purus at, elementum lobortis justo. Sed interdum laoreet egestas.</p>');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_hkvazwoxpowqfnniahasmecuivfjcadplkhr` (`userId`),
  CONSTRAINT `fk_hkvazwoxpowqfnniahasmecuivfjcadplkhr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xnpfyzslvungmkcsmpfmbnlkkcnyfcivwktc` (`key`,`fingerprint`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
INSERT INTO `deprecationerrors` VALUES (1,'ElementQuery::getIterator()','D:\\xampp\\htdocs\\craft-test-bruno\\templates\\index.twig:23','2021-03-15 15:10:10','D:\\xampp\\htdocs\\craft-test-bruno\\templates\\index.twig',23,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":575,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\storage\\\\runtime\\\\compiled_templates\\\\42\\\\4284749ccf536a3e173dbe0d8543fb7979f9585592b326587274043ce212fb62.php\",\"line\":89,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\storage\\\\runtime\\\\compiled_templates\\\\a0\\\\a06476005ffb3444e9534167eeabe703810e247155fe5ad61936d66dd54af944.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about-us\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about-us\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about-us\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about-us\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about-us\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-03-15 15:10:11','2021-03-15 15:10:11','545206a8-3016-4af3-8aca-b07f4026444b'),(10,'ElementQuery::getIterator()','D:\\xampp\\htdocs\\craft-test-bruno\\templates\\index.twig:25','2021-03-15 12:52:57','D:\\xampp\\htdocs\\craft-test-bruno\\templates\\index.twig',25,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":575,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\storage\\\\runtime\\\\compiled_templates\\\\42\\\\4284749ccf536a3e173dbe0d8543fb7979f9585592b326587274043ce212fb62.php\",\"line\":85,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"method\":\"doDisplay\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"content\\\" => [__TwigTemplate_ad6bba09d7422325b5a4eef55e82698f85899b35ff219834569139df729519de, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"content\\\" => [__TwigTemplate_ad6bba09d7422325b5a4eef55e82698f85899b35ff219834569139df729519de, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\storage\\\\runtime\\\\compiled_templates\\\\d0\\\\d0458936333b4848ece2af77bcf8bb98e0538a976cfa82002d3f4d4b5ded322c.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"content\\\" => [__TwigTemplate_ad6bba09d7422325b5a4eef55e82698f85899b35ff219834569139df729519de, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ad6bba09d7422325b5a4eef55e82698f85899b35ff219834569139df729519de\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_ad6bba09d7422325b5a4eef55e82698f85899b35ff219834569139df729519de\",\"method\":\"doDisplay\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"content\\\" => [__TwigTemplate_ad6bba09d7422325b5a4eef55e82698f85899b35ff219834569139df729519de, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ad6bba09d7422325b5a4eef55e82698f85899b35ff219834569139df729519de\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"content\\\" => [__TwigTemplate_ad6bba09d7422325b5a4eef55e82698f85899b35ff219834569139df729519de, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ad6bba09d7422325b5a4eef55e82698f85899b35ff219834569139df729519de\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[]\"},{\"objectClass\":\"__TwigTemplate_ad6bba09d7422325b5a4eef55e82698f85899b35ff219834569139df729519de\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"blog\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"blog\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"blog\\\", [], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"blog\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"blog\\\", []\"},{\"objectClass\":null,\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"blog\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"blog\\\", \\\"p\\\" => \\\"blog\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"blog\\\", \\\"p\\\" => \\\"blog\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"blog\\\", \\\"p\\\" => \\\"blog\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"blog\\\", \\\"p\\\" => \\\"blog\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"blog\\\", \\\"p\\\" => \\\"blog\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-03-15 12:52:57','2021-03-15 12:52:57','223b8fc9-d1c1-4ff4-bb89-da980907cc75'),(29,'ElementQuery::getIterator()','D:\\xampp\\htdocs\\craft-test-bruno\\templates\\index.twig:19','2021-03-15 15:06:07','D:\\xampp\\htdocs\\craft-test-bruno\\templates\\index.twig',19,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":575,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\storage\\\\runtime\\\\compiled_templates\\\\42\\\\4284749ccf536a3e173dbe0d8543fb7979f9585592b326587274043ce212fb62.php\",\"line\":79,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\storage\\\\runtime\\\\compiled_templates\\\\a0\\\\a06476005ffb3444e9534167eeabe703810e247155fe5ad61936d66dd54af944.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_49a5cd384efec5568493c4487eb583913ceb67e2eeb44a40c23b0eedb5dab3f4\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about-us\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about-us\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about-us\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about-us\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"about-us\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-03-15 15:06:07','2021-03-15 15:06:07','d42fee7e-3671-49c0-b1db-b5db7ef23aa0'),(35,'ElementQuery::getIterator()','D:\\xampp\\htdocs\\craft-test-bruno\\templates\\index.twig:21','2021-03-16 07:08:11','D:\\xampp\\htdocs\\craft-test-bruno\\templates\\index.twig',21,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":575,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\storage\\\\runtime\\\\compiled_templates\\\\42\\\\4284749ccf536a3e173dbe0d8543fb7979f9585592b326587274043ce212fb62.php\",\"line\":84,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\storage\\\\runtime\\\\compiled_templates\\\\ce\\\\cecb33c0182cd2a09fe1f5f33190b26558ac445348625d977ebf4d7d3aa58101.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-03-16 07:08:11','2021-03-16 07:08:11','07d75ba8-13d3-476e-b241-4bbda7642a8a'),(107,'ElementQuery::getIterator()','D:\\xampp\\htdocs\\craft-test-bruno\\templates\\index.twig:22','2021-03-15 15:57:25','D:\\xampp\\htdocs\\craft-test-bruno\\templates\\index.twig',22,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":575,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\storage\\\\runtime\\\\compiled_templates\\\\42\\\\4284749ccf536a3e173dbe0d8543fb7979f9585592b326587274043ce212fb62.php\",\"line\":85,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_20f2db964a014233b49cc6c1003126acd128bc6f5c7d52df8c64fafe39314875\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\storage\\\\runtime\\\\compiled_templates\\\\ce\\\\cecb33c0182cd2a09fe1f5f33190b26558ac445348625d977ebf4d7d3aa58101.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_561fb3fcf572058d86654a03a43a927b499758c7017912b0fbbf7b39f4a2f7f0\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"D:\\\\xampp\\\\htdocs\\\\craft-test-bruno\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-03-15 15:57:25','2021-03-15 15:57:25','0a46454b-c865-4f2d-9861-0f0cd01f99d4');
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_zqlnrwzanlkdkskxjirhgedgdlsgfxrzrqqw` (`saved`),
  KEY `fk_bmpfltvwsddfqimiemgtryrxsotuhqkimfok` (`creatorId`),
  KEY `fk_wfqmqtjqcqoefjypurfeuocwhdigwdjbohcc` (`sourceId`),
  CONSTRAINT `fk_bmpfltvwsddfqimiemgtryrxsotuhqkimfok` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wfqmqtjqcqoefjypurfeuocwhdigwdjbohcc` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
INSERT INTO `drafts` VALUES (1,NULL,1,'First draft','',0,NULL,1),(2,NULL,1,'First draft','',0,NULL,1),(3,NULL,1,'First draft','',0,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mzljrrvogtltlypnjxtmelieliclsrtdesuu` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ugqqwbasxseovpbmceqaqypegybvcbmbmaid` (`dateDeleted`),
  KEY `idx_wzebwmsnzsfeqduowrjenwobuwocovtywsqu` (`fieldLayoutId`),
  KEY `idx_ouisldhohpjempciuchjletmktvbpiyrxznf` (`type`),
  KEY `idx_ifhgslqdxnlulsmcwebkmnfkrcmcxfheozkx` (`enabled`),
  KEY `idx_hmfzdgwldfhytourrthjnaxumfavbxdacrbb` (`archived`,`dateCreated`),
  KEY `idx_ojjajqossbymsmvreoaykzvfcqmyrmqzbcrp` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `fk_suctluuctupfnfwtowkaqeiuberqiqufoyzp` (`draftId`),
  KEY `fk_yxixcnxqlpdnrtcxpixmglwhwcrckwaeusrt` (`revisionId`),
  CONSTRAINT `fk_ktnddwmmcxkzdazbfduiblyawmqlkttuswhd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_suctluuctupfnfwtowkaqeiuberqiqufoyzp` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yxixcnxqlpdnrtcxpixmglwhwcrckwaeusrt` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-03-15 11:37:33','2021-03-15 11:37:33',NULL,'2f452e70-f4f8-4b5b-bcf4-55bbb6f75121'),(2,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2021-03-15 11:39:45','2021-03-15 15:39:04',NULL,'83e46aeb-89cc-4580-a786-24e50e7ddf05'),(3,NULL,1,1,'craft\\elements\\Entry',1,0,'2021-03-15 11:39:45','2021-03-15 11:39:45',NULL,'a394626e-178c-4b1a-a461-34eaa14487e8'),(4,NULL,2,1,'craft\\elements\\Entry',1,0,'2021-03-15 11:58:54','2021-03-15 11:58:54',NULL,'ccee5901-5146-46b5-9a0a-3be91e2cc0b9'),(5,NULL,3,1,'craft\\elements\\Entry',1,0,'2021-03-15 12:00:29','2021-03-15 12:00:29',NULL,'5a052a25-7362-4467-81d4-a03a247379a4'),(6,NULL,4,1,'craft\\elements\\Entry',1,0,'2021-03-15 12:16:01','2021-03-15 12:16:01',NULL,'ef7c32c9-892d-4ac3-bd6c-d9c5d4bd9038'),(7,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2021-03-15 12:16:28','2021-03-15 12:16:28',NULL,'bd551e38-6cfb-4590-a1aa-5932d0dcb7e7'),(8,NULL,5,1,'craft\\elements\\Entry',1,0,'2021-03-15 12:16:39','2021-03-15 12:16:39',NULL,'ca12360d-9ac8-49e7-b89e-76ed9af3e91e'),(9,NULL,6,1,'craft\\elements\\Entry',1,0,'2021-03-15 12:20:01','2021-03-15 12:20:01',NULL,'92e7259e-798b-4e0e-bfc2-1d7552303845'),(10,NULL,7,1,'craft\\elements\\Entry',1,0,'2021-03-15 12:20:02','2021-03-15 12:20:02',NULL,'777be73b-9430-40c5-b606-a55fa5d8f034'),(11,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-03-15 12:25:17','2021-03-15 15:41:52',NULL,'c144f775-c55d-4a1f-aaeb-d59b39dc728e'),(12,NULL,8,3,'craft\\elements\\Entry',1,0,'2021-03-15 12:25:17','2021-03-15 12:25:17',NULL,'38b194b3-f78a-42b4-a530-0abc0cdbb7ff'),(13,NULL,9,3,'craft\\elements\\Entry',1,0,'2021-03-15 12:25:18','2021-03-15 12:25:18',NULL,'ebb07261-5908-40cd-a461-df593f9d71f7'),(14,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-03-15 12:25:37','2021-03-15 15:46:03',NULL,'6a97194c-862c-478b-9980-2eb7892198bf'),(15,NULL,10,4,'craft\\elements\\Entry',1,0,'2021-03-15 12:25:37','2021-03-15 12:25:37',NULL,'511efe66-4223-4435-8a3f-2ae626dc7b2f'),(16,NULL,11,3,'craft\\elements\\Entry',1,0,'2021-03-15 12:26:21','2021-03-15 12:26:21',NULL,'87bc15bf-176a-4f1a-960e-d80cffd2978b'),(17,NULL,12,4,'craft\\elements\\Entry',1,0,'2021-03-15 12:26:36','2021-03-15 12:26:36',NULL,'acfa695d-852f-4513-9bd9-b93720fd6a53'),(18,NULL,13,3,'craft\\elements\\Entry',1,0,'2021-03-15 12:26:54','2021-03-15 12:26:54',NULL,'0d7924b5-843c-4c11-8ce6-df241d445cb8'),(19,NULL,14,4,'craft\\elements\\Entry',1,0,'2021-03-15 12:27:05','2021-03-15 12:27:05',NULL,'0872534a-7157-4e33-b3f0-e1c2123b73db'),(20,NULL,15,3,'craft\\elements\\Entry',1,0,'2021-03-15 12:27:38','2021-03-15 12:27:38',NULL,'27c917f8-dc02-4a11-94d5-889f9c2d4e42'),(21,NULL,16,3,'craft\\elements\\Entry',1,0,'2021-03-15 12:27:39','2021-03-15 12:27:39',NULL,'3e997117-baa7-4fd3-b720-4a6f0c54e731'),(22,NULL,17,3,'craft\\elements\\Entry',1,0,'2021-03-15 12:28:21','2021-03-15 12:28:21',NULL,'66634068-e034-4c03-8db5-4cb823993da6'),(23,NULL,NULL,6,'craft\\elements\\GlobalSet',1,0,'2021-03-15 12:31:07','2021-03-15 15:48:04',NULL,'abdd1dba-f9bd-49ec-8e43-e438f91be14a'),(24,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-03-15 12:33:09','2021-03-15 15:48:04',NULL,'45a13d71-b32c-4afa-8d91-915865c3d567'),(25,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-03-15 12:33:09','2021-03-15 15:48:04',NULL,'92e72886-7389-4d08-b3a1-792012d09b3b'),(26,NULL,NULL,7,'craft\\elements\\GlobalSet',1,0,'2021-03-15 12:37:19','2021-03-15 12:38:00',NULL,'dcf364b1-42ea-4512-9b5a-f471987915f0'),(27,1,NULL,8,'craft\\elements\\Entry',1,0,'2021-03-15 12:43:56','2021-03-15 12:44:12',NULL,'75396f63-6129-46cd-a348-cf613f303f7b'),(28,2,NULL,8,'craft\\elements\\Entry',1,0,'2021-03-15 12:44:17','2021-03-15 12:44:30',NULL,'737c7f7f-42a6-4dc6-8e2a-d1ddee09bdfa'),(29,3,NULL,8,'craft\\elements\\Entry',1,0,'2021-03-15 12:44:34','2021-03-15 12:44:45',NULL,'40bf9688-1223-436e-86b3-0e1f39ca3fc9'),(30,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2021-03-15 15:31:10','2021-03-15 15:31:10',NULL,'d869fa5e-5f11-41c3-b5bc-691b501c90d5'),(31,NULL,18,9,'craft\\elements\\Entry',1,0,'2021-03-15 15:31:10','2021-03-15 15:31:10',NULL,'35fb3d2f-cf97-49dd-9fa3-e1997853f9ed'),(32,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-03-15 15:31:49','2021-03-15 15:48:04',NULL,'e7ca9bc3-0eb3-411d-8c3f-bf7e975fad32'),(33,NULL,19,1,'craft\\elements\\Entry',1,0,'2021-03-15 15:36:49','2021-03-15 15:36:49',NULL,'f31f604a-46e8-4fae-a705-3aa48e0a1532'),(34,NULL,20,1,'craft\\elements\\Entry',1,0,'2021-03-15 15:37:26','2021-03-15 15:37:26',NULL,'7715d4cc-c0c0-4233-b8f0-3482cc14ba6e'),(35,NULL,21,1,'craft\\elements\\Entry',1,0,'2021-03-15 15:37:44','2021-03-15 15:37:44',NULL,'bc88045a-8319-44b6-b61c-b5732f7302bd'),(36,NULL,22,1,'craft\\elements\\Entry',1,0,'2021-03-15 15:38:46','2021-03-15 15:38:46',NULL,'f36f6d5e-d0e7-4ccf-be8d-960ad77b72fa'),(37,NULL,23,1,'craft\\elements\\Entry',1,0,'2021-03-15 15:39:04','2021-03-15 15:39:04',NULL,'ee11bb8b-61e4-4d7c-82fc-aa1143a208ba'),(38,NULL,24,4,'craft\\elements\\Entry',1,0,'2021-03-15 15:39:48','2021-03-15 15:39:48',NULL,'da557fdc-9192-4066-853c-b8da4cc2dd26'),(39,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2021-03-15 15:40:06','2021-03-15 15:40:06',NULL,'250434af-3f33-4756-85c3-beb814b7421b'),(40,NULL,25,4,'craft\\elements\\Entry',1,0,'2021-03-15 15:40:24','2021-03-15 15:40:24',NULL,'67c3b20b-118e-486d-aa07-84fceaebdab0'),(41,NULL,26,3,'craft\\elements\\Entry',1,0,'2021-03-15 15:41:32','2021-03-15 15:41:32',NULL,'8bbb1e6b-a343-4c42-a47d-8003dffd2a46'),(42,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2021-03-15 15:41:49','2021-03-15 15:41:49',NULL,'103a06eb-1057-4739-8f49-ffca3ad07426'),(43,NULL,27,3,'craft\\elements\\Entry',1,0,'2021-03-15 15:41:52','2021-03-15 15:41:52',NULL,'5455b363-a8e5-463f-8faf-c747174a502a'),(44,NULL,28,4,'craft\\elements\\Entry',1,0,'2021-03-15 15:44:56','2021-03-15 15:44:56',NULL,'bb73b499-e37e-40a8-9eda-ed299be583e8'),(45,NULL,29,4,'craft\\elements\\Entry',1,0,'2021-03-15 15:44:57','2021-03-15 15:44:57',NULL,'e1f17124-56a9-445c-b91c-04a365d21446'),(46,NULL,30,4,'craft\\elements\\Entry',1,0,'2021-03-15 15:45:31','2021-03-15 15:45:31',NULL,'66cf6cd0-ed7d-4a11-80b3-3984802774c3'),(47,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2021-03-15 15:46:03','2021-03-15 15:46:03','2021-03-15 15:47:21','9164c6f2-90bd-41ff-a9e7-8df42db8002c'),(48,NULL,31,4,'craft\\elements\\Entry',1,0,'2021-03-15 15:46:03','2021-03-15 15:46:03',NULL,'9d026e21-521a-4610-be3e-f277748048df'),(49,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2021-03-15 15:46:03','2021-03-15 15:46:03',NULL,'cc663ed0-5664-49ba-bd20-22f7eb2457fc');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rcpkyqnznmruhotvbnezbdpbtzeeshnctmrd` (`elementId`,`siteId`),
  KEY `idx_tqzypnorkzzvahxfqvhbfriysmtulbaiursw` (`siteId`),
  KEY `idx_dunpldsvienejenyychcdrccvlnlyqtkezgp` (`slug`,`siteId`),
  KEY `idx_lqpbevrovrhdoqamwduzcughhnarouppwuhv` (`enabled`),
  KEY `idx_foctiilposjfzfzndcaqxijwgroguamxmfxe` (`uri`,`siteId`),
  CONSTRAINT `fk_gvajpveepyesyodyglexiyqxyjxfhvawewoy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uaksqdaiudvwbpweejbvfidbaxqziimjbdov` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2021-03-15 11:37:33','2021-03-15 11:37:33','5e98c4ec-4786-4b2b-b236-5f9a82320426'),(2,2,1,'home','__home__',1,'2021-03-15 11:39:45','2021-03-15 11:39:45','839b0f80-ebb0-4553-8507-afeab81605fd'),(3,3,1,'home','__home__',1,'2021-03-15 11:39:45','2021-03-15 11:39:45','b526c6cb-1d76-4ee7-9b81-e9acd70e659b'),(4,4,1,'home','__home__',1,'2021-03-15 11:58:54','2021-03-15 11:58:54','f0fb1010-7a7d-4812-89aa-4895e3ccbfc4'),(5,5,1,'home','__home__',1,'2021-03-15 12:00:29','2021-03-15 12:00:29','ca5ec329-93aa-4f6a-ba1f-9e12eec16c19'),(6,6,1,'home','__home__',1,'2021-03-15 12:16:01','2021-03-15 12:16:01','62c9bf12-b85c-4ff5-8ba5-04157bccbe4e'),(7,7,1,NULL,NULL,1,'2021-03-15 12:16:28','2021-03-15 12:16:28','249576d6-0190-4c01-88f0-6b8d801cbfb5'),(8,8,1,'home','__home__',1,'2021-03-15 12:16:39','2021-03-15 12:16:39','c3cd74bd-2cce-46c0-a914-635e6ca96e0f'),(9,9,1,'home','__home__',1,'2021-03-15 12:20:01','2021-03-15 12:20:01','c2108e64-1bcb-4036-ab48-3439d178df15'),(10,10,1,'home','__home__',1,'2021-03-15 12:20:02','2021-03-15 12:20:02','1577bc46-7257-44ca-a00b-bfb944989654'),(11,11,1,'about-us','about-us',1,'2021-03-15 12:25:17','2021-03-15 12:25:17','15b002a2-c329-458a-923e-281c117e3cca'),(12,12,1,'about-us','about-us',1,'2021-03-15 12:25:18','2021-03-15 12:25:18','7b213ca3-b443-4c70-8d61-68b3c13f5cfb'),(13,13,1,'about-us','about-us',1,'2021-03-15 12:25:18','2021-03-15 12:25:18','19da1248-d01c-4e5a-aaf7-0ff3974c6610'),(14,14,1,'contact','contact',1,'2021-03-15 12:25:37','2021-03-15 12:25:37','d4fd7ddd-4083-4bd0-a0d7-68f8440d58b2'),(15,15,1,'contact','contact',1,'2021-03-15 12:25:37','2021-03-15 12:25:37','288840cd-3cd9-4a3f-a5bf-9c2084f8f222'),(16,16,1,'about-us','about-us',1,'2021-03-15 12:26:21','2021-03-15 12:26:21','e922ce72-bf57-4d3d-9347-2c3e84061dbd'),(17,17,1,'contact','contact',1,'2021-03-15 12:26:36','2021-03-15 12:26:36','538dabca-0d64-4c23-94d0-a3888712cae7'),(18,18,1,'about-us','about-us',1,'2021-03-15 12:26:54','2021-03-15 12:26:54','1f15ea61-c48d-470f-8ef3-1a490b12c974'),(19,19,1,'contact','contact',1,'2021-03-15 12:27:05','2021-03-15 12:27:05','23661065-e779-4f98-9554-f8ed1fa00730'),(20,20,1,'about-us','about-us',1,'2021-03-15 12:27:39','2021-03-15 12:27:39','2820566c-b246-4102-ab18-874f365b8c4b'),(21,21,1,'about-us','about-us',1,'2021-03-15 12:27:39','2021-03-15 12:27:39','8b20f606-7e9a-42c0-913d-4241a2a944d7'),(22,22,1,'about-us','about-us',1,'2021-03-15 12:28:22','2021-03-15 12:28:22','adadf3ce-a1c9-4f03-8d19-5984f6614598'),(23,23,1,NULL,NULL,1,'2021-03-15 12:31:07','2021-03-15 12:31:07','97857110-95f8-497b-b66c-c522412ef465'),(24,24,1,NULL,NULL,1,'2021-03-15 12:33:09','2021-03-15 12:33:09','df8382c8-46d7-4d7b-92c2-f9a78d421068'),(25,25,1,NULL,NULL,1,'2021-03-15 12:33:09','2021-03-15 12:33:09','69f9c0d7-bbb8-4b8f-9073-ddc100c8229d'),(26,26,1,NULL,NULL,1,'2021-03-15 12:37:19','2021-03-15 12:37:19','9dd6438d-7024-4e85-b198-723bba4f0d41'),(27,27,1,'first-blog-post','blog/first-blog-post',1,'2021-03-15 12:43:56','2021-03-15 12:44:05','a9d12bd8-6a10-4b1e-95c1-5df66e9ae310'),(28,28,1,'second-blog-post','blog/second-blog-post',1,'2021-03-15 12:44:17','2021-03-15 12:44:25','6b9282be-f8e3-472d-8ea4-d29c1937e4f4'),(29,29,1,'third-post','blog/third-post',1,'2021-03-15 12:44:35','2021-03-15 12:44:41','5ec349f2-b837-48c4-847e-a783d3b9e78f'),(30,30,1,'blog','blog',1,'2021-03-15 15:31:10','2021-03-15 15:31:10','1c1ae09c-eeb8-496d-b6ab-37ac2e9aa21c'),(31,31,1,'blog','blog',1,'2021-03-15 15:31:10','2021-03-15 15:31:10','4a8e7f3c-3776-4123-9b16-9abc3c493863'),(32,32,1,NULL,NULL,1,'2021-03-15 15:31:49','2021-03-15 15:31:49','fd5c2b63-9bc4-4ab5-839f-95b051c01793'),(33,33,1,'home','__home__',1,'2021-03-15 15:36:49','2021-03-15 15:36:49','fc410942-fdb3-4aef-a1bd-8b8e9f4f9809'),(34,34,1,'home','__home__',1,'2021-03-15 15:37:26','2021-03-15 15:37:26','1477a1d2-b7cc-432c-ba9e-8350890acccd'),(35,35,1,'home','__home__',1,'2021-03-15 15:37:44','2021-03-15 15:37:44','27e8b450-3034-4603-a11b-0ce230a22452'),(36,36,1,'home','__home__',1,'2021-03-15 15:38:46','2021-03-15 15:38:46','5fbf5736-df9a-46eb-a6cb-cf8aa8f57e13'),(37,37,1,'home','__home__',1,'2021-03-15 15:39:04','2021-03-15 15:39:04','35b57d98-c515-407f-b5f5-762f5d2defa6'),(38,38,1,'contact','contact',1,'2021-03-15 15:39:48','2021-03-15 15:39:48','088fc81a-192f-426d-9437-a290709d9db8'),(39,39,1,NULL,NULL,1,'2021-03-15 15:40:06','2021-03-15 15:40:06','004e252d-0b7b-4300-ac85-cf85a9940e87'),(40,40,1,'contact','contact',1,'2021-03-15 15:40:24','2021-03-15 15:40:24','698342be-a86f-464e-81e4-e6c3ed9f9d67'),(41,41,1,'about-us','about-us',1,'2021-03-15 15:41:32','2021-03-15 15:41:32','04233d12-ec79-4d6a-b2ff-40581850cf98'),(42,42,1,NULL,NULL,1,'2021-03-15 15:41:50','2021-03-15 15:41:50','67aa7053-214a-4abb-a974-b3aa778ec980'),(43,43,1,'about-us','about-us',1,'2021-03-15 15:41:53','2021-03-15 15:41:53','b244c486-d62f-4cb6-a2f3-3ba979331a0b'),(44,44,1,'contact','contact',1,'2021-03-15 15:44:56','2021-03-15 15:44:56','48e94c91-80eb-49eb-b90d-6bf59774bbf6'),(45,45,1,'contact','contact',1,'2021-03-15 15:44:57','2021-03-15 15:44:57','24530f99-205c-4fff-9369-bf6e01783ae4'),(46,46,1,'contact','contact',1,'2021-03-15 15:45:32','2021-03-15 15:45:32','871b7318-bc7a-4889-83b1-1d58c7d65fda'),(47,47,1,NULL,NULL,1,'2021-03-15 15:46:03','2021-03-15 15:46:03','60ec1bdd-74fb-407d-8d6c-1a809443c5d9'),(48,48,1,'contact','contact',1,'2021-03-15 15:46:03','2021-03-15 15:46:03','010d64c1-02c9-4b42-b88f-8e116d3fa384'),(49,49,1,NULL,NULL,1,'2021-03-15 15:46:03','2021-03-15 15:46:03','d25cded3-39da-452d-95d1-4fa0db659188');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hgbvkgbgmreswyefbstwlwbrhxzzckcyrdoz` (`postDate`),
  KEY `idx_gtrfhmfyxrehqidxnixvfjrbagihyshaeihz` (`expiryDate`),
  KEY `idx_zvodrofkfptpvkjrhkmgxzxjhshahtlmbjoh` (`authorId`),
  KEY `idx_phpmzfeaovcorsbhbsevrsdtyxydnppuycew` (`sectionId`),
  KEY `idx_srlublgoccthygwukybhhuaydcfhxwwuakim` (`typeId`),
  KEY `fk_zwyinfmiwgmutfzgahvamoafiujjpkhizyvb` (`parentId`),
  CONSTRAINT `fk_aqdhbkirmohsjwrkeozxytlqvzfgctpxdoph` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hduxthyasxlhyzxsevdghkqvqohluhbastsn` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ispnhyvchvhtsffotnzvuyhshudduuodqxwg` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jqmbpikmvrnznqactpmhakjvfajhplqgplxt` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zwyinfmiwgmutfzgahvamoafiujjpkhizyvb` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2021-03-15 11:39:00',NULL,NULL,'2021-03-15 11:39:45','2021-03-15 11:39:45','7488bb58-7985-4227-b06c-4a19520f02f2'),(3,1,NULL,1,NULL,'2021-03-15 11:39:00',NULL,NULL,'2021-03-15 11:39:45','2021-03-15 11:39:45','12ff7f10-6735-4cfb-90de-4d559743539d'),(4,1,NULL,1,NULL,'2021-03-15 11:39:00',NULL,NULL,'2021-03-15 11:58:55','2021-03-15 11:58:55','c589583a-3229-4d15-be73-49fca6147795'),(5,1,NULL,1,NULL,'2021-03-15 11:39:00',NULL,NULL,'2021-03-15 12:00:29','2021-03-15 12:00:29','d2a909d2-d723-419b-ae24-8d83e250e5b8'),(6,1,NULL,1,NULL,'2021-03-15 11:39:00',NULL,NULL,'2021-03-15 12:16:01','2021-03-15 12:16:01','d47738a1-be49-44b7-8e0c-56cfb6dac698'),(8,1,NULL,1,NULL,'2021-03-15 11:39:00',NULL,NULL,'2021-03-15 12:16:39','2021-03-15 12:16:39','82e03e27-0dc5-4d3f-8c27-9e224d592bca'),(9,1,NULL,1,NULL,'2021-03-15 11:39:00',NULL,NULL,'2021-03-15 12:20:01','2021-03-15 12:20:01','c9f8e44f-43cd-4a9e-a559-c9b1ee02b604'),(10,1,NULL,1,NULL,'2021-03-15 11:39:00',NULL,NULL,'2021-03-15 12:20:02','2021-03-15 12:20:02','b880cfc3-d694-4466-a7fc-44ff0f257074'),(11,2,NULL,2,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 12:25:18','2021-03-15 12:25:18','d9f9eb3f-2059-4e33-839e-71eec88079a6'),(12,2,NULL,2,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 12:25:18','2021-03-15 12:25:18','581c2ad9-3913-47ca-9b13-2b4d5ec4981d'),(13,2,NULL,2,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 12:25:18','2021-03-15 12:25:18','aaa4f178-a6fa-4c54-b2b1-0c6a946189e1'),(14,3,NULL,3,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 12:25:37','2021-03-15 12:25:37','ce5ad712-dbe3-4f52-a8b4-7ece17ee3440'),(15,3,NULL,3,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 12:25:37','2021-03-15 12:25:37','ad57b333-ef9f-482e-80f8-7246c285107d'),(16,2,NULL,2,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 12:26:21','2021-03-15 12:26:21','136eb29a-b41c-4088-bb9c-c194cb5c8eb5'),(17,3,NULL,3,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 12:26:36','2021-03-15 12:26:36','fbbe10ca-d4ad-4c63-8809-5bce5345596e'),(18,2,NULL,2,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 12:26:54','2021-03-15 12:26:54','63a28af3-56e5-48f2-83d0-4159f094658c'),(19,3,NULL,3,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 12:27:05','2021-03-15 12:27:05','7eada50f-5178-4095-a8ce-7fb05ba740b3'),(20,2,NULL,2,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 12:27:39','2021-03-15 12:27:39','768bb928-5b94-4a72-9b16-b25be644ef5d'),(21,2,NULL,2,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 12:27:39','2021-03-15 12:27:39','fe9a755d-7319-48f4-bc50-e7ad8e3f927e'),(22,2,NULL,2,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 12:28:22','2021-03-15 12:28:22','873cf334-415e-4e7a-8c52-445701a228e0'),(27,4,NULL,4,1,'2021-03-15 12:43:00',NULL,NULL,'2021-03-15 12:43:56','2021-03-15 12:43:56','b7fd4e46-9faf-435d-af9d-8011655cc2d2'),(28,4,NULL,4,1,'2021-03-15 12:44:00',NULL,NULL,'2021-03-15 12:44:17','2021-03-15 12:44:17','4f43f2e5-43df-4923-b00b-6069c7a26c18'),(29,4,NULL,4,1,'2021-03-15 12:44:00',NULL,NULL,'2021-03-15 12:44:35','2021-03-15 12:44:35','28fa15ed-b48f-4952-8e7f-16622a71740d'),(30,5,NULL,5,NULL,'2021-03-15 15:31:00',NULL,NULL,'2021-03-15 15:31:10','2021-03-15 15:31:10','097d6cd2-d89d-4597-b479-d03e57058061'),(31,5,NULL,5,NULL,'2021-03-15 15:31:00',NULL,NULL,'2021-03-15 15:31:10','2021-03-15 15:31:10','bee7643e-ae60-4089-8df8-4248ff89270d'),(33,1,NULL,1,NULL,'2021-03-15 11:39:00',NULL,NULL,'2021-03-15 15:36:49','2021-03-15 15:36:49','c0062028-1a93-411d-975f-5d1ac7d9c74b'),(34,1,NULL,1,NULL,'2021-03-15 11:39:00',NULL,NULL,'2021-03-15 15:37:26','2021-03-15 15:37:26','52429bbb-e94c-4bcf-8338-fea7e4570225'),(35,1,NULL,1,NULL,'2021-03-15 11:39:00',NULL,NULL,'2021-03-15 15:37:44','2021-03-15 15:37:44','1f46df11-d188-41c3-8786-0053bd559e43'),(36,1,NULL,1,NULL,'2021-03-15 11:39:00',NULL,NULL,'2021-03-15 15:38:46','2021-03-15 15:38:46','a0006423-a0ff-4892-93de-fa0d86cf7356'),(37,1,NULL,1,NULL,'2021-03-15 11:39:00',NULL,NULL,'2021-03-15 15:39:04','2021-03-15 15:39:04','bc48ea58-7bec-4a96-a594-41d8440ee23c'),(38,3,NULL,3,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 15:39:48','2021-03-15 15:39:48','96b1538f-ae13-48c7-a488-24510e365c93'),(40,3,NULL,3,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 15:40:24','2021-03-15 15:40:24','0d474c1e-1f09-40cf-964c-537e517f3ee0'),(41,2,NULL,2,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 15:41:32','2021-03-15 15:41:32','bc68461c-cb53-40f7-b5d1-67ee4b4114c6'),(43,2,NULL,2,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 15:41:53','2021-03-15 15:41:53','be03c602-9c82-46a5-97de-ea818c05b3b4'),(44,3,NULL,3,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 15:44:56','2021-03-15 15:44:56','dbc2182a-f6fe-47db-9b9f-d1b0e7502629'),(45,3,NULL,3,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 15:44:57','2021-03-15 15:44:57','296d991f-ff53-47f3-a4d4-addf14894a01'),(46,3,NULL,3,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 15:45:32','2021-03-15 15:45:32','690665f0-4a2d-4343-bbed-dcf790e9b449'),(48,3,NULL,3,NULL,'2021-03-15 12:25:00',NULL,NULL,'2021-03-15 15:46:03','2021-03-15 15:46:03','f90b3a84-96e0-4d38-8e51-ea8b1a07af12');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wqnpiduaenypyqxrerrbsrhvlkqzxgcgbxmc` (`name`,`sectionId`),
  KEY `idx_utyvhuopwkzvizhogoqvklgioxdxwzenwyhl` (`handle`,`sectionId`),
  KEY `idx_wanfpehelxgbaxezeeyesduqacdlnyggwemy` (`sectionId`),
  KEY `idx_ibyqofgdacvtaojbvdlovvyamrcbfpjtfvun` (`fieldLayoutId`),
  KEY `idx_fmmrcemhjrtfwtshcwsabvcqcaaomrnejzpj` (`dateDeleted`),
  CONSTRAINT `fk_hskysynjqgvsdbygccoetddlxqtbmcazhjjy` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_islrleqdxuohzgunqlibggjkhojyxmjgglbo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,1,'Home','home',0,'site',NULL,'{section.name|raw}',1,'2021-03-15 11:39:45','2021-03-15 11:39:45',NULL,'cb575058-32d3-4e7b-bd7c-eca2b37c4602'),(2,2,3,'About Us','aboutUs',1,'site',NULL,'{section.name|raw}',1,'2021-03-15 12:25:17','2021-03-15 12:26:20',NULL,'07f7f880-4033-4af8-958d-75566b5d4f7d'),(3,3,4,'Contact','contact',1,'site',NULL,'{section.name|raw}',1,'2021-03-15 12:25:36','2021-03-15 12:26:35',NULL,'d47a43b9-a4e9-44dc-97c7-0009015cdf6b'),(4,4,8,'Blog Posts','blogPosts',1,'site',NULL,NULL,1,'2021-03-15 12:42:50','2021-03-15 12:42:50',NULL,'dab6aef1-67f2-4a0b-9451-dc5581f8fe86'),(5,5,9,'Blog','blog',0,'site',NULL,'{section.name|raw}',1,'2021-03-15 15:31:10','2021-03-15 15:31:10',NULL,'fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hhmlrzerbvfbyirjgmhwpkgbdcbmtncagioo` (`name`),
  KEY `idx_fpkumeizqncasmcotpnqxniqeeeyzpuhuflm` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2021-03-15 11:37:33','2021-03-15 11:37:33',NULL,'628121ed-3b8d-4b79-be5b-26e82898352c');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_phlvhvjaqwtceqqonqtwlrsbaepbunaajfqr` (`layoutId`,`fieldId`),
  KEY `idx_zlrwwgzozwgdwcbohdfdnuvlfqjdauhavhlj` (`sortOrder`),
  KEY `idx_geeyvcbypbyffknvyolyeqnvicncynjxikyt` (`tabId`),
  KEY `idx_ytumxmipqhreotmnhfruekfcmvunetlzfozx` (`fieldId`),
  CONSTRAINT `fk_jkswhqokloqkfdowptdhsggulkfryhiyifun` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_midewdyremppkubvgltjrrhqnylmqkfynpnx` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zljadzwnoitypsaxmvqvxfjjemcinntpkmkt` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (2,1,4,1,0,1,'2021-03-15 12:16:00','2021-03-15 12:16:00','94af6e2e-1993-4d3f-bc6a-b401338fa0e8'),(3,1,4,2,0,2,'2021-03-15 12:16:00','2021-03-15 12:16:00','8f6055aa-a475-45e8-a26a-1831650fa200'),(6,5,9,4,1,0,'2021-03-15 12:30:35','2021-03-15 12:30:35','91276b77-b958-4ecb-a16c-ebdbf025da7e'),(7,5,9,5,1,1,'2021-03-15 12:30:36','2021-03-15 12:30:36','c24669b2-42ac-4c2c-bf4c-9efa3a824ab3'),(8,6,10,3,0,0,'2021-03-15 12:31:07','2021-03-15 12:31:07','c8b648b2-abb2-4a92-be9c-0a7caec1b8cf'),(9,7,11,1,0,0,'2021-03-15 12:37:18','2021-03-15 12:37:18','9001b485-865d-4a83-a2ac-2df9a6423b46'),(10,8,13,1,0,1,'2021-03-15 12:43:46','2021-03-15 12:43:46','61534357-e843-4f4b-b9ff-862df3388134'),(13,3,16,1,0,1,'2021-03-15 15:41:31','2021-03-15 15:41:31','de834564-06c0-4840-b28e-331adbfe0f0a'),(14,3,16,2,0,2,'2021-03-15 15:41:31','2021-03-15 15:41:31','3e603d19-9925-4be6-a4b3-18dc4cce1546'),(17,4,18,1,0,1,'2021-03-15 15:45:31','2021-03-15 15:45:31','14713104-9f62-4c62-b2b7-a48b66207855'),(18,4,18,2,0,2,'2021-03-15 15:45:31','2021-03-15 15:45:31','5af74392-b056-43cc-b2c7-fc5d975ebe9a');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ffpmfuwtczckvuekwlcmbherngrreustliek` (`dateDeleted`),
  KEY `idx_josxgofeqiiwexwihexuuncoaarobsnosznt` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2021-03-15 11:39:44','2021-03-15 11:39:44',NULL,'57605fe6-426b-4101-b2cb-07bf7f7ac256'),(2,'craft\\elements\\Asset','2021-03-15 12:14:40','2021-03-15 12:14:40',NULL,'ce367e7f-fefb-4692-becb-d96c2d2d5872'),(3,'craft\\elements\\Entry','2021-03-15 12:25:17','2021-03-15 12:25:17',NULL,'1508713c-c687-42df-9cca-f2b766325244'),(4,'craft\\elements\\Entry','2021-03-15 12:25:36','2021-03-15 12:25:36',NULL,'156ee26e-ef37-4704-8fd2-449518840de7'),(5,'craft\\elements\\MatrixBlock','2021-03-15 12:30:35','2021-03-15 12:30:35',NULL,'0771aaf4-d574-4c13-80be-2386a61c5c3a'),(6,'craft\\elements\\GlobalSet','2021-03-15 12:31:06','2021-03-15 12:31:06',NULL,'78fe7fa0-0878-4c4f-bf38-f8146a1ed29a'),(7,'craft\\elements\\GlobalSet','2021-03-15 12:37:18','2021-03-15 12:37:18',NULL,'44447efe-9e3a-486c-8e26-ad46556d3f53'),(8,'craft\\elements\\Entry','2021-03-15 12:42:50','2021-03-15 12:42:50',NULL,'c8ef1257-5497-4429-943b-b63cf1cde08e'),(9,'craft\\elements\\Entry','2021-03-15 15:31:10','2021-03-15 15:31:10',NULL,'5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3'),(10,'craft\\elements\\MatrixBlock','2021-03-15 15:43:45','2021-03-15 15:43:45','2021-03-15 15:47:21','0756ee39-dd37-4794-b81b-3686707964c3');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dkvoljssmyjbygcahvuzvkxithnpoesbvffq` (`sortOrder`),
  KEY `idx_xmzvmfsxdpkugcdgykbejqlyibvsvzdkhjpu` (`layoutId`),
  CONSTRAINT `fk_fecjmjyrnkrdinupzwirzfepydecfqngrwft` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (3,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-03-15 12:14:40','2021-03-15 12:14:40','0220c252-09ca-4f31-bf62-ee8b86042d90'),(4,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"08a7f9af-2d90-4274-96e3-8a42b438263e\"}]',1,'2021-03-15 12:16:00','2021-03-15 12:16:00','c20bfee0-8261-4be8-97ce-b93a22e04ff3'),(9,5,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"54d93250-f04b-4c32-8558-ba1423f72ce3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1\"}]',1,'2021-03-15 12:30:35','2021-03-15 12:30:35','2686977f-4d5c-4be9-b1a0-813ad3135d50'),(10,6,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ee9b07ba-aa4e-4436-9eb3-d58314d33131\"}]',1,'2021-03-15 12:31:07','2021-03-15 12:31:07','115cea0f-8c85-4474-8ebd-356aa99b3033'),(11,7,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42\"}]',1,'2021-03-15 12:37:18','2021-03-15 12:37:18','c161f8fd-5e29-4d75-bba4-efda31770c62'),(13,8,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42\"}]',1,'2021-03-15 12:43:46','2021-03-15 12:43:46','4e4f4b49-8907-47cb-9ef6-b68eb0e919b6'),(14,9,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-03-15 15:31:10','2021-03-15 15:31:10','b12d6d8c-3347-48b4-b7ec-c2257458dc3a'),(16,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"08a7f9af-2d90-4274-96e3-8a42b438263e\"}]',1,'2021-03-15 15:41:31','2021-03-15 15:41:31','309a66ad-2b5d-40c4-aec7-6f13aef4e707'),(17,10,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"668190c7-a7f7-4411-af53-13a7958b8ce6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"cacf563c-79a1-4b35-959a-fa5cd9f09ce7\"}]',1,'2021-03-15 15:43:45','2021-03-15 15:43:45','065b71cb-84b9-404c-9146-d9c1c758a9fe'),(18,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"08a7f9af-2d90-4274-96e3-8a42b438263e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7872bf2d-2872-4f3a-9bdf-bdf4d963ac3b\"}]',1,'2021-03-15 15:45:31','2021-03-15 15:45:31','bc69e303-0d0d-42ba-bc8c-2d61e2ef1a75');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nynhehfuwtywovjiudhtdztmplarradwqxux` (`handle`,`context`),
  KEY `idx_facrstxotxndwdincikqajozbaqulncmkqld` (`groupId`),
  KEY `idx_fjpbkxgidjmosyhayrdtztqzgrvetzuehupx` (`context`),
  CONSTRAINT `fk_vxmllqrzcoddveknkyunibdcwywqzltaiucf` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,1,'Rich Text','richText','global','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2021-03-15 11:58:12','2021-03-15 11:58:12','0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42'),(2,1,'Feature Image','featureImage','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:4f0c74d0-f1fa-483b-9cb8-9b260405c864\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"Add Feature Image\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:4f0c74d0-f1fa-483b-9cb8-9b260405c864\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:4f0c74d0-f1fa-483b-9cb8-9b260405c864\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2021-03-15 12:15:37','2021-03-15 12:15:37','08a7f9af-2d90-4274-96e3-8a42b438263e'),(3,1,'Navigation','navigation','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_navigation}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2021-03-15 12:30:33','2021-03-15 12:30:33','ee9b07ba-aa4e-4436-9eb3-d58314d33131'),(4,NULL,'Link Text','linkText','matrixBlockType:7181c4a5-9951-4d74-b4f0-c7965d68662e','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-03-15 12:30:35','2021-03-15 12:30:35','54d93250-f04b-4c32-8558-ba1423f72ce3'),(5,NULL,'Link Destination','linkDestination','matrixBlockType:7181c4a5-9951-4d74-b4f0-c7965d68662e','',0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"Add a Link Destination\",\"showSiteMenu\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2021-03-15 12:30:35','2021-03-15 12:30:35','7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wzplseyuwkdqpithhpsveeokzvajzygmaaju` (`name`),
  KEY `idx_vpuldeoiawlkspyatulngzyxmnmddzsvorbu` (`handle`),
  KEY `idx_pfgsljvfworwtxldvghalddgittgdmdchsds` (`fieldLayoutId`),
  CONSTRAINT `fk_fdfvzhlhycfaznwjocsezibazwnracrnudwe` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hzrbeqnyahdxhjqrskigknsurvgiiwgcqvoj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
INSERT INTO `globalsets` VALUES (23,'Header','header',6,'2021-03-15 12:31:07','2021-03-15 12:31:07','abdd1dba-f9bd-49ec-8e43-e438f91be14a'),(26,'Footer','footer',7,'2021-03-15 12:37:19','2021-03-15 12:37:19','dcf364b1-42ea-4512-9b5a-f471987915f0');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kjedndrjeviehqdksmxrdsoxlaaahmhtqxrw` (`accessToken`),
  UNIQUE KEY `idx_pnfdsxomaqkbwwrykrdkvwpfhgghmoctwfxd` (`name`),
  KEY `fk_tspgzwhjmjezcbaswboblplwfwkufvkzzqjk` (`schemaId`),
  CONSTRAINT `fk_tspgzwhjmjezcbaswboblplwfwkufvkzzqjk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'3.6.10','3.6.6',0,'ysirktwttksj','ufsqibzpfeid','2021-03-15 11:37:33','2021-03-16 07:07:57','baa1bd93-a93f-4f35-b6ef-98fe30461b5f');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wpmlppviweubllgkgcvqsnsddvspuvototkl` (`ownerId`),
  KEY `idx_ghpvqzrnkyjkwbxsmnztygscukpnlxkwevdn` (`fieldId`),
  KEY `idx_luilxqnqkcgvhrxwgmswmqjpjtiojwqincyw` (`typeId`),
  KEY `idx_onekvnzgqtwzpsnmszkkngjjavrclqnsxsmt` (`sortOrder`),
  CONSTRAINT `fk_dqeenhopgkmyitjnwuvickrtettnkvhxhalf` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gowqpmfughanhmjjfsnngdjbdzixgtmhoopo` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lpthulhqkkxagtmdyfkcnklmjrioulxgioor` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ptfjnlmhfbdwtxvhcvklidfwbujflechmmim` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
INSERT INTO `matrixblocks` VALUES (24,23,3,1,1,NULL,'2021-03-15 12:33:09','2021-03-15 15:48:04','28e9d81b-9a32-4fa3-9bdf-c45a606c0f98'),(25,23,3,1,2,NULL,'2021-03-15 12:33:09','2021-03-15 15:48:04','71205ded-62ae-4a87-992f-0b0027fec4f6'),(32,23,3,1,3,NULL,'2021-03-15 15:31:49','2021-03-15 15:48:04','c9b6cd73-46f5-4383-b29a-ae990847e1ac');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aaatyfwmadsxejcfjhrapbxaboiyotyepplh` (`name`,`fieldId`),
  KEY `idx_cgeipqnxlyckljzslnwpdawwmgfgobdaxvlw` (`handle`,`fieldId`),
  KEY `idx_qdzijadulsthkbedepgsytnmgqrlqypzbsng` (`fieldId`),
  KEY `idx_rbckcsofhhidloowcauzpoenzfudjajfuaot` (`fieldLayoutId`),
  CONSTRAINT `fk_jthtoisvchkgdcdefkfyjyasfchuiqgfffwd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nrrrzydpscpugvpzdotxkibcbuuegeeoykpv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
INSERT INTO `matrixblocktypes` VALUES (1,3,5,'Nav Link','navLink',1,'2021-03-15 12:30:36','2021-03-15 12:30:36','7181c4a5-9951-4d74-b4f0-c7965d68662e');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_navigation`
--

DROP TABLE IF EXISTS `matrixcontent_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_navLink_linkText` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yvwotoadqynrdttuovuohdnnkcshtifvdlka` (`elementId`,`siteId`),
  KEY `fk_kdxdhsnpcwjffxmdhqunxrlluewtmncdofsb` (`siteId`),
  CONSTRAINT `fk_kdxdhsnpcwjffxmdhqunxrlluewtmncdofsb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wbucueruzdjpvmlisxbtkepljcontxqxzmha` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_navigation`
--

LOCK TABLES `matrixcontent_navigation` WRITE;
/*!40000 ALTER TABLE `matrixcontent_navigation` DISABLE KEYS */;
INSERT INTO `matrixcontent_navigation` VALUES (1,24,1,'2021-03-15 12:33:09','2021-03-15 15:48:04','b54a22f7-44c5-4ffe-89e3-3ca55c3ce4af','About Us'),(2,25,1,'2021-03-15 12:33:09','2021-03-15 15:48:04','34d5e92e-dac3-45c0-9fab-dbfbafb3d14d','Contact'),(3,32,1,'2021-03-15 15:31:49','2021-03-15 15:48:04','41f80a1a-ba3a-4888-a2fb-b8b1416a3a54','Blog');
/*!40000 ALTER TABLE `matrixcontent_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gglitlvqwjgfknozuvybdknaazkmpwgpcqsn` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2021-03-15 11:37:35','2021-03-15 11:37:35','2021-03-15 11:37:35','1023e566-4d60-44ba-8717-39d07892123f'),(2,'craft','m150403_183908_migrations_table_changes','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','066a26ae-27ed-4a60-b790-1a39bdcfa26b'),(3,'craft','m150403_184247_plugins_table_changes','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','1e73ff48-8e44-4da3-a9b0-cd19ce9b65e9'),(4,'craft','m150403_184533_field_version','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','f7e4c7c1-dfee-468c-ba88-2ac549ef5d3d'),(5,'craft','m150403_184729_type_columns','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','e8ee2c5b-bc32-4ce4-88a2-9cf60412b66e'),(6,'craft','m150403_185142_volumes','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','3771256a-ce33-4d62-ab26-8cd97a422d88'),(7,'craft','m150428_231346_userpreferences','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','64dd9e88-8450-489e-bb78-e1abfd3efe27'),(8,'craft','m150519_150900_fieldversion_conversion','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','0ea5430b-ef13-43bc-9f96-80b127ddfa7e'),(9,'craft','m150617_213829_update_email_settings','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','a0cb8894-058a-4909-94b4-d4194e9d7357'),(10,'craft','m150721_124739_templatecachequeries','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','605ab340-aae9-420e-98af-64c59572682a'),(11,'craft','m150724_140822_adjust_quality_settings','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','3e8c052b-e61f-443d-af06-eea2da3420e8'),(12,'craft','m150815_133521_last_login_attempt_ip','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','5fadefaa-b3c4-4290-be5c-2a98a86aecb9'),(13,'craft','m151002_095935_volume_cache_settings','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','370d7a65-6563-482a-a486-56c1c234c9b0'),(14,'craft','m151005_142750_volume_s3_storage_settings','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','17dec5f3-8d9e-445f-bee8-5efd8731a0b8'),(15,'craft','m151016_133600_delete_asset_thumbnails','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','a5ac85a3-066a-4ac2-8d49-66e5f35b4378'),(16,'craft','m151209_000000_move_logo','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','7b198a9f-0785-47f9-b89a-2c72df1faf7e'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','76e96cee-afb6-48cd-9059-b6a2863db5f7'),(18,'craft','m151215_000000_rename_asset_permissions','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','befd1820-d79f-4263-9ffe-10742d9f7fb8'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','d810b93e-cefd-486e-9149-b811de71a3de'),(20,'craft','m160708_185142_volume_hasUrls_setting','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','d786ef09-b313-4e8c-a36b-2283d137ddbc'),(21,'craft','m160714_000000_increase_max_asset_filesize','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','def42f81-cbe1-4fe6-90a9-9590835bbd23'),(22,'craft','m160727_194637_column_cleanup','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','94952e46-61ec-45c7-8e29-78595709e3ab'),(23,'craft','m160804_110002_userphotos_to_assets','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','921bc792-c009-4169-a0a4-1ef268747a1b'),(24,'craft','m160807_144858_sites','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','226f300b-b924-403d-823f-acc644f82b12'),(25,'craft','m160829_000000_pending_user_content_cleanup','2021-03-15 11:37:36','2021-03-15 11:37:36','2021-03-15 11:37:36','d3fafd7d-33a8-4a4a-988f-6fcaae5339e3'),(26,'craft','m160830_000000_asset_index_uri_increase','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','581f4cee-993b-41f5-a5d8-cb3bb1d1e4c2'),(27,'craft','m160912_230520_require_entry_type_id','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','654f3695-e1f8-4c94-8271-639ea8a0c986'),(28,'craft','m160913_134730_require_matrix_block_type_id','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','93e6170c-01c5-406e-b0eb-13666e303a33'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','9450018a-426f-4893-a5cd-1139c170b376'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','13532572-5e4d-421e-877c-0f6aa1e72f2a'),(31,'craft','m160925_113941_route_uri_parts','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','00241f2e-dc6d-4792-b3ba-1cd5dc8ee1f6'),(32,'craft','m161006_205918_schemaVersion_not_null','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','8d14b464-0860-4bde-bcaf-4501b355f89d'),(33,'craft','m161007_130653_update_email_settings','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','c348e2c8-091b-48ce-953b-2e26b4a86b3f'),(34,'craft','m161013_175052_newParentId','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','8add66b0-2b4e-4fe9-8add-563ffae39ced'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','5d237655-f31a-422e-9246-ee9557d72441'),(36,'craft','m161021_182140_rename_get_help_widget','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','73ce58a3-f9f6-4fd8-81e9-51ce93208ac1'),(37,'craft','m161025_000000_fix_char_columns','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','1df1d885-4c6b-4643-8712-7bdbb57a5bbc'),(38,'craft','m161029_124145_email_message_languages','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','b3d35b23-9c0e-4ea9-b03d-3254a44f6248'),(39,'craft','m161108_000000_new_version_format','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','5c379c22-2e91-4e4d-9219-82590d3488a9'),(40,'craft','m161109_000000_index_shuffle','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','1c70c0a3-2e69-457b-abaa-237fae4c9fb3'),(41,'craft','m161122_185500_no_craft_app','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','3f0e6310-4226-4df0-9012-78d82fa0f367'),(42,'craft','m161125_150752_clear_urlmanager_cache','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','17e35e80-467c-41f3-9933-5201b2f63542'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','7c3e631d-92b2-432f-9539-2993b403a97e'),(44,'craft','m170114_161144_udates_permission','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','7d28c047-dfca-4877-9827-4c7b110f5cb4'),(45,'craft','m170120_000000_schema_cleanup','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','0080f299-d997-489f-81c6-3e769aa699bc'),(46,'craft','m170126_000000_assets_focal_point','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','b16795ba-1d5f-489a-b0df-cf5318e300ad'),(47,'craft','m170206_142126_system_name','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','c05fe4e2-b2ab-4e27-8ec1-5ae71cea6d35'),(48,'craft','m170217_044740_category_branch_limits','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','5b61b51a-f210-4c28-9a5e-083eeb27e364'),(49,'craft','m170217_120224_asset_indexing_columns','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','fe3faa37-a30a-4cd1-92ab-58172ac1e961'),(50,'craft','m170223_224012_plain_text_settings','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','b2af3aab-c9c6-4d96-8db3-4c075ce4b3e0'),(51,'craft','m170227_120814_focal_point_percentage','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','3a17cb36-1f63-4437-8aa6-33c05a9183ac'),(52,'craft','m170228_171113_system_messages','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','337c5804-6f14-45ff-a8e6-77f485b175c0'),(53,'craft','m170303_140500_asset_field_source_settings','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','bf30a0aa-3008-46f4-ae8d-844252cb71f2'),(54,'craft','m170306_150500_asset_temporary_uploads','2021-03-15 11:37:37','2021-03-15 11:37:37','2021-03-15 11:37:37','c6e5cd87-1429-4669-aec8-f14a786bab38'),(55,'craft','m170523_190652_element_field_layout_ids','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','f8649fb4-4e62-489e-8925-c231c59510d5'),(56,'craft','m170621_195237_format_plugin_handles','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','ed7defb6-de0c-4f96-ba84-ac9d21c8bdae'),(57,'craft','m170630_161027_deprecation_line_nullable','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','620bfa5e-ca91-4c46-a5bd-3a3f7f25b2c2'),(58,'craft','m170630_161028_deprecation_changes','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','5fb54b29-1814-4803-82fd-110d96123938'),(59,'craft','m170703_181539_plugins_table_tweaks','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','5283a950-3c10-4a34-a52b-41d777b565cd'),(60,'craft','m170704_134916_sites_tables','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','a48825a9-7fd5-49da-a688-5a90d5ab37b5'),(61,'craft','m170706_183216_rename_sequences','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','f3097bc0-7851-4a41-bb87-1ce9d7a2e17c'),(62,'craft','m170707_094758_delete_compiled_traits','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','eb052e84-e9a7-4080-b210-3608b31817c0'),(63,'craft','m170731_190138_drop_asset_packagist','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','50eb5e1d-5506-4f20-9299-514609cd9457'),(64,'craft','m170810_201318_create_queue_table','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','e4df14fc-4069-45bc-844b-93a85c389089'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','7896c9c5-d834-42ad-a633-c34326bf823d'),(66,'craft','m170914_204621_asset_cache_shuffle','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','cb21028b-c024-4bc5-a8e9-4d7232af11d1'),(67,'craft','m171011_214115_site_groups','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','0c2c4e8e-847c-48c2-b622-f8c991945820'),(68,'craft','m171012_151440_primary_site','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','ab88a2bd-f1bf-4739-9938-91b9ab692fd1'),(69,'craft','m171013_142500_transform_interlace','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','5bfbc7ff-7afb-4da8-908c-b7026548dd18'),(70,'craft','m171016_092553_drop_position_select','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','bdcdf4bb-22a0-4765-9b54-e1e2992eb6af'),(71,'craft','m171016_221244_less_strict_translation_method','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','f22171f1-81d3-4f7a-adf0-12cfe4eae020'),(72,'craft','m171107_000000_assign_group_permissions','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','1ac0ddf0-9a47-415a-9317-950ed2d174d2'),(73,'craft','m171117_000001_templatecache_index_tune','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','2fe73ef8-910b-4234-8f6e-207e842a3676'),(74,'craft','m171126_105927_disabled_plugins','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','d1029a09-dad3-4d73-b7db-9ea4c5815534'),(75,'craft','m171130_214407_craftidtokens_table','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','d7e2cdb2-0116-4d2e-bfb2-f451aa6f7639'),(76,'craft','m171202_004225_update_email_settings','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','421e61e1-25fb-48c7-b957-053e9bc9503e'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','a9977664-6954-476d-a359-46e024373f14'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','015acd24-2ab9-41ee-aa5a-47820026b5be'),(79,'craft','m171218_143135_longtext_query_column','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','3881268f-912a-460a-946b-17c0ec99bbd0'),(80,'craft','m171231_055546_environment_variables_to_aliases','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','516c3a57-ca63-4749-961a-4bdd96df07be'),(81,'craft','m180113_153740_drop_users_archived_column','2021-03-15 11:37:38','2021-03-15 11:37:38','2021-03-15 11:37:38','325426b2-35fe-4d3d-8945-336a785c2423'),(82,'craft','m180122_213433_propagate_entries_setting','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','bebdf870-e9b2-4e60-aa41-fdf4438dbf25'),(83,'craft','m180124_230459_fix_propagate_entries_values','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','3f0a415e-c3b8-4360-83b5-c922b49ff5ca'),(84,'craft','m180128_235202_set_tag_slugs','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','b30cf321-bd7a-4a3b-b389-13d36a208de0'),(85,'craft','m180202_185551_fix_focal_points','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','0caccdd7-b7cf-41fc-82c4-91d90b99ca40'),(86,'craft','m180217_172123_tiny_ints','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','ae864876-bcca-41e5-bad4-ccbf69633884'),(87,'craft','m180321_233505_small_ints','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','83093510-9842-4526-a11b-59622b4d617a'),(88,'craft','m180404_182320_edition_changes','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','81ebd61f-1e64-468c-b212-35f154d539fc'),(89,'craft','m180411_102218_fix_db_routes','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','64efff8b-f9bc-4237-8313-32f79aceed28'),(90,'craft','m180416_205628_resourcepaths_table','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','3be54392-5f68-4bc5-92df-0ca4568d8580'),(91,'craft','m180418_205713_widget_cleanup','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','adb20926-c371-499e-a93d-30de7d9229a1'),(92,'craft','m180425_203349_searchable_fields','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','35047a6e-5d39-4b93-bdba-cb14ead20cd3'),(93,'craft','m180516_153000_uids_in_field_settings','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','f05aea08-2e37-4224-be39-cfca8ce29e8b'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','eecfc0cb-b857-47e5-8b1c-44c0e0e7e18b'),(95,'craft','m180518_173000_permissions_to_uid','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','5c848443-52c2-48b0-8062-83f5c0fa85c9'),(96,'craft','m180520_173000_matrix_context_to_uids','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','8bdb3b65-44fd-4176-855e-26ad162f6643'),(97,'craft','m180521_172900_project_config_table','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','c2e517c5-6b0a-4ab2-af05-86c1e18aaf8e'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','281fb930-54b0-4955-94c6-73324d774c41'),(99,'craft','m180731_162030_soft_delete_sites','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','3b1659f3-03a0-44bf-b622-16c5e17dbfed'),(100,'craft','m180810_214427_soft_delete_field_layouts','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','e5033d0c-6075-46d3-a4e0-5fa85f3b776f'),(101,'craft','m180810_214439_soft_delete_elements','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','26314065-50af-4205-9630-1c1aff74b4b2'),(102,'craft','m180824_193422_case_sensitivity_fixes','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','2d7411b2-7e4e-4581-9172-1db2c505c011'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','5ef7399e-164b-45df-a7fb-ff7ea55c6147'),(104,'craft','m180904_112109_permission_changes','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','7da51970-9833-415b-b50a-fbcf9a745731'),(105,'craft','m180910_142030_soft_delete_sitegroups','2021-03-15 11:37:39','2021-03-15 11:37:39','2021-03-15 11:37:39','894ac4c3-b102-4de1-a851-28ef214fc85b'),(106,'craft','m181011_160000_soft_delete_asset_support','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','0328ad61-2098-4fd3-a469-d881690f25b4'),(107,'craft','m181016_183648_set_default_user_settings','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','2ee263ce-989e-412e-a112-d5ade3fc845d'),(108,'craft','m181017_225222_system_config_settings','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','ce3a4159-6e9e-45b0-8b6c-10c529689ef6'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','852db060-f834-4fdc-885d-6496f92c0b4a'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','641d116d-e40f-4824-8450-4f11a983941f'),(111,'craft','m181112_203955_sequences_table','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','e9a7270c-4bd1-473d-84cd-622f1dd1eaeb'),(112,'craft','m181121_001712_cleanup_field_configs','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','5d1238eb-cf9e-4c85-9a73-8a3c71f9ff1c'),(113,'craft','m181128_193942_fix_project_config','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','d636eedb-58a8-4f69-909a-f20b88ad80fa'),(114,'craft','m181130_143040_fix_schema_version','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','a1d3cf23-fd0e-4a25-9e24-57df44cdfb8c'),(115,'craft','m181211_143040_fix_entry_type_uids','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','5266c9ca-eac1-40ab-a9ba-d87157532e24'),(116,'craft','m181217_153000_fix_structure_uids','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','9e10ba34-d3d2-4a6d-9080-a14c8cc45127'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','b2ffae9b-9bd0-40ae-8be7-1ad9312cdd46'),(118,'craft','m190108_110000_cleanup_project_config','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','de979907-c975-4b20-a0ff-12b1fc90a366'),(119,'craft','m190108_113000_asset_field_setting_change','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','426c738e-d406-42d8-9585-b7ea04666285'),(120,'craft','m190109_172845_fix_colspan','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','8a473d91-2344-4aaa-86ca-0bd6f83d68c8'),(121,'craft','m190110_150000_prune_nonexisting_sites','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','8ff26153-d70a-4a26-b88e-47e50aad6cfe'),(122,'craft','m190110_214819_soft_delete_volumes','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','d7fe4a11-36fe-422e-892e-f7e44b3e8697'),(123,'craft','m190112_124737_fix_user_settings','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','f5e039f4-5576-4d37-8ead-335c5ce767fe'),(124,'craft','m190112_131225_fix_field_layouts','2021-03-15 11:37:40','2021-03-15 11:37:40','2021-03-15 11:37:40','4c7b85c4-1d90-4a84-9cb9-86fa408d34d6'),(125,'craft','m190112_201010_more_soft_deletes','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','64765da4-eb7c-407f-af1f-3104225fdd1d'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','538b59b6-d085-46da-94ab-ebc58f57b91f'),(127,'craft','m190121_120000_rich_text_config_setting','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','6a2b1f7a-3cd2-4810-aef5-acdb715c42d6'),(128,'craft','m190125_191628_fix_email_transport_password','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','64abc97b-30a6-48c7-aafd-14f98977ac36'),(129,'craft','m190128_181422_cleanup_volume_folders','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','926474b1-3f76-44bd-85b0-bfd40ce38f05'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','adb9733b-f4d6-4da9-abbe-a6406df41e45'),(131,'craft','m190218_143000_element_index_settings_uid','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','0f376480-1507-48f3-ab33-7deaf0a15004'),(132,'craft','m190312_152740_element_revisions','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','f3ce6c31-8353-49c7-a375-0beb75923fd2'),(133,'craft','m190327_235137_propagation_method','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','8ca0a9aa-844a-440f-aa9e-6d3dd12c44c8'),(134,'craft','m190401_223843_drop_old_indexes','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','7fe9dec5-f9db-438a-92a7-fa3257f69690'),(135,'craft','m190416_014525_drop_unique_global_indexes','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','83f7d5ce-bedb-4374-9e89-920317babc23'),(136,'craft','m190417_085010_add_image_editor_permissions','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','1538e10c-0caf-42b5-92d6-19bb3b0d6473'),(137,'craft','m190502_122019_store_default_user_group_uid','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','6be5dace-93b5-4b95-b8e8-161becb8dd54'),(138,'craft','m190504_150349_preview_targets','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','9cd24f5e-0daa-45e4-bba3-fde963ffc762'),(139,'craft','m190516_184711_job_progress_label','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','e364f9e3-10da-4aba-adf9-44827c29cb4a'),(140,'craft','m190523_190303_optional_revision_creators','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','92d77455-6fc6-4f9e-a88d-f289b19e219b'),(141,'craft','m190529_204501_fix_duplicate_uids','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','276d7f37-e96f-46c3-90b5-5986df6fa0a9'),(142,'craft','m190605_223807_unsaved_drafts','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','f925e6c5-e7e5-4a7c-b713-a015914b4a1e'),(143,'craft','m190607_230042_entry_revision_error_tables','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','d590e4cf-db72-48a0-b0e8-23a40801a822'),(144,'craft','m190608_033429_drop_elements_uid_idx','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','700601d4-44f8-4e2c-88e6-d10f7372e24d'),(145,'craft','m190617_164400_add_gqlschemas_table','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','7b595986-117b-48e7-b889-5e4fd840bf6e'),(146,'craft','m190624_234204_matrix_propagation_method','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','452c2ba6-f107-4ec2-aee1-3d7ba46f4d60'),(147,'craft','m190711_153020_drop_snapshots','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','b1340c1c-ea92-46b7-98c4-6e1c4b9a0ecc'),(148,'craft','m190712_195914_no_draft_revisions','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','c195e5e1-56d0-4af7-ad5e-89591464364e'),(149,'craft','m190723_140314_fix_preview_targets_column','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','c9601ebf-49db-4467-903c-7d665085281a'),(150,'craft','m190820_003519_flush_compiled_templates','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','5c8e4813-a947-4d82-978b-628d54588b8e'),(151,'craft','m190823_020339_optional_draft_creators','2021-03-15 11:37:41','2021-03-15 11:37:41','2021-03-15 11:37:41','730d3165-316d-44d6-a593-36430627ca29'),(152,'craft','m190913_152146_update_preview_targets','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','fb6efd07-c74c-49e5-b9db-c2ee7a53ba08'),(153,'craft','m191107_122000_add_gql_project_config_support','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','6e70d447-aba2-4761-a410-8ac0bf72c457'),(154,'craft','m191204_085100_pack_savable_component_settings','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','6a424fc8-3136-4f94-841a-1043acd7e26a'),(155,'craft','m191206_001148_change_tracking','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','8ce65678-d013-4c68-b20a-555804468451'),(156,'craft','m191216_191635_asset_upload_tracking','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','ea5f82f2-1777-4096-bec8-ee9bf7591d52'),(157,'craft','m191222_002848_peer_asset_permissions','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','63eb98ee-26d1-4d17-b648-72b622c23890'),(158,'craft','m200127_172522_queue_channels','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','0a418093-cf16-4d75-8074-bfb28ccb8b5c'),(159,'craft','m200211_175048_truncate_element_query_cache','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','df8c4cbd-d341-4498-bb0d-f454009aada7'),(160,'craft','m200213_172522_new_elements_index','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','25a51b5d-35e2-435d-9ee7-182fe0e9f4f5'),(161,'craft','m200228_195211_long_deprecation_messages','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','1d7b39b5-18bb-4ad7-bd54-b4ae899f468b'),(162,'craft','m200306_054652_disabled_sites','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','24b760a1-91d0-4888-8c9b-bf187fd38f2b'),(163,'craft','m200522_191453_clear_template_caches','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','ff927043-723b-49a7-9499-a172465ff6a8'),(164,'craft','m200606_231117_migration_tracks','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','10705194-d681-4666-8271-405cbbf35f48'),(165,'craft','m200619_215137_title_translation_method','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','03f41732-32d9-4b75-9860-8782fed3faa9'),(166,'craft','m200620_005028_user_group_descriptions','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','a77217d3-6587-4856-8743-aebffd3518bd'),(167,'craft','m200620_230205_field_layout_changes','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','246e3405-3449-4e42-9563-e7f8cd62fb42'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','504222b1-d260-48d3-a526-4f58ceee5028'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','114f6b0f-2bc5-49f1-aa42-ba7f857a143c'),(170,'craft','m200630_183000_drop_configmap','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','189d6ac4-46d8-4e69-ba17-c10d0fce2d39'),(171,'craft','m200715_113400_transform_index_error_flag','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','9b382d93-3e20-4a47-b28b-96660af08218'),(172,'craft','m200716_110900_replace_file_asset_permissions','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','cb8b6d86-34ee-413f-9851-3b0c647ce0aa'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','3d1d1528-8335-405c-a838-a517e970b20f'),(174,'craft','m200720_175543_drop_unique_constraints','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','12ee624b-435f-498f-8e52-7aeae748439f'),(175,'craft','m200825_051217_project_config_version','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','ec822519-67c8-44a1-8615-01e330f91513'),(176,'craft','m201116_190500_asset_title_translation_method','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','39621deb-3e2c-4be4-9afa-c0919f44e6a3'),(177,'craft','m201124_003555_plugin_trials','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','851d8f7e-a77c-45d1-8838-3c8c6255fbda'),(178,'craft','m210209_135503_soft_delete_field_groups','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','e9e670df-ea36-41d8-93d4-15c009e365d9'),(179,'craft','m210212_223539_delete_invalid_drafts','2021-03-15 11:37:42','2021-03-15 11:37:42','2021-03-15 11:37:42','8bb248da-3c8e-4265-a4cd-30c3c97fde09'),(180,'craft','m210214_202731_track_saved_drafts','2021-03-15 11:37:43','2021-03-15 11:37:43','2021-03-15 11:37:43','e8d2a3be-4c99-4151-8a37-ec6c47c7d9eb'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2021-03-15 11:37:43','2021-03-15 11:37:43','2021-03-15 11:37:43','4a1298fb-3406-4f7b-bc6b-001c5d7fe795'),(182,'craft','m210224_162000_add_projectconfignames_table','2021-03-15 11:37:43','2021-03-15 11:37:43','2021-03-15 11:37:43','918b30bc-df95-4cfd-aeed-336f7d107c31'),(183,'plugin:redactor','m180430_204710_remove_old_plugins','2021-03-15 11:47:45','2021-03-15 11:47:45','2021-03-15 11:47:45','2f7138ba-7827-4f4f-a7b5-bfe0fa69381e'),(184,'plugin:redactor','Install','2021-03-15 11:47:45','2021-03-15 11:47:45','2021-03-15 11:47:45','5bb704fe-a6fb-4747-ae97-a8f1e49ef920'),(185,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2021-03-15 11:47:45','2021-03-15 11:47:45','2021-03-15 11:47:45','b54733fe-8a21-4e35-84bf-3de1cc329187');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vqtflptpbqemmzzkwemnfemprbjwtivjgknc` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'redactor','2.8.5','2.3.0','unknown',NULL,'2021-03-15 11:47:45','2021-03-15 11:47:45','2021-03-16 07:08:07','0f161def-7356-45a8-a105-35a7ec85cbcb');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1615878477'),('email.fromEmail','\"sertic.bruno@gmail.com\"'),('email.fromName','\"Craft CMS Bruno\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.autocapitalize','true'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.autocomplete','false'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.autocorrect','true'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.class','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.disabled','false'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.id','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.instructions','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.label','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.max','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.min','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.name','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.orientation','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.placeholder','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.readonly','false'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.requirable','false'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.size','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.step','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.tip','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.title','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.warning','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.0.width','100'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.1.fieldUid','\"0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42\"'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.1.instructions','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.1.label','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.1.required','false'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.1.tip','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.1.warning','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.1.width','100'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.2.fieldUid','\"08a7f9af-2d90-4274-96e3-8a42b438263e\"'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.2.instructions','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.2.label','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.2.required','false'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.2.tip','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.2.warning','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.elements.2.width','100'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.name','\"Content\"'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.fieldLayouts.1508713c-c687-42df-9cca-f2b766325244.tabs.0.sortOrder','1'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.handle','\"aboutUs\"'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.hasTitleField','true'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.name','\"About Us\"'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.section','\"283a6d7e-1b10-48b4-a915-c4b30d692bb2\"'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.sortOrder','1'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.titleFormat','\"{section.name|raw}\"'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.titleTranslationKeyFormat','null'),('entryTypes.07f7f880-4033-4af8-958d-75566b5d4f7d.titleTranslationMethod','\"site\"'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.autocapitalize','true'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.autocomplete','false'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.autocorrect','true'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.class','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.disabled','false'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.id','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.instructions','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.label','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.max','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.min','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.name','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.orientation','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.placeholder','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.readonly','false'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.requirable','false'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.size','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.step','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.tip','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.title','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.warning','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.0.width','100'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.1.fieldUid','\"0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42\"'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.1.instructions','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.1.label','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.1.required','false'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.1.tip','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.1.warning','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.1.width','100'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.2.fieldUid','\"08a7f9af-2d90-4274-96e3-8a42b438263e\"'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.2.instructions','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.2.label','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.2.required','false'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.2.tip','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.2.warning','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.elements.2.width','100'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.name','\"Content\"'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.fieldLayouts.57605fe6-426b-4101-b2cb-07bf7f7ac256.tabs.0.sortOrder','1'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.handle','\"home\"'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.hasTitleField','false'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.name','\"Home\"'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.section','\"b7ba31d9-ead2-4192-a034-1861e50f4429\"'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.sortOrder','1'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.titleFormat','\"{section.name|raw}\"'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.titleTranslationKeyFormat','null'),('entryTypes.cb575058-32d3-4e7b-bd7c-eca2b37c4602.titleTranslationMethod','\"site\"'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.autocapitalize','true'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.autocomplete','false'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.autocorrect','true'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.class','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.disabled','false'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.id','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.instructions','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.label','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.max','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.min','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.name','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.orientation','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.placeholder','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.readonly','false'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.requirable','false'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.size','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.step','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.tip','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.title','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.warning','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.0.width','100'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.1.fieldUid','\"0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42\"'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.1.instructions','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.1.label','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.1.required','false'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.1.tip','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.1.warning','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.1.width','100'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.2.fieldUid','\"08a7f9af-2d90-4274-96e3-8a42b438263e\"'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.2.instructions','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.2.label','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.2.required','false'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.2.tip','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.2.warning','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.2.width','100'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.3.fieldUid','\"7872bf2d-2872-4f3a-9bdf-bdf4d963ac3b\"'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.3.instructions','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.3.label','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.3.required','false'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.3.tip','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.3.warning','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.elements.3.width','100'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.name','\"Content\"'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.fieldLayouts.156ee26e-ef37-4704-8fd2-449518840de7.tabs.0.sortOrder','1'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.handle','\"contact\"'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.hasTitleField','true'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.name','\"Contact\"'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.section','\"d3334cdf-35dd-4426-a336-b7d16b12e0ba\"'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.sortOrder','1'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.titleFormat','\"{section.name|raw}\"'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.titleTranslationKeyFormat','null'),('entryTypes.d47a43b9-a4e9-44dc-97c7-0009015cdf6b.titleTranslationMethod','\"site\"'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.autocapitalize','true'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.autocomplete','false'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.autocorrect','true'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.class','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.disabled','false'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.id','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.instructions','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.label','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.max','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.min','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.name','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.orientation','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.placeholder','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.readonly','false'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.requirable','false'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.size','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.step','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.tip','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.title','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.warning','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.0.width','100'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.1.fieldUid','\"0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42\"'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.1.instructions','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.1.label','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.1.required','false'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.1.tip','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.1.warning','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.elements.1.width','100'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.name','\"Content\"'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.fieldLayouts.c8ef1257-5497-4429-943b-b63cf1cde08e.tabs.0.sortOrder','1'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.handle','\"blogPosts\"'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.hasTitleField','true'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.name','\"Blog Posts\"'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.section','\"c47c3fd1-3430-41d2-8c68-e2fc02339bdc\"'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.sortOrder','1'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.titleFormat','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.titleTranslationKeyFormat','null'),('entryTypes.dab6aef1-67f2-4a0b-9451-dc5581f8fe86.titleTranslationMethod','\"site\"'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.autocapitalize','true'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.autocomplete','false'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.autocorrect','true'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.class','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.disabled','false'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.id','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.instructions','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.label','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.max','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.min','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.name','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.orientation','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.placeholder','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.readonly','false'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.requirable','false'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.size','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.step','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.tip','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.title','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.warning','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.elements.0.width','100'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.name','\"Content\"'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.fieldLayouts.5b5ff630-6c5f-4df3-bdf4-3d9f87bfb9d3.tabs.0.sortOrder','1'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.handle','\"blog\"'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.hasTitleField','false'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.name','\"Blog\"'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.section','\"82345b04-7387-41c9-81c3-a6d92d5702ed\"'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.sortOrder','1'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.titleFormat','\"{section.name|raw}\"'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.titleTranslationKeyFormat','null'),('entryTypes.fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff.titleTranslationMethod','\"site\"'),('fieldGroups.628121ed-3b8d-4b79-be5b-26e82898352c.name','\"Common\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.contentColumnType','\"string\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.fieldGroup','\"628121ed-3b8d-4b79-be5b-26e82898352c\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.handle','\"featureImage\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.instructions','\"\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.name','\"Feature Image\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.searchable','false'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.allowedKinds.0','\"image\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.allowSelfRelations','false'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.allowUploads','true'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.defaultUploadLocationSource','\"volume:4f0c74d0-f1fa-483b-9cb8-9b260405c864\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.defaultUploadLocationSubpath','\"\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.limit','\"1\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.localizeRelations','false'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.previewMode','\"full\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.restrictFiles','\"1\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.selectionLabel','\"Add Feature Image\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.showSiteMenu','false'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.showUnpermittedFiles','false'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.showUnpermittedVolumes','false'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.singleUploadLocationSource','\"volume:4f0c74d0-f1fa-483b-9cb8-9b260405c864\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.singleUploadLocationSubpath','\"\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.source','null'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.sources.0','\"volume:4f0c74d0-f1fa-483b-9cb8-9b260405c864\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.targetSiteId','null'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.useSingleFolder','false'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.validateRelatedElements','false'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.settings.viewMode','\"large\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.translationKeyFormat','null'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.translationMethod','\"site\"'),('fields.08a7f9af-2d90-4274-96e3-8a42b438263e.type','\"craft\\\\fields\\\\Assets\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.contentColumnType','\"text\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.fieldGroup','\"628121ed-3b8d-4b79-be5b-26e82898352c\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.handle','\"richText\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.instructions','\"\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.name','\"Rich Text\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.searchable','false'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.availableTransforms','\"*\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.availableVolumes','\"*\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.cleanupHtml','true'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.columnType','\"text\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.configSelectionMode','\"choose\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.defaultTransform','\"\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.manualConfig','\"\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.purifierConfig','\"\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.purifyHtml','\"1\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.redactorConfig','\"\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.removeEmptyTags','\"1\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.removeInlineStyles','\"1\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.removeNbsp','\"1\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.showUnpermittedFiles','false'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.showUnpermittedVolumes','false'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.settings.uiMode','\"enlarged\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.translationKeyFormat','null'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.translationMethod','\"none\"'),('fields.0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42.type','\"craft\\\\redactor\\\\Field\"'),('fields.ee9b07ba-aa4e-4436-9eb3-d58314d33131.contentColumnType','\"string\"'),('fields.ee9b07ba-aa4e-4436-9eb3-d58314d33131.fieldGroup','\"628121ed-3b8d-4b79-be5b-26e82898352c\"'),('fields.ee9b07ba-aa4e-4436-9eb3-d58314d33131.handle','\"navigation\"'),('fields.ee9b07ba-aa4e-4436-9eb3-d58314d33131.instructions','\"\"'),('fields.ee9b07ba-aa4e-4436-9eb3-d58314d33131.name','\"Navigation\"'),('fields.ee9b07ba-aa4e-4436-9eb3-d58314d33131.searchable','false'),('fields.ee9b07ba-aa4e-4436-9eb3-d58314d33131.settings.contentTable','\"{{%matrixcontent_navigation}}\"'),('fields.ee9b07ba-aa4e-4436-9eb3-d58314d33131.settings.maxBlocks','\"\"'),('fields.ee9b07ba-aa4e-4436-9eb3-d58314d33131.settings.minBlocks','\"\"'),('fields.ee9b07ba-aa4e-4436-9eb3-d58314d33131.settings.propagationMethod','\"all\"'),('fields.ee9b07ba-aa4e-4436-9eb3-d58314d33131.translationKeyFormat','null'),('fields.ee9b07ba-aa4e-4436-9eb3-d58314d33131.translationMethod','\"site\"'),('fields.ee9b07ba-aa4e-4436-9eb3-d58314d33131.type','\"craft\\\\fields\\\\Matrix\"'),('globalSets.abdd1dba-f9bd-49ec-8e43-e438f91be14a.fieldLayouts.78fe7fa0-0878-4c4f-bf38-f8146a1ed29a.tabs.0.elements.0.fieldUid','\"ee9b07ba-aa4e-4436-9eb3-d58314d33131\"'),('globalSets.abdd1dba-f9bd-49ec-8e43-e438f91be14a.fieldLayouts.78fe7fa0-0878-4c4f-bf38-f8146a1ed29a.tabs.0.elements.0.instructions','null'),('globalSets.abdd1dba-f9bd-49ec-8e43-e438f91be14a.fieldLayouts.78fe7fa0-0878-4c4f-bf38-f8146a1ed29a.tabs.0.elements.0.label','null'),('globalSets.abdd1dba-f9bd-49ec-8e43-e438f91be14a.fieldLayouts.78fe7fa0-0878-4c4f-bf38-f8146a1ed29a.tabs.0.elements.0.required','false'),('globalSets.abdd1dba-f9bd-49ec-8e43-e438f91be14a.fieldLayouts.78fe7fa0-0878-4c4f-bf38-f8146a1ed29a.tabs.0.elements.0.tip','null'),('globalSets.abdd1dba-f9bd-49ec-8e43-e438f91be14a.fieldLayouts.78fe7fa0-0878-4c4f-bf38-f8146a1ed29a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.abdd1dba-f9bd-49ec-8e43-e438f91be14a.fieldLayouts.78fe7fa0-0878-4c4f-bf38-f8146a1ed29a.tabs.0.elements.0.warning','null'),('globalSets.abdd1dba-f9bd-49ec-8e43-e438f91be14a.fieldLayouts.78fe7fa0-0878-4c4f-bf38-f8146a1ed29a.tabs.0.elements.0.width','100'),('globalSets.abdd1dba-f9bd-49ec-8e43-e438f91be14a.fieldLayouts.78fe7fa0-0878-4c4f-bf38-f8146a1ed29a.tabs.0.name','\"Content\"'),('globalSets.abdd1dba-f9bd-49ec-8e43-e438f91be14a.fieldLayouts.78fe7fa0-0878-4c4f-bf38-f8146a1ed29a.tabs.0.sortOrder','1'),('globalSets.abdd1dba-f9bd-49ec-8e43-e438f91be14a.handle','\"header\"'),('globalSets.abdd1dba-f9bd-49ec-8e43-e438f91be14a.name','\"Header\"'),('globalSets.dcf364b1-42ea-4512-9b5a-f471987915f0.fieldLayouts.44447efe-9e3a-486c-8e26-ad46556d3f53.tabs.0.elements.0.fieldUid','\"0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42\"'),('globalSets.dcf364b1-42ea-4512-9b5a-f471987915f0.fieldLayouts.44447efe-9e3a-486c-8e26-ad46556d3f53.tabs.0.elements.0.instructions','null'),('globalSets.dcf364b1-42ea-4512-9b5a-f471987915f0.fieldLayouts.44447efe-9e3a-486c-8e26-ad46556d3f53.tabs.0.elements.0.label','null'),('globalSets.dcf364b1-42ea-4512-9b5a-f471987915f0.fieldLayouts.44447efe-9e3a-486c-8e26-ad46556d3f53.tabs.0.elements.0.required','false'),('globalSets.dcf364b1-42ea-4512-9b5a-f471987915f0.fieldLayouts.44447efe-9e3a-486c-8e26-ad46556d3f53.tabs.0.elements.0.tip','null'),('globalSets.dcf364b1-42ea-4512-9b5a-f471987915f0.fieldLayouts.44447efe-9e3a-486c-8e26-ad46556d3f53.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.dcf364b1-42ea-4512-9b5a-f471987915f0.fieldLayouts.44447efe-9e3a-486c-8e26-ad46556d3f53.tabs.0.elements.0.warning','null'),('globalSets.dcf364b1-42ea-4512-9b5a-f471987915f0.fieldLayouts.44447efe-9e3a-486c-8e26-ad46556d3f53.tabs.0.elements.0.width','100'),('globalSets.dcf364b1-42ea-4512-9b5a-f471987915f0.fieldLayouts.44447efe-9e3a-486c-8e26-ad46556d3f53.tabs.0.name','\"Content\"'),('globalSets.dcf364b1-42ea-4512-9b5a-f471987915f0.fieldLayouts.44447efe-9e3a-486c-8e26-ad46556d3f53.tabs.0.sortOrder','1'),('globalSets.dcf364b1-42ea-4512-9b5a-f471987915f0.handle','\"footer\"'),('globalSets.dcf364b1-42ea-4512-9b5a-f471987915f0.name','\"Footer\"'),('imageTransforms.7348f8a9-ba26-46f0-b3bb-8108dd2ce824.format','null'),('imageTransforms.7348f8a9-ba26-46f0-b3bb-8108dd2ce824.handle','\"medium\"'),('imageTransforms.7348f8a9-ba26-46f0-b3bb-8108dd2ce824.height','500'),('imageTransforms.7348f8a9-ba26-46f0-b3bb-8108dd2ce824.interlace','\"none\"'),('imageTransforms.7348f8a9-ba26-46f0-b3bb-8108dd2ce824.mode','\"fit\"'),('imageTransforms.7348f8a9-ba26-46f0-b3bb-8108dd2ce824.name','\"Medium\"'),('imageTransforms.7348f8a9-ba26-46f0-b3bb-8108dd2ce824.position','\"center-center\"'),('imageTransforms.7348f8a9-ba26-46f0-b3bb-8108dd2ce824.quality','null'),('imageTransforms.7348f8a9-ba26-46f0-b3bb-8108dd2ce824.width','700'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.field','\"ee9b07ba-aa4e-4436-9eb3-d58314d33131\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.0.fieldUid','\"54d93250-f04b-4c32-8558-ba1423f72ce3\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.0.label','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.0.required','true'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.0.tip','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.0.warning','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.0.width','100'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.1.fieldUid','\"7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.1.label','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.1.required','true'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.1.tip','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.1.warning','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.elements.1.width','100'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.name','\"Content\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fieldLayouts.0771aaf4-d574-4c13-80be-2386a61c5c3a.tabs.0.sortOrder','1'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.contentColumnType','\"text\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.fieldGroup','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.handle','\"linkText\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.instructions','\"\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.name','\"Link Text\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.searchable','false'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.settings.byteLimit','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.settings.charLimit','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.settings.code','\"\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.settings.columnType','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.settings.initialRows','\"4\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.settings.multiline','\"\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.settings.placeholder','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.settings.uiMode','\"normal\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.translationKeyFormat','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.translationMethod','\"none\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.54d93250-f04b-4c32-8558-ba1423f72ce3.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.contentColumnType','\"string\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.fieldGroup','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.handle','\"linkDestination\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.instructions','\"\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.name','\"Link Destination\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.searchable','false'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.settings.allowSelfRelations','false'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.settings.limit','\"1\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.settings.localizeRelations','false'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.settings.selectionLabel','\"Add a Link Destination\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.settings.showSiteMenu','false'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.settings.source','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.settings.sources','\"*\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.settings.targetSiteId','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.settings.validateRelatedElements','false'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.settings.viewMode','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.translationKeyFormat','null'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.translationMethod','\"site\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.fields.7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1.type','\"craft\\\\fields\\\\Entries\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.handle','\"navLink\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.name','\"Nav Link\"'),('matrixBlockTypes.7181c4a5-9951-4d74-b4f0-c7965d68662e.sortOrder','1'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('sections.283a6d7e-1b10-48b4-a915-c4b30d692bb2.enableVersioning','true'),('sections.283a6d7e-1b10-48b4-a915-c4b30d692bb2.handle','\"aboutUs\"'),('sections.283a6d7e-1b10-48b4-a915-c4b30d692bb2.name','\"About Us\"'),('sections.283a6d7e-1b10-48b4-a915-c4b30d692bb2.propagationMethod','\"all\"'),('sections.283a6d7e-1b10-48b4-a915-c4b30d692bb2.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.enabledByDefault','true'),('sections.283a6d7e-1b10-48b4-a915-c4b30d692bb2.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.hasUrls','true'),('sections.283a6d7e-1b10-48b4-a915-c4b30d692bb2.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.template','\"general\"'),('sections.283a6d7e-1b10-48b4-a915-c4b30d692bb2.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.uriFormat','\"about-us\"'),('sections.283a6d7e-1b10-48b4-a915-c4b30d692bb2.type','\"single\"'),('sections.82345b04-7387-41c9-81c3-a6d92d5702ed.enableVersioning','true'),('sections.82345b04-7387-41c9-81c3-a6d92d5702ed.handle','\"blog\"'),('sections.82345b04-7387-41c9-81c3-a6d92d5702ed.name','\"Blog\"'),('sections.82345b04-7387-41c9-81c3-a6d92d5702ed.propagationMethod','\"all\"'),('sections.82345b04-7387-41c9-81c3-a6d92d5702ed.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.enabledByDefault','true'),('sections.82345b04-7387-41c9-81c3-a6d92d5702ed.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.hasUrls','true'),('sections.82345b04-7387-41c9-81c3-a6d92d5702ed.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.template','\"blog\\\\index\"'),('sections.82345b04-7387-41c9-81c3-a6d92d5702ed.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.uriFormat','\"blog\"'),('sections.82345b04-7387-41c9-81c3-a6d92d5702ed.type','\"single\"'),('sections.b7ba31d9-ead2-4192-a034-1861e50f4429.enableVersioning','true'),('sections.b7ba31d9-ead2-4192-a034-1861e50f4429.handle','\"home\"'),('sections.b7ba31d9-ead2-4192-a034-1861e50f4429.name','\"Home\"'),('sections.b7ba31d9-ead2-4192-a034-1861e50f4429.propagationMethod','\"all\"'),('sections.b7ba31d9-ead2-4192-a034-1861e50f4429.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.enabledByDefault','true'),('sections.b7ba31d9-ead2-4192-a034-1861e50f4429.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.hasUrls','true'),('sections.b7ba31d9-ead2-4192-a034-1861e50f4429.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.template','\"home\"'),('sections.b7ba31d9-ead2-4192-a034-1861e50f4429.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.uriFormat','\"__home__\"'),('sections.b7ba31d9-ead2-4192-a034-1861e50f4429.type','\"single\"'),('sections.c47c3fd1-3430-41d2-8c68-e2fc02339bdc.enableVersioning','true'),('sections.c47c3fd1-3430-41d2-8c68-e2fc02339bdc.handle','\"blogPosts\"'),('sections.c47c3fd1-3430-41d2-8c68-e2fc02339bdc.name','\"Blog Posts\"'),('sections.c47c3fd1-3430-41d2-8c68-e2fc02339bdc.propagationMethod','\"all\"'),('sections.c47c3fd1-3430-41d2-8c68-e2fc02339bdc.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.enabledByDefault','true'),('sections.c47c3fd1-3430-41d2-8c68-e2fc02339bdc.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.hasUrls','true'),('sections.c47c3fd1-3430-41d2-8c68-e2fc02339bdc.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.template','\"blog\\\\_entry\"'),('sections.c47c3fd1-3430-41d2-8c68-e2fc02339bdc.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.uriFormat','\"blog/{slug}\"'),('sections.c47c3fd1-3430-41d2-8c68-e2fc02339bdc.type','\"channel\"'),('sections.d3334cdf-35dd-4426-a336-b7d16b12e0ba.enableVersioning','true'),('sections.d3334cdf-35dd-4426-a336-b7d16b12e0ba.handle','\"contact\"'),('sections.d3334cdf-35dd-4426-a336-b7d16b12e0ba.name','\"Contact\"'),('sections.d3334cdf-35dd-4426-a336-b7d16b12e0ba.propagationMethod','\"all\"'),('sections.d3334cdf-35dd-4426-a336-b7d16b12e0ba.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.enabledByDefault','true'),('sections.d3334cdf-35dd-4426-a336-b7d16b12e0ba.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.hasUrls','true'),('sections.d3334cdf-35dd-4426-a336-b7d16b12e0ba.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.template','\"contact\"'),('sections.d3334cdf-35dd-4426-a336-b7d16b12e0ba.siteSettings.7c70816a-1fa8-4637-b04e-5872560bec6d.uriFormat','\"contact\"'),('sections.d3334cdf-35dd-4426-a336-b7d16b12e0ba.type','\"single\"'),('siteGroups.d48e6534-761e-403d-8e45-470a57c65a5d.name','\"Craft CMS Bruno\"'),('sites.7c70816a-1fa8-4637-b04e-5872560bec6d.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.7c70816a-1fa8-4637-b04e-5872560bec6d.handle','\"default\"'),('sites.7c70816a-1fa8-4637-b04e-5872560bec6d.hasUrls','true'),('sites.7c70816a-1fa8-4637-b04e-5872560bec6d.language','\"en-US\"'),('sites.7c70816a-1fa8-4637-b04e-5872560bec6d.name','\"Craft CMS Bruno\"'),('sites.7c70816a-1fa8-4637-b04e-5872560bec6d.primary','true'),('sites.7c70816a-1fa8-4637-b04e-5872560bec6d.siteGroup','\"d48e6534-761e-403d-8e45-470a57c65a5d\"'),('sites.7c70816a-1fa8-4637-b04e-5872560bec6d.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Craft CMS Bruno\"'),('system.schemaVersion','\"3.6.6\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.autocapitalize','true'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.autocomplete','false'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.autocorrect','true'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.class','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.disabled','false'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.id','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.instructions','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.label','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.max','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.min','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.name','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.orientation','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.placeholder','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.readonly','false'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.requirable','false'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.size','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.step','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.tip','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.title','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.warning','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.elements.0.width','100'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.name','\"Content\"'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.fieldLayouts.ce367e7f-fefb-4692-becb-d96c2d2d5872.tabs.0.sortOrder','1'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.handle','\"uploads\"'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.hasUrls','true'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.name','\"Uploads\"'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.settings.path','\"@webroot/uploads\"'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.sortOrder','1'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.titleTranslationKeyFormat','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.titleTranslationMethod','null'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.type','\"craft\\\\volumes\\\\Local\"'),('volumes.4f0c74d0-f1fa-483b-9cb8-9b260405c864.url','\"@web/uploads\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfignames`
--

DROP TABLE IF EXISTS `projectconfignames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfignames` (
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfignames`
--

LOCK TABLES `projectconfignames` WRITE;
/*!40000 ALTER TABLE `projectconfignames` DISABLE KEYS */;
INSERT INTO `projectconfignames` VALUES ('07f7f880-4033-4af8-958d-75566b5d4f7d','About Us'),('08a7f9af-2d90-4274-96e3-8a42b438263e','Feature Image'),('0fbda1c3-dadc-4865-b4c5-c0e6ec6d8f42','Rich Text'),('283a6d7e-1b10-48b4-a915-c4b30d692bb2','About Us'),('4f0c74d0-f1fa-483b-9cb8-9b260405c864','Uploads'),('54d93250-f04b-4c32-8558-ba1423f72ce3','Link Text'),('628121ed-3b8d-4b79-be5b-26e82898352c','Common'),('668190c7-a7f7-4411-af53-13a7958b8ce6','User Email'),('7181c4a5-9951-4d74-b4f0-c7965d68662e','Nav Link'),('7348f8a9-ba26-46f0-b3bb-8108dd2ce824','Medium'),('7c70816a-1fa8-4637-b04e-5872560bec6d','Craft CMS Bruno'),('7c7759c8-8d8a-48d2-bd7e-0b9ef264a3d1','Link Destination'),('82345b04-7387-41c9-81c3-a6d92d5702ed','Blog'),('abdd1dba-f9bd-49ec-8e43-e438f91be14a','Header'),('b7ba31d9-ead2-4192-a034-1861e50f4429','Home'),('c47c3fd1-3430-41d2-8c68-e2fc02339bdc','Blog Posts'),('cacf563c-79a1-4b35-959a-fa5cd9f09ce7','Full Name'),('cb575058-32d3-4e7b-bd7c-eca2b37c4602','Home'),('d3334cdf-35dd-4426-a336-b7d16b12e0ba','Contact'),('d47a43b9-a4e9-44dc-97c7-0009015cdf6b','Contact'),('d48e6534-761e-403d-8e45-470a57c65a5d','Craft CMS Bruno'),('dab6aef1-67f2-4a0b-9451-dc5581f8fe86','Blog Posts'),('dcf364b1-42ea-4512-9b5a-f471987915f0','Footer'),('ee9b07ba-aa4e-4436-9eb3-d58314d33131','Navigation'),('fb06fe9a-fa3f-493a-bf12-6e5f7f8c0bff','Blog');
/*!40000 ALTER TABLE `projectconfignames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_izttorzokugacdxuzkfplbvesgctyeikjgly` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_boqevkhnvplhmhlxohejfhtjzmnuokcdyrzh` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_omfgprdfpojpssjfpvhgdbdznayajoatypyn` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_qghfmpwxmckufunicvgkojlmqlkgtawvxgam` (`sourceId`),
  KEY `idx_qkmkeomgcocsyqglafcpmguchqkodacleihn` (`targetId`),
  KEY `idx_hmwmhgdusstatonhhpsmvkmauhbqbscemvxi` (`sourceSiteId`),
  CONSTRAINT `fk_pyezmepxgmluojgdnfexdbacvxawpbouxefa` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rdowoxnyfvqdqoxwephzcyurdunsbpslbcgs` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zasymhlyxmrqrjjmowgpqzjrtwokywuolmhp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zmnjyomczeqplnxzaznwtmhknemgvhncrsnp` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (1,2,2,NULL,7,1,'2021-03-15 12:16:39','2021-03-15 12:16:39','09bfee06-def2-414a-a951-7494d4e2e08b'),(2,2,8,NULL,7,1,'2021-03-15 12:16:40','2021-03-15 12:16:40','7d37d1aa-2682-4d3d-a32d-41a2bc1fc689'),(3,2,9,NULL,7,1,'2021-03-15 12:20:01','2021-03-15 12:20:01','e52a0561-dfe6-4db9-9ca7-d19ca77d12f2'),(4,2,10,NULL,7,1,'2021-03-15 12:20:02','2021-03-15 12:20:02','f2e2dbbc-e2ff-44ae-8e08-730d8cabc125'),(5,5,24,NULL,11,1,'2021-03-15 12:33:09','2021-03-15 12:33:09','9fd2ca7e-c826-4494-a8b5-d3b788090c47'),(6,5,25,NULL,14,1,'2021-03-15 12:33:09','2021-03-15 12:33:09','880ba4e1-c106-40d4-ada4-aa61365539d0'),(7,5,32,NULL,30,1,'2021-03-15 15:31:49','2021-03-15 15:31:49','f162eb7b-d935-4480-838c-4be0cfe471b1'),(8,2,33,NULL,7,1,'2021-03-15 15:36:49','2021-03-15 15:36:49','c5fc9f1a-efbd-40ed-adce-574aa2d343a4'),(9,2,34,NULL,7,1,'2021-03-15 15:37:26','2021-03-15 15:37:26','e7456233-98eb-49ec-bc7b-0b6e234255b3'),(10,2,35,NULL,7,1,'2021-03-15 15:37:44','2021-03-15 15:37:44','2576d1f3-0443-459d-9af1-ae42b76b6a0f'),(11,2,36,NULL,7,1,'2021-03-15 15:38:46','2021-03-15 15:38:46','958e949d-fcfb-4843-92c7-43bec707f837'),(12,2,37,NULL,7,1,'2021-03-15 15:39:04','2021-03-15 15:39:04','868c33c1-6e55-48fb-b515-86f8b3e9e5f2'),(13,2,14,NULL,39,1,'2021-03-15 15:40:24','2021-03-15 15:40:24','b2d4edec-3f99-4ab1-a365-936b123364d4'),(14,2,40,NULL,39,1,'2021-03-15 15:40:25','2021-03-15 15:40:25','c742a5a0-a957-42ab-bc08-b4551c0e6629'),(15,2,11,NULL,42,1,'2021-03-15 15:41:53','2021-03-15 15:41:53','0d9480d6-fded-488a-a484-efee221fbcb7'),(16,2,43,NULL,42,1,'2021-03-15 15:41:53','2021-03-15 15:41:53','d2f76b98-2886-4799-8fdf-0e3a3e8a3a12'),(17,2,44,NULL,39,1,'2021-03-15 15:44:57','2021-03-15 15:44:57','2ba695dc-74f5-439a-868a-9df1f38055a0'),(18,2,45,NULL,39,1,'2021-03-15 15:44:57','2021-03-15 15:44:57','b6ef1d11-d475-4ce6-8b93-b6da7f61a63b'),(19,2,46,NULL,39,1,'2021-03-15 15:45:32','2021-03-15 15:45:32','45bdf2d1-69f9-4a3a-9b0c-b2fc5cfe911b'),(20,2,48,NULL,39,1,'2021-03-15 15:46:03','2021-03-15 15:46:03','76c66f9f-d884-4ce8-a0df-619ec8862cdc');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('10a3d55a','@lib/vue'),('10f6628e','@lib/fileupload'),('1c555d99','@lib/iframe-resizer'),('1ef678c1','@craft/web/assets/craftsupport/dist'),('20408099','@lib/fabric'),('21e34585','@craft/web/assets/feed/dist'),('220be84c','@craft/web/assets/editentry/dist'),('2453476e','@lib/axios'),('2ad2a4c','@craft/web/assets/dashboard/dist'),('350654a7','@lib/garnishjs'),('379f3666','@lib/jquery-ui'),('3a9ee268','@craft/web/assets/editsection/dist'),('417a9c9c','@app/web/assets/pluginstore/dist'),('436ea82a','@craft/web/assets/recententries/dist'),('44fb31c3','@craft/web/assets/craftsupport/dist'),('47cf861','@craft/web/assets/matrixsettings/dist'),('4aadee75','@craft/web/assets/updater/dist'),('4d2dfc93','@craft/redactor/assets/field/dist'),('55e6b74f','@craft/web/assets/login/dist'),('560c0a7e','@lib/xregexp'),('56dd6fa9','@lib/axios'),('58a0634e','@craft/web/assets/dashboard/dist'),('5c604ef4','@lib/selectize'),('5e32c00a','@lib/element-resize-detector'),('6093ab6a','@craft/web/assets/editsection/dist'),('6511022b','@lib/jquery.payment'),('6874b335','@app/web/assets/cp/dist'),('68b95abe','@bower/jquery/dist'),('6bb4321','@lib/d3'),('6cbeaa01','@craft/redactor/assets/redactor-plugins/dist/fullscreen'),('6deda64c','@app/web/assets/fieldsettings/dist'),('7806a14e','@craft/web/assets/editentry/dist'),('7936adc3','@lib/velocity'),('7be1ef3c','@craft/web/assets/edittransform/dist'),('7dd4ea44','@craft/web/assets/updateswidget/dist'),('7f51c639','@craft/web/assets/plugins/dist'),('81e6370','@lib/picturefill'),('83e33c92','@craft/web/assets/fields/dist'),('84b45ff7','@bower/jquery/dist'),('85fe5742','@lib/timepicker'),('873380f4','@app/web/assets/fields/dist'),('8809049a','@craft/web/assets/cp/dist'),('891c0762','@lib/jquery.payment'),('953ba88a','@lib/velocity'),('ab24f402','@lib/element-resize-detector'),('b06d4bbd','@lib/selectize'),('b21bc3a9','@craft/web/assets/matrix/dist'),('b3445665','@craft/web/assets/pluginstore/dist'),('b7433dce','@craft/web/assets/installer/dist'),('b8fba6c5','@craft/web/assets/admintable/dist'),('ba010f37','@lib/xregexp'),('c01060af','@lib/garnishjs'),('c13ae64b','@craft/redactor/assets/redactor/dist'),('c36ff5e8','@craft/redactor/assets/redactor-plugins/dist/video'),('d1ba6b20','@craft/web/assets/recententries/dist'),('d2044d98','@craft/web/assets/cp/dist'),('d556b491','@lib/fabric'),('d8792d7f','@craft/web/assets/updater/dist'),('db84d2e8','@app/web/assets/plugins/dist'),('db92332f','@lib/jquery-ui'),('e1315072','@lib/prismjs'),('e3b75afb','@lib/jquery-touch-events'),('e4136639','@lib/picturefill'),('e5e05686','@lib/fileupload'),('e9436991','@lib/iframe-resizer'),('e9491f67','@craft/web/assets/pluginstore/dist'),('eca70868','@app/web/assets/admintable/dist'),('ee14e493','@craft/web/assets/fieldsettings/dist'),('ef00294e','@craft/web/assets/updateswidget/dist'),('f3ad7729','@lib/d3'),('f455458d','@craft/web/assets/installer/dist'),('fba5fb2','@lib/jquery-touch-events'),('fbedde86','@craft/web/assets/admintable/dist'),('fcaed013','@lib/vue'),('febfe4d','@craft/web/assets/login/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nxuyiqxnkvdydvtxsefwkxnpejtmzfcyumcr` (`sourceId`,`num`),
  KEY `fk_lzgmuoiyzdzximytehncpdybyatqvynkorxp` (`creatorId`),
  CONSTRAINT `fk_lzgmuoiyzdzximytehncpdybyatqvynkorxp` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vxyhznabutzuwnreviclruhxsizikmcshclc` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,''),(4,2,1,4,NULL),(5,2,1,5,''),(6,2,1,6,NULL),(7,2,1,7,NULL),(8,11,1,1,NULL),(9,11,1,2,NULL),(10,14,1,1,NULL),(11,11,1,3,NULL),(12,14,1,2,NULL),(13,11,1,4,''),(14,14,1,3,''),(15,11,1,5,NULL),(16,11,1,6,NULL),(17,11,1,7,''),(18,30,1,1,NULL),(19,2,1,8,''),(20,2,1,9,''),(21,2,1,10,''),(22,2,1,11,''),(23,2,1,12,''),(24,14,1,4,NULL),(25,14,1,5,''),(26,11,1,8,NULL),(27,11,1,9,''),(28,14,1,6,NULL),(29,14,1,7,NULL),(30,14,1,8,NULL),(31,14,1,9,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_vgkckkgpbravdupoxpbjxtaklfekymirywlk` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' sertic bruno gmail com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' home '),(2,'title',0,1,' home '),(7,'extension',0,1,' png '),(7,'filename',0,1,' headerimageshadow2 png '),(7,'kind',0,1,' image '),(7,'slug',0,1,''),(7,'title',0,1,' header image shadow2 '),(11,'slug',0,1,' about us '),(11,'title',0,1,' about us '),(14,'slug',0,1,' contact '),(14,'title',0,1,' contact '),(23,'slug',0,1,''),(24,'slug',0,1,''),(25,'slug',0,1,''),(26,'slug',0,1,''),(27,'slug',0,1,' first blog post '),(27,'title',0,1,' first blog post '),(28,'slug',0,1,' second blog post '),(28,'title',0,1,' second blog post '),(29,'slug',0,1,' third post '),(29,'title',0,1,' third post '),(30,'slug',0,1,' blog '),(30,'title',0,1,' blog '),(32,'slug',0,1,''),(39,'extension',0,1,' png '),(39,'filename',0,1,' contactimage png '),(39,'kind',0,1,' image '),(39,'slug',0,1,''),(39,'title',0,1,' contact image '),(42,'extension',0,1,' jpg '),(42,'filename',0,1,' servicesimage2 jpg '),(42,'kind',0,1,' image '),(42,'slug',0,1,''),(42,'title',0,1,' services image2 '),(47,'slug',0,1,''),(49,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `previewTargets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_factriqmftufqtmbkbqeshswovhycgbedjen` (`handle`),
  KEY `idx_dqamnoqtcqteobimivyiwutaszyhrtlzyznn` (`name`),
  KEY `idx_hagadtdeqnflcjowfaisbjgfiuavmthdnjer` (`structureId`),
  KEY `idx_pgdhywrtblwotpzvbsxvgwwtpocugwhaipwf` (`dateDeleted`),
  CONSTRAINT `fk_opdxusplmmwatlyhzdtdtsaihvuqvnrdzhru` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,'all',NULL,'2021-03-15 11:39:44','2021-03-15 11:39:44',NULL,'b7ba31d9-ead2-4192-a034-1861e50f4429'),(2,NULL,'About Us','aboutUs','single',1,'all',NULL,'2021-03-15 12:25:17','2021-03-15 12:25:17',NULL,'283a6d7e-1b10-48b4-a915-c4b30d692bb2'),(3,NULL,'Contact','contact','single',1,'all',NULL,'2021-03-15 12:25:36','2021-03-15 12:25:36',NULL,'d3334cdf-35dd-4426-a336-b7d16b12e0ba'),(4,NULL,'Blog Posts','blogPosts','channel',1,'all',NULL,'2021-03-15 12:42:50','2021-03-15 12:42:50',NULL,'c47c3fd1-3430-41d2-8c68-e2fc02339bdc'),(5,NULL,'Blog','blog','single',1,'all',NULL,'2021-03-15 15:31:09','2021-03-15 15:31:09',NULL,'82345b04-7387-41c9-81c3-a6d92d5702ed');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ftuueoozxeaeqieedslzszhawbjpjzykjcrh` (`sectionId`,`siteId`),
  KEY `idx_fxnhwctxkqjwatnrhssnclvezhlnlzgcpyeo` (`siteId`),
  CONSTRAINT `fk_hoschfjuqnxfvkiyodqsabkztttyyfekxrtq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pvwemprigucvuxuwwclqphwnjiezsoyemsls` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','home',1,'2021-03-15 11:39:44','2021-03-15 12:20:01','4f345c32-bd52-4da9-a409-753f1234af32'),(2,2,1,1,'about-us','general',1,'2021-03-15 12:25:17','2021-03-15 12:25:17','11b1a8de-ac0f-4e61-9dfd-5e002c5e4032'),(3,3,1,1,'contact','contact',1,'2021-03-15 12:25:36','2021-03-15 15:44:56','938c2d05-52e4-4f60-a00d-28f100129aa2'),(4,4,1,1,'blog/{slug}','blog\\_entry',1,'2021-03-15 12:42:50','2021-03-15 12:42:50','3bbca4c2-ace9-45b6-a651-b9c37186be97'),(5,5,1,1,'blog','blog\\index',1,'2021-03-15 15:31:09','2021-03-15 15:31:09','296587e6-27c8-456b-aa68-0288bd2c3767');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vowzfcmaeelfxlmlhacktnazcybquxmsluzs` (`uid`),
  KEY `idx_ckvguvaqgqttkudqbwdcxxjafogkvjisfweb` (`token`),
  KEY `idx_bburuzkdbkvuaddiqnssqysahehezdehrqtv` (`dateUpdated`),
  KEY `idx_qhkbxmjlmvkeztaqwztypbxrtzkkmlujrlbq` (`userId`),
  CONSTRAINT `fk_lfmmqkeowxclvywrsvuyolthqyzczlpifasi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'QxhktwlAxxXsJBmaDqPc3E9iesXdq1-h9XsVwRGh9aNfOcZJ8_R3QLSx1tup4vFDWfxfgldESN_0jpDl_4qH-yNKQK37AScvpuFu','2021-03-15 11:38:14','2021-03-15 13:24:48','ab4b6532-f566-45b4-874f-af97581ace03'),(3,1,'ai-QReAlqmFsPKBqh_yxEZJowG3RkVfAKktq1T90WF8KDX-Tgz4kdyf0oQCR1b3Prp6YHaf5SC4yM3usygePac9yG6kuo_itwQ0R','2021-03-16 06:54:22','2021-03-16 07:08:10','e20468b4-8e78-4107-9765-1d5c4b640095');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nuzhhzgjkuvwcbiunzpmzglxabxfhzzykrft` (`userId`,`message`),
  CONSTRAINT `fk_cjnvlwdegyonirifitbddionkglmgutqusfu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rgewykfauflzwjygggnrhvvoiuhwvjjouord` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'Craft CMS Bruno','2021-03-15 11:37:33','2021-03-15 11:37:33',NULL,'d48e6534-761e-403d-8e45-470a57c65a5d');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_buxpqeuhiottjbjmcluleshuspxiwillrlsb` (`dateDeleted`),
  KEY `idx_ndzoohfteowjcbclrumfmsomgpizhpvhlkty` (`handle`),
  KEY `idx_wrvslrbvqzedcydxdqxcretliufnuxhdfodz` (`sortOrder`),
  KEY `fk_myewjbptqjrqlbqkndwhkrqoiqjwtwitikxp` (`groupId`),
  CONSTRAINT `fk_myewjbptqjrqlbqkndwhkrqoiqjwtwitikxp` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,1,'Craft CMS Bruno','default','en-US',1,'$PRIMARY_SITE_URL',1,'2021-03-15 11:37:33','2021-03-15 11:37:33',NULL,'7c70816a-1fa8-4637-b04e-5872560bec6d');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cgetlsichudryhokrpgeylikvwgovhtdasbb` (`structureId`,`elementId`),
  KEY `idx_xllrxtmkjimrelachmjdsuwqtnbtetbnenhl` (`root`),
  KEY `idx_locbrnptosgvrnttauxaqczsygathhvjdsae` (`lft`),
  KEY `idx_dxljkackepueuqejumzvuxksnfbfuyyuyiif` (`rgt`),
  KEY `idx_sneelpfhiikpgchlewzhmdudvdcmjupoejwd` (`level`),
  KEY `idx_mfzpxtyuhwlgnuldmxasmaeewmebehczbcbb` (`elementId`),
  CONSTRAINT `fk_ifajdhquljhxbxnaesezwbjjhebybvncypry` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nbmxqyekwshkfvnjqkuhxpsflzunybhiyfew` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zwuibeokxklduntxxqbiwzivxqgysereegzo` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_whprpfwhygpnlaycjoxphgubuekuzahkpmob` (`key`,`language`),
  KEY `idx_icicpmnxgmhbwjbteziinvihuymrwoyaiitn` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pefhzuvjtaenlswijnpzftrraswscfjxktnm` (`name`),
  KEY `idx_vfegwyarqattrfjfvdeoypsposylnuqvudpi` (`handle`),
  KEY `idx_fmxvcodlzluhbaznryuokmmzvkidrslkpfmv` (`dateDeleted`),
  KEY `fk_hkuktfcrqbaujnmgwaifblzvhtjtmhxekqno` (`fieldLayoutId`),
  CONSTRAINT `fk_hkuktfcrqbaujnmgwaifblzvhtjtmhxekqno` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vmqupojvumdgyeqoqaqbvdabdhxywngkidtc` (`groupId`),
  CONSTRAINT `fk_fworbxdafcsimfvvxcotbkdtxmmrzwsnnbau` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zwdecmvpaaldsncxybahmgghqxpjjbkarfnd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ifoxicsmjeloeswhsixulcezdobwnxpodlej` (`cacheId`),
  KEY `idx_aiyrclgsakpskzuhfpxbpqotcpsrtsqhdzwe` (`elementId`),
  CONSTRAINT `fk_krwvfeyimhlzjcfgwhvcexpmfvupufmmrdwt` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zahulsgjuagdqtqqjreqhdapzumqxzpjuvgp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecacheelements`
--

LOCK TABLES `templatecacheelements` WRITE;
/*!40000 ALTER TABLE `templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lzuelyhtsswfugspmtdxtcfowuvarutlafvp` (`cacheId`),
  KEY `idx_fhhfrtnvpprdsukrvmtcpkftortvwliftdwm` (`type`),
  CONSTRAINT `fk_yuhhdmprokhblioceydolrbzrxgffacxxlgo` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecachequeries`
--

LOCK TABLES `templatecachequeries` WRITE;
/*!40000 ALTER TABLE `templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rtmiqkfjfzcoquvzxqtmbeomxspnsoxtukpa` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_unlieploiszfjlwbaxcfcwgecdcoworemfym` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_taaxnfvkcghvyyluravstqltjqzvttfitmbc` (`siteId`),
  CONSTRAINT `fk_ecacybxdjylmmjzinsvkzqipovttpnlnfyem` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecaches`
--

LOCK TABLES `templatecaches` WRITE;
/*!40000 ALTER TABLE `templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iolmivznfcneecteqpybzqffmeawepnnmcnm` (`token`),
  KEY `idx_avgpvsfnfbdgtnnzmjmmftuqytpipfuernva` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dkbzypqrxalmwpidylbjbowqzrdgprsyzjwz` (`handle`),
  KEY `idx_vkvqrggdfvleyiprbqwbdvliyqolenlgqrsh` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vaxsekpswkfyiijkrvovdukkrpzpswqmelsv` (`groupId`,`userId`),
  KEY `idx_tggvcnrgjbiewenevhaosmlpybpqnazjahga` (`userId`),
  CONSTRAINT `fk_grfreayjvcayapsgxzqrvlqzyktwqoucddce` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tpqhcwitslwsucyactxntifhdvkmkrekupbm` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tjildcvzsbggrqbfabbkhftikoqcrxgpvnec` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xvqwglotcjfhjfuuvhzzdgdstkkwdfwziwxg` (`permissionId`,`groupId`),
  KEY `idx_xkyrehtqgolfllpxziuffolncguxkkcjrqus` (`groupId`),
  CONSTRAINT `fk_cyqvoznnhequxjifwyzzpxucztwznktcpdxi` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lzhabbhrykxasupipvxcemmagawuqwrkfxxy` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_utoksisdpxchslsqltiundnvoeuhuysddjcl` (`permissionId`,`userId`),
  KEY `idx_rrnoxjqtsbcltzauvencyvkrgsqyncjardya` (`userId`),
  CONSTRAINT `fk_jxyjgmmaegibpiuxoqxwdizvqepwnupfgvbu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zwjnhuisehbjpxtpczvegdopjchhracjeinu` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_nwqhnridafiyrjwpdpjoamadvtfuwkeksbtf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uqruibpnsfexwdpvsovcwbkxpxpifivlzfas` (`uid`),
  KEY `idx_vdvwjuvwvdwouzrfzuahrmldghkzfujscirx` (`verificationCode`),
  KEY `idx_kajkocpeosgrbaqdwamiihltgnvhnbhksrmf` (`email`),
  KEY `idx_eceqeykuyylmetgvtdapxegzvrdoqtnfpwph` (`username`),
  KEY `fk_xzpzheuthyerbphmphexvmqtypbuaqrjciad` (`photoId`),
  CONSTRAINT `fk_mxdirboudwoosjeyamkrzthivscrynjrbtkk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xzpzheuthyerbphmphexvmqtypbuaqrjciad` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin',NULL,NULL,NULL,'sertic.bruno@gmail.com','$2y$13$sw3NylY4qeeKv1KG8nqNSOjFvrvSzNgderIkS56kZvOAJB1pvqdMm',1,0,0,0,'2021-03-16 06:54:23',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2021-03-15 11:37:34','2021-03-15 11:37:34','2021-03-16 06:54:23','cbe64df3-a171-48d9-9832-b0d0ea01e23a');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dizbffiiagzdjiyplkobpsjuobrqpyvojugk` (`name`,`parentId`,`volumeId`),
  KEY `idx_dfcaqfsxmealkmubqxwzzprajqdxacfogclw` (`parentId`),
  KEY `idx_fwdwmjhrtsgmufadizdhvdwuwbnnkkenmkbh` (`volumeId`),
  CONSTRAINT `fk_qmsfdgnnxmqxkgdjzbdwoljwdebvvdnsawln` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_szpzfgkiilycnrqhodrwseuwazkmcfhiqxna` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Uploads','','2021-03-15 12:14:40','2021-03-15 12:14:40','67e7235f-e11b-42cf-861e-7fece8521d73');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xpmlicsqeaiqgdztibqcgdmafdimkfawcxat` (`name`),
  KEY `idx_padnlyvwgwxsoszhlxqzynetrjvcjdgluwaf` (`handle`),
  KEY `idx_seglriqdqvzeifkeywfdhsoqezzqwhtrwntk` (`fieldLayoutId`),
  KEY `idx_rdmbvhghftxfqigyjphivmiqsxeorezfszze` (`dateDeleted`),
  CONSTRAINT `fk_ktoonxekdlkwhlkovzmerfmhihhpahohfebt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,2,'Uploads','uploads','craft\\volumes\\Local',1,'@web/uploads','site',NULL,'{\"path\":\"@webroot/uploads\"}',1,'2021-03-15 12:14:40','2021-03-15 12:14:40',NULL,'4f0c74d0-f1fa-483b-9cb8-9b260405c864');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sbnqwukzejovbatblppbwmprnmecqvlkkunu` (`userId`),
  CONSTRAINT `fk_xmswvxgybjsxtkpwwaldtyhcuvybcwmrztwu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2021-03-15 11:38:15','2021-03-15 11:38:15','8c692338-0d6b-450e-8f99-8cd5ae1e206b'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2021-03-15 11:38:15','2021-03-15 11:38:15','6c9ce749-4829-48d1-9192-ff711a75e87e'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2021-03-15 11:38:15','2021-03-15 11:38:15','73dd6d18-ee82-4d1d-a17e-5af9b92697c5'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2021-03-15 11:38:15','2021-03-15 11:38:15','fdc8c640-0c2b-4ea7-b29b-7cf1effd094a');
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

-- Dump completed on 2021-03-16 10:32:19
