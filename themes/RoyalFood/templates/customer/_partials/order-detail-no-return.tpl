{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='order_products_table'}
  <div class="box hidden-sm-down">
    <table id="order-products" class="table table-bordered">
      <thead class="thead-default">
        <tr>
          <th>{l s='Product' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Quantity' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Unit price' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Total price' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Califications' d='Shop.Theme.Catalog'}</th>
        </tr>
      </thead>
      {foreach from=$order.products item=product}
        <input type="hidden" name="id_product" id="id_product" value="{$product.product_id}">
        <tr>
          <td>
            <strong>
              <a {if isset($product.download_link)}href="{$product.download_link}"{/if}>
                {$product.name}
              </a>
            </strong><br/>
            {if $product.reference}
              {l s='Reference' d='Shop.Theme.Catalog'}: {$product.reference}<br/>
            {/if}
            {if $product.customizations}
              {foreach from=$product.customizations item="customization"}
                <div class="customization">
                  <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                </div>
                <div id="_desktop_product_customization_modal_wrapper_{$customization.id_customization}">
                  <div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                          <h4 class="modal-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
                        </div>
                        <div class="modal-body">
                          {foreach from=$customization.fields item="field"}
                            <div class="product-customization-line row">
                              <div class="col-sm-3 col-xs-4 label">
                                {$field.label}
                              </div>
                              <div class="col-sm-9 col-xs-8 value">
                                {if $field.type == 'text'}
                                  {if (int)$field.id_module}
                                    {$field.text nofilter}
                                  {else}
                                    {$field.text}
                                  {/if}
                                {elseif $field.type == 'image'}
                                  <img src="{$field.image.small.url}">
                                {/if}
                              </div>
                            </div>
                          {/foreach}
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              {/foreach}
            {/if}
          </td>
          <td>
            {if $product.customizations}
              {foreach $product.customizations as $customization}
                {$customization.quantity}
              {/foreach}
            {else}
              {$product.quantity}
            {/if}
          </td>
          <td class="text-xs-right">{$product.price}</td>
          <td class="text-xs-right">{$product.total}</td>
          <td class="calification-modal">
            <button class="account-link btn-default" type="button" id="button_{$product.product_id}" onclick="sendQualification({$product.product_id}, '{$product.name}')" style="cursor: pointer; color:red;font-weight:bold;">
              <i class="icon-edit"></i>
              {l s='Qualification' d='Shop.Theme.Catalog'}
            </button>
          </td>
        </tr>
      {/foreach}
      <tfoot>
        {foreach $order.subtotals as $line}
          {if $line.value}
            <tr class="text-xs-right line-{$line.type}">
              {if $line.type == "shipping"}
                <td colspan="3">Envío</td>
              {else}
                <td colspan="3">{$line.label}</td>
              {/if}
              <td>{$line.value}</td>
            </tr>
          {/if}
        {/foreach}
        <tr class="text-xs-right line-{$order.totals.total.type}">
          <td colspan="3">{$order.totals.total.label}</td>
          <td>{$order.totals.total.value}</td>
        </tr>
      </tfoot>
    </table>
  </div>

  <div class="order-items hidden-md-up box">
    {foreach from=$order.products item=product}
      <div class="order-item">
        <div class="row">
          <div class="col-sm-5 desc">
            <div class="name">{$product.name}</div>
            {if $product.reference}
              <div class="ref">{l s='Reference' d='Shop.Theme.Catalog'}: {$product.reference}</div>
            {/if}
            {if $product.customizations}
              {foreach $product.customizations as $customization}
                <div class="customization">
                  <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                </div>
                <div id="_mobile_product_customization_modal_wrapper_{$customization.id_customization}">
                </div>
              {/foreach}
            {/if}
          </div>
          <div class="col-sm-7 qty">
            <div class="row">
              <div class="col-xs-4 text-sm-left text-xs-left">
                {$product.price}
              </div>
              <div class="col-xs-4">
                {if $product.customizations}
                  {foreach $product.customizations as $customization}
                    {$customization.quantity}
                  {/foreach}
                {else}
                  {$product.quantity}
                {/if}
              </div>
              <div class="col-xs-4 text-xs-right">
                {$product.total}
              </div>
              <div class="calification-modal col-xs-12 text-xs-center">
                <button class="account-link btn-default" type="button" id="button_{$product.product_id}" onclick="sendQualification({$product.product_id}, '{$product.name}')" style="cursor: pointer; color:red;font-weight:bold;">
                  <i class="icon-edit"></i>
                  {l s='Qualification' d='Shop.Theme.Catalog'}
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    {/foreach}
  </div>
  <div class="order-totals hidden-md-up box">
    {foreach $order.subtotals as $line}
      {if $line.value}
        <div class="order-total row">
          <div class="col-xs-8"><strong class="order-total-title">{$line.label}</strong></div>
          <div class="col-xs-4 text-xs-right">{$line.value}</div>
        </div>
      {/if}
    {/foreach}
    <div class="order-total row">
      <div class="col-xs-8"><strong>{$order.totals.total.label}</strong></div>
      <div class="col-xs-4 text-xs-right">{$order.totals.total.value}</div>
    </div>
  </div>
