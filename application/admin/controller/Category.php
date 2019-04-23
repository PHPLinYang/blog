<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10 0010
 * Time: 10:27
 */
namespace app\admin\controller;

use app\admin\controller\Base;
use think\Db;

class Category extends Base
{
    public function lst()
    {
        //获取分类信息
        $cates = Db::name('category')->where('status','>',0)
            ->order('list_order')
            ->paginate();
        $this->assign('cates',$cates);
        return $this->fetch();
    }
    public function add()
    {
        if(request()->isPost()){
            $data = input('post.');
            //验证数据
            $validate = validate('Category');
            if(!$validate->check($data)){
                $this->error($validate->getError());
            }
            $data['create_time'] = time();
            //写入数据库
            if(Db::name('category')->insert($data)){
                $this->success('新增成功！','category/lst');
            }else{
                $this->error('新增失败！');
            }
        }
        return $this->fetch();
    }
    public function edit($id)
    {
        //验证ID
        if(empty($id) || !is_numeric($id)){
            $this->error('非法参数！');
        }

        //获取对应ID分类数据
        $cate = Db::name('category')->find($id);

        //获取提交修改信息
        if(request()->isPost()){
            $data = input('post.');
            if(empty($data['catename'])){
                $data['catename'] = $cate['catename'];
            }
            //验证数据
            $validate = validate('Category');
            if(!$validate->scene('edit')->check($data)){
                $this->error($validate->getError());
            }
            $data['update_time'] = time();
            //更新数据库
            if(Db::name('category')->where('id',$id)->update($data)){
                $this->success('更新成功！','category/lst');
            }else{
                $this->success('更新失败！');
            }
        }

        $this->assign('cate',$cate);
        return $this->fetch();
    }
    public function del($id)
    {
        //验证ID
        if(empty($id) || !is_numeric($id)){
            $this->error('非法参数！');
        }
        //更新数据库数据
        if(Db::name('category')->where('id',$id)->update(['status' => 0])){
            $this->success('删除成功！','category/lst');
        }else{
            $this->error("删除失败！");
        }
    }

    //排序
    public function sort()
    {
        $data = input('post.');
        if(empty($data['id']) || empty($data['list_order']) || !is_numeric($data['list_order'])){
            return ['code' => 0,'msg' => '参数不合法！'];
        }
        //更新数据库
        $res = Db::name('category')->where('id',$data['id'])->update(['list_order' => $data['list_order']]);
        if($res){
            return $this->result($_SERVER['HTTP_REFERER'],1,'排序成功！');
        }else{
            return $this->result($_SERVER['HTTP_REFERER'],0,'排序失败');
        }
    }
}
