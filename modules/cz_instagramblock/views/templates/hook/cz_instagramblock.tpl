{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if $imagesIns.data && count($imagesIns.data)>0}
<div id="czinstagramblock" class="cz_instagramblock clearfix">
	
		<h3 class="instagram-heading products-section-title">
			{l s='Instagram' mod='Shop.Theme.Global'}
		</h3>
		
		<div class="instagramblock">
			{assign var='sliderFor' value=6} <!-- Define Number of product for SLIDER -->
			{assign var='instagram_picscount' value=count($imagesIns.data)}
			
			{if $instagram_picscount >= $sliderFor}
	
				<ul id="instagram-carousel" class="cz-carousel instagram_list">
			{else}
				<ul id="instagram-grid" class="instagram grid row gridcount">
			{/if}
		
			{foreach from=$imagesIns.data item=imagesIn name=imagesIn}	
				<li class="{if $instagram_picscount >= $sliderFor}item{else}instagram_item col-xs-6 col-sm-4 col-lg-3 col-xl-2{/if}">
					<a target="_blank" href="{$imagesIn.link|escape:'html':'UTF-8'}">
						<img src="{$imagesIn.images.standard_resolution.url|escape:'html':'UTF-8'}"  style="float:left;" />
					</a> 
					<div class="insta_caption">
							{$imagesIn.caption.text|truncate:50:'...'}
						
					</div>
				</li>		
			{/foreach}
			</ul>	
			
			 
			{if $instagram_picscount >= $sliderFor}
				<div class="customNavigation">
					<a class="btn prev instagram_prev">&nbsp;</a>
					<a class="btn next instagram_next">&nbsp;</a>
				</div>
			{/if}	
			 
		</div>		
</div>
{/if}