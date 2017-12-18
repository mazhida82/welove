{extend name='layout:base' /}
{block name="title"}分类列表{/block}
{block name="content"}
<style>
    .pagination li.disabled > a, .pagination li.disabled > span {
        color: inherit;
    }

    .pagination li > a, .pagination li > span {
        color: inherit
    }
</style>
<div role="tabpanel" class="tab-pane" id="user" style="display:block;">
    <div class="check-div form-inline row">
        <div class="col-xs-2">
            <a href="{:url('create')}">
                <button class="btn btn-yellow btn-xs">添加优惠券</button>
            </a>
        </div>
        <div class="col-xs-10">
            <form method="get" action="{:url('index')}">
                <div class="col-xs-5">
                </div>
                <div class=" col-xs-7" style=" padding-right: 40px;">
                    <select style="color:inherit" class=" form-control" name="paixu">
                        <option value="">--请选择排序字段--</option>
                        <option value="create_time" {eq name="Think.get.paixu" value="create_time"
                                }selected{/eq}>添加时间</option>
                        <option value="update_time" {eq name="Think.get.paixu" value="update_time"
                                }selected{/eq}>修改时间</option>
                    </select>
                    <label class="">
                        <input type="checkbox" name="sort_type" id="" value="desc" {eq name="Think.get.sort_type" value="desc"
                               }checked{/eq}>降序</label>
                    <button class="btn btn-white btn-xs " type="submit">提交</button>
                </div>
            </form>
        </div>

    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-1 ">
                编 号
            </div>
            <div class="col-xs-1">
                名称
            </div>
            <div class="col-xs-2">
                规则
            </div>
            <!--<div class="col-xs-2">
                列表图
            </div>
            <div class="col-xs-1">
                开始时间
            </div>
            <div class="col-xs-1">
                结束时间
            </div>-->
            <div class="col-xs-2">
                添加时间
            </div>
            <div class="col-xs-">
                操 作
            </div>
        </div>
        <div class="tablebody">
            <?php if(count($list)>0){?>
                <?php foreach ($list as $row){?>
                    <div class="row cont_nowrap">
                        <div class="col-xs-1 ">
                            {$row->id}
                        </div>
                        <div class="col-xs-1" title="{$row->name}">
                            {$row->name}
                        </div>
                        <div class="col-xs-2" title="满{$row->rule}元，减{$row->solution}元">
                            满{$row->rule}元，减{$row->solution}元
                        </div>
                        <!--<div class="col-xs-2">
                            <a href="__IMGURL__{$row->img}" target="_blank">
                                <img src="__IMGURL__{$row->img}" style="height:65px;max-width:175px;" alt="没有">
                            </a>
                        </div>
                        <div class="col-xs-1" title="<?php /*echo date('Y-m-d H:i:s',$row->start_time);*/?>">
                            <?php /*echo date('Y-m-d H:i:s',$row->start_time);*/?>
                        </div>
                        <div class="col-xs-1" title=" <?php /*echo date('Y-m-d H:i:s',$row->end_time);*/?>">
                            <?php /*echo date('Y-m-d H:i:s',$row->end_time);*/?>
                        </div>-->
                        <div class="col-xs-2" title="{$row->create_time}">
                            {$row->create_time}
                        </div>
                        <div class="col-xs-">
                            <a href="<?php echo url('edit',"id=$row->id")?>">
                                <button class="btn btn-success btn-xs edit_">修改</button>
                            </a>
                            <button class="btn btn-danger btn-xs del_cate" data-toggle="modal"
                                    data-target="#deleteSource" data-id="<?=$row->id ?>" onclick="del_(this)"> 删除
                            </button>
                        </div>

                    </div>
                <?php }?>
            <?php }else{?>
                <div class="row">
                    <div class="col-xs-12 ">
                        <h3 class="" align="center" style="color:red;font-size:18px">结果不存在</h3>
                    </div>
                </div>
            <?php }?>

        </div>

    </div>
    <!--页码块-->
    <footer class="footer">

    </footer>

    <!--弹出删除用户警告窗口-->
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
                    <form action="{:url('delete')}" method="get">
                        <input type="hidden" name="id" value="" id="del_id">
                        <input type="hidden" name="url" value="{$url}">
                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                        <button type="submit" class="btn  btn-xs btn-danger">确 定</button>
                    </form>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</div>
<script>

    function del_(obj) {
        var id = $(obj).attr('data-id');
        $('#del_id').val(id);
    }

</script>

{/block}