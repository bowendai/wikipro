<?php
/**
 * This is an example of how a local.php could look like.
 * Simply copy the options you want to change from dokuwiki.php
 * to this file and change them.
 *
 * When using the installer, a correct local.php file be generated for
 * you automatically.
 */


$conf['title']       = 'My Wiki';        //what to show in the title

$conf['useacl']      = 1;                //Use Access Control Lists to restrict access?
$conf['superuser']   = 'admin';
//$conf['authtype'] = 'authplain';
$conf['authtype'] = 'authmysql';
$conf['lang'] = 'zh';                    //wiki的界面语言。默认为“en”，中文请改为“zh”。
$conf['youarehere'] = 0;                 //显示you are here导航。0－不显示，1－显示。
$conf['defaultgroup'] = 'user';          //默认用户组。
$conf['htmlok'] = 1;                     //是否支持html标记。0－不支持，1－支持。
$conf['phpok'] = 0;                      //是否支持php脚本。0－不支持，1－支持。
$conf['openregister'] = '0';             //是否允许用户注册。0－不允许，1允许。

require_once ("mysql.conf.php");