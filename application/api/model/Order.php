<?php

namespace app\api\model;
use think\Db;
use think\Model;

class Order extends Base{
    const ORDER_ST_UNPAID = 1;//订单待支付


    const GOOD_ST_OVERHANG = 1;//商品待发货
    /**
     * 添加商品订单
     * @param $data
     * @return array|mixed
     */
    public function addOrder($data){
        $user_id = User::getUserIdByName( $data['username'] );
        if ( is_array( $user_id ) ) {
            return $user_id;
        }
        $arr_good_list = json_decode( $data['GoodList'] );
        if ( !is_array( $arr_good_list ) ) {
            return ['code' => __LINE__ , 'msg' => '数据错误'];
        }
        //是否使用优惠券
        if( $data['coupon_id'] != 0 ) {
            $coupon = ( new Coupon() )->where([ 'id' => $data['coupon_id']] )->find();
            $bestPrice = $coupon -> solution;
            $rule = $coupon -> rule;
            if( $data['sum_price_all'] >= $rule) {
                $data['sum_price_all'] = $data['sum_price_all'] - $rule;
                //修改我的优惠券状态->已使用
                (new UserCoupon())->where([ 'id' => $data['coupon_id'] , 'user_id' => $user_id ,'st' => 1 ])->update( [ 'st' => 0 ] );
            }else{
                return [ 'code' => __LINE__ , 'msg' => '不满足优惠要求' ];
            }
        }
        //添加订单表
        $data_order = [
            'orderno'       => $this -> makeTradeNo( $data['username'] ) ,
            'user_id'       => $user_id ,
            'address_id'    => $data['address_id'] ,
            'sum_price'     => $data['sum_price_all'] ,
            'st'            => self::ORDER_ST_UNPAID ,
            'goodst'        => self::GOOD_ST_OVERHANG ,
            'coupon_id'     => $data['coupon_id'] ,
            'create_time'  => time() ,
            'update_time'  => time() ,
        ];
        if ( !$new_order_id = $this->insertGetId( $data_order ) ) {
            return ['code' => __LINE__ , 'msg' => '添加失败'];
        }

        //添加订单商品表开始
        foreach ( $arr_good_list as $good ) {
            //  添加订单商品
            $data_order_good = [
                'order_id'      => $new_order_id ,
                'good_id'       => $good -> good_id ,
                'num'           => $good -> num ,
                'st'            => OrderGood::ST_PREPARE ,
                'img'           => $good -> img ,
                'name'          => $good -> name ,
                'price'         => $good -> price ,
                'property_id'  => $good -> property_id ,
            ];
            if ( !( new OrderGood() )->save( $data_order_good ) ) {
                return ['code' => __LINE__ , 'msg' => '添加失败'];
            }
        }
        return ['code' => 0 , 'msg' => '订单生成成功' ,'data' => $new_order_id ];
    }

    //生成订单号 wx
    public function makeTradeNo($username){
        return date( 'mdHis' , time() ) .mt_rand(1,99). mt_rand( 10 , 999 ) . '_' . $username;
    }
}