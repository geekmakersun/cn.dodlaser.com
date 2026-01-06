<?php namespace Phpcmf\Controllers\Admin;

class Home extends \Phpcmf\Table
{
    public function __construct() 
    {
        parent::__construct();
        // 检查管理员权限
        if (!dr_in_array(1, $this->admin['roleid'])) {
            $this->_admin_msg(0, dr_lang('需要超级管理员权限'));
        }
    }

    public function index() {
        // 获取数据表
        $tables = \Phpcmf\Service::M()->db->listTables();
        
        \Phpcmf\Service::V()->assign([
            'menu' => \Phpcmf\Service::M('auth')->_admin_menu(
                [
                    '数据库备份' => ['dbbackup/home/index', 'fa fa-database'],
                    '备份记录' => ['dbbackup/home/record', 'fa fa-list'],
                ]
            ),
            'tables' => $tables
        ]);
        \Phpcmf\Service::V()->display('admin/index.html');
    }

    public function backup() {
        // 执行备份
        $tables = \Phpcmf\Service::L('input')->post('tables');
        if (!$tables) {
            $this->_json(0, '请选择要备份的表');
        }

        // 生成备份名称：DB_年月日_时分秒
        $backup_name = 'DB_'.date('Ymd_His');
        $backup_path = ROOTPATH.'uploadfile/dbbackup/'.$backup_name.'/';
        if (!is_dir($backup_path)) {
            dr_mkdirs($backup_path);
        }

        // 创建合并的SQL文件
        $sql_content = "-- 数据库备份\n";
        $sql_content .= "-- 备份时间：".date('Y-m-d H:i:s')."\n";
        $sql_content .= "-- 备份表：".implode(', ', $tables)."\n\n";

        foreach ($tables as $table) {
            $sql_content .= "-- -----------------------------\n";
            $sql_content .= "-- 表结构：`{$table}`\n";
            $sql_content .= "-- -----------------------------\n\n";

            // 获取建表语句
            $create = \Phpcmf\Service::M()->db->query("SHOW CREATE TABLE `$table`")->getRowArray();
            $sql_content .= $create['Create Table'].";\n\n";

            $sql_content .= "-- -----------------------------\n";
            $sql_content .= "-- 表数据：`{$table}`\n";
            $sql_content .= "-- -----------------------------\n\n";
            
            // 获取数据
            $data = \Phpcmf\Service::M()->db->table($table)->get()->getResultArray();
            foreach ($data as $row) {
                $sql_content .= "INSERT INTO `$table` VALUES (".implode(',', array_map(function($v) {
                    return is_null($v) ? 'NULL' : "'".addslashes($v)."'";
                }, $row)).");\n";
            }
            $sql_content .= "\n";
        }

        // 写入合并后的SQL文件
        $backup_file = $backup_path.'database.sql';
        file_put_contents($backup_file, $sql_content);

        // 计算文件大小
        $size = filesize($backup_file);

        // 记录备份
        \Phpcmf\Service::M()->table('dbbackup_record')->insert([
            'tables' => $backup_name,  // 使用备份名称作为显示名
            'path' => $backup_path,
            'size' => dr_format_file_size($size),
            'inputtime' => SYS_TIME
        ]);

        // 返回成功信息
        $this->_json(1, dr_lang('备份完成'), ['function' => 'dr_tips']);
    }

    public function restore() {
        $id = intval(\Phpcmf\Service::L('input')->get('id')); 
        $name = \Phpcmf\Service::L('input')->get('name');
        
        if ($id) {
            $record = \Phpcmf\Service::M()->table('dbbackup_record')->get($id);
            if (!$record) {
                $this->_json(0, '备份记录不存在');
            }
            $backup_file = $record['path'].'database.sql';
        } else if ($name) {
            $backup_file = ROOTPATH.'uploadfile/dbbackup/'.$name.'/database.sql';
        } else {
            $this->_json(0, '参数错误');
        }

        if (!file_exists($backup_file)) {
            $this->_json(0, '备份文件不存在');
        }

        // 读取备份文件内容
        $content = file_get_contents($backup_file);
        
        try {
            // 开启事务
            \Phpcmf\Service::M()->db->transStart();
            
            // 获取所有要恢复的表名
            preg_match_all("/CREATE TABLE `(.*?)`/", $content, $matches);
            $tables = $matches[1];
            
            // 先删除已存在的表
            foreach ($tables as $table) {
                \Phpcmf\Service::M()->db->query("DROP TABLE IF EXISTS `$table`");
            }

            // 分割SQL语句
            $sql = str_replace("\r", "\n", $content);
            $sql = str_replace(";\n", ";<splitmark>", $sql);
            $sqls = explode("<splitmark>", $sql);
            
            // 记录错误的SQL语句
            $error_file = WRITEPATH.'cache/sql_errors.log';
            file_put_contents($error_file, '');

            // 第一步：执行所有CREATE TABLE语句
            foreach ($sqls as $sql) {
                $sql = trim($sql);
                if ($sql && strpos($sql, 'CREATE TABLE') !== false) {
                    try {
                        \Phpcmf\Service::M()->db->query($sql);
                    } catch (\Exception $e) {
                        // 记录错误信息
                        file_put_contents($error_file, "CREATE语句错误:\n".$sql . "\n" . $e->getMessage() . "\n\n", FILE_APPEND);
                        throw $e;
                    }
                }
            }

            // 第二步：执行所有INSERT语句
            foreach ($sqls as $sql) {
                $sql = trim($sql);
                if ($sql && strpos($sql, 'INSERT INTO') !== false) {
                    try {
                        \Phpcmf\Service::M()->db->query($sql);
                    } catch (\Exception $e) {
                        // 记录错误信息
                        file_put_contents($error_file, "INSERT语句错误:\n".$sql . "\n" . $e->getMessage() . "\n\n", FILE_APPEND);
                        throw $e;
                    }
                }
            }
            
            // 提交事务
            \Phpcmf\Service::M()->db->transComplete();
            
            if (\Phpcmf\Service::M()->db->transStatus() === false) {
                $this->_json(0, '数据恢复失败');
            }
            
            // 检查是否有错误记录
            $errors = file_get_contents($error_file);
            if ($errors) {
                $this->_json(1, '数据恢复完成，但有部分SQL执行失败，请查看错误日志', ['function' => 'dr_tips_reload']);
            } else {
                $this->_json(1, '数据恢复完成', ['function' => 'dr_tips_reload']);
            }
            
        } catch (\Exception $e) {
            // 回滚事务
            \Phpcmf\Service::M()->db->transRollback();
            $this->_json(0, '恢复出错：'.$e->getMessage());
        }
    }

