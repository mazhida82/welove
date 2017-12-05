--2017年12月4日 11:56:37
ALTER TABLE `wl_admin`
DROP COLUMN `shop_id`;


ALTER TABLE `wl_admin`
ADD COLUMN `type`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '1超级 2一般' AFTER `privilege`;

ALTER TABLE `wl_cate`
DROP COLUMN `type`;



