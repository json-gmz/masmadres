<?php

if ( isset($_POST) && !empty($_POST) && $_POST["id_order"] != "" && $_POST["service_mom"] != "" ) {
    include_once(dirname(__FILE__) . "/../config/config.inc.php");

    $id_order = $_POST["id_order"];
    $service_mom = $_POST["service_mom"];

    $orders =  Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('
        SELECT
            o.id_order,
            o.reference,
            o.id_address_delivery,
            ROUND(o.total_products_wt) as total_products,
            o.date_add,
            c.id_customer,
            c.dni,
            c.email,
            CONCAT(c.firstname," ",c.lastname) as customer_name,
            CONCAT(a.address1,", ",a.address2) as address,
            a.city,
            a.phone,
            a.stratum,
            os.id_order_state,
            os.`name` as name_state,
            od.product_name,
            od.product_quantity,
            ROUND(od.product_price) as product_price,
            od.status_service,
            cl.name as name_service,
            od.id_order_detail,
            od.product_id,
            ROUND(od.total_price_tax_excl) as total_price_tax_excl,
            ROUND(od.total_price_tax_incl) as total_price_tax_incl,
            op.payment_method
        FROM mm_orders o
        LEFT JOIN mm_order_state_lang os ON(o.current_state = os.id_order_state AND os.id_lang = 1)
        LEFT JOIN mm_customer c ON(o.id_customer = c.id_customer)
        LEFT JOIN mm_address a ON(o.id_address_delivery = a.id_address)
        LEFT JOIN mm_order_detail od ON(o.id_order = od.id_order)
        LEFT JOIN mm_product p ON(od.product_id = p.id_product)
        LEFT JOIN mm_category_lang cl ON(p.id_category_default = cl.id_category AND cl.id_lang = 1)
        LEFT JOIN mm_order_payment op ON o.reference = op.order_reference
        WHERE o.id_order = '.(int) $id_order.'
        AND p.id_category_default = '.(int) $service_mom.'
        ORDER BY o.date_add DESC');

}

echo json_encode($orders);

?>