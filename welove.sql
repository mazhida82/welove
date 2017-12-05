/*
Navicat MySQL Data Transfer

Source Server         : php
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : zhuangxiu

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-12-04 10:22:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='在线活动（平台发布）';

-- ----------------------------
-- Table structure for activity_attend
-- ----------------------------
DROP TABLE IF EXISTS `activity_attend`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='活动报名';

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
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
  PRIMARY KEY (`id`),
  KEY `position` (`position`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='广告图／轮播图表';

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='收货人地址表';

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `wl_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '账号',
  `truename` varchar(50) DEFAULT '',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
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
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='后台管理员（超级及一般）';

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `wl_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT '1' COMMENT 'admin_id',
  `ip` varchar(50) DEFAULT '' COMMENT '上次登录ip',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='后台管理员登录日志';

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Table structure for baoming
-- ----------------------------
DROP TABLE IF EXISTS `baoming`;
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
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `wl_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `sum_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1表示有商品，0表示没有',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cart_good
-- ----------------------------
DROP TABLE IF EXISTS `cart_good`;
CREATE TABLE `wl_cart_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL COMMENT '购物车id',
  `shop_id` int(11) DEFAULT NULL COMMENT '商家id',
  `good_id` int(11) NOT NULL COMMENT '商品id,用于关联商品表',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '某个商品的数量',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1正常 0删除',
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车商品表';

-- ----------------------------
-- Table structure for cate
-- ----------------------------
DROP TABLE IF EXISTS `cate`;
CREATE TABLE `wl_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `st` tinyint(4) NOT NULL DEFAULT '1',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1装修 2百科',
  `sort` tinyint(4) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `wl_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `collect_id` int(11) NOT NULL,
  `st` tinyint(4) DEFAULT '1' COMMENT '1收藏 0不收藏',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `type` tinyint(4) NOT NULL COMMENT '1收藏商品id 2收藏店铺id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='收藏表';

-- ----------------------------
-- Table structure for dingdan
-- ----------------------------
DROP TABLE IF EXISTS `dingdan`;
CREATE TABLE `wl_dingdan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `orderno` varchar(50) NOT NULL COMMENT '订单编号',
  `user_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT '0',
  `sum_price` decimal(10,2) DEFAULT '0.00',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `goodst` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 => ''未发货'' , 2 => ''已发货'' , 5 => ''部分发货'' , 3 => ''已收货'' , 4 => ''已评价''',
  `st` tinyint(4) DEFAULT '1' COMMENT '1没支付  2完成支付 3取消 4退款',
  `order_contact_id` int(11) NOT NULL COMMENT '平台订单id',
  `type` tinyint(4) DEFAULT '1' COMMENT '1一般订单 2限量团购订单 3限人团购订单 ',
  `group_id` int(11) DEFAULT '0' COMMENT '0表示不团购订单',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderno` (`orderno`),
  KEY `user_id` (`user_id`,`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Table structure for fankui
-- ----------------------------
DROP TABLE IF EXISTS `fankui`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='反馈表';

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `wl_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `store` int(11) DEFAULT '1' COMMENT '库存数量',
  `sales` int(11) DEFAULT '0' COMMENT '销量，商品发货后增加',
  `cate_id` int(11) NOT NULL DEFAULT '1' COMMENT '分类id',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺id',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '列表图',
  `img_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大图',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `desc` text COMMENT '描述',
  `imgs` text COMMENT '商品详情文字介绍',
  `which_info` tinyint(4) DEFAULT '1' COMMENT '商品介绍时选择图片或是文字:1文字 2图片',
  `is_add_attr` tinyint(4) DEFAULT '0' COMMENT '是否添加参数',
  `st` tinyint(4) DEFAULT '1' COMMENT '0删除， 1正常 ,2不显示',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `to_top` tinyint(4) DEFAULT '0' COMMENT '1置顶 0不置顶',
  `unit` varchar(30) NOT NULL COMMENT '计量单位',
  `img_big_st` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0没有大图 1有大图',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`,`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='资料表';

-- ----------------------------
-- Table structure for good_img_bigs
-- ----------------------------
DROP TABLE IF EXISTS `good_img_bigs`;
CREATE TABLE `wl_good_img_bigs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL COMMENT '商品id',
  `img_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大图位置',
  `st` tinyint(4) DEFAULT '1' COMMENT '状态：1正常 0删除',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品大图（多个 ）';

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `wl_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '参加团购的商户',
  `good_id` int(11) NOT NULL COMMENT '参加团购的商品',
  `pnum` int(11) DEFAULT '0' COMMENT '参团人数至少',
  `store` int(11) NOT NULL COMMENT '限定团购数量（类型为2时要添加）',
  `price_group` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '团购价格',
  `deposit` decimal(10,2) DEFAULT '0.00' COMMENT '要交订金（类型为1时）',
  `end_time` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `st` tinyint(4) DEFAULT '1' COMMENT '0删除 1正在进行 2下架 3成功 4不成功',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1限人团购（要交订金） 2限时限量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团购商品表';

-- ----------------------------
-- Table structure for menu_admin
-- ----------------------------
DROP TABLE IF EXISTS `menu_admin`;
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
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='后台左侧导航';

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `wl_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `read_time` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '留言状态  0删除 1未读 2已读',
  `type` tinyint(4) NOT NULL COMMENT '类型  1用户发  2商户发',
  `update_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id  0为第一条信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_contact
-- ----------------------------
DROP TABLE IF EXISTS `order_contact`;
CREATE TABLE `wl_order_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(255) NOT NULL COMMENT '用于支付的订单号',
  `sum_price_all` decimal(10,2) DEFAULT '0.00' COMMENT '总价，可能是多个商家的',
  `st` tinyint(4) DEFAULT '1' COMMENT '0删除，1待支付 ,2已支付',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='多商家订单联合表(一对多)订单表';

-- ----------------------------
-- Table structure for order_good
-- ----------------------------
DROP TABLE IF EXISTS `order_good`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='订单商品表';

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
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
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='网站相关设置';

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
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
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='店铺表';

-- ----------------------------
-- Table structure for shop_address
-- ----------------------------
DROP TABLE IF EXISTS `shop_address`;
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
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商户门店地址';

-- ----------------------------
-- Table structure for shop_confirm
-- ----------------------------
DROP TABLE IF EXISTS `shop_confirm`;
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
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='申请店铺';

-- ----------------------------
-- Table structure for tuangou
-- ----------------------------
DROP TABLE IF EXISTS `tuangou`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='团购商品表';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='小程序会员表';

-- ----------------------------
-- Table structure for withdraw
-- ----------------------------
DROP TABLE IF EXISTS `withdraw`;
CREATE TABLE `wl_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '申请商户id',
  `cash` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '申请提现金额',
  `st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1待审核 2通过 3未通过',
  `cash_st` tinyint(4) NOT NULL DEFAULT '1' COMMENT '资金状态：1返还成功 2返还失败 ',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商户申请提现表';
