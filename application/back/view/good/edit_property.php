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
                    <div class="form-group">
                        <div class="col-xs-8" id="img_wrap_div">
                            <?php foreach($list as $row){?>
                                <div class="img_wrap">
                                    <label for="">规格:<input type="text" name="value[]" value="{$row->value}">&nbsp;&nbsp;价格：<input type="text" name="price[]" value="{$row->price}"></label>
                                </div>
                            <?php }?>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <a href="javascript:history.back()">
                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">返回</button>
                    </a>
                    <button type="submit" class="btn btn-xs btn-green">清除商品属性</button>
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
