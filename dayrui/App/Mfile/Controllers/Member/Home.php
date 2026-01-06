<?php namespace Phpcmf\Controllers\Member;

class Home extends \Phpcmf\Table {


    public function __construct()
    {
        parent::__construct();
        \Phpcmf\Service::V()->assign([
            'mynav' => [
                'index' => '已使用',
                'unused' => '未使用',
            ],
            'remote' => \Phpcmf\Service::C()->get_cache('attachment'),
            'member_total' => \Phpcmf\Service::M('mfile', 'mfile')->get_member_total($this->uid),
            'member_filesize' => \Phpcmf\Service::M('mfile', 'mfile')->get_member_filesize($this->uid),
        ]);
    }

    // 已使用管理
    public function index() {

        $field = [
            'related' => [
                'ismain' => 1,
                'fieldtype' => 'Text',
                'fieldname' => 'related',
                'name' => dr_lang('附件归属'),
            ],
            'fileext' => [
                'ismain' => 1,
                'fieldtype' => 'Text',
                'fieldname' => 'fileext',
                'name' => dr_lang('扩展名'),
            ],
            'uid' => [
                'ismain' => 1,
                'fieldtype' => 'Text',
                'fieldname' => 'uid',
                'name' => 'uid',
            ],
        ];


        $this->_init([
            'table' => 'attachment_data',
            'field' => $field,
            'order_by' => 'id desc',
            'where_list' => 'uid='.$this->uid,
            'date_field' => 'inputtime',
        ]);

        $this->_List();

        \Phpcmf\Service::V()->assign([
            'field' => $field,
            'table' => 'index',
        ]);
        \Phpcmf\Service::V()->display('attachment.html');
    }

    // 未使用的附件
    public function unused() {

        $field = [
            'fileext' => [
                'ismain' => 1,
                'fieldtype' => 'Text',
                'fieldname' => 'fileext',
                'name' => dr_lang('扩展名'),
            ],
            'uid' => [
                'ismain' => 1,
                'fieldtype' => 'Text',
                'fieldname' => 'uid',
                'name' => 'uid',
            ],
        ];


        $this->_init([
            'table' => 'attachment_unused',
            'field' => $field,
            'order_by' => 'id desc',
            'where_list' => 'uid='.$this->uid,
            'date_field' => 'inputtime',
        ]);

        $this->_List();

        \Phpcmf\Service::V()->assign([
            'field' => $field,
            'table' => 'unused',
        ]);
        \Phpcmf\Service::V()->display('attachment.html');
    }

    public function del() {

        $ids = \Phpcmf\Service::L('Input')->get_post_ids();
        !$ids && $this->_json(0, dr_lang('你还没有选择呢'));

        $table = \Phpcmf\Service::L('Input')->post('table');
        $table != 'unused' && $table = 'data';

        $data = \Phpcmf\Service::M()->db->table('attachment_'.$table)->where('uid', $this->uid)->whereIn('id', $ids)->get()->getResultArray();
        !$data && $this->_json(0, dr_lang('所选附件不存在'));

        foreach ($data as $t) {

            $rt = \Phpcmf\Service::M()->table('attachment')->delete($t['id']);
            if (!$rt['code']) {
                return dr_return_data(0, $rt['msg']);
            }

            // 删除记录
            \Phpcmf\Service::M()->table('attachment_'.$table)->delete($t['id']);

            // 开始删除文件
            $storage = new \Phpcmf\Library\Storage($this);
            $storage->delete(\Phpcmf\Service::M('Attachment')->get_attach_info($t['remote']), $t['attachment']);
        }

        $this->_json(1, dr_lang('操作成功'));
    }

    // 强制归档
    public function edit() {

        $ids = \Phpcmf\Service::L('Input')->get_post_ids();
        !$ids && $this->_json(0, dr_lang('你还没有选择呢'));

        $data = \Phpcmf\Service::M()->db->table('attachment_unused')->where('uid', $this->uid)->whereIn('id', $ids)->get()->getResultArray();
        !$data && $this->_json(0, dr_lang('所选附件不存在'));

        $related = 'Save';
        foreach ($data as $t) {
            // 更新主索引表
            \Phpcmf\Service::M()->table('attachment')->update($t['id'], array(
                'related' => $related
            ));
            \Phpcmf\Service::M()->table('attachment_data')->insert(array(
                'id' => $t['id'],
                'uid' => $t['uid'],
                'remote' => $t['remote'],
                'author' => $t['author'],
                'related' => $related,
                'fileext' => $t['fileext'],
                'filesize' => $t['filesize'],
                'filename' => $t['filename'],
                'inputtime' => $t['inputtime'],
                'attachment' => $t['attachment'],
                'attachinfo' => '',
            ));
            // 删除未使用附件
            \Phpcmf\Service::M()->table('attachment_unused')->delete($t['id']);
        }

        $this->_json(1, dr_lang('操作成功'));
    }



}