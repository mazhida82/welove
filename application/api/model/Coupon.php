<?php
namespace app\api\model;
use think\model;

class Coupon extends Base{

    /**
     * 获取主页优惠券列表
     * @return \think\response\Json
     */
    public static function getList($data){
        $user_id = User::getUserIdByName($data);
        $field = 'wl_coupon.*,wl_users_coupon.coupon_id,wl_users_coupon.user_id';
        $list = self::where(['wl_coupon.status' => 1 ])->order('solution asc')->select();
        foreach ($list as $k => $v) {
            $cid = $v->id;
            $res = UserCoupon::getListByUidCid($user_id,$cid);
            if(!$res){
                $v -> get = 'no';
            }else{
                $v -> get = 'yes';
            }
        }
        return ['code' => 0,'data' => $list];
    }

    /**
     * 领取优惠券
     * @param $data
     * @return array
     */
    public function getCoupon($data){
        $user_id = User::getUserIdByName($data['username']);
        unset($data['username']);
        $data['user_id'] = $user_id;
        $list = UserCoupon::getList($data);
        if(empty($list->data)){
            $res = (new UserCoupon())->save($data);
            $row = UserCoupon::getList($data);
            return ['code' => 0,'msg' => '领取成功','coupon_id' => $row['coupon_id']];
        }else{
            return ['code'=>__LINE__,'msg'=>'请勿重新领取'];
        }
    }

    /**
     * 查询我的优惠券
     * @param $data
     * @return array
     */
    public static function getMyCoupon($data){
        $user_id = User::getUserIdByName($data['username']);
        $res = UserCoupon::getListByUser($user_id);
        if(empty($res)){
            return ['code'=>__LINE__,'msg'=>'暂无优惠券'];
        }
        return ['code'=>0,'data'=>$res];
    }

    /**
     * 获取可用的优惠券
     * @param $data
     * @return array
     */
    public static function getUsable($data){
        $user_id = User::getUserIdByName($data['username']);
        unset($data['username']);
        $data['user_id'] = $user_id;
        $res = UserCoupon::getListByPriceUser($data);
        if(empty($res)){
            return ['code'=>__LINE__,'msg'=>'暂无可使用的优惠券'];
        }
        return ['code'=>0,'data'=>$res];
    }



}