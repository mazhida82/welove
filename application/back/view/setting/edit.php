{extend name='layout:base' /}
{block name="title"}网站设置{/block}

{block name="content"}
<style>
    .control-label {
        padding-right: 10px;
    }
</style>

<!--弹出添加用户窗口-->
<form class="form-horizontal" action="{:url($act)}" method="post" enctype="multipart/form-data">


    <div class="row">
        <div class="col-xs-8">
            <div class="text-center">
                <h4 class="modal-title" id="gridSystemModalLabel">平台设置</h4>
            </div>
            <div class="">
                <div class="container-fluid">
                    <div class="form-group ">
                        <label for="sName" class="col-xs-5 control-label">平台联系人：</label>
                        <div class="col-xs-7 ">
                            <input type="text" class="form-control input-sm duiqi" name='truename' value="{$list->truename|default=''}" >
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="sName" class="col-xs-5 control-label">公司地址：</label>
                        <div class="col-xs-7 ">
                            <input type="text" class="form-control input-sm duiqi" name='address' value="{$list->address|default=''}" >
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="sName" class="col-xs-5 control-label">平台电话：</label>
                        <div class="col-xs-7 ">
                            <input type="text" class="form-control input-sm duiqi" name='mobile' value="{$list->mobile|default=''}" >
                        </div>
                    </div>

                    <div class="text-center">
                        <button type="reset" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>
                        <button type="submit" cla="btn btn-xs btn-green">修  改</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


</form>

<script>

</script>

{/block}
