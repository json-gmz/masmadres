<?php

if ( isset($_POST) && !empty($_POST) && $_POST["address_origin"] != "" && $_POST["address_destination"] != "" ) {

	$address_origin = $_POST["address_origin"];
	$address_destination = $_POST["address_destination"];

	$url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=".$address_origin."&destinations=".$address_destination."&key=AIzaSyCrALlFhFgsb_wNwK6h9HeyoMvan9djllU";

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	$response = json_decode(curl_exec($ch), true);

}

echo json_encode($response["rows"][0]["elements"][0]);

?>