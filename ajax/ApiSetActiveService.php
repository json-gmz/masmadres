<?php

if ( isset($_POST) && !empty($_POST) && $_POST["active_service"] != "" ) {
	include_once(dirname(__FILE__) . "/../config/config.inc.php");

	$active_service = $_POST["active_service"];
	$customer = $_POST["id_customer"];

	$sql = "UPDATE "._DB_PREFIX_."customer
				SET active_service = ".$active_service."
				WHERE id_customer = ".$customer;
		Db::getInstance()->execute($sql);
}

echo true;

?>