{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/OSL-3.0
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
 * @license   https://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
 
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Historial de servicio' d='Shop.Theme.Customeraccount'}
{/block}
{block name='page_content'}
   <table class="product" width="100%" cellpadding="4" cellspacing="0">
      <thead>
         <tr class="header-table">
            <th class="product header title-text" width="{$layout.reference.width}%">{l s='Orden' d='Shop.Theme.Customeraccount'}</th>
            <th class="product header title-text" width="{$layout.product.width}%">{l s='Nombre' d='Shop.Theme.Customeraccount'}</th>
            <th class="product header title-text" width="{$layout.tax_code.width}%">{l s='Fecha' d='Shop.Theme.Customeraccount'}</th>
            <th class="product header title-text" width="{$layout.tax_code.width}%">{l s='Ver' d='Shop.Theme.Customeraccount'}</th>
         </tr>
      </thead>
      <tbody>
         {foreach name=outer item=services from=$service}
            <tr class="product {$bgcolor_class}">
                     <td class="history center">
                        {$services['id_order']}
                     </td>
                     <td class="history center">
                        {$services['firstname']} {$services['lastname']}
                     </td>
                     <td class="history center">
                        {$services['date_add_order']}
                     </td>
                     <td class="history center">
                        <a class="account-link btn btn-default" type="button" id="button_info" onclick="getServices({$services['id_order']}, {$service_mom}, {$id_mom},('{$services['id_mom']}'))">
                           <i class="icon-edit"></i>
                           {l s='Details' d='Shop.Theme.Customeraccount'}
                        </a>
                     </td>
            </tr>
         {/foreach}
      </tbody>

   </table>
<input type="hidden" id="click_modal_servicesmom" data-toggle="modal" data-target="#modalServicesMom">
<div class="modal fade" id="modalServicesMom" role="dialog">
	<div class="modal-dialog">
	<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
		  <h4 class="modal-title">{l s='Información Detallada' d='Shop.Theme.Customeraccount'}</h4>
		</div>
      <div class="modal-body">
         <div class="row">
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-right">{l s='Order' d='Shop.Theme.Customeraccount'}</p>
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-left" id="id_order"></p>
         </div>
         <div class="row">
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-right">{l s='Referencia' d='Shop.Theme.Customeraccount'}</p>
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-left" id="reference_order"></p>
         </div>
         <div class="row">
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-right">{l s='Fecha' d='Shop.Theme.Customeraccount'}</p>
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-left" id="order_date_add"></p>
         </div>
         {*<div class="row">
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-right">{l s='Estado Orden' d='Shop.Theme.Customeraccount'}</p>
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-left" id="order_state"></p>
         </div>*}
         <div class="row">
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-right">{l s='Tipo pago' d='Shop.Theme.Customeraccount'}</p>
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-left" id="type_payment"></p>
         </div>
         <div class="row">
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-right">{l s='Valor a cobrar al usuario' d='Shop.Theme.Customeraccount'}</p>
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-left" id="total_price"></p>
         </div>
         <div class="row">
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-right">{l s='Ganancia total madre' d='Shop.Theme.Customeraccount'}</p>
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-left" id="amount_total"></p>
         </div>
         <div class="row">
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-right">{l s='Usuario' d='Shop.Theme.Customeraccount'}</p>
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-left" id="customer_name"></p>
         </div>
         <div class="row">
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-right">{l s='Documento identidad' d='Shop.Theme.Customeraccount'}</p>
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-left" id="customer_dni"></p>
         </div>
         <!--<div class="row">
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-right">{l s='Email' d='Shop.Theme.Customeraccount'}</p>
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-left" id="customer_email"></p>
         </div>-->
         <div class="row">
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-right">{l s='Address' d='Shop.Theme.Customeraccount'}</p>
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-left" id="address_delivery"></p>
         </div>
         <div class="row">
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-right">{l s='Telefono' d='Shop.Theme.Customeraccount'}</p>
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-left" id="phone_customer"></p>
         </div>
         <div class="row">
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-right">{l s='Stratum' d='Shop.Theme.Customeraccount'}</p>
            <p class="info-text col-lg-6 col-sm-6 col-xs-6 text-left" id="stratum_customer"></p>
         </div>
         <table class="product" width="100%" cellpadding="4" cellspacing="0">
            <thead>
               <tr class="header-table">
                  <th class="product header title-text" width="{$layout.reference.width}%">{l s='Producto' d='Shop.Theme.Customeraccount'}</th>
                  <th class="product header title-text" width="{$layout.product.width}%">{l s='Servicio' d='Shop.Theme.Customeraccount'}</th>
                  <th class="product header title-text" width="{$layout.tax_code.width}%">{l s='Cantidad' d='Shop.Theme.Customeraccount'}</th>
                  <th class="product header title-text" width="{$layout.tax_code.width}%">{l s='Precio Total' d='Shop.Theme.Customeraccount'}</th>
                  <th class="product header title-text" width="{$layout.tax_code.width}%">{l s='Ganancia Madre' d='Shop.Theme.Customeraccount'}</th>
               </tr>
            </thead>
            <tbody id="table-product">
               
            </tbody>
         </table>
		</div>
      <div class="modal-footer">
         <div id="confirm-decline" class="row title-service">
            <h4 class="title-accept">{l s='Accept Service' d='Shop.Theme.Customeraccount'}</h4>
            <button type="button" id="decline" class="btn btn-danger btn-lg" data-dismiss="modal">{l s='Decline' d='Shop.Theme.Customeraccount'}</button>
            <button type="submit" id="success" class="btn btn-success btn-lg">{l s='Accept' d='Shop.Theme.Customeraccount'}</button>
            <div class="form-group" id="textDecline">
               <h4 class="title-accep" style="margin-top: 10px; color: #000;">{l s='reason not to accept' d='Shop.Theme.Customeraccount'}</h4>
               <textarea class="form-control" id="motiveDecline" rows="3"></textarea>
               <button type="button" id="confirmDecline" class="btn btn-danger btn-lg" data-dismiss="modal" style="margin-top: 10px;">{l s='Confirm Decline' d='Shop.Theme.Customeraccount'}</button>
            </div>
         </div>
         <div id="others-status" class="row title-service">
            <h4 class="title-accept">{l s='Estado' d='Shop.Theme.Customeraccount'}</h4>
            <select id="status_service" class="form-control form-control-select">
               <option value="7" disabled>---</option>
               <option value="4">Preparación en curso</option>
               <option value="5">Enviado</option>
            </select>
            <br>
            <button type="submit" id="confirm" class="btn btn-success btn-lg">{l s='Confirm' d='Shop.Theme.Customeraccount'}</button>
         </div>
         <div id="finalized-status" class="row title-service">
            <h4 class="title-accept">{l s='Finalizar' d='Shop.Theme.Customeraccount'}</h4>
            <button type="submit" id="finalized" class="btn btn-danger btn-lg">{l s='Confirm' d='Shop.Theme.Customeraccount'}</button>
         </div>
      </div>
	</div>
   </div>  
</div>

<script>
   function getServices(id, service_mom, id_mom, id_mom_order){
      $("#decline").attr("disabled", false);
      $("#textDecline").hide();
      $("#table-product").empty();
      $.ajax({
          method: "POST",
          url: "/ajax/ApiGetServiceDetails.php",
          data : {
            'id_order' : id,
            'service_mom': service_mom
          },
        }).done(function(response) {
            var obj = JSON.parse(response);

            var price = 0;
            var amount_total = 0;
            var id_order = obj[0].id_order;
            var date = obj[0].date_add;
            var state = obj[0].name_state;
            var total_products = obj[0].total_products;
            var reference = obj[0].reference;
            var type_payment = obj[0].payment_method;

            var dni = obj[0].dni;
            var name_customer = obj[0].customer_name;
            var email =  obj[0].email;
            var address_delivery = obj[0].address+", "+obj[0].city;
            var phone = obj[0].phone;
            var stratum = obj[0].stratum;

            var status_service = obj[0].status_service;
            
            $("#id_order").html(id_order);
            $("#reference_order").html(reference);
            $("#order_date_add").html(date);
            $("#order_state").html(state);
            $("#type_payment").html(type_payment);

            $("#customer_name").html(name_customer);
            $("#customer_dni").html(dni);
            $("#customer_email").html(email);
            $("#address_delivery").html(address_delivery);
            $("#phone_customer").html(phone);
            $("#stratum_customer").html(stratum);
            
            var keys = Object.keys(obj);
            for(let i = 0; i < keys.length; i++){
                  var product_name = obj[i].product_name;
                  var service = obj[i].name_service;
                  var price_unity = obj[i].product_price;
                  var detail_quantity = obj[i].product_quantity;
                  var id_order_detail = obj[i].id_order_detail;
                  var product_id = obj[i].product_id;
                  var total_price_tax_excl = obj[i].total_price_tax_excl;
                  var total_price_tax_incl = obj[i].total_price_tax_incl;
                  var payment_method = obj[i].payment_method;

                  var amount = 0;
                  switch (payment_method) {
                     case 'Pago contra reembolso':
                        price = parseInt(price) + parseInt(total_price_tax_incl);
                        amount = total_price_tax_excl;
                        break;

                     case 'Mercado Pago':
                        amount = total_price_tax_excl;
                        break;   
                  }

                  amount_total = parseInt(amount_total) + parseInt(amount);

                  $('#table-product').append('<tr><td class="text-table">' + product_name + '</td><td class="text-table">' + service + '</td><td class="text-table">' + detail_quantity +'</td><td class="text-table">$' + total_price_tax_incl +'</td><td class="text-table">$' + amount +'</td></tr>');
            }

            $("#total_price").html("$" + price);
            $("#amount_total").html("$" + amount_total);

            $("#confirm-decline").hide();
            $("#others-status").hide();
            $("#finalized-status").hide();
            $("#status_service").val(status_service);

            if ( status_service == 3 ) {
               $("#confirm-decline").show();
            }

            if ( status_service == 7 ) {
               $("#others-status").show();
            }

            if ( status_service == 4 || status_service == 5 ) {
               $("#others-status").show();
               $("#finalized-status").show();
            }


            $("#click_modal_servicesmom").click();
        });

         $("#decline").click(function(){
            $("#textDecline").show();
            $("#decline").attr("disabled", true);
         });

         $("#confirmDecline").click(function(){
            $.ajax({
               method: "POST",
               url: "/ajax/ApiDeclineServiceMom.php",
               data : {
                  'order' : id,
                  'mom' : id_mom,
                  'service' : service_mom
               },
            }).done(function(response) {
               location.reload();
            });
         });
         
         $("#success").click(function(){
            $.ajax({
               method: "POST",
               url: "/ajax/ApiConfirmServiceMom.php",
               data : {
                  'order' : id,
                  'mom' : id_mom,
                  'service' : service_mom
               },
            }).done(function(response) {
               location.reload();
            });
         });

         $("#confirm").click(function(){
            $.ajax({
               method: "POST",
               url: "/ajax/ApiChangeStatusServiceMom.php",
               data : {
                  'order' : id,
                  'service' : service_mom,
                  'status' : $('#status_service option').filter(':selected').val()
               },
            }).done(function(response) {
               location.reload();
            });
         });

         $("#finalized").click(function(){
            $.ajax({
               method: "POST",
               url: "/ajax/ApiFinalizedServiceMom.php",
               data : {
                  'order' : id,
                  'service' : service_mom
               },
            }).done(function(response) {
               location.reload();
            });
         });
      }
</script>    
{/block}