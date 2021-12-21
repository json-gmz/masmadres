<?php
/* Smarty version 3.1.33, created on 2021-12-20 22:05:23
  from 'C:\xampp\htdocs\masmadres\themes\RoyalFood\templates\maps\modal.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_61c14473f15638_87065078',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '59789feef4b3e01d06d08af570d0f2d31ab38340' => 
    array (
      0 => 'C:\\xampp\\htdocs\\masmadres\\themes\\RoyalFood\\templates\\maps\\modal.tpl',
      1 => 1612234226,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_61c14473f15638_87065078 (Smarty_Internal_Template $_smarty_tpl) {
echo '<script'; ?>
 src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCrALlFhFgsb_wNwK6h9HeyoMvan9djllU&callback=initMap&libraries=&v=weekly" defer><?php echo '</script'; ?>
>

<style>
	#start-modal-address {
		display: none;
	}

	.button-opacity {
		opacity: 0.3;
	}

	.modal-map {
		height: 250px;
	}

	#map {
		height: 100%;
	}

	.modal-content, .modal-footer {
		text-align: center;
	}

	#stratum {
		text-align-last: center;
	}

	#search-address {
		position: absolute;
		top: 15px;
		right: 15px;
		color: #fff;
		background: var(--mm-color-secundary);
	}

	#search-address:before {
		content: "\F002";
		display: block;
		font-family: "FontAwesome";
		font-size: 16px;
		padding: 0;
		width: 100%;
		text-align: center;
		color: #fff;
	}

	#search-address:hover {
		background: #262626;
	}
</style>

<div class="modal fade" id="modalAddressForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Location','d'=>'Shop.Theme.Customeraccount'),$_smarty_tpl ) );?>
</h4>
				<button type="button" id="close" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body mx-1">
				<div class="md-form mb-5">
					<input type="text" id="adddress" name="address" value="<?php echo htmlspecialchars($_COOKIE['address'], ENT_QUOTES, 'UTF-8');?>
" class="form-control validate" required="required">
					<button class="btn" id="search-address" <?php if ($_COOKIE['address'] == '' || $_COOKIE['stratum'] == '') {?>disabled class="button-opacity"<?php }?>></button>
					<label data-error="wrong" data-success="right" for="adddress"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Address','d'=>'Shop.Theme.Customeraccount'),$_smarty_tpl ) );?>
</label>
				</div>
				<div class="md-form mb-5">
					<select id="stratum" name="stratum" class="form-control validate" required="required">
						<option <?php if ($_COOKIE['stratum'] == 1) {?>selected<?php }?>>1</option>
						<option <?php if ($_COOKIE['stratum'] == 2) {?>selected<?php }?>>2</option>
						<option <?php if ($_COOKIE['stratum'] == 3) {?>selected<?php }?>>3</option>
						<option <?php if ($_COOKIE['stratum'] == 4) {?>selected<?php }?>>4</option>
						<option <?php if ($_COOKIE['stratum'] == 5) {?>selected<?php }?>>5</option>
						<option <?php if ($_COOKIE['stratum'] == 6) {?>selected<?php }?>>6</option>
					</select>
					<label data-error="wrong" data-success="right" for="stratum"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Stratum','d'=>'Shop.Theme.Customeraccount'),$_smarty_tpl ) );?>
</label>
				</div>
			</div>
			<div class="md-form mb-5">
				<small><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Just confirm your details, the map is a guide + Madres','d'=>'Shop.Theme.Customeraccount'),$_smarty_tpl ) );?>
</small>
			</div>
			<div class="modal-map mx-1">
				<div id="map"></div>
			</div>
			<div class="modal-footer d-flex justify-content-center">
				<button class="btn btn-primary" id="confirm-address" <?php if ($_COOKIE['address'] == '' || $_COOKIE['stratum'] == '') {?>disabled class="button-opacity"<?php }?>><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Confirm','d'=>'Shop.Theme.Customeraccount'),$_smarty_tpl ) );?>
</button>
			</div>
		</div>
	</div>
</div>

<a href="" id="start-modal-address" class="btn btn-default btn-rounded mb-4 btn" data-toggle="modal" data-target="#modalAddressForm">Launch Modal Location</a>


	<?php echo '<script'; ?>
>
		var marker = "";
		var latitude = 4.6449246;
		var longitude = -74.0824065;
		var pointZoom = 15;

		var address = getCookie("address");
		var stratum = getCookie("stratum");

		function changeMap() {
			deleteMarker();

			map.setCenter( new google.maps.LatLng(latitude, longitude) );
			map.setZoom( pointZoom );

			var location = {lat: latitude, lng: longitude};
			marker = new google.maps.Marker({
				position: location,
				map: map
			});
		}

		function deleteMarker() {
			if ( marker != "" ) {
				marker.setMap(null);
			}
		}

		function startModalAddress(forceOpen = false) {
			if ( address != "" && forceOpen ) {
				searchAddress(address);
			}

			if ( address == "" || stratum == "" || forceOpen ) {
				changeMap();
				$("#start-modal-address").click();
			}
		}

		function setCurrentLocation(position) {
			latitude = position.coords.latitude;
			longitude = position.coords.longitude;
			pointZoom = 17;
			changeMap();
		}

		function errorCurrentLocation(error) {
			var message_error = "";

			switch (error.code) {
				case error.PERMISSION_DENIED:
					message_error = "User denied the request for Geolocation."
					break;

				case error.POSITION_UNAVAILABLE:
					message_error = "Location information is unavailable."
					break;

				case error.TIMEOUT:
					message_error = "The request to get user location timed out."
					break;

				case error.UNKNOWN_ERROR:
					message_error = "An unknown error occurred."
					break;
			}

			console.log(message_error);
		}

		function getLocation() {
			if ( navigator.geolocation ) {
				setTimeout(function () {
					navigator.geolocation.getCurrentPosition(setCurrentLocation, errorCurrentLocation);
				});
			}
		}

		function searchAddress(address) {
			$.ajax({
				method: "GET",
				url: "https://maps.googleapis.com/maps/api/geocode/json?address=" +  encodeURIComponent(address+" , Colombia") + "&key=AIzaSyCrALlFhFgsb_wNwK6h9HeyoMvan9djllU",
			}).done(function(data) {
				if ( data["status"] == "OK" ) {
					latitude = data["results"][0]["geometry"]["location"]["lat"];
					longitude = data["results"][0]["geometry"]["location"]["lng"];
					pointZoom = 17;
					changeMap();
				} else {
					alert("No se encuentran resultados.");
				}
			});
		}

		function setCookie(cname, cvalue, exdays = 1, hours = 2) {
			var d = new Date();
			d.setTime(d.getTime() + (exdays*hours*60*60*1000));
			var expires = "expires="+ d.toUTCString();
			document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
		}

		function getCookie(cname) {
			var name = cname + "=";
			var decodedCookie = decodeURIComponent(document.cookie);
			var ca = decodedCookie.split(';');
			for(var i = 0; i <ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ') {
					c = c.substring(1);
				}
				if (c.indexOf(name) == 0) {
					return c.substring(name.length, c.length);
				}
			}
			return "";
		}

		function saveAddress(address, stratum, reload = true) {
			setCookie("address", address);
			setCookie("stratum", stratum);

			setGroupStratum(stratum, $("#customerLoggedId").val());

			if ( reload ) {
				location.reload();
			}
		}

		function setGroupStratum(stratum, customer) {
			$.ajax({
				method: "POST",
				url: "/ajax/ApiSetGroupStratum.php",
				data : {
					'stratum' : stratum,
					'customer' : customer
				},
			}).done(function(response) {
				// Correct
			});
		}

		$(function() {
			getLocation();
		});

		$("#adddress").on("keyup", function() {
			var address = $("#adddress").val();
			if ( address != "" && address.length > 10 ) {
				$("#confirm-address, #search-address").removeClass("button-opacity");
				$("#confirm-address, #search-address").removeAttr("disabled");
			} else {
				$("#confirm-address, #search-address").addClass("button-opacity");
				$("#confirm-address, #search-address").attr("disabled", "disabled");
			}
		});

		$("#search-address").on("click", function() {
			searchAddress( $("#adddress").val() );
		});

		$("#confirm-address").on("click", function() {
			saveAddress( $("#adddress").val(), $("#stratum").val() );
		});

		(function(exports) {
			"use strict";
		
			function initMap() {
				var location = {lat: latitude, lng: longitude};
				exports.map = new google.maps.Map(document.getElementById("map"), {
					center: location,
					zoom: pointZoom,
					clickableIcons: false,
					draggable: true,
					fullscreenControl: false,
					keyboardShortcuts: false,
					streetViewControl: false,
					mapTypeControl: false
				});

				var marker = new google.maps.Marker({
					position: location,
					map: exports.map
				});

				var styleControl = document.getElementById("style-selector-control");
				exports.map.controls[google.maps.ControlPosition.TOP_LEFT].push(
					styleControl
				); // Apply new JSON when the user chooses to hide/show features.

				var elementhidepoi = document.getElementById("hide-poi");
				if (typeof(elementhidepoi) != 'undefined' && elementhidepoi != null) {
					document.getElementById("hide-poi").addEventListener("click", function() {
						exports.map.setOptions({
							styles: styles["hide"]
						});
					});
				}

				var elementshowpoi = document.getElementById("show-poi");
				if (typeof(elementshowpoi) != 'undefined' && elementshowpoi != null) {
					document.getElementById("show-poi").addEventListener("click", function() {
						exports.map.setOptions({
							styles: styles["default"]
						});
					});
				}
			}

			var styles = {
				default: null,
				hide: [
					{
						featureType: "poi.business",
						stylers: [{
							visibility: "off"
						}]
					},
					{
						featureType: "poi",
						stylers: [{
							visibility: "off"
						}]
					},
					{
						featureType: "transit",
						elementType: "labels.icon",
						stylers: [{
							visibility: "off"
						}]
					}
				]
			};

			exports.initMap = initMap;
			exports.styles = styles;
		
		})((this.window = this.window || {}));
	<?php echo '</script'; ?>
>
<?php }
}