    public function record() {
        // 获取数据库记录，按时间倒序排列
        $list = \Phpcmf\Service::M()->table('dbbackup_record')
            ->order_by('inputtime DESC')
            ->getAll();

        // 扫描备份目录获取未记录的文件
        $backup_dir = ROOTPATH.'uploadfile/dbbackup/';
        $unrecorded = [];
        
        if (is_dir($backup_dir)) {
            $dirs = scandir($backup_dir);
            foreach ($dirs as $dir) {
                if ($dir != '.' && $dir != '..' && is_dir($backup_dir.$dir)) {
                    $sql_file = $backup_dir.$dir.'/database.sql';
                    if (file_exists($sql_file) && !\Phpcmf\Service::M()->table('dbbackup_record')->where('tables', $dir)->counts()) {
                        // 读取SQL文件前几行获取信息
                        $fp = fopen($sql_file, 'r');
                        $content = '';
                        for ($i = 0; $i < 3; $i++) {
                            $content .= fgets($fp);
                        }
                        fclose($fp);
                        
                        // 解析备份信息
                        preg_match('/-- 备份时间：(.*?)\n/', $content, $time);
                        preg_match('/-- 备份表：(.*?)\n/', $content, $tables);
                        
                        $unrecorded[] = [
                            'name' => $dir,
                            'path' => $sql_file,
                            'size' => dr_format_file_size(filesize($sql_file)),
                            'time' => $time[1] ?? '',
                            'timestamp' => strtotime($time[1] ?? ''), // 添加时间戳用于排序
                            'tables' => $tables[1] ?? ''
                        ];
                    }
                }
            }
        }

        // 对未记录的备份按时间戳倒序排序
        usort($unrecorded, function($a, $b) {
            return $b['timestamp'] - $a['timestamp'];
        });

        // 合并记录并按时间排序
        $all_records = array_merge($list, $unrecorded);
        usort($all_records, function($a, $b) {
            $time_a = isset($a['inputtime']) ? $a['inputtime'] : $a['timestamp'];
            $time_b = isset($b['inputtime']) ? $b['inputtime'] : $b['timestamp'];
            return $time_b - $time_a;
        });

        \Phpcmf\Service::V()->assign([
            'list' => $list,
            'unrecorded' => $unrecorded,
            'menu' => \Phpcmf\Service::M('auth')->_admin_menu(
                [
                    '数据库备份' => ['dbbackup/home/index', 'fa fa-database'],
                    '备份记录' => ['dbbackup/home/record', 'fa fa-list']
                ]
            )
        ]);
        \Phpcmf\Service::V()->display('admin/record.html');
    }

    public function delete() {
        $id = intval(\Phpcmf\Service::L('input')->get('id')); 
        $name = \Phpcmf\Service::L('input')->get('name');
        
        if ($id) {
            $record = \Phpcmf\Service::M()->table('dbbackup_record')->get($id);
            if (!$record) {
                $this->_json(0, dr_lang('备份记录不存在'));
            }
            $path = $record['path'];
            
            // 删除记录
            \Phpcmf\Service::M()->table('dbbackup_record')->delete($id);
        } else if ($name) {
            $path = ROOTPATH.'uploadfile/dbbackup/'.$name.'/';
        } else {
            $this->_json(0, '参数错误');
        }

        // 删除备份文件
        if (is_dir($path)) {
            dr_dir_delete($path);
        }

        $this->_json(1, dr_lang('删除成功'), ['function' => 'dr_tips_reload']);
    }

