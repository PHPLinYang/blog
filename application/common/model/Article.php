<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10 0010
 * Time: 12:16
 */
namespace app\common\model;

use think\Model;

class Article extends Model
{
    //模型里面自动写入时间戳
    //protected $autoWriteTimestamp = true;

    public function add($data)
    {
        //写入数据库
        $res = $this->save($data);
        if($res){
            return true;
        }else{
            return false;
        }
    }

    public function getKeywords($data)
    {
        $data = trim($data);
        $data = strtolower($data);
        return $this->where('title','like','%'.$data.'%')
            ->whereOr('tags','like','%'.$data.'%')
            ->all();
    }

}