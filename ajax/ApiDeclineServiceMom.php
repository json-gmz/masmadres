<?php

if ( isset($_POST) && !empty($_POST) && $_POST["order"] != "" && $_POST["mom"] != "" && $_POST["service"] != "" ) {
    include_once(dirname(__FILE__) . "/../config/config.inc.php");

    $order = $_POST["order"];
    $mom = $_POST["mom"];
    $service = $_POST["service"];
    
    $momsAssigned = Db::getInstance()->getValue('
        SELECT id_mom
        FROM mm_orders
        WHERE id_order = '.$order.'
    ');
    $momsList = explode(",", $momsAssigned);

    $pos = array_search($mom, $momsList);
    unset($momsList[$pos]);

    $momsAssigned = implode(',', $momsList);
    if ( $momsAssigned == "" ) {
        $momsAssigned = 0;
    }

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
            SET status_service = 2
            WHERE id_order_detail IN (".$ids_order_detail.")";
    Db::getInstance()->execute($sql);

}

echo true;

?>