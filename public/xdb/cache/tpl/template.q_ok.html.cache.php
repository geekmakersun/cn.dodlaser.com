<?php if ($fn_include = $this->_include("theader.html")) include($fn_include); ?>


<div class="portlet bordered light ">
    <div class="portlet-title tabbable-line">
        <div class="caption">
            <span class="caption-subject">
            数据恢复成功
            </span>
        </div>
    </div>
    <div class="portlet-body">
        <form role="form" id="myform">
            <div class="form-body">
                <div class="form-group">
                    <p>备份文件存储在：<?php echo ROOTPATH; ?>xdb/cache/db/</p>
                    <p>数据已经恢复成功</p>
                    <p style="color: red">务必请将本目录（<?php echo ROOTPATH; ?>xdb/）文件全部删除！</p>

                    <?php if ($error) { ?>
                    <p><font color="red">以下数据导入失败：</font></p>
                    <?php echo nl2br($error);  } ?>
                </div>
            </div>
        </form>

    </div>
</div>


<?php if ($fn_include = $this->_include("tfooter.html")) include($fn_include); ?>