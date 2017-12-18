<?php

namespace app\api\model;

use think\Model;

class CartGood extends model {

    public function getStAttr($value) {
        $status = [0 => 'deleted', 1 => '正常'];
        return $status[$value];
    }

    /**
     * 无规格
     * @param $data
     * @return array
     */
    public function addNoSPEC($data){
        $row_ = self::where(['good_id'=>$data['good_id'],'st'=>1])->find();
        if (!$row_) {
            if (!$this->save($data)) {
                return ['code' => __LINE__, 'msg' => '添加失败'];
            }
            return ['code' => 0, 'msg' => '添加成功'];
        }
        $row_->num += $data['num'];
        if (!$row_->save()) {
            return ['code' => __LINE__, 'msg' => '修改失败'];
        }
        return ['code' => 0, 'msg' => '修改成功'];
    }

    /**
     * 有规格
     * @param $data
     */
    public function addHvSPEC($data){
//        dump($data);exit;
        $row = self::where(['good_id'=>$data['good_id'],'st'=>1])->find();
        //商品购物车无商品
        if(!$row){
            if (!$this->save($data)) {
                return ['code' => __LINE__, 'msg' => '添加失败'];
            }
            return ['code' => 0, 'msg' => '添加成功'];
        }
        //有商品的情况
        $res = self::where(['good_id'=>$data['good_id'],'st'=>1,'property_id'=>$data['property_id']])->find();
        //规格id不一致
        if(!$res){
            if (!$this->save($data)) {
                return ['code' => __LINE__, 'msg' => '添加失败'];
            }
            return ['code' => 0, 'msg' => '添加成功'];
        }
        //规格id一致
        $res->num += $data['num'];
        if (!$res->save()) {
            return ['code' => __LINE__, 'msg' => '修改失败'];
        }
        return ['code' => 0, 'msg' => '修改成功'];
    }



    /*
     * useing
     * */
    public static function getGoodsByGood($good_id) {
        $list_ = self::where(['wl_cart_good.st'=>1,'wl_good.st'=>1])->join('wl_good','wl_cart_good.good_id=wl_good.id')->join('wl_property','wl_good.id=wl_property.good_id','LEFT')->select();
        return $list_;
    }

}
