/*
Navicat MySQL Data Transfer

Source Server         : php
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : welove

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-12-14 14:11:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wl_activity
-- ----------------------------
DROP TABLE IF EXISTS `wl_activity`;
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

-- ----------------------------
-- Records of wl_activity
-- ----------------------------

-- ----------------------------
-- Table structure for wl_activity_attend
-- ----------------------------
DROP TABLE IF EXISTS `wl_activity_attend`;
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

-- ----------------------------
-- Records of wl_activity_attend
-- ----------------------------

-- ----------------------------
-- Table structure for wl_ad
-- ----------------------------
DROP TABLE IF EXISTS `wl_ad`;
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
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='广告图／轮播图表';

-- ----------------------------
-- Records of wl_ad
-- ----------------------------
INSERT INTO `wl_ad` VALUES ('61', '1', '/upload/ad/20171211\\5ec2fad8445aeafd7db4854acf0f5fa8.jpg', '', '1', '1', '0', '1512969482', '1512969482', '0', '0', '0');
INSERT INTO `wl_ad` VALUES ('62', '1', '/upload/ad/20171211\\e34f99e44d1234bd3adaeb0a2110f1b7.jpg', '', '1', '1', '1', '1512974107', '1512974107', '0', '0', '1');
INSERT INTO `wl_ad` VALUES ('63', '222', '/upload/ad/20171211\\73711a409e52939ed65c845315e1f344.jpg', '', '1', '1', '0', '1512974944', '1512983140', '0', '0', '1');
INSERT INTO `wl_ad` VALUES ('64', 'zzz', '/upload/ad/20171212\\3c2ef21d9290c4984cc8698e9cd14433.jpg', '', '1', '1', '0', '1513047695', '1513047695', '0', '0', '2');

-- ----------------------------
-- Table structure for wl_address
-- ----------------------------
DROP TABLE IF EXISTS `wl_address`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='收货人地址表';

-- ----------------------------
-- Records of wl_address
-- ----------------------------
INSERT INTO `wl_address` VALUES ('1', '1', '888', '17310488884', '1', '123', '', '1513155983', '1513156358', '0');

-- ----------------------------
-- Table structure for wl_admin
-- ----------------------------
DROP TABLE IF EXISTS `wl_admin`;
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

-- ----------------------------
-- Records of wl_admin
-- ----------------------------
INSERT INTO `wl_admin` VALUES ('6', 'admin', '', '67a1c6560264e4f6e88a3e430395b994', '18', '1', '0', '0', '1', '0.00', '');

-- ----------------------------
-- Table structure for wl_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `wl_admin_log`;
CREATE TABLE `wl_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT '1' COMMENT 'admin_id',
  `ip` varchar(50) DEFAULT '' COMMENT '上次登录ip',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COMMENT='后台管理员登录日志';

-- ----------------------------
-- Records of wl_admin_log
-- ----------------------------
INSERT INTO `wl_admin_log` VALUES ('181', '6', '::1', '1512444130', '1512444130');
INSERT INTO `wl_admin_log` VALUES ('182', '6', '::1', '1512450591', '1512450591');
INSERT INTO `wl_admin_log` VALUES ('183', '6', '::1', '1512455494', '1512455494');
INSERT INTO `wl_admin_log` VALUES ('184', '6', '::1', '1512461575', '1512461575');
INSERT INTO `wl_admin_log` VALUES ('185', '6', '::1', '1512467755', '1512467755');
INSERT INTO `wl_admin_log` VALUES ('186', '6', '::1', '1512522367', '1512522367');
INSERT INTO `wl_admin_log` VALUES ('187', '6', '::1', '1512536187', '1512536187');
INSERT INTO `wl_admin_log` VALUES ('188', '6', '::1', '1512608734', '1512608734');
INSERT INTO `wl_admin_log` VALUES ('189', '6', '::1', '1512615188', '1512615188');
INSERT INTO `wl_admin_log` VALUES ('190', '6', '::1', '1512622957', '1512622957');
INSERT INTO `wl_admin_log` VALUES ('191', '6', '::1', '1512625815', '1512625815');
INSERT INTO `wl_admin_log` VALUES ('192', '6', '::1', '1512634455', '1512634455');
INSERT INTO `wl_admin_log` VALUES ('193', '6', '::1', '1512696204', '1512696204');
INSERT INTO `wl_admin_log` VALUES ('194', '6', '::1', '1512700408', '1512700408');
INSERT INTO `wl_admin_log` VALUES ('195', '6', '::1', '1512710108', '1512710108');
INSERT INTO `wl_admin_log` VALUES ('196', '6', '::1', '1512720875', '1512720875');
INSERT INTO `wl_admin_log` VALUES ('197', '6', '::1', '1512725515', '1512725515');
INSERT INTO `wl_admin_log` VALUES ('198', '6', '::1', '1513046335', '1513046335');

-- ----------------------------
-- Table structure for wl_article
-- ----------------------------
DROP TABLE IF EXISTS `wl_article`;
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

-- ----------------------------
-- Records of wl_article
-- ----------------------------

-- ----------------------------
-- Table structure for wl_baoming
-- ----------------------------
DROP TABLE IF EXISTS `wl_baoming`;
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

-- ----------------------------
-- Records of wl_baoming
-- ----------------------------

-- ----------------------------
-- Table structure for wl_cart
-- ----------------------------
DROP TABLE IF EXISTS `wl_cart`;
CREATE TABLE `wl_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sum_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1表示有商品，0表示没有',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wl_cart
-- ----------------------------

-- ----------------------------
-- Table structure for wl_cart_good
-- ----------------------------
DROP TABLE IF EXISTS `wl_cart_good`;
CREATE TABLE `wl_cart_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL COMMENT '购物车id',
  `good_id` int(11) NOT NULL COMMENT '商品id,用于关联商品表',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '某个商品的数量',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1正常 0删除',
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车商品表';

-- ----------------------------
-- Records of wl_cart_good
-- ----------------------------

-- ----------------------------
-- Table structure for wl_cate
-- ----------------------------
DROP TABLE IF EXISTS `wl_cate`;
CREATE TABLE `wl_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `st` tinyint(4) NOT NULL DEFAULT '1',
  `sort` tinyint(4) NOT NULL DEFAULT '100',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '0 为一级分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of wl_cate
-- ----------------------------
INSERT INTO `wl_cate` VALUES ('1', '热门', '1512458790', '1512458790', '1', '100', '0');
INSERT INTO `wl_cate` VALUES ('2', '酸奶发酵粉', '1512462982', '1512462982', '1', '100', '0');
INSERT INTO `wl_cate` VALUES ('3', '1111', '1513058984', '1513058984', '1', '100', '0');
INSERT INTO `wl_cate` VALUES ('4', '二级分类', '1513058992', '1513062111', '1', '100', '2');

-- ----------------------------
-- Table structure for wl_collect
-- ----------------------------
DROP TABLE IF EXISTS `wl_collect`;
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

-- ----------------------------
-- Records of wl_collect
-- ----------------------------

-- ----------------------------
-- Table structure for wl_coupon
-- ----------------------------
DROP TABLE IF EXISTS `wl_coupon`;
CREATE TABLE `wl_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule` int(11) NOT NULL COMMENT '规则',
  `solution` int(11) NOT NULL COMMENT '解决方案',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `name` varchar(50) DEFAULT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL COMMENT '优惠券图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wl_coupon
-- ----------------------------
INSERT INTO `wl_coupon` VALUES ('1', '100', '88', '1', '789', '1513008000', '1513353600', '1512984229', '1513046735', '/upload/coupon/20171211\\50a5c7a14f1eb0066856cb4007b80ded.jpg');
INSERT INTO `wl_coupon` VALUES ('2', '60', '99', '1', 'aaa', '1512921600', '1514304000', '1512984439', '1513046905', '/upload/coupon/20171211\\9e0a247adab6c01b2cb1de29e04dc5ea.jpg');
INSERT INTO `wl_coupon` VALUES ('3', '500', '300', '1', 'qqqqq', '1512921600', '1514649600', '1513046796', '1513046875', '/upload/coupon/20171212\\fd28da9c9aea4e5961a702c4b848486f.jpg');

-- ----------------------------
-- Table structure for wl_fankui
-- ----------------------------
DROP TABLE IF EXISTS `wl_fankui`;
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

-- ----------------------------
-- Records of wl_fankui
-- ----------------------------

-- ----------------------------
-- Table structure for wl_good
-- ----------------------------
DROP TABLE IF EXISTS `wl_good`;
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='资料表';

-- ----------------------------
-- Records of wl_good
-- ----------------------------
INSERT INTO `wl_good` VALUES ('1', 'aaa', '1000', '0', '1', '/upload/good_img/20171205/b79c673cadb2cb0599df37ff239cca81.jpg', '', '1500.00', '<strong>21212121212121aaa</strong>', '1', '1512463262', '1512526897', '0', '1', '0', '0');
INSERT INTO `wl_good` VALUES ('2', '发酵粉', '500', '0', '2', '/upload/good_img/20171205/d48f48afedbbd3cde302026ccf222305.jpg', '', '15.00', '7897979', '1', '1512463579', '1512532182', '0', '2', '0', '0');
INSERT INTO `wl_good` VALUES ('3', 'suannai', '10000', '0', '1', '/upload/good_img/20171206/7973a47410caddfcb6bf9933ad0db711.jpg', '', '150.00', '31313123', '1', '1512526832', '1512611263', '0', '1', '1', '0');
INSERT INTO `wl_good` VALUES ('4', '123', '50', '0', '1', '/upload/good_img/20171211\\99e1a6599cb07f1d72d1728fc8efe1e0.jpg', '', '10000.00', '12213', '1', '1512962537', '1512979570', '0', '1', '0', '1');

-- ----------------------------
-- Table structure for wl_good_img_bigs
-- ----------------------------
DROP TABLE IF EXISTS `wl_good_img_bigs`;
CREATE TABLE `wl_good_img_bigs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL COMMENT '商品id',
  `img_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大图位置',
  `st` tinyint(4) DEFAULT '1' COMMENT '状态：1正常 0删除',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商品大图（多个 ）';

-- ----------------------------
-- Records of wl_good_img_bigs
-- ----------------------------
INSERT INTO `wl_good_img_bigs` VALUES ('1', '2', '/upload/good_img_big/20171206/19f21333bb23a614cffd9f386044c6d6.jpg', '0', '0', '0');
INSERT INTO `wl_good_img_bigs` VALUES ('2', '2', '/upload/good_img_big/20171206/cc2ef772b2c878ad950af53a145dd9aa.jpg', '0', '0', '0');
INSERT INTO `wl_good_img_bigs` VALUES ('3', '2', '/upload/good_img_big/20171206/412a1eda09836d1d396eceab3264e798.jpg', '0', '0', '0');
INSERT INTO `wl_good_img_bigs` VALUES ('4', '2', '/upload/good_img_big/20171206/aa5cdf209b24670fea97243f483a5c96.jpg', '0', '0', '0');
INSERT INTO `wl_good_img_bigs` VALUES ('5', '2', '/upload/good_img_big/20171206/18fb343c5e6635346ade80376f2cd51f.jpg', '0', '0', '0');
INSERT INTO `wl_good_img_bigs` VALUES ('6', '2', '/upload/good_img_big/20171206/e3844bb43b5c001886c161dedbc429e5.jpg', '0', '0', '0');
INSERT INTO `wl_good_img_bigs` VALUES ('7', '3', '/upload/good_img_big/20171207/f47c26a1f4ce900e20589611ed3cbda1.jpg', '0', '0', '0');
INSERT INTO `wl_good_img_bigs` VALUES ('8', '3', '/upload/good_img_big/20171207/dfe9d868a3146e95c1aa6f2d0a48cfd2.jpg', '0', '0', '0');
INSERT INTO `wl_good_img_bigs` VALUES ('9', '3', '/upload/good_img_big/20171207/b9d6f6657f387a29f003e30465ec0105.jpg', '0', '0', '0');
INSERT INTO `wl_good_img_bigs` VALUES ('10', '3', '/upload/good_img_big/20171207/bff4ff9c9a98bef380f69a8cf6b41412.jpg', '0', '0', '0');

-- ----------------------------
-- Table structure for wl_menu_admin
-- ----------------------------
DROP TABLE IF EXISTS `wl_menu_admin`;
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
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='后台左侧导航';

-- ----------------------------
-- Records of wl_menu_admin
-- ----------------------------
INSERT INTO `wl_menu_admin` VALUES ('29', '主要管理', '0', '', 'index', '', '0', '1512445271', '1512445271', '1');
INSERT INTO `wl_menu_admin` VALUES ('30', '广告图', '29', 'Ad', 'index', '', '0', '1512445286', '1512445286', '1');
INSERT INTO `wl_menu_admin` VALUES ('31', '分类', '29', 'Cate', 'index', '', '0', '1512445318', '1512445318', '1');
INSERT INTO `wl_menu_admin` VALUES ('33', '商品', '29', 'Good', 'index', '', '0', '1512446048', '1512446056', '1');
INSERT INTO `wl_menu_admin` VALUES ('35', '订单管理', '29', 'Order', 'index', '', '0', '1512611564', '1512611564', '1');
INSERT INTO `wl_menu_admin` VALUES ('36', '优惠券', '29', 'Coupon', 'index', '', '0', '1512616878', '1512616878', '1');
INSERT INTO `wl_menu_admin` VALUES ('37', '小程序用户', '29', 'User', 'index', '', '0', '1512701648', '1512703906', '1');
INSERT INTO `wl_menu_admin` VALUES ('38', '消息', '29', 'Message', 'index', '', '0', '1512704300', '1512710316', '1');

-- ----------------------------
-- Table structure for wl_message
-- ----------------------------
DROP TABLE IF EXISTS `wl_message`;
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wl_message
-- ----------------------------
INSERT INTO `wl_message` VALUES ('1', '1', '1', '0', '1512714551', '1512723472', '66666889', '测试一下');

-- ----------------------------
-- Table structure for wl_order
-- ----------------------------
DROP TABLE IF EXISTS `wl_order`;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderno` (`orderno`),
  KEY `user_id` (`user_id`,`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of wl_order
-- ----------------------------
INSERT INTO `wl_order` VALUES ('1', '123456789', '1', '1', '100.00', '0', '0', '1', '1', '1');

-- ----------------------------
-- Table structure for wl_order_contact
-- ----------------------------
DROP TABLE IF EXISTS `wl_order_contact`;
CREATE TABLE `wl_order_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(255) NOT NULL COMMENT '用于支付的订单号',
  `sum_price_all` decimal(10,2) DEFAULT '0.00' COMMENT '总价，可能是多个商家的',
  `st` tinyint(4) DEFAULT '1' COMMENT '0删除，1待支付 ,2已支付',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='多商家订单联合表(一对多)订单表';

-- ----------------------------
-- Records of wl_order_contact
-- ----------------------------

-- ----------------------------
-- Table structure for wl_order_good
-- ----------------------------
DROP TABLE IF EXISTS `wl_order_good`;
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
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单商品表';

-- ----------------------------
-- Records of wl_order_good
-- ----------------------------

-- ----------------------------
-- Table structure for wl_property
-- ----------------------------
DROP TABLE IF EXISTS `wl_property`;
CREATE TABLE `wl_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `good_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `st` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wl_property
-- ----------------------------
INSERT INTO `wl_property` VALUES ('1', 'a', '1.00', '3', '1512532103', '1512532103', '0');
INSERT INTO `wl_property` VALUES ('2', 'b', '2.00', '3', '1512532103', '1512532103', '0');
INSERT INTO `wl_property` VALUES ('3', 'c', '3.00', '3', '1512532103', '1512532103', '0');
INSERT INTO `wl_property` VALUES ('4', '100g', '2.00', '3', '1512611263', '1512611263', '1');
INSERT INTO `wl_property` VALUES ('5', '150g', '3.00', '3', '1512611263', '1512611263', '1');
INSERT INTO `wl_property` VALUES ('6', '200g', '3.50', '3', '1512611263', '1512611263', '1');

-- ----------------------------
-- Table structure for wl_setting
-- ----------------------------
DROP TABLE IF EXISTS `wl_setting`;
CREATE TABLE `wl_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `withdraw_limit` int(11) DEFAULT '0' COMMENT '商户申请提现最小金额',
  `contact` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '平台地址',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '平台电话',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `telephone` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='网站相关设置';

-- ----------------------------
-- Records of wl_setting
-- ----------------------------

-- ----------------------------
-- Table structure for wl_shop
-- ----------------------------
DROP TABLE IF EXISTS `wl_shop`;
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

-- ----------------------------
-- Records of wl_shop
-- ----------------------------

-- ----------------------------
-- Table structure for wl_shop_address
-- ----------------------------
DROP TABLE IF EXISTS `wl_shop_address`;
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

-- ----------------------------
-- Records of wl_shop_address
-- ----------------------------

-- ----------------------------
-- Table structure for wl_shop_confirm
-- ----------------------------
DROP TABLE IF EXISTS `wl_shop_confirm`;
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

-- ----------------------------
-- Records of wl_shop_confirm
-- ----------------------------

-- ----------------------------
-- Table structure for wl_tuangou
-- ----------------------------
DROP TABLE IF EXISTS `wl_tuangou`;
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

-- ----------------------------
-- Records of wl_tuangou
-- ----------------------------

-- ----------------------------
-- Table structure for wl_user
-- ----------------------------
DROP TABLE IF EXISTS `wl_user`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='小程序会员表';

-- ----------------------------
-- Records of wl_user
-- ----------------------------
INSERT INTO `wl_user` VALUES ('1', '', 'hahah', 'hehehe', '', '1', '', null, '1', null, null, '0', '0');

-- ----------------------------
-- Table structure for wl_users_coupon
-- ----------------------------
DROP TABLE IF EXISTS `wl_users_coupon`;
CREATE TABLE `wl_users_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0  已用  1没用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wl_users_coupon
-- ----------------------------
INSERT INTO `wl_users_coupon` VALUES ('1', '1', '1', '1');
INSERT INTO `wl_users_coupon` VALUES ('2', '2', '1', '1');
INSERT INTO `wl_users_coupon` VALUES ('3', '3', '1', '1');
INSERT INTO `wl_users_coupon` VALUES ('4', '4', '1', '1');
INSERT INTO `wl_users_coupon` VALUES ('5', '5', '1', '1');
INSERT INTO `wl_users_coupon` VALUES ('6', '6', '1', '1');
INSERT INTO `wl_users_coupon` VALUES ('7', '11', '1', '1');
INSERT INTO `wl_users_coupon` VALUES ('8', '111', '1', '1');

-- ----------------------------
-- Table structure for wl_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `wl_withdraw`;
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

-- ----------------------------
-- Records of wl_withdraw
-- ----------------------------
