<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/7 0007
 * Time: 15:52
 */
namespace app\index\controller;

use think\Controller;

class Layim extends Controller
{
    public function index()
    {
        return $this->fetch();
    }


}