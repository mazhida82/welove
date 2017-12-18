<?php

namespace app\api\controller;

use app\api\model\Cart;
use think\Request;

class CartController extends BaseController {

    /*
    * 查看购物车
    * */
    public function index(Request $request) {
        $data = $request->param();
        $rule = ['username'=>'require'];
        $res = $this->validate($data,$rule);
        //dump( $res);exit;
        if($res !== true){
            return json(['code'=>__LINE__,'msg'=>$res]);
        }
        return json(Cart::getListByUser($data['username']));
    }

    /*
     * 添加购物车
     * */
    public function save(Request $request) {
        $data = $request->param();
        //dump( $data);exit;
        $rule = ['username'=>'require','good_id'=>'require|number','num'=>'require|number'];
        $res = $this->validate($data,$rule );
        //dump( $res);exit;
        if($res !== true){
            return json(['code'=>__LINE__,'msg'=>$res]);
        }
        return json((new Cart)->addCart($data));

    }
    /*
     * 删除购物车商品
     * */
    public function delete(Request $request) {
        $data = $request->param();
        //dump( $data);exit;
        $rule = ['username'=>'require','cart_id'=>'require|number','good_id'=>'require|number','property_id'=>'require|number'];
        $res = $this->validate($data,$rule);
        //dump( $res);exit;
        if($res !== true){
            return json(['code'=>__LINE__,'msg'=>$res]);
        }
        return json((new Cart)->deleteGood($data));
    }



}
