{extend name='layout:base' /}
{block name="title"}{$title}{/block}
{block name="content"}
<style>
    .control-label {
        padding-right: 10px;
    }
</style>

<!--弹出添加用户窗口-->
<form class="form-horizontal" action="{:url($act)}" method="post" enctype="multipart/form-data">
    <input type="hidden" name="good_id" value="{$good_id}">
    <input type="hidden" name="referer" value="{$referer}">
    <div class="row">
        <div class="col-xs-8">
            <div class="text-center">
                <!---->
                <h4 class="modal-title" id="gridSystemModalLabel">{$title}</h4>
            </div>
            <div class="">
                <div class="container-fluid">

                    <div class="form-group ">
                        <label for="sOrd" class="col-xs-3 control-label"><span
                                style="color:red;">&nbsp;&nbsp;</span></label>
                        <div class="col-xs-4 ">
                            <button type="button" id="addFile">增加</button>

                            <button type="button" id="jianFile">减少</button>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="sOrd" class="col-xs-3 control-label"><span style="color:red;">&nbsp;&nbsp;</span></label>
                        <div class="col-xs-8" id="img_wrap_div">
                            <div class="img_wrap">
                                <label for="">规格:<input type="text" name="value[]" value="">&nbsp;&nbsp;价格：<input type="text" name="price[]"></label>
                            </div>
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

    $('#addFile').click(function () {
        var obj = $('.img_wrap').last().clone();
        $('#img_wrap_div').append(obj);

    });
    $('#jianFile').click(function () {
        if ($('.img_wrap').length == 1) {
            return;
        }
        $('.img_wrap').last().remove();
    });


</script>

{/block}
