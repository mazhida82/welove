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
        $list = self::where(['user_id'=>$user_id,'id'=>$data['message_id'],'st'=>1])->find();
        if(!$list ->save(['type' => 1])){
            return ['code'=>__LINE__,'msg'=>'修改状态失败'];
        }
        return ['code'=>0,'data'=>$list];
    }

    public function delMsgByUser($id){
        $res = self::where(['id' => $id,'st' => 1])->find();
        if(!$res){
            return ['code' => __LINE__, 'msg' => '暂无此数据'];
        }
        $res->st = 2;
        if (!$res->save()) {
            return ['code' => __LINE__, 'msg' => '删除失败'];
        }
        return ['code' => 0, 'msg' => '删除成功'];
    }
}