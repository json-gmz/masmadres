<?php

include_once(dirname(__FILE__) . "/../config/config.inc.php");

$categorias_form = [];
$categorias = Category::getCategories();

$categorias_form["-"] = 0;
foreach( $categorias[2] as $category){
    $category = $category['infos'];
    $categorias_form[$category["name"]] = $category["id_category"];
}

echo json_encode($categorias_form);

?>