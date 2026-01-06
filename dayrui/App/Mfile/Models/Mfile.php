<?php namespace Phpcmf\Model;

// 用户文件权限系统
class Mfile extends \Phpcmf\Model
{

    private $config;

    public function __construct()
    {
        parent::__construct();
        $this->config = \Phpcmf\Service::M('app')->get_config('mfile');

    }

    // 用户附件总空间
    public function get_member_total($uid) {

        if (!$uid || !$this->config) {
            return 0;
        }

        $group = $this->db->table('member_group_index')->where('uid', $uid)->get()->getResultArray();
        if (!$group) {
            return 0;
        }

        if ($this->config['open']) {
            // 按等级
            $value = $this->_get_max_value($group, 'lid');
        } else {
            // 按组
            $value = $this->_get_max_value($group, 'gid');
        }

        return $value;
    }

    // 获取最大权限值
    private function _get_max_value($group, $name ) {

        $config = $name == 'gid' ? $this->config['group'] : $this->config['level'];

        $gids = [];
        foreach ($group as $t) {
            $gids[] = $t[$name];
        }
        if (!is_array($config)) {
            return 0;
        }

        $my = dr_array_intersect($gids, array_flip($config));
        if (!$my) {
            return 0;
        }

        $gid = 0;
        if (count($my) > 1) {
            // 存在多个组，取最大值
            foreach ($config as $i => $t) {
                if (!in_array($i, $my)) {
                    unset($config[$i]);
                }
            }
            $gid = intval(array_search(max($config), $config));
        }

        !$gid && $gid = intval($my[0]);

        if (!$gid) {
            return 0;
        } elseif (!isset($config[$gid])) {
            return 0;
        }

        return abs((int)$config[$gid]) * 1024 * 1024;
    }

    // 用户已经使用附件空间
    public function get_member_filesize($uid) {

        $row = $this->db->query('SELECT sum(filesize) as filesize FROM `'.\Phpcmf\Service::M()->dbprefix('attachment').'` where uid='.intval($uid))->getRowArray();
        return intval($row['filesize']);

    }

    // 上传后更新
    public function update_member($member, $size) {

        $row = $this->table('app_mfile')->where('uid', $member['id'])->getRow();
        if ($row) {
            $this->table('app_mfile')->update($row['id'], [
                'filesize' => $row['filesize'] + $size,
                'total' => $this->get_member_total($member['id']),
                'inputtime' => SYS_TIME,
            ]);
        } else {

            $this->table('app_mfile')->insert([
                'uid' => $member['id'],
                'username' => $member['username'],
                'filesize' => $row['filesize'] + $size,
                'total' => $this->get_member_total($member['id']),
                'inputtime' => SYS_TIME,
            ]);
        }

    }

    // 验证附件上传权限，直接返回1 表示空间不够
    public function check_upload($uid) {

        if ($uid == $this->uid) {
            $member = $this->member;
        } else {
            $member = dr_member_info($uid);
        }

        if ($member['is_admin']) {
            return;
        }

        // 获取用户总空间
        $total = $this->get_member_total($uid);
        if ($total) {
            // 判断空间是否满了
            $filesize = $this->get_member_filesize($uid);
            if ($filesize >= $total) {
                return 1;
            }
        }

        return;

    }

}