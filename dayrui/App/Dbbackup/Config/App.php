<?php

return [

    'name' => '数据库备份',
    'author' => '微科技工作室',
    'version' => '1.0',
    'description' => '一个简单高效的数据库备份工具，支持备份、恢复、下载等功能',

    'namespace' => 'Phpcmf\Dbbackup',

    // 后台菜单
    'menu' => [
        'name' => '数据库备份',
        'icon' => 'fa fa-database',
        'left' => [
            [
                'name' => '备份管理',
                'icon' => 'fa fa-database',
                'link' => [
                    [
                        'name' => '数据库备份',
                        'icon' => 'fa fa-database',
                        'uri' => 'dbbackup/home/index',
                    ],
                    [
                        'name' => '备份记录',
                        'icon' => 'fa fa-list',
                        'uri' => 'dbbackup/home/record',
                    ]
                ]
            ],
        ]
    ],

    // 系统钩子
    'hooks' => [
    ],

    // 加载系统JS
    'js_file' => [
        'admin' => [
            'admin.js',  // 系统核心JS
            'form.js'    // 表单处理JS
        ]
    ],

    // 数据表配置
    'tables' => [
        'dbbackup_record' => [
            'order_by' => 'inputtime desc', // 默认按时间倒序排列
        ]
    ],
]; 