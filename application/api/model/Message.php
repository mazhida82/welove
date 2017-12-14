<?php

namespace app\api\model;

use think\Model;
use think\Request;

class Message extends Base {

    /**
     * 获取消息列表
     * @param $data
     * @return array
     */
    public static function getList($data){
        $user_id = User::getUserIdByName($data);
        $list = self::where(['user_id'=>$user_id,'st'=>1])->order('create_time desc')->paginate(8);
        if($list->isEmpty()){
            return ['code'=>__LINE__,'msg'=>'暂无消息'];
        }
        return ['code'=>0,'data'=>$list];
    }

    /**查看消息详情
     * @param $data
     * @return array
     */
    public static function getInfo($data){
        $user_id = User::getUserIdByName($data['username']);
        $list = self::where(['user_id'=>$user_id,'id'=>$data['message_id']])->find();
//        if($list->isEmpty()){
//            return ['code'=>__LINE__,'msg'=>'暂无数据'];
//        }
        return ['code'=>0,'data'=>$list];
    }
//    /*
//     * 用户留言列表
//     *
//     * zhuangxiu-zyg
//     * */
//    public static function getList($data) {
//        $user_id = User::getUserIdByName($data['username']);
//
//        $list_ = self::where(['st' => 1, 'user_id' => $user_id, 'shop_id' => $data['shop_id']])->order('create_time asc')->select();
//
//        if ($list_->isEmpty()) {
//            return ['code' => __LINE__];
//        }
//        return ['code' => 0, 'msg' => '数据成功', 'data' => $list_];
//    }
//
//    /*
// * 添加用户留言
// *
// * zhuangxiu-zyg
// * */
//    public function addMessage($data) {
//        $user_id = User::getUserIdByName($data['username']);
//        if (is_array($user_id)) {
//            return $user_id;
//        }
//        $data['user_id'] = $user_id;
//        unset($data['username']);
//        if (!$this->save($data)) {
//            return ['code' => __LINE__, 'msg' => '添加失败'];
//        }
//        return ['code' => 0, 'msg' => '添加成功'];
//    }
//
//    public function delMsg($id) {
//        $row_ = self::where(['id' => $id,'st'=>1])->find();
//        if (!$row_) {
//            return ['code' => __LINE__, 'msg' => '留言不存在'];
//        }
//        if ($row_->st == 2) { //
//            return ['code' => __LINE__, 'msg' => '留言已删除'];
//        }
//        $row_->st = 2;
//        if (!$row_->save()) {
//            return ['code' => __LINE__, 'msg' => '删除失败'];
//        }
//        return ['code' => 0, 'msg' => '删除成功'];
//    }


}