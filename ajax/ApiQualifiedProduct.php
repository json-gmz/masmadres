<?php

	include_once(dirname(__FILE__) . "/../config/config.inc.php");

	$order = $_POST["id_order"];
    
    $products = Db::getInstance()->executeS('
        SELECT id_product
        FROM '._DB_PREFIX_.'qualification_service
        WHERE id_order = '.$order.'
    ');

echo json_encode($products);

?>