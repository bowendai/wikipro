<?php
namespace Home\Controller;
use Think\Controller;
class ExcelController extends Controller{
  public function import(){
    $this->display();
  }
  public function upload(){
    $upload=new \Think\Upload();                                //实例化上传类
    $upload->maxSize   =     3145728;                           //设置附件上传大小
    $upload->exts      =     array('xlsx','xls');               //设置附件上传类型
    $upload->rootPath  =      './Uploads/';                     //设置附件上传根目录(没有则需手动新建)
    $upload->savePath  =      '';                               //设置附件上传（子）目录
                                                     //上传文件
    $info = $upload->upload();
    if(!$info){                                                 //上传错误提示错误信息
        $this->error($upload->getError());

    }else{                                                      //上传成功获取上传文件信息
      foreach($info as $file){
            //echo $file['savepath'].$file['savename'];
            //这里的路径为网站根目录下Uploads/2016-02-19/56c7056f732ff.xlsx
            $filePath="Uploads/".$file['savepath'].$file['savename'];
            //等价于
            //$filePath = __ROOT__."Uploads/" .$file['savepath'].$file['savename'];
        }
        echo "<h3>".$filePath."文件上传成功！</h3><p>";
        //上传成功则开始导入到mysql中
        $result=$this->importExcel($filePath);
        echo $result['message'];
    }
  }
  public function importExcel($file){
    if(!file_exists($file)){
        return array("error"=>0,'message'=>'file not found!');
    }
    vendor("PHPExcel.Classes.PHPExcel.IOFactory");
    //出现：Class 'Admin\Controller\PHPExcel_IOFactory' not found
    //注意这儿加了一个"\"表示调用公共空间，也可以理解为顶层
    //$objReader = \PHPExcel_IOFactory::createReader('Excel5');
    //获取excel文件:获取Excel第1张表即（Sheet1）
    $objPHPExcel= \PHPExcel_IOFactory::load($file);
    $objPHPExcel->setActiveSheetIndex(0);
    $sheet1=$objPHPExcel->getSheet(0);
    //获取行数，并把数据读取出来$data数组
    $rowCount=$sheet1->getHighestRow();//excel行数
    $data=array();

    for($i=2;$i<=$rowCount;$i++){
        //$item['id']=$sheet1->getCellByColumnAndRow(0,$i)->getValue();
        $item['name']=$sheet1->getCellByColumnAndRow(0,$i)->getValue();
        $item['age']=$sheet1->getCellByColumnAndRow(1,$i)->getValue();
        $item['sex']=$sheet1->getCellByColumnAndRow(2,$i)->getValue();
        $data[]=$item;
    }
    $success=0;
    $error=0;
    $sum=count($data);

    foreach($data as $k=>$v){

        if(M('user')->data($v)->add()){
            $success++;

        }else{
            $error++;
        }
    }
    echo "<h3>总{$sum}条，成功{$success}条，失败{$error}条</h3>";
    return array("error"=>0,'message'=>'import is succussful!');
  }
  public function export(){
    $this->display();
  }
  public function download(){
    $user=D("User");
    $list=$user->select();
    Vendor("Classes.PHPExcel");
    Vendor("Classes.PHPExcel.IOFactory");
    Vendor("Classes.PHPExcel.Reader.Excel5");
    vendor("PHPExcel.Classes.PHPExcel.IOFactory");
    $objPhpExcel=new \PHPExcel();
    $objPhpExcel->getActiveSheet()->getDefaultColumnDimension()->setAutoSize(true);//设置单元格宽度

    $rowVal = array(0=>'姓名',1=>'年龄', 2=>'性别');
    //$rowVal = array(0=>'姓名',1=>'年龄', 2=>'性别', 3=>'年龄', 4=>'所属部门',5=>'职位', 6=>'邮箱', 7=>'办公电话', 8=>'移动电话',
      //9=>'住址');
    foreach ($rowVal as $k=>$r){
      $objPhpExcel->getActiveSheet()->getStyleByColumnAndRow($k,1)
                  ->getFont()->setBold(true);//字体加粗
      $objPhpExcel->getActiveSheet()->getStyleByColumnAndRow($k,1)
                  ->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);//文字居中
      $objPhpExcel->getActiveSheet()->setCellValueByColumnAndRow($k,1,$r);
    }
    //设置当前的sheet索引 用于后续内容操作
    $objPhpExcel->setActiveSheetIndex(0);
    $objActSheet=$objPhpExcel->getActiveSheet();
    //设置当前活动的sheet的名称
    $title="user";
    $objActSheet->setTitle($title);
    //单元格内容
    foreach($list as $k => $v){
      $num=$k+2;
      $objPhpExcel->setActiveSheetIndex(0)
                  ->setCellValue('A'.$num, $v['name'])
                  ->setCellValue('B'.$num, $v['age'])
                  ->setCellValue('C'.$num, $v['sex']);
                }
     $name=date('Y-m-d');//设置文件名
     header("Content-Type: application/force-download");
     header("Content-Type: application/octet-stream");
     header("Content-Type: application/download");
     header("Content-Transfer-Encoding:utf-8");
     header("Pragma: no-cache");
     header('Content-Type: application/vnd.ms-excel');
     header('Content-Disposition: attachment;filename="'.$title.'_'.urlencode($name).'.xls"');
     header('Cache-Control: max-age=0');
     $objWriter = \PHPExcel_IOFactory::createWriter($objPhpExcel, 'Excel5');
     $objWriter->save('php://output');
     $this->display();
   }
}
