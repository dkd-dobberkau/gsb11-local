-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-ubu2204-log

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
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
	`uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(10) unsigned NOT NULL DEFAULT 0,
	`tstamp` int(10) unsigned NOT NULL DEFAULT 0,
	`crdate` int(10) unsigned NOT NULL DEFAULT 0,
	`deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
	`hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
	`starttime` int(10) unsigned NOT NULL DEFAULT 0,
	`endtime` int(10) unsigned NOT NULL DEFAULT 0,
	`fe_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
	`sorting` int(11) NOT NULL DEFAULT 0,
	`rowDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`editlock` smallint(5) unsigned NOT NULL DEFAULT 0,
	`sys_language_uid` int(11) NOT NULL DEFAULT 0,
	`l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
	`l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
	`l10n_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`l10n_diffsource` mediumblob DEFAULT NULL,
	`t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
	`t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
	`t3ver_state` smallint(6) NOT NULL DEFAULT 0,
	`t3ver_stage` int(11) NOT NULL DEFAULT 0,
	`perms_userid` int(10) unsigned NOT NULL DEFAULT 0,
	`perms_groupid` int(10) unsigned NOT NULL DEFAULT 0,
	`perms_user` smallint(5) unsigned NOT NULL DEFAULT 0,
	`perms_group` smallint(5) unsigned NOT NULL DEFAULT 0,
	`perms_everybody` smallint(5) unsigned NOT NULL DEFAULT 0,
	`SYS_LASTCHANGED` int(10) unsigned NOT NULL DEFAULT 0,
	`shortcut` int(10) unsigned NOT NULL DEFAULT 0,
	`content_from_pid` int(10) unsigned NOT NULL DEFAULT 0,
	`mount_pid` int(10) unsigned NOT NULL DEFAULT 0,
	`tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
	`sitemap_priority` decimal(2,1) NOT NULL DEFAULT 0.5,
	`newsletter` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
	`socialmedia` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
	`breadcrumb` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
	`datetoggle` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
	`highlight` smallint(6) NOT NULL DEFAULT 0,
	`teaser_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`category_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`main_category` smallint(6) NOT NULL DEFAULT 0,
	`doktype` int(10) unsigned NOT NULL DEFAULT 0,
	`title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`TSconfig` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`php_tree_stop` smallint(5) unsigned NOT NULL DEFAULT 0,
	`categories` int(10) unsigned NOT NULL DEFAULT 0,
	`layout` int(10) unsigned NOT NULL DEFAULT 0,
	`extendToSubpages` smallint(5) unsigned NOT NULL DEFAULT 0,
	`nav_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`nav_hide` smallint(5) unsigned NOT NULL DEFAULT 0,
	`subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`target` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`lastUpdated` bigint(20) NOT NULL DEFAULT 0,
	`newUntil` bigint(20) NOT NULL DEFAULT 0,
	`cache_timeout` int(10) unsigned NOT NULL DEFAULT 0,
	`cache_tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`no_search` smallint(5) unsigned NOT NULL DEFAULT 0,
	`shortcut_mode` int(10) unsigned NOT NULL DEFAULT 0,
	`keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`abstract` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`author_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`media` int(10) unsigned NOT NULL DEFAULT 0,
	`is_siteroot` smallint(5) unsigned NOT NULL DEFAULT 0,
	`mount_pid_ol` smallint(6) NOT NULL DEFAULT 0,
	`module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`l18n_cfg` smallint(5) unsigned NOT NULL DEFAULT 0,
	`backend_layout` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`backend_layout_next_level` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`tsconfig_includes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
	`seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`no_index` smallint(5) unsigned NOT NULL DEFAULT 0,
	`no_follow` smallint(5) unsigned NOT NULL DEFAULT 0,
	`sitemap_changefreq` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`canonical_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`og_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`og_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`og_image` int(10) unsigned NOT NULL DEFAULT 0,
	`twitter_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`twitter_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`twitter_image` int(10) unsigned NOT NULL DEFAULT 0,
	`twitter_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	PRIMARY KEY (`uid`),
	KEY `determineSiteRoot` (`is_siteroot`),
	KEY `language_identifier` (`l10n_parent`,`sys_language_uid`),
	KEY `slug` (`slug`(127)),
	KEY `parent` (`pid`,`deleted`,`hidden`),
	KEY `translation_source` (`l10n_source`),
	KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES
(1,0,1769174125,1769174125,0,0,0,0,'',256,'',0,0,0,0,NULL,'',0,0,0,0,1,1,31,31,0,1769174125,0,0,0,0,0.5,'1','1','1','0',0,'',NULL,0,1,'Startseite','/',NULL,0,0,0,0,'',0,'','','',1769174056,0,0,'',0,0,'gsb 11, ITZBund, TYPO3','Informations Technik Zentrum Bund - Government Site Builder (GSB)','Informations Technik Zentrum Bund - Government Site Builder (GSB 11)','','',0,1,0,'',0,'pagets__Default','pagets__OneColArticle','','Startseite',0,0,'','','Government Site Builder - Startseite','Informations Technik Zentrum Bund - Government Site Builder (GSB 11)',1,'Government Site Builder - Startseite','Informations Technik Zentrum Bund - Government Site Builder (GSB 11)',1,'summary_large_image'),
(2,1,1769178432,1769178428,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,31,0,1769178432,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,1,'GSB11','/gsb11',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(3,1,1769185271,1769184957,0,0,0,0,'0',384,NULL,0,0,0,0,NULL,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,31,0,0,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,254,'Informationen','/informationen',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(4,3,1769185161,1769185008,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,31,0,1769185762,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,1,'Suche','/suche',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(5,1,1769185240,1769185236,0,0,0,0,'0',512,NULL,0,0,0,0,NULL,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,31,0,0,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,254,'Kategorien','/kategorien',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(6,3,1769185396,1769185393,0,0,0,0,'0',512,NULL,0,0,0,0,NULL,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,31,0,1769185623,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,1,'Datenschutz','/datenschutz',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(7,1,1769185880,1769185862,0,0,0,0,'0',768,NULL,0,0,0,0,NULL,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,31,0,0,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,254,'Header Meta','/header-meta',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(8,7,1769185932,1769185929,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,31,0,0,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,1,'Leichte Sprache','/leichte-sprache',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(9,7,1769186010,1769186007,0,0,0,0,'0',512,NULL,0,0,0,0,NULL,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,31,0,0,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,1,'Gebärdensprache','/gebaerdensprache',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(10,7,1769186136,1769186111,0,0,0,0,'-1',768,NULL,0,0,0,0,NULL,'{\"abstract\":\"\",\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"breadcrumb\":\"\",\"cache_tags\":\"\",\"cache_timeout\":\"\",\"canonical_link\":\"\",\"categories\":\"\",\"content_from_pid\":\"\",\"datetoggle\":\"\",\"description\":\"\",\"doktype\":\"\",\"editlock\":\"\",\"endtime\":\"\",\"extendToSubpages\":\"\",\"fe_group\":\"\",\"hidden\":\"\",\"is_siteroot\":\"\",\"keywords\":\"\",\"l18n_cfg\":\"\",\"lastUpdated\":\"\",\"layout\":\"\",\"main_category\":\"\",\"media\":\"\",\"module\":\"\",\"nav_hide\":\"\",\"nav_title\":\"\",\"newUntil\":\"\",\"newsletter\":\"\",\"no_follow\":\"\",\"no_index\":\"\",\"no_search\":\"\",\"og_description\":\"\",\"og_image\":\"\",\"og_title\":\"\",\"php_tree_stop\":\"\",\"rowDescription\":\"\",\"seo_title\":\"\",\"sitemap_changefreq\":\"\",\"sitemap_priority\":\"\",\"slug\":\"\",\"socialmedia\":\"\",\"starttime\":\"\",\"subtitle\":\"\",\"target\":\"\",\"teaser_description\":\"\",\"title\":\"\",\"tsconfig_includes\":\"\",\"twitter_card\":\"\",\"twitter_description\":\"\",\"twitter_image\":\"\",\"twitter_title\":\"\"}',0,0,0,0,1,1,31,31,0,1769186545,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,1,'Anmelden','/anmelden',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(11,1,1769186274,1769186255,0,0,0,0,'0',640,NULL,0,0,0,0,NULL,'{\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"categories\":\"\",\"doktype\":\"\",\"editlock\":\"\",\"hidden\":\"\",\"main_category\":\"\",\"media\":\"\",\"module\":\"\",\"rowDescription\":\"\",\"slug\":\"\",\"teaser_description\":\"\",\"title\":\"\",\"tsconfig_includes\":\"\"}',0,0,0,0,1,1,31,31,0,0,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,254,'Webseiten Benutzer','/webseiten-benutzer',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'fe_users',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(12,7,1769186558,1769186405,0,0,0,0,'-2',1024,NULL,0,0,0,0,NULL,'{\"abstract\":\"\",\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"breadcrumb\":\"\",\"cache_tags\":\"\",\"cache_timeout\":\"\",\"canonical_link\":\"\",\"categories\":\"\",\"content_from_pid\":\"\",\"datetoggle\":\"\",\"description\":\"\",\"doktype\":\"\",\"editlock\":\"\",\"endtime\":\"\",\"extendToSubpages\":\"\",\"fe_group\":\"\",\"hidden\":\"\",\"is_siteroot\":\"\",\"keywords\":\"\",\"l18n_cfg\":\"\",\"lastUpdated\":\"\",\"layout\":\"\",\"main_category\":\"\",\"media\":\"\",\"module\":\"\",\"nav_hide\":\"\",\"nav_title\":\"\",\"newUntil\":\"\",\"newsletter\":\"\",\"no_follow\":\"\",\"no_index\":\"\",\"no_search\":\"\",\"og_description\":\"\",\"og_image\":\"\",\"og_title\":\"\",\"php_tree_stop\":\"\",\"rowDescription\":\"\",\"seo_title\":\"\",\"sitemap_changefreq\":\"\",\"sitemap_priority\":\"\",\"slug\":\"\",\"socialmedia\":\"\",\"starttime\":\"\",\"subtitle\":\"\",\"target\":\"\",\"teaser_description\":\"\",\"title\":\"\",\"tsconfig_includes\":\"\",\"twitter_card\":\"\",\"twitter_description\":\"\",\"twitter_image\":\"\",\"twitter_title\":\"\"}',0,0,0,0,1,1,31,31,0,0,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,1,'Abmelden','/abmelden',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(13,1,1769186967,1769186764,0,0,0,0,'',320,NULL,0,0,0,0,NULL,'{\"abstract\":\"\",\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"breadcrumb\":\"\",\"cache_tags\":\"\",\"cache_timeout\":\"\",\"categories\":\"\",\"content_from_pid\":\"\",\"datetoggle\":\"\",\"description\":\"\",\"doktype\":\"\",\"editlock\":\"\",\"endtime\":\"\",\"extendToSubpages\":\"\",\"fe_group\":\"\",\"hidden\":\"\",\"is_siteroot\":\"\",\"keywords\":\"\",\"l18n_cfg\":\"\",\"lastUpdated\":\"\",\"layout\":\"\",\"main_category\":\"\",\"media\":\"\",\"module\":\"\",\"nav_hide\":\"\",\"nav_title\":\"\",\"newUntil\":\"\",\"newsletter\":\"\",\"no_follow\":\"\",\"no_index\":\"\",\"no_search\":\"\",\"og_description\":\"\",\"og_image\":\"\",\"og_title\":\"\",\"php_tree_stop\":\"\",\"rowDescription\":\"\",\"seo_title\":\"\",\"sitemap_changefreq\":\"\",\"sitemap_priority\":\"\",\"slug\":\"\",\"socialmedia\":\"\",\"starttime\":\"\",\"subtitle\":\"\",\"target\":\"\",\"teaser_description\":\"\",\"title\":\"\",\"tsconfig_includes\":\"\",\"twitter_card\":\"\",\"twitter_description\":\"\",\"twitter_image\":\"\",\"twitter_title\":\"\"}',0,0,0,0,1,1,31,31,0,1769187050,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,1,'Seite nicht gefunden','/seite-nicht-gefunden',NULL,0,0,0,0,'',1,'','','',0,0,0,'',0,0,'Seite nicht gefunden','Seite nicht gefunden','Seite nicht gefunden','','',0,0,0,'',0,'','','','Seite nicht gefunden',1,1,'','','Seite nicht gefunden','Seite nicht gefunden',0,'Seite nicht gefunden','Seite nicht gefunden',0,'summary'),
(14,3,1769187451,1769187165,0,0,0,0,'',128,NULL,0,0,0,0,NULL,'{\"abstract\":\"\",\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"breadcrumb\":\"\",\"cache_tags\":\"\",\"cache_timeout\":\"\",\"canonical_link\":\"\",\"categories\":\"\",\"content_from_pid\":\"\",\"datetoggle\":\"\",\"description\":\"\",\"doktype\":\"\",\"editlock\":\"\",\"endtime\":\"\",\"extendToSubpages\":\"\",\"fe_group\":\"\",\"hidden\":\"\",\"is_siteroot\":\"\",\"keywords\":\"\",\"l18n_cfg\":\"\",\"lastUpdated\":\"\",\"layout\":\"\",\"main_category\":\"\",\"media\":\"\",\"module\":\"\",\"nav_hide\":\"\",\"nav_title\":\"\",\"newUntil\":\"\",\"newsletter\":\"\",\"no_follow\":\"\",\"no_index\":\"\",\"no_search\":\"\",\"og_description\":\"\",\"og_image\":\"\",\"og_title\":\"\",\"php_tree_stop\":\"\",\"rowDescription\":\"\",\"seo_title\":\"\",\"sitemap_changefreq\":\"\",\"sitemap_priority\":\"\",\"slug\":\"\",\"socialmedia\":\"\",\"starttime\":\"\",\"subtitle\":\"\",\"target\":\"\",\"teaser_description\":\"\",\"title\":\"\",\"tsconfig_includes\":\"\",\"twitter_card\":\"\",\"twitter_description\":\"\",\"twitter_image\":\"\",\"twitter_title\":\"\"}',0,0,0,0,1,1,31,31,0,1769187451,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,1,'Inhaltsverzeichnis','/inhaltsverzeichnis',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'pagets__Default','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(15,2,1769187594,1769187579,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,31,0,1769187594,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,1,'Kategorie','/gsb11/kategorie',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(16,15,1769187659,1769187585,0,0,0,0,'',256,NULL,0,0,0,0,NULL,'{\"abstract\":\"\",\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"breadcrumb\":\"\",\"cache_tags\":\"\",\"cache_timeout\":\"\",\"canonical_link\":\"\",\"categories\":\"\",\"content_from_pid\":\"\",\"datetoggle\":\"\",\"description\":\"\",\"doktype\":\"\",\"editlock\":\"\",\"endtime\":\"\",\"extendToSubpages\":\"\",\"fe_group\":\"\",\"hidden\":\"\",\"is_siteroot\":\"\",\"keywords\":\"\",\"l18n_cfg\":\"\",\"lastUpdated\":\"\",\"layout\":\"\",\"main_category\":\"\",\"media\":\"\",\"module\":\"\",\"nav_hide\":\"\",\"nav_title\":\"\",\"newUntil\":\"\",\"newsletter\":\"\",\"no_follow\":\"\",\"no_index\":\"\",\"no_search\":\"\",\"og_description\":\"\",\"og_image\":\"\",\"og_title\":\"\",\"php_tree_stop\":\"\",\"rowDescription\":\"\",\"seo_title\":\"\",\"sitemap_changefreq\":\"\",\"sitemap_priority\":\"\",\"slug\":\"\",\"socialmedia\":\"\",\"starttime\":\"\",\"subtitle\":\"\",\"target\":\"\",\"teaser_description\":\"\",\"title\":\"\",\"tsconfig_includes\":\"\",\"twitter_card\":\"\",\"twitter_description\":\"\",\"twitter_image\":\"\",\"twitter_title\":\"\"}',0,0,0,0,1,1,31,31,0,1769187659,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,1,'Artikel','/gsb11/kategorie/artikel',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(17,16,1769187663,1769187649,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,31,0,1769187663,0,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,1,'Unterseite','/gsb11/kategorie/artikel/unterseite',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(18,15,1769187922,1769187889,0,0,0,0,'',128,NULL,0,0,0,0,NULL,'{\"abstract\":\"\",\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"breadcrumb\":\"\",\"categories\":\"\",\"datetoggle\":\"\",\"doktype\":\"\",\"editlock\":\"\",\"endtime\":\"\",\"extendToSubpages\":\"\",\"fe_group\":\"\",\"hidden\":\"\",\"is_siteroot\":\"\",\"l18n_cfg\":\"\",\"lastUpdated\":\"\",\"layout\":\"\",\"main_category\":\"\",\"media\":\"\",\"nav_hide\":\"\",\"nav_title\":\"\",\"newUntil\":\"\",\"newsletter\":\"\",\"no_search\":\"\",\"php_tree_stop\":\"\",\"rowDescription\":\"\",\"shortcut\":\"\",\"shortcut_mode\":\"\",\"slug\":\"\",\"socialmedia\":\"\",\"starttime\":\"\",\"subtitle\":\"\",\"target\":\"\",\"teaser_description\":\"\",\"title\":\"\",\"tsconfig_includes\":\"\"}',0,0,0,0,1,1,31,31,0,0,15,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,4,'Kategorieübersicht','/gsb11/kategorie/kategorieuebersicht',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(19,2,1769187986,1769187962,0,0,0,0,'',128,NULL,0,0,0,0,NULL,'{\"abstract\":\"\",\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"breadcrumb\":\"\",\"categories\":\"\",\"datetoggle\":\"\",\"doktype\":\"\",\"editlock\":\"\",\"endtime\":\"\",\"extendToSubpages\":\"\",\"fe_group\":\"\",\"hidden\":\"\",\"is_siteroot\":\"\",\"l18n_cfg\":\"\",\"lastUpdated\":\"\",\"layout\":\"\",\"main_category\":\"\",\"media\":\"\",\"nav_hide\":\"\",\"nav_title\":\"\",\"newUntil\":\"\",\"newsletter\":\"\",\"no_search\":\"\",\"php_tree_stop\":\"\",\"rowDescription\":\"\",\"shortcut\":\"\",\"shortcut_mode\":\"\",\"slug\":\"\",\"socialmedia\":\"\",\"starttime\":\"\",\"subtitle\":\"\",\"target\":\"\",\"teaser_description\":\"\",\"title\":\"\",\"tsconfig_includes\":\"\"}',0,0,0,0,1,1,31,31,0,0,2,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,4,'GSB11 Übersicht','/gsb11/gsb11-uebersicht',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,''),
(20,16,1769187997,1769187971,0,0,0,0,'',128,NULL,0,0,0,0,NULL,'{\"abstract\":\"\",\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"breadcrumb\":\"\",\"categories\":\"\",\"datetoggle\":\"\",\"doktype\":\"\",\"editlock\":\"\",\"endtime\":\"\",\"extendToSubpages\":\"\",\"fe_group\":\"\",\"hidden\":\"\",\"is_siteroot\":\"\",\"l18n_cfg\":\"\",\"lastUpdated\":\"\",\"layout\":\"\",\"main_category\":\"\",\"media\":\"\",\"nav_hide\":\"\",\"nav_title\":\"\",\"newUntil\":\"\",\"newsletter\":\"\",\"no_search\":\"\",\"php_tree_stop\":\"\",\"rowDescription\":\"\",\"shortcut\":\"\",\"shortcut_mode\":\"\",\"slug\":\"\",\"socialmedia\":\"\",\"starttime\":\"\",\"subtitle\":\"\",\"target\":\"\",\"teaser_description\":\"\",\"title\":\"\",\"tsconfig_includes\":\"\"}',0,0,0,0,1,1,31,31,0,0,16,0,0,0,0.5,'0','0','0','0',0,NULL,NULL,0,4,'Artikelübersicht','/gsb11/kategorie/artikel/artikeluebersicht',NULL,0,0,0,0,'',0,'','','',0,0,0,'',0,0,NULL,NULL,NULL,'','',0,0,0,'',0,'','','','',0,0,'','','',NULL,0,'',NULL,0,'');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_file` (
	`uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(10) unsigned NOT NULL DEFAULT 0,
	`tstamp` int(10) unsigned NOT NULL DEFAULT 0,
	`last_indexed` int(11) NOT NULL DEFAULT 0,
	`identifier` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`identifier_hash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`folder_hash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`name` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`creation_date` int(11) NOT NULL DEFAULT 0,
	`modification_date` int(11) NOT NULL DEFAULT 0,
	`size` bigint(20) NOT NULL DEFAULT 0,
	`storage` int(10) unsigned NOT NULL DEFAULT 0,
	`type` int(10) unsigned NOT NULL DEFAULT 0,
	`mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`missing` smallint(5) unsigned NOT NULL DEFAULT 0,
	`metadata` int(10) unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`uid`),
	KEY `sel01` (`storage`,`identifier_hash`),
	KEY `folder` (`storage`,`folder_hash`),
	KEY `tstamp` (`tstamp`),
	KEY `lastindex` (`last_indexed`),
	KEY `sha1` (`sha1`),
	KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES
(1,0,1769174016,1769174016,'/user_upload/placeholder_image.jpg','abc4bceca90a8c11808bde86eb87ea4d7f390ef3','19669f1e02c2f16705ec7587044c66443be70725','jpg','placeholder_image.jpg','d4ebf4bcd068c5054d08b9ddca32887d3cb085bb',1769174016,1769174016,73222,1,2,'image/jpeg',0,0);
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_metadata`
--

DROP TABLE IF EXISTS `sys_file_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_file_metadata` (
	`uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(10) unsigned NOT NULL DEFAULT 0,
	`tstamp` int(10) unsigned NOT NULL DEFAULT 0,
	`crdate` int(10) unsigned NOT NULL DEFAULT 0,
	`sys_language_uid` int(11) NOT NULL DEFAULT 0,
	`l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
	`l10n_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`l10n_diffsource` mediumblob DEFAULT NULL,
	`t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
	`t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
	`t3ver_state` smallint(6) NOT NULL DEFAULT 0,
	`t3ver_stage` int(11) NOT NULL DEFAULT 0,
	`title` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`alternative` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`status` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
	`latitude` decimal(24,14) DEFAULT 0.00000000000000,
	`longitude` decimal(24,14) DEFAULT 0.00000000000000,
	`pages` int(10) unsigned DEFAULT 0,
	`is_accessible` smallint(5) unsigned NOT NULL DEFAULT 0,
	`categories` int(10) unsigned NOT NULL DEFAULT 0,
	`file` int(10) unsigned NOT NULL DEFAULT 0,
	`description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`width` int(11) NOT NULL DEFAULT 0,
	`height` int(11) NOT NULL DEFAULT 0,
	`visible` smallint(5) unsigned NOT NULL DEFAULT 1,
	`keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`caption` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`creator_tool` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`download_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`publisher` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`copyright` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`location_country` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`location_region` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`location_city` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`ranking` int(10) unsigned NOT NULL DEFAULT 0,
	`content_creation_date` bigint(20) NOT NULL DEFAULT 0,
	`content_modification_date` bigint(20) NOT NULL DEFAULT 0,
	`note` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`unit` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`duration` int(11) NOT NULL DEFAULT 0,
	`color_space` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`language` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`fe_groups` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	PRIMARY KEY (`uid`),
	KEY `file` (`file`),
	KEY `fal_filelist` (`l10n_parent`,`sys_language_uid`),
	KEY `parent` (`pid`),
	KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_metadata`
--

LOCK TABLES `sys_file_metadata` WRITE;
/*!40000 ALTER TABLE `sys_file_metadata` DISABLE KEYS */;
INSERT INTO `sys_file_metadata` VALUES
(1,0,1769174016,1769174016,0,0,NULL,'',0,0,0,0,NULL,NULL,'',0.00000000000000,0.00000000000000,0,0,0,1,NULL,1920,1080,1,NULL,NULL,'','','','','',NULL,'','','',0,0,0,NULL,'',0,'','',NULL);
/*!40000 ALTER TABLE `sys_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_reference`
--

DROP TABLE IF EXISTS `sys_file_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_file_reference` (
	`uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(10) unsigned NOT NULL DEFAULT 0,
	`tstamp` int(10) unsigned NOT NULL DEFAULT 0,
	`crdate` int(10) unsigned NOT NULL DEFAULT 0,
	`deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
	`hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
	`sys_language_uid` int(11) NOT NULL DEFAULT 0,
	`l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
	`l10n_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`l10n_diffsource` mediumblob DEFAULT NULL,
	`t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
	`t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
	`t3ver_state` smallint(6) NOT NULL DEFAULT 0,
	`t3ver_stage` int(11) NOT NULL DEFAULT 0,
	`uid_local` int(11) NOT NULL DEFAULT 0,
	`title` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`alternative` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`longdesc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`caption` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`outline` smallint(5) unsigned NOT NULL DEFAULT 0,
	`allow_download` smallint(5) unsigned NOT NULL DEFAULT 0,
	`uid_foreign` int(11) NOT NULL DEFAULT 0,
	`tablenames` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`fieldname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`sorting_foreign` int(11) NOT NULL DEFAULT 0,
	`link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`crop` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`autoplay` smallint(5) unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`uid`),
	KEY `tablenames_fieldname` (`tablenames`(32),`fieldname`(12)),
	KEY `deleted` (`deleted`),
	KEY `uid_local` (`uid_local`),
	KEY `uid_foreign` (`uid_foreign`),
	KEY `combined_1` (`l10n_parent`,`t3ver_oid`,`t3ver_wsid`,`t3ver_state`,`deleted`),
	KEY `parent` (`pid`,`deleted`,`hidden`),
	KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_reference`
--

LOCK TABLES `sys_file_reference` WRITE;
/*!40000 ALTER TABLE `sys_file_reference` DISABLE KEYS */;
INSERT INTO `sys_file_reference` VALUES
(1,1,1769174125,1769174125,0,0,0,0,NULL,'',0,0,0,0,1,NULL,NULL,'','',0,0,1,'pages','og_image',1,'',NULL,'{\"social\":{\"cropArea\":{\"x\":0,\"y\":0.03333333333333333,\"width\":1,\"height\":0.9333333333333333},\"selectedRatio\":\"1_91:1\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"xsmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0),
(2,1,1769174125,1769174125,0,0,0,0,NULL,'',0,0,0,0,1,NULL,NULL,'','',0,0,1,'pages','twitter_image',1,'',NULL,'{\"social\":{\"cropArea\":{\"x\":0,\"y\":0.03333333333333333,\"width\":1,\"height\":0.9333333333333333},\"selectedRatio\":\"1_91:1\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"xsmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0);
/*!40000 ALTER TABLE `sys_file_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_storage`
--

DROP TABLE IF EXISTS `sys_file_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_file_storage` (
	`uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(10) unsigned NOT NULL DEFAULT 0,
	`tstamp` int(10) unsigned NOT NULL DEFAULT 0,
	`crdate` int(10) unsigned NOT NULL DEFAULT 0,
	`deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
	`description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`is_public` smallint(6) NOT NULL DEFAULT 0,
	`processingfolder` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`is_browsable` smallint(5) unsigned NOT NULL DEFAULT 1,
	`is_default` smallint(5) unsigned NOT NULL DEFAULT 0,
	`is_writable` smallint(5) unsigned NOT NULL DEFAULT 1,
	`is_online` smallint(5) unsigned NOT NULL DEFAULT 1,
	`auto_extract_metadata` smallint(5) unsigned NOT NULL DEFAULT 1,
	`driver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`configuration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_storage`
--

LOCK TABLES `sys_file_storage` WRITE;
/*!40000 ALTER TABLE `sys_file_storage` DISABLE KEYS */;
INSERT INTO `sys_file_storage` VALUES
(1,0,1769173443,1769173443,0,'This is the local fileadmin/ directory. This storage mount has been created automatically by TYPO3.',1,NULL,'fileadmin',1,1,1,1,1,'Local','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"basePath\">\n                    <value index=\"vDEF\">fileadmin/</value>\n                </field>\n                <field index=\"pathType\">\n                    <value index=\"vDEF\">relative</value>\n                </field>\n                <field index=\"caseSensitive\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>');
/*!40000 ALTER TABLE `sys_file_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_template`
--

DROP TABLE IF EXISTS `sys_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_template` (
	`uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(10) unsigned NOT NULL DEFAULT 0,
	`tstamp` int(10) unsigned NOT NULL DEFAULT 0,
	`crdate` int(10) unsigned NOT NULL DEFAULT 0,
	`deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
	`hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
	`starttime` int(10) unsigned NOT NULL DEFAULT 0,
	`endtime` int(10) unsigned NOT NULL DEFAULT 0,
	`sorting` int(11) NOT NULL DEFAULT 0,
	`description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
	`title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`root` smallint(5) unsigned NOT NULL DEFAULT 0,
	`clear` smallint(5) unsigned NOT NULL DEFAULT 0,
	`constants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`include_static_file` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`basedOn` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`includeStaticAfterBasedOn` smallint(5) unsigned NOT NULL DEFAULT 0,
	`config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`static_file_mode` int(10) unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`uid`),
	KEY `roottemplate` (`deleted`,`hidden`,`root`),
	KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_template`
--

LOCK TABLES `sys_template` WRITE;
/*!40000 ALTER TABLE `sys_template` DISABLE KEYS */;
INSERT INTO `sys_template` VALUES
(1,1,1769178531,1769178531,0,0,0,0,256,'',0,'Startseite',1,0,'','','',0,'',0);
/*!40000 ALTER TABLE `sys_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_content`
--

DROP TABLE IF EXISTS `tt_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tt_content` (
	`uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(10) unsigned NOT NULL DEFAULT 0,
	`tstamp` int(10) unsigned NOT NULL DEFAULT 0,
	`crdate` int(10) unsigned NOT NULL DEFAULT 0,
	`deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
	`hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
	`starttime` int(10) unsigned NOT NULL DEFAULT 0,
	`endtime` int(10) unsigned NOT NULL DEFAULT 0,
	`fe_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
	`sorting` int(11) NOT NULL DEFAULT 0,
	`rowDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`editlock` smallint(5) unsigned NOT NULL DEFAULT 0,
	`sys_language_uid` int(11) NOT NULL DEFAULT 0,
	`l18n_parent` int(10) unsigned NOT NULL DEFAULT 0,
	`l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
	`l10n_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`l18n_diffsource` mediumblob DEFAULT NULL,
	`t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
	`t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
	`t3ver_state` smallint(6) NOT NULL DEFAULT 0,
	`t3ver_stage` int(11) NOT NULL DEFAULT 0,
	`frame_class` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default',
	`colPos` int(10) unsigned NOT NULL DEFAULT 0,
	`table_caption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
	`tx_container_parent` int(11) NOT NULL DEFAULT 0,
	`tx_header_inside` smallint(6) NOT NULL DEFAULT 0,
	`tx_header_style` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_subelements_header_style` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`header_kicker` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`header_kicker_toggle` smallint(6) NOT NULL DEFAULT 0,
	`main_category_overwrite` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`main_category_overwrite_toggle` smallint(6) NOT NULL DEFAULT 0,
	`date_override_toggle` smallint(6) NOT NULL DEFAULT 0,
	`tx_video_caption` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_video_poster_video` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_video_video` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_video_videourl` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_video_a11y_videodescription` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_video_a11y_audiodescription` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_audio_poster` int(10) unsigned NOT NULL DEFAULT 0,
	`tx_audio_audio` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_stage_switch` smallint(6) NOT NULL DEFAULT 0,
	`tx_stage_image` int(10) unsigned NOT NULL DEFAULT 0,
	`tx_stage_video` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_stage_bgcolor` int(11) NOT NULL DEFAULT 0,
	`tx_stage_position` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_stage_bg` int(11) NOT NULL DEFAULT 0,
	`tx_stage_salutation` int(11) NOT NULL DEFAULT 0,
	`tx_banner_image` int(10) unsigned NOT NULL DEFAULT 0,
	`container_tab_open` int(10) unsigned NOT NULL DEFAULT 1,
	`container_accordion_toggle_all` int(10) unsigned NOT NULL DEFAULT 0,
	`container_accordion_toggle` int(10) unsigned NOT NULL DEFAULT 0,
	`container_accordion_open` int(10) unsigned NOT NULL DEFAULT 1,
	`container_headline` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`slider` smallint(6) NOT NULL DEFAULT 0,
	`slider_type` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`slider_columns` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`grid_type` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`grid_columns` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`grid_icon` int(10) unsigned NOT NULL DEFAULT 0,
	`grid_parallax` smallint(6) NOT NULL DEFAULT 0,
	`grid_imgbg` smallint(6) NOT NULL DEFAULT 0,
	`grid_bgimage` int(10) unsigned NOT NULL DEFAULT 0,
	`grid_bottom_image` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`grid_bgcolor` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`grid_bgfullsize` smallint(6) NOT NULL DEFAULT 0,
	`grid_container` smallint(6) NOT NULL DEFAULT 0,
	`grid_light` smallint(6) NOT NULL DEFAULT 0,
	`gallery_layout` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`gallery_columns` int(10) unsigned NOT NULL DEFAULT 0,
	`tx_link` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_link_layout` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_link_text` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_link_position` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_include_rendering` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_include_url` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_include_width` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_include_height` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_include_markup_component` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_include_html_title` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_include_html_name` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`tx_include_banner_image` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`CType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`categories` int(10) unsigned NOT NULL DEFAULT 0,
	`layout` int(10) unsigned NOT NULL DEFAULT 0,
	`space_before_class` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`space_after_class` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`date` bigint(20) NOT NULL DEFAULT 0,
	`header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`header_layout` int(10) unsigned NOT NULL DEFAULT 0,
	`header_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`header_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`subheader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`bodytext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`image` int(10) unsigned NOT NULL DEFAULT 0,
	`assets` int(10) unsigned NOT NULL DEFAULT 0,
	`imagewidth` int(10) unsigned NOT NULL DEFAULT 0,
	`imageheight` int(10) unsigned NOT NULL DEFAULT 0,
	`imageorient` int(10) unsigned NOT NULL DEFAULT 0,
	`imageborder` smallint(5) unsigned NOT NULL DEFAULT 0,
	`image_zoom` smallint(5) unsigned NOT NULL DEFAULT 0,
	`imagecols` int(10) unsigned NOT NULL DEFAULT 0,
	`pages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`recursive` int(10) unsigned NOT NULL DEFAULT 0,
	`list_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`media` int(10) unsigned NOT NULL DEFAULT 0,
	`records` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`sectionIndex` smallint(5) unsigned NOT NULL DEFAULT 1,
	`linkToTop` smallint(5) unsigned NOT NULL DEFAULT 0,
	`pi_flexform` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`selected_categories` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`category_field` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`bullets_type` int(10) unsigned NOT NULL DEFAULT 0,
	`cols` int(10) unsigned NOT NULL DEFAULT 0,
	`table_class` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`table_delimiter` int(10) unsigned NOT NULL DEFAULT 0,
	`table_enclosure` int(10) unsigned NOT NULL DEFAULT 0,
	`table_header_position` int(10) unsigned NOT NULL DEFAULT 0,
	`table_tfoot` smallint(5) unsigned NOT NULL DEFAULT 0,
	`file_collections` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
	`filelink_size` smallint(5) unsigned NOT NULL DEFAULT 0,
	`filelink_sorting` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`filelink_sorting_direction` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`target` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	`uploads_description` smallint(5) unsigned NOT NULL DEFAULT 0,
	`uploads_type` int(10) unsigned NOT NULL DEFAULT 0,
	`tx_image_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`,`sorting`),
	KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
	KEY `language` (`l18n_parent`,`sys_language_uid`),
	KEY `container_parent` (`tx_container_parent`),
	KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_content`
--

LOCK TABLES `tt_content` WRITE;
/*!40000 ALTER TABLE `tt_content` DISABLE KEYS */;
INSERT INTO `tt_content` VALUES
(1,4,1769185762,1769185159,0,0,0,0,'',256,'',0,0,0,0,NULL,'{\"CType\":\"\",\"categories\":\"\",\"colPos\":\"\",\"date\":\"\",\"editlock\":\"\",\"endtime\":\"\",\"fe_group\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_link\":\"\",\"header_position\":\"\",\"hidden\":\"\",\"layout\":\"\",\"rowDescription\":\"\",\"sectionIndex\":\"\",\"space_after_class\":\"\",\"space_before_class\":\"\",\"starttime\":\"\",\"subheader\":\"\",\"tx_container_parent\":\"\",\"tx_header_inside\":\"\",\"tx_header_style\":\"\"}',0,0,0,0,'default',1,NULL,0,0,0,'',NULL,NULL,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,NULL,0,NULL,0,0,0,1,0,0,1,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,0,'gallery-single',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'header',0,0,'','',0,'Verwenden Sie hier Ihr bevorzugten Suche-Plugin oder installieren sie die Extension gsb_solr des GSB11 und verwenden dessen Plugin',2,'','','',NULL,0,0,0,0,0,0,0,1,NULL,0,'',0,NULL,1,0,NULL,NULL,'',0,0,'',124,0,0,0,NULL,1,'','','',1,1,''),
(2,6,1769185476,1769185476,0,0,0,0,'',256,'',0,0,0,0,NULL,'',0,0,0,0,'default',0,NULL,0,0,0,'',NULL,NULL,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,NULL,0,NULL,0,0,0,1,0,0,1,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,0,'gallery-single',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'header',0,0,'medium','medium',0,'Datenschutzerklärung',1,'center','','',NULL,0,0,0,0,0,0,0,1,NULL,0,'',0,NULL,1,0,NULL,NULL,'',0,0,'',124,0,0,0,NULL,1,'','','',1,1,''),
(3,6,1769185623,1769185623,0,0,0,0,'',128,'',0,0,0,0,NULL,'',0,0,0,0,'default',1,NULL,0,0,0,'',NULL,NULL,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,NULL,0,NULL,0,0,0,1,0,0,1,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,0,'gallery-single',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'text',0,1,'','large',0,'Datenschutzerklärung',2,'','','','<p>Ihre Datenschutzerklärung.</p>\r\n<h2>1. Erster Punkt</h2>',0,0,0,0,0,0,0,1,NULL,0,'',0,NULL,1,0,NULL,NULL,'',0,0,'',124,0,0,0,NULL,1,'','','',1,1,''),
(4,8,1769185987,1769185987,0,0,0,0,'',256,'',0,0,0,0,NULL,'',0,0,0,0,'default',0,NULL,0,0,0,'',NULL,NULL,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,NULL,0,NULL,0,0,0,1,0,0,1,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,0,'gallery-single',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'header',0,0,'medium','medium',0,'Leichte Sprache Landingpage',2,'','','',NULL,0,0,0,0,0,0,0,1,NULL,0,'',0,NULL,1,0,NULL,NULL,'',0,0,'',124,0,0,0,NULL,1,'','','',1,1,''),
(5,9,1769186029,1769186029,0,0,0,0,'',256,'',0,0,0,0,NULL,'',0,0,0,0,'default',0,NULL,0,0,0,'',NULL,NULL,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,NULL,0,NULL,0,0,0,1,0,0,1,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,0,'gallery-single',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'header',0,0,'medium','medium',0,'Gebärdensprache Landingpage',2,'','','',NULL,0,0,0,0,0,0,0,1,NULL,0,'',0,NULL,1,0,NULL,NULL,'',0,0,'',124,0,0,0,NULL,1,'','','',1,1,''),
(6,10,1769186545,1769186263,0,0,0,0,'-1',256,'',0,0,0,0,NULL,'{\"CType\":\"\",\"categories\":\"\",\"colPos\":\"\",\"date\":\"\",\"editlock\":\"\",\"endtime\":\"\",\"fe_group\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_link\":\"\",\"header_position\":\"\",\"hidden\":\"\",\"layout\":\"\",\"pi_flexform\":\"\",\"rowDescription\":\"\",\"sectionIndex\":\"\",\"space_after_class\":\"\",\"space_before_class\":\"\",\"starttime\":\"\",\"subheader\":\"\",\"tx_container_parent\":\"\",\"tx_header_inside\":\"\",\"tx_header_style\":\"\"}',0,0,0,0,'default',1,NULL,0,0,0,'',NULL,NULL,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,NULL,0,NULL,0,0,0,1,0,0,1,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,0,'gallery-single',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'felogin_login',0,0,'','',0,'Anmelden',2,'','','',NULL,0,0,0,0,0,0,0,1,NULL,0,'',0,NULL,1,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.showForgotPassword\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.showPermaLogin\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.showLogoutFormAfterLogin\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.pages\">\n                    <value index=\"vDEF\">11</value>\n                </field>\n                <field index=\"settings.recursive\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"s_redirect\">\n            <language index=\"lDEF\">\n                <field index=\"settings.redirectMode\">\n                    <value index=\"vDEF\">login</value>\n                </field>\n                <field index=\"settings.redirectFirstMethod\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.redirectPageLogin\">\n                    <value index=\"vDEF\">12</value>\n                </field>\n                <field index=\"settings.redirectPageLoginError\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.redirectPageLogout\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.redirectDisable\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"s_messages\">\n            <language index=\"lDEF\">\n                <field index=\"settings.welcome_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.welcome_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.success_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.success_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.error_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.error_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.status_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.status_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.logout_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.logout_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.forgot_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.forgot_reset_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',NULL,'',0,0,'',124,0,0,0,NULL,1,'','','',1,1,''),
(7,12,1769186588,1769186481,0,0,0,0,'-2',256,'',0,0,0,0,NULL,'{\"CType\":\"\",\"categories\":\"\",\"colPos\":\"\",\"date\":\"\",\"editlock\":\"\",\"endtime\":\"\",\"fe_group\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_link\":\"\",\"header_position\":\"\",\"hidden\":\"\",\"layout\":\"\",\"pi_flexform\":\"\",\"rowDescription\":\"\",\"sectionIndex\":\"\",\"space_after_class\":\"\",\"space_before_class\":\"\",\"starttime\":\"\",\"subheader\":\"\",\"tx_container_parent\":\"\",\"tx_header_inside\":\"\",\"tx_header_style\":\"\"}',0,0,0,0,'default',1,NULL,0,0,0,'',NULL,NULL,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,NULL,0,NULL,0,0,0,1,0,0,1,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,0,'gallery-single',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'felogin_login',0,0,'','',0,'Abmelden',2,'','','',NULL,0,0,0,0,0,0,0,1,NULL,0,'',0,NULL,1,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.showForgotPassword\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.showPermaLogin\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.showLogoutFormAfterLogin\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.pages\">\n                    <value index=\"vDEF\">11</value>\n                </field>\n                <field index=\"settings.recursive\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"s_redirect\">\n            <language index=\"lDEF\">\n                <field index=\"settings.redirectMode\">\n                    <value index=\"vDEF\">logout</value>\n                </field>\n                <field index=\"settings.redirectFirstMethod\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.redirectPageLogin\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.redirectPageLoginError\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.redirectPageLogout\">\n                    <value index=\"vDEF\">10</value>\n                </field>\n                <field index=\"settings.redirectDisable\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"s_messages\">\n            <language index=\"lDEF\">\n                <field index=\"settings.welcome_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.welcome_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.success_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.success_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.error_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.error_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.status_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.status_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.logout_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.logout_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.forgot_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.forgot_reset_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',NULL,'',0,0,'',124,0,0,0,NULL,1,'','','',1,1,''),
(8,13,1769187050,1769187019,0,0,0,0,'',256,'',0,0,0,0,NULL,'{\"CType\":\"\",\"categories\":\"\",\"colPos\":\"\",\"date\":\"\",\"editlock\":\"\",\"endtime\":\"\",\"fe_group\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_link\":\"\",\"header_position\":\"\",\"hidden\":\"\",\"layout\":\"\",\"rowDescription\":\"\",\"sectionIndex\":\"\",\"space_after_class\":\"\",\"space_before_class\":\"\",\"starttime\":\"\",\"subheader\":\"\",\"tx_container_parent\":\"\",\"tx_header_inside\":\"\",\"tx_header_style\":\"\"}',0,0,0,0,'default',0,NULL,0,0,0,'',NULL,NULL,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,NULL,0,NULL,0,0,0,1,0,0,1,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,0,'gallery-single',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'header',0,0,'large','large',0,'UPS! Seite nicht gefunden!',1,'center','','',NULL,0,0,0,0,0,0,0,1,NULL,0,'',0,NULL,1,0,NULL,NULL,'',0,0,'',124,0,0,0,NULL,1,'','','',1,1,''),
(9,14,1769187247,1769187191,0,0,0,0,'',256,'',0,0,0,0,NULL,'{\"colPos\":\"\",\"tx_container_parent\":\"\"}',0,0,0,0,'default',0,NULL,0,0,0,'',NULL,NULL,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,NULL,0,NULL,0,0,0,1,0,0,1,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,0,'gallery-single',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'header',0,0,'medium','medium',0,'Inhaltsverzeichnis',1,'center','','',NULL,0,0,0,0,0,0,0,1,NULL,0,'',0,NULL,1,0,NULL,NULL,'',0,0,'',124,0,0,0,NULL,1,'','','',1,1,''),
(10,14,1769187400,1769187341,0,0,0,0,'',128,'',0,0,0,0,NULL,'{\"CType\":\"\",\"categories\":\"\",\"colPos\":\"\",\"date\":\"\",\"editlock\":\"\",\"endtime\":\"\",\"fe_group\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_link\":\"\",\"header_position\":\"\",\"hidden\":\"\",\"layout\":\"\",\"pages\":\"\",\"rowDescription\":\"\",\"sectionIndex\":\"\",\"space_after_class\":\"\",\"space_before_class\":\"\",\"starttime\":\"\",\"subheader\":\"\",\"tx_container_parent\":\"\",\"tx_header_inside\":\"\",\"tx_header_style\":\"\"}',0,0,0,0,'default',1,NULL,0,0,0,'',NULL,NULL,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,NULL,0,NULL,0,0,0,1,0,0,1,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,0,'gallery-single',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'menu_sitemap_pages',0,0,'','large',0,'Inhaltsverzeichnis',100,'','','',NULL,0,0,0,0,0,0,0,1,'1',0,'',0,NULL,1,0,NULL,NULL,'',0,0,'',124,0,0,0,NULL,1,'','','',1,1,'');
/*!40000 ALTER TABLE `tt_content` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-26 14:06:56
