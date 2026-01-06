<?php namespace Phpcmf\Controllers\Admin;

class Home extends \Phpcmf\Table
{

    public function __construct() {
        parent::__construct();
        $field = [
            'username' => array(
                'ismain' => 1,
                'name' => dr_lang('用户名'),
                'fieldname' => 'username',
                'fieldtype' => 'Text',
            ),
            'uid' => array(
                'ismain' => 1,
                'name' => dr_lang('uid'),
                'fieldname' => 'uid',
                'fieldtype' => 'Text',
            ),
        ];

        $this->_init([
            'table' => 'app_mfile',
            'field' => $field,
            'order_by' => 'inputtime desc',
        ]);
        \Phpcmf\Service::V()->assign([
            'menu' => \Phpcmf\Service::M('auth')->_admin_menu(
                [
                    '用户附件统计' => [APP_DIR.'/'.\Phpcmf\Service::L('Router')->class.'/index', 'fa fa-folder'],
                    '更新统计数据' => [APP_DIR.'/'.\Phpcmf\Service::L('Router')->class.'/update_index', 'fa fa-refresh'],
                    'help' => [565],
                ]
            ),
            'field' => $field,
        ]);
    }

    public function index() {
        $this->_List();
        \Phpcmf\Service::V()->display('index.html');
    }

    // 删除
    public function del() {
        $this->_Del(\Phpcmf\Service::L('Input')->get_post_ids());
    }

    public function update_index() {
        \Phpcmf\Service::V()->display('update.html');
    }

    public function update_add() {

        $page = intval($_GET['page']);
        if (!$page) {
            \Phpcmf\Service::C()->_json(1, dr_lang('正在检查附件'), 1);
        }

        $all = [];
        if (\Phpcmf\Service::M()->table('attachment')->counts()) {
            $all = \Phpcmf\Service::M()->db->query('SELECT uid,sum(filesize) as filesize FROM `'.\Phpcmf\Service::M()->dbprefix('attachment').'` group by uid')->getResultArray();
        }

        if (!$all) {
            exit(\Phpcmf\Service::C()->_json(1, dr_lang('无可用附件统计'), 0));
        }

        \Phpcmf\Service::M()->db->table('app_mfile')->truncate();
        \Phpcmf\Service::M()->db->table('app_mfile')->emptyTable();

        $total = 0;
        foreach ($all as $t) {
            $m = dr_member_info($t['uid']);
            if ($m) {
                \Phpcmf\Service::M()->table('app_mfile')->insert([
                    'uid' => $t['uid'],
                    'username' => (string)$m['username'],
                    'filesize' => $t['filesize'],
                    'total' => \Phpcmf\Service::M('mfile', 'mfile')->get_member_total($t['uid']),
                    'inputtime' => 0,
                ]);
                $total+= $t['filesize'];
            }
        }

        exit(\Phpcmf\Service::C()->_json(1, dr_lang('统计完成，全站归档附件共计：%s', dr_format_file_size($total)), 0));
    }

}
