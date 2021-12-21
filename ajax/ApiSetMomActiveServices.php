<?php

if ( isset($_POST) && !empty($_POST) && $_POST["customer"] != "" ) {
	include_once(dirname(__FILE__) . "/../config/config.inc.php");

	$customer = $_POST["customer"];

	$sql = "UPDATE "._DB_PREFIX_."customer
			SET active = 1
			WHERE id_customer = ".$customer;
	Db::getInstance()->execute($sql);
}

echo true;

?>