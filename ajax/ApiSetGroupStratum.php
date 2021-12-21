<?php

if ( isset($_POST) && !empty($_POST) && $_POST["stratum"] != "" ) {
	include_once(dirname(__FILE__) . "/../config/config.inc.php");

	$customer = $_POST["customer"];
	$stratum = $_POST["stratum"];

	$sql = "SELECT id_group
			FROM "._DB_PREFIX_."group
			WHERE stratum = ".$stratum;
	$groupStratum = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);
	$groupStratum = $groupStratum[0]["id_group"] == "" ? 3 : $groupStratum[0]["id_group"];

	if ( $customer != "" && $customer > 0 ) {
		$sql = "SELECT COUNT(*) exist_group_customer
				FROM "._DB_PREFIX_."customer_group
				WHERE id_customer = ".$customer."
				AND id_group = ".$groupStratum;
		$existGroupCustomer = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);
		$existGroupCustomer = $existGroupCustomer[0]["exist_group_customer"] > 0 ? true : false;

		if ( !$existGroupCustomer ) {
			$sql = "INSERT INTO "._DB_PREFIX_."customer_group (id_customer, id_group)
					VALUES (".$customer.", ".$groupStratum.")";
			Db::getInstance()->execute($sql);
		}

		$sql = "UPDATE "._DB_PREFIX_."customer
				SET id_default_group = ".$groupStratum."
				WHERE id_customer = ".$customer;
		Db::getInstance()->execute($sql);
	}
}

echo true;

?>