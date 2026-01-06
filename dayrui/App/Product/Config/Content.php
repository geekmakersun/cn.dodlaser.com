<?php 

return array (
  'table' => 
  array (
    1 => 'CREATE TABLE IF NOT EXISTS `{tablename}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT \'栏目id\',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT \'主题\',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT \'缩略图\',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT \'关键字\',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT \'描述\',
  `hits` int(10) unsigned DEFAULT NULL COMMENT \'浏览数\',
  `uid` int(10) unsigned NOT NULL COMMENT \'作者id\',
  `author` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT \'作者名称\',
  `status` tinyint(2) NOT NULL COMMENT \'状态\',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT \'地址\',
  `link_id` int(10) NOT NULL DEFAULT \'0\' COMMENT \'同步id\',
  `tableid` smallint(5) unsigned NOT NULL COMMENT \'附表id\',
  `inputip` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT \'录入者ip\',
  `inputtime` int(10) unsigned NOT NULL COMMENT \'录入时间\',
  `updatetime` int(10) unsigned NOT NULL COMMENT \'更新时间\',
  `displayorder` int(10) DEFAULT \'0\' COMMENT \'排序值\',
  `canshutu` text COLLATE utf8mb4_unicode_ci COMMENT \'参数图\',
  `chanpintu` text COLLATE utf8mb4_unicode_ci COMMENT \'产品图\',
  `jiegoutu` text COLLATE utf8mb4_unicode_ci COMMENT \'结构图\',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `link_id` (`link_id`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `hits` (`hits`),
  KEY `category` (`catid`,`status`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT=\'内容主表\'',
    0 => 'CREATE TABLE IF NOT EXISTS `{tablename}` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT \'作者uid\',
  `catid` smallint(5) unsigned NOT NULL COMMENT \'栏目id\',
  `content` mediumtext COLLATE utf8mb4_unicode_ci COMMENT \'内容\',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT=\'内容附表\'',
  ),
  'field' => 
  array (
    1 => 
    array (
      0 => 
      array (
        'name' => '主题',
        'fieldname' => 'title',
        'fieldtype' => 'Text',
        'isedit' => '1',
        'ismain' => '1',
        'issystem' => '1',
        'ismember' => '1',
        'issearch' => '1',
        'disabled' => '0',
        'setting' => 
        array (
          'option' => 
          array (
            'width' => 400,
            'fieldtype' => 'VARCHAR',
            'fieldlength' => '255',
          ),
          'validate' => 
          array (
            'xss' => 1,
            'required' => 1,
            'formattr' => 'onblur="check_title();get_keywords(\'keywords\');"',
          ),
        ),
        'displayorder' => '1',
      ),
      1 => 
      array (
        'name' => '产品图',
        'fieldname' => 'chanpintu',
        'fieldtype' => 'Image',
        'isedit' => '1',
        'ismain' => '1',
        'issystem' => '0',
        'ismember' => '1',
        'issearch' => '0',
        'disabled' => '0',
        'setting' => 
        array (
          'option' => 
          array (
            'stslt' => '1',
            'size' => '2',
            'count' => '10',
            'ext' => 'jpg,gif,png,jpeg,svg,webp',
            'attachment' => '0',
            'image_reduce' => '1000',
            'width' => '',
            'css' => '',
          ),
          'validate' => 
          array (
            'required' => '0',
            'pattern' => '',
            'errortips' => '',
            'check' => '',
            'filter' => '',
            'tips' => '',
            'formattr' => '',
          ),
          'is_right' => '0',
        ),
        'displayorder' => '5',
      ),
      2 => 
      array (
        'name' => '结构图',
        'fieldname' => 'jiegoutu',
        'fieldtype' => 'Image',
        'isedit' => '1',
        'ismain' => '1',
        'issystem' => '0',
        'ismember' => '1',
        'issearch' => '0',
        'disabled' => '0',
        'setting' => 
        array (
          'option' => 
          array (
            'size' => '2',
            'count' => '5',
            'ext' => 'jpg,gif,png,jpeg,svg,webp',
            'attachment' => '0',
            'image_reduce' => '1000',
            'width' => '',
            'css' => '',
          ),
          'validate' => 
          array (
            'required' => '0',
            'pattern' => '',
            'errortips' => '',
            'xss' => '1',
            'check' => '',
            'filter' => '',
            'tips' => '',
            'formattr' => '',
          ),
          'is_right' => '0',
        ),
        'displayorder' => '6',
      ),
      3 => 
      array (
        'name' => '参数图',
        'fieldname' => 'canshutu',
        'fieldtype' => 'Image',
        'isedit' => '1',
        'ismain' => '1',
        'issystem' => '0',
        'ismember' => '1',
        'issearch' => '0',
        'disabled' => '0',
        'setting' => 
        array (
          'option' => 
          array (
            'size' => '2',
            'count' => '10',
            'ext' => 'jpg,gif,png,jpeg,svg,webp',
            'attachment' => '0',
            'image_reduce' => '1000',
            'width' => '',
            'css' => '',
          ),
          'validate' => 
          array (
            'required' => '0',
            'pattern' => '',
            'errortips' => '',
            'check' => '',
            'filter' => '',
            'tips' => '',
            'formattr' => '',
          ),
          'is_right' => '0',
        ),
        'displayorder' => '7',
      ),
      4 => 
      array (
        'name' => '描述',
        'fieldname' => 'description',
        'fieldtype' => 'Textarea',
        'isedit' => '1',
        'ismain' => '1',
        'issystem' => '1',
        'ismember' => '1',
        'issearch' => '1',
        'disabled' => '0',
        'setting' => 
        array (
          'option' => 
          array (
            'width' => 500,
            'height' => 60,
            'fieldtype' => 'VARCHAR',
            'fieldlength' => '255',
          ),
          'validate' => 
          array (
            'xss' => 1,
            'filter' => 'dr_clearhtml',
          ),
        ),
        'displayorder' => '11',
      ),
      5 => 
      array (
        'name' => '关键字',
        'fieldname' => 'keywords',
        'fieldtype' => 'Text',
        'isedit' => '1',
        'ismain' => '1',
        'issystem' => '1',
        'ismember' => '1',
        'issearch' => '1',
        'disabled' => '0',
        'setting' => 
        array (
          'option' => 
          array (
            'width' => 400,
            'fieldtype' => 'VARCHAR',
            'fieldlength' => '255',
          ),
          'validate' => 
          array (
            'xss' => 1,
            'formattr' => ' data-role="tagsinput"',
          ),
        ),
        'displayorder' => '12',
      ),
      6 => 
      array (
        'name' => '缩略图',
        'fieldname' => 'thumb',
        'fieldtype' => 'File',
        'isedit' => '1',
        'ismain' => '1',
        'issystem' => '1',
        'ismember' => '1',
        'issearch' => '1',
        'disabled' => '0',
        'setting' => 
        array (
          'option' => 
          array (
            'ext' => 'jpg,gif,png',
            'size' => 10,
            'width' => 400,
            'fieldtype' => 'VARCHAR',
            'fieldlength' => '255',
          ),
        ),
        'displayorder' => '13',
      ),
    ),
    0 => 
    array (
      0 => 
      array (
        'name' => '内容',
        'fieldname' => 'content',
        'fieldtype' => 'Ueditor',
        'isedit' => '1',
        'ismain' => '0',
        'issystem' => '1',
        'ismember' => '1',
        'issearch' => '1',
        'disabled' => '0',
        'setting' => 
        array (
          'option' => 
          array (
            'mode' => 1,
            'width' => '100%',
            'height' => 400,
          ),
          'validate' => 
          array (
            'required' => 1,
          ),
        ),
        'displayorder' => '8',
      ),
    ),
  ),
);