<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/11 0011
 * Time: 9:03
 */
namespace app\admin\controller;

use think\Controller;

class Base extends Controller
{
    protected function initialize()
    {
        if(!session('admin_name') || !session('admin_id')){
            $this->error('请先登录！','login/login');
        }
        //权限验证
        //$this->auth();
    }

    protected function auth()
    {
        $auth = new \zhenhaihou\Auth();
        $rule = request()->module().'/'.request()->controller().'/'.request()->action();
        $res = $auth->check($rule,session('admin_id'));
        if(!$res){
            $this->error('您无权进行此操作！');
        }
    }
}