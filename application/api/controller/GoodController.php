<?php

namespace app\api\controller;

use app\api\model\Collect;
use app\api\model\Good;
use app\api\model\GoodAttr;
use app\api\model\GoodImgBigs;
use app\api\model\TuanGou;
use think\Request;
use app\api\model\Cate;

class GoodController extends BaseController {

    /**
     * wx首页商品
     * @return \think\response\Json
     */
    public function index(){
        return json(Good::getHomePage());
    }


    public function goodsList(Request $request){
        $data = $request->param();
        return json(Good::getGoodPage($data));
    }
//    public function collect(Request $request){
//        $data = $request->param();
//        $rule = ['good_id' => 'require|number','user_name'=>'require'];
//        $res = $this->validate($data, $rule);
//        if ($res !== true) {
//            return json(['code' => __LINE__, 'msg' => $res]);
//        }
//         return json((new Collect)->addCollect($data['good_id'],$data['user_name']));
//    }
//
//    /*
//     * 商品详情接口
//     * */
//    public function read(Request $request){
//        $data = $request->param();
//        $rule = ['good_id' => 'require|number','username'=>'require'];
//        $res = $this->validate($data, $rule);
//        if ($res !== true) {
//            return json(['code' => __LINE__, 'msg' => $res]);
//        }
//        return json(Good::findOne($data));
//
//    }
//
//    /**
//     * 商品多图接口
//     */
//    public function images(Request $requset){
//        $data = $requset->param();
//        return json(GoodImgBigs::getImg($data['good_id']));
//    }
//    /**
//     * 团购多图
//     */
//    public function getImages(Request $request){
//        $data = $request->param();
//        return json(TuanGou::getImg($data['t_id']));
//    }


}
