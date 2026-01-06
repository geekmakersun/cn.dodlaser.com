<?php

/**
 * URL解析规则
 * 例如：  114.html 对应 index.php?s=demo&c=show&id=114
 * 可以解析：  "114.html"  => 'index.php?s=demo&c=show&id=114',
 * 动态id解析：  "([0-9]+).html"  => 'index.php?s=demo&c=show&id=$1',
 */

return [
// 共享模块搜索规则---解析规则----开始
    "([a-z]+)\/search\/(.+)\.html" => "index.php?s=$1&c=search&rewrite=$2",  //【共享模块搜索规则】模块搜索页(分页)（{modname}/search/{param}.html）（此规则由系统生成，不一定会准确，请开发者自行调整）
    "([a-z]+)\/search\.html" => "index.php?s=$1&c=search",  //【共享模块搜索规则】模块搜索页（{modname}/search.html）（此规则由系统生成，不一定会准确，请开发者自行调整）

// 共享模块搜索规则---解析规则----结束

// 共享栏目和内容页规则---解析规则----开始
    "([\w\\/]+)\/list-([0-9]+)\.html" => "index.php?c=category&dir=$1&page=$2",  //【共享栏目和内容页规则】模块栏目列表(分页)（{pdirname}/list-{page}.html）（此规则由系统生成，不一定会准确，请开发者自行调整）
    "([\w\\/]+)" => "index.php?c=category&dir=$1",  //【共享栏目和内容页规则】模块栏目列表（{pdirname}/）（此规则由系统生成，不一定会准确，请开发者自行调整）
    "([\w\\/]+)\/show-([0-9]+)-([0-9]+)\.html" => "index.php?c=show&id=$2&page=$3",  //【共享栏目和内容页规则】模块内容页(分页)（{pdirname}/show-{id}-{page}.html）（此规则由系统生成，不一定会准确，请开发者自行调整）
    "([\w\\/]+)\/show-([0-9]+)\.html" => "index.php?c=show&id=$2",  //【共享栏目和内容页规则】模块内容页（{pdirname}/show-{id}.html）（此规则由系统生成，不一定会准确，请开发者自行调整）

// 共享栏目和内容页规则---解析规则----结束
'sitemap\.txt' => 'index.php?s=sitemap&page=999', // 地图规则
'sitemap([0-9]+)\.txt' => 'index.php?s=sitemap&page=999&p=$1', // 地图规则分页
'sitemap\.xml' => 'index.php?s=sitemap&c=home&m=xml&page=998', // 地图规则
'sitemap([0-9]+)\.xml' => 'index.php?s=sitemap&c=home&m=xml&page=998&p=$1', // 地图规则分页
];