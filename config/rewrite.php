<?php

/**
 * URL解析规则
 * 例如：  114.html 对应 index.php?s=demo&c=show&id=114
 * 可以解析：  "114.html"  => 'index.php?s=demo&c=show&id=114',
 * 动态id解析：  "([0-9]+).html"  => 'index.php?s=demo&c=show&id=$1',
 */

return [
// 地图规则
'sitemap\.txt' => 'index.php?s=sitemap&page=999', // 地图规则
'sitemap([0-9]+)\.txt' => 'index.php?s=sitemap&page=999&p=$1', // 地图规则分页
'sitemap\.xml' => 'index.php?s=sitemap&c=home&m=xml&page=998', // 地图规则
'sitemap([0-9]+)\.xml' => 'index.php?s=sitemap&c=home&m=xml&page=998&p=$1', // 地图规则分页

// 内容页规则 - 最具体的规则放在前面
"(.+)\/show-([0-9]+)-([0-9]+)\.html" => "index.php?c=show&id=$2&page=$3",  // 模块内容页(分页)（{pdirname}/show-{id}-{page}.html）
"(.+)\/show-([0-9]+)\.html" => "index.php?c=show&id=$2",  // 模块内容页（{pdirname}/show-{id}.html）

// 列表页规则
"(.+)\/list-([0-9]+)\.html" => "index.php?c=category&dir=$1&page=$2",  // 模块栏目列表(分页)（{pdirname}/list-{page}.html）

// 搜索页规则
"(.+)\/search\/(.+)\.html" => "index.php?s=$1&c=search&rewrite=$2",  // 模块搜索页(分页)（{modname}/search/{param}.html）
"(.+)\/search\.html" => "index.php?s=$1&c=search",  // 模块搜索页（{modname}/search.html）

// 目录页规则 - 最通用的规则放在最后
"(.+)" => "index.php?c=category&dir=$1",  // 模块栏目列表（{pdirname}/）
];
