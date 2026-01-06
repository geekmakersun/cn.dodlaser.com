<?php if ($fn_include = $this->_include("theader.html")) include($fn_include); ?>
<body style="background: #ffffff">
    <div class="page-404-full-page" style="padding-top:10px">
        <div class="row">
            <div class="col-xs-12 page-404">
                <?php if ($mark==1) { ?>
                <div class="admin_msg number font-green-turquoise"> <i class="fa fa-check-circle-o"></i> </div>
                <?php } else if ($mark==2) { ?>
                <div class="admin_msg number font-blue" > <i class="fa fa-info-circle"></i> </div>
                <?php } else { ?>
                <div class="admin_msg number font-red"> <i class="fa fa-times-circle-o"></i> </div>
                <?php } ?>
                <div class="details">
                    <h4><?php echo $msg; ?></h4>
                    <p class="alert_btnleft">
                        <?php if ($url) { ?>
                        <a href="<?php echo $url; ?>"><?php echo dr_lang('如果您的浏览器没有自动跳转，请点击这里'); ?></a>
                        <meta http-equiv="refresh" content="<?php echo $time; ?>; url=<?php echo $url; ?>">
                        <?php } else { ?>
                        <a href="<?php echo $backurl; ?>" >[<?php echo dr_lang('点击返回上一页'); ?>]</a>
                        <?php } ?>
                    </p>

                </div>
            </div>
        </div>
    </div>
</body>
</html>