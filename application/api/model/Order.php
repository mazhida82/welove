<?php

namespace app\api\model;
use think\Db;
use think\Model;

class Order extends Base{
    const ORDER_ST_UNPAID       = 1;//订单待支付
    const ORDER_ST_PAID         = 2;//订单已支付
    const ORDER_ST_REFUNDED     = 3;//订单已退款
    const ORDER_ST_USER_CANCEL  = 4;//用户取消订单
    const ORDER_ST_USER_DELETE  = 5;//用户删除订单
    const ORDER_ST_USER_REFUND  = 6;//用户退款订单
    const ORDER_ST_ADMIN_DELETE = 0;//管理员删除订单
    const GOOD_ST_OVERHANG      = 1;//商品待发货
    const GOOT_ST_RECEIVED     = 2;//商品已收货

    public function getStAttr($value){
        $status = ['0' => '管理员删除' , 1 => '待支付' , 2 => '已支付' , 3 => '已退款', 4 => '用户取消' , 5 => '用户删除',6=>'申请退款'];
        return $status[$value];
    }

    public function getGoodstAttr($value){
        $status = [1 => '没发货' , 2 => '已发货' , 3 => '已收货' ,  5 => '部分发货'];
        return $status[$value];
    }
    /**
     * 获取用户订单列表
     * @param $data
     * @return array|mixed
     */
    public static function getMyOrders($data){
        $user_id = User::getUserIdByName( $data['username'] );
        if ( is_array( $user_id ) ) {
            return $user_id;
        }
        $where = ['wl_order.st' => ['neq' , 0] , 'user_id' => $user_id];
        $where2 = ['wl_order.st' => ['neq' , self::ORDER_ST_USER_DELETE]];
        $field = 'wl_order.*,wl_order_good.name good_name,wl_order_good.price good_price,good_id,wl_order_good.property_id,num,img';
        $list_order = self::where( $where )->where( $where2 )->order( 'create_time desc' )->select();
        foreach ($list_order as $k => $v) {
            $good = (new OrderGood()) -> where([ 'order_id' => $v['id'] ]) ->select();
            $list_order[$k]['total_num'] = 0;
            foreach ($good as $m => $n){
                if($n['property_id'] != 0 ){
                    $property = (new Property())->where(['id'=>$n['property_id'],'st'=>1])->find();
                    $n['property'] = $property -> value;
                }
                $list_order[$k]['total_num'] += $n['num'];
            }
            $list_order [$k]['order_good'] = $good;
        }
//        dump($list_order);exit;
        if ( empty($list_order)) {
            return ['code' => __LINE__ , 'msg' => '订单不存在'];
        }
        return ['code' => 0 , 'msg' => '获取订单列表成功' , 'data' => $list_order];
    }

    /**
     * 更改订单为已支付状态
     * @param $data
     * @return array
     */
    public static function updatePaySt($data){
        $row_order = self::find([ 'id' => $data['order_id'] ]);
        if ( !$row_order ) {
            return ['code' => __LINE__ , 'msg' => '订单不存在'];
        }
        $row_order->st = self::ORDER_ST_PAID;
        if ( !$row_order->save() ) {
            return ['code' => 0 , 'msg' => '支付状态失败'];
        }
        //给订单中的商品增加销量
        \app\api\model\OrderGood::increseSales( $row_order->id );

        return [ 'code' => 0 , 'msg' => '修改成功' ];
    }
    /**
     * 更改订单状态,商品物流状态
     * @param $data
     * @return array
     */
    public static function updateSt($data){
        $row_ = self::find( ['id' => $data['order_id']] );
        if ( !$row_ ) {
            return ['code' => __LINE__ , 'msg' => '订单不存在'];
        }
        if ( $data['st'] == 'cancel' ) {
            $row_->st = self::ORDER_ST_USER_CANCEL;
        } elseif ( $data['st'] == 'paid' ) {
            $row_->st = self::ORDER_ST_PAID;
        } elseif ( $data['st'] == 'taken' ) {
            $row_->goodst = self::GOOT_ST_RECEIVED;//已收货
            OrderGood::where( ['order_id' => $data['order_id']] )->update( ['st' => OrderGood::ST_TAKEN] );
        } elseif ( $data['st'] == 'delByUser' ) {
            $row_->st = self::ORDER_ST_USER_DELETE;
        }elseif ( $data['st'] == 'refundByUser' ) {
            $row_->st = self::ORDER_ST_USER_REFUND;
        }
        $row_->save();
        return ['code' => 0 , 'msg' => '订单状态更改'];
    }
    /**
     * 添加商品订单
     * @param $data
     * @return array|mixed
     */
    public function addOrder($data){
        if(!array_key_exists('coupon_id',$data)){
            $data['coupon_id'] = 0;
        }
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
                $data['sum_price_all'] = $data['sum_price_all'] - $bestPrice;
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
            'notes'         => $data['notes'] ,
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

    public static function getOrder($data){
        $order_id = $data['order_id'];
        $row_order = self::where( ['wl_order.id' => $order_id] )->find();
        if ( !$row_order ) {
            return ['code' => __LINE__ , 'msg' => '订单不存在'];
        }
        $list_order_goods = OrderGood::getGoodInfo( $order_id );
        if ( count( $list_order_goods ) == 0 ) {
            return ['code' => __LINE__ , 'msg' => '订单商品不存在'];
        }
        return ['code' => 0 , 'msg' => '查询订单成功' , 'data' => ['order' => $row_order , 'order_goods' => $list_order_goods]];
    }
}