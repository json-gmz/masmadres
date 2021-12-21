<?php

/***
 * Class CustomerCore
 */
class Customer extends CustomerCore
{
    /** @var string DNI */
    public $dni;

    /** @var string typedni */
    public $typedni;

    /** @var int service */
    public $service;

    /** @var int balance */
    public $balance;

    /**
     * @see ObjectModel::$definition
     */
    public static $definition = array(
        'table' => 'customer',
        'primary' => 'id_customer',
        'fields' => array(
            'secure_key' => array('type' => self::TYPE_STRING, 'validate' => 'isMd5', 'copy_post' => false),
            'lastname' => array('type' => self::TYPE_STRING, 'validate' => 'isCustomerName', 'required' => true, 'size' => 255),
            'firstname' => array('type' => self::TYPE_STRING, 'validate' => 'isCustomerName', 'required' => true, 'size' => 255),
            'email' => array('type' => self::TYPE_STRING, 'validate' => 'isEmail', 'required' => true, 'size' => 255),
            'passwd' => array('type' => self::TYPE_STRING, 'validate' => 'isPasswd', 'required' => true, 'size' => 255),
            'last_passwd_gen' => array('type' => self::TYPE_STRING, 'copy_post' => false),
            'id_gender' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
            'birthday' => array('type' => self::TYPE_DATE, 'validate' => 'isBirthDate'),
            'newsletter' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'newsletter_date_add' => array('type' => self::TYPE_DATE, 'copy_post' => false),
            'ip_registration_newsletter' => array('type' => self::TYPE_STRING, 'copy_post' => false),
            'optin' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'website' => array('type' => self::TYPE_STRING, 'validate' => 'isUrl'),
            'company' => array('type' => self::TYPE_STRING, 'validate' => 'isGenericName'),
            'siret' => array('type' => self::TYPE_STRING, 'validate' => 'isGenericName'),
            'ape' => array('type' => self::TYPE_STRING, 'validate' => 'isApe'),
            'outstanding_allow_amount' => array('type' => self::TYPE_FLOAT, 'validate' => 'isFloat', 'copy_post' => false),
            'show_public_prices' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool', 'copy_post' => false),
            'id_risk' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt', 'copy_post' => false),
            'max_payment_days' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt', 'copy_post' => false),
            'active' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool', 'copy_post' => false),
            'deleted' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool', 'copy_post' => false),
            'note' => array('type' => self::TYPE_HTML, 'validate' => 'isCleanHtml', 'size' => 65000, 'copy_post' => false),
            'is_guest' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool', 'copy_post' => false),
            'id_shop' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'copy_post' => false),
            'id_shop_group' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'copy_post' => false),
            'id_default_group' => array('type' => self::TYPE_INT, 'copy_post' => false),
            'id_lang' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'copy_post' => false),
            'date_add' => array('type' => self::TYPE_DATE, 'validate' => 'isDate', 'copy_post' => false),
            'date_upd' => array('type' => self::TYPE_DATE, 'validate' => 'isDate', 'copy_post' => false),
            'reset_password_token' => array('type' => self::TYPE_STRING, 'validate' => 'isSha1', 'size' => 40, 'copy_post' => false),
            'reset_password_validity' => array('type' => self::TYPE_DATE, 'validate' => 'isDateOrNull', 'copy_post' => false),
            'dni' => array('type' => self::TYPE_STRING, 'validate' => '', 'required' => true, 'size' => 20),
            'typedni' => array('type' => self::TYPE_STRING, 'validate' => '', 'required' => true, 'size' => 50),
            'service' => array('type' => self::TYPE_INT, 'size' => 3),
            'balance' => array('type' => self::TYPE_INT),
        ),
    );

    public function getSimpleAddressSql($idAddress = null, $idLang = null)
    {
        if (null === $idLang) {
            $idLang = Context::getContext()->language->id;
        }
        $shareOrder = (bool) Context::getContext()->shop->getGroup()->share_order;

        $sql = 'SELECT DISTINCT
                      a.`id_address` AS `id`,
                      a.`alias`,
                      a.`firstname`,
                      a.`lastname`,
                      a.`company`,
                      a.`address1`,
                      a.`address2`,
                      a.`postcode`,
                      a.`city`,
                      a.`id_state`,
                      s.name AS state,
                      s.`iso_code` AS state_iso,
                      a.`id_country`,
                      cl.`name` AS country,
                      co.`iso_code` AS country_iso,
                      a.`other`,
                      a.`phone`,
                      a.`phone_mobile`,
                      a.`vat_number`,
                      a.`dni`,
                      a.`stratum`
                    FROM `' . _DB_PREFIX_ . 'address` a
                    LEFT JOIN `' . _DB_PREFIX_ . 'country` co ON (a.`id_country` = co.`id_country`)
                    LEFT JOIN `' . _DB_PREFIX_ . 'country_lang` cl ON (co.`id_country` = cl.`id_country`)
                    LEFT JOIN `' . _DB_PREFIX_ . 'state` s ON (s.`id_state` = a.`id_state`)
                    ' . ($shareOrder ? '' : Shop::addSqlAssociation('country', 'co')) . '
                    WHERE
                        `id_lang` = ' . (int) $idLang . '
                        AND `id_customer` = ' . (int) $this->id . '
                        AND a.`deleted` = 0
                        AND a.`active` = 1';

        if (null !== $idAddress) {
            $sql .= ' AND a.`id_address` = ' . (int) $idAddress;
        }

        return $sql;
    }
}
