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

                    </div>

                    <div class="form-group">
                        <label for="sOrd" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>大图：</label>
                        <div class="col-xs-4">
<?php foreach ($list_img_big as  $row_){?>
                            <div class="img_wrap">
                                <img src="__IMGURL__{$row_['img_big']}" alt="没有上传图片" width="250"/>
                                <a class="btn btn-danger btn-xs del_cate" data-toggle="modal"                                  data-target="#deleteSource" data-id="<?= $row_['id'] ?>" onclick="del_(this)">删除
                                </a>
                                <input type="file" title='' class="form-control  duiqi" id="sOrd" name="img_big[]"
                                       placeholder=""><span
                                        style="color:red">尺寸要求（750*600），大小不超过<?php echo floor(config('upload_size') / 1024 / 1024); ?>
                                    M。</span>
                            </div>
                            <?php }?>

                        </div>
                    </div>
                    <div class="form-group" style="display: none;" id="additional">
                        <label for="sOrd" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>大图：</label>
                        <div class="col-xs-4" id="img_wrap_div">
                                <div class="add-big-img">
                                    <input type="file" title='' class="form-control  duiqi" id="sOrd" name="img_big[]"
                                           placeholder=""><span
                                        style="color:red">尺寸要求（750*600），大小不超过<?php echo floor(config('upload_size') / 1024 / 1024); ?>M。</span>
                                </div>
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="sOrd" class="col-xs-3 control-label"><span
                                style="color:red;">&nbsp;&nbsp;</span></label>
                        <div class="col-xs-4 ">
                            <button type="button" id="addFile" class="change-display">增加</button>

                            <button type="button" id="jianFile" class="change-display">减少</button>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <a href="javascript:history.back()">
                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">返回</button>
                    </a>
                    <button type="submit" class="btn btn-xs btn-green">清空大图</button>
                </div>
            </div>
        </div>
</form>
<div class="modal fade" id="deleteSource" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    确定删除数据吗？
                </div>
            </div>
            <div class="modal-footer">
                <form action="{:url('delete_img_bigs')}" method="post">
                    <input type="hidden" name="id" value="" id="del_id">
                    <input type="hidden" name="url" value="{$url}" id="">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <button type="submit" class="btn  btn-xs btn-danger">确 定</button>
                </form>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<script>

    $('#addFile').click(function () {
        if ($('.add-big-img').length == 1) {
            $('#additional').show();
            return;
        }
        var obj = $('.add-big-img').last().clone();
        $('#img_wrap_div').append(obj);
//        $('.img_wrap').last().find('img').attr('src','')

    });
    $('#jianFile').click(function () {
        if ($('.add-big-img').length == 1) {
            return;
        }
        $('.add-big-img').last().remove();
    });

    function del_(obj) {
        var id = $(obj).attr('data-id');
        $('#del_id').val(id);
    }


</script>

{/block}
