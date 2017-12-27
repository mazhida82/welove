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
    <?php if($act=='update'){?>
        <input type="hidden" name="id" value="{$row_->id}">
        <input type="hidden" name="referer" value="{$referer}">
    <?php }?>
    <div class="row">
        <div class="col-xs-8">
            <div class="text-center">
                <!---->
                <h4 class="modal-title" id="gridSystemModalLabel">{$title}</h4>
            </div>
            <div class="">
                <div class="container-fluid">
                    <div class="form-group">
                        <label for="sKnot" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>名称：</label>
                        <div class="col-xs-8 ">
                            <input type="text" class="form-control input-sm duiqi" name='name' value="{$row_->name}" id=""
                                   placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sKnot" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>排序：</label>
                        <div class="col-xs-8 ">
                            <input type="text" class="form-control input-sm duiqi" name='sort' value="{$row_->sort}" id=""
                                   placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sOrd" class="col-xs-3 control-label"><span style="color:red;">*&nbsp;&nbsp;</span>列表图：</label>
                        <div class="col-xs-4 ">
                            <img src="__IMGURL__{$row_->img}" alt="没有上传图片" width="188"/>
                            <input type="file" title='' class="form-control  duiqi" id="sOrd" name="img" placeholder=""><span style="color:red">尺寸要求（335*335），大小不超过<?php echo floor(config('upload_size')/1024/1024);?>M。不上传表示不改</span>
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
    $(function () {
        $('form').bootstrapValidator({
            fields: {
                title: {
                    validators: {
                        notEmpty: {
                            message: '不能为空'
                        }
                    }
                }
            }
        });

    });

</script>

{/block}
