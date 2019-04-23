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

class Manage extends Base
{
    public function lst()
    {
        //获取管理员信息
        $manages = model('Manage')->where('status','>',0)
            ->field('id,username,phone,email,status')
            ->paginate();

        $this->assign('manages',$manages);
        return $this->fetch();
    }
    public function add()
    {
        //获取权限组
        $groups = Db::name('auth_group')->where('status',1)->select();
        if(request()->isPost()){
            $data = input('post.');
            // 获取表单上传文件
            $file = request()->file('pic');
            if($file){
                // 移动到框架应用根目录/uploads/ 目录下
                $info = $file->move( './static/uploads');
                if($info){
                    $data['pic'] = $info->getSaveName();
                }else{
                    // 上传失败获取错误信息
                    $this->error($file->getError());
                }
            }else{
                $this->error("请上传头像!");
            }

            $validate = validate('Manage');
            if(!$validate->check($data)){
                $this->error($validate->getError());
            }
            $data['password'] = md5($data['password'].config('app.salt'));
            $manage = model('Manage');
            if($manage->save($data)){
                //halt($manage->id);
                $group['uid'] = $manage->id;
                $group['group_id'] = $data['group_id'];
                Db::name('auth_group_access')->insert($group);
                $this->success('新增成功！','manage/lst');
            }else{
                $this->success('新增失败！');
            }


            //提交数据给模型处理
//            $manage = model('manage')->add($data);
//            if($manage['code'] == 1){
//                $group['uid'] = $manage['uid'];
//                $group['group_id'] = $data['group_id'];
//                Db::name('auth_group_access')->insert($group);
//                $this->success($manage['msg'],'manage/lst');
//            }else{
//                $this->error($manage['msg']);
//            }

        }

        $this->assign('groups',$groups);
        return $this->fetch();
    }


    public function edit($id)
    {

        return $this->fetch();
    }
    public function del($id)
    {

    }



    //AUTH规则
    public function auth_rule_lst()
    {
        $rules = Db::name('auth_rule')->where('status',1)->paginate();

        $this->assign('rules',$rules);
        return $this->fetch();
    }
    public function auth_rule_add()
    {
        if(request()->isPost()){
            $data = input('post.');
            //数据验证
            //写入数据库
            if(Db::name('auth_rule')->insert($data)){
                $this->success('新增成功！','manage/auth_rule_lst');
            }else{
                $this->error('新增失败！');
            }
        }
        return $this->fetch();
    }
    public function auth_rule_edit()
    {
        return $this->fetch();
    }
    public function auth_rule_del($id)
    {
        if(empty($id) || !is_numeric($id)){
            $this->error('参数错误！');
        }
        if(Db::name('auth_rule')->delete($id)){
            $this->error('删除成功！','manage/auth_rule_lst');
        }else{
            $this->error('删除失败！');
        }
    }


    //AUTH用户组
    public function auth_group_lst()
    {
        //获取角色数据
        $roles = Db::name('auth_group')
            ->where('status',1)
            ->paginate();
        $this->assign('roles',$roles);
        return $this->fetch();
    }
    public function auth_group_add()
    {
        $rules = Db::name('auth_rule')->where('status',1)->select();
        if(request()->isPost()){

            $data = input('post.');
            $data['rules'] = implode(',',$data['rules']);
            //数据验证
            //写入数据库
            if(Db::name('auth_group')->insert($data)){
                $this->success('新增成功！','manage/auth_group_lst');
            }else{
                $this->error('新增失败！');
            }
        }

        $this->assign('rules',$rules);
        return $this->fetch();
    }
    public function auth_group_edit()
    {
        return $this->fetch();
    }
    public function auth_group_del()
    {

    }

    //信息导出为EXCEL
    public function outxls()
    {
        $data = Db::name('manage')->field('id,username,phone,email')->select();

        out_xls($data,'管理员');
    }
}
