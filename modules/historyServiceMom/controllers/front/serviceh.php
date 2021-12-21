<?php

class historyServiceMomServicehModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        parent::initContent();
        $context = Context::getContext();

        $id_mom = $context->customer->id;
        $service_mom = $context->customer->service;
        $lang_id = $context->language->id;
        $id_group =$context->customer->id_default_group;
        $services = $this->getHistoryService($id_mom);

        $this->context->smarty->assign(
            array(
                "lang_id" => $lang_id,
                'id_group' => $id_group,
                "id_mom" => $id_mom,
                'service_mom' => $service_mom,
                'service' => $services,
            ));

        $this->setTemplate('module:historyServiceMom/views/templates/front/servicesMom.tpl');
    }

    public function getHistoryService($id_mom){

        $orders =  Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('
            SELECT o.*, o.date_add as date_add_order, c.*, p.*, round(p.price) as price, pl.*, od.*, cl.name as name_service 
            FROM ' . _DB_PREFIX_ . 'orders o
            LEFT JOIN '._DB_PREFIX_.'customer c ON(o.id_customer = c.id_customer)
            LEFT JOIN '._DB_PREFIX_.'order_detail od ON(od.id_order = o.id_order)
            LEFT JOIN '._DB_PREFIX_.'product p ON(od.product_id = p.id_product)
            LEFT JOIN '._DB_PREFIX_.'product_lang pl ON(pl.id_product = p.id_product)
            LEFT JOIN '._DB_PREFIX_.'category_lang cl ON(cl.id_category = c.service)
            WHERE o.id_mom LIKE "%' . (int) $id_mom .'%"
            GROUP BY o.`id_order`
            ORDER BY o.`date_add` DESC');
        
        return $orders;

    }
}