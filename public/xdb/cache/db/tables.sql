
DROP TABLE IF EXISTS `dr_1_form`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_form` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `table` varchar(50) NOT NULL COMMENT '表名',
  `setting` text DEFAULT NULL COMMENT '配置信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `table` (`table`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='表单模型表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_form_zxly`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_form_zxly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT 0 COMMENT '录入者uid',
  `author` varchar(100) DEFAULT NULL COMMENT '录入者账号',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态值',
  `displayorder` int(11) NOT NULL DEFAULT 0 COMMENT '排序值',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `your_name` varchar(255) DEFAULT NULL COMMENT 'YourName',
  `your_mail` varchar(255) DEFAULT NULL COMMENT 'YourMail',
  `write_a_message` text DEFAULT NULL COMMENT 'WriteaMessage',
  `your_phone` varchar(255) DEFAULT NULL COMMENT 'YourPhone',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在线留言表单表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_form_zxly_data_0`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_form_zxly_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned DEFAULT 0 COMMENT '录入者uid',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在线留言表单附表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text DEFAULT NULL COMMENT '描述',
  `hits` int(10) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(11) NOT NULL DEFAULT 0 COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(100) NOT NULL COMMENT '客户端ip信息',
  `inputtime` int(11) NOT NULL COMMENT '更新时间',
  `updatetime` int(11) NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT 0 COMMENT '评论数量',
  `avgsort` decimal(10,2) unsigned DEFAULT 0.00 COMMENT '平均点评分数',
  `displayorder` int(11) DEFAULT 0 COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `hits` (`hits`),
  KEY `category` (`catid`,`status`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容主表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_category`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '是否显示',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(9) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) DEFAULT 0,
  `ismain` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='栏目表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_category_data`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` int(10) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='栏目模型表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_category_data_0`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='栏目模型表的附表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_comment`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `cuid` int(10) unsigned NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `orderid` bigint(20) unsigned NOT NULL COMMENT '订单id',
  `uid` mediumint(8) unsigned DEFAULT 0 COMMENT '评论者ID',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者账号',
  `content` text DEFAULT NULL COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT 0 COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort2` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort3` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort4` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort5` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort6` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort7` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort8` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort9` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '回复id',
  `in_reply` tinyint(3) unsigned DEFAULT 0 COMMENT '是否存在回复',
  `status` smallint(5) unsigned DEFAULT 0 COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `orderid` (`orderid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论内容表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_comment_index`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `support` int(10) unsigned DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT 0 COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT 0 COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT 0 COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论索引表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_data_0`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext DEFAULT NULL COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容附表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_draft`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容草稿表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_flag`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_flag` (
  `flag` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='标记表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_hits`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  `day_time` int(11) DEFAULT NULL,
  `week_time` int(11) DEFAULT NULL,
  `month_time` int(11) DEFAULT NULL,
  `year_time` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='时段点击量统计';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_index`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(4) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容索引表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_recycle`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_recycle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '删除理由',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容回收站表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_search`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_search` (
  `id` varchar(32) NOT NULL,
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='搜索表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_time`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '处理结果',
  `posttime` int(10) unsigned NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `error` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `posttime` (`posttime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容定时发布表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_news_verify`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_news_verify` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `isnew` tinyint(3) unsigned NOT NULL COMMENT '是否新增',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(4) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `vid` int(11) DEFAULT NULL,
  `islock` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容审核表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_photo_category_data_0`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_photo_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='栏目模型表的附表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_photo_comment`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_photo_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `cuid` int(10) unsigned NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `orderid` bigint(20) unsigned NOT NULL COMMENT '订单id',
  `uid` mediumint(8) unsigned DEFAULT 0 COMMENT '评论者ID',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者账号',
  `content` text DEFAULT NULL COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT 0 COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort2` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort3` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort4` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort5` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort6` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort7` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort8` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort9` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '回复id',
  `in_reply` tinyint(3) unsigned DEFAULT 0 COMMENT '是否存在回复',
  `status` smallint(5) unsigned DEFAULT 0 COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `orderid` (`orderid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论内容表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_photo_comment_index`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_photo_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `support` int(10) unsigned DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT 0 COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT 0 COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT 0 COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论索引表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text DEFAULT NULL COMMENT '描述',
  `hits` int(10) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(11) NOT NULL DEFAULT 0 COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(100) NOT NULL COMMENT '客户端ip信息',
  `inputtime` int(11) NOT NULL COMMENT '更新时间',
  `updatetime` int(11) NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT 0 COMMENT '评论数量',
  `avgsort` decimal(10,2) unsigned DEFAULT 0.00 COMMENT '平均点评分数',
  `displayorder` int(11) DEFAULT 0 COMMENT '排序值',
  `zutu` text DEFAULT NULL COMMENT '组图',
  `cpcs` text DEFAULT NULL COMMENT '产品参数',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `hits` (`hits`),
  KEY `category` (`catid`,`status`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容主表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_category`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '是否显示',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(9) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) DEFAULT 0,
  `ismain` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='栏目表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_category_data`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` int(10) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='栏目模型表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_category_data_0`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='栏目模型表的附表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_comment`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `cuid` int(10) unsigned NOT NULL COMMENT '关联uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `orderid` bigint(20) unsigned NOT NULL COMMENT '订单id',
  `uid` mediumint(8) unsigned DEFAULT 0 COMMENT '评论者ID',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者账号',
  `content` text DEFAULT NULL COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT 0 COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort2` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort3` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort4` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort5` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort6` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort7` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort8` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `sort9` tinyint(3) unsigned DEFAULT 0 COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '回复id',
  `in_reply` tinyint(3) unsigned DEFAULT 0 COMMENT '是否存在回复',
  `status` smallint(5) unsigned DEFAULT 0 COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `orderid` (`orderid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论内容表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_comment_index`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `support` int(10) unsigned DEFAULT 0 COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT 0 COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT 0 COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT 0.00 COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT 0 COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论索引表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_data_0`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext DEFAULT NULL COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容附表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_draft`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容草稿表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_flag`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_flag` (
  `flag` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='标记表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_hits`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  `day_time` int(11) DEFAULT NULL,
  `week_time` int(11) DEFAULT NULL,
  `month_time` int(11) DEFAULT NULL,
  `year_time` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='时段点击量统计';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_index`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(4) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容索引表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_recycle`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_recycle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '删除理由',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容回收站表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_search`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_search` (
  `id` varchar(32) NOT NULL,
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='搜索表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_time`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '处理结果',
  `posttime` int(10) unsigned NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `error` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `posttime` (`posttime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容定时发布表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_product_verify`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_product_verify` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `isnew` tinyint(3) unsigned NOT NULL COMMENT '是否新增',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(4) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `vid` int(11) DEFAULT NULL,
  `islock` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='内容审核表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_share_category`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_share_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `tid` tinyint(1) NOT NULL COMMENT '栏目类型，0单页，1模块，2外链',
  `pid` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT '上级id',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `domain` varchar(50) DEFAULT NULL COMMENT '绑定电脑域名',
  `mobile_domain` varchar(50) DEFAULT NULL COMMENT '绑定手机域名',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '是否显示',
  `content` mediumtext NOT NULL COMMENT '单页内容',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` smallint(6) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) DEFAULT 0,
  `ismain` tinyint(1) DEFAULT 0,
  `jsnr` text DEFAULT NULL COMMENT '介绍内容',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `tid` (`tid`),
  KEY `show` (`show`),
  KEY `dirname` (`dirname`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='共享模块栏目表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_share_index`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_share_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='共享模块内容索引表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_tag_news`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_tag_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `tid` int(10) unsigned NOT NULL COMMENT 'tagid',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cindex` (`cid`,`tid`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='关键词库news索引表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_tag_photo`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_tag_photo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `tid` int(10) unsigned NOT NULL COMMENT 'tagid',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cindex` (`cid`,`tid`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='关键词库photo索引表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_tag_product`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_tag_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `tid` int(10) unsigned NOT NULL COMMENT 'tagid',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cindex` (`cid`,`tid`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='关键词库product索引表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_treatments`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_treatments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text DEFAULT NULL COMMENT '描述',
  `hits` int(10) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` int(10) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '笔名',
  `status` tinyint(4) NOT NULL COMMENT '状态(已废弃)',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(11) DEFAULT 0 COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(100) NOT NULL COMMENT '客户端ip信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `displayorder` int(11) DEFAULT 0 COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `link_id` (`link_id`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `hits` (`hits`),
  KEY `category` (`catid`,`status`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容主表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_treatments_category`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_treatments_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(255) NOT NULL COMMENT '栏目名称',
  `dirname` varchar(255) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(255) NOT NULL COMMENT '上级目录',
  `child` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '是否有下级',
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `ismain` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '是否主栏目',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '是否显示',
  `setting` mediumtext NOT NULL COMMENT '属性配置',
  `displayorder` mediumint(9) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `disabled` (`disabled`),
  KEY `ismain` (`ismain`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='栏目表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_treatments_category_data`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_treatments_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` int(10) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='栏目模型表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_treatments_data_0`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_treatments_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext DEFAULT NULL COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容附表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_treatments_draft`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_treatments_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容草稿表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_treatments_flag`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_treatments_flag` (
  `flag` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='标记表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_treatments_hits`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_treatments_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  `day_time` int(10) unsigned NOT NULL COMMENT '本日',
  `week_time` int(10) unsigned NOT NULL COMMENT '本周',
  `month_time` int(10) unsigned NOT NULL COMMENT '本月',
  `year_time` int(10) unsigned NOT NULL COMMENT '年',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='时段点击量统计';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_treatments_index`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_treatments_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(4) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容索引表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_treatments_recycle`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_treatments_recycle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '删除理由',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容回收站表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_treatments_search`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_treatments_search` (
  `id` varchar(32) NOT NULL,
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` int(10) unsigned NOT NULL COMMENT '字段改成了结果数量值',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='搜索表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_treatments_time`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_treatments_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `result` text NOT NULL COMMENT '处理结果',
  `error` tinyint(3) unsigned NOT NULL COMMENT '是否错误',
  `posttime` int(10) unsigned NOT NULL COMMENT '定时发布时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `error` (`error`),
  KEY `posttime` (`posttime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容定时发布表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_1_treatments_verify`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_1_treatments_verify` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `vid` tinyint(4) NOT NULL COMMENT '审核id号',
  `isnew` tinyint(3) unsigned NOT NULL COMMENT '0修改1新增2删除',
  `islock` tinyint(3) unsigned NOT NULL COMMENT '是否锁定',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `catid` mediumint(8) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(4) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `vid` (`vid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容审核表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_admin`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '管理员uid',
  `setting` text DEFAULT NULL COMMENT '相关配置',
  `usermenu` text DEFAULT NULL COMMENT '自定义面板菜单，序列化数组格式',
  `history` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='管理员表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_admin_login`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_admin_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `loginip` varchar(50) NOT NULL COMMENT '登录Ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) NOT NULL COMMENT '客户端信息',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `loginip` (`loginip`),
  KEY `logintime` (`logintime`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='登录日志记录';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_admin_menu`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_admin_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级菜单id',
  `name` text NOT NULL COMMENT '菜单语言名称',
  `uri` varchar(255) DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(255) DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(3) unsigned DEFAULT NULL COMMENT '是否隐藏',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标标示',
  `displayorder` int(11) DEFAULT NULL COMMENT '排序值',
  `site` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `list` (`pid`),
  KEY `displayorder` (`displayorder`),
  KEY `mark` (`mark`),
  KEY `hidden` (`hidden`),
  KEY `uri` (`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='后台菜单表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_admin_min_menu`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_admin_min_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级菜单id',
  `name` text NOT NULL COMMENT '菜单语言名称',
  `site` text NOT NULL COMMENT '站点归属',
  `uri` varchar(255) DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(255) DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(3) unsigned DEFAULT NULL COMMENT '是否隐藏',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标标示',
  `displayorder` int(11) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `list` (`pid`),
  KEY `displayorder` (`displayorder`),
  KEY `mark` (`mark`),
  KEY `hidden` (`hidden`),
  KEY `uri` (`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='后台简化菜单表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_admin_notice`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_admin_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `site` int(11) NOT NULL COMMENT '站点id',
  `type` varchar(20) NOT NULL COMMENT '提醒类型：系统、内容、会员、应用',
  `msg` text NOT NULL COMMENT '提醒内容说明',
  `uri` varchar(100) NOT NULL COMMENT '对应的URI',
  `to_rid` varchar(100) NOT NULL COMMENT '指定角色组',
  `to_uid` varchar(100) NOT NULL COMMENT '指定管理员',
  `status` tinyint(1) NOT NULL COMMENT '未处理0，1已查看，2处理中，3处理完成',
  `uid` int(11) NOT NULL COMMENT '申请人',
  `username` varchar(100) NOT NULL COMMENT '申请人',
  `op_uid` int(11) NOT NULL COMMENT '处理人',
  `op_username` varchar(100) NOT NULL COMMENT '处理人',
  `updatetime` int(11) NOT NULL COMMENT '处理时间',
  `inputtime` int(11) NOT NULL COMMENT '提醒时间',
  PRIMARY KEY (`id`),
  KEY `uri` (`uri`),
  KEY `site` (`site`),
  KEY `status` (`status`),
  KEY `uid` (`uid`),
  KEY `op_uid` (`op_uid`),
  KEY `to_uid` (`to_uid`),
  KEY `to_rid` (`to_rid`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='后台提醒表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_admin_role`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_admin_role` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `site` text NOT NULL COMMENT '允许管理的站点，序列化数组格式',
  `name` text NOT NULL COMMENT '角色组语言名称',
  `system` text NOT NULL COMMENT '系统权限',
  `module` text NOT NULL COMMENT '模块权限',
  `application` text NOT NULL COMMENT '应用权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='后台角色权限表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_admin_role_index`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_admin_role_index` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `roleid` mediumint(8) unsigned DEFAULT NULL COMMENT '角色组id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `roleid` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='后台角色组分配表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_admin_setting`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_admin_setting` (
  `name` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='系统属性参数表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_admin_verify`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_admin_verify` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '名称',
  `verify` text NOT NULL COMMENT '审核部署',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='审核管理表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_app_chtml_cat`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_app_chtml_cat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mid` varchar(50) NOT NULL,
  `where` text DEFAULT NULL,
  `param` text DEFAULT NULL,
  `counts` int(11) NOT NULL,
  `htmls` int(11) NOT NULL,
  `error` text DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT NULL COMMENT '状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '最近生成时间',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生成静态定时栏目任务';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_app_login`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_app_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `is_login` int(10) unsigned DEFAULT NULL COMMENT '是否首次登录',
  `is_repwd` int(10) unsigned DEFAULT NULL COMMENT '是否重置密码',
  `updatetime` int(10) unsigned NOT NULL COMMENT '修改密码时间',
  `logintime` int(10) unsigned NOT NULL COMMENT '最近登录时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `logintime` (`logintime`),
  KEY `updatetime` (`updatetime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='账号记录';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_app_mfile`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_app_mfile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户',
  `total` int(11) NOT NULL COMMENT '总大小',
  `filesize` int(11) NOT NULL COMMENT '已经使用',
  `inputtime` int(10) unsigned NOT NULL COMMENT '最近上传',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户附件情况';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_app_safe_mm`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_app_safe_mm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) DEFAULT NULL COMMENT '文件',
  `error` varchar(255) DEFAULT NULL COMMENT '木马代码',
  `inputtime` int(10) unsigned DEFAULT NULL COMMENT '扫描时间',
  `ts` int(10) unsigned DEFAULT NULL COMMENT '是否通知',
  PRIMARY KEY (`id`),
  KEY `ts` (`ts`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='木马扫描记录';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_attachment`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_attachment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` mediumint(8) unsigned NOT NULL COMMENT '站点id',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `tableid` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '附件副表id',
  `download` mediumint(9) NOT NULL DEFAULT 0 COMMENT '无用保留',
  `filesize` int(10) unsigned NOT NULL COMMENT '文件大小',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filemd5` varchar(50) NOT NULL COMMENT '文件md5值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `relatedtid` (`related`),
  KEY `fileext` (`fileext`),
  KEY `filemd5` (`filemd5`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=720 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='附件表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_attachment_data`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_attachment_data` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `inputtime` (`inputtime`),
  KEY `fileext` (`fileext`),
  KEY `remote` (`remote`),
  KEY `author` (`author`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='附件已归档表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_attachment_remote`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_attachment_remote` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL COMMENT '类型',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '访问地址',
  `value` text NOT NULL COMMENT '参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='远程附件表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_attachment_unused`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_attachment_unused` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` mediumint(8) unsigned NOT NULL COMMENT '站点id',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`),
  KEY `fileext` (`fileext`),
  KEY `remote` (`remote`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='未使用的附件表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_cron`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` int(11) NOT NULL COMMENT '站点',
  `type` varchar(20) NOT NULL COMMENT '类型',
  `value` text NOT NULL COMMENT '参数值',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `error` text DEFAULT NULL COMMENT '错误信息',
  `updatetime` int(10) unsigned NOT NULL COMMENT '执行时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '写入时间',
  PRIMARY KEY (`id`),
  KEY `site` (`site`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='任务管理';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_dbbackup_record`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_dbbackup_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tables` text NOT NULL COMMENT '备份表',
  `path` varchar(255) NOT NULL COMMENT '备份路径',
  `size` varchar(20) NOT NULL COMMENT '备份大小',
  `inputtime` int(10) unsigned NOT NULL COMMENT '备份时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据库备份记录表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_field`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '字段别名语言',
  `fieldname` varchar(50) NOT NULL COMMENT '字段名称',
  `fieldtype` varchar(50) NOT NULL COMMENT '字段类型',
  `relatedid` smallint(5) unsigned NOT NULL COMMENT '相关id',
  `relatedname` varchar(50) NOT NULL COMMENT '相关表',
  `isedit` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '是否可修改',
  `ismain` tinyint(3) unsigned NOT NULL COMMENT '是否主表',
  `issystem` tinyint(3) unsigned NOT NULL COMMENT '是否系统表',
  `ismember` tinyint(3) unsigned NOT NULL COMMENT '是否会员可见',
  `issearch` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '是否可搜索',
  `disabled` tinyint(3) unsigned NOT NULL COMMENT '禁用？',
  `setting` text NOT NULL COMMENT '配置信息',
  `displayorder` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `list` (`relatedid`,`disabled`,`issystem`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='字段表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_linkage`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_linkage` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `type` tinyint(3) unsigned NOT NULL,
  `code` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='联动菜单表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_linkage_data_1`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_linkage_data_1` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site` mediumint(8) unsigned NOT NULL COMMENT '站点id',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '上级id',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `cname` varchar(30) NOT NULL COMMENT '别名',
  `child` tinyint(3) unsigned DEFAULT 0 COMMENT '是否有下级',
  `hidden` tinyint(3) unsigned DEFAULT 0 COMMENT '前端隐藏',
  `childids` text DEFAULT NULL COMMENT '下级所有id',
  `displayorder` mediumint(9) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `cname` (`cname`),
  KEY `hidden` (`hidden`),
  KEY `list` (`site`,`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='联动菜单数据表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_mail_smtp`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_mail_smtp` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `port` mediumint(8) unsigned NOT NULL,
  `displayorder` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='邮件账户表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` char(50) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `phone` char(20) NOT NULL COMMENT '手机号码',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '加密密码',
  `salt` varchar(50) NOT NULL COMMENT '随机加密码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `money` decimal(10,2) unsigned NOT NULL COMMENT 'RMB',
  `freeze` decimal(10,2) unsigned NOT NULL COMMENT '冻结RMB',
  `spend` decimal(10,2) unsigned NOT NULL COMMENT '消费RMB总额',
  `score` int(10) unsigned NOT NULL COMMENT '虚拟币',
  `experience` int(10) unsigned NOT NULL COMMENT '经验值',
  `regip` varchar(50) NOT NULL COMMENT '注册ip',
  `regtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `randcode` mediumint(8) unsigned NOT NULL COMMENT '随机验证码',
  `login_attr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='会员表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member_data`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_admin` tinyint(3) unsigned DEFAULT 0 COMMENT '是否是管理员',
  `is_lock` tinyint(3) unsigned DEFAULT 0 COMMENT '账号锁定标识',
  `is_auth` tinyint(3) unsigned DEFAULT 0 COMMENT '实名认证标识',
  `is_verify` tinyint(3) unsigned DEFAULT 0 COMMENT '审核标识',
  `is_mobile` tinyint(3) unsigned DEFAULT 0 COMMENT '手机认证标识',
  `is_avatar` tinyint(3) unsigned DEFAULT 0 COMMENT '头像上传标识',
  `is_complete` tinyint(3) unsigned DEFAULT 0 COMMENT '完善资料标识',
  `is_email` tinyint(1) DEFAULT NULL COMMENT '邮箱认证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='会员表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member_explog`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member_explog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `value` int(11) NOT NULL COMMENT '分数变化值',
  `mark` varchar(50) NOT NULL COMMENT '标记',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `url` varchar(255) NOT NULL COMMENT '相关地址',
  `inputtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mark` (`mark`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='经验值流水日志';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member_group`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '用户组名称',
  `price` decimal(10,2) NOT NULL COMMENT '售价',
  `unit` tinyint(3) unsigned NOT NULL COMMENT '价格单位:1积分，0金钱',
  `days` int(10) unsigned NOT NULL COMMENT '生效时长',
  `apply` tinyint(3) unsigned NOT NULL COMMENT '是否申请',
  `register` tinyint(3) unsigned NOT NULL COMMENT '是否允许注册',
  `setting` text NOT NULL COMMENT '用户组配置',
  `displayorder` smallint(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户组表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member_group_index`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member_group_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `gid` smallint(5) unsigned NOT NULL COMMENT '用户组id',
  `lid` smallint(5) unsigned NOT NULL COMMENT '用户组等级id',
  `stime` int(10) unsigned NOT NULL COMMENT '开通时间',
  `etime` int(10) unsigned NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `lid` (`lid`),
  KEY `gid` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户组归属表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member_group_verify`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member_group_verify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `gid` smallint(5) unsigned NOT NULL COMMENT '用户组id',
  `lid` smallint(5) unsigned NOT NULL COMMENT '用户组等级id',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `price` decimal(10,2) DEFAULT NULL COMMENT '已费用',
  `content` text NOT NULL COMMENT '自定义字段信息',
  `inputtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户组申请审核';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member_level`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member_level` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `gid` smallint(5) unsigned NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `stars` int(10) unsigned NOT NULL COMMENT '图标',
  `value` int(10) unsigned NOT NULL COMMENT '升级值要求',
  `note` text NOT NULL COMMENT '备注',
  `apply` tinyint(3) unsigned NOT NULL COMMENT '是否允许升级',
  `setting` text NOT NULL COMMENT '等级配置',
  `displayorder` smallint(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `value` (`value`),
  KEY `apply` (`apply`),
  KEY `gid` (`gid`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户组级别表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member_login`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `type` varchar(30) NOT NULL COMMENT '登录方式',
  `loginip` varchar(50) NOT NULL COMMENT '登录Ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) NOT NULL COMMENT '客户端信息',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `loginip` (`loginip`),
  KEY `logintime` (`logintime`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='登录日志记录';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member_menu`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级菜单id',
  `name` text NOT NULL COMMENT '菜单语言名称',
  `uri` varchar(255) DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(255) DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(3) unsigned DEFAULT NULL COMMENT '是否隐藏',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标标示',
  `group` text DEFAULT NULL COMMENT '用户组划分',
  `site` text DEFAULT NULL COMMENT '站点划分',
  `client` text DEFAULT NULL COMMENT '终端划分',
  `displayorder` int(11) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `mark` (`mark`),
  KEY `hidden` (`hidden`),
  KEY `uri` (`uri`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户组菜单表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member_notice`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(3) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `url` varchar(255) NOT NULL COMMENT '相关地址',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  `mark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='会员通知提醒表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member_oauth`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member_oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员uid',
  `oid` varchar(255) NOT NULL COMMENT 'OAuth返回id',
  `oauth` varchar(255) NOT NULL COMMENT '运营商',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `unionid` varchar(255) DEFAULT NULL COMMENT 'unionId',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `expire_at` int(10) unsigned NOT NULL COMMENT '绑定时间',
  `access_token` varchar(255) DEFAULT NULL COMMENT '保留',
  `refresh_token` varchar(255) DEFAULT NULL COMMENT '保留',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='快捷登录用户OAuth授权表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member_scorelog`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member_scorelog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `value` int(11) NOT NULL COMMENT '分数变化值',
  `mark` varchar(50) NOT NULL COMMENT '标记',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `url` varchar(255) NOT NULL COMMENT '相关地址',
  `inputtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mark` (`mark`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='金币流水日志';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member_setting`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member_setting` (
  `name` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户属性参数表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_member_verify`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_member_verify` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员uid',
  `tid` tinyint(3) unsigned NOT NULL COMMENT '类别',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `content` mediumtext NOT NULL COMMENT '自定义字段信息',
  `result` text NOT NULL COMMENT '处理结果',
  `updatetime` int(10) unsigned NOT NULL COMMENT '处理时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员审核表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_module`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_module` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site` text DEFAULT NULL COMMENT '站点划分',
  `dirname` varchar(50) NOT NULL COMMENT '目录名称',
  `share` tinyint(3) unsigned DEFAULT NULL COMMENT '是否共享模块',
  `setting` text DEFAULT NULL COMMENT '配置信息',
  `comment` text DEFAULT NULL COMMENT '评论信息',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '禁用？',
  `displayorder` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`),
  KEY `disabled` (`disabled`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='模块表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_module_form`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_module_form` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '表单名称',
  `table` varchar(50) NOT NULL COMMENT '表单表名称',
  `module` varchar(50) NOT NULL COMMENT '模块目录',
  `disabled` tinyint(3) unsigned NOT NULL COMMENT '是否禁用',
  `setting` text NOT NULL COMMENT '表单配置',
  PRIMARY KEY (`id`),
  KEY `table` (`table`),
  KEY `disabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='模块表单表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_site`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_site` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '站点名称',
  `domain` varchar(50) NOT NULL COMMENT '站点域名',
  `setting` text NOT NULL COMMENT '站点配置',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '禁用？',
  `displayorder` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='站点表';<XUNRUICMS_DB_LINE>
DROP TABLE IF EXISTS `dr_urlrule`;<XUNRUICMS_DB_LINE>
CREATE TABLE `dr_urlrule` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL COMMENT '规则类型',
  `name` varchar(50) NOT NULL COMMENT '规则名称',
  `value` text NOT NULL COMMENT '详细规则',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='URL规则表';<XUNRUICMS_DB_LINE>