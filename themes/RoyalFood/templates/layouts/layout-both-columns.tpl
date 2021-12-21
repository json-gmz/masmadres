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
<!doctype html>
<html lang="{$language.iso_code}">

  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    {literal}
      <!-- Global site tag (gtag.js) - Google Analytics -->
      <script async src="https://www.googletagmanager.com/gtag/js?id=G-FH8579WBDE"></script>
      <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-FH8579WBDE');
      </script>
      <!-- End Google Tag Manager -->
    {/literal}

  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames}">

    {literal}
      <!-- Google Tag Manager (noscript) -->
      <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KJ3SSR3"
      height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
      <!-- End Google Tag Manager (noscript) -->
    {/literal}

    {block name='hook_after_body_opening_tag'}
    	{hook h='displayAfterBodyOpeningTag'}
    {/block}

    <main id="page">
      {block name='product_activation'}
        {include file='catalog/_partials/product-activation.tpl'}
      {/block}

      <header id="header">
        {block name='header'}
          {include file='_partials/header.tpl'}
        {/block}
      </header>

      {block name='notifications'}
        {include file='_partials/notifications.tpl'}
      {/block}
      
	  {block name='breadcrumb'}
		{include file='_partials/breadcrumb.tpl'}
	  {/block}
			
	  <section id="wrapper">
{hook h="displayWrapperTop"}	
        {if $page.page_name == 'index'}
			<div id="top_column" class="center_column">
			{hook h='displayTopColumn'}
			</div>
		{/if}
		<div class="{if $page.page_name == 'index'}home-container{else}container{/if}">		  
          <div id="columns_inner">
		  {block name="left_column"}
            <div id="left-column" class="col-xs-12" style="width:24.4%">
              {if $page.page_name == 'product'}
                {hook h='displayLeftColumnProduct'}
              {else}
                {hook h="displayLeftColumn"}
              {/if}
            </div>
          {/block}

          {block name="content_wrapper"}
            <div id="content-wrapper" class="left-column right-column">
{hook h="displayContentWrapperTop"}
              {block name="content"}
                <p>Hello world! This is HTML5 Boilerplate.</p>
              {/block}
{hook h="displayContentWrapperBottom"}
            </div>
          {/block}

          {block name="right_column"}
            <div id="right-column" class="col-xs-12"  style="width:24.4%">
              {if $page.page_name == 'product'}
                {hook h='displayRightColumnProduct'}
              {else}
                {hook h="displayRightColumn"}
              {/if}
            </div>
          {/block}
		  </div>
        </div>
{hook h="displayWrapperBottom"}
      </section>

      <footer id="footer">
        {block name="footer"}
          {include file="_partials/footer.tpl"}
        {/block}
      </footer>

    </main>

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
    	{hook h='displayBeforeBodyClosingTag'}
    {/block}
  </body>

  <input type="hidden" id="click_modal" data-toggle="modal" data-target="#modalConfirmation">
    <div class="modal fade" id="modalConfirmation" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Información Enviada</h4>
          </div>
          <div class="modal-body">
            <img src="img/Yes_Check_Circle.png" class="img-section" width="30%">
            <p class="info-text">
              Se ha realizado el registro exitosamente
              <br>
              Nos estaremos contactando contigo para realizar nuestra entrevista
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" id="ok_modal" class="btn-style btn btn-danger" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
  </body>

  <script type="text/javascript">
    var id_mom = "{$customer.id}";
    var email_mom = "{$customer.email}";
    var group_mom = "{$customer.id_default_group}";
  </script>

  <literal>
  <script type="text/javascript">
    $(document).ready(function(){
    
      var getUrlParameter = function getUrlParameter(sParam) {
          var sPageURL = window.location.search.substring(1),
              sURLVariables = sPageURL.split('&'),
              sParameterName,
              i;

          for (i = 0; i < sURLVariables.length; i++) {
              sParameterName = sURLVariables[i].split('=');

              if (sParameterName[0] === sParam) {
                  return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
              }
          }
      };

      var data = getUrlParameter('momVerified');
      if ( data == 2 && id_mom != "" ) {
        if ( id_mom != "" && email_mom != "" && group_mom != "" ) {
          $.ajax({
            method: "POST",
            url: "/ajax/ApiSetInactiveMom.php",
            data : {
              'mom' : id_mom,
              'email': email_mom,
              'group': group_mom
            },
          }).success(function(response) {  });
        }
        $("#click_modal").click();
      }

      $("#modalConfirmation").click(function(){
        var getUrl = window.location;
        var urlHome = getUrl .protocol + "//" + getUrl.host + "/";
        window.location.href = urlHome;
      });
    });
</script>
</literal>

</html>
