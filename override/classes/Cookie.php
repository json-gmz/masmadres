<?php

/***
 * Class CustomerCore
 */
class Cookie extends CookieCore
{
    public function mylogout()
    {
        $this->desactiveService($this->_content['id_customer']);
        $this->removeProducts($this->_content['id_customer']);

        unset(
            $this->_content['id_customer'],
            $this->_content['id_guest'],
            $this->_content['is_guest'],
            $this->_content['id_connections'],
            $this->_content['customer_lastname'],
            $this->_content['customer_firstname'],
            $this->_content['passwd'],
            $this->_content['logged'],
            $this->_content['email'],
            $this->_content['id_cart'],
            $this->_content['id_address_invoice'],
            $this->_content['id_address_delivery']
        );
        $this->_modified = true;
    }

    public function desactiveService($id_mom){

        $sql = "UPDATE "._DB_PREFIX_."customer
			SET active_service = 0
			WHERE id_customer = ".$id_mom;
        Db::getInstance()->execute($sql);

    }

    public function removeProducts($id_mom){

        $orders = Db::getInstance()->executeS('
            SELECT o.id_order
            FROM '._DB_PREFIX_.'orders o
            INNER JOIN '._DB_PREFIX_.'order_detail od ON (o.id_order = od.id_order)
            WHERE o.id_mom LIKE "%' . (int) $id_mom .'%" AND od.status_service = 3 
            GROUP BY o.id_order
        ');

        foreach($orders as $order){

            $momsAssigned = Db::getInstance()->getValue('
                SELECT id_mom
                FROM mm_orders
                WHERE id_order = '.$order['id_order'].'
            ');
            $momsList = explode(",", $momsAssigned);

            $pos = array_search($id_mom, $momsList);
            unset($momsList[$pos]);

            $momsAssigned = implode(',', $momsList);
            if ( $momsAssigned == "" ) {
                $momsAssigned = 0;
            }
            $sql = "UPDATE "._DB_PREFIX_."orders
                SET id_mom = '".$momsAssigned."'
                WHERE id_order = ".$order['id_order'];
            Db::getInstance()->execute($sql);
        }
    }
}