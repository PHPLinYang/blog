<?php
namespace app\common\lib;

use think\exception\Handle;

class ApiHandelException extends Handle
{
    public $httpCode = 500;

    public function render(\Exception $e)
    {
        //如果调试模式开启，使用父类方法
        if(config('app_debug') == true){
            return parent::render($e);
        }
//        if ($e instanceof ApiException) {
//            $this->httpCode = $e->httpCode;
//        }
        return show(config('api.error'),$e->getMessage(),[],$this->httpCode);
    }
}