<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10 0010
 * Time: 11:18
 */
namespace app\admin\validate;

use think\Validate;

class Category extends Validate
{
    protected $rule = [
        'catename|分类名称' => 'require|length:1,20|unique:category',
    ];
    protected $message  =   [

    ];

    public function sceneEdit()
    {
        return $this->remove('catename', 'require')
            ->remove('catename', 'unique');
    }
}