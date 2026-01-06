DROP TABLE IF EXISTS `{dbprefix}app_mfile`;
CREATE TABLE IF NOT EXISTS `{dbprefix}app_mfile` (
  `id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `username` varchar (100) NOT NULL COMMENT '用户',
  `total` int(10) NOT NULL COMMENT '总大小',
  `filesize` int(10) NOT NULL COMMENT '已经使用',
  `inputtime` int(10) unsigned NOT NULL COMMENT '最近上传',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户附件情况';

