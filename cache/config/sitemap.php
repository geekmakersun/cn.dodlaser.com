<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 站长配置文件
 */

return array (
    'sitemap' => array (
        'news' => '1',
        'product' => '1',
        'photo' => '1',
    ),
    'where' => array (
        'news' => '',
        'product' => '',
        'photo' => '',
    ),
    'sitemap_cat' => '1',
    'sitemap_index' => '1',
    'sitemap_limit' => '1000',
    'sitemap_pagesize' => '0',
    'priority_index' => '1.0',
    'priority_category' => '1.0',
    'priority_show' => '1.0',
    'autotime' => '0',
);