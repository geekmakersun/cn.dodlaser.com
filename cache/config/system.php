<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 系统配置文件
 */

return [

	'SYS_DEBUG'                     => 0, //调试器开关
	'SYS_ADMIN_CODE'                => 0, //后台登录验证码开关
	'SYS_ADMIN_LOG'                 => 1, //后台操作日志开关
	'SYS_AUTO_FORM'                 => 0, //自动存储表单数据
	'SYS_ADMIN_PAGESIZE'            => 100, //后台数据分页显示数量
	'SYS_TABLE_ISFOOTER'            => 0, //批量操作按钮位置设定
	'SYS_CRON_AUTH'                 => '', //自动任务权限IP地址
	'SYS_SMS_IMG_CODE'              => 0, //发送短信验证码双重图形验证开关
	'SYS_GO_404'                    => 0, //404页面跳转开关
	'SYS_301'                       => 0, //内容地址唯一模式
	'SYS_FONT_SIZE'                 => '', //字号设置
	'SYS_URL_ONLY'                  => 0, //地址匹配规则
	'SYS_URL_REL'                   => 0, //地址相对模式
	'SYS_KEY'                       => 'PHPCMF621F1704FFB78', //安全密匙
	'SYS_CSRF'                      => 0, //开启跨站验证
	'SYS_CSRF_TIME'                 => 0, //跨站验证有效期
	'SYS_HTTPS'                     => 1, //https模式
	'SYS_NOT_ADMIN_CACHE'           => 0, //禁用后台tab切换效果
	'SYS_ADMIN_MODE'                => 0, //禁用后台登录进行模式选择
	'SYS_ADMIN_LOGINS'              => 10, //登录失败N次后，系统将锁定登录
	'SYS_ADMIN_LOGIN_TIME'          => 0, //登录失败锁定后在x分钟内禁止登录
	'SYS_ADMIN_LOGIN_AES'           => 1, //登录密码加密处理
	'SYS_ADMIN_OAUTH'               => 0, //后台启用快捷登录
	'SYS_ADMIN_SMS_LOGIN'           => 0, //后台启用短信登录
	'SYS_ADMIN_SMS_CHECK'           => 0, //后台启用短信二次验证登录
	'SYS_ATTACHMENT_DB'             => 1, //附件归属开启模式
	'SYS_ATTACHMENT_GUEST'          => 0, //游客是否附件上传
	'SYS_ATTACHMENT_PAGESIZE'       => 100, //浏览附件分页数
	'SYS_ATTACHMENT_CF'             => 1, //重复上传控制
	'SYS_ATTACHMENT_REL'            => 0, //相对于当前站点的域名
	'SYS_ATTACHMENT_SAFE'           => 0, //附件上传安全模式
	'SYS_ATTACHMENT_DOWN_REMOTE'    => 0, //下载远程附件重命名方式
	'SYS_ATTACHMENT_DOWN_SIZE'      => 50, //下载附件重命名条件
	'SYS_ATTACHMENT_PATH'           => '', //附件上传路径
	'SYS_ATTACHMENT_SAVE_TYPE'      => 0, //附件存储方式
	'SYS_ATTACHMENT_SAVE_DIR'       => '', //附件存储目录
	'SYS_ATTACHMENT_SAVE_ID'        => 0, //附件存储全局策略
	'SYS_ATTACHMENT_URL'            => '', //附件访问地址
	'SYS_AVATAR_PATH'               => '', //头像上传路径
	'SYS_AVATAR_URL'                => '', //头像访问地址
	'SYS_API_TOKEN'                 => '', //API请求密钥
	'SYS_API_CODE'                  => 1, //API请求时验证码开关
	'SYS_API_REL'                   => 0, //API请求时的URL方式
	'SYS_THEME_ROOT_PATH'           => 0, //资源路径引用方式
	'SYS_NOT_UPDATE'                => 0, //禁止自动检测版本

];