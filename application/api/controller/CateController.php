<?php

namespace app\api\controller;

use app\api\model\Ad;
use app\api\model\Good;
use think\Request;
use app\api\model\Cate;

class CateController extends BaseController {

    public function index(){
        return json(Cate::getList());
    }
}
