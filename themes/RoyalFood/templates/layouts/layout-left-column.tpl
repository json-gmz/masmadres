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
{extends file='layouts/layout-both-columns.tpl'}

{block name='right_column'}{/block}

{block name='content_wrapper'}
  <div id="content-wrapper" class="left-column col-xs-12 col-sm-8 col-md-9" style="width:75.6%">
{hook h="displayContentWrapperTop"}
    {block name='content'}
      <p>Hello world! This is HTML5 Boilerplate.</p>
    {/block}
    
    {hook h="displayContentWrapperBottom"}
    <input type="hidden" value="{{$customer.id_default_group}}" id="id_group" />
    <input type="hidden" value="{{$customer.id}}" id="id_customer"/>

    <script>
      $(document).ready(function(){
        $("#nav-message-alert").hide();
        var id_group = $("#id_group").val();

        $('#save-mom').prop('disabled', false);
        $("#mom-form").find(".hidden-log").hide();

        if (id_group == 10) {
            $("#nav-message-alert").show();
            $(".card_user").hide();
            $(".addresses-footer").hide();
            $('#save-mom').prop('disabled', false);
            $("#mom-form").find(".hidden-log").hide();
        } else if (id_group == 1) {
            $('#save').prop('disabled', true);
            $('#save-mom').prop('disabled', true);
            $("#mom-form").find(".hidden-log").show();
        } else {
          $(".card_mom").hide();
          $('#save').prop('disabled', false);
          $("#customer-form").find(".hidden-log").hide();
        }
      });

    </script>
    <script>
      $("#switch-log").hide();
      $("#history-mom").hide();
      $("#balance_score").hide();
      $("#order-slips-link").hide();
      $("#terms-conditions-mothers").hide();

      var switchStatus = false;  
      var id_group = $("#id_group").val();
      var id_customer = $("#id_customer").val();
      var status = $("#togBtn").val();

      if(id_group == 10){
        $("#switch-log").show();
        $("#history-mom").show();
        $("#history-link").hide();
        $("#discounts-link").hide();
        $("#balance_score").show();
        $("#terms-conditions-mothers").show();
        $(".cat-title").hide();

        $.ajax({
          method: "POST",
          url: "/ajax/ApiSelectActiveService.php",
          data : {
            'id_customer' : id_customer
          },
        }).done(function(response) {
           if(response == 1){
            $("#togBtn").attr("checked","checked");
           } else {
            $("#togBtn").removeAttr("checked","checked");
           }
        });
      }

      $("#togBtn").on('change', function() {
          switchStatus = $(this).is(':checked');
          if (switchStatus == true) {
              $.ajax({
                method: "POST",
                url: "/ajax/ApiSetActiveService.php",
                data : {
                  'active_service' : 1,
                  'id_customer' : id_customer
                },
              }).done(function(response) {

              });
          } else {
            $.ajax({
                method: "POST",
                url: "/ajax/ApiSetActiveService.php",
                data : {
                  'active_service' : 0,
                  'id_customer' : id_customer
                },
              }).done(function(response) {

              });
          }
          location.reload();
      });
    </script>
  </div>
{/block}