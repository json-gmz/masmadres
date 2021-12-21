<?php

if ( isset($_POST) && !empty($_POST) && $_POST["id_customer"] != "" ) {
	include_once(dirname(__FILE__) . "/../config/config.inc.php");

	$customer = $_POST["id_customer"];

	$sql = "SELECT active_service
		FROM "._DB_PREFIX_."customer
		WHERE id_customer = ".$customer;
		$row = Db::getInstance()->getRow($sql);
		$active_service = $row["active_service"];

}
echo $active_service;

?>