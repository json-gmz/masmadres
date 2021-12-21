<?php

if ( isset($_POST) && !empty($_POST) && $_POST["id_product"] != "" && $_POST["id_order"] != "" && $_POST["selectOption"] != "") {
	include_once(dirname(__FILE__) . "/../config/config.inc.php");


	$id_product = $_POST["id_product"];
	$order = $_POST["id_order"];
    $comments = $_POST["comments"];
    $selectOption =  $_POST["selectOption"];
	

    $id_order_detail = Db::getInstance()->getValue('
        SELECT id_order_detail
        FROM '._DB_PREFIX_.'order_detail
        WHERE id_order = '.$order.' AND product_id = '.$id_product.'
    ');

    $sql = "INSERT INTO "._DB_PREFIX_."qualification_service (id_order, id_order_detail, id_product, date_add, qualification, description)
            VALUES (".$order.", ".$id_order_detail.", ".$id_product.", NOW(), ".$selectOption.",'".$comments."')";
    Db::getInstance()->execute($sql);
}

echo true;

?>