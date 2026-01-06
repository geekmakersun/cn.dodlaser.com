CREATE TABLE IF NOT EXISTS `{dbprefix}dbbackup_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tables` text NOT NULL COMMENT '备份表',
  `path` varchar(255) NOT NULL COMMENT '备份路径',
  `size` varchar(20) NOT NULL COMMENT '备份大小',
  `inputtime` int(10) unsigned NOT NULL COMMENT '备份时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据库备份记录表'; 