<?php

namespace app\back\controller;
use app\back\model\Base;
use app\back\model\Coupon;
use think\Request;

class CouponController extends BaseController{

    /**
     * 优惠券主页渲染
     * @param Request $request
     * @return mixed
     */
    public function index(Request $request){
        $data = $request->param();
        $list = Coupon::getList($data);
        $page_str = $list->render();
        $page_str = Base::getPageStr($data,$page_str);
        $url = $request->url();
        return $this->fetch('index',['list'=>$list,'url'=>$url,'page_str'=>$page_str]);
    }

    /**
     * 添加优惠券页渲染
     * @return mixed
     */
    public function create(){
        return $this->fetch('',['title'=>'添加商品优惠券','act'=>'save']);
    }

    /**
     * 执行优惠券添加动作
     * @param Request $request
     */
    public function save(Request $request){
        $data = $request->param();
        $data['start_time'] = strtotime($data['start_time']);
        $data['end_time'] = strtotime($data['end_time']);
        (new Coupon())->save($data);
        $this->success('添加成功', 'index', '', 1);
    }

    /**
     * 优惠券修改页渲染
     */
    public function edit(Request $request){
        $id = $request->get('id');
        $list = $this->findById($id,new Coupon());
        $referer = $request->header()['referer'];
        return $this->fetch('', ['id' => $id, 'referer' => $referer, 'title' => '修改 ' . $list->name . ' 优惠券', 'act' => 'update','list'=>$list]);
    }

    /**
     * 执行修改优惠券动作
     * @param Request $request
     */
    public function update(Request $request){
        $data = $request->param();
        $referer = $data['referer'];
        $data['start_time'] = strtotime($data['start_time']);
        $data['end_time'] = strtotime($data['end_time']);
        unset($data['referer']);
        if ($this->saveById($data['id'], new Coupon(), $data)) {

            $this->success('修改成功', $referer, '', 1);
        } else {
            $this->error('修改失败', $referer, '', 1);
        }
    }

    public function delete(Request $request){
        $data = $request->param();
//        dump($data);exit;
        if ($this->deleteStById($data['id'], new Coupon())) {
            $this->success('删除成功', $data['url'], '', 1);
        } else {
            $this->error('删除失败', $data['url'], '', 3);
        }
    }




}