<?php

namespace app\api\model;

use think\Model;

class Ad extends Base {

    public function getStAttr($value) {
        $status = [0 => 'deleted', 1 => '正常', 2 => '不显示'];
        return $status[$value];
    }


    public static function getList() {

        $list_ = self::where(['st'=>1])->order( "sort asc")->cache()->select();

        return ['code'=>0,'data'=>$list_];

    }

    public static function getHomePage(){
        $list_ = self::where(['st'=>1,'type'=>1])->order('create_time desc')->limit(1)->select();
        return ['code'=>0,'data'=>$list_];
    }

    public static function getCatePage(){
        $list_ = self::where(['st'=>1,'type'=>2])->order('create_time desc')->limit(1)->select();
        return ['code'=>0,'data'=>$list_];
    }

}
