<?php

if ( isset($_POST) && !empty($_POST) && $_POST["order"] != "" && $_POST["service"] != "" && $_POST["mom"] != "" ) {
    include_once(dirname(__FILE__) . "/../config/config.inc.php");

    $order = $_POST["order"];
    $service = $_POST["service"];
    $mom = $_POST["mom"];

    $ids_order_detail = Db::getInstance()->getValue('
        SELECT GROUP_CONCAT(od.id_order_detail) ids_order_detail
        FROM '._DB_PREFIX_.'order_detail od
        INNER JOIN '._DB_PREFIX_.'product p ON (od.product_id = p.id_product)
        WHERE od.id_order = '.$order.'
        AND p.id_category_default = '.$service.'
    ');


    $sql = "UPDATE "._DB_PREFIX_."order_detail
            SET status_service = 7
            WHERE id_order_detail IN (".$ids_order_detail.")";
    Db::getInstance()->execute($sql);


    $payment_method = Db::getInstance()->getValue('
        SELECT op.payment_method
        FROM '._DB_PREFIX_.'orders o
        INNER JOIN '._DB_PREFIX_.'order_payment op ON o.reference = op.order_reference
        WHERE o.id_order = '.$order
    );


    $details = Db::getInstance()->executeS(
        "SELECT od.id_order_detail, od.product_id, od.total_price_tax_excl, od.total_price_tax_incl
        FROM "._DB_PREFIX_."order_detail od
        WHERE od.id_order_detail IN (".$ids_order_detail.")"
    );
    foreach ($details as $key => $detail) {
        switch ($payment_method) {
            case 'Pago contra reembolso':
                $type = "down";
                $amount = $detail["total_price_tax_incl"] - $detail["total_price_tax_excl"];
                break;

            case 'Mercado Pago':
                $type = "up";
                $amount = $detail["total_price_tax_excl"];
                break;   
        }

        if ( $type == "up" ) {
            $operation = "+";
        } elseif ( $type == "down" ) {
            $operation = "-";
        }

        $sql_balance = "UPDATE "._DB_PREFIX_."customer
                        SET balance = balance ".$operation." ".$amount."
                        WHERE id_customer = ".$mom;
        Db::getInstance()->execute($sql_balance);

        $sql_move = "INSERT INTO "._DB_PREFIX_."history_moves_balance (id_order, id_order_detail, id_product, id_mom, type, payment, amount, `show`, date_generate, commets)
                    VALUES ('".$order."', '".$detail["id_order_detail"]."', '".$detail["product_id"]."', '".$mom."', '".$type."', '".$payment_method."', '".$amount."', '1', NOW(), 'Servicio')";
        Db::getInstance()->execute($sql_move);
    }    
}

echo true;

?>