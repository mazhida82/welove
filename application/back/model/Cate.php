<?php

namespace app\back\model;

use think\Model;

class Cate extends model {
    public function getStAttr($value) {
        $status = [0 => 'deleted', 1 => '正常'];
        return $status[$value];
    }
    public static function getList($data=[],$field='*',$where=['st' => ['<>', 0]]) {
//        $where = ['st' => ['<>', 0]];
        $order = "create_time desc";
        if (!empty($data['name'])) {
            $where['name'] = ['like', '%' . $data['name'] . '%'];
        }
        if (!empty($data['paixu'])) {
            $order = $data['paixu'] . ' asc';
        }
        if (!empty($data['paixu']) && !empty($data['sort_type'])) {
            $order = $data['paixu'] . ' desc';
        }
        $list_ = self::where($where)->order($order)->field($field)->select();

        return $list_;
    }

    public static function getChildId(){
        $list_parent = self::where(['pid'=>0,'st'=>1])->order('sort asc')->select();
        foreach($list_parent as $k=>$v){
            $list_child = self::where(['pid'=>$v->id,'st'=>1])->order('sort asc')->select();
            $list_parent[$k]['childs'] = $list_child;
        }
        return $list_parent;
    }

    public function getName($pid){
        return $pid==0?'一级':$this->where('id',$pid)->value('name');
    }


    public static function getListAll(){
        $where = ['st' => ['=',1],'type'=>['=',2]];
        $order = "create_time asc";
        $list_ = self::where($where)->order($order)->select();

        return $list_;
    }



}
