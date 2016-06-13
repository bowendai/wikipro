<?php
namespace Home\Controller;
use Think\Controller;
use Think\Model;

class IndexController extends Controller {
    public function index(){
        //$this->show('<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} body{ background: #fff; font-family: "微软雅黑"; color: #333;font-size:24px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.8em; font-size: 36px } a,a:hover{color:blue;}</style><div style="padding: 24px 48px;"> <h1>:)</h1><p>欢迎使用 <b>ThinkPHP</b>！</p><br/>版本 V{$Think.version}</div><script type="text/javascript" src="http://ad.topthink.com/Public/static/client.js"></script><thinkad id="ad_55e75dfae343f5a1"></thinkad><script type="text/javascript" src="http://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script>','utf-8');
		
		//$this->assign('name','thinkphp');
		//$this->assign('age','12');
		
		//$index = new \Home\Model\IndexModel();//new Home\Model\index\indexModel();
		//$resules = $index->where('id=1')->select();
		//var_dump($resules[0]);
		//var_dump($resules[0]["age"]);
		
		//$this->assign('person',array('name'=>'dai','age'=>$resules[0]['age']));
		$this->display('main');
    }
	
	public function test(){
		/*$indexModel = new \Home\Model\IndexModel();
		
		$dataList[] = array('name'=>'thin kphp','sex'=>'m' ,'age'=>10);
		$dataList[] = array('name'=>'oneth   ink','sex'=>'fm' ,'age'=>11);
		$indexModel->addAll($dataList);*/
		
		
		$this->display('test');
	}
	public function top(){
      $this->display();
    }
    public function left(){
      $this->display();
    }
    public function right(){
      $this->display();
    }
}