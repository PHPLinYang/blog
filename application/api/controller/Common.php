<?php
namespace app\api\controller;

use think\Controller;

class Common extends Controller
{
    public function initialize()
    {
        //加密sign
        //$this->setSign();

        $this->checkRequestAuth();
    }

    protected function checkRequestAuth()
    {
        //获取header头信息
        $headers = request()->header();
        //校验数据


    }

    //设置sign
    public function setSign()
    {
        $data = [
            'version' => 'v1',
            'did' => '5252MEI123'
        ];
        //安字段排序
        ksort($data);
        //&拼接字符串
        $string = http_build_query($data);
        //加密 a564ebbfea05b54b4cdadef11f4be106
        $string = md5($string);

        return $string;
    }
}