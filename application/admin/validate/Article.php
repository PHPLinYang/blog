<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10 0010
 * Time: 11:18
 */
namespace app\admin\validate;

use think\Validate;

class Article extends Validate
{
    protected $rule = [
        'cate_id|所属分类' => 'require|integer',
        'title|标题' => 'require|length:1,30',
        'author|作者' => 'require|length:1,20',
        'thumb|封面图' => 'require|max:100',
        'tags|标签' => 'require|length:1,255',
        'description|描述' => 'require|length:1,255',
        'content|内容' => 'require',
        'is_recommend|是否推荐' => 'integer',
    ];
    protected $message  =   [

    ];

    public function sceneEdit()
    {
        return $this->remove('catename', 'require')
            ->remove('catename', 'unique');
    }
}