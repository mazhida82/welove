<?php

namespace app\api\model;

use app\back\model\Good;
use think\Db;
use think\Model;

class Cart extends Base {

    public function getStAttr($value) {
        $status = [0 => 'deleted', 1 => '正常'];
        return $status[$value];
    }
    /**
     * 添加购物车
     * @param $data
     * @return array|mixed
     */
    public function addCart($data) {
        if(!array_key_exists('property_id',$data)){
            $data['property_id'] = 0;
        }
        $user_id = User::getUserIdByName($data['username']);
        if (is_array($user_id)) {
            return $user_id;
        }
        $row_good = self::getById($data['good_id'], new Good);
        if (!$row_good) {
            return ['code' => __LINE__, 'msg' => '无商品'];
        }
        $row_cart = self::where(['user_id' => $user_id])->find();
//        dump($row_cart);exit;
        if (!$row_cart) {//没有此商家的购物车
            //无规格
            if($data['property_id'] == 0 ){
                $data_cart['user_id'] = $user_id;
                $data_cart['sum_price'] = $row_good->price * $data['num'];
                $this->save($data_cart);
                $data_good = ['cart_id' => $this->id, 'good_id' => $row_good->id,  'num' => $data['num'],'property_id'=>0];
                return (new CartGood)->addNoSPEC($data_good);
            }else{
            //有规格
                $data_cart['user_id'] = $user_id;
                $property = (new Property())->where(['id'=>$data['property_id'],'st'=>1])->find();
                $data_cart['sum_price'] = $property->price*$data['num'];
                $this->save($data_cart);
                $data_good = ['cart_id' => $this->id, 'good_id' => $row_good->id,  'num' => $data['num'],'property_id'=>$data['property_id']];
                return (new CartGood)->addHvSPEC($data_good);
            }
        }
        //无规格
        if($data['property_id'] == 0 ){
            $row_cart->sum_price += $row_good->price * $data['num'];
            $row_cart->st = 1;
            $row_cart->save();
            $data_good = ['cart_id' => $row_cart->id, 'good_id' => $row_good->id, 'num' => $data['num'],'property_id'=>0];
            return (new CartGood)->addNoSPEC($data_good);
        }else{
        //有规格
            $property = (new Property())->where(['id'=>$data['property_id'],'st'=>1])->find();
            $row_cart->sum_price += $property->price * $data['num'];
            $row_cart->st = 1;
            $row_cart->save();
            $data_good = ['cart_id' => $row_cart->id, 'good_id' => $row_good->id, 'num' => $data['num'],'property_id'=>$data['property_id']];
            return (new CartGood)->addHvSPEC($data_good);
        }
    }

    /**
     * 查看购物车
     * @param $username
     * @return array|mixed
     */
    public static function getListByUser($username) {
        $user_id = User::getUserIdByName($username);
        if (is_array($user_id)) {
            return $user_id;
        }
        $list_cart = self::where(['user_id' => $user_id, 'wl_cart.st' => 1])->find();
        if (empty($list_cart->data)) {
            return ['code' => __LINE__, 'msg' => '无商品'];
        }
        $sum_price_all = 0;
        if(!empty($list_cart->data)){
            $list_good = CartGood::getGoods($list_cart->data['id']);
            foreach($list_good as $k=>$v){
                if($v['property_st'] != 0){
                    $property = (new Property())->where(['id'=>$v['property_id'],'st'=>1])->find();
                   if($property){
                       $v['price'] = $property->price;
                       $v['property'] = $property->value;
                       $sum_price_all+= $property->price;
                   }

                }else{
                    $sum_price_all+= $v->price;
                }
            }
            //$sum_price_all += $list_cart->data['sum_price'];
        }
        return ['code' => 0, 'msg' => '获取购物车数据成功', 'sum_price_all' => $sum_price_all, 'data' => $list_good];
    }

    /*
     * using zyg
     * */
    public function deleteGood($data) {
        $user_id = User::getUserIdByName($data['username']);
        if (is_array($user_id)) {
            return $user_id;
        }
        $row_good = self::getById($data['good_id'],new \app\api\model\Good(),'price');
        if (!$row_good) {
            return ['code' => __LINE__, 'msg' => '商品不存在'];
        }
        Db::startTrans();
        try{
            //无规格
            if($data['property_id'] == 0){
                $row_cart_good = CartGood::where(['cart_id'=>$data['cart_id'],'good_id'=>$data['good_id'],'property_id'=>0,'st'=>1])->find();

                $minus_price = $row_cart_good->num * $row_good->price;

                $row_cart_good->st = 0;
                $row_cart_good->save();

                $row_cart = self::getById($data['cart_id'], new Cart);
                $row_cart->sum_price -= $minus_price;

                $row_cart_good = CartGood::where(['cart_id'=>$row_cart->id,'st'=>1])->find();
                if (!$row_cart_good) {
                    $row_cart->sum_price =0;
                    $row_cart->st = 0;
                }
                $row_cart->save();
                Db::commit();
                return ['code' => 0, 'msg' => '删除成功'];
            }
            //有规格
                $property = self::getById($data['property_id'], new Property());

                $row_cart_good = CartGood::where(['cart_id'=>$data['cart_id'],'good_id'=>$data['good_id'],'property_id'=>$data['property_id'],'st'=>1])->find();
//            dump($row_cart_good);exit;
                $minus_price = $row_cart_good->num * $property->price;

                $row_cart_good->st = 0;
                $row_cart_good->save();

                $row_cart = self::getById($data['cart_id'], new Cart);
                $row_cart->sum_price -= $minus_price;

                $row_cart_good = CartGood::where(['cart_id'=>$row_cart->id,'st'=>1])->find();
                if (!$row_cart_good) {
                    $row_cart->sum_price =0;
                    $row_cart->st = 0;
                }
                $row_cart->save();
                Db::commit();
                return ['code' => 0, 'msg' => '删除成功'];
        }catch (\Exception $e){
            Db::rollback();
            return ['code' => __LINE__, 'msg' => '删除失败'];
        }




    }

}
