-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: welove
-- ------------------------------------------------------
-- Server version	5.5.58-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wl_activity`
--

DROP TABLE IF EXISTS `wl_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '活动标题',
  `img` varchar(255) DEFAULT '' COMMENT '图片',
  `img_big` varchar(255) DEFAULT '' COMMENT '大图',
  `admin_id` int(11) NOT NULL DEFAULT '1' COMMENT '添加活动管理员',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `address` varchar(255) DEFAULT '' COMMENT '活动地址',
  `pnum` int(11) DEFAULT '0' COMMENT '已报名人数',
  `info` text COMMENT '内容',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `st` tinyint(4) DEFAULT '1' COMMENT '1正常 0删除',
  `charm` varchar(255) DEFAULT '' COMMENT '摘要',
  `type` tinyint(4) DEFAULT '1' COMMENT '1在线活动 2验房活动',
  `attend_num` int(11) DEFAULT '0' COMMENT '验房活动已参加人数',
  `imgs` varchar(100) DEFAULT '' COMMENT '内容长图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线活动（平台发布）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_activity`
--

LOCK TABLES `wl_activity` WRITE;
/*!40000 ALTER TABLE `wl_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_activity_attend`
--

DROP TABLE IF EXISTS `wl_activity_attend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_activity_attend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动id',
  `user_id` int(11) NOT NULL,
  `truename` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
  `zuoji` varchar(50) DEFAULT '' COMMENT '座机',
  `xiaoqu` varchar(255) NOT NULL DEFAULT '' COMMENT '小区地址',
  `nigou` varchar(100) DEFAULT '' COMMENT '拟购产品',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `time_to` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动报名';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_activity_attend`
--

LOCK TABLES `wl_activity_attend` WRITE;
/*!40000 ALTER TABLE `wl_activity_attend` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_activity_attend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_ad`
--

DROP TABLE IF EXISTS `wl_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '图片保存路径',
  `url` varchar(100) DEFAULT '',
  `position` tinyint(4) NOT NULL DEFAULT '1' COMMENT '所处位置：1首页 ',
  `st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0删除状态,1正常，2不显示',
  `sort` tinyint(4) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `url_to` tinyint(4) DEFAULT '0' COMMENT '链接到哪里：0无 1活动详情 2商品详情 3店铺详情 4店铺列表',
  `url_bianhao` int(11) DEFAULT '0' COMMENT '商品编号等',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 轮播图 1主页广告图',
  PRIMARY KEY (`id`),
  KEY `position` (`position`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='广告图／轮播图表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_ad`
--

LOCK TABLES `wl_ad` WRITE;
/*!40000 ALTER TABLE `wl_ad` DISABLE KEYS */;
INSERT INTO `wl_ad` VALUES (1,'轮播-1','/upload/ad/20171227/a7aab0b23ff9aa436d37aa5a3e4e911e.jpg','/pages/goodDetail/goodDetail?good_id=1',1,1,0,1513237828,1514342131,2,1,0),(2,'轮播-2','/upload/ad/20171227/f2324886592d38c14cd778671bdb3ae9.jpg','/pages/goodDetail/goodDetail?good_id=1',1,1,0,1513237834,1514342745,2,1,0),(3,'轮播-3','/upload/ad/20171227/0b18509d9c7ce1d4e653e136bb3ff323.jpg','/pages/goodDetail/goodDetail?good_id=1',1,1,0,1513237843,1514344117,2,1,0),(4,'轮播-4','/upload/ad/20171227/f366fd59c10a02790d2c7b6d757dfd39.jpg','/pages/goodDetail/goodDetail?good_id=1',1,1,1,1513237849,1514344155,2,1,0),(5,'','/upload/ad/20171214/dd314a1e3f752a84d46f541652346a4a.jpg','',1,0,0,1513238150,1514344408,0,0,1),(6,'aaa','/upload/ad/20171214/d223d0cd26e4a28d344ba7b49440df6a.jpg','',1,0,0,1513238314,1514344404,0,0,1),(7,'','/upload/ad/20171227/8cf09e32a0ec7edd62cb6f1365afc4d7.jpg','',1,1,0,1513240770,1514344363,0,0,2),(8,'','/upload/ad/20171227/bf90f5d2192213fc7be0db1226471487.jpg','/pages/goodDetail/goodDetail?good_id=2',1,1,0,1514252416,1514344314,2,2,1);
/*!40000 ALTER TABLE `wl_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_address`
--

DROP TABLE IF EXISTS `wl_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `truename` varchar(50) NOT NULL,
  `mobile` char(11) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1为默认收货地址 0为其他',
  `pcd` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(100) NOT NULL COMMENT '收货地址其它信息',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0删除 1正常',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='收货人地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_address`
--

LOCK TABLES `wl_address` WRITE;
/*!40000 ALTER TABLE `wl_address` DISABLE KEYS */;
INSERT INTO `wl_address` VALUES (1,2,'cccccc','13344445588',1,'北京市昌平区回龙观东大街昌平区回龙观腾讯众创空间(回龙观东大街)','22',1513585551,1513587051,1),(2,2,'mmmmmmmm','17788889999',0,'北京市昌平区回龙观东大街昌平区回龙观腾讯众创空间(回龙观东大街)','qqqqqqqqqqqq',1513586439,1513587065,0),(3,2,'66666','18866666666',0,'北京市北京市','aaa',1513587141,1513587141,1),(4,2,'ggggg','15566667777',0,'北京市昌平区回龙观创客广场腾讯众创空间(北京昌平)','asdfghjkl',1513587451,1513587451,1),(5,6,'董思月','13838384388',1,'北京市回龙观腾讯众创空间北京昌平东回龙观腾讯众创空间北京昌平东','我们',1514281324,1514281324,1),(6,7,'SAD sa','13656565656',1,'sad ','sa d',1514357759,1514357759,1);
/*!40000 ALTER TABLE `wl_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_admin`
--

DROP TABLE IF EXISTS `wl_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '账号',
  `truename` varchar(50) DEFAULT '',
  `pwd` char(32) DEFAULT NULL COMMENT '密码',
  `times` int(11) DEFAULT '0' COMMENT '登录次数',
  `type` tinyint(4) DEFAULT '2' COMMENT '1超级 2一般(店铺管理员)',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `st` tinyint(4) DEFAULT '1',
  `income` decimal(10,2) DEFAULT '0.00' COMMENT '商家的收益',
  `privilege` varchar(255) NOT NULL DEFAULT '' COMMENT '一般管理员权限',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='后台管理员（超级及一般）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_admin`
--

LOCK TABLES `wl_admin` WRITE;
/*!40000 ALTER TABLE `wl_admin` DISABLE KEYS */;
INSERT INTO `wl_admin` VALUES (1,'admin','','67a1c6560264e4f6e88a3e430395b994',54,1,0,1514251540,1,0.00,'');
/*!40000 ALTER TABLE `wl_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_admin_log`
--

DROP TABLE IF EXISTS `wl_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT '1' COMMENT 'admin_id',
  `ip` varchar(50) DEFAULT '' COMMENT '上次登录ip',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=235 DEFAULT CHARSET=utf8 COMMENT='后台管理员登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_admin_log`
--

LOCK TABLES `wl_admin_log` WRITE;
/*!40000 ALTER TABLE `wl_admin_log` DISABLE KEYS */;
INSERT INTO `wl_admin_log` VALUES (181,6,'::1',1512444130,1512444130),(182,6,'::1',1512450591,1512450591),(183,6,'::1',1512455494,1512455494),(184,6,'::1',1512461575,1512461575),(185,6,'::1',1512467755,1512467755),(186,6,'::1',1512522367,1512522367),(187,6,'::1',1512536187,1512536187),(188,6,'::1',1512608734,1512608734),(189,6,'::1',1512615188,1512615188),(190,6,'::1',1512622957,1512622957),(191,6,'::1',1512625815,1512625815),(192,6,'::1',1512634455,1512634455),(193,6,'::1',1512696204,1512696204),(194,6,'::1',1512700408,1512700408),(195,6,'::1',1512710108,1512710108),(196,6,'::1',1512720875,1512720875),(197,6,'::1',1512725515,1512725515),(198,6,'124.202.184.186',1512960740,1512960740),(199,6,'124.202.184.186',1513128584,1513128584),(200,6,'124.202.184.186',1513131946,1513131946),(201,6,'124.202.184.186',1513142161,1513142161),(202,6,'124.202.184.186',1513156831,1513156831),(203,6,'124.202.184.186',1513236410,1513236410),(204,6,'124.202.184.186',1513245849,1513245849),(205,6,'124.202.184.186',1513308814,1513308814),(206,6,'124.202.184.186',1513317022,1513317022),(207,6,'124.202.184.186',1513322392,1513322392),(208,6,'124.202.184.186',1513589342,1513589342),(209,6,'124.202.184.186',1513647297,1513647297),(210,6,'124.202.184.186',1513676900,1513676900),(211,6,'124.202.184.186',1513732571,1513732571),(212,6,'124.202.184.186',1513738024,1513738024),(213,6,'124.202.184.186',1513748203,1513748203),(214,6,'124.202.184.186',1513764405,1513764405),(215,6,'124.202.184.186',1513820184,1513820184),(216,6,'124.202.184.186',1513836414,1513836414),(217,6,'124.202.184.186',1513847639,1513847639),(218,6,'124.202.184.186',1513907435,1513907435),(219,6,'124.202.184.186',1513922526,1513922526),(220,6,'124.202.184.186',1513926583,1513926583),(221,6,'124.202.184.186',1514168989,1514168989),(222,6,'124.202.184.186',1514179204,1514179204),(223,6,'124.202.184.186',1514182227,1514182227),(224,6,'124.202.184.186',1514184262,1514184262),(225,6,'124.202.184.186',1514189481,1514189481),(226,1,'124.202.184.186',1514196673,1514196673),(227,1,'124.202.184.186',1514251531,1514251531),(228,1,'124.202.184.186',1514251549,1514251549),(229,1,'124.202.184.186',1514273093,1514273093),(230,1,'124.202.184.186',1514280819,1514280819),(231,1,'124.202.184.186',1514281399,1514281399),(232,1,'124.202.184.186',1514341355,1514341355),(233,1,'124.202.184.186',1514345934,1514345934),(234,1,'124.202.184.186',1514352536,1514352536);
/*!40000 ALTER TABLE `wl_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_article`
--

DROP TABLE IF EXISTS `wl_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) DEFAULT '1' COMMENT '文章分类id',
  `name` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL DEFAULT '',
  `cont` text NOT NULL,
  `charm` varchar(255) NOT NULL DEFAULT '',
  `clicks` int(11) NOT NULL DEFAULT '1',
  `admin_id` tinyint(4) NOT NULL DEFAULT '1',
  `st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0删除状态,1正常，2不显示',
  `index_show` tinyint(4) DEFAULT '0' COMMENT '首页推荐',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1为百科 2为验房 3为团购活动',
  `baoming_id` int(11) DEFAULT '0' COMMENT '报名id',
  `tuangou_id` int(11) DEFAULT NULL COMMENT '团购活动总结',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_article`
--

LOCK TABLES `wl_article` WRITE;
/*!40000 ALTER TABLE `wl_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_baoming`
--

DROP TABLE IF EXISTS `wl_baoming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_baoming` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `truename` varchar(50) NOT NULL COMMENT '报名人姓名',
  `mobile` varchar(11) NOT NULL,
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '报名人地址',
  `time_to` int(11) DEFAULT '0' COMMENT '验房时间',
  `st` tinyint(4) DEFAULT '1' COMMENT '1',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `article_st` tinyint(4) DEFAULT '0' COMMENT '是否添加了总结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报名（验房表）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_baoming`
--

LOCK TABLES `wl_baoming` WRITE;
/*!40000 ALTER TABLE `wl_baoming` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_baoming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_cart`
--

DROP TABLE IF EXISTS `wl_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sum_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1表示有商品，0表示没有',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_cart`
--

LOCK TABLES `wl_cart` WRITE;
/*!40000 ALTER TABLE `wl_cart` DISABLE KEYS */;
INSERT INTO `wl_cart` VALUES (1,2,0.00,1513663717,1513932554,0),(2,5,0.00,1514253721,1514281289,0),(3,6,0.00,1514281284,1514359262,0),(4,7,9530.01,1514357661,1514359285,1);
/*!40000 ALTER TABLE `wl_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_cart_good`
--

DROP TABLE IF EXISTS `wl_cart_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_cart_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL COMMENT '购物车id',
  `good_id` int(11) NOT NULL COMMENT '商品id,用于关联商品表',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '某个商品的数量',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1正常 0删除',
  `property_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='购物车商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_cart_good`
--

LOCK TABLES `wl_cart_good` WRITE;
/*!40000 ALTER TABLE `wl_cart_good` DISABLE KEYS */;
INSERT INTO `wl_cart_good` VALUES (1,1,7,3,1513663717,1513663723,0,8),(2,1,7,3,1513663734,1513663742,0,9),(3,1,7,3,1513663768,1513739907,0,7),(4,1,6,1,1513668186,1513735699,0,0),(5,1,5,38,1513735663,1513735690,0,0),(6,1,5,2,1513735736,1513735773,0,0),(7,1,6,1,1513735953,1513736100,0,0),(8,1,6,2,1513737603,1513748979,0,0),(9,1,5,30,1513737867,1513738465,0,0),(10,1,6,1,1513748984,1513832451,0,0),(11,1,7,1,1513756095,1513834175,0,10),(12,1,4,1,1513834179,1513841301,0,0),(13,1,6,2,1513841306,1513847582,0,0),(14,1,6,1,1513847586,1513911234,0,0),(15,1,7,1,1513911227,1513931253,0,11),(16,1,4,1,1513931190,1513931237,0,0),(17,1,6,2,1513931222,1513931250,0,0),(18,1,6,3,1513931258,1513931412,0,0),(19,1,6,1,1513931418,1513931963,0,0),(20,1,4,1,1513932131,1513932189,0,0),(21,1,4,1,1513932408,1513932554,0,0),(22,2,2,1,1514253721,1514254080,0,0),(23,2,9,1,1514254067,1514254082,0,0),(24,2,4,1,1514273853,1514281289,0,0),(25,3,1,1,1514281284,1514344783,0,0),(26,3,8,1,1514356250,1514356318,0,0),(27,3,6,1,1514356314,1514356685,0,0),(28,3,6,2,1514356722,1514359262,0,0),(29,4,1,1,1514358869,1514359261,0,0),(30,4,2,1,1514358873,1514359258,0,0),(31,4,5,1,1514358875,1514359257,0,0),(32,4,8,1,1514358878,1514359255,0,0),(33,4,2,2,1514359260,1514359262,1,0),(34,4,4,1,1514359269,1514359269,1,0),(35,4,1,3,1514359271,1514359285,1,0),(36,4,5,2,1514359278,1514359278,1,0);
/*!40000 ALTER TABLE `wl_cart_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_cate`
--

DROP TABLE IF EXISTS `wl_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `st` tinyint(4) NOT NULL DEFAULT '1',
  `sort` tinyint(4) NOT NULL DEFAULT '100',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '0 为一级分类',
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_cate`
--

LOCK TABLES `wl_cate` WRITE;
/*!40000 ALTER TABLE `wl_cate` DISABLE KEYS */;
INSERT INTO `wl_cate` VALUES (1,'热门推荐',1512458790,1514357621,1,5,0,NULL),(2,'酸奶粉',1512462982,1514357641,1,6,0,NULL),(3,'冰淇淋粉',1513245870,1514355471,1,1,1,'/upload/cate/20171227/d3d16a78b5c87137271c5566385c0265.jpg'),(4,'冰淇淋粉',1513246250,1514355477,1,1,1,'/upload/cate/20171227/45ccb973d58615831d974de2e7693ee8.jpg'),(5,'冰淇淋粉',1513246362,1514355493,1,1,1,'/upload/cate/20171227/037d0e0c70c7f09b64bfe1d3bfa91878.jpg'),(6,'酸奶机',1513246408,1514355507,1,2,1,'/upload/cate/20171227/f778e808af6e0cf816d9be629b898886.jpg'),(7,'新西兰进口酸奶粉',1513246762,1514357717,1,1,2,'/upload/cate/20171227/c8080b2f1cc0a5c4cdae17c1cca1385b.jpg'),(8,'德国酸奶粉',1513246808,1514357763,1,1,2,'/upload/cate/20171227/30bb1415d8bf7eeed8e3442e1417553e.jpg'),(9,'酸奶机',1514169044,1514358843,1,7,0,'/upload/cate/20171225/95fbc0a270398fd4ce3058d651af2f02.jpg'),(10,'1234',1514169122,1514344521,1,100,9,'/upload/cate/20171227/ce483310afbcdb2394fe89ffc5457106.jpg'),(11,'1234',1514169131,1514169131,1,100,9,'/upload/cate/20171225/c9a2233bb8aa77487b3e708c2feb240a.jpg'),(12,'1234',1514169140,1514169140,1,100,9,'/upload/cate/20171225/52a9d8116506dee72e0fbcc1bddb452f.jpg'),(13,'1324',1514169150,1514169150,1,100,9,'/upload/cate/20171225/a1bb3325ab11015c79668460e1c7364b.jpg'),(14,'酸奶机',1514355552,1514355796,1,2,1,'/upload/cate/20171227/1ef928637f4c887475a1f4e24efd67f2.jpg'),(15,'酸奶机',1514355572,1514355804,1,2,1,'/upload/cate/20171227/d673e4969446d03b53b6f60c1426cdb9.jpg'),(16,'酸奶粉',1514355689,1514355834,1,3,1,'/upload/cate/20171227/7294103392eb7bf059b30767046a18dd.jpg'),(17,'酸奶粉',1514355712,1514355841,1,3,1,'/upload/cate/20171227/c30ebdfdcf3aa06fd5b94ccf5840018c.jpg'),(18,'酸奶粉',1514355753,1514355848,1,3,1,'/upload/cate/20171227/863683ca609549082df209d1e8d774dc.jpg');
/*!40000 ALTER TABLE `wl_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_collect`
--

DROP TABLE IF EXISTS `wl_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `collect_id` int(11) NOT NULL,
  `st` tinyint(4) DEFAULT '1' COMMENT '1收藏 0不收藏',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `type` tinyint(4) NOT NULL COMMENT '1收藏商品id 2收藏店铺id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_collect`
--

LOCK TABLES `wl_collect` WRITE;
/*!40000 ALTER TABLE `wl_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_coupon`
--

DROP TABLE IF EXISTS `wl_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule` int(11) NOT NULL COMMENT '规则',
  `solution` int(11) NOT NULL COMMENT '解决方案',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `name` varchar(50) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL COMMENT '优惠券图片',
  `result` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_coupon`
--

LOCK TABLES `wl_coupon` WRITE;
/*!40000 ALTER TABLE `wl_coupon` DISABLE KEYS */;
INSERT INTO `wl_coupon` VALUES (1,100,99,1,'----',1514563200,1514649600,1512630201,1513677041,'','满100元减99元'),(2,50000,35000,1,'无敌优惠券',NULL,NULL,1513647752,1513677038,NULL,'满50000元减35000元');
/*!40000 ALTER TABLE `wl_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_fankui`
--

DROP TABLE IF EXISTS `wl_fankui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_fankui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `cont` varchar(255) DEFAULT '',
  `st` tinyint(4) DEFAULT '1',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `star` tinyint(4) DEFAULT '1' COMMENT '1  好评   2中评  3差评',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='反馈表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_fankui`
--

LOCK TABLES `wl_fankui` WRITE;
/*!40000 ALTER TABLE `wl_fankui` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_fankui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_good`
--

DROP TABLE IF EXISTS `wl_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `store` int(11) DEFAULT '1' COMMENT '库存数量',
  `sales` int(11) DEFAULT '0' COMMENT '销量，商品发货后增加',
  `cate_id` int(11) NOT NULL DEFAULT '1' COMMENT '分类id',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '列表图',
  `img_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大图',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `desc` text COMMENT '描述',
  `st` tinyint(4) DEFAULT '1' COMMENT '0删除， 1正常 ,2不显示',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `img_big_st` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0没有大图 1有大图',
  `sort` tinyint(4) NOT NULL DEFAULT '100' COMMENT '排序',
  `property_st` tinyint(4) NOT NULL DEFAULT '0',
  `is_home_page` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0首页不推荐  1首页推荐',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='资料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_good`
--

LOCK TABLES `wl_good` WRITE;
/*!40000 ALTER TABLE `wl_good` DISABLE KEYS */;
INSERT INTO `wl_good` VALUES (1,'aaa',1000,0,1,'/upload/good/20171227/8e322b2b864d3b1978b3cb9a4828203c.jpg','',1500.00,'<strong>21212121212121aaa</strong>',1,1512463262,1514344937,0,1,0,1),(2,'冰糖酸角',500,0,3,'/upload/good_img/20171205/d48f48afedbbd3cde302026ccf222305.jpg','',15.00,'7897979',1,1512463579,1514184554,0,2,0,1),(3,'酸奶机',10000,0,1,'/upload/good/20171227/4df75ede2106bbd3ee0d87866a7b9cc6.jpg','',150.00,'31313123',1,1512526832,1514346533,0,1,1,1),(4,'啊飒飒撒',111,0,1,'/upload/good_img/20171214/46f9d1eaea23be6c5127799ce0cb52ef.jpg','',1000.00,'~!@#$%^&amp;*()',1,1513239179,1513239179,0,1,0,1),(5,'酸酸乳',200,0,3,'/upload/good_img/20171214/9ea6300a423b671b21cf824baa89a458.jpeg','',2000.00,'7987641621321456497641564',1,1513239523,1514184533,0,12,0,1),(6,'酸奶机',100,6,3,'/upload/good_img/20171215/c8a9b691e347be8d22dca55a384f5761.jpeg','',0.01,'啊飒飒飒飒',1,1513317057,1514356336,0,1,0,1),(7,'酸奶',99999,4,3,'/upload/good_img/20171215/c637c9e92002d80860460f27b1371d45.jpg','',2.50,'<strong>吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱</strong>',1,1513317090,1513930330,0,33,1,1),(8,'德国WMF福腾宝20.991 家用不锈钢全自动自制',1,0,3,'/upload/good/20171227/f618fe44613a5084c217ef00b7d83d05.jpg','',111.00,'<img src=\"/welovetp/public/editor/attached/image/20171227/20171227111749_70430.jpg\" alt=\"\" />',1,1514169091,1514356141,0,100,0,1),(9,'酸奶发酵粉',1,0,3,'/upload/good_img/20171225/67d4dbb96aa7b4b97bd44a7e3272d78e.png','',100.00,'<p>\r\n	aaaaaaaaaaaaaaa\r\n</p>\r\n<p>\r\n	<img src=\"/welovetp/public/editor/attached/image/20171226/20171226173749_97801.jpg\" alt=\"\" />\r\n</p>',1,1514182254,1514281072,1,1,0,1);
/*!40000 ALTER TABLE `wl_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_good_img_bigs`
--

DROP TABLE IF EXISTS `wl_good_img_bigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_good_img_bigs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL COMMENT '商品id',
  `img_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大图位置',
  `st` tinyint(4) DEFAULT '1' COMMENT '状态：1正常 0删除',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='商品大图（多个 ）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_good_img_bigs`
--

LOCK TABLES `wl_good_img_bigs` WRITE;
/*!40000 ALTER TABLE `wl_good_img_bigs` DISABLE KEYS */;
INSERT INTO `wl_good_img_bigs` VALUES (1,2,'/upload/good_img_big/20171206/19f21333bb23a614cffd9f386044c6d6.jpg',0,0,0),(2,2,'/upload/good_img_big/20171206/cc2ef772b2c878ad950af53a145dd9aa.jpg',0,0,0),(3,2,'/upload/good_img_big/20171206/412a1eda09836d1d396eceab3264e798.jpg',0,0,0),(4,2,'/upload/good_img_big/20171206/aa5cdf209b24670fea97243f483a5c96.jpg',0,0,0),(5,2,'/upload/good_img_big/20171206/18fb343c5e6635346ade80376f2cd51f.jpg',0,0,0),(6,2,'/upload/good_img_big/20171206/e3844bb43b5c001886c161dedbc429e5.jpg',0,0,0),(7,3,'/upload/good_img_big/20171207/f47c26a1f4ce900e20589611ed3cbda1.jpg',0,0,0),(8,3,'/upload/good_img_big/20171207/dfe9d868a3146e95c1aa6f2d0a48cfd2.jpg',0,0,0),(9,3,'/upload/good_img_big/20171207/b9d6f6657f387a29f003e30465ec0105.jpg',0,0,0),(10,3,'/upload/good_img_big/20171207/bff4ff9c9a98bef380f69a8cf6b41412.jpg',0,0,0),(11,9,'/upload/good_img_big/20171225/bcb79ef5eac433f003b208e5ca6cbf89.jpg',1,0,0),(12,9,'/upload/good_img_big/20171225/749a41580c643aa47f2b2aaee396697f.jpg',1,0,0),(13,9,'/upload/good_img_big/20171225/ac0d83837930e88b5b7a2d60b63a050d.jpeg',1,0,0);
/*!40000 ALTER TABLE `wl_good_img_bigs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_menu_admin`
--

DROP TABLE IF EXISTS `wl_menu_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_menu_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '导航名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '导航上级id，总分两级,0表示一级',
  `controller` varchar(100) DEFAULT '' COMMENT '控制器,为一级时为""',
  `action` varchar(100) DEFAULT '' COMMENT '控制器中方法,为一级时为""',
  `param` varchar(100) DEFAULT '' COMMENT '参数',
  `sort` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `is_show_to_shop` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1展示 0不展示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='后台左侧导航';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_menu_admin`
--

LOCK TABLES `wl_menu_admin` WRITE;
/*!40000 ALTER TABLE `wl_menu_admin` DISABLE KEYS */;
INSERT INTO `wl_menu_admin` VALUES (29,'主要管理',0,'','index','',0,1512445271,1512445271,1),(30,'广告图',29,'Ad','index','',0,1512445286,1512445286,1),(31,'分类',29,'Cate','index','',0,1512445318,1512445318,1),(33,'商品',29,'Good','index','',0,1512446048,1512446056,1),(35,'订单管理',40,'Order','index','',0,1512611564,1514194603,1),(36,'优惠券',29,'Coupon','index','',0,1512616878,1512616878,1),(37,'小程序用户',41,'User','index','',0,1512701648,1514194632,1),(38,'消息',29,'Message','index','',0,1512704300,1512710316,1),(39,'平台设置',41,'Setting','index','',0,1513913513,1514194638,1),(40,'订单管理',0,'','index','',0,1514194592,1514194592,1),(41,'其他管理',0,'','index','',0,1514194619,1514194619,1),(43,'修改密码',41,'Admin','edit','',0,1514196084,1514196522,1);
/*!40000 ALTER TABLE `wl_menu_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_message`
--

DROP TABLE IF EXISTS `wl_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `st` tinyint(4) NOT NULL DEFAULT '1',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未读  1已读',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_message`
--

LOCK TABLES `wl_message` WRITE;
/*!40000 ALTER TABLE `wl_message` DISABLE KEYS */;
INSERT INTO `wl_message` VALUES (1,1,1,0,1512714551,1512723472,'66666889','测试一下'),(6,6,1,1,1514344723,1514344730,'<strong><em></em></strong><strong><em>jkl16241981203013103165</em></strong>','kkjj'),(5,5,2,0,1514193836,1514194515,'zzzzzzzzz','aaaaaaaaa');
/*!40000 ALTER TABLE `wl_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_order`
--

DROP TABLE IF EXISTS `wl_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(50) NOT NULL COMMENT '订单编号',
  `user_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT '0',
  `sum_price` decimal(10,2) DEFAULT '0.00',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `goodst` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 => ''未发货'' , 2 => ''已发货'' , 5 => ''部分发货'' , 3 => ''已收货'' , 4 => ''已评价''',
  `st` tinyint(4) DEFAULT '1' COMMENT '1没支付  2完成支付 3取消 4退款',
  `type` tinyint(4) DEFAULT '1' COMMENT '1一般订单 2限量团购订单 3限人团购订单 ',
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL COMMENT '备注',
  `refundno` varchar(50) DEFAULT '' COMMENT '退款号',
  `refund_time` int(11) DEFAULT NULL COMMENT '退款申请时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderno` (`orderno`),
  KEY `user_id` (`user_id`,`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_order`
--

LOCK TABLES `wl_order` WRITE;
/*!40000 ALTER TABLE `wl_order` DISABLE KEYS */;
INSERT INTO `wl_order` VALUES (1,'122216120154504_4x9vr4',2,1,0.01,1513930321,1513930330,1,2,1,0,'测试测试测试','',NULL),(2,'122617421654210_iJdX69',6,5,1401.00,1514281336,1514344795,1,5,1,1,'你们都在一起的日子','',NULL),(3,'122714311296317_iJdX69',6,5,12.00,1514356272,1514356390,1,4,1,1,'','',NULL),(4,'122714320699979_iJdX69',6,5,0.01,1514356326,1514359126,1,7,1,0,'','122715184580_refund',NULL),(5,'122714560266122_N0tdGd',7,6,0.01,1514357762,1514360888,1,5,1,0,'','',NULL),(6,'122715214469596_N0tdGd',7,6,9431.01,1514359304,1514359355,1,4,1,1,'asd ','',NULL),(7,'122715360685240_N0tdGd',7,6,9431.01,1514360166,1514360166,1,1,1,1,'','',NULL);
/*!40000 ALTER TABLE `wl_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_order_contact`
--

DROP TABLE IF EXISTS `wl_order_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_order_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(255) NOT NULL COMMENT '用于支付的订单号',
  `sum_price_all` decimal(10,2) DEFAULT '0.00' COMMENT '总价，可能是多个商家的',
  `st` tinyint(4) DEFAULT '1' COMMENT '0删除，1待支付 ,2已支付',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='多商家订单联合表(一对多)订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_order_contact`
--

LOCK TABLES `wl_order_contact` WRITE;
/*!40000 ALTER TABLE `wl_order_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_order_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_order_good`
--

DROP TABLE IF EXISTS `wl_order_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_order_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '1',
  `st` tinyint(4) NOT NULL DEFAULT '1',
  `img` varchar(250) NOT NULL DEFAULT '' COMMENT '商品列表图',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `price` decimal(10,2) DEFAULT '0.00',
  `unit` varchar(50) DEFAULT '',
  `shop_id` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `property_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='订单商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_order_good`
--

LOCK TABLES `wl_order_good` WRITE;
/*!40000 ALTER TABLE `wl_order_good` DISABLE KEYS */;
INSERT INTO `wl_order_good` VALUES (1,1,7,1,1,'/upload/good_img/20171215/c637c9e92002d80860460f27b1371d45.jpg','酸奶',0.01,'',0,1513930321,1513930321,11),(2,2,1,1,1,'/upload/good_img/20171205/b79c673cadb2cb0599df37ff239cca81.jpg','aaa',1500.00,'',0,1514281336,1514281336,0),(3,3,8,1,1,'/upload/good/20171227/f618fe44613a5084c217ef00b7d83d05.jpg','德国WMF福腾宝20.991 家用不锈钢全自动自制',111.00,'',0,1514356272,1514356272,0),(4,4,6,1,1,'/upload/good_img/20171215/c8a9b691e347be8d22dca55a384f5761.jpeg','酸奶机',0.01,'',0,1514356326,1514356326,0),(5,5,6,2,1,'/upload/good_img/20171215/c8a9b691e347be8d22dca55a384f5761.jpeg','酸奶机',0.01,'',0,1514357762,1514357762,0),(6,6,2,2,1,'/upload/good_img/20171205/d48f48afedbbd3cde302026ccf222305.jpg','冰糖酸角',15.00,'',0,1514359304,1514359304,0),(7,6,4,1,1,'/upload/good_img/20171214/46f9d1eaea23be6c5127799ce0cb52ef.jpg','啊飒飒撒',1000.00,'',0,1514359304,1514359304,0),(8,6,1,3,1,'/upload/good/20171227/8e322b2b864d3b1978b3cb9a4828203c.jpg','aaa',1500.00,'',0,1514359304,1514359304,0),(9,6,5,2,1,'/upload/good_img/20171214/9ea6300a423b671b21cf824baa89a458.jpeg','酸酸乳',2000.00,'',0,1514359304,1514359304,0),(10,7,2,2,1,'/upload/good_img/20171205/d48f48afedbbd3cde302026ccf222305.jpg','冰糖酸角',15.00,'',0,1514360166,1514360166,0),(11,7,4,1,1,'/upload/good_img/20171214/46f9d1eaea23be6c5127799ce0cb52ef.jpg','啊飒飒撒',1000.00,'',0,1514360166,1514360166,0),(12,7,1,3,1,'/upload/good/20171227/8e322b2b864d3b1978b3cb9a4828203c.jpg','aaa',1500.00,'',0,1514360166,1514360166,0),(13,7,5,2,1,'/upload/good_img/20171214/9ea6300a423b671b21cf824baa89a458.jpeg','酸酸乳',2000.00,'',0,1514360166,1514360166,0);
/*!40000 ALTER TABLE `wl_order_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_property`
--

DROP TABLE IF EXISTS `wl_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `good_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `st` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_property`
--

LOCK TABLES `wl_property` WRITE;
/*!40000 ALTER TABLE `wl_property` DISABLE KEYS */;
INSERT INTO `wl_property` VALUES (1,'a',1.00,3,1512532103,1512532103,0),(2,'b',2.00,3,1512532103,1512532103,0),(3,'c',3.00,3,1512532103,1512532103,0),(4,'100g',2.00,3,1512611263,1512611263,1),(5,'150g',3.00,3,1512611263,1512611263,1),(6,'200g',3.50,3,1512611263,1512611263,1),(7,'100g',1.50,7,1513322419,1513322419,0),(8,'150g',2.00,7,1513322419,1513322419,0),(9,'200g',2.50,7,1513322419,1513322419,0),(10,'100g',0.01,7,1513756083,1513756083,1),(11,'200g',0.01,7,1513756083,1513756083,1),(12,'300g',0.01,7,1513756083,1513756083,1);
/*!40000 ALTER TABLE `wl_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_setting`
--

DROP TABLE IF EXISTS `wl_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `mobile` char(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `truename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_setting`
--

LOCK TABLES `wl_setting` WRITE;
/*!40000 ALTER TABLE `wl_setting` DISABLE KEYS */;
INSERT INTO `wl_setting` VALUES (1,'阿斯打扫打扫打扫','18899996666',1513915167,1513915167,'张三');
/*!40000 ALTER TABLE `wl_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_shop`
--

DROP TABLE IF EXISTS `wl_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL COMMENT '名',
  `addr` varchar(50) NOT NULL DEFAULT '1' COMMENT '所在地址',
  `city` varchar(50) DEFAULT NULL COMMENT '所在城市',
  `cate_id` int(11) NOT NULL,
  `truename` varchar(50) DEFAULT '1' COMMENT '店铺联系人真实姓名',
  `phone` char(11) DEFAULT '',
  `ordernum` int(11) NOT NULL DEFAULT '0' COMMENT '订单量',
  `tradenum` int(11) NOT NULL DEFAULT '0' COMMENT '交易量',
  `fankuinum` int(11) DEFAULT NULL COMMENT '评价数',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '列表图',
  `logo` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `img_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大图',
  `st` tinyint(4) DEFAULT '1' COMMENT '0不显示，1正常 ,2删除',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `info` text,
  `to_top` tinyint(4) DEFAULT '0' COMMENT '1置顶 0不置顶',
  `brand` varchar(100) DEFAULT NULL COMMENT '经营品牌',
  `is_add_address` tinyint(4) DEFAULT '0' COMMENT '是否添加店铺地址',
  `zuoji` varchar(255) NOT NULL DEFAULT '' COMMENT '座机',
  `deposit` decimal(10,2) DEFAULT '0.00' COMMENT '订金',
  `money_all` decimal(10,2) DEFAULT '0.00' COMMENT '全款',
  `youhui` decimal(10,2) DEFAULT '0.00' COMMENT '优惠',
  `youhui_all` decimal(10,2) DEFAULT '0.00' COMMENT '全款优惠',
  `qrcode` varchar(255) DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='店铺表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_shop`
--

LOCK TABLES `wl_shop` WRITE;
/*!40000 ALTER TABLE `wl_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_shop_address`
--

DROP TABLE IF EXISTS `wl_shop_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_shop_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '商家id',
  `name_` varchar(100) NOT NULL COMMENT '门店名称',
  `truename_` varchar(100) DEFAULT '' COMMENT '联系人姓名',
  `mobile_` char(50) DEFAULT '' COMMENT '联系人手机',
  `address_` varchar(200) DEFAULT '' COMMENT '详细地址',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1正常 0删除',
  `zuoji` varchar(255) NOT NULL DEFAULT '' COMMENT '座机',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商户门店地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_shop_address`
--

LOCK TABLES `wl_shop_address` WRITE;
/*!40000 ALTER TABLE `wl_shop_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_shop_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_shop_confirm`
--

DROP TABLE IF EXISTS `wl_shop_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_shop_confirm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_ids` varchar(255) NOT NULL COMMENT '申请经营类目',
  `brand` varchar(255) DEFAULT '' COMMENT '经营品牌',
  `truename` varchar(20) NOT NULL,
  `phone` char(11) NOT NULL DEFAULT '',
  `addr` varchar(255) DEFAULT '',
  `st` tinyint(4) DEFAULT '0' COMMENT '0审核中，1通过 ,2不通过',
  `admin_id` int(11) NOT NULL DEFAULT '1' COMMENT 'admin_id',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='申请店铺';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_shop_confirm`
--

LOCK TABLES `wl_shop_confirm` WRITE;
/*!40000 ALTER TABLE `wl_shop_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_shop_confirm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_tuangou`
--

DROP TABLE IF EXISTS `wl_tuangou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_tuangou` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `shop_id` int(11) NOT NULL COMMENT '参加团购的商户',
  `good_id` int(11) NOT NULL COMMENT '参加团购的商品',
  `pnum` int(11) DEFAULT '0' COMMENT '参团人数至少',
  `store` int(11) NOT NULL COMMENT '限定团购数量（类型为2时要添加）',
  `price_group` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '团购价格',
  `deposit` decimal(10,2) DEFAULT '0.00' COMMENT '要交订金（类型为1时）',
  `end_time` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `st` tinyint(4) DEFAULT '1' COMMENT '0删除 1正在进行  2下架 ',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1限人团购（要交订金） 2限时限量',
  `attend_pnum` int(11) NOT NULL DEFAULT '0' COMMENT '目前团购参与人数',
  `already_sales` int(11) NOT NULL DEFAULT '0' COMMENT '目前已经售出的数量',
  `description` varchar(255) NOT NULL COMMENT '团购活动描述',
  `group_st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1正在进行  2活动成功  3活动失败',
  `article_st` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否添加了总结   1为加总结   0为没加',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团购商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_tuangou`
--

LOCK TABLES `wl_tuangou` WRITE;
/*!40000 ALTER TABLE `wl_tuangou` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_tuangou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_user`
--

DROP TABLE IF EXISTS `wl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(255) NOT NULL DEFAULT '' COMMENT '微信用户的',
  `nickname` varchar(50) NOT NULL DEFAULT '微信昵称',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` char(11) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为男',
  `vistar` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(100) DEFAULT NULL,
  `st` tinyint(4) NOT NULL DEFAULT '1',
  `addr` varchar(200) DEFAULT NULL COMMENT '所在地',
  `info` text COMMENT '个人说明',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `open_id` (`open_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='小程序会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_user`
--

LOCK TABLES `wl_user` WRITE;
/*!40000 ALTER TABLE `wl_user` DISABLE KEYS */;
INSERT INTO `wl_user` VALUES (1,'','hahah','hehehe','',1,'',NULL,1,NULL,NULL,0,0),(5,'oGkMQ0eqUstqzNMS1m38qrDLoFjE','对未来充满信心的傻狗','RZ33M0','',1,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqlvo9FiaUVdqqLpN9Ar86WYLRb8Ahm8AZ4aIjuibQt5sWiaGEBBT0rSFTwoDPVgFwEkonbiaP2pcpbuQ/0',NULL,1,NULL,NULL,1514193795,1514338959),(6,'oGkMQ0R2kun8fyzSvyEMT4yGt_D8','','iJdX69','',2,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK0KoJAONjTPyb0IMVDmgGiaCghuupMQSp5pyXt56w6xWPW8UazqkkqjmYKxZxia40LPnBibkv1wADjA/0',NULL,1,NULL,NULL,1514274847,1514363650),(7,'oGkMQ0UQd7F6qrr6AAUkSkTOzqCA','Faith','N0tdGd','',1,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKvH9eIPco0g4z5oUTQpwyNGx6bmK1gnSicpzY3iciclXBvyYqPDaSiaZHeZDIicJhJHAhK39DJOCEIaMg/0',NULL,1,NULL,NULL,1514356899,1514360936);
/*!40000 ALTER TABLE `wl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_users_coupon`
--

DROP TABLE IF EXISTS `wl_users_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_users_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `st` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_users_coupon`
--

LOCK TABLES `wl_users_coupon` WRITE;
/*!40000 ALTER TABLE `wl_users_coupon` DISABLE KEYS */;
INSERT INTO `wl_users_coupon` VALUES (1,1,5,1),(2,2,5,1),(3,2,6,1),(4,1,6,1),(5,2,7,1),(6,1,7,1);
/*!40000 ALTER TABLE `wl_users_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_withdraw`
--

DROP TABLE IF EXISTS `wl_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '申请商户id',
  `cash` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '申请提现金额',
  `st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1待审核 2通过 3未通过',
  `cash_st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '资金状态：1返还成功 2返还失败 ',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商户申请提现表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_withdraw`
--

LOCK TABLES `wl_withdraw` WRITE;
/*!40000 ALTER TABLE `wl_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_withdraw` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-28 16:57:35
