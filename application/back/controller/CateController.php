<?php

namespace app\back\controller;

use app\back\model\Shop;
use think\Request;
use app\back\model\Cate;
use app\back\model\Good;

class CateController extends BaseController {

    public function index(Request $request) {
        $data = $request->param();
        $list_ = Cate::getChildId();
//        dump($list_);exit;
        $url = $request->url();
        return $this->fetch('',['list_'=>$list_,'url'=>$url]);
    }

    public function create(Request $request) {
        $list = Cate::getChildId();
        return $this->fetch('', ['title'=>'添加分类','act'=>'save','list'=>$list]);
    }

    public function save(Request $request) {
        $data = $request->param();

        $res = $this->validate($data,'CateValidate');
        if($res!==true){
            $this->error($res);
        }
        // dump($data);exit;
        if((new Cate)->save($data)){
            $this->success('添加成功','index','',1);
        }else{
            $this->error('添加出错');
        }

    }

    public function edit(Request $request) {
        $data = $request->param();
        $referer= $request->header()['referer'];
        //dump($referer);
        $row_ = $this->findById($data['id'],new Cate());
        return $this->fetch('edit',['row_'=>$row_,'referer'=>$referer,'title'=>'修改分类','act'=>'update']);

    }

    public function update(Request $request) {
        $data = $request->param();
        $referer = $data['referer'];unset($data['referer']);
        $res = $this->validate($data,'CateValidate');
        if($res!==true){
            $this->error($res);
        }
        if($this->saveById($data['id'],new Cate(),$data)){
            $this->success('修改成功', $referer, '', 1);
        }else{
            $this->error('没有修改内容', $referer);
        }
    }

    public function delete(Request $request) {
        $data = $request->param();
        $list_good = Good::getListByCateId($data['id']);

        if($list_good){
          $this->error('分类下有商品，不能直接删除');
       }
        if ($this->deleteStatusById($data['id'], new Cate())) {
            $this->success('删除成功', $data['url'], '', 1);
        } else {
            $this->error('删除失败', $data['url']);
        }
    }
}
