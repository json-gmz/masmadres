<?php

if ( isset($_POST) && !empty($_POST) && $_POST["file"] != "" ) {
	include_once(dirname(__FILE__) . "/../config/config.inc.php");

	$file_path = _PS_ROOT_DIR_.$_POST["file"];
	unlink($file_path);
}

echo true;

?>