<?php
namespace app\api\controller;
use app\api\model\Order;
use think\Request;

class OrderController extends BaseController{
    /*
     * 取用户订单列表
     *
     * */
    public function index(Request $request) {
        $data = $request->param();
        $rule = ['username' => 'require'];
        $res = $this->validate($data, $rule);
        if (true !== $res) {
            return json(['code' => __LINE__, 'msg' => $res]);
        }
        return json(Order::getMyOrders($data));
    }

    /**
     * 用户结算生成订单
     * @param Request $request
     * @return \think\response\Json
     */
    public function save(Request $request){
        $data = $request->param();
        $rules = [
            'username'=>'require',
            'GoodList'=>'require',
            'sum_price_all'=>'require|float',
            'address_id' => 'require|number',
        ];
        $res = $this->validate($data, $rules);
        if (true !== $res) {
            return json(['code' => __LINE__, 'msg' => $res]);
        }
        return json((new Order())->addOrder($data));
    }

    /**
     * 更改订单为已支付
     */
    public function update_pay_st(Request $request) {
        $data = $request->param();
        $rule = ['order_id' => 'require|number', 'st' => 'require'];
        $res = $this->validate($data, $rule);
        if (true !== $res) {
            return json(['code' => __LINE__, 'msg' => $res]);
        }
        return json(Order::updatePaySt($data));
    }


    /**
     *更改订单状态或发货状态
     */
    public function update_st(Request $request) {
        $data = $request->param();
        $rule = ['order_id' => 'require|number', 'st' => 'require'];
        $res = $this->validate($data, $rule);
        if (true !== $res) {
            return json(['code' => __LINE__, 'msg' => $res]);
        }
        return json(Order::updateSt($data));
    }

    /**
     * 查询订单
     * @param Request $request
     * @return \think\response\Json
     */
    public function read(Request $request) {
        $data = $request->param();
        $rules = [
            'order_id' => 'require|number',
        ];
        $res = $this->validate($data, $rules);
        if (true !== $res) {
            return json(['code' => __LINE__, 'msg' => $res]);
        }
        return json(Order::getOrder($data));

    }

    public  function get_coupon(Request $request){
        $data = $request->param();
        $rules = [
            'order_id' => 'require|number',
        ];
        $res = $this->validate($data, $rules);
        if (true !== $res) {
            return json(['code' => __LINE__, 'msg' => $res]);
        }
        return json(Order::getUseCoupon($data));
    }
}