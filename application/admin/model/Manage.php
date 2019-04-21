<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/11 0011
 * Time: 10:07
 */
namespace app\admin\model;

use think\Model;

class Manage extends Model
{
    public function add($data)
    {
        //自动写入时间戳

        //验证数据
        $validate = validate('Manage');
        if(!$validate->check($data)){
            return['code' => 0,'msg' => $validate->getError()];
        }
        $data['password'] = md5($data['password'].config('app.salt'));
        //新增数据库
        $res = $this->save($data);
        if($res){
            return['code' => 1,'msg' => '新增成功！'];
        }else{
            return['code' => 0,'msg' => '新增失败！'];
        }
    }
}