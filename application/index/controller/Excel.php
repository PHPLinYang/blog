<?php
namespace app\index\controller;

use think\Controller;
use PHPExcel;
use PHPExcel_IOFactory;
use Think\Db;


class Excel extends Controller
{
    public function index()
    {
        if(request()->isPost()){
            $this->inputAdmins();
        }

        //获取表数据
        $excels = Db::name('excel')
            ->field('id,username,age,sex,phone,email')
            ->order('id desc')
            ->select();

        $this->assign('excels',$excels);
        return $this->fetch();
    }



    //Excel导入功能
    public function inputAdmins()
    {
        //接受文件
        $inputdata = $_FILES;

        //实例化类库
        $objExcel = new PHPExcel();
        $objReader = PHPExcel_IOFactory::createReader('Excel5');

        //获取并处理数据
        $objData = $objReader->load($inputdata['excel']['tmp_name'],$encode = 'utf-8');
        $excel_array = $objData->getSheet(0)->toArray();
        unset($excel_array[0]);
        $num = 0;
        $insertData = [];
        foreach ($excel_array as $key => $value){
            //下标从0开始
            $insertData[$num]['username'] = $value[1];
            $insertData[$num]['age'] = $value[2];
            $insertData[$num]['sex'] = $value[3];
            $insertData[$num]['phone'] = $value[4];
            $insertData[$num]['email'] = $value[5];
            $num++;
        }

        //添加数据，插入数据库
        $res = Db::name('excel')
            ->field('id,username,age,sex,phone,email')
            ->insertAll($insertData);
        if($res){
            $this->success('导入成功');
        }else{
            $this->error('导入失败');
        }

    }

    //导出数据为Excel
    public function outexcel($filename = '01')
    {
        //实例化PHPExcel类，类似于在桌面上新建一个Excel表格
        $objPHPExcel = new PHPExcel();

        // Set document properties
        $objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
            ->setLastModifiedBy("Maarten Balliauw")
            ->setTitle("AAA")
            ->setSubject("Office 2007 XLSX Test Document")
            ->setDescription("Test document for Office 2003 XLS, generated using PHP classes.")
            ->setKeywords("office 2007 openxml php")
            ->setCategory("Test result file");
        //循环想要创建多少sheet
        for ($i = 1;$i <= 3;$i++){
            //创建相应sheet，默认创建一个sheet
            if($i > 1){
                $objPHPExcel -> createSheet();
            }
            //把新创建的sheet设定为当前活动sheet,0开始
            $objPHPExcel->setActiveSheetIndex($i-1);
            //获取当前活动sheet
            $objSheet = $objPHPExcel->getActiveSheet();
            //设置sheet名称
            $objSheet->setTitle($i.'年级');

            //获取数据填充到Excel
            $data = Db::name('grade')->where('class',$i)->select();
            $objSheet->setCellValue('A1','姓名')->setCellValue('B1','分数');
            $j = 2;
            foreach ($data as $k=>$v) {
                $objSheet->setCellValue('A'.$j,$v['username'])->setCellValue('B'.$j,$v['score']);
                $j++;
            }
        }

        //设置默认打开那个sheet
        $objPHPExcel->setActiveSheetIndex(0);


        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');//告诉浏览器输出07Excel文件
        //header('Content-Type:application/vnd.ms-excel');//告诉浏览器将要输出Excel03版本文件
        header('Content-Disposition: attachment;filename="'.$filename.'.xlsx"');//告诉浏览器输出浏览器名称
        header('Cache-Control: max-age=0');//禁止缓存

        //按照指定格式生成Excel文件
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        $objWriter->save('php://output');
        exit;
    }
}