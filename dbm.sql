


























-- 二〇一七年十二月十四日 10:39:24
ALTER TABLE `wl_cart`
DROP COLUMN `shop_id`;


ALTER TABLE `wl_cart_good`
DROP COLUMN `shop_id`;

ALTER TABLE `wl_cate`
ADD COLUMN `img`  varchar(255) NULL AFTER `pid`;


-- 2017年12月16日 15:06:42
ALTER TABLE `wl_cart_good`
ADD COLUMN `property_id`  int(11) NOT NULL AFTER `st`;

ALTER TABLE `wl_cart_good`
MODIFY COLUMN `property_id`  int(11) NOT NULL DEFAULT 0 AFTER `st`;










