--2017年12月4日 11:56:37
ALTER TABLE `wl_admin`
DROP COLUMN `shop_id`;


ALTER TABLE `wl_admin`
ADD COLUMN `type`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '1超级 2一般' AFTER `privilege`;

ALTER TABLE `wl_cate`
DROP COLUMN `type`;

ALTER TABLE `wl_good`
DROP COLUMN `shop_id`;

ALTER TABLE `wl_good`
DROP COLUMN `which_info`;

ALTER TABLE `wl_good`
DROP COLUMN `imgs`;

ALTER TABLE `wl_good`
DROP COLUMN `is_add_attr`;

ALTER TABLE `wl_good`
DROP COLUMN `is_add_attr`,
DROP COLUMN `unit`;

CREATE TABLE `NewTable` (
`id`  int NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) NOT NULL DEFAULT '' COMMENT '规格名称' ,
`good_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
;

ALTER TABLE `wl_good`
ADD COLUMN `sku_id`  int(11) NOT NULL DEFAULT 0 COMMENT '0没有规格  其他对应规格表' AFTER `img_big_st`;

ALTER TABLE `wl_good`
ADD COLUMN `sort`  tinyint(4) NOT NULL DEFAULT 100 COMMENT '排序' AFTER `sku_id`;










