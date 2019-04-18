<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10 0010
 * Time: 12:17
 */
namespace app\index\controller;

use think\Controller;

class Base extends Controller
{
    protected function initialize()
    {
        //获取分类数据
        $this->getCategory();
        //获取热门点击
        $this->click();
        //获取推荐阅读
        $this->recommend();
    }

    //获取分类数据,status=1,排序升序
    protected function getCategory()
    {
        $category = model('Category');
        $cates = $category->where('status',1)
            ->order('list_order')
            ->all();
        $this->assign('cates',$cates);
    }

    protected function click()
    {
        $clicks = model('Article')->field('id,title')
            ->order('clicks desc')
            ->limit(4)
            ->select();
        $this->assign('clicks',$clicks);
    }

    protected function recommend()
    {
        $recommends = model('Article')->field('id,title')
            ->where('is_recommend',1)
            ->order('update_time desc')
            ->limit(4)
            ->select();
        $this->assign('recommends',$recommends);
    }
}