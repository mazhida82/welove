<?php

namespace app\back\controller;
use app\back\model\Message;
use think\Request;
use app\back\model\Base;
use app\back\controller\BaseController;
use app\back\model\User;
class MessageController extends BaseController{
    /**
     * 展示留言主页
     * @param Request $request
     */
    public function index(Request $request){
        $data = $request->param();
        $list_ = Message::getList($data);
        $page_str = $list_->render();
        $page_str = Base::getPageStr($data, $page_str);
        $url = $request->url();
        return $this->fetch('index', ['list_' => $list_,'title'=>'消息列表','page_str' => $page_str,'url'=>$url]);
    }

    /**
     * 添加消息页面渲染
     * @return mixed
     */
    public function create(){
        return $this->fetch('',['title'=>'发布消息','act'=>'save']);
    }

    /**
     * 执行发送消息动作
     * @param Request $request
     */
    public function save(Request $request){
        $data = $request->param();
        $user = $this->findIdByName($data['name'],new User());
        unset($data['name']);
        $data['user_id'] = $user->id;
        (new Message())->save($data);
        $this->success('发布成功','index','','1');
    }

    /**
     * 查看消息页面渲染
     * @param Request $request
     * @return mixed
     */
    public function edit(Request $request) {
        $data = $request->param();
        $row = $this->findById($data['id'], new Message());
        $user = $this->findById($row['user_id'], new User());
        return $this->fetch('',['row'=>$row,'username'=>$user['username'],'title'=>'查看留言详情','act'=>'update']);
    }

    /**
     * 执行修改消息动作
     * @param Request $request
     */
    public function update(Request $request){
        $data = $request->param();
        $user = $this->findIdByName($data['name'],new User());
        unset($data['name']);
        $data['user_id'] = $user->id;
        if ($this->saveById($data['id'], new Message(), $data)) {
            $this->success('编辑成功', 'index', '', 1);
        } else {
            $this->error('编辑失败', 'index', '', 1);
        }
    }

    /**
     * 执行删除动作
     * @param Request $request
     */
    public function delete(Request $request){
        $data = $request->param();
        if ($this->deleteStatusById($data['id'], new Message())) {
            $this->success('删除成功', $data['url'], '', 1);
        } else {
            $this->error('删除失败', $data['url'], '', 3);
        }
    }
}
