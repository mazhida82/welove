{extend name='layout:base' /}
{block name="title"}{$title}{/block}
{block name="content"}
<style>
    .control-label{
        padding-right:10px;
    }
</style>
<link rel="stylesheet" href="__EDITOR__/themes/default/default.css" />
<script charset="utf-8" src="__EDITOR__/kindeditor-min.js"></script>
<script charset="utf-8" src="__EDITOR__/lang/zh_CN.js"></script>
<script>
    KindEditor.ready(function (K) {
        // var editor = K.create('#desc_textarea');
        var editor = K.create('textarea[name="message"]',{
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
<!--弹出添加用户窗口-->
<form id="addForm" class="form-horizontal" action="{:url($act)}" method="post" >
    <div class="row" >
        <div class="col-xs-8">
            <div class="text-center">
                <!---->
                <h4 class="modal-title" id="gridSystemModalLabel">{$title}</h4>
            </div>
            <div class="">
                <div class="container-fluid">
                    <div class="form-group ">
                        <label for="sName" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>指定用户名：</label>
                        <div class="col-xs-8 ">
                            <input type="text" class="form-control input-sm duiqi" name='name' value="{$username}" id="" placeholder="">
                        </div>
                        <input type="hidden" name="id" value="{$row->id}">
                    </div>
                    <div class="form-group ">
                        <label for="sName" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>标题：</label>
                        <div class="col-xs-8 ">
                            <input type="text" class="form-control input-sm duiqi" name='title' value="{$row->title}" id="" placeholder="">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="sName" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>内容：</label>
                        <div class="col-xs-8 ">
                            <textarea name="message" id="desc_textarea" style="width:700px;height:300px;">{$row->message}</textarea>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <a href="javascript:history.back()">
                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">返回</button>
                    </a>
                    <button type="submit" class="btn btn-xs btn-green">修 改</button>
                </div>
            </div>
        </div>
</form>

<script>
    $(function () {

        $('form').bootstrapValidator({
            fields: {
                name: {
                    validators:
                        {
                            notEmpty: {
                                message: '标题不能为空'
                            }
                        }

                },
                cate_id: {
                    validators:
                        {
                            notEmpty: {
                                message: '不能为空'
                            }
                        }

                },

                img: {
                    validators: {
                        notEmpty: {
                            message: '请上传图片'
                        }


                    }
                },

                cont: {
                    validators: {
                        notEmpty: {
                            message: '内容不能为空'
                        }
                    }
                },

            }
        });

    });

</script>

{/block}
