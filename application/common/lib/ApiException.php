<?php
namespace app\common\lib;

use think\Exception;

class ApiException extends Exception
{
    protected $msg = '';
    protected $httpCode = 500;
    protected $code = 0;
    public function __construct($msg = '',$httpCode = 0,$code = 0){
        $this->httpCode = $httpCode;
        $this->msg = $msg;
        $this->code = $code;
    }
}