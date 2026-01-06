<?php
return [
    'admin' => [
        'app' => [
            'left' => [
                'app-dbbackup' => [
                    'name' => '数据库管理',
                    'icon' => 'fa fa-database',
                    'link' => [
                        [
                            'name' => '数据库备份',
                            'icon' => 'fa fa-download',
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
        ]
    ]
]; 