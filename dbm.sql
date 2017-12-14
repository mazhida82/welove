-- 2017年12月11日 11:13:41
ALTER TABLE `wl_good`
ADD COLUMN `is_home_page`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '0首页不推荐  1首页推荐' AFTER `property_st`;

ALTER TABLE `wl_ad`
ADD COLUMN `type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 轮播图 1主页广告图' AFTER `url_bianhao`;

ALTER TABLE `wl_coupon`
ADD COLUMN `img`  varchar(255) NOT NULL COMMENT '优惠券图片' AFTER `update_time`;

ALTER TABLE `wl_coupon`
MODIFY COLUMN `img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '优惠券图片' AFTER `update_time`;

ALTER TABLE `wl_coupon`
MODIFY COLUMN `rule`  int(11) NOT NULL COMMENT '规则' AFTER `id`,
MODIFY COLUMN `solution`  int(11) NOT NULL COMMENT '解决方案' AFTER `rule`;

ALTER TABLE `wl_cate`
ADD COLUMN `pid`  int(11) NOT NULL DEFAULT 0 COMMENT '0 为一级分类' AFTER `sort`;


-- 二〇一七年十二月十四日 10:39:24
ALTER TABLE `wl_cart`
DROP COLUMN `shop_id`;


ALTER TABLE `wl_cart_good`
DROP COLUMN `shop_id`;





