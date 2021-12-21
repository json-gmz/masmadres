<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCrALlFhFgsb_wNwK6h9HeyoMvan9djllU&callback=initMap&libraries=&v=weekly" defer></script>

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
				<h4 class="modal-title w-100 font-weight-bold">{l s='Location' d='Shop.Theme.Customeraccount'}</h4>
				<button type="button" id="close" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body mx-1">
				<div class="md-form mb-5">
					<input type="text" id="adddress" name="address" value="{$smarty.cookies.address}" class="form-control validate" required="required">
					<button class="btn" id="search-address" {if $smarty.cookies.address == "" || $smarty.cookies.stratum == "" }disabled class="button-opacity"{/if}></button>
					<label data-error="wrong" data-success="right" for="adddress">{l s='Address' d='Shop.Theme.Customeraccount'}</label>
				</div>
				<div class="md-form mb-5">
					<select id="stratum" name="stratum" class="form-control validate" required="required">
						<option {if $smarty.cookies.stratum == 1}selected{/if}>1</option>
						<option {if $smarty.cookies.stratum == 2}selected{/if}>2</option>
						<option {if $smarty.cookies.stratum == 3}selected{/if}>3</option>
						<option {if $smarty.cookies.stratum == 4}selected{/if}>4</option>
						<option {if $smarty.cookies.stratum == 5}selected{/if}>5</option>
						<option {if $smarty.cookies.stratum == 6}selected{/if}>6</option>
					</select>
					<label data-error="wrong" data-success="right" for="stratum">{l s='Stratum' d='Shop.Theme.Customeraccount'}</label>
				</div>
			</div>
			<div class="md-form mb-5">
				<small>{l s='Just confirm your details, the map is a guide + Madres' d='Shop.Theme.Customeraccount'}</small>
			</div>
			<div class="modal-map mx-1">
				<div id="map"></div>
			</div>
			<div class="modal-footer d-flex justify-content-center">
				<button class="btn btn-primary" id="confirm-address" {if $smarty.cookies.address == "" || $smarty.cookies.stratum == "" }disabled class="button-opacity"{/if}>{l s='Confirm' d='Shop.Theme.Customeraccount'}</button>
			</div>
		</div>
	</div>
</div>

<a href="" id="start-modal-address" class="btn btn-default btn-rounded mb-4 btn" data-toggle="modal" data-target="#modalAddressForm">Launch Modal Location</a>

{literal}
	<script>
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
	</script>
{/literal}