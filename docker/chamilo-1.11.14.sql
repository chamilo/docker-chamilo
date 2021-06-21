-- MySQL dump 10.19  Distrib 10.3.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: chamilo
-- ------------------------------------------------------
-- Server version	10.3.29-MariaDB-0ubuntu0.20.04.1

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
-- Table structure for table `access_url`
--

DROP TABLE IF EXISTS `access_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `tms` datetime DEFAULT NULL,
  `url_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url`
--

LOCK TABLES `access_url` WRITE;
/*!40000 ALTER TABLE `access_url` DISABLE KEYS */;
INSERT INTO `access_url` VALUES (1,'http://localhost/',' ',1,1,'2021-06-20 22:09:35',NULL);
/*!40000 ALTER TABLE `access_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_course`
--

DROP TABLE IF EXISTS `access_url_rel_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `access_url_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8E97FC0891D79BD3` (`c_id`),
  KEY `IDX_8E97FC0873444FD5` (`access_url_id`),
  CONSTRAINT `FK_8E97FC0873444FD5` FOREIGN KEY (`access_url_id`) REFERENCES `access_url` (`id`),
  CONSTRAINT `FK_8E97FC0891D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_course`
--

LOCK TABLES `access_url_rel_course` WRITE;
/*!40000 ALTER TABLE `access_url_rel_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_url_rel_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_course_category`
--

DROP TABLE IF EXISTS `access_url_rel_course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_url_id` int(11) NOT NULL,
  `course_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_course_category`
--

LOCK TABLES `access_url_rel_course_category` WRITE;
/*!40000 ALTER TABLE `access_url_rel_course_category` DISABLE KEYS */;
INSERT INTO `access_url_rel_course_category` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `access_url_rel_course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_session`
--

DROP TABLE IF EXISTS `access_url_rel_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_session` (
  `access_url_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`access_url_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_session`
--

LOCK TABLES `access_url_rel_session` WRITE;
/*!40000 ALTER TABLE `access_url_rel_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_url_rel_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_user`
--

DROP TABLE IF EXISTS `access_url_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_user` (
  `access_url_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`access_url_id`,`user_id`),
  KEY `idx_access_url_rel_user_user` (`user_id`),
  KEY `idx_access_url_rel_user_access_url` (`access_url_id`),
  KEY `idx_access_url_rel_user_access_url_user` (`user_id`,`access_url_id`),
  CONSTRAINT `FK_8557426373444FD5` FOREIGN KEY (`access_url_id`) REFERENCES `access_url` (`id`),
  CONSTRAINT `FK_85574263A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_user`
--

LOCK TABLES `access_url_rel_user` WRITE;
/*!40000 ALTER TABLE `access_url_rel_user` DISABLE KEYS */;
INSERT INTO `access_url_rel_user` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `access_url_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_usergroup`
--

DROP TABLE IF EXISTS `access_url_rel_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_url_id` int(11) NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_usergroup`
--

LOCK TABLES `access_url_rel_usergroup` WRITE;
/*!40000 ALTER TABLE `access_url_rel_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_url_rel_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_rel_group`
--

DROP TABLE IF EXISTS `announcement_rel_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_rel_group` (
  `group_id` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_rel_group`
--

