<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10 0010
 * Time: 10:27
 */
namespace app\admin\controller;


use think\Controller;

class Login extends Controller
{
    public function login()
    {
        //获取登录信息
        if(request()->isPost()){
            $data = input('post.');
            //数据验证

            // 检测输入的验证码是否正确，$value为用户输入的验证码字符串
            if( !captcha_chk($data['captcha']))
            {
                $this->error('验证码错误！');
            }

            //查询数据库
            $data['password'] = md5($data['password'].config('app.salt'));
            $manage = new \app\admin\model\Manage();
            $res = $manage->where('username',$data['username'])
                ->where('password',$data['password'])
                ->find();
            if($res){
                //保存session
                session('admin_id',$res['id']);
                session('admin_name',$res['username']);
                session('admin_pic',$res['pic']);
                $this->success('登录成功！','index/index');
            }else{
                $this->error('用户名或密码错误!');
            }
        }
        return $this->fetch();
    }
}
