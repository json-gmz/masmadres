<?php

class Order extends OrderCore
{
	public $id_mom;

	public static $definition = array(
        'table' => 'orders',
        'primary' => 'id_order',
        'fields' => array(
            'id_address_delivery' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
            'id_address_invoice' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
            'id_cart' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
            'id_currency' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
            'id_shop_group' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
            'id_shop' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
            'id_lang' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
            'id_customer' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
            'id_carrier' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
            'current_state' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
            'secure_key' => array('type' => self::TYPE_STRING, 'validate' => 'isMd5'),
            'payment' => array('type' => self::TYPE_STRING, 'validate' => 'isGenericName', 'required' => true),
            'module' => array('type' => self::TYPE_STRING, 'validate' => 'isModuleName', 'required' => true),
            'recyclable' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'gift' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'gift_message' => array('type' => self::TYPE_STRING, 'validate' => 'isMessage'),
            'mobile_theme' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'total_discounts' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice'),
            'total_discounts_tax_incl' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice'),
            'total_discounts_tax_excl' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice'),
            'total_paid' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice', 'required' => true),
            'total_paid_tax_incl' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice'),
            'total_paid_tax_excl' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice'),
            'total_paid_real' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice', 'required' => true),
            'total_products' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice', 'required' => true),
            'total_products_wt' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice', 'required' => true),
            'total_shipping' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice'),
            'total_shipping_tax_incl' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice'),
            'total_shipping_tax_excl' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice'),
            'carrier_tax_rate' => array('type' => self::TYPE_FLOAT, 'validate' => 'isFloat'),
            'total_wrapping' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice'),
            'total_wrapping_tax_incl' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice'),
            'total_wrapping_tax_excl' => array('type' => self::TYPE_FLOAT, 'validate' => 'isPrice'),
            'round_mode' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
            'round_type' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
            'shipping_number' => array('type' => self::TYPE_STRING, 'validate' => 'isTrackingNumber'),
            'conversion_rate' => array('type' => self::TYPE_FLOAT, 'validate' => 'isFloat', 'required' => true),
            'invoice_number' => array('type' => self::TYPE_INT),
            'delivery_number' => array('type' => self::TYPE_INT),
            'invoice_date' => array('type' => self::TYPE_DATE),
            'delivery_date' => array('type' => self::TYPE_DATE),
            'valid' => array('type' => self::TYPE_BOOL),
            'reference' => array('type' => self::TYPE_STRING),
            'date_add' => array('type' => self::TYPE_DATE, 'validate' => 'isDate'),
            'date_upd' => array('type' => self::TYPE_DATE, 'validate' => 'isDate'),
            'id_mom' => array('type' => self::TYPE_STRING),
        ),
    );

