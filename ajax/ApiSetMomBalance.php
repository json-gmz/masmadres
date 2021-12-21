<?php

if ( isset($_POST) && !empty($_POST) && $_POST["customer"] != ""  && $_POST["balance"] != "" && $_POST["comment"] != "" && $_POST["type"] != "" ) {
	include_once(dirname(__FILE__) . "/../config/config.inc.php");

	$customer = $_POST["customer"];
	$balance = $_POST["balance"];
	$comment = $_POST["comment"];
	$type = $_POST["type"];

	if ( $type == "up" ) {
		$operation = "+";
	} elseif ( $type == "down" ) {
		$operation = "-";
	}

	$sql_balance = "UPDATE "._DB_PREFIX_."customer
					SET balance = balance ".$operation." ".$balance."
					WHERE id_customer = ".$customer;
	Db::getInstance()->execute($sql_balance);

	$sql_move = "INSERT INTO "._DB_PREFIX_."history_moves_balance (id_order, id_order_detail, id_product, id_mom, type, payment, amount, `show`, date_generate, commets)
				VALUES ('0', '0', '0', '".$customer."', '".$type."', 'admin', '".$balance."', '1', NOW(), '".$comment."')";
	Db::getInstance()->execute($sql_move);
}

echo true;

?>