<?php
namespace app\api\controller;
use app\api\model\Coupon;
use think\Request;

class CouponController extends BaseController
{

    /**
     * 获取主页优惠券列表
     * @return \think\response\Json
     */
    public function index(){
        return json(Coupon::getList());
    }
}