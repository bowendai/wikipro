<?php
namespace Home\Controller;
use Think\Controller;
use Think\Model;

/**
 * 业界动态控制器
 */
 
class NewsController extends Controller {
    
	
	public function index(){
		$this->display('index');
	}
	
}