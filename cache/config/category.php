<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 栏目配置文件
 */

return array (
    'share' => array (
        'ld' => '1',
        'popen' => '1',
        'rname' => '0',
        'linkfix' => '0',
        'total' => '1',
        'sys_field' =>     array (
            0 => 'order',
            1 => 'use',
            2 => 'show',
            3 => 'ismain',
            4 => 'id',
            5 => 'tid',
            6 => 'mid',
            7 => 'html',
        ),
        'list_field' =>     array (
            'thumb' =>         array (
                'name' => '缩略图',
                'width' => '',
                'func' => '',
            ),
            'content' =>         array (
                'name' => '栏目内容',
                'width' => '',
                'func' => '',
            ),
        ),
        'name_size' => '0',
        'MAX_CATEGORY' => '300',
    ),
);