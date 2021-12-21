<?php

if ( isset($_POST) && !empty($_POST) && $_POST["mom"] != "" && $_POST["email"] != "" && $_POST["group"] != "" ) {
	include_once(dirname(__FILE__) . "/../config/config.inc.php");

	$mom = $_POST["mom"];
	$email = $_POST["email"];
	$group = $_POST["group"];

	if ( $group == 10 ) {
		$sql = "UPDATE "._DB_PREFIX_."customer
				SET active = 0
				WHERE id_customer = ".$mom."
				AND email = '".$email."'
				AND id_default_group = ".$group;
		Db::getInstance()->execute($sql);
	}
}

echo true;

?>