<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10 0010
 * Time: 10:27
 */
namespace app\admin\controller;

use app\admin\controller\Base;

class Index extends Base
{
    public function index()
    {

        return $this->fetch();
    }

    public function logout()
    {
        //清除session
        session(null);
        $this->success('退出成功！','login/login');
    }
}
