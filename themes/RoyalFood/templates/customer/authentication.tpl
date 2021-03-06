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
{extends file='page.tpl'}

{*block name='page_title'}
  {l s='Log in to your account' d='Shop.Theme.Customeraccount'}
{/block*}

{block name='page_content'}
    <h1>{l s='Log in to your account' d='Shop.Theme.Customeraccount'}</h1>
    <hr>
    <div class="no-account register-link">
      <a href="{$urls.pages.register}" data-link-action="display-register-form">
        {l s='No account? Create one here' d='Shop.Theme.Customeraccount'}
      </a>
    </div>
    <br>
    <div id="accordion">
      <div class="card">
        <div class="card-header" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <h5 class="mb-0">
            <button class="btn btn-link">
              {l s='User And Mom' d='Shop.Theme.Customeraccount'}
            </button>
          </h5>
        </div>
        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
          <div class="card-body">
            <br>
            {block name='login_form_container'}
              <section class="login-form" id="login-mothers">
                {render file='customer/_partials/login-form.tpl' ui=$login_form}
              </section>
              <hr/>
              {block name='display_after_login_form'}
                {hook h='displayCustomerLoginFormAfter'}
              {/block}
            {/block}
          </div>
        </div>
      </div>
    </div>
    <script>
      $(function() {
        $("#headingOne").click();
      });
    </script>
{/block}
