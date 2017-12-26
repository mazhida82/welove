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
    public function index(Request $request){
        $data =$request -> param();
        $rule = ['username'=>'require'];
        $res = $this->validate($data,$rule);
        if($res !== true){
            return ['code' => __LINE__ , 'msg' => '用户名传值错误'];
        }
        return json(Coupon::getList($data['username']));
    }

    /**
     * 领取优惠券前查询我领过的优惠券的详细信息
     * @param Request $request
     * @return array|\think\response\Json
     */
//    public function get_list(Request $request){
//        $data =$request -> param();
//        $rule = ['username'=>'require'];
//        $res = $this->validate($data,$rule);
//        if($res !== true){
//            return ['code' => __LINE__ , 'msg' => '用户名传值错误'];
//        }
//        return json(Coupon::getCouponList($data['username']));
//    }
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

    /**
     * 查找可用的优惠券
     * @param Request $request
     * @return \think\response\Json
     */
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