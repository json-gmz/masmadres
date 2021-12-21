<?php

if ( isset($_POST) && !empty($_POST) && $_POST["mom"] != "" && $_POST["order"] != "" && $_POST["service"] != "" ) {
	include_once(dirname(__FILE__) . "/../config/config.inc.php");

	$response = false;

	$mom = $_POST["mom"];
	$service = $_POST["service"];
	$order = $_POST["order"];

	$momActiveService = Db::getInstance()->getValue('
		SELECT active_service
		FROM '._DB_PREFIX_.'customer
		WHERE id_customer = '.$mom.'
	');

	if ( $momActiveService == 1 ) {
		$momsAssigned = Db::getInstance()->getValue('
			SELECT id_mom
			FROM '._DB_PREFIX_.'orders
			WHERE id_order = '.$order.'
		');

		$momsList = explode(",", $momsAssigned);
		if ( $momsList[0] == "" || $momsList[0] == 0 ) {
			unset($momsList[0]);
		}

		$momsList[] = $mom;
		$momsAssigned = implode(',', $momsList);

		$sql = "UPDATE "._DB_PREFIX_."orders
				SET id_mom = '".$momsAssigned."'
				WHERE id_order = ".$order;
		Db::getInstance()->execute($sql);

		$ids_order_detail = Db::getInstance()->getValue('
			SELECT GROUP_CONCAT(od.id_order_detail) ids_order_detail
			FROM '._DB_PREFIX_.'order_detail od
			INNER JOIN '._DB_PREFIX_.'product p ON (od.product_id = p.id_product)
			WHERE od.id_order = '.$order.'
			AND p.id_category_default = '.$service.'
		');

		$sql = "UPDATE "._DB_PREFIX_."order_detail
				SET status_service = 3
				WHERE id_order_detail IN (".$ids_order_detail.")";
		Db::getInstance()->execute($sql);

		$response = true;
	}

}

echo $response;

?>