<input type="hidden" id="modal_calification" data-toggle="modal" data-target="#modalQualification">
<div class="modal fade" id="modalQualification" role="dialog">
  <div class="modal-dialog">
  <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title title_product">{l s='Qualification Product' d='Admin.Actions'}</h4>
      </div>
      <div class="modal-body">
         <h4 class="title_product" id="title_product"></h4>   
      </div>
      <div class="modal-footer">
          <div class="row title-service">
            <input type="hidden" id="id_product" value="">
            <input type="hidden" id="order_id" name="order_id" value="{$order.details.id}">
            <select class="form-control select-qualification" name="selectOption" id="selectOption" required>
              <option value="">Selecciona una calificación</option>
              <option value="5">Excelente</option>
              <option value="4">Bueno</option>
              <option value="3">Regular</option>
              <option value="2">Malo</option>
              <option value="1">Pesimo</option>
            </select>
            <h4 class="title-comments">{l s='Comments' d='Admin.Actions'}</h4>
            <div class="form-group" id="textComments">
              <textarea class="form-control" id="commentsProduct" rows="3"></textarea>
              <button type="button" id="qualificationProduct" class="btn btn-danger btn-lg" data-dismiss="modal" style="margin-top: 10px;">{l s='Qualification' d='Admin.Actions'}</button>
            </div>
          </div>
      </div>
    </div>
  </div>  
</div>
<script>
function sendQualification(product_id, product_name){

  $("#id_product").val(product_id);
  $("#title_product").html(product_name);
  $("#modal_calification").click();

}

$("#qualificationProduct").click(function(){
    var id_order = $("#order_id").val();
    var id_product = $("#id_product").val();
    var comments = $('#commentsProduct').val();
    var selectOption = $('#selectOption').val();
    
    if(selectOption != ""){ 
      $.ajax({
        method: "POST",
        url: "/ajax/ApiQualificationService.php",
        data : {
          'id_order' : id_order,
          'id_product': id_product,
          'comments': comments,
          'selectOption': selectOption
        },
      }).done(function(response) {
        location.reload();
      });
    }
    else{
      alert("Por favor seleccione una calificación para el producto")
    }
    
});

//Funcionalidad para saber si el producto ya fue calificado
$(document).ready(function(){

  $(".order-total-title:eq(1)").html("Envío");

  $(".order-message-form").hide();
  var id_order = $("#order_id").val();

  $.ajax({
    method: "POST",
    url: "/ajax/ApiValidateStatusService.php",
    data : {
      'id_order' : id_order
    },
    }).done(function(response) {
      var obj = JSON.parse(response);
      var keys = Object.keys(obj);

      for(let i = 0; i < keys.length; i++){
          var status_service = obj[i].status_service;
          var id = obj[i].product_id;
          if(status_service == 6){
            $("#button_"+id).prop('enabled', true);
          }
          else{
            $("#button_"+id).prop('disabled', true);
            $("#button_"+id).css('opacity', 0);
            $("#button_"+id).css('cursor','alias');          
          }
      }
    });

  $.ajax({
    method: "POST",
    url: "/ajax/ApiQualifiedProduct.php",
    data : {
      'id_order' : id_order
    },
    }).done(function(response) {
      var obj = JSON.parse(response);
      var keys = Object.keys(obj);

      for(let i = 0; i < keys.length; i++){
            var id = obj[i].id_product;
            $("#button_"+id).prop('disabled', true);
            $("#button_"+id).css('color','green'),
            $("#button_"+id).html("Calificado");
      }
    });
});
</script>
{/block}
