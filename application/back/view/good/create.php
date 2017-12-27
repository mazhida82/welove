{extend name='layout:base' /}
{block name="title"}{$title}{/block}
{block name="content"}
<style>
    .control-label{
        padding-right:10px;
    }
</style>
<script>
  function  changeCate(obj){
     var cate_name= $(obj).children('option:selected').attr('data_cate_name');
$('#cate_name_label').html(cate_name);
    }
</script>
	<!--弹出添加用户窗口-->
<link rel="stylesheet" href="__EDITOR__/themes/default/default.css" />
<script charset="utf-8" src="__EDITOR__/kindeditor-min.js"></script>
<script charset="utf-8" src="__EDITOR__/lang/zh_CN.js"></script>
<script>
    KindEditor.ready(function (K) {
        // var editor = K.create('#desc_textarea');
        var editor = K.create('textarea[name="desc"]',{
            themeType: 'simple',
            resizeType: 1,
//            uploadJson: '__EDITOR__/php/upload_json.php',
//            fileManagerJson: '__EDITOR__/php/file_manager_json.php',
            allowFileManager: true,
            //下面这行代码就是关键的所在，当失去焦点时执行 this.sync();
            afterBlur: function(){this.sync();}
        });
    });
</script>

<form id="addForm" class="form-horizontal" action="{:url($act)}" method="post" enctype="multipart/form-data" >
		<div class="row" >
			<div class="col-xs-8">
				<div class="text-center">
					<!---->
					<h4 class="modal-title" id="gridSystemModalLabel">{$title}</h4>
				</div>
				<div class="">
					<div class="container-fluid">
                        <div class="form-group ">
                            <label for="sName" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>名称：</label>
                            <div class="col-xs-8 ">
                                <input type="text" class="form-control input-sm duiqi" name='name' value="" id="" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>分类：</label>
                            <div class="col-xs-8 ">
                                <label for="sKnot" class=" control-label">
                                    <select name="cate_id" class=" form-control select-duiqi" style="color:inherit">
                                        <option value="">--请选择分类--</option>
                                            <?php foreach($cate_list as $value){?>
                                                <option value="{$value->id}">{$value->name}</option>
                                            <?php } ?>
                                    </select>
                                </label>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label for="sName" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>库存：</label>
                            <div class="col-xs-8 ">
                                <input type="text" class="form-control input-sm duiqi" name='store' value="" id="" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sOrd" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>列表图：</label>
                            <div class="col-xs-4 ">
                                <input type="file" title='' class="form-control  duiqi" id="sOrd" name="img" placeholder=""><span style="color:red">尺寸要求（335*335），大小不超过<?php echo floor(config('upload_size')/1024/1024);?>M。</span>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label for="sName" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>价格：</label>
                            <div class="col-xs-8 ">
                                <input type="text" class="form-control input-sm duiqi" name='price' value="" id="" placeholder="0.00元">
                            </div>
                        </div>
                        <div class="form-group ">
                            <label for="sName" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>排序：</label>
                            <div class="col-xs-8 ">
                                <input type="text" class="form-control input-sm duiqi" name='sort' value="" id="" placeholder="">
                            </div>
                        </div>
                        <div class="form-group ">
                            <label for="sName" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>是否首页推荐：</label>
                            <label ><input type="radio"  name='is_home_page' value="1" id="" >是</label>&nbsp; 　&nbsp;
                            <label ><input type="radio"  name='is_home_page' value="0" id="" checked>否</label>
                        </div>
                        <div class="form-group " id="desc_text">
                            <label for="sName" class="col-xs-3 control-label">描述：</label>
                            <div class="col-xs-8 ">
                                <textarea name="desc" id="desc_textarea" style="width:700px;height:300px;"></textarea>
                            </div>
                        </div>
                    </div>
				<div class="text-center">
                    <a href="javascript:history.back()">
                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">返回</button>
                    </a>
					<button type="submit" class="btn btn-xs btn-green">保 存</button>
				</div>
			</div>
		</div>
</form>

<script>

</script>

{/block}
