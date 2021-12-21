<?php

	include_once(dirname(__FILE__) . "/../config/config.inc.php");
	$order = $_POST["id_order"];
    
    $status_service = Db::getInstance()->executeS('
        SELECT od.status_service, od.product_id
        FROM '._DB_PREFIX_.'order_detail od
        WHERE od.id_order = '.$order.'
    ');

echo json_encode($status_service);

?>