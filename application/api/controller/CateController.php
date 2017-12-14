<?php

namespace app\api\controller;

use app\api\model\Ad;
use app\api\model\Good;
use think\Request;
use app\api\model\Cate;

class CateController extends BaseController {

    /**
     * 获取一级分类
     * @return \think\response\Json
     */
    public function index(){
        return json(Cate::getList());
    }


    /**
     * 获取二级分类
     */
    public function second(Request $request){
        $data = $request->param();
        return json(Cate::getSecond($data));
    }
}
