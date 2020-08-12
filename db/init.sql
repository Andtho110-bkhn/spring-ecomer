# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.25)
# Database: ecomer
# Generation Time: 2020-08-09 17:26:23 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table app_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_user`;

CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT '0',
  `sso_id` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `status` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sso_id` (`sso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;

INSERT INTO `app_user` (`id`, `school_id`, `sso_id`, `password`, `first_name`, `last_name`, `email`, `status`)
VALUES
	(2,1,'vanhuu','$2a$10$RSiPycV7Joxfhn4EecDczue1/ccNAF50zk6K0aYHBZ2iXVStKrX4K','van','huu','long.huu.100£@gmail.com',1);

/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table app_user_user_profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_user_user_profile`;

CREATE TABLE `app_user_user_profile` (
  `user_id` bigint(20) NOT NULL,
  `user_profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`user_profile_id`),
  KEY `FK_USER_PROFILE` (`user_profile_id`),
  CONSTRAINT `FK_APP_USER` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `FK_USER_PROFILE` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `app_user_user_profile` WRITE;
/*!40000 ALTER TABLE `app_user_user_profile` DISABLE KEYS */;

INSERT INTO `app_user_user_profile` (`user_id`, `user_profile_id`)
VALUES
	(2,1);

/*!40000 ALTER TABLE `app_user_user_profile` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table block_home
# ------------------------------------------------------------

DROP TABLE IF EXISTS `block_home`;

CREATE TABLE `block_home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(10) DEFAULT '0',
  `category` int(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `type` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `icon` varchar(255) DEFAULT '',
  `is_display_icon` int(1) unsigned DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `name`, `status`, `icon`, `is_display_icon`, `created_at`, `updated_at`, `parent_id`)
VALUES
	(2,' Output',1,'iclond',0,'2018-11-09 03:40:35','2018-11-09 10:26:00',0),
	(3,'Coca',1,'iclond',0,'2018-11-09 06:47:20','2018-11-09 10:25:56',0),
	(4,'Lozido',1,'iclond',0,'2018-11-09 06:47:20','2018-11-09 10:25:42',3),
	(5,'HH4B',1,'iclond',0,'2018-11-09 06:47:20','2018-11-09 10:25:49',2),
	(6,'Haza Flex',0,'iclond',0,'2018-11-09 09:51:29','2018-11-09 10:26:05',3);

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT '',
  `value` varchar(255) DEFAULT '',
  `note` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;

INSERT INTO `config` (`id`, `key`, `value`, `note`)
VALUES
	(1,'link_facebook','link_facebook',''),
	(2,'ten_cong_ty','CÔNG TY CỔ PHÀN HCKIDS',''),
	(3,'logo','2763d24fa82ccac3cb34fba675d9c13d.png','');

/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT '',
  `options` varchar(255) DEFAULT '',
  `order_no` int(10) unsigned DEFAULT '0',
  `is_hot` int(1) unsigned DEFAULT '0',
  `is_bot` int(1) DEFAULT '0',
  `status` int(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;

INSERT INTO `menu` (`id`, `label`, `parent_id`, `image`, `options`, `order_no`, `is_hot`, `is_bot`, `status`)
VALUES
	(1,'TRANG CHỦ',0,'','{\"href\":\"http://thongnhatbn.com.vn\",\"categoryId\":\"\",\"cssclass\":\"text-bold text-red\",\"icons\":\"icon-w-pram\",\"style\":\"\",\"listParents\":\"|0|\"}',10,1,0,1),
	(2,'GIỚI THIỆU',0,'','{\"href\":\"http:\\/\\/thongnhatbn.com.vn\\/gioi-thieu-i1\",\"categoryId\":\"\",\"cssclass\":\"\",\"icons\":\"\",\"style\":\"\",\"listParents\":\"|0|\"}',2,1,0,1),
	(3,'DỰ ÁN',0,'','{\"href\":\"http:\\/\\/thongnhatbn.com.vn\\/du-an\",\"categoryId\":\"\",\"cssclass\":\"\",\"icons\":\"\",\"style\":\"\",\"listParents\":\"|0|\"}',3,1,1,1),
	(4,'TIN TỨC SỰ KIỆN',0,'','{\"href\":\"\",\"categoryId\":\"4\",\"cssclass\":\"\",\"icons\":\"\",\"style\":\"\",\"listParents\":\"|0|\"}',4,1,1,1),
	(5,'TUYỂN DỤNG',0,'','{\"href\":\"http:\\/\\/thongnhatbn.com.vn/site/tuyen-dung\",\"categoryId\":\"4\",\"cssclass\":\"\",\"icons\":\"\",\"style\":\"\",\"listParents\":\"|0|\"}',5,1,0,1),
	(6,'LIÊN HỆ',0,'','{\"href\":\"http:\\/\\/thongnhatbn.com.vn\\/lien-he-voi-thong-nhat-jsc-p6\",\"categoryId\":\"\",\"cssclass\":\"\",\"icons\":\"\",\"style\":\"\",\"listParents\":\"|0|\"}',6,1,0,1),
	(21,'VĂN PHÒNG ẢO',0,'','{\"href\":\"#\",\"categoryId\":\"\",\"cssclass\":\"\",\"icons\":\"\",\"style\":\"\",\"listParents\":\"|0|\"}',8,0,1,0),
	(23,'TIN THỐNG NHẤT',4,'','{\"href\":\"#\",\"categoryId\":\"17\",\"cssclass\":\"\",\"icons\":\"\",\"style\":\"\",\"listParents\":\"|4|0|\"}',9,1,0,1),
	(24,'TIN THỜI SỰ',4,'','{\"href\":\"\",\"categoryId\":\"18\",\"cssclass\":\"\",\"icons\":\"\",\"style\":\"\",\"listParents\":\"|4|0|\"}',9,1,1,1),
	(25,'VĂN BẢN PHÁP LUẬT',4,'','{\"href\":\"#\",\"categoryId\":\"19\",\"cssclass\":\"\",\"icons\":\"\",\"style\":\"\",\"listParents\":\"|4|0|\"}',2,1,0,1),
	(28,'HỒ SƠ ĐĂNG KÝ',0,'','{\"href\":\"http://thongnhatbn.com.vn/du-an/dang-ky\",\"categoryId\":\"\",\"cssclass\":\"\",\"icons\":\"\",\"style\":\"\",\"listParents\":\"|0|\"}',5,1,1,1);

/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page`;

CREATE TABLE `page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `desc` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `content` longtext,
  `alias` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT '0',
  `status` int(2) DEFAULT NULL,
  `order` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;

INSERT INTO `page` (`id`, `school_id`, `name`, `title`, `desc`, `keyword`, `content`, `alias`, `image`, `category_id`, `status`, `order`, `created_at`, `updated_at`)
VALUES
	(28,1,'Thông báo lịch nghỉ ngày Giỗ tổ Hùng Vương','Thong bao toan truong',NULL,NULL,NULL,NULL,NULL,1,1,0,'2019-02-19 07:28:09','2019-02-19 07:55:19'),
	(29,1,'Thông báo lịch nghỉ 30/4 và quốc tế lao động','Thong bao toan truong',NULL,NULL,NULL,NULL,NULL,1,1,0,'2019-02-19 07:28:09','2019-02-19 07:55:39'),
	(30,1,'Thông báo về việc đóng học phí kỳ 2 lớp 3 tuổi (3A1)','Thong bao toan truong',NULL,NULL,NULL,NULL,NULL,1,1,0,'2019-02-19 07:28:09','2019-02-19 07:55:53');

/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table page_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page_category`;

CREATE TABLE `page_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `level` int(10) unsigned DEFAULT '0',
  `status` int(1) unsigned DEFAULT '1',
  `del_flag` int(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table page_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page_image`;

CREATE TABLE `page_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned DEFAULT '0',
  `file_name` varchar(255) DEFAULT '',
  `is_featured` int(1) unsigned DEFAULT '0',
  `is_slideshow` int(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `page_id_index` (`page_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table persistent_logins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `persistent_logins`;

CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table service_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_type`;

CREATE TABLE `service_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `service_type` WRITE;
/*!40000 ALTER TABLE `service_type` DISABLE KEYS */;

