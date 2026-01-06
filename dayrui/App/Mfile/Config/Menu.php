<?php

/**
 * 菜单配置
 */


return [

    'admin' => [

        'app' => [
            'left' => [
                'app-mfile' => [
                    'name' => '用户附件',
                    'icon' => 'fa fa-folder',
                    'link' => [
                        [
                            'name' => '附件统计',
                            'icon' => 'fa fa-folder',
                            'uri' => 'mfile/home/index',
                        ],
                        [
                            'name' => '权限设置',
                            'icon' => 'fa fa-cog',
                            'uri' => 'mfile/config/index',
                        ],
                    ]
                ],
            ],
        ],

    ],


    'member' => [

        'user' => [
            'link' => [
                [
                    'name' => '附件管理',
                    'icon' => 'fa fa-folder',
                    'uri' => 'mfile/home/index',
                ],
            ],
        ],
    ],
];