<?php
namespace app\index\controller;

use app\index\controller\Base;

class Index extends Base
{
    public function index()
    {
        //获取首页文章数据
        $articles = model('Article')->where('status',1)
            ->field('id,title,description,thumb,create_time,tags')
            ->order('create_time desc')
            ->all();

        $this->assign('articles',$articles);
        return $this->fetch();
    }

}
