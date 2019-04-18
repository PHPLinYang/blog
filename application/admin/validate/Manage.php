<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/11 0011
 * Time: 10:10
 */
namespace app\admin\validate;

use think\Validate;

class Manage extends Validate
{
    protected $rule = [
        'username|名称' => 'require|length:1,20|unique:manage',
        'password|密码' => 'require|length:1,16',
        'repassword|确认密码' => 'confirm:password',
        'pic|头像' => 'require|max:100',
        'phone|手机号' => 'require|mobile',
        'email|邮箱' => 'require|email',
    ];
    protected $message  =   [

    ];

    public function sceneEdit()
    {
        return $this->remove('catename', 'require')
            ->remove('catename', 'unique');
    }
}