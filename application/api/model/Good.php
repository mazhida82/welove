<?php

namespace app\api\model;

use think\Model;
use think\Request;
use \think\Collection;
use app\api\model\Base;
use app\api\model\Property;
class Good extends Base {

    public function getStAttr($value) {
        $status = [0 => 'deleted', 1 => '正常', 2 => '下架'];
        return $status[$value];
    }

   public function getToTopAttr($value) {
        $status = [0 => '否', 1 => '是'];
        return $status[$value];
    }

    /**
     * wx首页商品
     * @return array
     */
    public static function getHomePage(){
        $list = self::where(['st'=>1,'is_home_page'=>1])->order('sort asc')->paginate(8);
        if($list->isEmpty()){
            return ['code'=>__LINE__];
        }
        return ['code'=>0,'data'=>$list];
    }

    public static function getGoodPage($data=[]){
        $order = 'wl_good.sort asc'; //默认按照排序字段来排序
        if(!array_key_exists('name',$data)){
            $where = ['wl_good.st'=>1,'cate_id'=>$data['cate_id']];
            if ( !empty( $data['paixu'] ) && $data['paixu'] == 'sales' ) {
                $order = "wl_good.sales desc";
            }
            if ( !empty( $data['paixu'] ) && $data['paixu'] == 'news' ) {
                $order = "wl_good.create_time desc";
            }
            if(!empty($data['paixu']) && $data['paixu']=='price'){
                $order = 'wl_good.price asc';//按照价格  正序
            }
            if(!empty($data['paixu']) && $data['paixu']=='expensive'){
                $order = 'wl_good.price desc';//按照价格  正序
            }
        }else{
            $where['wl_good.name'] = ['like','%' . $data['name'] . '%'];
        }
        $list = self::where($where)->order($order)->paginate(8);
        return ['code'=>0,'data'=>$list];
    }

    public static function getSearchList($data){
        if ( !empty( $data['name_'] ) ) {
            $where['shop.name|shop.truename|city'] = ['like' , '%' . $data['name_'] . '%'];
        }
        $order = 'wl_good.sort asc'; //默认按照排序字段来排序
        $list = self::where($where)->order($order)->paginate(8);
        return ['code'=>0,'data'=>$list];
    }

    public static function getInfo($data){
        $id = $data['good_id'];
        $list = self::where(['id'=>$id])->find();
//        dump($list->data['property_st']);exit;
        if(empty($list->data)){
            return ['code'=>__LINE__,'msg'=>'没有此商品'];
        }
        if($list->data['property_st']==1){
            $property = Property::where(['good_id'=>$list->data['id'],'st'=>1])->select();
            $arr = $list->data;
            foreach($property as $k=>$v){
                $arr['property'][$k] = $v->data;
//                $array['price'] = $v->price;
//                $array['value'] = $v->value;
//                $ar = array_merge($arr,$array);
//                $new[$k]=$ar;
            }
            return ['code'=>0,'data'=>$arr];
        }else{
            return ['code'=>0,'data'=>$list];
        }

    }
//    //using zyg
//    public static function findOne($data){
//        $row_ = self::where(['id'=>$data['good_id'],'st'=>1])->find();
//        $user_id = User::getUserIdByName($data['username']);
//        if(!$row_){
//            return ['code'=>__LINE__,'msg'=>'商品不存在'];
//        }
//        $res = Collect::getByDivId(new Collect,$where=['st'=>1,'collect_id'=>$data['good_id'],'user_id'=>$user_id,'type'=>1]);
//        if($res){
//            return ['code'=>0,'is_collect'=>'true','data'=>$row_];
//        }else{
//            return ['code'=>0,'is_collect'=>'false','data'=>$row_];
//        }
//
//    }
//    public function updateAddAttr($good_id){
//        $row_good = $this->where(['id'=>$good_id])->find();
//        $row_good->is_add_attr =1 ;
//        $row_good->save();
//
//    }
//    public static function getListByCateId($cate_id){
//        $row_ = self::where(['cate_id'=>$cate_id,'st'=>['<>',0]])->find();
//        if($row_){
//            return true;
//        }
//        return false;
//    }
//    public static function getListByshopId($shop_id){
//        $row_ = self::where(['shop_id'=>$shop_id,'st'=>['<>',0]])->find();
//        if($row_){
//            return true;
//        }
//        return false;
//    }
//    public static function getList($data=[],$field='good.*,cate.name cate_name,shop.name shop_name',$where=['good.st' => ['=', 1]]) {
//        //$where = ['good.st' => ['<>', 0], 'cate.st' => ['<>', 0]];
//        $order = "create_time desc";
//        if(Admin::isShopAdmin()){
//            $where['good.shop_id'] = session('admin_wl')->shop_id;
//        }
//        if (!empty($data['to_top'])) {
//            $where['good.to_top'] = $data['to_top'];
//        }
//        if (!empty($data['cate_id'])) {
//            $where['shop.cate_id'] = $data['cate_id'];
//        }
//        if (!empty($data['shop_id'])) {
//            $where['shop_id'] = $data['shop_id'];
//        }
//        if (!empty($data['name'])) {
//            $where['good.name'] = ['like','%'.$data['name'].'%'];
//        }
//        if(!empty($data['index_show'])){
//            $where['index_show'] = $data['index_show'];
//        }
//        if (!empty($data['paixu'])) {
//            $order = 'good.'.$data['paixu'] . ' asc';
//        }
//        if (!empty($data['paixu']) && !empty($data['sort_type'])) {
//            $order = 'good.'.$data['paixu'] . ' desc';
//        }
//        if(!empty($data['st']) ){
//            $where['good.st']= ['=',2];
//        }
//        $list_ = self::where($where)->join('shop','shop.id=good.shop_id')->join('cate', 'shop.cate_id=cate.id', 'left')->field($field)->order($order)->paginate();
////        dump($list_);exit;
//        return $list_;
//    }
//
//    //wx
//    public static function getBookRec(){
//        $list_ = self::where(['type'=>1,'index_show'=>1,'st'=>1])->field('id,img,name,price')->limit(5)->order('sort asc')->select();
//        return $list_;
//    }
//
//    //wx
//    public static function updateStore($order_id){
//        $list_order_good = OrderGood::getGood($order_id);
//        foreach($list_order_good as $item){
//            $row_good = Good::read($item->good_id);
//            $row_good->store = $row_good->store - $item->nums;
//            $row_good->sales = $row_good->sales + $item->nums;
//            $row_good->save();
//        }
//    }
//
//    /**
//     * 根据shop_id查询该店铺下的所有商品
//     * @param $shop_id
//     * @return \think\Paginator
//     */
//    public static function read($shop_id){
//        $list_ = self::where(['st'=>1,'shop_id'=>$shop_id])->field('id,name,price,img,unit')->order('sales desc')->cache()->paginate();
//        return $list_;
//    }
}
