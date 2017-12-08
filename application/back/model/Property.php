<?php

namespace app\back\model;
use think\model;

class Property extends Base{


    public static function getListByGoodId($data){
        $list = self::where(['good_id'=>$data,'st'=>1])->select();
        return $list;
    }

}