    public function download() {
        $id = intval(\Phpcmf\Service::L('input')->get('id')); 
        $name = \Phpcmf\Service::L('input')->get('name');
        
        if ($id) {
            $record = \Phpcmf\Service::M()->table('dbbackup_record')->get($id);
            if (!$record) {
                $this->_admin_msg(0, '备份记录不存在');
            }
            $backup_file = $record['path'].'database.sql';
        } else if ($name) {
            $backup_file = ROOTPATH.'uploadfile/dbbackup/'.$name.'/database.sql';
        } else {
            $this->_admin_msg(0, '参数错误');
        }

        if (!file_exists($backup_file)) {
            $this->_admin_msg(0, '备份文件不存在');
        }

        // 下载文件
        ob_end_clean();
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="'.($name ?: $record['tables']).'.sql"');
        header('Content-Length: ' . filesize($backup_file));
        readfile($backup_file);
        exit;
    }

    public function view() {
        $id = intval(\Phpcmf\Service::L('input')->get('id')); 
        $name = \Phpcmf\Service::L('input')->get('name');
        
        if ($id) {
            $record = \Phpcmf\Service::M()->table('dbbackup_record')->get($id);
            if (!$record) {
                $this->_json(0, '备份记录不存在');
            }
            $backup_file = $record['path'].'database.sql';
        } else if ($name) {
            $backup_file = ROOTPATH.'uploadfile/dbbackup/'.$name.'/database.sql';
        } else {
            $this->_json(0, '参数错误');
        }

        if (!file_exists($backup_file)) {
            $this->_json(0, '备份文件不存在');
        }

        // 解析SQL文件，获取备份的表列表
        $content = file_get_contents($backup_file);
        preg_match_all("/CREATE TABLE `(.*?)`/", $content, $matches);
        $tables = $matches[1];

        \Phpcmf\Service::V()->assign([
            'list' => $tables,
            'record' => ['tables' => $id ? $record['tables'] : $name]
        ]);
        \Phpcmf\Service::V()->display('admin/view.html');
    }

    public function scan() {
        $backup_dir = ROOTPATH.'uploadfile/dbbackup/';
        $files = [];
        
        // 扫描备份目录
        if (is_dir($backup_dir)) {
            $dirs = scandir($backup_dir);
            foreach ($dirs as $dir) {
                if ($dir != '.' && $dir != '..' && is_dir($backup_dir.$dir)) {
                    $sql_file = $backup_dir.$dir.'/database.sql';
                    if (file_exists($sql_file)) {
                        // 读取SQL文件前几行获取信息
                        $fp = fopen($sql_file, 'r');
                        $content = '';
                        for ($i = 0; $i < 3; $i++) {
                            $content .= fgets($fp);
                        }
                        fclose($fp);
                        
                        // 解析备份信息
                        preg_match('/-- 备份时间：(.*?)\n/', $content, $time);
                        preg_match('/-- 备份表：(.*?)\n/', $content, $tables);
                        
                        $files[] = [
                            'name' => $dir,
                            'path' => $sql_file,
                            'size' => dr_format_file_size(filesize($sql_file)),
                            'time' => $time[1] ?? '',
                            'tables' => $tables[1] ?? '',
                            'indb' => \Phpcmf\Service::M()->table('dbbackup_record')->where('tables', $dir)->counts() // 检查是否已在数据库中
                        ];
                    }
                }
            }
        }
        
        \Phpcmf\Service::V()->assign([
            'menu' => \Phpcmf\Service::M('auth')->_admin_menu(
                [
                    '数据库备份' => ['dbbackup/home/index', 'fa fa-database'],
                    '备份记录' => ['dbbackup/home/record', 'fa fa-list'],
                    '识别恢复' => ['dbbackup/home/scan', 'fa fa-search'],
                ]
            ),
            'list' => $files
        ]);
        \Phpcmf\Service::V()->display('admin/scan.html');
    }

    // 导入备份到数据库记录
    public function import() {
        $name = \Phpcmf\Service::L('input')->get('name');
        $path = ROOTPATH.'uploadfile/dbbackup/'.$name.'/';
        
        if (!is_dir($path)) {
            $this->_json(0, '备份文件夹不存在');
        }
        
        $sql_file = $path.'database.sql';
        if (!file_exists($sql_file)) {
            $this->_json(0, 'SQL文件不存在');
        }
        
        // 读取SQL文件前几行获取信息
        $fp = fopen($sql_file, 'r');
        $content = '';
        for ($i = 0; $i < 3; $i++) {
            $content .= fgets($fp);
        }
        fclose($fp);
        
        // 解析备份信息
        preg_match('/-- 备份时间：(.*?)\n/', $content, $time);
        
        // 添加到数据库记录
        \Phpcmf\Service::M()->table('dbbackup_record')->insert([
            'tables' => $name,
            'path' => $path,
            'size' => dr_format_file_size(filesize($sql_file)),
            'inputtime' => strtotime($time[1])
        ]);
        
        $this->_json(1, dr_lang('导入成功'));
    }
} 