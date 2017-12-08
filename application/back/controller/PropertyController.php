<?php
namespace app\back\controller;
use app\back\model\Property;
use think\Request;

class PropertyController extends BaseController{

    public function index(Request $request){
        $data = $request->param();
        $list = Property::getList($data);
    }

}