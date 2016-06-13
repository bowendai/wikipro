<?php	
namespace Home\Model;
use Think\Model;

class AutoDesignModel extends Model {
	
	protected $tableName = 'Topic';//含有表前缀
	//protected $trueTableName = 'Users';//不含表前缀
			
	public function isExistDir($dir) {

		if (is_dir($dir)) {
			return true;
		}
		
		return false;
	}
	
	public function dir_is_empty($dir) { 
		if ($handle = opendir($dir)) {  
			while($item = readdir($handle)) {   
				if ($item != '.' && $item != '..')
					return false;   
			} 
		} 
		
		return true;
	}
	
	public function getFilenames($dir) {
		if ($this->isExistDir($dir) && (!$this->dir_is_empty($dir))) {
			
			//$filenames = scandir($dir);
			$filenames = array_diff(scandir($dir),array('..','.'));
			$filenames = array_values($filenames);
			
			return $filenames;
		}
		
		return [];
	}
	
	public function getFileinfo($filenames,$dir) {
	
		for($i = 0; $i < count($filenames); $i++) {
			$path = $dir."/".$filenames[$i];
			
			$create_time = filectime($path);
			
			$fileinfos[$i]["create_time"] = date("Y-m-d H:i:s",$create_time);
			$fileinfos[$i]["content"] = file_get_contents($path);
			$fileinfos[$i]["title"] = urldecode( str_replace(".txt","",$filenames[$i]));
		}
		
		return $fileinfos;
	}
	
	public function getDetailFileinfo($filename,$dir){
		$path = $dir."/".$filename;
		$create_time = filectime($path);
		$detail["create_time"] = date("Y-m-d H:i:s",$create_time);
		$detail["content"] = file_get_contents($path);
		$detail["title"] = urldecode( str_replace(".txt","",$filename));
		
		return $detail;
	}
	
	/**
	 * Sanitize the action command
	 *
	 * @author Andreas Gohr <andi@splitbrain.org>
	 *
	 * @param array|string $act
	 * @return string
	 */
	public static function act_clean($act){
		// check if the action was given as array key
		if(is_array($act)){
			list($act) = array_keys($act);
		}

		//remove all bad chars
		$act = strtolower($act);
		$act = preg_replace('/[^1-9a-z_]+/','',$act);

		if($act == 'export_html') $act = 'export_xhtml';
		if($act == 'export_htmlbody') $act = 'export_xhtmlbody';

		if($act === '') $act = 'show';
		return $act;
	}
}