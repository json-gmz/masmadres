{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_nav'}
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<nav class="header-nav">
	<div class="container">
			<input type="hidden" value="{{$customer.id_default_group}}" id="id_group" />
			{if $customer.id_default_group != 10}
	        	<div class="address-nav">
	        		{if $smarty.cookies.address == "" || $smarty.cookies.stratum == "" }
	        			<div id="select-address" class="address-block">Seleccionar ubicación <i style="font-size:24px" class="fa">&#xf041;</i></div>
	        		{else}
	        			<div id="change-address" class="address-block">{$smarty.cookies.address} <i style="font-size:24px" class="fa">&#xf041;</i></div>
	        		{/if}
	        	</div>
	        {/if}
		{*<div class="hidden-sm-down">*}
			<div class="left-nav">
				{hook h='displayNav1'}
			</div>
			
			<div class="right-nav">
				{hook h='displayNav2'}
			</div>
		{*</div>*}
		
		{*<div class="hidden-md-up text-xs-center mobile">
			<div class="pull-xs-left" id="menu-icon">
				<i class="material-icons menu-open">&#xE5D2;</i>
				<i class="material-icons menu-close">&#xE5CD;</i>			  
			</div>
			<div class="pull-xs-right" id="_mobile_cart"></div>
			<div class="pull-xs-right" id="_mobile_user_info"></div>
			<div class="top-logo" id="_mobile_logo"></div>
			<div class="clearfix"></div>
		</div> *}
        <script> $(".address-block").on("click", function() { startModalAddress(true); }); </script>
        <script>
        	$(document).ready(function(){
				/* HIDE GENERAL OPTIONS */
        		if ( $("#id_group").val() == 10 ) {
					$(".menu").hide();
					$(".blockcart").hide();
					$(".block-categories").hide();
					$("#search_widget").hide();
					$(".cat-title").hide();
        		}
        	});
        </script>
	</div>
</nav>
<nav class="header-nav" id="nav-message-alert">
	<center>
		<i class="fa fa-exclamation-circle"></i>
		Recuerda cerrar tu sesión cuando no estés trabajando, así, evitaremos incumplirle a nuestros clientes
		<i class="fa fa-exclamation-circle"></i>
	</center>
</nav>
{/block}

{block name='header_top'}
	<div class="header-top">
		<div class="container">
			<div class="header_logo">
				<a href="{$urls.base_url}">
				<img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
				</a>
			</div>
			{hook h='displayTop'}
			
		</div>
		{hook h='displayNavFullWidth'}
	</div>
	<input id="customerLoggedId" name="customerLoggedId" type="hidden" value="{$customer.id}" />
	{include '../maps/modal.tpl'}
{/block}