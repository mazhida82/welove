<?php

namespace app\api\controller;


use app\api\model\Message;
use think\Request;

class MessageController extends BaseController
{
    /**
     * 我的消息列表
     * @param Request $request
     * @return \think\response\Json
     */
    public function mlist(Request $request){
        $data = $request->param();
        $rule=['username'=>'require'];
        $res = $this->validate($data,$rule);
        if ($res !== true) {
            return json(['code' => __LINE__, 'msg' => '用户名传值错误']);
        }
        return json(Message::getList($data['username']));
    }

    /**
     * 查看消息详情页
     * @param Request $request
     * @return \think\response\Json
     */
    public function info(Request $request){
        $data = $request -> param();
        $rule = ['username'=>'require','message_id'=>'require|number'];
        $res = $this->validate($data, $rule);
        if($res !== true){
            return json(['code'=>__LINE__,'msg'=>'传值错误']);
        }
        return json(Message::getInfo($data));
    }

    /**
     * 用户删除消息
     * @param Request $request
     */
    public function delete_user(Request $request){
        $data = $request -> param();
        $rule=[
            'id'=>'require|number'
        ];
        $res = $this->validate($data, $rule);
        if($res !== true){
            return json(['code'=>__LINE__,'msg'=>'id传值错误']);
        }
        return json((new Message())->delMsgByUser($data['id']));
    }


}
