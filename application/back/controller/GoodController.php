<?php

namespace app\back\controller;

use app\back\model\Base;
use app\back\model\Good;
use app\back\model\GoodAttr;
use app\back\model\Cate;
use app\back\model\Admin;
use app\back\model\OrderGood;
use app\back\model\Property;
use think\Db;
use think\Request;

class GoodController extends BaseController {
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index(Request $request) {
        $data = $request->param();
        $list_ = Good::getList($data);
        $list_cate = Cate::getList();
        // dump($list_shop);
        $page_str = $list_->render();
        $page_str = Base::getPageStr($data, $page_str);
        $url = $request->url();
        return $this->fetch('index', ['list_' => $list_,'url' => $url, 'page_str' => $page_str,'list_cate'=>$list_cate]);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create() {
        $cate_list = Cate::getList();
        return $this->fetch('', ['title' => '添加商品', 'act' => 'save','cate_list'=>$cate_list]);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request $request
     * @return \think\Response
     */
    public function save(Request $request) {

        $data = $request->param();
        /*  $res = $this->validate($data, 'GoodValidate');
          if ($res !== true) {
              $this->error($res);
          }*/
        //dump($_FILES);exit;
        $file = $request->file('img');

        if (empty($file)) {
            //$this->error('请上传图片或检查图片大小！');
        }
        $path_name = 'good_img';

        $arr = $this->dealImg($file, $path_name);

        $data['img'] = $arr['save_url_path'];

//        if ($data['which_info'] == 1) {
//            $data['imgs'] = '';
//        } else {
//            $data['desc'] = '';
//			$file3 = $request->file('imgs');
//            if (!empty($file3)) {
//				$size3 = $file3->getSize();
//                if ($size3 > config('upload_size')) {
//                    $this->error('图片大小超过限定！');
//                }
//                $path_name3 = 'good_imgs';
//                $arr = $this->dealImg($file3, $path_name3);
//                $data['imgs'] = $arr['save_url_path'];
//            }
//        }
        $Good = new Good();
        $Good->save($data);
        $this->success('添加成功', 'index', '', 1);
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int $id
     * @return \think\Response
     */
    public function edit(Request $request) {
        $data = $request->param();
        $row_ = $this->findById($data['id'], new Good());
//         dump($row_);exit;
        $referer = $request->header()['referer'];
        // $list_cate = Cate::getAllCateByType(Cate::getTypeIdAttr($row_->type));
        $cate_list = Cate::getList();
        /*$list_good_attr=[];
        if($row_->is_add_attr){
            $list_good_attr = (new GoodAttr)->getGoodAttr($data['id']);
        }
        $row_->good_attrs = $list_good_attr;*/
        //dump($row_);
        return $this->fetch('', ['row_' => $row_, 'title' => '修改商品' . $row_->name, 'act' => 'update', 'referer' => $referer, 'cate_list' => $cate_list]);
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request $request
     * @param  int $id
     * @return \think\Response
     */
    public function update(Request $request) {

        $data = $request->param();
//        dump($data);exit;
        $referer = $data['referer'];
        unset($data['referer']);
        $row_ = $this->findById($data['id'], new Good());
        $file = $request->file('img');

        if (!empty($file)) {
            $path_name = 'good';
            $size = $file->getSize();
            if ($size > config('upload_size')) {
                $this->error('图片大小超过限定！');
            }
            $this->deleteImg($row_->img);
            $arr = $this->dealImg($file, $path_name);
            $data['img'] = $arr['save_url_path'];
        }

        if ($this->saveById($data['id'], new Good(), $data)) {

            $this->success('编辑成功', $referer, '', 1);
        } else {
            $this->error('编辑失败', $referer, '', 1);
        }
    }

    /*
     * 下架商品
     * */
    public function down(Request $request) {
        $data = $request->param();
        //   dump($data);exit;
        //下架条件：
        /*$allow_ = true;
        if (OrderGood::getGoodOn($data['id'])) {
            $allow_ = false;
        }
        if ($allow_ == false) {
            $this->error('商品被加入订单，不能下架', $data['url']);
        }
        if (Tuangou::where(['good_id' => $data['id'], 'tuangou.st' => 1])->find()) {
            $allow_ = false;
        }
        if ($allow_ == false) {
            $this->error('商品被加入团购，不能下架', $data['url']);
        }*/
        //可以下架
        $row_ = $this->findById($data['id'], new Good());
        $row_->st = 2;
        $row_->save();
        $this->success('下架成功', $data['url'], '', 1);
    }

    /**
     * soft-delete 指定资源
     *
     * @param  int $id
     * @return \think\Response
     */
    public function delete(Request $request) {
        $data = $request->param();

        if ($this->deleteStatusById($data['id'], new Good())) {
            $this->success('删除成功', $data['url'], '', 1);
        } else {
            $this->error('删除失败', $data['url'], '', 3);
        }
    }

    /*
     * 添加商品大图
     * */
    public function create_img_bigs(Request $request) {
        $good_id = $request->param('id');
        $good = $this->findById($good_id, new Good());
        $referer = $request->header()['referer'];
        return $this->fetch('', ['good_id' => $good_id, 'referer' => $referer, 'title' => '添加 ' . $good->name . ' 商品大图', 'act' => 'save_img_bigs']);

    }

    /*
     * 添加商品大图
     * */
    public function save_img_bigs(Request $request) {
        $good_id = $request->post('good_id');
        $files = $request->file('img_big');
        $path_name = 'good_img_big';
        if (empty($files)) {
            $this->error('至少一张图片');
        }
        $referer = $request->post('referer');
        $data_imgs['good_id'] = $good_id;
        foreach ($files as $file) {
            $arr = $this->dealImg($file, $path_name);
            $data_imgs['img_big'] = $arr['save_url_path'];
            if (!Db::table('wl_good_img_bigs')->insert($data_imgs)) {
                $this->error('大图添加失败', $referer);
            }
        }
        $this->saveById($good_id, new Good(), ['img_big_st' => 1]);
        $this->success('大图添加好了', $referer, '', 1);

    }

    public function edit_img_bigs(Request $request) {
        $good_id = $request->get('id');
        $referer = $request->header()['referer'];
        $row_good = $this->findById($good_id, new Good());
        if ($row_good->img_big_st == 0) {
            $this->error('没有大图');
        }
        $list_img_big = Db::table('wl_good_img_bigs')->where(['st' => 1, 'good_id' => $good_id])->select();
        return $this->fetch('', ['good_id' => $good_id, 'referer' => $referer, 'title' => ' ' . $row_good->name . ' 商品大图', 'act' => 'update_img_bigs', 'list_img_big' => $list_img_big]);
    }

    public function update_img_bigs(Request $request) {
        $good_id = $request->post('good_id');

        $list_img_big = Db::table('wl_good_img_bigs')->where(['st' => 1, 'good_id' => $good_id])->select();
        foreach ($list_img_big as $img_big) {
            $this->deleteImg($img_big['img_big']);
        }
        Db::table('wl_good_img_bigs')->where(['st' => 1, 'good_id' => $good_id])->update(['st' => 0]);
        $referer = $request->post('referer');

        $this->saveById($good_id, new Good(), ['img_big_st' => 0]);
        $this->success('清空大图成功', $referer, '', 1);
    }

    /**
     * 完善属性页面渲染
     * @param Request $request
     * @return mixed
     */
    public function create_property(Request $request){
        $good_id = $request->param('id');
        $good = $this->findById($good_id,new Good);
        $referer = $request->header()['referer'];
        return $this->fetch('', ['good_id' => $good_id, 'referer' => $referer, 'title' => '添加 ' . $good->name . ' 商品属性', 'act' => 'save_property']);
    }

    /**
     * 执行添加属性动作
     * @param Request $request
     */
    public function save_property(Request $request){
        $data = $request->param();
        $good_id = $data['good_id'];
        $referer = $data['referer'];
        unset($data['good_id']);unset($data['referer']);
//        dump($data);exit;
        foreach ($data['value'] as $k=>$v){
            $gp['value'] = $v;
            $gp['price'] = $data['price'][$k];
            $gp['good_id'] = $good_id;
            $arr[] = $gp;
        }
        (new Property())->saveAll($arr);

        $this->saveById($good_id, new Good(), ['property_st' => 1]);
        $this->success('商品属性添加好了', $referer, '', 1);
    }

    /**
     * 查看属性页渲染
     * @param Request $request
     * @return mixed
     */
    public function edit_property(Request $request){
        $good_id = $request->get('id');
        $referer = $request->header()['referer'];
        $good = $this->findById($good_id,new Good);
        $list = Property::getListByGoodId($good_id);
        return $this->fetch('',['good_id'=>$good_id,'referer'=>$referer,'title'=>'查看'.$good->name.'商品属性','act'=>'update_property','list'=>$list]);
    }

    /**清除商品属性执行动作
     * @param Request $request
     */
    public function update_property(Request $request){
        $good_id = $request->post('good_id');
        $referer = $request->post('referer');
        (new Property())->where(['st'=>1,'good_id'=>$good_id])->update(['st'=>0]);
        $this->saveById($good_id, new Good(), ['property_st' => 0]);
        $this->success('清空商品属性成功', $referer, '', 1);
    }
}
