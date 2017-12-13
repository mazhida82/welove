<?php
namespace app\api\model;
use think\model;

class Coupon extends Base{

    /**
     * 获取主页优惠券列表
     * @return \think\response\Json
     */
    public static function getList(){
        $list = self::where(['status'=>1,'start_time'=>['lt',time()],'end_time'=>['gt',time()]])->order('solution asc')->select();
//        dump($list);exit;
        return ['code','data'=>$list];
    }

}