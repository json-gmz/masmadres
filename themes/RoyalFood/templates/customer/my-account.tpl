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
{extends file='customer/page.tpl'}

{block name='page_title'}
    {l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <div class="row">
    <div class="links">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" id="balance_score">
          <span class="title_balance">{l s='Balance Score: ' d='Shop.Theme.Customeraccount'}</span>
          {if $customer.balance|string_format:"%.3f" == 0}
            <span class="balance-style balance_equal">{{$customer.balance|string_format:"%.0f"}}</span>
          {else if $customer.balance|string_format:"%.3f" > 0}
            <span class="balance-style balance_positive">{{$customer.balance|string_format:"%.0f"}}</span>
          {else}
            <span class="balance-style balance_negative">{{$customer.balance|string_format:"%.0f"}}</span>
          {/if}
          <button id="btn-details-moves" class="btn btn-primary" data-toggle="modal" data-target="#modalHistoryMovesBalance">{l s='Detalles' d='Shop.Theme.Customeraccount'} <i class="material-icons">information</i></button>
      </div>
      {if $customer.id_default_group == 10}
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 session_expire" style="display: none;">
          <span class="title_balance">{l s='Su sesión expira en:' d='Shop.Theme.Customeraccount'} </span>
          <span id="session_expire"></span>
          <br>
          <small>{l s='Si se registra inactividad' d='Shop.Theme.Customeraccount'}</small>
        </div>
      {/if}
      <a class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="identity-link" href="{$urls.pages.identity}">
        <span class="link-item">
          <i class="material-icons">&#xE853;</i>
          {l s='Information' d='Shop.Theme.Customeraccount'}
        </span>
      </a>

      {if $customer.addresses|count}
        <a class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="addresses-link" href="{$urls.pages.addresses}">
          <span class="link-item">
            <i class="material-icons">&#xE56A;</i>
            {l s='Addresses' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {else}
        <a class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="address-link" href="{$urls.pages.address}">
          <span class="link-item">
            <i class="material-icons">&#xE567;</i>
            {l s='Add first address' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {if !$configuration.is_catalog}
        <a class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="history-link" href="{$urls.pages.history}">
          <span class="link-item">
            <i class="material-icons">&#xE916;</i>
            {l s='Order history and details' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {if !$configuration.is_catalog}
        <a class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="order-slips-link" href="{$urls.pages.order_slip}">
          <span class="link-item">
            <i class="material-icons">&#xE8B0;</i>
            {l s='Credit slips' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {if $configuration.voucher_enabled && !$configuration.is_catalog}
        <a class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="discounts-link" href="{$urls.pages.discount}">
          <span class="link-item">
            <i class="material-icons">&#xE54E;</i>
            {l s='Vouchers' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {if $configuration.return_enabled && !$configuration.is_catalog}
        <a class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="returns-link" href="{$urls.pages.order_follow}">
          <span class="link-item">
            <i class="material-icons">&#xE860;</i>
            {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {block name='display_customer_account'}
        {hook h='displayCustomerAccount'}
      {/block}

    </div>
    <div class="row panel-desactive" id="switch-log" name="switch-log">
      <div class="col-lg-6">
        <i class="material-icons">&#xe035;</i>
        <label>{l s='Activate/Deactivate Service Availability' d='Shop.Theme.Customeraccount'}</label>
      </div>
      <div class="service-switch col-lg-6">
        <label class="switch">  
          <input type="checkbox" id="togBtn" value="false" name="switch-input">  
          <div class="slider round"></div>  
        </label> 
      </div>
    </div>

    <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12" id="terms-conditions-mothers">
      <br>
      <div class="text-sm-center">
        <a href="/content/6-terminos-y-condiciones-para-madres">
          {l s='Terms and conditions for mothers' d='Shop.Theme.Customeraccount'}
        </a>
      </div>
    </div>
  </div>

  <div class="modal fade" id="modalHistoryMovesBalance" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header text-center">
          <h4 class="modal-title w-100 font-weight-bold">{l s='Detalles del balance' d='Shop.Theme.Customeraccount'}</h4>
          <button type="button" id="close" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body mx-1">
          <div class="md-form mb-5">
            <table class="history_moves_balance" width="100%" cellpadding="8" cellspacing="0">
              <thead>
                <tr class="header-table">
                  <th class="move_balance header title-text">Orden</th>
                  <th class="move_balance header title-text">Referencia</th>
                  <th class="move_balance header title-text">Pago</th>
                  {*<th class="move_balance header title-text">Cantidad</th>*}
                  <th class="move_balance header title-text">Precio Total</th>
                  <th class="move_balance header title-text">Ganancia Madre</th>
                  <th class="move_balance header title-text">Balance Madre</th>
                  <th class="move_balance header title-text">Fecha</th>
                  <th class="move_balance header title-text">Comentarios</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$history_moves_balance item=move_balance}
                  <tr class="move_balance detail_{$move_balance.type}">
                    <td class="center">
                      {if $move_balance.id_order != 0} {$move_balance.id_order} {else} - {/if}
                    </td>
                    <td class="center">
                      {if $move_balance.reference != ""} {$move_balance.reference} {else} - {/if}
                    </td>
                    <td class="center">
                      {$move_balance.payment}
                    </td>
                    {*<td class="center">
                      {if $move_balance.product_quantity > 0} {$move_balance.product_quantity|round:0} {else} - {/if}
                    </td>*}
                    <td class="center">
                      {if $move_balance.total_price_tax_incl > 0} ${$move_balance.total_price_tax_incl|round:0} {else} - {/if}
                    </td>
                    <td class="center">
                      {if $move_balance.total_price_tax_excl > 0} ${$move_balance.total_price_tax_excl|round:0} {else} - {/if}
                    </td>
                    <td class="center">
                      ${$move_balance.amount|round:0}
                    </td>
                    <td class="center">
                      {$move_balance.date_generate}
                    </td>
                    <td class="center">
                      {$move_balance.commets}
                    </td>
                  </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        </div>
        <div class="modal-footer d-flex justify-content-center"></div>
      </div>
    </div>
  </div>
  <script>
    function hideBlockSessionExpire() {
      if ( $("#togBtn").is(':checked') ) {
        $(".session_expire").show();
      }
    }

    $(function() {
      hideBlockSessionExpire();
      setTimeout(function(){ hideBlockSessionExpire(); }, 1000);
      setTimeout(function(){ hideBlockSessionExpire(); }, 2000);
      setTimeout(function(){ hideBlockSessionExpire(); }, 3000);
    });

    // Set the date we're counting down to
    var countDownDate = new Date("{$session_expire_date}").getTime();

    // Update the count down every 1 second
    var x = setInterval(function() {

      // Get today's date and time
      var now = new Date().getTime();
        
      // Find the distance between now and the count down date
      var distance = countDownDate - now;
        
      // Time calculations for days, hours, minutes and seconds
      var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
      // Output the result in an element with id="session_expire"
      document.getElementById("session_expire").innerHTML = /*days + "d " +*/ hours + "h " + minutes + "m " + seconds + "s ";
        
      // If the count down is over, write some text 
      if (distance < 0) {
        clearInterval(x);
        document.getElementById("session_expire").innerHTML = "EXPIRED";
      }
    }, 1000);
  </script>
{/block}

{block name='page_footer'}
  {block name='my_account_links'}
    <div class="text-sm-center">
      <a href="{$logout_url}" >
        {l s='Sign out' d='Shop.Theme.Actions'}
      </a>
    </div>
  {/block}
{/block}