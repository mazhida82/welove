<?php

namespace app\back\model;

use think\Model;
use app\back\model\GoodAttr;

class Good extends Base {

    public function getStAttr($value) {
        $status = [0 => 'deleted', 1 => '正常', 2 => '下架'];
        return $status[$value];
    }

    public function updateAddAttr($good_id){
        $row_good = $this->where(['id'=>$good_id])->find();
        $row_good->is_add_attr =1 ;
        $row_good->save();

    }
    public static function getListByCateId($cate_id){
        $row_ = self::where(['cate_id'=>$cate_id,'st'=>['<>',0]])->find();
        if($row_){
            return true;
        }
        return false;
    }
    public static function getListByshopId($shop_id){
        $row_ = self::where(['shop_id'=>$shop_id,'st'=>['<>',0]])->find();
        if($row_){
            return true;
        }
        return false;
    }
    public static function getList($data=[],$field='wl_good.*,wl_cate.name cate_name',$where=['wl_good.st' => ['=', 1]]) {
        //$where = ['good.st' => ['<>', 0], 'cate.st' => ['<>', 0]];
        $order = "create_time desc";
        if (!empty($data['cate_id'])) {
            $where['wl_good.cate_id'] = $data['cate_id'];
        }
        if (!empty($data['name'])) {
            $where['wl_good.name'] = ['like','%'.$data['name'].'%'];
        }
        if (!empty($data['paixu'])) {
            $order = 'wl_good.'.$data['paixu'] . ' asc';
        }
        if (!empty($data['paixu']) && !empty($data['sort_type'])) {
            $order = 'wl_good.'.$data['paixu'] . ' desc';
        }
        if(!empty($data['st']) ){
            $where['wl_good.st']= ['=',2];
        }
        $list_ = self::where($where)->join('wl_cate', 'wl_cate.id=wl_good.cate_id', 'left')->field($field)->order($order)->paginate(10);
//        dump($list_);exit;
        return $list_;
    }

    //wx
    public static function getBookRec(){
        $list_ = self::where(['type'=>1,'index_show'=>1,'st'=>1])->field('id,img,name,price')->limit(5)->order('sort asc')->select();
        return $list_;
    }
    //wx
    public static function read($good_id){
        return self::getById($good_id,new self());
    }
    //wx
    public static function updateStore($order_id){
        $list_order_good = OrderGood::getGood($order_id);
        foreach($list_order_good as $item){
            $row_good = Good::read($item->good_id);
            $row_good->store = $row_good->store - $item->nums;
            $row_good->sales = $row_good->sales + $item->nums;
            $row_good->save();
        }
    }
}
