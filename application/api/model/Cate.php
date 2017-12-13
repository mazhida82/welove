<?php

namespace app\api\model;

use think\Model;

class Cate extends model {
    public function getStAttr($value) {
        $status = [0 => 'deleted', 1 => '正常'];
        return $status[$value];
    }

    /**
     * 获取分类列表
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getList(){
        $list_first = self::where(['pid'=>0,'st'=>1])->order('sort asc')->select();
        foreach($list_first as $k=>$v){
            $list_child = self::where(['pid'=>$v->id,'st'=>1])->order('sort asc')->select();
            $list_first[$k]['childs'] = $list_child;
        }
        return ['code'=>0,'data'=>$list_first];
    }


}