LOCK TABLES `announcement_rel_group` WRITE;
/*!40000 ALTER TABLE `announcement_rel_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_rel_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_sync`
--

DROP TABLE IF EXISTS `branch_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_sync` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `access_url_id` int(11) NOT NULL,
  `unique_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `branch_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch_ip` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,0) DEFAULT NULL,
  `longitude` decimal(10,0) DEFAULT NULL,
  `dwn_speed` int(11) DEFAULT NULL,
  `up_speed` int(11) DEFAULT NULL,
  `delay` int(11) DEFAULT NULL,
  `admin_mail` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_phone` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sync_trans_id` bigint(20) DEFAULT NULL,
  `last_sync_trans_date` datetime DEFAULT NULL,
  `last_sync_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssl_pub_key` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch_type` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `lvl` int(11) DEFAULT NULL,
  `root` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F62F45EDE3C68343` (`unique_id`),
  KEY `IDX_F62F45ED727ACA70` (`parent_id`),
  CONSTRAINT `FK_F62F45ED727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `branch_sync` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_sync`
--

LOCK TABLES `branch_sync` WRITE;
/*!40000 ALTER TABLE `branch_sync` DISABLE KEYS */;
INSERT INTO `branch_sync` VALUES (1,NULL,1,'f4c10e36d95c3c84d4252b5d956a61dcc97dabf5','localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'80421008c62f19cb41a47f7bcb5d94570b77bd31',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `branch_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_transaction`
--

DROP TABLE IF EXISTS `branch_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `transaction_id` bigint(20) NOT NULL,
  `action` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_insert` datetime NOT NULL,
  `time_update` datetime NOT NULL,
  `failed_attempts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FEFBA12B6BF700BD` (`status_id`),
  KEY `IDX_FEFBA12BDCD6CC49` (`branch_id`),
  CONSTRAINT `FK_FEFBA12B6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `branch_transaction_status` (`id`),
  CONSTRAINT `FK_FEFBA12BDCD6CC49` FOREIGN KEY (`branch_id`) REFERENCES `branch_sync` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_transaction`
--

LOCK TABLES `branch_transaction` WRITE;
/*!40000 ALTER TABLE `branch_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_transaction_status`
--

DROP TABLE IF EXISTS `branch_transaction_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_transaction_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_transaction_status`
--

LOCK TABLES `branch_transaction_status` WRITE;
/*!40000 ALTER TABLE `branch_transaction_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_transaction_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_announcement`
--

DROP TABLE IF EXISTS `c_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_announcement` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_announcement`
--

LOCK TABLES `c_announcement` WRITE;
/*!40000 ALTER TABLE `c_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_announcement_attachment`
--

DROP TABLE IF EXISTS `c_announcement_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_announcement_attachment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_announcement_attachment`
--

LOCK TABLES `c_announcement_attachment` WRITE;
/*!40000 ALTER TABLE `c_announcement_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_announcement_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance`
--

DROP TABLE IF EXISTS `c_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `attendance_qualify_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attendance_qualify_max` int(11) NOT NULL,
  `attendance_weight` double NOT NULL,
  `session_id` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance`
--

LOCK TABLES `c_attendance` WRITE;
/*!40000 ALTER TABLE `c_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_calendar`
--

DROP TABLE IF EXISTS `c_attendance_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_calendar` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `done_attendance` tinyint(1) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `attendance_id` (`attendance_id`),
  KEY `done_attendance` (`done_attendance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_calendar`
--

LOCK TABLES `c_attendance_calendar` WRITE;
/*!40000 ALTER TABLE `c_attendance_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_calendar_rel_group`
--

DROP TABLE IF EXISTS `c_attendance_calendar_rel_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_calendar_rel_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `calendar_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_calendar_rel_group`
--

LOCK TABLES `c_attendance_calendar_rel_group` WRITE;
/*!40000 ALTER TABLE `c_attendance_calendar_rel_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_calendar_rel_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_result`
--

DROP TABLE IF EXISTS `c_attendance_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_result` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `attendance_id` (`attendance_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_result`
--

LOCK TABLES `c_attendance_result` WRITE;
/*!40000 ALTER TABLE `c_attendance_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_sheet`
--

DROP TABLE IF EXISTS `c_attendance_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_sheet` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `presence` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attendance_calendar_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `presence` (`presence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_sheet`
--

LOCK TABLES `c_attendance_sheet` WRITE;
/*!40000 ALTER TABLE `c_attendance_sheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_sheet_log`
--

DROP TABLE IF EXISTS `c_attendance_sheet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_sheet_log` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `lastedit_date` datetime NOT NULL,
  `lastedit_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `lastedit_user_id` int(11) NOT NULL,
  `calendar_date_value` datetime DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_sheet_log`
--

LOCK TABLES `c_attendance_sheet_log` WRITE;
/*!40000 ALTER TABLE `c_attendance_sheet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_sheet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog`
--

DROP TABLE IF EXISTS `c_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `blog_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `blog_subtitle` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog`
--

LOCK TABLES `c_blog` WRITE;
/*!40000 ALTER TABLE `c_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_attachment`
--

DROP TABLE IF EXISTS `c_blog_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_attachment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `blog_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_attachment`
--

LOCK TABLES `c_blog_attachment` WRITE;
/*!40000 ALTER TABLE `c_blog_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_comment`
--

DROP TABLE IF EXISTS `c_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_comment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `blog_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `parent_comment_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_comment`
--

LOCK TABLES `c_blog_comment` WRITE;
/*!40000 ALTER TABLE `c_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_post`
--

DROP TABLE IF EXISTS `c_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_post` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `full_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_creation` datetime NOT NULL,
  `author_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_post`
--

LOCK TABLES `c_blog_post` WRITE;
/*!40000 ALTER TABLE `c_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_rating`
--

DROP TABLE IF EXISTS `c_blog_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_rating` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `rating_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `rating_type` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_rating`
--

LOCK TABLES `c_blog_rating` WRITE;
/*!40000 ALTER TABLE `c_blog_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_rel_user`
--

DROP TABLE IF EXISTS `c_blog_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_rel_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_rel_user`
--

LOCK TABLES `c_blog_rel_user` WRITE;
/*!40000 ALTER TABLE `c_blog_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_task`
--

DROP TABLE IF EXISTS `c_blog_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_task` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `system_task` tinyint(1) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_task`
--

LOCK TABLES `c_blog_task` WRITE;
/*!40000 ALTER TABLE `c_blog_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_task_rel_user`
--

DROP TABLE IF EXISTS `c_blog_task_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_task_rel_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `target_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_task_rel_user`
--

LOCK TABLES `c_blog_task_rel_user` WRITE;
/*!40000 ALTER TABLE `c_blog_task_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_task_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_calendar_event`
--

DROP TABLE IF EXISTS `c_calendar_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_calendar_event` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `parent_event_id` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `all_day` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `IDX_A062258154177093` (`room_id`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `FK_A062258154177093` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_calendar_event`
--

LOCK TABLES `c_calendar_event` WRITE;
/*!40000 ALTER TABLE `c_calendar_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_calendar_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_calendar_event_attachment`
--

DROP TABLE IF EXISTS `c_calendar_event_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_calendar_event_attachment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) NOT NULL,
  `agenda_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_calendar_event_attachment`
--

LOCK TABLES `c_calendar_event_attachment` WRITE;
/*!40000 ALTER TABLE `c_calendar_event_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_calendar_event_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_calendar_event_repeat`
--

DROP TABLE IF EXISTS `c_calendar_event_repeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_calendar_event_repeat` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `cal_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `cal_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cal_end` int(11) DEFAULT NULL,
  `cal_frequency` int(11) DEFAULT NULL,
  `cal_days` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_calendar_event_repeat`
--

LOCK TABLES `c_calendar_event_repeat` WRITE;
/*!40000 ALTER TABLE `c_calendar_event_repeat` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_calendar_event_repeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_calendar_event_repeat_not`
--

DROP TABLE IF EXISTS `c_calendar_event_repeat_not`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_calendar_event_repeat_not` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cal_id` int(11) NOT NULL,
  `cal_date` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_calendar_event_repeat_not`
--

LOCK TABLES `c_calendar_event_repeat_not` WRITE;
/*!40000 ALTER TABLE `c_calendar_event_repeat_not` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_calendar_event_repeat_not` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_chat_connected`
--

DROP TABLE IF EXISTS `c_chat_connected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_chat_connected` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `to_group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_connection` datetime NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `char_connected_index` (`user_id`,`session_id`,`to_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_chat_connected`
--

LOCK TABLES `c_chat_connected` WRITE;
/*!40000 ALTER TABLE `c_chat_connected` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_chat_connected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_course_description`
--

DROP TABLE IF EXISTS `c_course_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_course_description` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `description_type` int(11) NOT NULL,
  `progress` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_course_description`
--

LOCK TABLES `c_course_description` WRITE;
/*!40000 ALTER TABLE `c_course_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_course_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_course_setting`
--

DROP TABLE IF EXISTS `c_course_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_course_setting` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `variable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subkey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subkeytext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_course_setting`
--

LOCK TABLES `c_course_setting` WRITE;
/*!40000 ALTER TABLE `c_course_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_course_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_document`
--

DROP TABLE IF EXISTS `c_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_document` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filetype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `readonly` tinyint(1) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_document`
--

LOCK TABLES `c_document` WRITE;
/*!40000 ALTER TABLE `c_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_category`
--

DROP TABLE IF EXISTS `c_dropbox_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `cat_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `received` tinyint(1) NOT NULL,
  `sent` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_category`
--

LOCK TABLES `c_dropbox_category` WRITE;
/*!40000 ALTER TABLE `c_dropbox_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_feedback`
--

DROP TABLE IF EXISTS `c_dropbox_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_feedback` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `feedback_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `author_user_id` int(11) NOT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback_date` datetime NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `file_id` (`file_id`),
  KEY `author_user_id` (`author_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_feedback`
--

LOCK TABLES `c_dropbox_feedback` WRITE;
/*!40000 ALTER TABLE `c_dropbox_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_file`
--

DROP TABLE IF EXISTS `c_dropbox_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_file` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `filename` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `filesize` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_date` datetime NOT NULL,
  `last_upload_date` datetime NOT NULL,
  `cat_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  UNIQUE KEY `UN_filename` (`filename`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_file`
--

LOCK TABLES `c_dropbox_file` WRITE;
/*!40000 ALTER TABLE `c_dropbox_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_person`
--

DROP TABLE IF EXISTS `c_dropbox_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_person` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_person`
--

LOCK TABLES `c_dropbox_person` WRITE;
/*!40000 ALTER TABLE `c_dropbox_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_post`
--

DROP TABLE IF EXISTS `c_dropbox_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_post` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_date` datetime NOT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `dest_user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `dest_user` (`dest_user_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_post`
--

LOCK TABLES `c_dropbox_post` WRITE;
/*!40000 ALTER TABLE `c_dropbox_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_attachment`
--

DROP TABLE IF EXISTS `c_forum_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_attachment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_attachment`
--

LOCK TABLES `c_forum_attachment` WRITE;
/*!40000 ALTER TABLE `c_forum_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_category`
--

DROP TABLE IF EXISTS `c_forum_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cat_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cat_comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_order` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_category`
--

LOCK TABLES `c_forum_category` WRITE;
/*!40000 ALTER TABLE `c_forum_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_forum`
--

DROP TABLE IF EXISTS `c_forum_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_forum` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `forum_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `forum_comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_threads` int(11) DEFAULT NULL,
  `forum_posts` int(11) DEFAULT NULL,
  `forum_last_post` int(11) DEFAULT NULL,
  `forum_category` int(11) DEFAULT NULL,
  `allow_anonymous` int(11) DEFAULT NULL,
  `allow_edit` int(11) DEFAULT NULL,
  `approval_direct_post` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_attachments` int(11) DEFAULT NULL,
  `allow_new_threads` int(11) DEFAULT NULL,
  `default_view` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_of_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_group_public_private` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_order` int(11) DEFAULT NULL,
  `locked` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `forum_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `lp_id` int(10) unsigned NOT NULL,
  `moderated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_forum`
--

LOCK TABLES `c_forum_forum` WRITE;
/*!40000 ALTER TABLE `c_forum_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_mailcue`
--

DROP TABLE IF EXISTS `c_forum_mailcue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_mailcue` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `thread` (`thread_id`),
  KEY `user` (`user_id`),
  KEY `post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_mailcue`
--

LOCK TABLES `c_forum_mailcue` WRITE;
/*!40000 ALTER TABLE `c_forum_mailcue` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_mailcue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_notification`
--

DROP TABLE IF EXISTS `c_forum_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_notification` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `thread` (`thread_id`),
  KEY `post` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_notification`
--

LOCK TABLES `c_forum_notification` WRITE;
/*!40000 ALTER TABLE `c_forum_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_post`
--

DROP TABLE IF EXISTS `c_forum_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_post` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `post_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_text` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `thread_id` int(11) DEFAULT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `poster_id` int(11) DEFAULT NULL,
  `poster_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `post_notification` tinyint(1) DEFAULT NULL,
  `post_parent_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `poster_id` (`poster_id`),
  KEY `forum_id` (`forum_id`),
  KEY `idx_forum_post_thread_id` (`thread_id`),
  KEY `idx_forum_post_visible` (`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_post`
--

LOCK TABLES `c_forum_post` WRITE;
/*!40000 ALTER TABLE `c_forum_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_thread`
--

DROP TABLE IF EXISTS `c_forum_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_thread` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `thread_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `thread_replies` int(10) unsigned NOT NULL DEFAULT 0,
  `thread_poster_id` int(11) DEFAULT NULL,
  `thread_poster_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thread_views` int(10) unsigned NOT NULL DEFAULT 0,
  `thread_last_post` int(11) DEFAULT NULL,
  `thread_date` datetime DEFAULT NULL,
  `thread_sticky` tinyint(1) DEFAULT NULL,
  `locked` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `thread_title_qualify` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thread_qualify_max` double NOT NULL,
  `thread_close_date` datetime DEFAULT NULL,
  `thread_weight` double NOT NULL,
  `thread_peer_qualify` tinyint(1) NOT NULL,
  `lp_item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `idx_forum_thread_forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_thread`
--

LOCK TABLES `c_forum_thread` WRITE;
/*!40000 ALTER TABLE `c_forum_thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_thread_qualify`
--

DROP TABLE IF EXISTS `c_forum_thread_qualify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_thread_qualify` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `qualify` double NOT NULL,
  `qualify_user_id` int(11) DEFAULT NULL,
  `qualify_time` datetime DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user_id` (`user_id`,`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_thread_qualify`
--

LOCK TABLES `c_forum_thread_qualify` WRITE;
/*!40000 ALTER TABLE `c_forum_thread_qualify` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_thread_qualify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_thread_qualify_log`
--

DROP TABLE IF EXISTS `c_forum_thread_qualify_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_thread_qualify_log` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `qualify` double NOT NULL,
  `qualify_user_id` int(11) DEFAULT NULL,
  `qualify_time` datetime DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user_id` (`user_id`,`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_thread_qualify_log`
--

LOCK TABLES `c_forum_thread_qualify_log` WRITE;
/*!40000 ALTER TABLE `c_forum_thread_qualify_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_thread_qualify_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_glossary`
--

DROP TABLE IF EXISTS `c_glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_glossary` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `glossary_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `display_order` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_glossary`
--

LOCK TABLES `c_glossary` WRITE;
/*!40000 ALTER TABLE `c_glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_group_category`
--

DROP TABLE IF EXISTS `c_group_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_group_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `doc_state` tinyint(1) NOT NULL,
  `calendar_state` tinyint(1) NOT NULL,
  `work_state` tinyint(1) NOT NULL,
  `announcements_state` tinyint(1) NOT NULL,
  `forum_state` tinyint(1) NOT NULL,
  `wiki_state` tinyint(1) NOT NULL,
  `chat_state` tinyint(1) NOT NULL,
  `max_student` int(11) NOT NULL,
  `self_reg_allowed` tinyint(1) NOT NULL,
  `self_unreg_allowed` tinyint(1) NOT NULL,
  `groups_per_user` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_group_category`
--

LOCK TABLES `c_group_category` WRITE;
/*!40000 ALTER TABLE `c_group_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_group_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_group_info`
--

DROP TABLE IF EXISTS `c_group_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_group_info` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_student` int(11) NOT NULL,
  `doc_state` tinyint(1) NOT NULL,
  `calendar_state` tinyint(1) NOT NULL,
  `work_state` tinyint(1) NOT NULL,
  `announcements_state` tinyint(1) NOT NULL,
  `forum_state` tinyint(1) NOT NULL,
  `wiki_state` tinyint(1) NOT NULL,
  `chat_state` tinyint(1) NOT NULL,
  `secret_directory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `self_registration_allowed` tinyint(1) NOT NULL,
  `self_unregistration_allowed` tinyint(1) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_group_info`
--

LOCK TABLES `c_group_info` WRITE;
/*!40000 ALTER TABLE `c_group_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_group_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_group_rel_tutor`
--

DROP TABLE IF EXISTS `c_group_rel_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_group_rel_tutor` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_group_rel_tutor`
--

LOCK TABLES `c_group_rel_tutor` WRITE;
/*!40000 ALTER TABLE `c_group_rel_tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_group_rel_tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_group_rel_user`
--

DROP TABLE IF EXISTS `c_group_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_group_rel_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_group_rel_user`
--

LOCK TABLES `c_group_rel_user` WRITE;
/*!40000 ALTER TABLE `c_group_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_group_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_item_property`
--

DROP TABLE IF EXISTS `c_item_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_item_property` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `to_group_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `insert_user_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `tool` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `insert_date` datetime NOT NULL,
  `lastedit_date` datetime NOT NULL,
  `ref` int(11) NOT NULL,
  `lastedit_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lastedit_user_id` int(11) NOT NULL,
  `visibility` int(11) NOT NULL,
  `start_visible` datetime DEFAULT NULL,
  `end_visible` datetime DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `IDX_1D84C18191D79BD3` (`c_id`),
  KEY `IDX_1D84C181330D47E9` (`to_group_id`),
  KEY `IDX_1D84C18129F6EE60` (`to_user_id`),
  KEY `IDX_1D84C1819C859CC3` (`insert_user_id`),
  KEY `IDX_1D84C181613FECDF` (`session_id`),
  KEY `idx_item_property_toolref` (`tool`,`ref`),
  CONSTRAINT `FK_1D84C18129F6EE60` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_1D84C181330D47E9` FOREIGN KEY (`to_group_id`) REFERENCES `c_group_info` (`iid`),
  CONSTRAINT `FK_1D84C181613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_1D84C18191D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_1D84C1819C859CC3` FOREIGN KEY (`insert_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_item_property`
--

LOCK TABLES `c_item_property` WRITE;
/*!40000 ALTER TABLE `c_item_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_item_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_link`
--

DROP TABLE IF EXISTS `c_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_link` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `on_homepage` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_link`
--

LOCK TABLES `c_link` WRITE;
/*!40000 ALTER TABLE `c_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_link_category`
--

DROP TABLE IF EXISTS `c_link_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_link_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `category_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_link_category`
--

LOCK TABLES `c_link_category` WRITE;
/*!40000 ALTER TABLE `c_link_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_link_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp`
--

DROP TABLE IF EXISTS `c_lp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_type` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ref` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` longtext COLLATE utf8_unicode_ci NOT NULL,
  `force_commit` tinyint(1) NOT NULL,
  `default_view_mod` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'embedded',
  `default_encoding` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UTF-8',
  `display_order` int(11) NOT NULL DEFAULT 0,
  `content_maker` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_local` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `content_license` longtext COLLATE utf8_unicode_ci NOT NULL,
  `prevent_reinit` tinyint(1) NOT NULL DEFAULT 1,
  `js_lib` longtext COLLATE utf8_unicode_ci NOT NULL,
  `debug` tinyint(1) NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preview_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  `prerequisite` int(11) NOT NULL,
  `hide_toc_frame` tinyint(1) NOT NULL,
  `seriousgame_mode` tinyint(1) NOT NULL,
  `use_max_score` int(11) NOT NULL DEFAULT 1,
  `autolaunch` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `max_attempts` int(11) NOT NULL,
  `subscribe_users` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `publicated_on` datetime DEFAULT NULL,
  `expired_on` datetime DEFAULT NULL,
  `accumulate_scorm_time` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp`
--

LOCK TABLES `c_lp` WRITE;
/*!40000 ALTER TABLE `c_lp` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_category`
--

DROP TABLE IF EXISTS `c_lp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_category`
--

LOCK TABLES `c_lp_category` WRITE;
/*!40000 ALTER TABLE `c_lp_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_category_user`
--

DROP TABLE IF EXISTS `c_lp_category_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_category_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_61F042712469DE2` (`category_id`),
  KEY `IDX_61F0427A76ED395` (`user_id`),
  CONSTRAINT `FK_61F042712469DE2` FOREIGN KEY (`category_id`) REFERENCES `c_lp_category` (`iid`),
  CONSTRAINT `FK_61F0427A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_category_user`
--

LOCK TABLES `c_lp_category_user` WRITE;
/*!40000 ALTER TABLE `c_lp_category_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_category_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_item`
--

DROP TABLE IF EXISTS `c_lp_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_item` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_id` int(11) NOT NULL,
  `item_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ref` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(511) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(511) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` longtext COLLATE utf8_unicode_ci NOT NULL,
  `min_score` double NOT NULL,
  `max_score` double DEFAULT 100,
  `mastery_score` double DEFAULT NULL,
  `parent_item_id` int(11) NOT NULL,
  `previous_item_id` int(11) NOT NULL,
  `next_item_id` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `prerequisite` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `launch_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `max_time_allowed` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `terms` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_did` int(11) DEFAULT NULL,
  `audio` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prerequisite_min_score` double DEFAULT NULL,
  `prerequisite_max_score` double DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_id` (`lp_id`),
  KEY `idx_c_lp_item_cid_lp_id` (`c_id`,`lp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_item`
--

LOCK TABLES `c_lp_item` WRITE;
/*!40000 ALTER TABLE `c_lp_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_item_view`
--

DROP TABLE IF EXISTS `c_lp_item_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_item_view` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_item_id` int(11) NOT NULL,
  `lp_view_id` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `total_time` int(11) NOT NULL,
  `score` double NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'not attempted',
  `suspend_data` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `lesson_location` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `core_exit` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `max_score` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_item_id` (`lp_item_id`),
  KEY `lp_view_id` (`lp_view_id`),
  KEY `idx_c_lp_item_view_cid_lp_view_id_lp_item_id` (`c_id`,`lp_view_id`,`lp_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_item_view`
--

LOCK TABLES `c_lp_item_view` WRITE;
/*!40000 ALTER TABLE `c_lp_item_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_item_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_iv_interaction`
--

DROP TABLE IF EXISTS `c_lp_iv_interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_iv_interaction` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `lp_iv_id` bigint(20) NOT NULL,
  `interaction_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `interaction_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `weighting` double NOT NULL,
  `completion_time` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `correct_responses` longtext COLLATE utf8_unicode_ci NOT NULL,
  `student_response` longtext COLLATE utf8_unicode_ci NOT NULL,
  `result` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latency` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_iv_id` (`lp_iv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_iv_interaction`
--

LOCK TABLES `c_lp_iv_interaction` WRITE;
/*!40000 ALTER TABLE `c_lp_iv_interaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_iv_interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_iv_objective`
--

DROP TABLE IF EXISTS `c_lp_iv_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_iv_objective` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_iv_id` bigint(20) NOT NULL,
  `order_id` int(11) NOT NULL,
  `objective_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `score_raw` double NOT NULL,
  `score_max` double NOT NULL,
  `score_min` double NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_iv_id` (`lp_iv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_iv_objective`
--

LOCK TABLES `c_lp_iv_objective` WRITE;
/*!40000 ALTER TABLE `c_lp_iv_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_iv_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_view`
--

DROP TABLE IF EXISTS `c_lp_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_view` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `last_item` int(11) NOT NULL,
  `progress` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_id` (`lp_id`),
  KEY `user_id` (`user_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_view`
--

LOCK TABLES `c_lp_view` WRITE;
/*!40000 ALTER TABLE `c_lp_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_notebook`
--

DROP TABLE IF EXISTS `c_notebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_notebook` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `notebook_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_notebook`
--

LOCK TABLES `c_notebook` WRITE;
/*!40000 ALTER TABLE `c_notebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_notebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_online_connected`
--

DROP TABLE IF EXISTS `c_online_connected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_online_connected` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `last_connection` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_online_connected`
--

LOCK TABLES `c_online_connected` WRITE;
/*!40000 ALTER TABLE `c_online_connected` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_online_connected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_online_link`
--

DROP TABLE IF EXISTS `c_online_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_online_link` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_online_link`
--

LOCK TABLES `c_online_link` WRITE;
/*!40000 ALTER TABLE `c_online_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_online_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_permission_group`
--

DROP TABLE IF EXISTS `c_permission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_permission_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `tool` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_permission_group`
--

LOCK TABLES `c_permission_group` WRITE;
/*!40000 ALTER TABLE `c_permission_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_permission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_permission_task`
--

DROP TABLE IF EXISTS `c_permission_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_permission_task` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `tool` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_permission_task`
--

LOCK TABLES `c_permission_task` WRITE;
/*!40000 ALTER TABLE `c_permission_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_permission_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_permission_user`
--

DROP TABLE IF EXISTS `c_permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_permission_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `tool` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_permission_user`
--

LOCK TABLES `c_permission_user` WRITE;
/*!40000 ALTER TABLE `c_permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz`
--

DROP TABLE IF EXISTS `c_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `sound` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `random` int(11) NOT NULL,
  `random_answers` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `results_disabled` int(11) NOT NULL,
  `access_condition` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_attempt` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `feedback_type` int(11) NOT NULL,
  `expired_time` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `propagate_neg` int(11) NOT NULL,
  `save_correct_answers` tinyint(1) NOT NULL,
  `review_answers` int(11) NOT NULL,
  `random_by_category` int(11) NOT NULL,
  `text_when_finished` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_category_name` int(11) NOT NULL,
  `pass_percentage` int(11) DEFAULT NULL,
  `question_selection_type` int(11) DEFAULT NULL,
  `hide_question_title` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz`
--

LOCK TABLES `c_quiz` WRITE;
/*!40000 ALTER TABLE `c_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_answer`
--

DROP TABLE IF EXISTS `c_quiz_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_answer` (
  `iid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_auto` int(10) unsigned NOT NULL,
  `c_id` int(10) unsigned NOT NULL,
  `id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correct` int(11) DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `ponderation` double NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL,
  `hotspot_coordinates` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotspot_type` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destination` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `c_id` (`c_id`),
  KEY `idx_cqa_q` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_answer`
--

LOCK TABLES `c_quiz_answer` WRITE;
/*!40000 ALTER TABLE `c_quiz_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_question`
--

DROP TABLE IF EXISTS `c_quiz_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_question` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `question` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `ponderation` double NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `picture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL,
  `extra` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_question`
--

LOCK TABLES `c_quiz_question` WRITE;
/*!40000 ALTER TABLE `c_quiz_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_question_category`
--

DROP TABLE IF EXISTS `c_quiz_question_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_question_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_question_category`
--

LOCK TABLES `c_quiz_question_category` WRITE;
/*!40000 ALTER TABLE `c_quiz_question_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_question_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_question_option`
--

DROP TABLE IF EXISTS `c_quiz_question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_question_option` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_question_option`
--

LOCK TABLES `c_quiz_question_option` WRITE;
/*!40000 ALTER TABLE `c_quiz_question_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_question_rel_category`
--

DROP TABLE IF EXISTS `c_quiz_question_rel_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_question_rel_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `idx_qqrc_qid` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_question_rel_category`
--

LOCK TABLES `c_quiz_question_rel_category` WRITE;
/*!40000 ALTER TABLE `c_quiz_question_rel_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_question_rel_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_rel_category`
--

DROP TABLE IF EXISTS `c_quiz_rel_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_rel_category` (
  `iid` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `exercise_id` int(11) NOT NULL,
  `count_questions` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_rel_category`
--

LOCK TABLES `c_quiz_rel_category` WRITE;
/*!40000 ALTER TABLE `c_quiz_rel_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_rel_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_rel_question`
--

DROP TABLE IF EXISTS `c_quiz_rel_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_rel_question` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `question_order` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `exercice_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `question` (`question_id`),
  KEY `exercise` (`exercice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_rel_question`
--

LOCK TABLES `c_quiz_rel_question` WRITE;
/*!40000 ALTER TABLE `c_quiz_rel_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_rel_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_resource`
--

DROP TABLE IF EXISTS `c_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_resource` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `source_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `resource_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_resource`
--

LOCK TABLES `c_resource` WRITE;
/*!40000 ALTER TABLE `c_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_role`
--

DROP TABLE IF EXISTS `c_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_role` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `role_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role_comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_role` tinyint(1) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_role`
--

LOCK TABLES `c_role` WRITE;
/*!40000 ALTER TABLE `c_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_role_group`
--

DROP TABLE IF EXISTS `c_role_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_role_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `scope` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_role_group`
--

LOCK TABLES `c_role_group` WRITE;
/*!40000 ALTER TABLE `c_role_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_role_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_role_permissions`
--

DROP TABLE IF EXISTS `c_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_role_permissions` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `default_perm` tinyint(1) NOT NULL,
  `role_id` int(11) NOT NULL,
  `tool` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_role_permissions`
--

LOCK TABLES `c_role_permissions` WRITE;
/*!40000 ALTER TABLE `c_role_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_role_user`
--

DROP TABLE IF EXISTS `c_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_role_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `scope` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_role_user`
--

LOCK TABLES `c_role_user` WRITE;
/*!40000 ALTER TABLE `c_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication`
--

DROP TABLE IF EXISTS `c_student_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_correction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_correction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `post_group_id` int(11) NOT NULL,
  `sent_date` datetime DEFAULT NULL,
  `filetype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `has_properties` int(11) NOT NULL,
  `view_properties` tinyint(1) DEFAULT NULL,
  `qualification` double NOT NULL,
  `date_of_qualification` datetime DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `qualificator_id` int(11) NOT NULL,
  `weight` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `allow_text_assignment` int(11) NOT NULL,
  `contains_file` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`),
  KEY `idx_csp_u` (`user_id`),
  CONSTRAINT `FK_5246F746613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication`
--

LOCK TABLES `c_student_publication` WRITE;
/*!40000 ALTER TABLE `c_student_publication` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_student_publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication_assignment`
--

DROP TABLE IF EXISTS `c_student_publication_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication_assignment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `expires_on` datetime DEFAULT NULL,
  `ends_on` datetime DEFAULT NULL,
  `add_to_calendar` int(11) NOT NULL,
  `enable_qualification` tinyint(1) NOT NULL,
  `publication_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication_assignment`
--

LOCK TABLES `c_student_publication_assignment` WRITE;
/*!40000 ALTER TABLE `c_student_publication_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_student_publication_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication_comment`
--

DROP TABLE IF EXISTS `c_student_publication_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication_comment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `work_id` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `sent_at` datetime NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `work` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication_comment`
--

LOCK TABLES `c_student_publication_comment` WRITE;
/*!40000 ALTER TABLE `c_student_publication_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_student_publication_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication_rel_document`
--

DROP TABLE IF EXISTS `c_student_publication_rel_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication_rel_document` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `work_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `work` (`work_id`),
  KEY `document` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication_rel_document`
--

LOCK TABLES `c_student_publication_rel_document` WRITE;
/*!40000 ALTER TABLE `c_student_publication_rel_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_student_publication_rel_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication_rel_user`
--

DROP TABLE IF EXISTS `c_student_publication_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication_rel_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `work_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `work` (`work_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication_rel_user`
--

LOCK TABLES `c_student_publication_rel_user` WRITE;
/*!40000 ALTER TABLE `c_student_publication_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_student_publication_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey`
--

DROP TABLE IF EXISTS `c_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtitle` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avail_from` date DEFAULT NULL,
  `avail_till` date DEFAULT NULL,
  `is_shared` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `surveythanks` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `invited` int(11) NOT NULL,
  `answered` int(11) NOT NULL,
  `invite_mail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reminder_mail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `mail_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anonymous` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `access_condition` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `shuffle` tinyint(1) NOT NULL,
  `one_question_per_page` tinyint(1) NOT NULL,
  `survey_version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `survey_type` int(11) NOT NULL,
  `show_form_profile` int(11) NOT NULL,
  `form_fields` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  `visible_results` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey`
--

LOCK TABLES `c_survey` WRITE;
/*!40000 ALTER TABLE `c_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_answer`
--

DROP TABLE IF EXISTS `c_survey_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_answer` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `user` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_answer`
--

LOCK TABLES `c_survey_answer` WRITE;
/*!40000 ALTER TABLE `c_survey_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_group`
--

DROP TABLE IF EXISTS `c_survey_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `survey_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_group`
--

LOCK TABLES `c_survey_group` WRITE;
/*!40000 ALTER TABLE `c_survey_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_invitation`
--

DROP TABLE IF EXISTS `c_survey_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_invitation` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `survey_invitation_id` int(11) NOT NULL,
  `survey_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `invitation_code` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `invitation_date` datetime NOT NULL,
  `reminder_date` datetime NOT NULL,
  `answered` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_invitation`
--

LOCK TABLES `c_survey_invitation` WRITE;
/*!40000 ALTER TABLE `c_survey_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_question`
--

DROP TABLE IF EXISTS `c_survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_question` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `survey_question` longtext COLLATE utf8_unicode_ci NOT NULL,
  `survey_question_comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `display` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `shared_question_id` int(11) DEFAULT NULL,
  `max_value` int(11) DEFAULT NULL,
  `survey_group_pri` int(11) NOT NULL,
  `survey_group_sec1` int(11) NOT NULL,
  `survey_group_sec2` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_question`
--

LOCK TABLES `c_survey_question` WRITE;
/*!40000 ALTER TABLE `c_survey_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_question_option`
--

DROP TABLE IF EXISTS `c_survey_question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_question_option` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `question_option_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `option_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_question_option`
--

LOCK TABLES `c_survey_question_option` WRITE;
/*!40000 ALTER TABLE `c_survey_question_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_thematic`
--

DROP TABLE IF EXISTS `c_thematic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_thematic` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `active` (`active`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_thematic`
--

LOCK TABLES `c_thematic` WRITE;
/*!40000 ALTER TABLE `c_thematic` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_thematic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_thematic_advance`
--

DROP TABLE IF EXISTS `c_thematic_advance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_thematic_advance` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `thematic_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `done_advance` tinyint(1) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `IDX_62798E9754177093` (`room_id`),
  KEY `course` (`c_id`),
  KEY `thematic_id` (`thematic_id`),
  CONSTRAINT `FK_62798E9754177093` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_thematic_advance`
--

LOCK TABLES `c_thematic_advance` WRITE;
/*!40000 ALTER TABLE `c_thematic_advance` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_thematic_advance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_thematic_plan`
--

DROP TABLE IF EXISTS `c_thematic_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_thematic_plan` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `thematic_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_type` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `thematic_id` (`thematic_id`,`description_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_thematic_plan`
--

LOCK TABLES `c_thematic_plan` WRITE;
/*!40000 ALTER TABLE `c_thematic_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_thematic_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_tool`
--

DROP TABLE IF EXISTS `c_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_tool` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added_tool` tinyint(1) DEFAULT NULL,
  `target` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'authoring',
  `session_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_tool`
--

LOCK TABLES `c_tool` WRITE;
/*!40000 ALTER TABLE `c_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_tool_intro`
--

DROP TABLE IF EXISTS `c_tool_intro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_tool_intro` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_tool_intro`
--

LOCK TABLES `c_tool_intro` WRITE;
/*!40000 ALTER TABLE `c_tool_intro` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_tool_intro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_userinfo_content`
--

DROP TABLE IF EXISTS `c_userinfo_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_userinfo_content` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `definition_id` int(11) NOT NULL,
  `editor_ip` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `edition_time` datetime DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_userinfo_content`
--

LOCK TABLES `c_userinfo_content` WRITE;
/*!40000 ALTER TABLE `c_userinfo_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_userinfo_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_userinfo_def`
--

DROP TABLE IF EXISTS `c_userinfo_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_userinfo_def` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `line_count` tinyint(1) NOT NULL,
  `rank` tinyint(1) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_userinfo_def`
--

LOCK TABLES `c_userinfo_def` WRITE;
/*!40000 ALTER TABLE `c_userinfo_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_userinfo_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_wiki`
--

DROP TABLE IF EXISTS `c_wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_wiki` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `reflink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `dtime` datetime DEFAULT NULL,
  `addlock` int(11) NOT NULL,
  `editlock` int(11) NOT NULL,
  `visibility` int(11) NOT NULL,
  `addlock_disc` int(11) NOT NULL,
  `visibility_disc` int(11) NOT NULL,
  `ratinglock_disc` int(11) NOT NULL,
  `assignment` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `progress` longtext COLLATE utf8_unicode_ci NOT NULL,
  `score` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `is_editing` int(11) NOT NULL,
  `time_edit` datetime DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `linksto` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tag` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `reflink` (`reflink`),
  KEY `group_id` (`group_id`),
  KEY `page_id` (`page_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_wiki`
--

LOCK TABLES `c_wiki` WRITE;
/*!40000 ALTER TABLE `c_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_wiki_conf`
--

DROP TABLE IF EXISTS `c_wiki_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_wiki_conf` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `task` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback2` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback3` longtext COLLATE utf8_unicode_ci NOT NULL,
  `fprogress1` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `fprogress2` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `fprogress3` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `max_size` int(11) DEFAULT NULL,
  `max_text` int(11) DEFAULT NULL,
  `max_version` int(11) DEFAULT NULL,
  `startdate_assig` datetime DEFAULT NULL,
  `enddate_assig` datetime DEFAULT NULL,
  `delayedsubmit` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_wiki_conf`
--

LOCK TABLES `c_wiki_conf` WRITE;
/*!40000 ALTER TABLE `c_wiki_conf` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_wiki_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_wiki_discuss`
--

DROP TABLE IF EXISTS `c_wiki_discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_wiki_discuss` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `publication_id` int(11) NOT NULL,
  `userc_id` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `p_score` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dtime` datetime NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_wiki_discuss`
--

LOCK TABLES `c_wiki_discuss` WRITE;
/*!40000 ALTER TABLE `c_wiki_discuss` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_wiki_discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_wiki_mailcue`
--

DROP TABLE IF EXISTS `c_wiki_mailcue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_wiki_mailcue` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `c_id` (`c_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_wiki_mailcue`
--

LOCK TABLES `c_wiki_mailcue` WRITE;
/*!40000 ALTER TABLE `c_wiki_mailcue` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_wiki_mailcue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `career`
--

DROP TABLE IF EXISTS `career`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `career` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `career`
--

LOCK TABLES `career` WRITE;
/*!40000 ALTER TABLE `career` DISABLE KEYS */;
/*!40000 ALTER TABLE `career` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sent` datetime NOT NULL,
  `recd` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_chat_to_user` (`to_user`),
  KEY `idx_chat_from_user` (`from_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_video`
--

DROP TABLE IF EXISTS `chat_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) NOT NULL,
  `to_user` int(11) NOT NULL,
  `room_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_chat_video_to_user` (`to_user`),
  KEY `idx_chat_video_from_user` (`from_user`),
  KEY `idx_chat_video_users` (`from_user`,`to_user`),
  KEY `idx_chat_video_room_name` (`room_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_video`
--

LOCK TABLES `chat_video` WRITE;
/*!40000 ALTER TABLE `chat_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_item`
--

DROP TABLE IF EXISTS `class_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_item`
--

LOCK TABLES `class_item` WRITE;
/*!40000 ALTER TABLE `class_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_user`
--

DROP TABLE IF EXISTS `class_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_user` (
  `class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`class_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_user`
--

LOCK TABLES `class_user` WRITE;
/*!40000 ALTER TABLE `class_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `directory` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_language` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility` int(11) DEFAULT NULL,
  `show_score` int(11) DEFAULT NULL,
  `tutor_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visual_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_url` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disk_quota` bigint(20) DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `last_edit` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `subscribe` tinyint(1) DEFAULT NULL,
  `unsubscribe` tinyint(1) DEFAULT NULL,
  `registration_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `legal` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `activate_legal` int(11) DEFAULT NULL,
  `add_teachers_to_sessions_courses` tinyint(1) DEFAULT NULL,
  `course_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_169E6FB977153098` (`code`),
  KEY `IDX_169E6FB954177093` (`room_id`),
  KEY `category_code` (`category_code`),
  KEY `directory` (`directory`),
  CONSTRAINT `FK_169E6FB954177093` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_category`
--

DROP TABLE IF EXISTS `course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tree_pos` int(11) DEFAULT NULL,
  `children_count` smallint(6) DEFAULT NULL,
  `auth_course_child` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_cat_child` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parent_id` (`parent_id`),
  KEY `tree_pos` (`tree_pos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_category`
--

LOCK TABLES `course_category` WRITE;
/*!40000 ALTER TABLE `course_category` DISABLE KEYS */;
INSERT INTO `course_category` VALUES (1,'Language skills','LANG',NULL,1,0,'TRUE','TRUE'),(2,'PC Skills','PC',NULL,2,0,'TRUE','TRUE'),(3,'Projects','PROJ',NULL,3,0,'TRUE','TRUE');
/*!40000 ALTER TABLE `course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_module`
--

DROP TABLE IF EXISTS `course_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `row` int(11) NOT NULL,
  `column` int(11) NOT NULL,
  `position` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_module`
--

LOCK TABLES `course_module` WRITE;
/*!40000 ALTER TABLE `course_module` DISABLE KEYS */;
INSERT INTO `course_module` VALUES (1,'calendar_event','calendar/agenda.php','agenda.gif',1,1,'basic'),(2,'link','link/link.php','links.gif',4,1,'basic'),(3,'document','document/document.php','documents.gif',3,1,'basic'),(4,'student_publication','work/work.php','works.gif',3,2,'basic'),(5,'announcement','announcements/announcements.php','valves.gif',2,1,'basic'),(6,'user','user/user.php','members.gif',2,3,'basic'),(7,'forum','forum/index.php','forum.gif',1,2,'basic'),(8,'quiz','exercice/exercice.php','quiz.gif',2,2,'basic'),(9,'group','group/group.php','group.gif',3,3,'basic'),(10,'course_description','course_description/','info.gif',1,3,'basic'),(11,'chat','chat/chat.php','chat.gif',0,0,'external'),(12,'dropbox','dropbox/index.php','dropbox.gif',4,2,'basic'),(13,'tracking','tracking/courseLog.php','statistics.gif',1,3,'courseadmin'),(14,'homepage_link','link/link.php?action=addlink','npage.gif',1,1,'courseadmin'),(15,'course_setting','course_info/infocours.php','reference.gif',1,1,'courseadmin'),(16,'External','','external.gif',0,0,'external'),(17,'AddedLearnpath','','scormbuilder.gif',0,0,'external'),(18,'learnpath','lp/lp_controller.php','scorms.gif',5,1,'basic'),(19,'blog','blog/blog.php','blog.gif',1,2,'basic'),(20,'blog_management','blog/blog_admin.php','blog_admin.gif',1,2,'courseadmin'),(21,'course_maintenance','course_info/maintenance.php','backup.gif',2,3,'courseadmin'),(22,'survey','survey/survey_list.php','survey.gif',2,1,'basic'),(23,'wiki','wiki/index.php','wiki.gif',2,3,'basic'),(24,'gradebook','gradebook/index.php','gradebook.gif',2,2,'basic'),(25,'glossary','glossary/index.php','glossary.gif',2,1,'basic'),(26,'notebook','notebook/index.php','notebook.gif',2,1,'basic'),(27,'attendance','attendance/index.php','attendance.gif',2,1,'basic'),(28,'course_progress','course_progress/index.php','course_progress.gif',2,1,'basic');
/*!40000 ALTER TABLE `course_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_rel_class`
--

DROP TABLE IF EXISTS `course_rel_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_rel_class` (
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`course_code`,`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_rel_class`
--

LOCK TABLES `course_rel_class` WRITE;
/*!40000 ALTER TABLE `course_rel_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_rel_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_rel_user`
--

DROP TABLE IF EXISTS `course_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `relation_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_tutor` tinyint(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `user_course_cat` int(11) DEFAULT NULL,
  `legal_agreement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_92CFD9FEA76ED395` (`user_id`),
  KEY `IDX_92CFD9FE91D79BD3` (`c_id`),
  CONSTRAINT `FK_92CFD9FE91D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_92CFD9FEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_rel_user`
--

LOCK TABLES `course_rel_user` WRITE;
/*!40000 ALTER TABLE `course_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_rel_user_catalogue`
--

DROP TABLE IF EXISTS `course_rel_user_catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_rel_user_catalogue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `visible` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_79CA412EA76ED395` (`user_id`),
  KEY `IDX_79CA412E91D79BD3` (`c_id`),
  CONSTRAINT `FK_79CA412E91D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_79CA412EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_rel_user_catalogue`
--

LOCK TABLES `course_rel_user_catalogue` WRITE;
/*!40000 ALTER TABLE `course_rel_user_catalogue` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_rel_user_catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_request`
--

DROP TABLE IF EXISTS `course_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `directory` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_language` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tutor_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visual_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_date` datetime NOT NULL,
  `objetives` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_audience` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `info` int(11) NOT NULL,
  `exemplary_content` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_request`
--

LOCK TABLES `course_request` WRITE;
/*!40000 ALTER TABLE `course_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_type`
--

DROP TABLE IF EXISTS `course_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `translation_var` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `props` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_type`
--

LOCK TABLES `course_type` WRITE;
/*!40000 ALTER TABLE `course_type` DISABLE KEYS */;
INSERT INTO `course_type` VALUES (1,'All tools',NULL,NULL,NULL),(2,'Entry exam',NULL,NULL,NULL);
/*!40000 ALTER TABLE `course_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_email_template`
--

DROP TABLE IF EXISTS `event_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_type_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_name_index` (`event_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_email_template`
--

LOCK TABLES `event_email_template` WRITE;
/*!40000 ALTER TABLE `event_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_sent`
--

DROP TABLE IF EXISTS `event_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) DEFAULT NULL,
  `event_type_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_name_index` (`event_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_sent`
--

LOCK TABLES `event_sent` WRITE;
/*!40000 ALTER TABLE `event_sent` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_sent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field`
--

DROP TABLE IF EXISTS `extra_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `extra_field_type` int(11) NOT NULL,
  `field_type` int(11) NOT NULL,
  `variable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_order` int(11) DEFAULT NULL,
  `visible_to_self` tinyint(1) DEFAULT NULL,
  `visible_to_others` tinyint(1) DEFAULT NULL,
  `changeable` tinyint(1) DEFAULT NULL,
  `filter` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field`
--

LOCK TABLES `extra_field` WRITE;
/*!40000 ALTER TABLE `extra_field` DISABLE KEYS */;
INSERT INTO `extra_field` VALUES (1,1,1,'legal_accept','Legal',NULL,NULL,0,NULL,0,NULL,'2021-06-20 22:09:35'),(2,1,1,'already_logged_in','Already logged in',NULL,NULL,0,NULL,0,NULL,'2021-06-20 22:09:35'),(3,1,1,'update_type','Update script type',NULL,NULL,0,NULL,0,NULL,'2021-06-20 22:09:35'),(4,1,10,'tags','tags',NULL,NULL,0,NULL,0,NULL,'2021-06-20 22:09:35'),(5,1,1,'rssfeeds','RSS',NULL,NULL,0,NULL,0,NULL,'2021-06-20 22:09:35'),(6,1,1,'dashboard','Dashboard',NULL,NULL,0,NULL,0,NULL,'2021-06-20 22:09:35'),(7,1,11,'timezone','Timezone',NULL,NULL,0,NULL,0,NULL,'2021-06-20 22:09:35'),(8,1,4,'mail_notify_invitation','MailNotifyInvitation','1',NULL,0,NULL,1,NULL,'2021-06-20 22:09:35'),(9,1,4,'mail_notify_message','MailNotifyMessage','1',NULL,0,NULL,1,NULL,'2021-06-20 22:09:35'),(10,1,4,'mail_notify_group_message','MailNotifyGroupMessage','1',NULL,0,NULL,1,NULL,'2021-06-20 22:09:35'),(11,1,1,'user_chat_status','User chat status',NULL,NULL,0,NULL,0,NULL,'2021-06-20 22:09:35'),(12,1,1,'google_calendar_url','Google Calendar URL',NULL,NULL,0,NULL,0,NULL,'2021-06-20 22:09:35'),(13,2,13,'special_course','Special course','',NULL,1,NULL,1,NULL,'2021-06-20 22:09:35'),(14,2,10,'tags','Tags',NULL,NULL,1,NULL,1,NULL,'2021-06-20 22:09:35'),(15,2,19,'video_url','VideoUrl',NULL,NULL,1,NULL,1,NULL,'2021-06-20 22:09:35'),(16,3,16,'image','Image',NULL,NULL,1,NULL,1,NULL,'2021-06-20 22:09:35'),(17,1,1,'captcha_blocked_until_date','Account locked until',NULL,NULL,0,NULL,0,NULL,'2021-06-20 22:09:35'),(18,1,1,'skype','Skype',NULL,NULL,1,NULL,1,NULL,'2021-06-20 22:09:35'),(19,1,1,'linkedin_url','LinkedInUrl',NULL,NULL,1,NULL,1,NULL,'2021-06-20 22:09:35'),(20,8,10,'tags','Tags',NULL,NULL,1,NULL,1,NULL,'2021-06-20 22:09:35');
/*!40000 ALTER TABLE `extra_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_option_rel_field_option`
--

DROP TABLE IF EXISTS `extra_field_option_rel_field_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_option_rel_field_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_option_id` int(11) DEFAULT NULL,
  `related_field_option_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx` (`field_id`,`role_id`,`field_option_id`,`related_field_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_option_rel_field_option`
--

LOCK TABLES `extra_field_option_rel_field_option` WRITE;
/*!40000 ALTER TABLE `extra_field_option_rel_field_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_field_option_rel_field_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_options`
--

DROP TABLE IF EXISTS `extra_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `option_value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A572E3AE443707B0` (`field_id`),
  CONSTRAINT `FK_A572E3AE443707B0` FOREIGN KEY (`field_id`) REFERENCES `extra_field` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_options`
--

LOCK TABLES `extra_field_options` WRITE;
/*!40000 ALTER TABLE `extra_field_options` DISABLE KEYS */;
INSERT INTO `extra_field_options` VALUES (1,8,'1','AtOnce',NULL,NULL,1),(2,8,'8','Daily',NULL,NULL,2),(3,8,'0','No',NULL,NULL,3),(4,9,'1','AtOnce',NULL,NULL,1),(5,9,'8','Daily',NULL,NULL,2),(6,9,'0','No',NULL,NULL,3),(7,10,'1','AtOnce',NULL,NULL,1),(8,10,'8','Daily',NULL,NULL,2),(9,10,'0','No',NULL,NULL,3);
/*!40000 ALTER TABLE `extra_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_rel_tag`
--

DROP TABLE IF EXISTS `extra_field_rel_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_rel_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field` (`field_id`),
  KEY `item` (`item_id`),
  KEY `tag` (`tag_id`),
  KEY `field_item_tag` (`field_id`,`item_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_rel_tag`
--

LOCK TABLES `extra_field_rel_tag` WRITE;
/*!40000 ALTER TABLE `extra_field_rel_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_field_rel_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_saved_search`
--

DROP TABLE IF EXISTS `extra_field_saved_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_saved_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_16ABE32A443707B0` (`field_id`),
  KEY `IDX_16ABE32AA76ED395` (`user_id`),
  CONSTRAINT `FK_16ABE32A443707B0` FOREIGN KEY (`field_id`) REFERENCES `extra_field` (`id`),
  CONSTRAINT `FK_16ABE32AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_saved_search`
--

LOCK TABLES `extra_field_saved_search` WRITE;
/*!40000 ALTER TABLE `extra_field_saved_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_field_saved_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_values`
--

DROP TABLE IF EXISTS `extra_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_171DF924443707B0` (`field_id`),
  KEY `idx_efv_fiii` (`field_id`,`item_id`),
  CONSTRAINT `FK_171DF924443707B0` FOREIGN KEY (`field_id`) REFERENCES `extra_field` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_values`
--

LOCK TABLES `extra_field_values` WRITE;
/*!40000 ALTER TABLE `extra_field_values` DISABLE KEYS */;
INSERT INTO `extra_field_values` VALUES (1,18,'',1,'2021-06-20 19:09:35','2021-06-20 19:09:35',NULL),(2,19,'',1,'2021-06-20 19:09:35','2021-06-20 19:09:35',NULL),(3,2,'false',1,'2021-06-20 19:09:35','2021-06-20 19:09:35',NULL),(4,18,'',2,'2021-06-20 19:09:35','2021-06-20 19:09:35',NULL),(5,19,'',2,'2021-06-20 19:09:35','2021-06-20 19:09:35',NULL),(6,2,'false',2,'2021-06-20 19:09:35','2021-06-20 19:09:35',NULL);
/*!40000 ALTER TABLE `extra_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_group`
--

DROP TABLE IF EXISTS `fos_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4B019DDB77153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_group`
--

LOCK TABLES `fos_group` WRITE;
/*!40000 ALTER TABLE `fos_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `fos_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user_user_group`
--

DROP TABLE IF EXISTS `fos_user_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_B3C77447A76ED395` (`user_id`),
  KEY `IDX_B3C77447FE54D947` (`group_id`),
  CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user_user_group`
--

LOCK TABLES `fos_user_user_group` WRITE;
/*!40000 ALTER TABLE `fos_user_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `fos_user_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_components`
--

DROP TABLE IF EXISTS `grade_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `percentage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `acronym` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `grade_model_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_components`
--

LOCK TABLES `grade_components` WRITE;
/*!40000 ALTER TABLE `grade_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_model`
--

DROP TABLE IF EXISTS `grade_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_lowest_eval_exclude` tinyint(1) DEFAULT NULL,
  `default_external_eval` tinyint(1) DEFAULT NULL,
  `default_external_eval_prefix` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_model`
--

LOCK TABLES `grade_model` WRITE;
/*!40000 ALTER TABLE `grade_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_category`
--

DROP TABLE IF EXISTS `gradebook_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `weight` double NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `certif_min_score` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `locked` int(11) NOT NULL,
  `default_lowest_eval_exclude` tinyint(1) DEFAULT NULL,
  `generate_certificates` tinyint(1) NOT NULL,
  `grade_model_id` int(11) DEFAULT NULL,
  `is_requirement` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_category`
--

LOCK TABLES `gradebook_category` WRITE;
/*!40000 ALTER TABLE `gradebook_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_certificate`
--

DROP TABLE IF EXISTS `gradebook_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_certificate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score_certificate` double NOT NULL,
  `created_at` datetime NOT NULL,
  `path_certificate` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gradebook_certificate_category_id` (`cat_id`),
  KEY `idx_gradebook_certificate_user_id` (`user_id`),
  KEY `idx_gradebook_certificate_category_id_user_id` (`cat_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_certificate`
--

LOCK TABLES `gradebook_certificate` WRITE;
/*!40000 ALTER TABLE `gradebook_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_evaluation`
--

DROP TABLE IF EXISTS `gradebook_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `weight` double NOT NULL,
  `max` double NOT NULL,
  `visible` int(11) NOT NULL,
  `type` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `locked` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_evaluation`
--

LOCK TABLES `gradebook_evaluation` WRITE;
/*!40000 ALTER TABLE `gradebook_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_link`
--

DROP TABLE IF EXISTS `gradebook_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `weight` double NOT NULL,
  `visible` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_link`
--

LOCK TABLES `gradebook_link` WRITE;
/*!40000 ALTER TABLE `gradebook_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_linkeval_log`
--

DROP TABLE IF EXISTS `gradebook_linkeval_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_linkeval_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_linkeval_log` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `weight` smallint(6) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_id_log` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_linkeval_log`
--

LOCK TABLES `gradebook_linkeval_log` WRITE;
/*!40000 ALTER TABLE `gradebook_linkeval_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_linkeval_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_result`
--

DROP TABLE IF EXISTS `gradebook_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_result`
--

LOCK TABLES `gradebook_result` WRITE;
/*!40000 ALTER TABLE `gradebook_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_result_log`
--

DROP TABLE IF EXISTS `gradebook_result_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_result_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_result` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_result_log`
--

LOCK TABLES `gradebook_result_log` WRITE;
/*!40000 ALTER TABLE `gradebook_result_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_result_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_score_display`
--

DROP TABLE IF EXISTS `gradebook_score_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_score_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` double NOT NULL,
  `display` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `score_color_percent` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_score_display`
--

LOCK TABLES `gradebook_score_display` WRITE;
/*!40000 ALTER TABLE `gradebook_score_display` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_score_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_score_log`
--

DROP TABLE IF EXISTS `gradebook_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` double NOT NULL,
  `registered_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gradebook_score_log_user` (`user_id`),
  KEY `idx_gradebook_score_log_user_category` (`user_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_score_log`
--

LOCK TABLES `gradebook_score_log` WRITE;
/*!40000 ALTER TABLE `gradebook_score_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hook_call`
--

DROP TABLE IF EXISTS `hook_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hook_call` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hook_event_id` int(11) NOT NULL,
  `hook_observer_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `hook_order` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hook_call`
--

LOCK TABLES `hook_call` WRITE;
/*!40000 ALTER TABLE `hook_call` DISABLE KEYS */;
/*!40000 ALTER TABLE `hook_call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hook_event`
--

DROP TABLE IF EXISTS `hook_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hook_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hook_event`
--

LOCK TABLES `hook_event` WRITE;
/*!40000 ALTER TABLE `hook_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `hook_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hook_observer`
--

DROP TABLE IF EXISTS `hook_observer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hook_observer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hook_observer`
--

LOCK TABLES `hook_observer` WRITE;
/*!40000 ALTER TABLE `hook_observer` DISABLE KEYS */;
/*!40000 ALTER TABLE `hook_observer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `original_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `english_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isocode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dokeos_folder` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D4DB71B5727ACA70` (`parent_id`),
  KEY `idx_language_dokeos_folder` (`dokeos_folder`),
  CONSTRAINT `FK_D4DB71B5727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,NULL,'&#1575;&#1604;&#1593;&#1585;&#1576;&#1610;&#1577;','arabic','ar','arabic',0),(2,49,'Asturianu','asturian','ast','asturian',0),(3,NULL,'Euskara','basque','eu','basque',1),(4,NULL,'&#2476;&#2494;&#2434;&#2482;&#2494;','bengali','bn','bengali',0),(5,NULL,'Bosanski','bosnian','bs','bosnian',1),(6,40,'Portugu&ecirc;s do Brasil','brazilian','pt-BR','brazilian',1),(7,NULL,'&#1041;&#1098;&#1083;&#1075;&#1072;&#1088;&#1089;&#1082;&#1080;','bulgarian','bg','bulgarian',1),(8,49,'Catal&agrave;','catalan','ca','catalan',0),(9,NULL,'Hrvatski','croatian','hr','croatian',0),(10,NULL,'&#268;esky','czech','cs','czech',0),(11,NULL,'Dansk','danish','da','danish',0),(12,NULL,'&#1583;&#1585;&#1740;','dari','prs','dari',0),(13,NULL,'Nederlands','dutch','nl','dutch',1),(14,NULL,'English','english','en','english',1),(15,49,'Esperanto','esperanto','eo','esperanto',0),(16,NULL,'Føroyskt','faroese','fo','faroese',0),(17,NULL,'Suomi','finnish','fi','finnish',0),(18,NULL,'Fran&ccedil;ais','french','fr','french',1),(19,28,'Furlan','friulian','fur','friulian',0),(20,49,'Galego','galician','gl','galician',1),(21,NULL,'&#4325;&#4304;&#4320;&#4311;&#4323;&#4314;&#4312;','georgian','ka','georgian',0),(22,NULL,'Deutsch','german','de','german',1),(23,NULL,'&Epsilon;&lambda;&lambda;&eta;&nu;&iota;&kappa;&#940;','greek','el','greek',1),(24,NULL,'&#1506;&#1489;&#1512;&#1497;&#1514;','hebrew','he','hebrew',0),(25,NULL,'&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;','hindi','hi','hindi',0),(26,NULL,'Magyar','hungarian','hu','hungarian',1),(27,NULL,'Bahasa Indonesia','indonesian','id','indonesian',1),(28,NULL,'Italiano','italian','it','italian',1),(29,NULL,'&#26085;&#26412;&#35486;','japanese','ja','japanese',0),(30,NULL,'&#54620;&#44397;&#50612;','korean','ko','korean',0),(31,NULL,'Latvie&scaron;u','latvian','lv','latvian',1),(32,NULL,'Lietuvi&#371;','lithuanian','lt','lithuanian',0),(33,NULL,'&#1052;&#1072;&#1082;&#1077;&#1076;&#1086;&#1085;&#1089;&#1082;&#1080;','macedonian','mk','macedonian',0),(34,NULL,'Bahasa Melayu','malay','ms','malay',0),(35,NULL,'Norsk','norwegian','no','norwegian',0),(36,18,'Occitan','occitan','oc','occitan',0),(37,NULL,'&#1662;&#1690;&#1578;&#1608;','pashto','ps','pashto',0),(38,NULL,'&#1601;&#1575;&#1585;&#1587;&#1740;','persian','fa','persian',0),(39,NULL,'Polski','polish','pl','polish',1),(40,NULL,'Portugu&ecirc;s europeu','portuguese','pt','portuguese',1),(41,49,'Runasimi','quechua_cusco','qu','quechua_cusco',0),(42,NULL,'Rom&acirc;n&#259;','romanian','ro','romanian',0),(43,NULL,'&#1056;&#1091;&#1089;&#1089;&#1082;&#1080;&#1081;','russian','ru','russian',0),(44,NULL,'Srpski','serbian','sr','serbian',0),(45,NULL,'&#20013;&#25991;&#65288;&#31616;&#20307;&#65289;','simpl_chinese','zh','simpl_chinese',0),(46,NULL,'Sloven&#269;ina','slovak','sk','slovak',1),(47,NULL,'Sloven&scaron;&#269;ina','slovenian','sl','slovenian',1),(48,NULL,'&#1575;&#1604;&#1589;&#1608;&#1605;&#1575;&#1604;&#1610;&#1577;','somali','so','somali',0),(49,NULL,'Espa&ntilde;ol','spanish','es','spanish',1),(50,NULL,'Kiswahili','swahili','sw','swahili',0),(51,NULL,'Svenska','swedish','sv','swedish',0),(52,NULL,'Tagalog','tagalog','tl','tagalog',1),(53,NULL,'&#3652;&#3607;&#3618;','thai','th','thai',0),(54,NULL,'Tibetan','tibetan','bo','tibetan',0),(55,45,'&#32321;&#39636;&#20013;&#25991;','trad_chinese','zh-TW','trad_chinese',0),(56,NULL,'T&uuml;rk&ccedil;e','turkish','tr','turkish',0),(57,NULL,'&#1059;&#1082;&#1088;&#1072;&#1111;&#1085;&#1089;&#1100;&#1082;&#1072;','ukrainian','uk','ukrainian',0),(58,NULL,'Ti&#7871;ng Vi&#7879;t','vietnamese','vi','vietnamese',0),(59,NULL,'isiXhosa','xhosa','xh','xhosa',0),(60,NULL,'Yor&ugrave;b&aacute;','yoruba','yo','yoruba',0);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal`
--

DROP TABLE IF EXISTS `legal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL,
  `changes` longtext COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal`
--

LOCK TABLES `legal` WRITE;
/*!40000 ALTER TABLE `legal` DISABLE KEYS */;
/*!40000 ALTER TABLE `legal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_sender_id` int(11) NOT NULL,
  `user_receiver_id` int(11) NOT NULL,
  `msg_status` tinyint(1) NOT NULL,
  `send_date` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_message_user_sender` (`user_sender_id`),
  KEY `idx_message_user_receiver` (`user_receiver_id`),
  KEY `idx_message_user_sender_user_receiver` (`user_sender_id`,`user_receiver_id`),
  KEY `idx_message_user_receiver_status` (`user_receiver_id`,`msg_status`),
  KEY `idx_message_group` (`group_id`),
  KEY `idx_message_parent` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_attachment`
--

DROP TABLE IF EXISTS `message_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_attachment`
--

LOCK TABLES `message_attachment` WRITE;
/*!40000 ALTER TABLE `message_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dest_user_id` int(11) NOT NULL,
  `dest_mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_freq` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_notify_sent_index` (`sent_at`),
  KEY `mail_notify_freq_index` (`sent_at`,`send_freq`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openid_association`
--

DROP TABLE IF EXISTS `openid_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openid_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idp_endpoint_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `assoc_handle` longtext COLLATE utf8_unicode_ci NOT NULL,
  `assoc_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expires_in` bigint(20) NOT NULL,
  `mac_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openid_association`
--

LOCK TABLES `openid_association` WRITE;
/*!40000 ALTER TABLE `openid_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `openid_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_agenda`
--

DROP TABLE IF EXISTS `personal_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_agenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `course` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_event_id` int(11) DEFAULT NULL,
  `all_day` int(11) NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_personal_agenda_user` (`user`),
  KEY `idx_personal_agenda_parent` (`parent_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_agenda`
--

LOCK TABLES `personal_agenda` WRITE;
/*!40000 ALTER TABLE `personal_agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_agenda_repeat`
--

DROP TABLE IF EXISTS `personal_agenda_repeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_agenda_repeat` (
  `cal_id` int(11) NOT NULL AUTO_INCREMENT,
  `cal_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cal_end` int(11) DEFAULT NULL,
  `cal_frequency` int(11) DEFAULT NULL,
  `cal_days` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_agenda_repeat`
--

LOCK TABLES `personal_agenda_repeat` WRITE;
/*!40000 ALTER TABLE `personal_agenda_repeat` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_agenda_repeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_agenda_repeat_not`
--

DROP TABLE IF EXISTS `personal_agenda_repeat_not`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_agenda_repeat_not` (
  `cal_id` int(11) NOT NULL,
  `cal_date` int(11) NOT NULL,
  PRIMARY KEY (`cal_id`,`cal_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_agenda_repeat_not`
--

LOCK TABLES `personal_agenda_repeat_not` WRITE;
/*!40000 ALTER TABLE `personal_agenda_repeat_not` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_agenda_repeat_not` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `career_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C11D7DD1B58CDA09` (`career_id`),
  CONSTRAINT `FK_C11D7DD1B58CDA09` FOREIGN KEY (`career_id`) REFERENCES `career` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `geolocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_mask` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_729F519BDCD6CC49` (`branch_id`),
  CONSTRAINT `FK_729F519BDCD6CC49` FOREIGN KEY (`branch_id`) REFERENCES `branch_sync` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_engine_ref`
--

DROP TABLE IF EXISTS `search_engine_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_engine_ref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `tool_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref_id_high_level` int(11) NOT NULL,
  `ref_id_second_level` int(11) DEFAULT NULL,
  `search_did` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_engine_ref`
--

LOCK TABLES `search_engine_ref` WRITE;
/*!40000 ALTER TABLE `search_engine_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_engine_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `graph` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_condition`
--

DROP TABLE IF EXISTS `sequence_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `mat_op` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `param` double NOT NULL,
  `act_true` int(11) NOT NULL,
  `act_false` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_condition`
--

LOCK TABLES `sequence_condition` WRITE;
/*!40000 ALTER TABLE `sequence_condition` DISABLE KEYS */;
INSERT INTO `sequence_condition` VALUES (1,'<= 100%','<=',100,2,'0'),(2,'>= 70%','>=',70,0,'');
/*!40000 ALTER TABLE `sequence_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_formula`
--

DROP TABLE IF EXISTS `sequence_formula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_formula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_method_id` int(11) DEFAULT NULL,
  `sequence_variable_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_533B9159B2D1386E` (`sequence_method_id`),
  KEY `IDX_533B915955C65E08` (`sequence_variable_id`),
  CONSTRAINT `FK_533B915955C65E08` FOREIGN KEY (`sequence_variable_id`) REFERENCES `sequence_variable` (`id`),
  CONSTRAINT `FK_533B9159B2D1386E` FOREIGN KEY (`sequence_method_id`) REFERENCES `sequence_method` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_formula`
--

LOCK TABLES `sequence_formula` WRITE;
/*!40000 ALTER TABLE `sequence_formula` DISABLE KEYS */;
INSERT INTO `sequence_formula` VALUES (1,1,2),(2,2,2),(3,2,3),(4,2,1),(5,3,3),(6,4,4),(7,5,5),(8,6,6),(9,7,7),(10,8,8),(11,9,3),(12,10,2),(13,11,1);
/*!40000 ALTER TABLE `sequence_formula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_method`
--

DROP TABLE IF EXISTS `sequence_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `formula` longtext COLLATE utf8_unicode_ci NOT NULL,
  `assign` int(11) NOT NULL,
  `met_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `act_false` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_method`
--

LOCK TABLES `sequence_method` WRITE;
/*!40000 ALTER TABLE `sequence_method` DISABLE KEYS */;
INSERT INTO `sequence_method` VALUES (1,'Add completed item','v#2 + $complete_items;',2,'add',''),(2,'Update progress by division','v#2 / v#3 * 100;',1,'div',''),(3,'Update items count','$total_items;',3,'update',''),(4,'Enable success','1;',4,'success',''),(5,'Store success date','(empty(v#5))? api_get_utc_datetime() : v#5;',5,'success',''),(6,'Enable availability','1;',6,'pre',''),(7,'Store availability start date','(empty(v#7))? api_get_utc_datetime() : v#7;',7,'pre',''),(8,'Store availability end date','(empty($available_end_date))? api_get_utc_datetime($available_end_date) : \"0000-00-00 00:00:00\";',8,'pre',''),(9,'Increase the items count','v#3 + $total_items;',3,'add',''),(10,'Update completed items','$complete_items;',2,'update',''),(11,'Update progress','$complete_items / $total_items * 100;',1,'update','');
/*!40000 ALTER TABLE `sequence_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_resource`
--

DROP TABLE IF EXISTS `sequence_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_34ADA43998FB19AE` (`sequence_id`),
  CONSTRAINT `FK_34ADA43998FB19AE` FOREIGN KEY (`sequence_id`) REFERENCES `sequence` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_resource`
--

LOCK TABLES `sequence_resource` WRITE;
/*!40000 ALTER TABLE `sequence_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_row_entity`
--

DROP TABLE IF EXISTS `sequence_row_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_row_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_type_entity_id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `row_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2779761FAED14944` (`sequence_type_entity_id`),
  CONSTRAINT `FK_2779761FAED14944` FOREIGN KEY (`sequence_type_entity_id`) REFERENCES `sequence_type_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_row_entity`
--

LOCK TABLES `sequence_row_entity` WRITE;
/*!40000 ALTER TABLE `sequence_row_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_row_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_rule`
--

DROP TABLE IF EXISTS `sequence_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_rule`
--

LOCK TABLES `sequence_rule` WRITE;
/*!40000 ALTER TABLE `sequence_rule` DISABLE KEYS */;
INSERT INTO `sequence_rule` VALUES (1,'If user completes 70% of an entity or group of items, he will be able to access another entity or group of items');
/*!40000 ALTER TABLE `sequence_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_rule_condition`
--

DROP TABLE IF EXISTS `sequence_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_rule_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_rule_id` int(11) DEFAULT NULL,
  `sequence_condition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F948EE6A4044CA89` (`sequence_rule_id`),
  KEY `IDX_F948EE6A8C0A7083` (`sequence_condition_id`),
  CONSTRAINT `FK_F948EE6A4044CA89` FOREIGN KEY (`sequence_rule_id`) REFERENCES `sequence_rule` (`id`),
  CONSTRAINT `FK_F948EE6A8C0A7083` FOREIGN KEY (`sequence_condition_id`) REFERENCES `sequence_condition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_rule_condition`
--

LOCK TABLES `sequence_rule_condition` WRITE;
/*!40000 ALTER TABLE `sequence_rule_condition` DISABLE KEYS */;
INSERT INTO `sequence_rule_condition` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `sequence_rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_rule_method`
--

DROP TABLE IF EXISTS `sequence_rule_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_rule_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_rule_id` int(11) DEFAULT NULL,
  `sequence_method_id` int(11) DEFAULT NULL,
  `method_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6336EA764044CA89` (`sequence_rule_id`),
  KEY `IDX_6336EA76B2D1386E` (`sequence_method_id`),
  CONSTRAINT `FK_6336EA764044CA89` FOREIGN KEY (`sequence_rule_id`) REFERENCES `sequence_rule` (`id`),
  CONSTRAINT `FK_6336EA76B2D1386E` FOREIGN KEY (`sequence_method_id`) REFERENCES `sequence_method` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_rule_method`
--

LOCK TABLES `sequence_rule_method` WRITE;
/*!40000 ALTER TABLE `sequence_rule_method` DISABLE KEYS */;
INSERT INTO `sequence_rule_method` VALUES (1,1,1,1),(2,1,2,3),(3,1,3,0),(4,1,4,0),(5,1,5,0),(6,1,6,0),(7,1,7,0),(8,1,8,0),(9,1,9,2),(10,1,10,0),(11,1,11,0);
/*!40000 ALTER TABLE `sequence_rule_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_type_entity`
--

DROP TABLE IF EXISTS `sequence_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_type_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ent_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_type_entity`
--

LOCK TABLES `sequence_type_entity` WRITE;
/*!40000 ALTER TABLE `sequence_type_entity` DISABLE KEYS */;
INSERT INTO `sequence_type_entity` VALUES (1,'Lp','Learning Path','c_lp'),(2,'Quiz','Quiz and Tests','c_quiz'),(3,'LpItem','Items of a Learning Path','c_lp_item');
/*!40000 ALTER TABLE `sequence_type_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_valid`
--

DROP TABLE IF EXISTS `sequence_valid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_valid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_variable_id` int(11) DEFAULT NULL,
  `sequence_condition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F78B9CE655C65E08` (`sequence_variable_id`),
  KEY `IDX_F78B9CE68C0A7083` (`sequence_condition_id`),
  CONSTRAINT `FK_F78B9CE655C65E08` FOREIGN KEY (`sequence_variable_id`) REFERENCES `sequence_variable` (`id`),
  CONSTRAINT `FK_F78B9CE68C0A7083` FOREIGN KEY (`sequence_condition_id`) REFERENCES `sequence_condition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_valid`
--

LOCK TABLES `sequence_valid` WRITE;
/*!40000 ALTER TABLE `sequence_valid` DISABLE KEYS */;
INSERT INTO `sequence_valid` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `sequence_valid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_value`
--

DROP TABLE IF EXISTS `sequence_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_row_entity_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `advance` double NOT NULL,
  `complete_items` int(11) NOT NULL,
  `total_items` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `success_date` datetime DEFAULT NULL,
  `available` tinyint(1) NOT NULL,
  `available_start_date` datetime DEFAULT NULL,
  `available_end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_66FBF12D218736B2` (`sequence_row_entity_id`),
  CONSTRAINT `FK_66FBF12D218736B2` FOREIGN KEY (`sequence_row_entity_id`) REFERENCES `sequence_row_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_value`
--

LOCK TABLES `sequence_value` WRITE;
/*!40000 ALTER TABLE `sequence_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_variable`
--

DROP TABLE IF EXISTS `sequence_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_val` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_variable`
--

LOCK TABLES `sequence_variable` WRITE;
/*!40000 ALTER TABLE `sequence_variable` DISABLE KEYS */;
INSERT INTO `sequence_variable` VALUES (1,'Percentile progress','advance','0.0'),(2,'Completed items','complete_items','0'),(3,'Items count','total_items','0'),(4,'Completed','success','0'),(5,'Completion date','success_date','0000-00-00 00:00:00'),(6,'Available','available','0'),(7,'Availability start date','available_start_date','0000-00-00 00:00:00'),(8,'Availability end date','available_end_date','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `sequence_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_coach` int(11) DEFAULT NULL,
  `session_category_id` int(11) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_description` tinyint(1) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `nbr_courses` smallint(6) DEFAULT NULL,
  `nbr_users` int(11) DEFAULT NULL,
  `nbr_classes` int(11) DEFAULT NULL,
  `session_admin_id` int(11) DEFAULT NULL,
  `visibility` int(11) NOT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `display_start_date` datetime DEFAULT NULL,
  `display_end_date` datetime DEFAULT NULL,
  `access_start_date` datetime DEFAULT NULL,
  `access_end_date` datetime DEFAULT NULL,
  `coach_access_start_date` datetime DEFAULT NULL,
  `coach_access_end_date` datetime DEFAULT NULL,
  `send_subscription_notification` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `IDX_D044D5D4EE1F8395` (`session_category_id`),
  KEY `idx_id_coach` (`id_coach`),
  KEY `idx_id_session_admin_id` (`session_admin_id`),
  CONSTRAINT `FK_D044D5D4D1DC2CFC` FOREIGN KEY (`id_coach`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_D044D5D4EE1F8395` FOREIGN KEY (`session_category_id`) REFERENCES `session_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_category`
--

DROP TABLE IF EXISTS `session_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_url_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8DE079A973444FD5` (`access_url_id`),
  CONSTRAINT `FK_8DE079A973444FD5` FOREIGN KEY (`access_url_id`) REFERENCES `access_url` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_category`
--

LOCK TABLES `session_category` WRITE;
/*!40000 ALTER TABLE `session_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_rel_course`
--

DROP TABLE IF EXISTS `session_rel_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_rel_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `nbr_users` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_12D110D3613FECDF` (`session_id`),
  KEY `idx_session_rel_course_course_id` (`c_id`),
  CONSTRAINT `FK_12D110D3613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_12D110D391D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_rel_course`
--

LOCK TABLES `session_rel_course` WRITE;
/*!40000 ALTER TABLE `session_rel_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_rel_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_rel_course_rel_user`
--

DROP TABLE IF EXISTS `session_rel_course_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_rel_course_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `visibility` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `legal_agreement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_720167E613FECDF` (`session_id`),
  KEY `idx_session_rel_course_rel_user_id_user` (`user_id`),
  KEY `idx_session_rel_course_rel_user_course_id` (`c_id`),
  CONSTRAINT `FK_720167E613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_720167E91D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_720167EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_rel_course_rel_user`
--

LOCK TABLES `session_rel_course_rel_user` WRITE;
/*!40000 ALTER TABLE `session_rel_course_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_rel_course_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_rel_user`
--

DROP TABLE IF EXISTS `session_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `relation_type` int(11) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `moved_to` int(11) DEFAULT NULL,
  `moved_status` int(11) DEFAULT NULL,
  `moved_at` datetime DEFAULT NULL,
  `registered_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B0D7D4C0613FECDF` (`session_id`),
  KEY `IDX_B0D7D4C0A76ED395` (`user_id`),
  KEY `idx_session_rel_user_id_user_moved` (`user_id`,`moved_to`),
  CONSTRAINT `FK_B0D7D4C0613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_B0D7D4C0A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_rel_user`
--

LOCK TABLES `session_rel_user` WRITE;
/*!40000 ALTER TABLE `session_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_current`
--

DROP TABLE IF EXISTS `settings_current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subkey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selected_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subkeytext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_url` int(11) NOT NULL DEFAULT 1,
  `access_url_changeable` int(11) NOT NULL,
  `access_url_locked` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_setting` (`variable`,`subkey`,`access_url`),
  KEY `access_url` (`access_url`)
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_current`
--

LOCK TABLES `settings_current` WRITE;
/*!40000 ALTER TABLE `settings_current` DISABLE KEYS */;
INSERT INTO `settings_current` VALUES (1,'Institution',NULL,'textfield','Platform','My Organisation','InstitutionTitle','InstitutionComment','platform',NULL,1,1,0),(2,'InstitutionUrl',NULL,'textfield','Platform','http://www.chamilo.org','InstitutionUrlTitle','InstitutionUrlComment',NULL,NULL,1,1,0),(3,'siteName',NULL,'textfield','Platform','My campus','SiteNameTitle','SiteNameComment',NULL,NULL,1,1,0),(4,'emailAdministrator',NULL,'textfield','Platform','webmaster@localhost.localdomain','emailAdministratorTitle','emailAdministratorComment',NULL,NULL,1,1,0),(5,'administratorSurname',NULL,'textfield','Platform','Doe','administratorSurnameTitle','administratorSurnameComment',NULL,NULL,1,1,0),(6,'administratorName',NULL,'textfield','Platform','John','administratorNameTitle','administratorNameComment',NULL,NULL,1,1,0),(7,'show_administrator_data',NULL,'radio','Platform','true','ShowAdministratorDataTitle','ShowAdministratorDataComment',NULL,NULL,1,1,0),(8,'show_tutor_data',NULL,'radio','Session','true','ShowTutorDataTitle','ShowTutorDataComment',NULL,NULL,1,1,0),(9,'show_teacher_data',NULL,'radio','Platform','true','ShowTeacherDataTitle','ShowTeacherDataComment',NULL,NULL,1,1,0),(10,'homepage_view',NULL,'radio','Course','activity_big','HomepageViewTitle','HomepageViewComment',NULL,NULL,1,1,0),(11,'show_toolshortcuts',NULL,'radio','Course','false','ShowToolShortcutsTitle','ShowToolShortcutsComment',NULL,NULL,1,0,0),(12,'allow_group_categories',NULL,'radio','Course','false','AllowGroupCategories','AllowGroupCategoriesComment',NULL,NULL,1,0,0),(13,'server_type',NULL,'radio','Platform','production','ServerStatusTitle','ServerStatusComment',NULL,NULL,1,0,1),(14,'platformLanguage',NULL,'link','Languages','english','PlatformLanguageTitle','PlatformLanguageComment',NULL,NULL,1,0,0),(15,'showonline','world','checkbox','Platform','true','ShowOnlineTitle','ShowOnlineComment',NULL,'ShowOnlineWorld',1,0,0),(16,'showonline','users','checkbox','Platform','true','ShowOnlineTitle','ShowOnlineComment',NULL,'ShowOnlineUsers',1,0,0),(17,'showonline','course','checkbox','Platform','true','ShowOnlineTitle','ShowOnlineComment',NULL,'ShowOnlineCourse',1,0,0),(18,'profile','name','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'Name',1,0,0),(19,'profile','officialcode','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'OfficialCode',1,0,0),(20,'profile','email','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'Email',1,0,0),(21,'profile','picture','checkbox','User','true','ProfileChangesTitle','ProfileChangesComment',NULL,'UserPicture',1,0,0),(22,'profile','login','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'Login',1,0,0),(23,'profile','password','checkbox','User','true','ProfileChangesTitle','ProfileChangesComment',NULL,'UserPassword',1,0,0),(24,'profile','language','checkbox','User','true','ProfileChangesTitle','ProfileChangesComment',NULL,'Language',1,0,0),(25,'default_document_quotum',NULL,'textfield','Course','100000000','DefaultDocumentQuotumTitle','DefaultDocumentQuotumComment',NULL,NULL,1,0,0),(26,'registration','officialcode','checkbox','User','false','RegistrationRequiredFormsTitle','RegistrationRequiredFormsComment',NULL,'OfficialCode',1,0,0),(27,'registration','email','checkbox','User','true','RegistrationRequiredFormsTitle','RegistrationRequiredFormsComment',NULL,'Email',1,0,0),(28,'registration','language','checkbox','User','true','RegistrationRequiredFormsTitle','RegistrationRequiredFormsComment',NULL,'Language',1,0,0),(29,'default_group_quotum',NULL,'textfield','Course','5000000','DefaultGroupQuotumTitle','DefaultGroupQuotumComment',NULL,NULL,1,0,0),(30,'allow_registration',NULL,'radio','Platform','true','AllowRegistrationTitle','AllowRegistrationComment',NULL,NULL,1,0,0),(31,'allow_registration_as_teacher',NULL,'radio','Platform','true','AllowRegistrationAsTeacherTitle','AllowRegistrationAsTeacherComment',NULL,NULL,1,0,0),(32,'allow_lostpassword',NULL,'radio','Platform','true','AllowLostPasswordTitle','AllowLostPasswordComment',NULL,NULL,1,0,0),(33,'allow_user_headings',NULL,'radio','Course','false','AllowUserHeadings','AllowUserHeadingsComment',NULL,NULL,1,0,0),(34,'course_create_active_tools','course_description','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'CourseDescription',1,0,0),(35,'course_create_active_tools','agenda','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Agenda',1,0,0),(36,'course_create_active_tools','documents','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Documents',1,0,0),(37,'course_create_active_tools','learning_path','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'LearningPath',1,0,0),(38,'course_create_active_tools','links','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Links',1,0,0),(39,'course_create_active_tools','announcements','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Announcements',1,0,0),(40,'course_create_active_tools','forums','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Forums',1,0,0),(41,'course_create_active_tools','dropbox','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Dropbox',1,0,0),(42,'course_create_active_tools','quiz','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Quiz',1,0,0),(43,'course_create_active_tools','users','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Users',1,0,0),(44,'course_create_active_tools','groups','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Groups',1,0,0),(45,'course_create_active_tools','chat','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Chat',1,0,0),(46,'course_create_active_tools','student_publications','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'StudentPublications',1,0,0),(47,'allow_personal_agenda',NULL,'radio','User','true','AllowPersonalAgendaTitle','AllowPersonalAgendaComment',NULL,NULL,1,0,0),(48,'display_coursecode_in_courselist',NULL,'radio','Platform','false','DisplayCourseCodeInCourselistTitle','DisplayCourseCodeInCourselistComment',NULL,NULL,1,0,0),(49,'display_teacher_in_courselist',NULL,'radio','Platform','true','DisplayTeacherInCourselistTitle','DisplayTeacherInCourselistComment',NULL,NULL,1,0,0),(50,'permanently_remove_deleted_files',NULL,'radio','Tools','false','PermanentlyRemoveFilesTitle','PermanentlyRemoveFilesComment',NULL,NULL,1,0,1),(51,'dropbox_allow_overwrite',NULL,'radio','Tools','true','DropboxAllowOverwriteTitle','DropboxAllowOverwriteComment',NULL,NULL,1,0,0),(52,'dropbox_max_filesize',NULL,'textfield','Tools','100000000','DropboxMaxFilesizeTitle','DropboxMaxFilesizeComment',NULL,NULL,1,0,0),(53,'dropbox_allow_just_upload',NULL,'radio','Tools','true','DropboxAllowJustUploadTitle','DropboxAllowJustUploadComment',NULL,NULL,1,0,0),(54,'dropbox_allow_student_to_student',NULL,'radio','Tools','true','DropboxAllowStudentToStudentTitle','DropboxAllowStudentToStudentComment',NULL,NULL,1,0,0),(55,'dropbox_allow_group',NULL,'radio','Tools','true','DropboxAllowGroupTitle','DropboxAllowGroupComment',NULL,NULL,1,0,0),(56,'dropbox_allow_mailing',NULL,'radio','Tools','false','DropboxAllowMailingTitle','DropboxAllowMailingComment',NULL,NULL,1,0,0),(57,'administratorTelephone',NULL,'textfield','Platform','(000) 001 02 03','administratorTelephoneTitle','administratorTelephoneComment',NULL,NULL,1,1,0),(58,'extended_profile',NULL,'radio','User','false','ExtendedProfileTitle','ExtendedProfileComment',NULL,NULL,1,0,0),(59,'student_view_enabled',NULL,'radio','Platform','true','StudentViewEnabledTitle','StudentViewEnabledComment',NULL,NULL,1,0,0),(60,'show_navigation_menu',NULL,'radio','Course','false','ShowNavigationMenuTitle','ShowNavigationMenuComment',NULL,NULL,1,0,0),(61,'enable_tool_introduction',NULL,'radio','course','false','EnableToolIntroductionTitle','EnableToolIntroductionComment',NULL,NULL,1,0,0),(62,'page_after_login',NULL,'radio','Platform','user_portal.php','PageAfterLoginTitle','PageAfterLoginComment',NULL,NULL,1,0,0),(63,'time_limit_whosonline',NULL,'textfield','Platform','30','TimeLimitWhosonlineTitle','TimeLimitWhosonlineComment',NULL,NULL,1,0,0),(64,'breadcrumbs_course_homepage',NULL,'radio','Course','course_title','BreadCrumbsCourseHomepageTitle','BreadCrumbsCourseHomepageComment',NULL,NULL,1,0,0),(65,'example_material_course_creation',NULL,'radio','Platform','true','ExampleMaterialCourseCreationTitle','ExampleMaterialCourseCreationComment',NULL,NULL,1,0,0),(66,'account_valid_duration',NULL,'textfield','Platform','3660','AccountValidDurationTitle','AccountValidDurationComment',NULL,NULL,1,0,1),(67,'use_session_mode',NULL,'radio','Session','true','UseSessionModeTitle','UseSessionModeComment',NULL,NULL,1,0,0),(68,'allow_email_editor',NULL,'radio','Tools','false','AllowEmailEditorTitle','AllowEmailEditorComment',NULL,NULL,1,0,0),(69,'registered',NULL,'textfield',NULL,'false','registered',NULL,NULL,NULL,1,0,0),(70,'donotlistcampus',NULL,'textfield',NULL,'false','donotlistcampus',NULL,NULL,NULL,1,0,0),(71,'show_email_addresses',NULL,'radio','Platform','false','ShowEmailAddresses','ShowEmailAddressesComment',NULL,NULL,1,1,0),(72,'profile','phone','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'Phone',1,0,0),(73,'service_ppt2lp','active','radio',NULL,'false','ppt2lp_actived','',NULL,NULL,1,0,1),(74,'service_ppt2lp','host','textfield',NULL,NULL,'Host',NULL,NULL,NULL,1,0,1),(75,'service_ppt2lp','port','textfield',NULL,'2002','Port',NULL,NULL,NULL,1,0,1),(76,'service_ppt2lp','user','textfield',NULL,NULL,'UserOnHost',NULL,NULL,NULL,1,0,1),(77,'service_ppt2lp','ftp_password','textfield',NULL,NULL,'FtpPassword',NULL,NULL,NULL,1,0,1),(78,'service_ppt2lp','path_to_lzx','textfield',NULL,NULL,'',NULL,NULL,NULL,1,0,1),(79,'service_ppt2lp','size','radio',NULL,'720x540','',NULL,NULL,NULL,1,0,1),(80,'stylesheets',NULL,'textfield','stylesheets','chamilo','',NULL,NULL,NULL,1,1,0),(81,'upload_extensions_list_type',NULL,'radio','Security','blacklist','UploadExtensionsListType','UploadExtensionsListTypeComment',NULL,NULL,1,0,1),(82,'upload_extensions_blacklist',NULL,'textfield','Security','','UploadExtensionsBlacklist','UploadExtensionsBlacklistComment',NULL,NULL,1,0,1),(83,'upload_extensions_whitelist',NULL,'textfield','Security','htm;html;jpg;jpeg;gif;png;swf;avi;mpg;mpeg;mov;flv;doc;docx;xls;xlsx;ppt;pptx;odt;odp;ods;pdf','UploadExtensionsWhitelist','UploadExtensionsWhitelistComment',NULL,NULL,1,0,1),(84,'upload_extensions_skip',NULL,'radio','Security','true','UploadExtensionsSkip','UploadExtensionsSkipComment',NULL,NULL,1,0,1),(85,'upload_extensions_replace_by',NULL,'textfield','Security','dangerous','UploadExtensionsReplaceBy','UploadExtensionsReplaceByComment',NULL,NULL,1,0,1),(86,'show_number_of_courses',NULL,'radio','Platform','false','ShowNumberOfCourses','ShowNumberOfCoursesComment',NULL,NULL,1,0,0),(87,'show_empty_course_categories',NULL,'radio','Platform','true','ShowEmptyCourseCategories','ShowEmptyCourseCategoriesComment',NULL,NULL,1,0,0),(88,'show_back_link_on_top_of_tree',NULL,'radio','Platform','false','ShowBackLinkOnTopOfCourseTree','ShowBackLinkOnTopOfCourseTreeComment',NULL,NULL,1,0,0),(89,'show_different_course_language',NULL,'radio','Platform','true','ShowDifferentCourseLanguage','ShowDifferentCourseLanguageComment',NULL,NULL,1,1,0),(90,'split_users_upload_directory',NULL,'radio','Tuning','true','SplitUsersUploadDirectory','SplitUsersUploadDirectoryComment',NULL,NULL,1,0,1),(91,'hide_dltt_markup',NULL,'radio','Languages','true','HideDLTTMarkup','HideDLTTMarkupComment',NULL,NULL,1,0,1),(92,'display_categories_on_homepage',NULL,'radio','Platform','false','DisplayCategoriesOnHomepageTitle','DisplayCategoriesOnHomepageComment',NULL,NULL,1,1,0),(93,'permissions_for_new_directories',NULL,'textfield','Security','0777','PermissionsForNewDirs','PermissionsForNewDirsComment',NULL,NULL,1,0,1),(94,'permissions_for_new_files',NULL,'textfield','Security','0666','PermissionsForNewFiles','PermissionsForNewFilesComment',NULL,NULL,1,0,1),(95,'show_tabs','campus_homepage','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsCampusHomepage',1,1,0),(96,'show_tabs','my_courses','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsMyCourses',1,1,0),(97,'show_tabs','reporting','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsReporting',1,1,0),(98,'show_tabs','platform_administration','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsPlatformAdministration',1,1,0),(99,'show_tabs','my_agenda','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsMyAgenda',1,1,0),(100,'show_tabs','my_profile','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsMyProfile',1,1,0),(101,'default_forum_view',NULL,'radio','Course','flat','DefaultForumViewTitle','DefaultForumViewComment',NULL,NULL,1,0,0),(102,'platform_charset',NULL,'textfield','Languages','UTF-8','PlatformCharsetTitle','PlatformCharsetComment','platform',NULL,1,0,1),(103,'noreply_email_address','','textfield','Platform','','NoReplyEmailAddress','NoReplyEmailAddressComment',NULL,NULL,1,0,0),(104,'survey_email_sender_noreply','','radio','Course','coach','SurveyEmailSenderNoReply','SurveyEmailSenderNoReplyComment',NULL,NULL,1,0,0),(105,'openid_authentication',NULL,'radio','Security','false','OpenIdAuthentication','OpenIdAuthenticationComment',NULL,NULL,1,0,0),(106,'profile','openid','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'OpenIDURL',1,0,0),(107,'gradebook_enable',NULL,'radio','Gradebook','false','GradebookActivation','GradebookActivationComment',NULL,NULL,1,0,0),(108,'show_tabs','my_gradebook','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsMyGradebook',1,1,0),(109,'gradebook_score_display_coloring','my_display_coloring','checkbox','Gradebook','false','GradebookScoreDisplayColoring','GradebookScoreDisplayColoringComment',NULL,'TabsGradebookEnableColoring',1,0,0),(110,'gradebook_score_display_custom','my_display_custom','checkbox','Gradebook','false','GradebookScoreDisplayCustom','GradebookScoreDisplayCustomComment',NULL,'TabsGradebookEnableCustom',1,0,0),(111,'gradebook_score_display_colorsplit',NULL,'textfield','Gradebook','50','GradebookScoreDisplayColorSplit','GradebookScoreDisplayColorSplitComment',NULL,NULL,1,0,0),(112,'gradebook_score_display_upperlimit','my_display_upperlimit','checkbox','Gradebook','false','GradebookScoreDisplayUpperLimit','GradebookScoreDisplayUpperLimitComment',NULL,'TabsGradebookEnableUpperLimit',1,0,0),(113,'gradebook_number_decimals',NULL,'select','Gradebook','0','GradebookNumberDecimals','GradebookNumberDecimalsComment',NULL,NULL,1,0,0),(114,'user_selected_theme',NULL,'radio','Platform','false','UserThemeSelection','UserThemeSelectionComment',NULL,NULL,1,0,0),(115,'profile','theme','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'UserTheme',1,0,0),(116,'allow_course_theme',NULL,'radio','Course','true','AllowCourseThemeTitle','AllowCourseThemeComment',NULL,NULL,1,0,0),(117,'show_closed_courses',NULL,'radio','Platform','false','ShowClosedCoursesTitle','ShowClosedCoursesComment',NULL,NULL,1,0,0),(118,'extendedprofile_registration','mycomptetences','checkbox','User','false','ExtendedProfileRegistrationTitle','ExtendedProfileRegistrationComment',NULL,'MyCompetences',1,0,0),(119,'extendedprofile_registration','mydiplomas','checkbox','User','false','ExtendedProfileRegistrationTitle','ExtendedProfileRegistrationComment',NULL,'MyDiplomas',1,0,0),(120,'extendedprofile_registration','myteach','checkbox','User','false','ExtendedProfileRegistrationTitle','ExtendedProfileRegistrationComment',NULL,'MyTeach',1,0,0),(121,'extendedprofile_registration','mypersonalopenarea','checkbox','User','false','ExtendedProfileRegistrationTitle','ExtendedProfileRegistrationComment',NULL,'MyPersonalOpenArea',1,0,0),(122,'extendedprofile_registrationrequired','mycomptetences','checkbox','User','false','ExtendedProfileRegistrationRequiredTitle','ExtendedProfileRegistrationRequiredComment',NULL,'MyCompetences',1,0,0),(123,'extendedprofile_registrationrequired','mydiplomas','checkbox','User','false','ExtendedProfileRegistrationRequiredTitle','ExtendedProfileRegistrationRequiredComment',NULL,'MyDiplomas',1,0,0),(124,'extendedprofile_registrationrequired','myteach','checkbox','User','false','ExtendedProfileRegistrationRequiredTitle','ExtendedProfileRegistrationRequiredComment',NULL,'MyTeach',1,0,0),(125,'extendedprofile_registrationrequired','mypersonalopenarea','checkbox','User','false','ExtendedProfileRegistrationRequiredTitle','ExtendedProfileRegistrationRequiredComment',NULL,'MyPersonalOpenArea',1,0,0),(126,'registration','phone','checkbox','User','false','RegistrationRequiredFormsTitle','RegistrationRequiredFormsComment',NULL,'Phone',1,0,0),(127,'add_users_by_coach',NULL,'radio','Session','false','AddUsersByCoachTitle','AddUsersByCoachComment',NULL,NULL,1,0,0),(128,'extend_rights_for_coach',NULL,'radio','Security','false','ExtendRightsForCoachTitle','ExtendRightsForCoachComment',NULL,NULL,1,0,0),(129,'extend_rights_for_coach_on_survey',NULL,'radio','Security','true','ExtendRightsForCoachOnSurveyTitle','ExtendRightsForCoachOnSurveyComment',NULL,NULL,1,0,0),(130,'course_create_active_tools','wiki','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Wiki',1,0,0),(131,'show_session_coach',NULL,'radio','Session','false','ShowSessionCoachTitle','ShowSessionCoachComment',NULL,NULL,1,0,0),(132,'course_create_active_tools','gradebook','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Gradebook',1,0,0),(133,'allow_users_to_create_courses',NULL,'radio','Platform','true','AllowUsersToCreateCoursesTitle','AllowUsersToCreateCoursesComment',NULL,NULL,1,0,0),(134,'course_create_active_tools','survey','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Survey',1,0,0),(135,'course_create_active_tools','glossary','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Glossary',1,0,0),(136,'course_create_active_tools','notebook','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Notebook',1,0,0),(137,'course_create_active_tools','attendances','checkbox','Tools','false','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Attendances',1,0,0),(138,'course_create_active_tools','course_progress','checkbox','Tools','false','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'CourseProgress',1,0,0),(139,'profile','apikeys','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'ApiKeys',1,0,0),(140,'allow_message_tool',NULL,'radio','Tools','true','AllowMessageToolTitle','AllowMessageToolComment',NULL,NULL,1,1,0),(141,'allow_social_tool',NULL,'radio','Tools','true','AllowSocialToolTitle','AllowSocialToolComment',NULL,NULL,1,1,0),(142,'allow_students_to_browse_courses',NULL,'radio','Platform','true','AllowStudentsToBrowseCoursesTitle','AllowStudentsToBrowseCoursesComment',NULL,NULL,1,1,0),(143,'show_session_data',NULL,'radio','Session','false','ShowSessionDataTitle','ShowSessionDataComment',NULL,NULL,1,1,0),(144,'allow_use_sub_language',NULL,'radio','Languages','false','AllowUseSubLanguageTitle','AllowUseSubLanguageComment',NULL,NULL,1,0,0),(145,'show_glossary_in_documents',NULL,'radio','Course','none','ShowGlossaryInDocumentsTitle','ShowGlossaryInDocumentsComment',NULL,NULL,1,1,0),(146,'allow_terms_conditions',NULL,'radio','Platform','false','AllowTermsAndConditionsTitle','AllowTermsAndConditionsComment',NULL,NULL,1,0,0),(147,'course_create_active_tools','enable_search','checkbox','Tools','false','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Search',1,0,0),(148,'search_enabled',NULL,'radio','Search','false','EnableSearchTitle','EnableSearchComment',NULL,NULL,1,1,0),(149,'search_prefilter_prefix',NULL,NULL,'Search','','SearchPrefilterPrefix','SearchPrefilterPrefixComment',NULL,NULL,1,0,0),(150,'search_show_unlinked_results',NULL,'radio','Search','true','SearchShowUnlinkedResultsTitle','SearchShowUnlinkedResultsComment',NULL,NULL,1,1,0),(151,'show_courses_descriptions_in_catalog',NULL,'radio','Course','true','ShowCoursesDescriptionsInCatalogTitle','ShowCoursesDescriptionsInCatalogComment',NULL,NULL,1,1,0),(152,'allow_coach_to_edit_course_session',NULL,'radio','Session','true','AllowCoachsToEditInsideTrainingSessions','AllowCoachsToEditInsideTrainingSessionsComment',NULL,NULL,1,0,0),(153,'show_glossary_in_extra_tools',NULL,'radio','Course','none','ShowGlossaryInExtraToolsTitle','ShowGlossaryInExtraToolsComment',NULL,NULL,1,1,0),(154,'send_email_to_admin_when_create_course',NULL,'radio','Platform','false','SendEmailToAdminTitle','SendEmailToAdminComment',NULL,NULL,1,1,0),(155,'go_to_course_after_login',NULL,'radio','Course','false','GoToCourseAfterLoginTitle','GoToCourseAfterLoginComment',NULL,NULL,1,0,0),(156,'math_asciimathML',NULL,'radio','Editor','false','MathASCIImathMLTitle','MathASCIImathMLComment',NULL,NULL,1,0,0),(157,'enabled_asciisvg',NULL,'radio','Editor','false','AsciiSvgTitle','AsciiSvgComment',NULL,NULL,1,0,0),(158,'include_asciimathml_script',NULL,'radio','Editor','false','IncludeAsciiMathMlTitle','IncludeAsciiMathMlComment',NULL,NULL,1,0,0),(159,'youtube_for_students',NULL,'radio','Editor','true','YoutubeForStudentsTitle','YoutubeForStudentsComment',NULL,NULL,1,0,0),(160,'block_copy_paste_for_students',NULL,'radio','Editor','false','BlockCopyPasteForStudentsTitle','BlockCopyPasteForStudentsComment',NULL,NULL,1,0,0),(161,'more_buttons_maximized_mode',NULL,'radio','Editor','true','MoreButtonsForMaximizedModeTitle','MoreButtonsForMaximizedModeComment',NULL,NULL,1,0,0),(162,'students_download_folders',NULL,'radio','Tools','true','AllowStudentsDownloadFoldersTitle','AllowStudentsDownloadFoldersComment',NULL,NULL,1,0,0),(163,'users_copy_files',NULL,'radio','Tools','true','AllowUsersCopyFilesTitle','AllowUsersCopyFilesComment',NULL,NULL,1,1,0),(164,'show_tabs','social','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsSocial',1,0,0),(165,'allow_students_to_create_groups_in_social',NULL,'radio','Tools','false','AllowStudentsToCreateGroupsInSocialTitle','AllowStudentsToCreateGroupsInSocialComment',NULL,NULL,1,0,0),(166,'allow_send_message_to_all_platform_users',NULL,'radio','Tools','true','AllowSendMessageToAllPlatformUsersTitle','AllowSendMessageToAllPlatformUsersComment',NULL,NULL,1,0,0),(167,'message_max_upload_filesize',NULL,'textfield','Tools','20971520','MessageMaxUploadFilesizeTitle','MessageMaxUploadFilesizeComment',NULL,NULL,1,0,0),(168,'show_tabs','dashboard','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsDashboard',1,1,0),(169,'use_users_timezone','timezones','radio','Timezones','true','UseUsersTimezoneTitle','UseUsersTimezoneComment',NULL,'Timezones',1,1,0),(170,'timezone_value','timezones','select','Timezones','','TimezoneValueTitle','TimezoneValueComment',NULL,'Timezones',1,1,0),(171,'allow_user_course_subscription_by_course_admin',NULL,'radio','Security','true','AllowUserCourseSubscriptionByCourseAdminTitle','AllowUserCourseSubscriptionByCourseAdminComment',NULL,NULL,1,1,0),(172,'show_link_bug_notification',NULL,'radio','Platform','false','ShowLinkBugNotificationTitle','ShowLinkBugNotificationComment',NULL,NULL,1,0,0),(173,'show_link_ticket_notification',NULL,'radio','Platform','false','ShowLinkTicketNotificationTitle','ShowLinkTicketNotificationComment',NULL,NULL,1,0,0),(174,'course_validation',NULL,'radio','Platform','false','EnableCourseValidation','EnableCourseValidationComment',NULL,NULL,1,1,0),(175,'course_validation_terms_and_conditions_url',NULL,'textfield','Platform','','CourseValidationTermsAndConditionsLink','CourseValidationTermsAndConditionsLinkComment',NULL,NULL,1,1,0),(176,'sso_authentication',NULL,'radio','Security','false','EnableSSOTitle','EnableSSOComment',NULL,NULL,1,1,0),(177,'sso_authentication_domain',NULL,'textfield','Security','','SSOServerDomainTitle','SSOServerDomainComment',NULL,NULL,1,1,0),(178,'sso_authentication_auth_uri',NULL,'textfield','Security','/?q=user','SSOServerAuthURITitle','SSOServerAuthURIComment',NULL,NULL,1,1,0),(179,'sso_authentication_unauth_uri',NULL,'textfield','Security','/?q=logout','SSOServerUnAuthURITitle','SSOServerUnAuthURIComment',NULL,NULL,1,1,0),(180,'sso_authentication_protocol',NULL,'radio','Security','http://','SSOServerProtocolTitle','SSOServerProtocolComment',NULL,NULL,1,1,0),(181,'enabled_wiris',NULL,'radio','Editor','false','EnabledWirisTitle','EnabledWirisComment',NULL,NULL,1,0,0),(182,'allow_spellcheck',NULL,'radio','Editor','false','AllowSpellCheckTitle','AllowSpellCheckComment',NULL,NULL,1,0,0),(183,'force_wiki_paste_as_plain_text',NULL,'radio','Editor','false','ForceWikiPasteAsPlainTextTitle','ForceWikiPasteAsPlainTextComment',NULL,NULL,1,0,0),(184,'enabled_googlemaps',NULL,'radio','Editor','false','EnabledGooglemapsTitle','EnabledGooglemapsComment',NULL,NULL,1,0,0),(185,'enabled_imgmap',NULL,'radio','Editor','true','EnabledImageMapsTitle','EnabledImageMapsComment',NULL,NULL,1,0,0),(186,'enabled_support_svg',NULL,'radio','Tools','true','EnabledSVGTitle','EnabledSVGComment',NULL,NULL,1,0,0),(187,'pdf_export_watermark_enable',NULL,'radio','Platform','false','PDFExportWatermarkEnableTitle','PDFExportWatermarkEnableComment','platform',NULL,1,1,0),(188,'pdf_export_watermark_by_course',NULL,'radio','Platform','false','PDFExportWatermarkByCourseTitle','PDFExportWatermarkByCourseComment','platform',NULL,1,1,0),(189,'pdf_export_watermark_text',NULL,'textfield','Platform','','PDFExportWatermarkTextTitle','PDFExportWatermarkTextComment','platform',NULL,1,1,0),(190,'enabled_insertHtml',NULL,'radio','Editor','true','EnabledInsertHtmlTitle','EnabledInsertHtmlComment',NULL,NULL,1,0,0),(191,'students_export2pdf',NULL,'radio','Tools','true','EnabledStudentExport2PDFTitle','EnabledStudentExport2PDFComment',NULL,NULL,1,0,0),(192,'exercise_min_score',NULL,'textfield','Course','','ExerciseMinScoreTitle','ExerciseMinScoreComment','platform',NULL,1,1,0),(193,'exercise_max_score',NULL,'textfield','Course','','ExerciseMaxScoreTitle','ExerciseMaxScoreComment','platform',NULL,1,1,0),(194,'show_users_folders',NULL,'radio','Tools','true','ShowUsersFoldersTitle','ShowUsersFoldersComment',NULL,NULL,1,0,0),(195,'show_default_folders',NULL,'radio','Tools','true','ShowDefaultFoldersTitle','ShowDefaultFoldersComment',NULL,NULL,1,0,0),(196,'show_chat_folder',NULL,'radio','Tools','true','ShowChatFolderTitle','ShowChatFolderComment',NULL,NULL,1,0,0),(197,'enabled_text2audio',NULL,'radio','Tools','false','Text2AudioTitle','Text2AudioComment',NULL,NULL,1,0,0),(198,'course_hide_tools','course_description','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'CourseDescription',1,1,0),(199,'course_hide_tools','calendar_event','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Agenda',1,1,0),(200,'course_hide_tools','document','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Documents',1,1,0),(201,'course_hide_tools','learnpath','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'LearningPath',1,1,0),(202,'course_hide_tools','link','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Links',1,1,0),(203,'course_hide_tools','announcement','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Announcements',1,1,0),(204,'course_hide_tools','forum','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Forums',1,1,0),(205,'course_hide_tools','dropbox','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Dropbox',1,1,0),(206,'course_hide_tools','quiz','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Quiz',1,1,0),(207,'course_hide_tools','user','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Users',1,1,0),(208,'course_hide_tools','group','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Groups',1,1,0),(209,'course_hide_tools','chat','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Chat',1,1,0),(210,'course_hide_tools','student_publication','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'StudentPublications',1,1,0),(211,'course_hide_tools','wiki','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Wiki',1,1,0),(212,'course_hide_tools','gradebook','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Gradebook',1,1,0),(213,'course_hide_tools','survey','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Survey',1,1,0),(214,'course_hide_tools','glossary','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Glossary',1,1,0),(215,'course_hide_tools','notebook','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Notebook',1,1,0),(216,'course_hide_tools','attendance','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Attendances',1,1,0),(217,'course_hide_tools','course_progress','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'CourseProgress',1,1,0),(218,'course_hide_tools','blog_management','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Blog',1,1,0),(219,'course_hide_tools','tracking','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Stats',1,1,0),(220,'course_hide_tools','course_maintenance','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Maintenance',1,1,0),(221,'course_hide_tools','course_setting','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'CourseSettings',1,1,0),(222,'enabled_support_pixlr',NULL,'radio','Tools','false','EnabledPixlrTitle','EnabledPixlrComment',NULL,NULL,1,0,0),(223,'show_groups_to_users',NULL,'radio','Session','false','ShowGroupsToUsersTitle','ShowGroupsToUsersComment',NULL,NULL,1,0,0),(224,'accessibility_font_resize',NULL,'radio','Platform','false','EnableAccessibilityFontResizeTitle','EnableAccessibilityFontResizeComment',NULL,NULL,1,1,0),(225,'hide_courses_in_sessions',NULL,'radio','Session','false','HideCoursesInSessionsTitle','HideCoursesInSessionsComment','platform',NULL,1,1,0),(226,'enable_quiz_scenario',NULL,'radio','Course','true','EnableQuizScenarioTitle','EnableQuizScenarioComment',NULL,NULL,1,1,0),(227,'filter_terms',NULL,'textarea','Security','','FilterTermsTitle','FilterTermsComment',NULL,NULL,1,0,0),(228,'header_extra_content',NULL,'textarea','Tracking','','HeaderExtraContentTitle','HeaderExtraContentComment',NULL,NULL,1,1,0),(229,'footer_extra_content',NULL,'textarea','Tracking','','FooterExtraContentTitle','FooterExtraContentComment',NULL,NULL,1,1,0),(230,'show_documents_preview',NULL,'radio','Tools','false','ShowDocumentPreviewTitle','ShowDocumentPreviewComment',NULL,NULL,1,1,0),(231,'htmlpurifier_wiki',NULL,'radio','Editor','false','HtmlPurifierWikiTitle','HtmlPurifierWikiComment',NULL,NULL,1,0,0),(232,'cas_activate',NULL,'radio','CAS','false','CasMainActivateTitle','CasMainActivateComment',NULL,NULL,1,0,1),(233,'cas_server',NULL,'textfield','CAS','','CasMainServerTitle','CasMainServerComment',NULL,NULL,1,0,1),(234,'cas_server_uri',NULL,'textfield','CAS','','CasMainServerURITitle','CasMainServerURIComment',NULL,NULL,1,0,1),(235,'cas_port',NULL,'textfield','CAS','','CasMainPortTitle','CasMainPortComment',NULL,NULL,1,0,1),(236,'cas_protocol',NULL,'radio','CAS','','CasMainProtocolTitle','CasMainProtocolComment',NULL,NULL,1,0,1),(237,'cas_add_user_activate',NULL,'radio','CAS','false','CasUserAddActivateTitle','CasUserAddActivateComment',NULL,NULL,1,0,1),(238,'update_user_info_cas_with_ldap',NULL,'radio','CAS','true','UpdateUserInfoCasWithLdapTitle','UpdateUserInfoCasWithLdapComment',NULL,NULL,1,0,1),(239,'student_page_after_login',NULL,'textfield','Platform','','StudentPageAfterLoginTitle','StudentPageAfterLoginComment',NULL,NULL,1,0,0),(240,'teacher_page_after_login',NULL,'textfield','Platform','','TeacherPageAfterLoginTitle','TeacherPageAfterLoginComment',NULL,NULL,1,0,0),(241,'drh_page_after_login',NULL,'textfield','Platform','','DRHPageAfterLoginTitle','DRHPageAfterLoginComment',NULL,NULL,1,0,0),(242,'sessionadmin_page_after_login',NULL,'textfield','Session','','SessionAdminPageAfterLoginTitle','SessionAdminPageAfterLoginComment',NULL,NULL,1,0,0),(243,'student_autosubscribe',NULL,'textfield','Platform','','StudentAutosubscribeTitle','StudentAutosubscribeComment',NULL,NULL,1,0,0),(244,'teacher_autosubscribe',NULL,'textfield','Platform','','TeacherAutosubscribeTitle','TeacherAutosubscribeComment',NULL,NULL,1,0,0),(245,'drh_autosubscribe',NULL,'textfield','Platform','','DRHAutosubscribeTitle','DRHAutosubscribeComment',NULL,NULL,1,0,0),(246,'sessionadmin_autosubscribe',NULL,'textfield','Session','','SessionadminAutosubscribeTitle','SessionadminAutosubscribeComment',NULL,NULL,1,0,0),(247,'scorm_cumulative_session_time',NULL,'radio','Course','true','ScormCumulativeSessionTimeTitle','ScormCumulativeSessionTimeComment',NULL,NULL,1,0,0),(248,'allow_hr_skills_management',NULL,'radio','Gradebook','true','AllowHRSkillsManagementTitle','AllowHRSkillsManagementComment',NULL,NULL,1,1,0),(249,'enable_help_link',NULL,'radio','Platform','true','EnableHelpLinkTitle','EnableHelpLinkComment',NULL,NULL,1,0,0),(250,'teachers_can_change_score_settings',NULL,'radio','Gradebook','true','TeachersCanChangeScoreSettingsTitle','TeachersCanChangeScoreSettingsComment',NULL,NULL,1,1,0),(251,'allow_users_to_change_email_with_no_password',NULL,'radio','User','false','AllowUsersToChangeEmailWithNoPasswordTitle','AllowUsersToChangeEmailWithNoPasswordComment',NULL,NULL,1,0,0),(252,'show_admin_toolbar',NULL,'radio','Platform','do_not_show','ShowAdminToolbarTitle','ShowAdminToolbarComment',NULL,NULL,1,1,0),(253,'allow_global_chat',NULL,'radio','Platform','true','AllowGlobalChatTitle','AllowGlobalChatComment',NULL,NULL,1,1,0),(254,'languagePriority1',NULL,'radio','Languages','course_lang','LanguagePriority1Title','LanguagePriority1Comment',NULL,NULL,1,0,1),(255,'languagePriority2',NULL,'radio','Languages','user_profil_lang','LanguagePriority2Title','LanguagePriority2Comment',NULL,NULL,1,0,1),(256,'languagePriority3',NULL,'radio','Languages','user_selected_lang','LanguagePriority3Title','LanguagePriority3Comment',NULL,NULL,1,0,1),(257,'languagePriority4',NULL,'radio','Languages','platform_lang','LanguagePriority4Title','LanguagePriority4Comment',NULL,NULL,1,0,1),(258,'login_is_email',NULL,'radio','Platform','false','LoginIsEmailTitle','LoginIsEmailComment',NULL,NULL,1,0,1),(259,'courses_default_creation_visibility',NULL,'radio','Course','2','CoursesDefaultCreationVisibilityTitle','CoursesDefaultCreationVisibilityComment',NULL,NULL,1,1,0),(260,'gradebook_enable_grade_model',NULL,'radio','Gradebook','false','GradebookEnableGradeModelTitle','GradebookEnableGradeModelComment',NULL,NULL,1,1,0),(261,'teachers_can_change_grade_model_settings',NULL,'radio','Gradebook','true','TeachersCanChangeGradeModelSettingsTitle','TeachersCanChangeGradeModelSettingsComment',NULL,NULL,1,1,0),(262,'gradebook_default_weight',NULL,'textfield','Gradebook','100','GradebookDefaultWeightTitle','GradebookDefaultWeightComment',NULL,NULL,1,0,0),(263,'ldap_description',NULL,'radio','LDAP',NULL,'LdapDescriptionTitle','LdapDescriptionComment',NULL,NULL,1,0,1),(264,'shibboleth_description',NULL,'radio','Shibboleth','false','ShibbolethMainActivateTitle','ShibbolethMainActivateComment',NULL,NULL,1,0,0),(265,'facebook_description',NULL,'radio','Facebook','false','FacebookMainActivateTitle','FacebookMainActivateComment',NULL,NULL,1,0,0),(266,'gradebook_locking_enabled',NULL,'radio','Gradebook','false','GradebookEnableLockingTitle','GradebookEnableLockingComment',NULL,NULL,1,0,0),(267,'gradebook_default_grade_model_id',NULL,'select','Gradebook','','GradebookDefaultGradeModelTitle','GradebookDefaultGradeModelComment',NULL,NULL,1,1,0),(268,'allow_session_admins_to_manage_all_sessions',NULL,'radio','Session','false','AllowSessionAdminsToSeeAllSessionsTitle','AllowSessionAdminsToSeeAllSessionsComment',NULL,NULL,1,1,0),(269,'allow_skills_tool',NULL,'radio','Platform','true','AllowSkillsToolTitle','AllowSkillsToolComment',NULL,NULL,1,1,0),(270,'allow_public_certificates',NULL,'radio','Course','false','AllowPublicCertificatesTitle','AllowPublicCertificatesComment',NULL,NULL,1,1,0),(271,'platform_unsubscribe_allowed',NULL,'radio','Platform','false','PlatformUnsubscribeTitle','PlatformUnsubscribeComment',NULL,NULL,1,1,0),(272,'activate_email_template',NULL,'radio','Platform','false','ActivateEmailTemplateTitle','ActivateEmailTemplateComment',NULL,NULL,1,0,0),(273,'enable_iframe_inclusion',NULL,'radio','Editor','false','EnableIframeInclusionTitle','EnableIframeInclusionComment',NULL,NULL,1,1,0),(274,'show_hot_courses',NULL,'radio','Platform','true','ShowHotCoursesTitle','ShowHotCoursesComment',NULL,NULL,1,1,0),(275,'enable_webcam_clip',NULL,'radio','Tools','false','EnableWebCamClipTitle','EnableWebCamClipComment',NULL,NULL,1,0,0),(276,'use_custom_pages',NULL,'radio','Platform','false','UseCustomPagesTitle','UseCustomPagesComment',NULL,NULL,1,1,0),(277,'tool_visible_by_default_at_creation','documents','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Documents',1,1,0),(278,'tool_visible_by_default_at_creation','learning_path','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'LearningPath',1,1,0),(279,'tool_visible_by_default_at_creation','links','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Links',1,1,0),(280,'tool_visible_by_default_at_creation','announcements','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Announcements',1,1,0),(281,'tool_visible_by_default_at_creation','forums','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Forums',1,1,0),(282,'tool_visible_by_default_at_creation','quiz','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Quiz',1,1,0),(283,'tool_visible_by_default_at_creation','gradebook','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Gradebook',1,1,0),(284,'prevent_session_admins_to_manage_all_users',NULL,'radio','Session','false','PreventSessionAdminsToManageAllUsersTitle','PreventSessionAdminsToManageAllUsersComment',NULL,NULL,1,1,0),(285,'documents_default_visibility_defined_in_course',NULL,'radio','Tools','false','DocumentsDefaultVisibilityDefinedInCourseTitle','DocumentsDefaultVisibilityDefinedInCourseComment',NULL,NULL,1,1,0),(286,'enabled_mathjax',NULL,'radio','Editor','false','EnableMathJaxTitle','EnableMathJaxComment',NULL,NULL,1,0,0),(287,'meta_twitter_site',NULL,'textfield','Tracking','','MetaTwitterSiteTitle','MetaTwitterSiteComment',NULL,NULL,1,1,0),(288,'meta_twitter_creator',NULL,'textfield','Tracking','','MetaTwitterCreatorTitle','MetaTwitterCreatorComment',NULL,NULL,1,1,0),(289,'meta_title',NULL,'textfield','Tracking','','MetaTitleTitle','MetaTitleComment',NULL,NULL,1,1,0),(290,'meta_description',NULL,'textfield','Tracking','','MetaDescriptionTitle','MetaDescriptionComment',NULL,NULL,1,1,0),(291,'meta_image_path',NULL,'textfield','Tracking','','MetaImagePathTitle','MetaImagePathComment',NULL,NULL,1,1,0),(292,'allow_teachers_to_create_sessions',NULL,'radio','Session','false','AllowTeachersToCreateSessionsTitle','AllowTeachersToCreateSessionsComment',NULL,NULL,1,0,0),(293,'institution_address',NULL,'textfield','Platform','','InstitutionAddressTitle','InstitutionAddressComment',NULL,NULL,1,1,0),(294,'chamilo_database_version',NULL,'textfield',NULL,'1.11.0.6','DatabaseVersion','',NULL,NULL,1,0,1),(295,'cron_remind_course_finished_activate',NULL,'radio','Crons','false','CronRemindCourseFinishedActivateTitle','CronRemindCourseFinishedActivateComment',NULL,NULL,1,1,0),(296,'cron_remind_course_expiration_frequency',NULL,'textfield','Crons','2','CronRemindCourseExpirationFrequencyTitle','CronRemindCourseExpirationFrequencyComment',NULL,NULL,1,1,0),(297,'cron_remind_course_expiration_activate',NULL,'radio','Crons','false','CronRemindCourseExpirationActivateTitle','CronRemindCourseExpirationActivateComment',NULL,NULL,1,1,0),(298,'allow_coach_feedback_exercises',NULL,'radio','Session','true','AllowCoachFeedbackExercisesTitle','AllowCoachFeedbackExercisesComment',NULL,NULL,1,0,0),(299,'allow_my_files',NULL,'radio','Platform','true','AllowMyFilesTitle','AllowMyFilesComment','',NULL,1,1,0),(300,'ticket_allow_student_add',NULL,'radio','Ticket','false','TicketAllowStudentAddTitle','TicketAllowStudentAddComment',NULL,NULL,1,0,0),(301,'ticket_send_warning_to_all_admins',NULL,'radio','Ticket','false','TicketSendWarningToAllAdminsTitle','TicketSendWarningToAllAdminsComment',NULL,NULL,1,0,0),(302,'ticket_warn_admin_no_user_in_category',NULL,'radio','Ticket','false','TicketWarnAdminNoUserInCategoryTitle','TicketWarnAdminNoUserInCategoryComment',NULL,NULL,1,0,0),(303,'ticket_allow_category_edition',NULL,'radio','Ticket','false','TicketAllowCategoryEditionTitle','TicketAllowCategoryEditionComment',NULL,NULL,1,0,0),(304,'load_term_conditions_section',NULL,'radio','Platform','login','LoadTermConditionsSectionTitle','LoadTermConditionsSectionDescription',NULL,NULL,1,0,0),(305,'show_terms_if_profile_completed',NULL,'radio','Ticket','false','ShowTermsIfProfileCompletedTitle','ShowTermsIfProfileCompletedComment',NULL,NULL,1,0,0),(306,'hide_home_top_when_connected','','radio','Platform','false','HideHomeTopContentWhenLoggedInText','HideHomeTopContentWhenLoggedInComment',NULL,'',1,1,0),(307,'hide_global_announcements_when_not_connected','','radio','Platform','false','HideGlobalAnnouncementsWhenNotLoggedInText','HideGlobalAnnouncementsWhenNotLoggedInComment',NULL,'',1,1,0),(308,'course_creation_use_template','','select_course','Course','','CourseCreationUsesTemplateText','CourseCreationUsesTemplateComment',NULL,'',1,1,0),(309,'allow_strength_pass_checker','','radio','Security','true','EnablePasswordStrengthCheckerText','EnablePasswordStrengthCheckerComment',NULL,'',1,1,0),(310,'allow_captcha','','radio','Security','false','EnableCaptchaText','EnableCaptchaComment',NULL,'',1,1,0),(311,'captcha_number_mistakes_to_block_account','','textfield','Security','5','CaptchaNumberOfMistakesBeforeBlockingAccountText','CaptchaNumberOfMistakesBeforeBlockingAccountComment',NULL,'',1,1,0),(312,'captcha_time_to_block','','textfield','Security','5','CaptchaTimeAccountIsLockedText','CaptchaTimeAccountIsLockedComment',NULL,'',1,1,0),(313,'drh_can_access_all_session_content','','radio','Session','false','DRHAccessToAllSessionContentText','DRHAccessToAllSessionContentComment',NULL,'',1,1,0),(314,'display_groups_forum_in_general_tool','','radio','Tools','true','ShowGroupForaInGeneralToolText','ShowGroupForaInGeneralToolComment',NULL,'',1,1,0),(315,'allow_tutors_to_assign_students_to_session','','radio','Session','false','TutorsCanAssignStudentsToSessionsText','TutorsCanAssignStudentsToSessionsComment',NULL,'',1,1,0),(316,'allow_lp_return_link',NULL,'radio','Course','true','AllowLearningPathReturnLinkTitle','AllowLearningPathReturnLinkComment',NULL,NULL,1,1,0),(317,'hide_scorm_export_link',NULL,'radio','Course','false','HideScormExportLinkTitle','HideScormExportLinkComment',NULL,NULL,1,1,0),(318,'hide_scorm_copy_link',NULL,'radio','Course','false','HideScormCopyLinkTitle','HideScormCopyLinkComment',NULL,NULL,1,1,0),(319,'hide_scorm_pdf_link',NULL,'radio','Course','true','HideScormPdfLinkTitle','HideScormPdfLinkComment',NULL,NULL,1,1,0),(320,'session_days_before_coach_access',NULL,'textfield','Session','0','SessionDaysBeforeCoachAccessTitle','SessionDaysBeforeCoachAccessComment',NULL,NULL,1,1,0),(321,'session_days_after_coach_access',NULL,'textfield','Session','0','SessionDaysAfterCoachAccessTitle','SessionDaysAfterCoachAccessComment',NULL,NULL,1,1,0),(322,'pdf_logo_header',NULL,'radio','Course','false','PdfLogoHeaderTitle','PdfLogoHeaderComment',NULL,NULL,1,1,0),(323,'order_user_list_by_official_code',NULL,'radio','Platform','false','OrderUserListByOfficialCodeTitle','OrderUserListByOfficialCodeComment',NULL,NULL,1,1,0),(324,'email_alert_manager_on_new_quiz',NULL,'radio','Tools','true','AlertManagerOnNewQuizTitle','AlertManagerOnNewQuizComment',NULL,NULL,1,1,0),(325,'show_official_code_exercise_result_list',NULL,'radio','Tools','false','ShowOfficialCodeInExerciseResultListTitle','ShowOfficialCodeInExerciseResultListComment',NULL,NULL,1,1,0),(326,'course_catalog_hide_private',NULL,'radio','Platform','false','HidePrivateCoursesFromCourseCatalogTitle','HidePrivateCoursesFromCourseCatalogComment',NULL,NULL,1,1,0),(327,'catalog_show_courses_sessions',NULL,'radio','Platform','0','CoursesCatalogueShowSessionsTitle','CoursesCatalogueShowSessionsComment',NULL,NULL,1,1,0),(328,'auto_detect_language_custom_pages',NULL,'radio','Platform','true','AutoDetectLanguageCustomPagesTitle','AutoDetectLanguageCustomPagesComment',NULL,NULL,1,1,0),(329,'lp_show_reduced_report',NULL,'radio','Tools','false','LearningPathShowReducedReportTitle','LearningPathShowReducedReportComment',NULL,NULL,1,1,0),(330,'allow_session_course_copy_for_teachers',NULL,'radio','Session','false','AllowSessionCourseCopyForTeachersTitle','AllowSessionCourseCopyForTeachersComment',NULL,NULL,1,1,0),(331,'hide_logout_button',NULL,'radio','Platform','false','HideLogoutButtonTitle','HideLogoutButtonComment',NULL,NULL,1,1,0),(332,'redirect_admin_to_courses_list',NULL,'radio','Platform','false','RedirectAdminToCoursesListTitle','RedirectAdminToCoursesListComment',NULL,NULL,1,1,0),(333,'course_images_in_courses_list',NULL,'radio','Course','true','CourseImagesInCoursesListTitle','CourseImagesInCoursesListComment',NULL,NULL,1,1,0),(334,'student_publication_to_take_in_gradebook',NULL,'radio','Gradebook','first','StudentPublicationSelectionForGradebookTitle','StudentPublicationSelectionForGradebookComment',NULL,NULL,1,1,0),(335,'certificate_filter_by_official_code',NULL,'radio','Gradebook','false','FilterCertificateByOfficialCodeTitle','FilterCertificateByOfficialCodeComment',NULL,NULL,1,1,0),(336,'exercise_max_ckeditors_in_page',NULL,'textfield','Tools','0','MaxCKeditorsOnExerciseResultsPageTitle','MaxCKeditorsOnExerciseResultsPageComment',NULL,NULL,1,1,0),(337,'document_if_file_exists_option',NULL,'radio','Tools','rename','DocumentDefaultOptionIfFileExistsTitle','DocumentDefaultOptionIfFileExistsComment',NULL,NULL,1,1,0),(338,'add_gradebook_certificates_cron_task_enabled',NULL,'radio','Tools','false','GradebookCronTaskGenerationTitle','GradebookCronTaskGenerationComment',NULL,NULL,1,1,0),(339,'openbadges_backpack',NULL,'textfield','Gradebook','https://backpack.openbadges.org/','OpenBadgesBackpackUrlTitle','OpenBadgesBackpackUrlComment',NULL,NULL,1,1,0),(340,'cookie_warning',NULL,'radio','Tools','false','CookieWarningTitle','CookieWarningComment',NULL,NULL,1,1,0),(341,'hide_course_group_if_no_tools_available',NULL,'radio','Tools','false','HideCourseGroupIfNoToolAvailableTitle','HideCourseGroupIfNoToolAvailableComment',NULL,NULL,1,1,0),(342,'catalog_allow_session_auto_subscription',NULL,'radio','Session','false','CatalogueAllowSessionAutoSubscriptionTitle','CatalogueAllowSessionAutoSubscriptionTitle',NULL,NULL,1,1,0),(343,'registration.soap.php.decode_utf8',NULL,'radio','Platform','false','SoapRegistrationDecodeUtf8Title','SoapRegistrationDecodeUtf8Comment',NULL,NULL,1,1,0),(344,'allow_delete_attendance',NULL,'radio','Tools','true','AttendanceDeletionEnableTitle','AttendanceDeletionEnableComment',NULL,NULL,1,1,0),(345,'gravatar_enabled',NULL,'radio','Platform','false','GravatarPicturesTitle','GravatarPicturesComment',NULL,NULL,1,1,0),(346,'gravatar_type',NULL,'radio','Platform','mm','GravatarPicturesTypeTitle','GravatarPicturesTypeComment',NULL,NULL,1,1,0),(347,'limit_session_admin_role',NULL,'radio','Session','false','SessionAdminPermissionsLimitTitle','SessionAdminPermissionsLimitComment',NULL,NULL,1,1,0),(348,'show_session_description',NULL,'radio','Session','false','ShowSessionDescriptionTitle','ShowSessionDescriptionComment',NULL,NULL,1,1,0),(349,'hide_certificate_export_link_students',NULL,'radio','Gradebook','false','CertificateHideExportLinkStudentTitle','CertificateHideExportLinkStudentComment',NULL,NULL,1,1,0),(350,'hide_certificate_export_link',NULL,'radio','Gradebook','false','CertificateHideExportLinkTitle','CertificateHideExportLinkComment',NULL,NULL,1,1,0),(351,'dropbox_hide_course_coach',NULL,'radio','Tools','false','DropboxHideCourseCoachTitle','DropboxHideCourseCoachComment',NULL,NULL,1,1,0),(352,'dropbox_hide_general_coach',NULL,'radio','Tools','false','DropboxHideGeneralCoachTitle','DropboxHideGeneralCoachComment',NULL,NULL,1,1,0),(353,'sso_force_redirect',NULL,'radio','Security','false','SSOForceRedirectTitle','SSOForceRedirectComment',NULL,NULL,1,1,0),(354,'session_course_ordering',NULL,'radio','Session','false','SessionCourseOrderingTitle','SessionCourseOrderingComment',NULL,NULL,1,1,0),(355,'gamification_mode',NULL,'radio','Platform','0','GamificationModeTitle','GamificationModeComment',NULL,NULL,1,1,0),(356,'prevent_multiple_simultaneous_login',NULL,'radio','Security','false','PreventMultipleSimultaneousLoginTitle','PreventMultipleSimultaneousLoginComment',NULL,NULL,1,0,0),(357,'gradebook_detailed_admin_view',NULL,'radio','Gradebook','false','ShowAdditionalColumnsInStudentResultsPageTitle','ShowAdditionalColumnsInStudentResultsPageComment',NULL,NULL,1,1,0),(358,'course_catalog_published',NULL,'radio','Course','false','CourseCatalogIsPublicTitle','CourseCatalogIsPublicComment',NULL,NULL,1,0,0),(359,'user_reset_password',NULL,'radio','Security','false','ResetPasswordTokenTitle','ResetPasswordTokenComment',NULL,NULL,1,0,0),(360,'user_reset_password_token_limit',NULL,'textfield','Security','3600','ResetPasswordTokenLimitTitle','ResetPasswordTokenLimitComment',NULL,NULL,1,0,0),(361,'my_courses_view_by_session',NULL,'radio','Session','false','ViewMyCoursesListBySessionTitle','ViewMyCoursesListBySessionComment',NULL,NULL,1,0,0),(362,'show_full_skill_name_on_skill_wheel',NULL,'radio','Platform','false','ShowFullSkillNameOnSkillWheelTitle','ShowFullSkillNameOnSkillWheelComment',NULL,NULL,1,1,0),(363,'messaging_allow_send_push_notification',NULL,'radio','WebServices','false','MessagingAllowSendPushNotificationTitle','MessagingAllowSendPushNotificationComment',NULL,NULL,1,0,0),(364,'messaging_gdc_project_number',NULL,'textfield','WebServices','','MessagingGDCProjectNumberTitle','MessagingGDCProjectNumberComment',NULL,NULL,1,0,0),(365,'messaging_gdc_api_key',NULL,'textfield','WebServices','','MessagingGDCApiKeyTitle','MessagingGDCApiKeyComment',NULL,NULL,1,0,0),(366,'teacher_can_select_course_template',NULL,'radio','Course','true','TeacherCanSelectCourseTemplateTitle','TeacherCanSelectCourseTemplateComment',NULL,NULL,1,0,0),(367,'enable_record_audio',NULL,'radio','Tools','true','EnableRecordAudioTitle','EnableRecordAudioComment',NULL,NULL,1,0,0),(368,'allow_show_skype_account',NULL,'radio','Platform','true','AllowShowSkypeAccountTitle','AllowShowSkypeAccountComment',NULL,NULL,1,1,0),(369,'allow_show_linkedin_url',NULL,'radio','Platform','true','AllowShowLinkedInUrlTitle','AllowShowLinkedInUrlComment',NULL,NULL,1,1,0),(370,'enable_profile_user_address_geolocalization',NULL,'radio','User','false','EnableProfileUsersAddressGeolocalizationTitle','EnableProfileUsersAddressGeolocalizationComment',NULL,NULL,1,0,0),(371,'show_official_code_whoisonline',NULL,'radio','User','false','ShowOfficialCodeInWhoIsOnlinePage','ShowOfficialCodeInWhoIsOnlinePageComment',NULL,NULL,1,0,0),(372,'icons_mode_svg',NULL,'radio','Tuning','false','IconsModeSVGTitle','IconsModeSVGComment','',NULL,1,1,0),(373,'allow_download_documents_by_api_key',NULL,'radio','WebServices','false','AllowDownloadDocumentsByApiKeyTitle','AllowDownloadDocumentsByApiKeyComment','',NULL,1,1,0),(374,'exercise_invisible_in_session',NULL,'radio','Session','false','ExerciseInvisibleInSessionTitle','ExerciseInvisibleInSessionComment','',NULL,1,1,0),(375,'configure_exercise_visibility_in_course',NULL,'radio','Session','false','ConfigureExerciseVisibilityInCourseTitle','ConfigureExerciseVisibilityInCourseComment','',NULL,1,1,0);
/*!40000 ALTER TABLE `settings_current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_options`
--

DROP TABLE IF EXISTS `settings_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_setting_option` (`variable`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_options`
--

LOCK TABLES `settings_options` WRITE;
/*!40000 ALTER TABLE `settings_options` DISABLE KEYS */;
INSERT INTO `settings_options` VALUES (1,'show_administrator_data','true','Yes'),(2,'show_administrator_data','false','No'),(3,'show_tutor_data','true','Yes'),(4,'show_tutor_data','false','No'),(5,'show_teacher_data','true','Yes'),(6,'show_teacher_data','false','No'),(7,'homepage_view','activity','HomepageViewActivity'),(8,'homepage_view','2column','HomepageView2column'),(9,'homepage_view','3column','HomepageView3column'),(10,'homepage_view','vertical_activity','HomepageViewVerticalActivity'),(11,'homepage_view','activity_big','HomepageViewActivityBig'),(12,'show_toolshortcuts','true','Yes'),(13,'show_toolshortcuts','false','No'),(14,'allow_group_categories','true','Yes'),(15,'allow_group_categories','false','No'),(16,'server_type','production','ProductionServer'),(17,'server_type','test','TestServer'),(18,'allow_name_change','true','Yes'),(19,'allow_name_change','false','No'),(20,'allow_officialcode_change','true','Yes'),(21,'allow_officialcode_change','false','No'),(22,'allow_registration','true','Yes'),(23,'allow_registration','false','No'),(24,'allow_registration','approval','AfterApproval'),(25,'allow_registration_as_teacher','true','Yes'),(26,'allow_registration_as_teacher','false','No'),(27,'allow_lostpassword','true','Yes'),(28,'allow_lostpassword','false','No'),(29,'allow_user_headings','true','Yes'),(30,'allow_user_headings','false','No'),(31,'allow_personal_agenda','true','Yes'),(32,'allow_personal_agenda','false','No'),(33,'display_coursecode_in_courselist','true','Yes'),(34,'display_coursecode_in_courselist','false','No'),(35,'display_teacher_in_courselist','true','Yes'),(36,'display_teacher_in_courselist','false','No'),(37,'permanently_remove_deleted_files','true','YesWillDeletePermanently'),(38,'permanently_remove_deleted_files','false','NoWillDeletePermanently'),(39,'dropbox_allow_overwrite','true','Yes'),(40,'dropbox_allow_overwrite','false','No'),(41,'dropbox_allow_just_upload','true','Yes'),(42,'dropbox_allow_just_upload','false','No'),(43,'dropbox_allow_student_to_student','true','Yes'),(44,'dropbox_allow_student_to_student','false','No'),(45,'dropbox_allow_group','true','Yes'),(46,'dropbox_allow_group','false','No'),(47,'dropbox_allow_mailing','true','Yes'),(48,'dropbox_allow_mailing','false','No'),(49,'extended_profile','true','Yes'),(50,'extended_profile','false','No'),(51,'student_view_enabled','true','Yes'),(52,'student_view_enabled','false','No'),(53,'show_navigation_menu','false','No'),(54,'show_navigation_menu','icons','IconsOnly'),(55,'show_navigation_menu','text','TextOnly'),(56,'show_navigation_menu','iconstext','IconsText'),(57,'enable_tool_introduction','true','Yes'),(58,'enable_tool_introduction','false','No'),(59,'page_after_login','index.php','CampusHomepage'),(60,'page_after_login','user_portal.php','MyCourses'),(61,'page_after_login','main/auth/courses.php','CourseCatalog'),(62,'breadcrumbs_course_homepage','get_lang','CourseHomepage'),(63,'breadcrumbs_course_homepage','course_code','CourseCode'),(64,'breadcrumbs_course_homepage','course_title','CourseTitle'),(65,'example_material_course_creation','true','Yes'),(66,'example_material_course_creation','false','No'),(67,'use_session_mode','true','Yes'),(68,'use_session_mode','false','No'),(69,'allow_email_editor','true','Yes'),(70,'allow_email_editor','false','No'),(71,'show_email_addresses','true','Yes'),(72,'show_email_addresses','false','No'),(73,'upload_extensions_list_type','blacklist','Blacklist'),(74,'upload_extensions_list_type','whitelist','Whitelist'),(75,'upload_extensions_skip','true','Remove'),(76,'upload_extensions_skip','false','Rename'),(77,'show_number_of_courses','true','Yes'),(78,'show_number_of_courses','false','No'),(79,'show_empty_course_categories','true','Yes'),(80,'show_empty_course_categories','false','No'),(81,'show_back_link_on_top_of_tree','true','Yes'),(82,'show_back_link_on_top_of_tree','false','No'),(83,'show_different_course_language','true','Yes'),(84,'show_different_course_language','false','No'),(85,'split_users_upload_directory','true','Yes'),(86,'split_users_upload_directory','false','No'),(87,'hide_dltt_markup','false','No'),(88,'hide_dltt_markup','true','Yes'),(89,'display_categories_on_homepage','true','Yes'),(90,'display_categories_on_homepage','false','No'),(91,'default_forum_view','flat','Flat'),(92,'default_forum_view','threaded','Threaded'),(93,'default_forum_view','nested','Nested'),(94,'survey_email_sender_noreply','coach','CourseCoachEmailSender'),(95,'survey_email_sender_noreply','noreply','NoReplyEmailSender'),(96,'openid_authentication','true','Yes'),(97,'openid_authentication','false','No'),(98,'gradebook_enable','true','Yes'),(99,'gradebook_enable','false','No'),(100,'user_selected_theme','true','Yes'),(101,'user_selected_theme','false','No'),(102,'allow_course_theme','true','Yes'),(103,'allow_course_theme','false','No'),(104,'show_closed_courses','true','Yes'),(105,'show_closed_courses','false','No'),(106,'ldap_version','2','LDAPVersion2'),(107,'ldap_version','3','LDAPVersion3'),(108,'add_users_by_coach','true','Yes'),(109,'add_users_by_coach','false','No'),(110,'extend_rights_for_coach','true','Yes'),(111,'extend_rights_for_coach','false','No'),(112,'extend_rights_for_coach_on_survey','true','Yes'),(113,'extend_rights_for_coach_on_survey','false','No'),(114,'show_session_coach','true','Yes'),(115,'show_session_coach','false','No'),(116,'allow_users_to_create_courses','true','Yes'),(117,'allow_users_to_create_courses','false','No'),(118,'breadcrumbs_course_homepage','session_name_and_course_title','SessionNameAndCourseTitle'),(119,'allow_message_tool','true','Yes'),(120,'allow_message_tool','false','No'),(121,'allow_social_tool','true','Yes'),(122,'allow_social_tool','false','No'),(123,'allow_students_to_browse_courses','true','Yes'),(124,'allow_students_to_browse_courses','false','No'),(125,'show_email_of_teacher_or_tutor ','true','Yes'),(126,'show_email_of_teacher_or_tutor ','false','No'),(127,'show_session_data ','true','Yes'),(128,'show_session_data ','false','No'),(129,'allow_use_sub_language','true','Yes'),(130,'allow_use_sub_language','false','No'),(131,'show_glossary_in_documents','none','ShowGlossaryInDocumentsIsNone'),(132,'show_glossary_in_documents','ismanual','ShowGlossaryInDocumentsIsManual'),(133,'show_glossary_in_documents','isautomatic','ShowGlossaryInDocumentsIsAutomatic'),(134,'allow_terms_conditions','true','Yes'),(135,'allow_terms_conditions','false','No'),(136,'search_enabled','true','Yes'),(137,'search_enabled','false','No'),(138,'search_show_unlinked_results','true','SearchShowUnlinkedResults'),(139,'search_show_unlinked_results','false','SearchHideUnlinkedResults'),(140,'show_courses_descriptions_in_catalog','true','Yes'),(141,'show_courses_descriptions_in_catalog','false','No'),(142,'allow_coach_to_edit_course_session','true','Yes'),(143,'allow_coach_to_edit_course_session','false','No'),(144,'show_glossary_in_extra_tools','none','None'),(145,'show_glossary_in_extra_tools','exercise','Exercise'),(146,'show_glossary_in_extra_tools','lp','LearningPaths'),(147,'show_glossary_in_extra_tools','exercise_and_lp','ExerciseAndLearningPath'),(148,'send_email_to_admin_when_create_course','true','Yes'),(149,'send_email_to_admin_when_create_course','false','No'),(150,'go_to_course_after_login','true','Yes'),(151,'go_to_course_after_login','false','No'),(152,'math_asciimathML','true','Yes'),(153,'math_asciimathML','false','No'),(154,'enabled_asciisvg','true','Yes'),(155,'enabled_asciisvg','false','No'),(156,'include_asciimathml_script','true','Yes'),(157,'include_asciimathml_script','false','No'),(158,'youtube_for_students','true','Yes'),(159,'youtube_for_students','false','No'),(160,'block_copy_paste_for_students','true','Yes'),(161,'block_copy_paste_for_students','false','No'),(162,'more_buttons_maximized_mode','true','Yes'),(163,'more_buttons_maximized_mode','false','No'),(164,'students_download_folders','true','Yes'),(165,'students_download_folders','false','No'),(166,'users_copy_files','true','Yes'),(167,'users_copy_files','false','No'),(168,'allow_students_to_create_groups_in_social','true','Yes'),(169,'allow_students_to_create_groups_in_social','false','No'),(170,'allow_send_message_to_all_platform_users','true','Yes'),(171,'allow_send_message_to_all_platform_users','false','No'),(172,'use_users_timezone','true','Yes'),(173,'use_users_timezone','false','No'),(174,'allow_user_course_subscription_by_course_admin','true','Yes'),(175,'allow_user_course_subscription_by_course_admin','false','No'),(176,'show_link_bug_notification','true','Yes'),(177,'show_link_bug_notification','false','No'),(178,'show_link_ticket_notification','true','Yes'),(179,'show_link_ticket_notification','false','No'),(180,'course_validation','true','Yes'),(181,'course_validation','false','No'),(182,'sso_authentication','true','Yes'),(183,'sso_authentication','false','No'),(184,'sso_authentication_protocol','http://','http://'),(185,'sso_authentication_protocol','https://','https://'),(186,'enabled_wiris','true','Yes'),(187,'enabled_wiris','false','No'),(188,'allow_spellcheck','true','Yes'),(189,'allow_spellcheck','false','No'),(190,'force_wiki_paste_as_plain_text','true','Yes'),(191,'force_wiki_paste_as_plain_text','false','No'),(192,'enabled_googlemaps','true','Yes'),(193,'enabled_googlemaps','false','No'),(194,'enabled_imgmap','true','Yes'),(195,'enabled_imgmap','false','No'),(196,'enabled_support_svg','true','Yes'),(197,'enabled_support_svg','false','No'),(198,'pdf_export_watermark_enable','true','Yes'),(199,'pdf_export_watermark_enable','false','No'),(200,'pdf_export_watermark_by_course','true','Yes'),(201,'pdf_export_watermark_by_course','false','No'),(202,'enabled_insertHtml','true','Yes'),(203,'enabled_insertHtml','false','No'),(204,'students_export2pdf','true','Yes'),(205,'students_export2pdf','false','No'),(206,'show_users_folders','true','Yes'),(207,'show_users_folders','false','No'),(208,'show_default_folders','true','Yes'),(209,'show_default_folders','false','No'),(210,'show_chat_folder','true','Yes'),(211,'show_chat_folder','false','No'),(212,'enabled_text2audio','true','Yes'),(213,'enabled_text2audio','false','No'),(214,'enabled_support_pixlr','true','Yes'),(215,'enabled_support_pixlr','false','No'),(216,'show_groups_to_users','true','Yes'),(217,'show_groups_to_users','false','No'),(218,'accessibility_font_resize','true','Yes'),(219,'accessibility_font_resize','false','No'),(220,'hide_courses_in_sessions','true','Yes'),(221,'hide_courses_in_sessions','false','No'),(222,'enable_quiz_scenario','true','Yes'),(223,'enable_quiz_scenario','false','No'),(224,'show_documents_preview','true','Yes'),(225,'show_documents_preview','false','No'),(226,'htmlpurifier_wiki','true','Yes'),(227,'htmlpurifier_wiki','false','No'),(228,'cas_activate','true','Yes'),(229,'cas_activate','false','No'),(230,'cas_protocol','CAS1','CAS1Text'),(231,'cas_protocol','CAS2','CAS2Text'),(232,'cas_protocol','CAS3','CAS3Text'),(233,'cas_protocol','SAML','SAMLText'),(234,'cas_add_user_activate','false','No'),(235,'cas_add_user_activate','platform','casAddUserActivatePlatform'),(236,'cas_add_user_activate','extldap','casAddUserActivateLDAP'),(237,'update_user_info_cas_with_ldap','true','Yes'),(238,'update_user_info_cas_with_ldap','false','No'),(239,'scorm_cumulative_session_time','true','Yes'),(240,'scorm_cumulative_session_time','false','No'),(241,'allow_hr_skills_management','true','Yes'),(242,'allow_hr_skills_management','false','No'),(243,'enable_help_link','true','Yes'),(244,'enable_help_link','false','No'),(245,'allow_users_to_change_email_with_no_password','true','Yes'),(246,'allow_users_to_change_email_with_no_password','false','No'),(247,'show_admin_toolbar','do_not_show','DoNotShow'),(248,'show_admin_toolbar','show_to_admin','ShowToAdminsOnly'),(249,'show_admin_toolbar','show_to_admin_and_teachers','ShowToAdminsAndTeachers'),(250,'show_admin_toolbar','show_to_all','ShowToAllUsers'),(251,'use_custom_pages','true','Yes'),(252,'use_custom_pages','false','No'),(253,'languagePriority1','platform_lang','PlatformLanguage'),(254,'languagePriority1','user_profil_lang','UserLanguage'),(255,'languagePriority1','user_selected_lang','UserSelectedLanguage'),(256,'languagePriority1','course_lang','CourseLanguage'),(257,'languagePriority2','platform_lang','PlatformLanguage'),(258,'languagePriority2','user_profil_lang','UserLanguage'),(259,'languagePriority2','user_selected_lang','UserSelectedLanguage'),(260,'languagePriority2','course_lang','CourseLanguage'),(261,'languagePriority3','platform_lang','PlatformLanguage'),(262,'languagePriority3','user_profil_lang','UserLanguage'),(263,'languagePriority3','user_selected_lang','UserSelectedLanguage'),(264,'languagePriority3','course_lang','CourseLanguage'),(265,'languagePriority4','platform_lang','PlatformLanguage'),(266,'languagePriority4','user_profil_lang','UserLanguage'),(267,'languagePriority4','user_selected_lang','UserSelectedLanguage'),(268,'languagePriority4','course_lang','CourseLanguage'),(269,'allow_global_chat','true','Yes'),(270,'allow_global_chat','false','No'),(271,'login_is_email','true','Yes'),(272,'login_is_email','false','No'),(273,'courses_default_creation_visibility','3','OpenToTheWorld'),(274,'courses_default_creation_visibility','2','OpenToThePlatform'),(275,'courses_default_creation_visibility','1','Private'),(276,'courses_default_creation_visibility','0','CourseVisibilityClosed'),(277,'teachers_can_change_score_settings','true','Yes'),(278,'teachers_can_change_score_settings','false','No'),(279,'teachers_can_change_grade_model_settings','true','Yes'),(280,'teachers_can_change_grade_model_settings','false','No'),(281,'gradebook_locking_enabled','true','Yes'),(282,'gradebook_locking_enabled','false','No'),(283,'gradebook_enable_grade_model','true','Yes'),(284,'gradebook_enable_grade_model','false','No'),(285,'allow_session_admins_to_manage_all_sessions','true','Yes'),(286,'allow_session_admins_to_manage_all_sessions','false','No'),(287,'allow_skills_tool','true','Yes'),(288,'allow_skills_tool','false','No'),(289,'allow_public_certificates','true','Yes'),(290,'allow_public_certificates','false','No'),(291,'platform_unsubscribe_allowed','true','Yes'),(292,'platform_unsubscribe_allowed','false','No'),(293,'activate_email_template','true','Yes'),(294,'activate_email_template','false','No'),(295,'enable_iframe_inclusion','true','Yes'),(296,'enable_iframe_inclusion','false','No'),(297,'show_hot_courses','true','Yes'),(298,'show_hot_courses','false','No'),(299,'enable_webcam_clip','true','Yes'),(300,'enable_webcam_clip','false','No'),(301,'prevent_session_admins_to_manage_all_users','true','Yes'),(302,'prevent_session_admins_to_manage_all_users','false','No'),(303,'documents_default_visibility_defined_in_course','true','Yes'),(304,'documents_default_visibility_defined_in_course','false','No'),(305,'enabled_mathjax','true','Yes'),(306,'enabled_mathjax','false','No'),(307,'allow_teachers_to_create_sessions','true','Yes'),(308,'allow_teachers_to_create_sessions','false','No'),(309,'cron_remind_course_finished_activate','false','No'),(310,'cron_remind_course_finished_activate','true','Yes'),(311,'cron_remind_course_expiration_activate','false','No'),(312,'cron_remind_course_expiration_activate','true','Yes'),(313,'allow_coach_feedback_exercises','true','Yes'),(314,'allow_coach_feedback_exercises','false','No'),(315,'allow_my_files','true','Yes'),(316,'allow_my_files','false','No'),(317,'ticket_allow_student_add','true','Yes'),(318,'ticket_allow_student_add','false','No'),(319,'ticket_allow_category_edition','true','Yes'),(320,'ticket_allow_category_edition','false','No'),(321,'ticket_send_warning_to_all_admins','true','Yes'),(322,'ticket_send_warning_to_all_admins','false','No'),(323,'ticket_warn_admin_no_user_in_category','true','Yes'),(324,'ticket_warn_admin_no_user_in_category','false','No'),(325,'load_term_conditions_section','login','Login'),(326,'load_term_conditions_section','course','Course'),(327,'show_terms_if_profile_completed','true','Yes'),(328,'show_terms_if_profile_completed','false','No'),(329,'hide_home_top_when_connected','true','Yes'),(330,'hide_home_top_when_connected','false','No'),(331,'hide_global_announcements_when_not_connected','true','Yes'),(332,'hide_global_announcements_when_not_connected','false','No'),(333,'allow_strength_pass_checker','true','Yes'),(334,'allow_strength_pass_checker','false','No'),(335,'allow_captcha','true','Yes'),(336,'allow_captcha','false','No'),(337,'drh_can_access_all_session_content','true','Yes'),(338,'drh_can_access_all_session_content','false','No'),(339,'display_groups_forum_in_general_tool','true','Yes'),(340,'display_groups_forum_in_general_tool','false','No'),(341,'allow_tutors_to_assign_students_to_session','true','Yes'),(342,'allow_tutors_to_assign_students_to_session','false','No'),(343,'allow_lp_return_link','true','Yes'),(344,'allow_lp_return_link','false','No'),(345,'hide_scorm_export_link','true','Yes'),(346,'hide_scorm_export_link','false','No'),(347,'hide_scorm_copy_link','true','Yes'),(348,'hide_scorm_copy_link','false','No'),(349,'hide_scorm_pdf_link','true','Yes'),(350,'hide_scorm_pdf_link','false','No'),(351,'pdf_logo_header','true','Yes'),(352,'pdf_logo_header','false','No'),(353,'order_user_list_by_official_code','true','Yes'),(354,'order_user_list_by_official_code','false','No'),(355,'email_alert_manager_on_new_quiz','true','Yes'),(356,'email_alert_manager_on_new_quiz','false','No'),(357,'show_official_code_exercise_result_list','true','Yes'),(358,'show_official_code_exercise_result_list','false','No'),(359,'course_catalog_hide_private','true','Yes'),(360,'course_catalog_hide_private','false','No'),(361,'catalog_show_courses_sessions','0','CatalogueShowOnlyCourses'),(362,'catalog_show_courses_sessions','1','CatalogueShowOnlySessions'),(363,'catalog_show_courses_sessions','2','CatalogueShowCoursesAndSessions'),(364,'auto_detect_language_custom_pages','true','Yes'),(365,'auto_detect_language_custom_pages','false','No'),(366,'lp_show_reduced_report','true','Yes'),(367,'lp_show_reduced_report','false','No'),(368,'allow_session_course_copy_for_teachers','true','Yes'),(369,'allow_session_course_copy_for_teachers','false','No'),(370,'hide_logout_button','true','Yes'),(371,'hide_logout_button','false','No'),(372,'redirect_admin_to_courses_list','true','Yes'),(373,'redirect_admin_to_courses_list','false','No'),(374,'course_images_in_courses_list','true','Yes'),(375,'course_images_in_courses_list','false','No'),(376,'student_publication_to_take_in_gradebook','first','First'),(377,'student_publication_to_take_in_gradebook','last','Last'),(378,'certificate_filter_by_official_code','true','Yes'),(379,'certificate_filter_by_official_code','false','No'),(380,'document_if_file_exists_option','rename','Rename'),(381,'document_if_file_exists_option','overwrite','Overwrite'),(382,'add_gradebook_certificates_cron_task_enabled','true','Yes'),(383,'add_gradebook_certificates_cron_task_enabled','false','No'),(384,'cookie_warning','true','Yes'),(385,'cookie_warning','false','No'),(386,'hide_course_group_if_no_tools_available','true','Yes'),(387,'hide_course_group_if_no_tools_available','false','No'),(388,'catalog_allow_session_auto_subscription','true','Yes'),(389,'catalog_allow_session_auto_subscription','false','No'),(390,'registration.soap.php.decode_utf8','true','Yes'),(391,'registration.soap.php.decode_utf8','false','No'),(392,'allow_delete_attendance','true','Yes'),(393,'allow_delete_attendance','false','No'),(394,'gravatar_enabled','true','Yes'),(395,'gravatar_enabled','false','No'),(396,'gravatar_type','mm','mistery-man'),(397,'gravatar_type','identicon','identicon'),(398,'gravatar_type','monsterid','monsterid'),(399,'gravatar_type','wavatar','wavatar'),(400,'limit_session_admin_role','true','Yes'),(401,'limit_session_admin_role','false','No'),(402,'show_session_description','true','Yes'),(403,'show_session_description','false','No'),(404,'hide_certificate_export_link_students','true','Yes'),(405,'hide_certificate_export_link_students','false','No'),(406,'hide_certificate_export_link','true','Yes'),(407,'hide_certificate_export_link','false','No'),(408,'dropbox_hide_course_coach','true','Yes'),(409,'dropbox_hide_course_coach','false','No'),(410,'dropbox_hide_general_coach','true','Yes'),(411,'dropbox_hide_general_coach','false','No'),(412,'sso_force_redirect','true','Yes'),(413,'sso_force_redirect','false','No'),(414,'session_course_ordering','true','Yes'),(415,'session_course_ordering','false','No'),(416,'gamification_mode','1','Yes'),(417,'gamification_mode','0','No'),(418,'prevent_multiple_simultaneous_login','true','Yes'),(419,'prevent_multiple_simultaneous_login','false','No'),(420,'gradebook_detailed_admin_view','true','Yes'),(421,'gradebook_detailed_admin_view','false','No'),(422,'course_catalog_published','true','Yes'),(423,'course_catalog_published','false','No'),(424,'user_reset_password','true','Yes'),(425,'user_reset_password','false','No'),(426,'my_courses_view_by_session','true','Yes'),(427,'my_courses_view_by_session','false','No'),(428,'show_full_skill_name_on_skill_wheel','true','Yes'),(429,'show_full_skill_name_on_skill_wheel','false','No'),(430,'messaging_allow_send_push_notification','true','Yes'),(431,'messaging_allow_send_push_notification','false','No'),(432,'teacher_can_select_course_template','true','Yes'),(433,'teacher_can_select_course_template','false','No'),(434,'enable_record_audio','true','Yes'),(435,'enable_record_audio','false','No'),(436,'allow_show_skype_account','true','Yes'),(437,'allow_show_skype_account','false','No'),(438,'allow_show_linkedin_url','true','Yes'),(439,'allow_show_linkedin_url','false','No'),(440,'enable_profile_user_address_geolocalization','true','Yes'),(441,'enable_profile_user_address_geolocalization','false','No'),(442,'show_official_code_whoisonline','true','Yes'),(443,'show_official_code_whoisonline','false','No'),(444,'icons_mode_svg','true','Yes'),(445,'icons_mode_svg','false','No'),(446,'allow_download_documents_by_api_key','true','Yes'),(447,'allow_download_documents_by_api_key','false','No'),(448,'exercise_invisible_in_session','true','Yes'),(449,'exercise_invisible_in_session','false','No'),(450,'configure_exercise_visibility_in_course','true','Yes'),(451,'configure_exercise_visibility_in_course','false','No');
/*!40000 ALTER TABLE `settings_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_survey`
--

DROP TABLE IF EXISTS `shared_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_survey` (
  `survey_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtitle` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `surveythanks` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`survey_id`),
  UNIQUE KEY `id` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_survey`
--

LOCK TABLES `shared_survey` WRITE;
/*!40000 ALTER TABLE `shared_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_survey_question`
--

DROP TABLE IF EXISTS `shared_survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_survey_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `survey_question` longtext COLLATE utf8_unicode_ci NOT NULL,
  `survey_question_comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `display` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `max_value` int(11) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_survey_question`
--

LOCK TABLES `shared_survey_question` WRITE;
/*!40000 ALTER TABLE `shared_survey_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_survey_question_option`
--

DROP TABLE IF EXISTS `shared_survey_question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_survey_question_option` (
  `question_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `option_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`question_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_survey_question_option`
--

LOCK TABLES `shared_survey_question_option` WRITE;
/*!40000 ALTER TABLE `shared_survey_question_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_survey_question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `access_url_id` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5E3DE477CCFA12B8` (`profile_id`),
  CONSTRAINT `FK_5E3DE477CCFA12B8` FOREIGN KEY (`profile_id`) REFERENCES `skill_level_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,NULL,'Root','root','',1,'',NULL,1,'2021-06-20 22:09:35');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_level`
--

DROP TABLE IF EXISTS `skill_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BFC25F2FCCFA12B8` (`profile_id`),
  CONSTRAINT `FK_BFC25F2FCCFA12B8` FOREIGN KEY (`profile_id`) REFERENCES `skill_level_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_level`
--

LOCK TABLES `skill_level` WRITE;
/*!40000 ALTER TABLE `skill_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_level_profile`
--

DROP TABLE IF EXISTS `skill_level_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_level_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_level_profile`
--

LOCK TABLES `skill_level_profile` WRITE;
/*!40000 ALTER TABLE `skill_level_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_level_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_profile`
--

DROP TABLE IF EXISTS `skill_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_profile`
--

LOCK TABLES `skill_profile` WRITE;
/*!40000 ALTER TABLE `skill_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_gradebook`
--

DROP TABLE IF EXISTS `skill_rel_gradebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_gradebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gradebook_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_gradebook`
--

LOCK TABLES `skill_rel_gradebook` WRITE;
/*!40000 ALTER TABLE `skill_rel_gradebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_rel_gradebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_profile`
--

DROP TABLE IF EXISTS `skill_rel_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_profile`
--

LOCK TABLES `skill_rel_profile` WRITE;
/*!40000 ALTER TABLE `skill_rel_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_rel_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_skill`
--

DROP TABLE IF EXISTS `skill_rel_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_skill`
--

LOCK TABLES `skill_rel_skill` WRITE;
/*!40000 ALTER TABLE `skill_rel_skill` DISABLE KEYS */;
INSERT INTO `skill_rel_skill` VALUES (1,1,0,0,0);
/*!40000 ALTER TABLE `skill_rel_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_user`
--

DROP TABLE IF EXISTS `skill_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `acquired_level` int(11) DEFAULT NULL,
  `acquired_skill_at` datetime NOT NULL,
  `assigned_by` int(11) NOT NULL,
  `argumentation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `argumentation_author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_79D3D95AA76ED395` (`user_id`),
  KEY `IDX_79D3D95A5585C142` (`skill_id`),
  KEY `IDX_79D3D95A591CC992` (`course_id`),
  KEY `IDX_79D3D95A613FECDF` (`session_id`),
  KEY `IDX_79D3D95AF68F11CE` (`acquired_level`),
  KEY `idx_select_cs` (`course_id`,`session_id`),
  KEY `idx_select_s_c_u` (`session_id`,`course_id`,`user_id`),
  KEY `idx_select_sk_u` (`skill_id`,`user_id`),
  CONSTRAINT `FK_79D3D95A5585C142` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`),
  CONSTRAINT `FK_79D3D95A591CC992` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_79D3D95A613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_79D3D95AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_79D3D95AF68F11CE` FOREIGN KEY (`acquired_level`) REFERENCES `skill_level` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_user`
--

LOCK TABLES `skill_rel_user` WRITE;
/*!40000 ALTER TABLE `skill_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_user_comment`
--

DROP TABLE IF EXISTS `skill_rel_user_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_user_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_rel_user_id` int(11) DEFAULT NULL,
  `feedback_giver_id` int(11) DEFAULT NULL,
  `feedback_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback_value` int(11) DEFAULT 1,
  `feedback_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7AE9F6B6484A9317` (`skill_rel_user_id`),
  KEY `IDX_7AE9F6B63AF3B65B` (`feedback_giver_id`),
  KEY `idx_select_su_giver` (`skill_rel_user_id`,`feedback_giver_id`),
  CONSTRAINT `FK_7AE9F6B63AF3B65B` FOREIGN KEY (`feedback_giver_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_7AE9F6B6484A9317` FOREIGN KEY (`skill_rel_user_id`) REFERENCES `skill_rel_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_user_comment`
--

LOCK TABLES `skill_rel_user_comment` WRITE;
/*!40000 ALTER TABLE `skill_rel_user_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_rel_user_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specific_field`
--

DROP TABLE IF EXISTS `specific_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specific_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_specific_field__code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_field`
--

LOCK TABLES `specific_field` WRITE;
/*!40000 ALTER TABLE `specific_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `specific_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specific_field_values`
--

DROP TABLE IF EXISTS `specific_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specific_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `tool_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_field_values`
--

LOCK TABLES `specific_field_values` WRITE;
/*!40000 ALTER TABLE `specific_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `specific_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_announcement`
--

DROP TABLE IF EXISTS `sys_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `visible_teacher` tinyint(1) NOT NULL,
  `visible_student` tinyint(1) NOT NULL,
  `visible_guest` tinyint(1) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_url_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_announcement`
--

LOCK TABLES `sys_announcement` WRITE;
/*!40000 ALTER TABLE `sys_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_calendar`
--

DROP TABLE IF EXISTS `sys_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `access_url_id` int(11) NOT NULL,
  `all_day` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_calendar`
--

LOCK TABLES `sys_calendar` WRITE;
/*!40000 ALTER TABLE `sys_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_template`
--

DROP TABLE IF EXISTS `system_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_template`
--

LOCK TABLES `system_template` WRITE;
/*!40000 ALTER TABLE `system_template` DISABLE KEYS */;
INSERT INTO `system_template` VALUES (1,'TemplateTitleCourseTitle','TemplateTitleCourseTitleDescription','coursetitle.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n    <style type=\"text/css\">\n        .gris_title {\n            color: silver;\n        }\n\n        h1 {\n            text-align: right;\n        }\n    </style>\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"vertical-align: middle; width: 50%;\" colspan=\"1\" rowspan=\"1\">\n            <h1>TITULUS 1<br>\n                <span class=\"gris_title\">TITULUS 2</span><br>\n            </h1>\n        </td>\n        <td style=\"width: 50%;\">\n            <img style=\"width: 100px; height: 100px;\" alt=\"Chamilo logo\" src=\"{COURSE_DIR}images/logo_chamilo.png\">\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p>\n    <br><br>\n</p>\n</body>\n</html>\n'),(2,'TemplateTitleTeacher','TemplateTitleTeacherDescription','yourinstructor.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n    <style type=\"text/css\">\n        .text {\n            font-weight: normal;\n        }\n    </style>\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td></td>\n        <td style=\"height: 33%;\"></td>\n        <td></td>\n    </tr>\n    <tr>\n        <td style=\"width: 25%;\"></td>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: right; font-weight: bold;\"\n            colspan=\"1\" rowspan=\"1\">\n    <span class=\"text\">\n    <br>\n    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis pellentesque.</span>\n        </td>\n        <td style=\"width: 25%; font-weight: bold;\">\n            <img style=\"width: 180px; height: 241px;\" alt=\"trainer\" src=\"{COURSE_DIR}images/trainer/trainer_case.png \">\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p>\n    <br><br>\n</p>\n</body>\n</html>\n'),(3,'TemplateTitleLeftList','TemplateTitleListLeftListDescription','leftlist.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"width: 66%;\"></td>\n        <td style=\"vertical-align: bottom; width: 33%;\" colspan=\"1\" rowspan=\"4\">&nbsp;<img\n                style=\"width: 180px; height: 248px;\" alt=\"trainer\"\n                src=\"{COURSE_DIR}images/trainer/trainer_reads.png \"><br>\n        </td>\n    </tr>\n    <tr align=\"right\">\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 66%;\">\n            Lorem\n            ipsum dolor sit amet.\n        </td>\n    </tr>\n    <tr align=\"right\">\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 66%;\">\n            Vivamus\n            a quam.&nbsp;<br>\n        </td>\n    </tr>\n    <tr align=\"right\">\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 66%;\">\n            Proin\n            a est stibulum ante ipsum.\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(4,'TemplateTitleLeftRightList','TemplateTitleLeftRightListDescription','leftrightlist.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; height: 400px; width: 720px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td></td>\n        <td style=\"vertical-align: top;\" colspan=\"1\" rowspan=\"4\">&nbsp;<img style=\"width: 180px; height: 294px;\"\n                                                                            alt=\"Trainer\"\n                                                                            src=\"{COURSE_DIR}images/trainer/trainer_join_hands.png \"><br>\n        </td>\n        <td></td>\n    </tr>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: right;\">\n            Lorem\n            ipsum dolor sit amet.\n        </td>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: left;\">\n            Convallis\n            ut.&nbsp;Cras dui magna.\n        </td>\n    </tr>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: right;\">\n            Vivamus\n            a quam.&nbsp;<br>\n        </td>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: left;\">\n            Etiam\n            lacinia stibulum ante.<br>\n        </td>\n    </tr>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: right;\">\n            Proin\n            a est stibulum ante ipsum.\n        </td>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: left;\">\n            Consectetuer\n            adipiscing elit. <br>\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(5,'TemplateTitleRightList','TemplateTitleRightListDescription','rightlist.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body style=\"direction: ltr;\">\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"vertical-align: bottom; width: 50%;\" colspan=\"1\" rowspan=\"4\"><img\n                style=\"width: 300px; height: 199px;\" alt=\"trainer\"\n                src=\"{COURSE_DIR}images/trainer/trainer_points_right.png\"><br>\n        </td>\n        <td style=\"width: 50%;\"></td>\n    </tr>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; text-align: left; width: 50%;\">\n            Convallis\n            ut.&nbsp;Cras dui magna.\n        </td>\n    </tr>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; text-align: left; width: 50%;\">\n            Etiam\n            lacinia.<br>\n        </td>\n    </tr>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; text-align: left; width: 50%;\">\n            Consectetuer\n            adipiscing elit. <br>\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(6,'TemplateTitleDiagram','TemplateTitleDiagramDescription','diagram.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; text-align: left; height: 33%; width: 33%;\">\n            <br>\n            Etiam\n            lacinia stibulum ante.\n            Convallis\n            ut.&nbsp;Cras dui magna.\n        </td>\n        <td colspan=\"1\" rowspan=\"3\">\n            <img style=\"width: 350px; height: 267px;\" alt=\"Alaska chart\"\n                 src=\"{COURSE_DIR}images/diagrams/alaska_chart.png \"></td>\n    </tr>\n    <tr>\n        <td colspan=\"1\" rowspan=\"1\">\n            <img style=\"width: 300px; height: 199px;\" alt=\"trainer\"\n                 src=\"{COURSE_DIR}images/trainer/trainer_points_right.png \"></td>\n    </tr>\n    <tr>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(7,'TemplateTitleDesc','TemplateTitleCheckListDescription','description.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"width: 50%; vertical-align: top;\">\n            <img style=\"width: 48px; height: 49px; float: left;\" alt=\"01\" src=\"{COURSE_DIR}images/small/01.png \"\n                 hspace=\"5\"><br>Lorem ipsum dolor sit amet<br><br><br>\n            <img style=\"width: 48px; height: 49px; float: left;\" alt=\"02\" src=\"{COURSE_DIR}images/small/02.png \"\n                 hspace=\"5\">\n            <br>Ut enim ad minim veniam<br><br><br>\n            <img style=\"width: 48px; height: 49px; float: left;\" alt=\"03\" src=\"{COURSE_DIR}images/small/03.png \"\n                 hspace=\"5\">Duis aute irure dolor in reprehenderit<br><br><br>\n            <img style=\"width: 48px; height: 49px; float: left;\" alt=\"04\" src=\"{COURSE_DIR}images/small/04.png \"\n                 hspace=\"5\">Neque porro quisquam est\n        </td>\n\n        <td style=\"vertical-align: top; width: 50%; text-align: right;\" colspan=\"1\" rowspan=\"1\">\n            <img style=\"width: 300px; height: 291px;\" alt=\"Gearbox\" src=\"{COURSE_DIR}images/diagrams/gearbox.jpg \"><br>\n        </td>\n    </tr>\n    <tr></tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(8,'TemplateTitleCycle','TemplateTitleCycleDescription','cyclechart.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n    <style>\n        .title {\n            color: white;\n            font-weight: bold;\n        }\n    </style>\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"8\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"text-align: center; vertical-align: bottom; height: 10%;\" colspan=\"3\" rowspan=\"1\">\n            <img style=\"width: 250px; height: 76px;\" alt=\"arrow\" src=\"{COURSE_DIR}images/diagrams/top_arrow.png \">\n        </td>\n    </tr>\n    <tr>\n        <td style=\"height: 5%; width: 45%; vertical-align: top; background-color: rgb(153, 153, 153); text-align: center;\">\n            <span class=\"title\">Lorem ipsum</span>\n        </td>\n        <td style=\"height: 5%; width: 10%;\"></td>\n        <td style=\"height: 5%; vertical-align: top; background-color: rgb(153, 153, 153); text-align: center;\">\n            <span class=\"title\">Sed ut perspiciatis</span>\n        </td>\n    </tr>\n    <tr>\n        <td style=\"background-color: rgb(204, 204, 255); width: 45%; vertical-align: top;\">\n            <ul>\n                <li>dolor sit amet</li>\n                <li>consectetur adipisicing elit</li>\n                <li>sed do eiusmod tempor&nbsp;</li>\n                <li>adipisci velit, sed quia non numquam</li>\n                <li>eius modi tempora incidunt ut labore et dolore magnam</li>\n            </ul>\n        </td>\n        <td style=\"width: 10%;\"></td>\n        <td style=\"background-color: rgb(204, 204, 255); width: 45%; vertical-align: top;\">\n            <ul>\n                <li>ut enim ad minim veniam</li>\n                <li>quis nostrud exercitation</li>\n                <li>ullamco laboris nisi ut</li>\n                <li> Quis autem vel eum iure reprehenderit qui in ea</li>\n                <li>voluptate velit esse quam nihil molestiae consequatur,</li>\n            </ul>\n        </td>\n    </tr>\n    <tr align=\"center\">\n        <td style=\"height: 10%; vertical-align: top;\" colspan=\"3\" rowspan=\"1\">\n            <img style=\"width: 250px; height: 76px;\" alt=\"arrow\" src=\"{COURSE_DIR}images/diagrams/bottom_arrow.png \">&nbsp;&nbsp;\n            &nbsp; &nbsp; &nbsp;\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(9,'TemplateTitleTimeline','TemplateTitleTimelineDescription','phasetimeline.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n    <style>\n        .title {\n            font-weight: bold;\n            text-align: center;\n        }\n    </style>\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"8\" cellspacing=\"5\">\n    <tbody>\n    <tr class=\"title\">\n        <td style=\"vertical-align: top; height: 3%; background-color: rgb(224, 224, 224);\">Lorem ipsum</td>\n        <td style=\"height: 3%;\"></td>\n        <td style=\"vertical-align: top; height: 3%; background-color: rgb(237, 237, 237);\">Perspiciatis</td>\n        <td style=\"height: 3%;\"></td>\n        <td style=\"vertical-align: top; height: 3%; background-color: rgb(245, 245, 245);\">Nemo enim</td>\n    </tr>\n    <tr>\n        <td style=\"vertical-align: top; width: 30%; background-color: rgb(224, 224, 224);\">\n            <ul>\n                <li>dolor sit amet</li>\n                <li>consectetur</li>\n                <li>adipisicing elit</li>\n            </ul>\n            <br>\n        </td>\n        <td>\n            <img style=\"width: 32px; height: 32px;\" alt=\"arrow\" src=\"{COURSE_DIR}images/small/arrow.png \">\n        </td>\n        <td style=\"vertical-align: top; width: 30%; background-color: rgb(237, 237, 237);\">\n            <ul>\n                <li>ut labore</li>\n                <li>et dolore</li>\n                <li>magni dolores</li>\n            </ul>\n        </td>\n        <td>\n            <img style=\"width: 32px; height: 32px;\" alt=\"arrow\" src=\"{COURSE_DIR}images/small/arrow.png \">\n        </td>\n        <td style=\"vertical-align: top; background-color: rgb(245, 245, 245); width: 30%;\">\n            <ul>\n                <li>neque porro</li>\n                <li>quisquam est</li>\n                <li>qui dolorem&nbsp;&nbsp;</li>\n            </ul>\n            <br><br>\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(10,'TemplateTitleTable','TemplateTitleCheckListDescription','table.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n    <style type=\"text/css\">\n        .title {\n            font-weight: bold;\n            text-align: center;\n        }\n\n        .items {\n            text-align: right;\n        }\n    </style>\n</head>\n<body>\n<br/>\n<h2>A table</h2>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px;\"\n       border=\"1\" cellpadding=\"5\" cellspacing=\"0\">\n    <tbody>\n    <tr class=\"title\">\n        <td>City</td>\n        <td>2005</td>\n        <td>2006</td>\n        <td>2007</td>\n        <td>2008</td>\n    </tr>\n    <tr class=\"items\">\n        <td>Lima</td>\n        <td>10,40</td>\n        <td>8,95</td>\n        <td>9,19</td>\n        <td>9,76</td>\n    </tr>\n    <tr class=\"items\">\n        <td>New York</td>\n        <td>18,39</td>\n        <td>17,52</td>\n        <td>16,57</td>\n        <td>16,60</td>\n    </tr>\n    <tr class=\"items\">\n        <td>Barcelona</td>\n        <td>0,10</td>\n        <td>0,10</td>\n        <td>0,05</td>\n        <td>0,05</td>\n    </tr>\n    <tr class=\"items\">\n        <td>Paris</td>\n        <td>3,38</td>\n        <td>3,63</td>\n        <td>3,63</td>\n        <td>3,54</td>\n    </tr>\n    </tbody>\n</table>\n<br>\n</body>\n</html>\n'),(11,'TemplateTitleAudio','TemplateTitleAudioDescription','audiocomment.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td>\n            <div align=\"center\">\n    <span style=\"text-align: center;\">\n        <embed type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\"\n               width=\"300\" height=\"20\" bgcolor=\"#FFFFFF\" src=\"{REL_PATH}main/inc/lib/mediaplayer/player.swf\"\n               allowfullscreen=\"false\" allowscriptaccess=\"always\"\n               flashvars=\"file={COURSE_DIR}audio/ListeningComprehension.mp3&amp;autostart=true\"></embed>\n    </span></div>\n\n            <br>\n        </td>\n        <td colspan=\"1\" rowspan=\"3\"><br>\n            <img style=\"width: 300px; height: 341px; float: right;\" alt=\"image\"\n                 src=\"{COURSE_DIR}images/diagrams/head_olfactory_nerve.png \"><br></td>\n    </tr>\n    <tr>\n        <td colspan=\"1\" rowspan=\"1\">\n            <img style=\"width: 180px; height: 271px;\" alt=\"trainer\"\n                 src=\"{COURSE_DIR}images/trainer/trainer_glasses.png\"><br></td>\n    </tr>\n    <tr>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(12,'TemplateTitleVideo','TemplateTitleVideoDescription','video.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"width: 50%; vertical-align: top;\">\n            <div style=\"text-align: center;\" id=\"player810625-parent\">\n                <div style=\"border-style: none; overflow: hidden; width: 320px; height: 240px; background-color: rgb(220, 220, 220);\">\n                    <div id=\"player810625\">\n                        <div id=\"player810625-config\"\n                             style=\"overflow: hidden; display: none; visibility: hidden; width: 0px; height: 0px;\">\n                            url={REL_PATH}main/default_course_document/video/flv/example.flv width=320 height=240\n                            loop=false play=false downloadable=false fullscreen=true displayNavigation=true\n                            displayDigits=true align=left dispPlaylist=none playlistThumbs=false\n                        </div>\n                    </div>\n                    <embed\n                            type=\"application/x-shockwave-flash\"\n                            src=\"{REL_PATH}main/inc/lib/mediaplayer/player.swf\"\n                            width=\"320\"\n                            height=\"240\"\n                            id=\"single\"\n                            name=\"single\"\n                            quality=\"high\"\n                            allowfullscreen=\"true\"\n                            flashvars=\"width=320&height=240&autostart=false&file={REL_PATH}main/default_course_document/video/flv/example.flv&repeat=false&image=&showdownload=false&link={REL_PATH}main/default_course_document/video/flv/example.flv&showdigits=true&shownavigation=true&logo=\"\n                    />\n                </div>\n            </div>\n        </td>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 50%;\">\n            <h3><br>\n            </h3>\n            <h3>Lorem ipsum dolor sit amet</h3>\n            <ul>\n                <li>consectetur adipisicing elit</li>\n                <li>sed do eiusmod tempor incididunt</li>\n                <li>ut labore et dolore magna aliqua</li>\n            </ul>\n            <h3>Ut enim ad minim veniam</h3>\n            <ul>\n                <li>quis nostrud exercitation ullamco</li>\n                <li>laboris nisi ut aliquip ex ea commodo consequat</li>\n                <li>Excepteur sint occaecat cupidatat non proident</li>\n            </ul>\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n<style type=\"text/css\">body {\n}</style><!-- to fix a strange bug appearing with firefox when editing this template -->\n</body>\n</html>\n'),(13,'TemplateTitleFlash','TemplateTitleFlashDescription','flash.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 100%; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td align=\"center\">\n            <embed width=\"700\" height=\"300\" type=\"application/x-shockwave-flash\"\n                   pluginspage=\"http://www.macromedia.com/go/getflashplayer\"\n                   src=\"{COURSE_DIR}flash/SpinEchoSequence.swf\" play=\"true\" loop=\"true\" menu=\"true\"></embed>\n            </span><br/>\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n');
/*!40000 ALTER TABLE `system_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `ref_doc` int(11) NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_assigned_log`
--

DROP TABLE IF EXISTS `ticket_assigned_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_assigned_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `assigned_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_54B65868700047D2` (`ticket_id`),
  KEY `IDX_54B65868A76ED395` (`user_id`),
  CONSTRAINT `FK_54B65868700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket_ticket` (`id`),
  CONSTRAINT `FK_54B65868A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_assigned_log`
--

LOCK TABLES `ticket_assigned_log` WRITE;
/*!40000 ALTER TABLE `ticket_assigned_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_assigned_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_category`
--

DROP TABLE IF EXISTS `ticket_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_tickets` int(11) NOT NULL,
  `course_required` tinyint(1) NOT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `sys_insert_datetime` datetime NOT NULL,
  `sys_lastedit_user_id` int(11) DEFAULT NULL,
  `sys_lastedit_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8325E540166D1F9C` (`project_id`),
  CONSTRAINT `FK_8325E540166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `ticket_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_category`
--

LOCK TABLES `ticket_category` WRITE;
/*!40000 ALTER TABLE `ticket_category` DISABLE KEYS */;
INSERT INTO `ticket_category` VALUES (1,1,'Enrollment','Tickets about enrollment',0,0,1,'2021-06-20 19:09:35',NULL,NULL),(2,1,'General information','Tickets about general information',0,0,1,'2021-06-20 19:09:35',NULL,NULL),(3,1,'Requests and paperwork','Tickets about requests and paperwork',0,0,1,'2021-06-20 19:09:35',NULL,NULL),(4,1,'Academic Incidents','Tickets about academic incidents, like exams, practices, tasks, etc.',0,0,1,'2021-06-20 19:09:35',NULL,NULL),(5,1,'Virtual campus','Tickets about virtual campus',0,0,1,'2021-06-20 19:09:35',NULL,NULL),(6,1,'Online evaluation','Tickets about online evaluation',0,1,1,'2021-06-20 19:09:35',NULL,NULL);
/*!40000 ALTER TABLE `ticket_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_category_rel_user`
--

DROP TABLE IF EXISTS `ticket_category_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_category_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5B8A98712469DE2` (`category_id`),
  KEY `IDX_5B8A987A76ED395` (`user_id`),
  CONSTRAINT `FK_5B8A98712469DE2` FOREIGN KEY (`category_id`) REFERENCES `ticket_category` (`id`),
  CONSTRAINT `FK_5B8A987A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_category_rel_user`
--

LOCK TABLES `ticket_category_rel_user` WRITE;
/*!40000 ALTER TABLE `ticket_category_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_category_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_message`
--

DROP TABLE IF EXISTS `ticket_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `sys_insert_datetime` datetime NOT NULL,
  `sys_lastedit_user_id` int(11) DEFAULT NULL,
  `sys_lastedit_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BA71692D700047D2` (`ticket_id`),
  CONSTRAINT `FK_BA71692D700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_message`
--

LOCK TABLES `ticket_message` WRITE;
/*!40000 ALTER TABLE `ticket_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_message_attachments`
--

DROP TABLE IF EXISTS `ticket_message_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_message_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` longtext COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `sys_insert_datetime` datetime NOT NULL,
  `sys_lastedit_user_id` int(11) DEFAULT NULL,
  `sys_lastedit_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_70BF9E26700047D2` (`ticket_id`),
  KEY `IDX_70BF9E26537A1329` (`message_id`),
  CONSTRAINT `FK_70BF9E26537A1329` FOREIGN KEY (`message_id`) REFERENCES `ticket_message` (`id`),
  CONSTRAINT `FK_70BF9E26700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_message_attachments`
--

LOCK TABLES `ticket_message_attachments` WRITE;
/*!40000 ALTER TABLE `ticket_message_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_message_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_priority`
--

DROP TABLE IF EXISTS `ticket_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urgency` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `sys_insert_datetime` datetime NOT NULL,
  `sys_lastedit_user_id` int(11) DEFAULT NULL,
  `sys_lastedit_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_priority`
--

LOCK TABLES `ticket_priority` WRITE;
/*!40000 ALTER TABLE `ticket_priority` DISABLE KEYS */;
INSERT INTO `ticket_priority` VALUES (1,'Normal','NRM',NULL,'','',1,'2021-06-20 19:09:35',NULL,NULL),(2,'High','HGH',NULL,'','',1,'2021-06-20 19:09:35',NULL,NULL),(3,'Low','LOW',NULL,'','',1,'2021-06-20 19:09:35',NULL,NULL);
/*!40000 ALTER TABLE `ticket_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_project`
--

DROP TABLE IF EXISTS `ticket_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other_area` int(11) DEFAULT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `sys_insert_datetime` datetime NOT NULL,
  `sys_lastedit_user_id` int(11) DEFAULT NULL,
  `sys_lastedit_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_project`
--

LOCK TABLES `ticket_project` WRITE;
/*!40000 ALTER TABLE `ticket_project` DISABLE KEYS */;
INSERT INTO `ticket_project` VALUES (1,'Ticket System',NULL,NULL,NULL,1,'2021-06-20 19:09:35',NULL,NULL);
/*!40000 ALTER TABLE `ticket_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_status`
--

DROP TABLE IF EXISTS `ticket_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_status`
--

LOCK TABLES `ticket_status` WRITE;
/*!40000 ALTER TABLE `ticket_status` DISABLE KEYS */;
INSERT INTO `ticket_status` VALUES (1,'NAT','New',NULL),(2,'PND','Pending',NULL),(3,'XCF','Unconfirmed',NULL),(4,'CLS','Close',NULL),(5,'REE','Forwarded',NULL);
/*!40000 ALTER TABLE `ticket_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_ticket`
--

DROP TABLE IF EXISTS `ticket_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `personal_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `assigned_last_user` int(11) DEFAULT NULL,
  `total_messages` int(11) NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `sys_insert_datetime` datetime NOT NULL,
  `sys_lastedit_user_id` int(11) DEFAULT NULL,
  `sys_lastedit_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EDE2C768166D1F9C` (`project_id`),
  KEY `IDX_EDE2C76812469DE2` (`category_id`),
  KEY `IDX_EDE2C768497B19F9` (`priority_id`),
  KEY `IDX_EDE2C768591CC992` (`course_id`),
  KEY `IDX_EDE2C768613FECDF` (`session_id`),
  KEY `IDX_EDE2C7686BF700BD` (`status_id`),
  CONSTRAINT `FK_EDE2C76812469DE2` FOREIGN KEY (`category_id`) REFERENCES `ticket_category` (`id`),
  CONSTRAINT `FK_EDE2C768166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `ticket_project` (`id`),
  CONSTRAINT `FK_EDE2C768497B19F9` FOREIGN KEY (`priority_id`) REFERENCES `ticket_priority` (`id`),
  CONSTRAINT `FK_EDE2C768591CC992` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_EDE2C768613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_EDE2C7686BF700BD` FOREIGN KEY (`status_id`) REFERENCES `ticket_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_ticket`
--

LOCK TABLES `ticket_ticket` WRITE;
/*!40000 ALTER TABLE `ticket_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_course_ranking`
--

DROP TABLE IF EXISTS `track_course_ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_course_ranking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  `accesses` int(11) NOT NULL,
  `total_score` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tcc_cid` (`c_id`),
  KEY `idx_tcc_sid` (`session_id`),
  KEY `idx_tcc_urlid` (`url_id`),
  KEY `idx_tcc_creation_date` (`creation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_course_ranking`
--

LOCK TABLES `track_course_ranking` WRITE;
/*!40000 ALTER TABLE `track_course_ranking` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_course_ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_access`
--

DROP TABLE IF EXISTS `track_e_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_user_id` int(11) DEFAULT NULL,
  `access_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `access_tool` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_session_id` int(11) NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`access_id`),
  KEY `access_user_id` (`access_user_id`),
  KEY `access_c_id` (`c_id`),
  KEY `access_session_id` (`access_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_access`
--

LOCK TABLES `track_e_access` WRITE;
/*!40000 ALTER TABLE `track_e_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_attempt`
--

DROP TABLE IF EXISTS `track_e_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exe_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher_comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `marks` double NOT NULL,
  `c_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `tms` datetime DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course` (`c_id`),
  KEY `exe_id` (`exe_id`),
  KEY `user_id` (`user_id`),
  KEY `question_id` (`question_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_attempt`
--

LOCK TABLES `track_e_attempt` WRITE;
/*!40000 ALTER TABLE `track_e_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_attempt_coeff`
--

DROP TABLE IF EXISTS `track_e_attempt_coeff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_attempt_coeff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attempt_id` int(11) NOT NULL,
  `marks_coeff` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_attempt_coeff`
--

LOCK TABLES `track_e_attempt_coeff` WRITE;
/*!40000 ALTER TABLE `track_e_attempt_coeff` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_attempt_coeff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_attempt_recording`
--

DROP TABLE IF EXISTS `track_e_attempt_recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_attempt_recording` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exe_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `marks` int(11) NOT NULL,
  `insert_date` datetime NOT NULL,
  `author` int(11) NOT NULL,
  `teacher_comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exe_id` (`exe_id`),
  KEY `question_id` (`question_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_attempt_recording`
--

LOCK TABLES `track_e_attempt_recording` WRITE;
/*!40000 ALTER TABLE `track_e_attempt_recording` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_attempt_recording` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_course_access`
--

DROP TABLE IF EXISTS `track_e_course_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_course_access` (
  `course_access_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_course_date` datetime NOT NULL,
  `logout_course_date` datetime DEFAULT NULL,
  `counter` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`course_access_id`),
  KEY `course` (`c_id`),
  KEY `user_id` (`user_id`),
  KEY `login_course_date` (`login_course_date`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_course_access`
--

LOCK TABLES `track_e_course_access` WRITE;
/*!40000 ALTER TABLE `track_e_course_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_course_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_default`
--

DROP TABLE IF EXISTS `track_e_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_default` (
  `default_id` int(11) NOT NULL AUTO_INCREMENT,
  `default_user_id` int(11) NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `default_date` datetime DEFAULT NULL,
  `default_event_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_value_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`default_id`),
  KEY `course` (`c_id`),
  KEY `session` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_default`
--

LOCK TABLES `track_e_default` WRITE;
/*!40000 ALTER TABLE `track_e_default` DISABLE KEYS */;
INSERT INTO `track_e_default` VALUES (1,0,0,'2021-06-20 19:09:35','user_created','user_id','1',0),(2,0,0,'2021-06-20 19:09:35','user_created','user_id','2',0);
/*!40000 ALTER TABLE `track_e_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_downloads`
--

DROP TABLE IF EXISTS `track_e_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_downloads` (
  `down_id` int(11) NOT NULL AUTO_INCREMENT,
  `down_user_id` int(11) DEFAULT NULL,
  `down_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `down_doc_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `down_session_id` int(11) NOT NULL,
  PRIMARY KEY (`down_id`),
  KEY `idx_ted_user_id` (`down_user_id`),
  KEY `idx_ted_c_id` (`c_id`),
  KEY `down_session_id` (`down_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_downloads`
--

LOCK TABLES `track_e_downloads` WRITE;
/*!40000 ALTER TABLE `track_e_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_exercises`
--

DROP TABLE IF EXISTS `track_e_exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_exercises` (
  `exe_id` int(11) NOT NULL AUTO_INCREMENT,
  `exe_user_id` int(11) DEFAULT NULL,
  `exe_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `exe_exo_id` int(11) NOT NULL,
  `exe_result` double NOT NULL,
  `exe_weighting` double NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `data_tracking` longtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `steps_counter` smallint(6) NOT NULL,
  `session_id` smallint(6) NOT NULL,
  `orig_lp_id` int(11) NOT NULL,
  `orig_lp_item_id` int(11) NOT NULL,
  `exe_duration` int(11) NOT NULL,
  `expired_time_control` datetime DEFAULT NULL,
  `orig_lp_item_view_id` int(11) NOT NULL,
  `questions_to_check` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`exe_id`),
  KEY `idx_tee_user_id` (`exe_user_id`),
  KEY `idx_tee_c_id` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_exercises`
--

LOCK TABLES `track_e_exercises` WRITE;
/*!40000 ALTER TABLE `track_e_exercises` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_hotpotatoes`
--

DROP TABLE IF EXISTS `track_e_hotpotatoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_hotpotatoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exe_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exe_user_id` int(11) DEFAULT NULL,
  `exe_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `exe_result` smallint(6) NOT NULL,
  `exe_weighting` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tehp_user_id` (`exe_user_id`),
  KEY `idx_tehp_c_id` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_hotpotatoes`
--

LOCK TABLES `track_e_hotpotatoes` WRITE;
/*!40000 ALTER TABLE `track_e_hotpotatoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_hotpotatoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_hotspot`
--

DROP TABLE IF EXISTS `track_e_hotspot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_hotspot` (
  `hotspot_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotspot_user_id` int(11) NOT NULL,
  `hotspot_course_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `hotspot_exe_id` int(11) NOT NULL,
  `hotspot_question_id` int(11) NOT NULL,
  `hotspot_answer_id` int(11) NOT NULL,
  `hotspot_correct` tinyint(1) NOT NULL,
  `hotspot_coordinate` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hotspot_id`),
  KEY `hotspot_course_code` (`hotspot_course_code`),
  KEY `hotspot_user_id` (`hotspot_user_id`),
  KEY `hotspot_exe_id` (`hotspot_exe_id`),
  KEY `hotspot_question_id` (`hotspot_question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_hotspot`
--

LOCK TABLES `track_e_hotspot` WRITE;
/*!40000 ALTER TABLE `track_e_hotspot` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_hotspot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_item_property`
--

DROP TABLE IF EXISTS `track_e_item_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_item_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `item_property_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `progress` int(11) NOT NULL,
  `lastedit_date` datetime NOT NULL,
  `lastedit_user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`,`item_property_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_item_property`
--

LOCK TABLES `track_e_item_property` WRITE;
/*!40000 ALTER TABLE `track_e_item_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_item_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_lastaccess`
--

DROP TABLE IF EXISTS `track_e_lastaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_lastaccess` (
  `access_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_user_id` int(11) DEFAULT NULL,
  `access_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `access_tool` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`access_id`),
  KEY `access_user_id` (`access_user_id`),
  KEY `access_c_id` (`c_id`),
  KEY `access_session_id` (`access_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_lastaccess`
--

LOCK TABLES `track_e_lastaccess` WRITE;
/*!40000 ALTER TABLE `track_e_lastaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_lastaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_links`
--

DROP TABLE IF EXISTS `track_e_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_links` (
  `links_id` int(11) NOT NULL AUTO_INCREMENT,
  `links_user_id` int(11) DEFAULT NULL,
  `links_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `links_link_id` int(11) NOT NULL,
  `links_session_id` int(11) NOT NULL,
  PRIMARY KEY (`links_id`),
  KEY `idx_tel_c_id` (`c_id`),
  KEY `idx_tel_user_id` (`links_user_id`),
  KEY `links_session_id` (`links_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_links`
--

LOCK TABLES `track_e_links` WRITE;
/*!40000 ALTER TABLE `track_e_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_login`
--

DROP TABLE IF EXISTS `track_e_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_user_id` int(11) NOT NULL,
  `login_date` datetime NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `logout_date` datetime DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  KEY `login_user_id` (`login_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_login`
--

LOCK TABLES `track_e_login` WRITE;
/*!40000 ALTER TABLE `track_e_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_online`
--

DROP TABLE IF EXISTS `track_e_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_online` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_user_id` int(11) NOT NULL,
  `login_date` datetime NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `c_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `access_url_id` int(11) NOT NULL,
  PRIMARY KEY (`login_id`),
  KEY `course` (`c_id`),
  KEY `login_user_id` (`login_user_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_online`
--

LOCK TABLES `track_e_online` WRITE;
/*!40000 ALTER TABLE `track_e_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_open`
--

DROP TABLE IF EXISTS `track_e_open`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_open` (
  `open_id` int(11) NOT NULL AUTO_INCREMENT,
  `open_remote_host` longtext COLLATE utf8_unicode_ci NOT NULL,
  `open_agent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `open_referer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `open_date` datetime NOT NULL,
  PRIMARY KEY (`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_open`
--

LOCK TABLES `track_e_open` WRITE;
/*!40000 ALTER TABLE `track_e_open` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_open` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_uploads`
--

DROP TABLE IF EXISTS `track_e_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_uploads` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_user_id` int(11) DEFAULT NULL,
  `upload_date` datetime NOT NULL,
  `upload_cours_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `upload_work_id` int(11) NOT NULL,
  `upload_session_id` int(11) NOT NULL,
  PRIMARY KEY (`upload_id`),
  KEY `course` (`c_id`),
  KEY `upload_user_id` (`upload_user_id`),
  KEY `upload_cours_id` (`upload_cours_id`),
  KEY `upload_session_id` (`upload_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_uploads`
--

LOCK TABLES `track_e_uploads` WRITE;
/*!40000 ALTER TABLE `track_e_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_stored_values`
--

DROP TABLE IF EXISTS `track_stored_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_stored_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sco_id` int(11) NOT NULL,
  `course_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sv_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `sv_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`sco_id`,`course_id`,`sv_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_stored_values`
--

LOCK TABLES `track_stored_values` WRITE;
/*!40000 ALTER TABLE `track_stored_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_stored_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_stored_values_stack`
--

DROP TABLE IF EXISTS `track_stored_values_stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_stored_values_stack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sco_id` int(11) NOT NULL,
  `stack_order` int(11) NOT NULL,
  `course_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sv_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `sv_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`sco_id`,`course_id`,`sv_key`,`stack_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_stored_values_stack`
--

LOCK TABLES `track_stored_values_stack` WRITE;
/*!40000 ALTER TABLE `track_stored_values_stack` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_stored_values_stack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `lastname` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `profile_completed` tinyint(1) DEFAULT NULL,
  `auth_source` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `official_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture_uri` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `competences` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `diplomas` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `openarea` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `teach` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `productions` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_date` datetime NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hr_dept_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),
  KEY `idx_user_uid` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'admin','admin','webmaster@localhost.localdomain','webmaster@localhost.localdomain',0,1,0,0,NULL,NULL,'Doe','John','f09008b8bb52b9571581741610a74a38','(000) 001 02 03','','W.PX2U1xNQcAmhqfa.PJ.Cw1qr8.RlcxtSgnWhb6gs4',NULL,NULL,NULL,NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',NULL,'platform',1,'ADMIN','',0,NULL,NULL,NULL,NULL,NULL,'english','2021-06-20 19:09:35',NULL,1,NULL,NULL,0),(2,2,'anon','anon','anonymous@example.com','anonymous@example.com',0,1,0,0,NULL,NULL,'Anonymous','Joe','20a1ad37fd9a4d7918af367282a6f032','','','T6F6ArBAiMwePAll11NZ0trw9MSYPaZAHUboGSHmcNc',NULL,NULL,NULL,NULL,NULL,'a:0:{}',NULL,'platform',6,'anonymous','',0,NULL,NULL,NULL,NULL,NULL,'english','2021-06-20 19:09:35',NULL,1,NULL,NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_key`
--

DROP TABLE IF EXISTS `user_api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `api_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `api_service` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `api_end_point` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_api_keys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_key`
--

LOCK TABLES `user_api_key` WRITE;
/*!40000 ALTER TABLE `user_api_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_course_category`
--

DROP TABLE IF EXISTS `user_course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_c_cat_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_course_category`
--

LOCK TABLES `user_course_category` WRITE;
/*!40000 ALTER TABLE `user_course_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_friend_relation_type`
--

DROP TABLE IF EXISTS `user_friend_relation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_friend_relation_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_friend_relation_type`
--

LOCK TABLES `user_friend_relation_type` WRITE;
/*!40000 ALTER TABLE `user_friend_relation_type` DISABLE KEYS */;
INSERT INTO `user_friend_relation_type` VALUES (1,'SocialUnknow'),(2,'SocialParent'),(3,'SocialFriend'),(4,'SocialGoodFriend'),(5,'SocialEnemy'),(6,'SocialDeleted');
/*!40000 ALTER TABLE `user_friend_relation_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rel_course_vote`
--

DROP TABLE IF EXISTS `user_rel_course_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rel_course_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ucv_cid` (`c_id`),
  KEY `idx_ucv_uid` (`user_id`),
  KEY `idx_ucv_cuid` (`user_id`,`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rel_course_vote`
--

LOCK TABLES `user_rel_course_vote` WRITE;
/*!40000 ALTER TABLE `user_rel_course_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rel_course_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rel_event_type`
--

DROP TABLE IF EXISTS `user_rel_event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rel_event_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `event_type_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_name_index` (`event_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rel_event_type`
--

LOCK TABLES `user_rel_event_type` WRITE;
/*!40000 ALTER TABLE `user_rel_event_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rel_event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rel_tag`
--

DROP TABLE IF EXISTS `user_rel_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rel_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_urt_uid` (`user_id`),
  KEY `idx_urt_tid` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rel_tag`
--

LOCK TABLES `user_rel_tag` WRITE;
/*!40000 ALTER TABLE `user_rel_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rel_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rel_user`
--

DROP TABLE IF EXISTS `user_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rel_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  `last_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_rel_user__user` (`user_id`),
  KEY `idx_user_rel_user__friend_user` (`friend_user_id`),
  KEY `idx_user_rel_user__user_friend_user` (`user_id`,`friend_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rel_user`
--

LOCK TABLES `user_rel_user` WRITE;
/*!40000 ALTER TABLE `user_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_type` int(11) NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allow_members_leave_group` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_course`
--

DROP TABLE IF EXISTS `usergroup_rel_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_course`
--

LOCK TABLES `usergroup_rel_course` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_question`
--

DROP TABLE IF EXISTS `usergroup_rel_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  `coefficient` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_question`
--

LOCK TABLES `usergroup_rel_question` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_session`
--

DROP TABLE IF EXISTS `usergroup_rel_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_session`
--

LOCK TABLES `usergroup_rel_session` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_user`
--

DROP TABLE IF EXISTS `usergroup_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `usergroup_id` int(11) DEFAULT NULL,
  `relation_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_739515A9A76ED395` (`user_id`),
  KEY `IDX_739515A9D2112630` (`usergroup_id`),
  CONSTRAINT `FK_739515A9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_739515A9D2112630` FOREIGN KEY (`usergroup_id`) REFERENCES `usergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_user`
--

LOCK TABLES `usergroup_rel_user` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_usergroup`
--

DROP TABLE IF EXISTS `usergroup_rel_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `subgroup_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_usergroup`
--

LOCK TABLES `usergroup_rel_usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (8,'111'),(6,'20160302133200'),(30,'20160304151300'),(22,'20160315155700'),(31,'20160330103045'),(25,'20160331103600'),(33,'20160405112100'),(11,'20160418093800'),(23,'20160418113000'),(5,'20160421112900'),(34,'20160519201900'),(16,'20160603113100'),(3,'20160610142700'),(38,'20160623143200'),(12,'20160628220000'),(4,'20160701110000'),(21,'20160705190000'),(28,'20160705192000'),(7,'20160706145000'),(13,'20160706182000'),(10,'20160712150000'),(9,'20160713180000'),(20,'20160715122300'),(37,'20160727122700'),(1,'20160727155600'),(24,'20160804174600'),(15,'20160808154200'),(29,'20160808160000'),(35,'20160825155200'),(26,'20160907140300'),(32,'20160907150300'),(19,'20160929120000'),(2,'20160930144400'),(14,'20161028123400'),(17,'20170522120000'),(18,'20170608164500'),(27,'20171213092400'),(36,'20171227120000');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-20 22:11:48
