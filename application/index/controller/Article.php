<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10 0010
 * Time: 10:14
 */
namespace app\index\controller;

use app\index\controller\Base;

 class Article extends Base
 {
     public function lst()
     {
         //获取分类ID
         $cate_id = input('cate_id');
         if(empty($cate_id) || !is_numeric($cate_id)){
            $this->error('请求不合法！');
         }
         //获取首页文章数据
         $articles = model('Article')->where('status',1)
             ->where('cate_id',$cate_id)
             ->field('id,title,description,thumb,create_time,tags')
             ->order('create_time desc')
             ->all();

         $this->assign('articles',$articles);
         return $this->fetch();
     }
     public function detail()
     {
         //获取指定文章ID
         $id = input('id');
         if(empty($id) || !is_numeric($id)){
             $this->error('请求不合法！');
         }
         //获取制定文章数据
         $article = model('Article')->alias('a')
             ->join('category c','c.id = a.cate_id')
             ->field('a.id,a.title,c.catename,a.create_time,a.author,a.tags,a.clicks,a.description,a.content')
             ->where('a.status',1)
             ->get($id);
         //更新阅读数
         model('Article')->save(['clicks' => ['inc', 1]],['id' => $id]);
         $this->assign('article',$article);
         return $this->fetch();
     }
 }