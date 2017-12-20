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

    /**
     * 用户在主页领取优惠券
     * @param Request $request
     * @return \think\response\Json
     */
    public function get(Request $request){
        $data = $request->param();
        $rule = ['username'=>'require','coupon_id'=>'require|number'];
        $res = $this->validate($data,$rule);
        if($res !== true){
            $this->error('用户名或优惠券ID有误');
        }
        return json((new Coupon())->getCoupon($data));
    }

    /**
     * 查询我的优惠券
     * @param Request $request
     * @return \think\response\Json
     */
    public function my(Request $request){
        $data = $request->param();
        $rule = ['username'=>'require'];
        $res = $this->validate($data,$rule);
        if($res !== true){
            $this->error('用户名有误');
        }
        return json(Coupon::getMyCoupon($data));
    }

    public function usable(Request $request){
        $data = $request->param();
        $rule = ['username'=>'require','sum_price_all'=>'require|float'];
        $res = $this->validate($data,$rule);
        if($res !== true){
            $this->error('用户名或总价有传值错误');
        }
        return json(Coupon::getUsable($data));
    }
}