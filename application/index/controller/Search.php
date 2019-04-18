<?php
namespace app\index\controller;

use app\index\controller\Base;

class Search extends Base
{
    public function index()
    {
        $keywords = input('keywords');
        //模糊查询
        $keys = model('Article')->getKeywords($keywords);

        $this->assign('keys',$keys);
        return $this->fetch();
    }

}
