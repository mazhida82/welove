<?php
namespace app\api\controller;
use app\api\model\Order;
use think\Request;

class OrderController extends BaseController{

    public function save(Request $request){
        $data = $request->param();
        $rules = [
            'username'=>'require',
            'GoodList'=>'require',
            'sum_price_all'=>'require|float',
            'address_id' => 'require|number',
            'coupon_id'=>'require|number'
        ];
        $res = $this->validate($data, $rules);
        if (true !== $res) {
            return json(['code' => __LINE__, 'msg' => $res]);
        }
        return json((new Order())->addOrder($data));
    }
}