INSERT INTO `service_type` (`id`, `name`, `desc`, `created_at`, `updated_at`)
VALUES
	(1,'Đón bé tại nhà','Dịch vụ đón bé tại nhà, mỗi lần đón bé 10K, đưa bé về nhà 10K.','2018-12-08 02:45:43','2018-12-08 02:45:43'),
	(2,'Đón muộn','Phụ huynh đón muộn hơn 1h sẽ tính thêm phụ phí đón muộn 15K/1h tiếp theo','2018-12-08 02:47:01','2018-12-08 02:47:01');

/*!40000 ALTER TABLE `service_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_permision
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_permision`;

CREATE TABLE `user_permision` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) NOT NULL,
  `roles` varchar(255) NOT NULL DEFAULT 'hasRole(''USER'')',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_permision` WRITE;
/*!40000 ALTER TABLE `user_permision` DISABLE KEYS */;

INSERT INTO `user_permision` (`id`, `action`, `roles`)
VALUES
	(3,'/admin/**','hasRole(\'USER\') or hasRole(\'ADMIN\') or hasRole(\'DBA\')'),
	(6,'/admin/banner/**','hasRole(\'USER\') or hasRole(\'ADMIN\') or hasRole(\'DBA\')'),
	(7,'/admin/page/**','hasRole(\'USER\') or hasRole(\'ADMIN\') or hasRole(\'DBA\')'),
	(8,'/admin/block-home/**','hasRole(\'USER\') or hasRole(\'ADMIN\') or hasRole(\'DBA\')'),
	(9,'/admin/config/**','hasRole(\'USER\') or hasRole(\'ADMIN\') or hasRole(\'DBA\')'),
	(10,'/admin/menu/**','hasRole(\'USER\') or hasRole(\'ADMIN\') or hasRole(\'DBA\')'),
	(11,'/admin/add-user','hasRole(\'ADMIN\')'),
	(12,'/admin/delete-user-*','hasRole(\'ADMIN\')'),
	(13,'/admin/edit-user-*','hasRole(\'ADMIN\')');

/*!40000 ALTER TABLE `user_permision` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_profile`;

CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;

INSERT INTO `user_profile` (`id`, `type`)
VALUES
	(2,'ROLE_ADMIN'),
	(3,'ROLE_DBA'),
	(1,'ROLE_USER');

/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