	public function getProductsDetail()
	{
		return Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('
		SELECT od.*, p.*, ps.*, cl.name AS category_name, ss.name AS status_service_name
		FROM `' . _DB_PREFIX_ . 'order_detail` od
		LEFT JOIN `' . _DB_PREFIX_ . 'product` p ON (p.id_product = od.product_id)
		LEFT JOIN `' . _DB_PREFIX_ . 'product_shop` ps ON (ps.id_product = p.id_product AND ps.id_shop = od.id_shop)
		LEFT JOIN `' . _DB_PREFIX_ . 'category_lang` cl ON (cl.id_category = p.id_category_default AND cl.id_lang = 1)
		LEFT JOIN `' . _DB_PREFIX_ . 'status_service` ss ON (ss.id_status_service = od.status_service)
		WHERE od.`id_order` = ' . (int) $this->id);
	}

	public function getMomsServices()
	{
		$momsServices = array();

		$servicesAssigned = "0";

		if ( $this->id_mom != "" && $this->id_mom != 0 ) {
			$servicesAssigned = Db::getInstance()->getValue('
				SELECT GROUP_CONCAT(c.service) AS servicesAssigned
				FROM ' . _DB_PREFIX_ . 'customer c
				INNER JOIN ' . _DB_PREFIX_ . 'category_lang cl ON (c.service = cl.id_category AND cl.id_lang = 1)
				WHERE c.id_customer IN (' . $this->id_mom . ')
			');
		}
		
		$servicesPending = Db::getInstance()->getValue('
			SELECT GROUP_CONCAT(p.id_category_default) AS servicesPending
			FROM ' . _DB_PREFIX_ . 'orders o
			INNER JOIN ' . _DB_PREFIX_ . 'order_detail od ON (o.id_order = od.id_order)
			INNER JOIN ' . _DB_PREFIX_ . 'product p ON (od.product_id = p.id_product)
			INNER JOIN ' . _DB_PREFIX_ . 'category_lang cl ON (p.id_category_default = cl.id_category AND cl.id_lang = 1)
			WHERE o.id_order = ' . $this->id . '
			AND p.id_category_default NOT IN (' . $servicesAssigned . ')
		');

		if ( $servicesPending == "" ) {
			$servicesPending = "0";
		}

		$sql = '
			SELECT
				c.id_customer, CONCAT(c.firstname," ",c.lastname) name, c.email, c.product_service,
				CONCAT(a.address1,", ",a.address2,", ",a.city) AS address, a.phone, a.stratum,
				c.service, cl.name nameservice, "0" AS selected
			FROM ' . _DB_PREFIX_ . 'customer c
			INNER JOIN ' . _DB_PREFIX_ . 'address a ON (c.id_customer = a.id_customer)
			INNER JOIN ' . _DB_PREFIX_ . 'category_lang cl ON (c.service = cl.id_category AND cl.id_lang = 1)
			WHERE c.service IN (' . $servicesPending . ')
			AND c.active_service = 1
			AND c.active = 1
		';

		if ( $this->id_mom != "" && $this->id_mom != 0 ) {
			$sql .= '
				UNION

				SELECT
					c.id_customer, CONCAT(c.firstname," ",c.lastname) name, c.email, c.product_service,
					CONCAT(a.address1,", ",a.address2,", ",a.city) AS address, a.phone, a.stratum,
					c.service, cl.name nameservice, "1" AS selected
				FROM ' . _DB_PREFIX_ . 'customer c
				INNER JOIN ' . _DB_PREFIX_ . 'address a ON (c.id_customer = a.id_customer)
				INNER JOIN ' . _DB_PREFIX_ . 'category_lang cl ON (c.service = cl.id_category AND cl.id_lang = 1)
				WHERE c.id_customer IN (' . $this->id_mom . ')
			';
		}

		$sql .= ' ORDER BY nameservice ASC';
		
		$momsServices = Db::getInstance()->executeS($sql);

		foreach ($momsServices as $key => $momService) {
			$sqlprods = "SELECT GROUP_CONCAT(DISTINCT pl.name SEPARATOR ',<br>') AS product_service
						FROM " . _DB_PREFIX_ . "product p
						INNER JOIN " . _DB_PREFIX_ . "product_lang pl ON (p.id_product = pl.id_product AND pl.id_lang = 1)
						WHERE p.id_product IN (" . $momService["product_service"] . ")";

			$momsServices[$key]["product_service"] = Db::getInstance()->getValue($sqlprods);
		}
		

		return $momsServices;
	}

	public function getQualificationService(){

		$qualifiedServices = Db::getInstance()->executeS('
			SELECT 
				qs.*, pl.name as product_name
			FROM ' . _DB_PREFIX_ . 'qualification_service qs
			INNER JOIN ' . _DB_PREFIX_ . 'product_lang pl ON (qs.id_product = pl.id_product)
			WHERE qs.id_order = ' . $this->id . '
			ORDER BY qs.id_order DESC

		');

		return $qualifiedServices;
	}

	public static function getOrdersByReference($reference) {
		$ordersByReference = Db::getInstance()->executeS('
			SELECT id_order
			FROM ' . _DB_PREFIX_ . 'orders
			WHERE reference = "' . $reference . '"
		');

		return $ordersByReference;
	}
}
