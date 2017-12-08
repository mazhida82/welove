<?php

namespace app\back\model;
use think\model;

class Coupon extends Base{

    protected $dateFormat = "Y-m-d H:i:s";
    /**
     * 优惠券主页渲染
     * @param $data
     * @return \think\Paginator
     */
    public static function getList($data) {
        $order = 'create_time desc';
        $where = ['status'=>['=',1]];
        if(!empty($data['paixu'])){
            $order = 'wl_coupon.'.$data['paixu'] . ' asc';
        }
        if (!empty($data['paixu']) && !empty($data['sort_type'])) {
            $order = 'wl_coupon.'.$data['paixu'] . ' desc';
        }
        $list = self::where($where)->order($order)->paginate(10);
        return $list;
    }
}