<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
//api数据返回
function show($code,$msg,$data = [],$httpCode = 200)
{
    $data = [
        'code' => $code,
        'msg' => $msg,
        'data' => $data
    ];
    return json($data,$httpCode);
}


//定义状态按钮
function status($data)
{
    if ($data == 1){
        echo "<a class='btn btn-success btn-sm shiny'>正常</a>";
    }elseif ($data == 2){
        echo "<a class='btn btn-danger btn-sm shiny'>停用</a>";
    }
}

//验证码验证
function captcha_chk($value)
{
    $captcha = new \think\captcha\Captcha();
    if( $captcha->check($value))
    {
        return true;
    }
}

//导出EXCEL
function out_xls($data,$filename='simple',$type = 'Excel5'){
    ini_set('max_execution_time', '0');
    $sheetname = $filename;
    $filename=$filename.'.xls';
    $phpexcel = new \PHPExcel();
    $phpexcel->getProperties()
        ->setCreator("Maarten Balliauw")
        ->setLastModifiedBy("Maarten Balliauw")
        ->setTitle("Office 2007 XLSX Test Document")
        ->setSubject("Office 2007 XLSX Test Document")
        ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
        ->setKeywords("office 2007 openxml php")
        ->setCategory("Test result file");

    $phpexcel->getActiveSheet()->fromArray($data);
    $phpexcel->getActiveSheet()->setTitle($sheetname);
    $phpexcel->setActiveSheetIndex(0);

    header('Content-Type: application/vnd.ms-excel');
    header("Content-Disposition: attachment;filename=$filename");
    header('Cache-Control: max-age=0');
    header('Cache-Control: max-age=1');
    header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
    header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
    header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
    header ('Pragma: public'); // HTTP/1.0

    $objwriter = \PHPExcel_IOFactory::createWriter($phpexcel, $type);
    $objwriter->save('php://output');

    exit;
}