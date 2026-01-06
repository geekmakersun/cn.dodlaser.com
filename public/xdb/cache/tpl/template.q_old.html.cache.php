<?php if ($fn_include = $this->_include("theader.html")) include($fn_include); ?>


<div class="portlet bordered light ">
    <div class="portlet-title tabbable-line">
        <div class="caption">
            <span class="caption-subject">
            第二步、备份本站数据库成功
            </span>
        </div>
    </div>
    <div class="portlet-body">
        <form role="form" id="myform">
            <div class="form-body">
                <div class="form-group">
                    <p>已经成功备份数据库，备份文件存储在：<?php echo ROOTPATH; ?>xdb/cache/db/</p>
                    <p>然后将本站目录打包上传到指定目标服务器</p>
                    <p>单击左侧的【导入数据】菜单</p>
                </div>
            </div>
        </form>

    </div>
</div>


<?php if ($fn_include = $this->_include("tfooter.html")) include($fn_include); ?>