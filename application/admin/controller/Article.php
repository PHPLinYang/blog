<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10 0010
 * Time: 10:27
 */
namespace app\admin\controller;

use app\admin\controller\Base;

class Article extends Base
{
    public function lst()
    {
        //获取文章数据
        $article = model('Article');
        $articles = $article->alias('a')
            ->join('category c','a.cate_id = c.id')
            ->where('a.status','>',0)
            ->field('a.id,a.list_order,c.catename,a.title,a.author,a.thumb,a.create_time')
            ->paginate();
        //halt($articles);

        $this->assign('articles',$articles);
        return $this->fetch();
    }
    public function add()
    {
        //获取分类数据
        $category = model('Category');
        $cates = $category->all();

        //表单提交处理
        if(request()->isPost()){
            $data = input('post.');
            //处理所属分类
            if($data['cate_id'] == 0){
                $this->error('请选择所属分类！');
            }
            // 获取表单上传文件
            $file = request()->file('thumb');
            if($file){
                // 移动到框架应用根目录/uploads/ 目录下
                $info = $file->move( './static/uploads');
                if($info){
                    $data['thumb'] = $info->getSaveName();
                }else{
                    // 上传失败获取错误信息
                    $this->error($file->getError());
                }
            }else{
                $this->error("请上传封面图!");
            }
            //处理是都推荐值
            if(empty($data['is_recommend'])){
                $data['is_recommend'] = 0;
            }elseif ($data['is_recommend'] == "on"){
                $data['is_recommend'] = 1;
            }
            //验证数据
            $validate = validate('Article');
            if(!$validate->check($data)){
                $this->error($validate->getError());
            }
            //提交到模型处理数据
            $obj = model('Article');
            $res = $obj->add($data);
            if($res){
                $this->success('新增成功！','article/lst');
            }else{
                $this->error('新增失败！');
            }
        }

        $this->assign('cates',$cates);
        return $this->fetch();
    }
    public function edit($id)
    {
        //获取分类数据
        $category = model('Category');
        $cates = $category->all();
        //验证ID
        if(empty($id) || !is_numeric($id)){
            $this->error('非法参数！');
        }
        //获取相应ID文章数据
        $article = model('Article')->find($id);

        $this->assign('cates',$cates);
        $this->assign('article',$article);
        return $this->fetch();
    }
    public function del($id)
    {
        //验证ID
        if(empty($id) || !is_numeric($id)){
            $this->error('非法参数！');
        }
        //更新数据库数据
        if(model('Article')->where('id',$id)->update(['status' => 0])){
            $this->success('删除成功！','article/lst');
        }else{
            $this->error("删除失败！");
        }
    }
}
