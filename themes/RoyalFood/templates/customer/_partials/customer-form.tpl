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
{block name='customer_form'}
  {block name='customer_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

  <div id="general_error" style="display: none;">
    <div class="alert-danger" style="border: 1px solid red; border-radius: 15px; margin-bottom: 15px; padding: 10px 10px;">{l s='Registro no exitoso. Por favor revisa los datos ingresados.' d='Shop.Theme.Customeraccount'}</div>
  </div>
  <div id="accordion">
    <div class="card card_mom">
      <div class="card-header" id="headingTwo" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        <h5 class="mb-0">
          <button class="btn btn-link collapsed">
            {l s='Mom' d='Shop.Theme.Customeraccount'}
            {if $customer.id == "" || $customer.id == "null" }
              <br>
              <small>{l s='Si eres madre, registrate acá' d='Shop.Theme.Customeraccount'}</small>
            {/if}
          </button>
        </h5>
      </div>
      <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
        <div class="card-body">
          <br>
          <form action="{block name='customer_form_actionurl'}{$action}{/block}" id="mom-form" class="js-customer-form" method="post" enctype="multipart/form-data">
            <section>
              {block "form_fields"}
                {foreach from=$formFields item="field"}
                  {block "form_field"}
                    {form_field field=$field}
                  {/block}
                {/foreach}
                <div class="form-group row">
                  <label class="col-md-3 form-control-label required">{l s='Phone' d='Shop.Theme.Customeraccount'}</label>
                  <div class="col-md-6">
                    <input type="text" name="phone_main" id="phone_main" class="form-control" onkeyup="this.value=this.value.replace(/[^\d]/,'')">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-md-3 form-control-label required">{l s='Service to provide' d='Shop.Theme.Customeraccount'}</label>
                  <div class="col-md-6">
                    <select class="form-control form-control-select" name="service" id="service">
                      <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
                      {foreach from=$categorias item=category key="value"}
                        <option value="{$category.id_category}">{$category.name}</option>
                      {/foreach}
                    </select>
                    <small>{l s="Este servicio podrás cambiarlo a futuro" d='Shop.Theme.Customeraccount'}</small>
                  </div>
                </div>
                <div class="form-group row list_products_service" style="text-align: left; display: none;">
                  <label class="col-md-3 form-control-label required">{l s='Productos para ofrecer' d='Shop.Theme.Customeraccount'}</label>
                  <div class="col-md-6">
                    {foreach from=$products_service item=product_service}
                      <div class="products_service product_service_category_{$product_service.id_category_default}">
                        <input type="checkbox" id="product_service_{$product_service.id_product}" class="products_service product_service_category_{$product_service.id_category_default}" name="products_service[]" value="{$product_service.id_product}"><label for="product_service_{$product_service.id_product}">&nbsp;{$product_service.name}</label>
                      </div>
                    {/foreach}
                  </div>
                </div>
                <div class="form-group row hidden-log">
                  <label class="col-md-3 form-control-label required">{l s='Identification document' d='Shop.Theme.Customeraccount'}</label>
                  <div class="col-md-6">
                    <label for="fileone" class="custom-file-upload"><i class="fa fa-cloud-upload"></i> Seleccionar Archivo</label>
                    <input class="form-control" id="fileone" name="fileone" type="file" accept="image/png, image/jpeg, image/jpg, application/pdf" style="display: none;">
                    <br>
                    <small>({l s='Ambas caras en un solo archivo' d='Shop.Theme.Customeraccount'})</small>
                    <br>
                    <label id="fileone-name" class="custom-file-name"></label>
                  </div>
                </div>
                <div class="form-group row hidden-log">
                  <label class="col-md-3 form-control-label required">{l s='Criminal record' d='Shop.Theme.Customeraccount'}</label>
                  <div class="col-md-6">
                    <label for="filetwo" class="custom-file-upload"><i class="fa fa-cloud-upload"></i> Seleccionar Archivo</label>
                    <input class="form-control" id="filetwo" name="filetwo" type="file" accept="image/png, image/jpeg, image/jpg, application/pdf" style="display: none;">
                    <br>
                    <label id="filetwo-name" class="custom-file-name"></label>
                  </div>
                </div>
                <div class="form-group row hidden-log">
                  <label class="col-md-3 form-control-label required">{l s='Professional card' d='Shop.Theme.Customeraccount'}</label>
                  <div class="col-md-6">
                    <label for="filetree" class="custom-file-upload"><i class="fa fa-cloud-upload"></i> Seleccionar Archivo</label>
                    <input class="form-control" id="filetree" name="filetree" type="file" accept="image/png, image/jpeg, image/jpg, application/pdf" style="display: none;">
                    <br>
                    <small>({l s='Opcional.' d='Shop.Theme.Customeraccount'} {l s='Solo si aplica' d='Shop.Theme.Customeraccount'})</small>
                    <br>
                    <label id="filetree-name" class="custom-file-name"></label>
                  </div>
                </div>
                <div class="form-group row hidden-log">
                  <label class="col-md-3 form-control-label required block-video-initial">
                    {l s='Initial video' d='Shop.Theme.Customeraccount'} o
                    <br>
                    {l s='Imagen de tu producto' d='Shop.Theme.Customeraccount'}
                  </label>
                  <div class="col-md-6">
                    <label for="filefour" class="custom-file-upload"><i class="fa fa-cloud-upload"></i> Seleccionar Archivo</label>
                    <input class="form-control" id="filefour" name="filefour" type="file" accept="video/mp4, video/x-m4v, video/*, image/png, image/jpeg, image/jpg" style="display: none;">
                    <br>
                    <small>({l s='Opcional.' d='Shop.Theme.Customeraccount'} {l s='Maximum video size 1 minute' d='Shop.Theme.Customeraccount'})</small>
                    <br>
                    <label id="filefour-name" class="custom-file-name"></label>
                  </div>
                </div>
                <div class="row hidden-log">
                    <label class="col-md-3 form-control-label"></label>
                    <div class="col-md-6">
                          <span class="custom-checkbox">
                            <input name="accept-terms" id="accept-terms" type="checkbox" value="1">
                            <span><i class="material-icons checkbox-checked"></i></span>
                            <label>
                              <a href="/content/2-politica-de-privacidad" title="Nuestra política de privacidad">
                                {l s='I accept the treatment of my data and files by + Madres' d='Shop.Theme.Customeraccount'}
                              </a>
                            </label>
                          </span>
                    </div>
                    <div class="col-md-3 form-control-comment">
                    </div>
                </div>
                <div class="row hidden-log">
                    <label class="col-md-3 form-control-label"></label>
                    <div class="col-md-6">
                          <span class="custom-checkbox">
                            <input name="terms-mom" id="terms-mom" type="checkbox" value="1">
                            <span><i class="material-icons checkbox-checked"></i></span>
                            <label>
                              <a id="link-cms-page-3-2" class="cms-page-link" href="/content/3-terminos-y-condiciones-de-uso" title="Nuestros términos y condiciones">
                                {l s='I accept Terms and conditions' d='Shop.Theme.Customeraccount'}
                              </a>
                            </label>
                          </span>
                    </div>
                    <div class="col-md-3 form-control-comment">
                    </div>
                </div>
                {$hook_create_account_form nofilter}
              {/block}
            </section>

            {block name='customer_form_footer'}
              <footer class="form-footer clearfix">
                <input type="hidden" name="submitCreate" value="1">
                <input type="hidden" name="momRegister" value="2">
                {block "form_buttons"}
                  <button id="save-mom" class="btn btn-primary form-control-submit float-xs-right" data-link-action="save-customer" type="submit" disabled>
                    {l s='Save' d='Shop.Theme.Actions'}
                  </button>
                {/block}
              </footer>
            {/block}
          </form>
        </div>
      </div>
    </div>
    <div class="card card_user">
      <div class="card-header" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        <h5 class="mb-0">
          <button class="btn btn-link">
            {l s='User' d='Shop.Theme.Customeraccount'}
            {if $customer.id == "" || $customer.id == "null" }
              <br>
              <small>{l s='Si vas a comprar a nuestras Madres registrate acá' d='Shop.Theme.Customeraccount'}</small>
            {/if}
          </button>
        </h5>
      </div>
      <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
        <div class="card-body">
          <br>
          <form action="{block name='customer_form_actionurl'}{$action}{/block}" id="customer-form" class="js-customer-form" method="post">
            <section>
              {block "form_fields"}
                <div id="block_fields_user">
                  {foreach from=$formFields item="field"}
                    {block "form_field"}
                      {form_field field=$field}
                    {/block}
                  {/foreach}
                </div>
                <div class="form-group row" id="block-phone-main">
                  <label class="col-md-3 form-control-label required">{l s='Phone' d='Shop.Theme.Customeraccount'}</label>
                  <div class="col-md-6">
                    <input type="text" name="phone_main" id="phone_main" class="form-control" onkeyup="this.value=this.value.replace(/[^\d]/,'')">
                  </div>
                </div>
                {$hook_create_account_form nofilter}
                <div class="form-group row hidden-log">
                    <label class="col-md-3 form-control-label"></label>
                    <div class="col-md-6">
                          <span class="custom-checkbox">
                            <input name="terms" id="terms" type="checkbox" value="1">
                            <span><i class="material-icons checkbox-checked"></i></span>
                            <label for="terms">
                              Acepto que he leído y entiendo los <a id="link-cms-page-3-2" class="cms-page-link" target="_blank" href="/content/3-terminos-y-condiciones-de-uso">términos y condiciones</a> del servicio junto con la <a id="link-cms-page-3-2" class="cms-page-link" target="_blank" href="/content/2-politica-de-privacidad">política de tratamiento de datos personales</a>.
                            </label>
                          </span>
                    </div>
                    <div class="col-md-3 form-control-comment">
                    </div>
                </div>
              {/block}
            </section>

            {block name='customer_form_footer'}
              <footer class="form-footer clearfix">
                <input type="hidden" name="submitCreate" value="1">
                {block "form_buttons"}
                  <button id="save" class="btn btn-primary form-control-submit float-xs-right" data-link-action="save-customer" type="submit" disabled>
                    {l s='Save' d='Shop.Theme.Actions'}
                  </button>
                {/block}
              </footer>
            {/block}
          </form>
        </div>
      </div>
    </div>
  </div>

{if $customer.service > 0}
  <script>
      $(function() {
        var products_services = "{$customer.product_service}";
        var service_data = "{$customer.service}";

        $(".products_service").hide();
        $("#service").val(service_data);

        if ( products_services != "" ) {
          products_services = products_services.split(',');
          $.each( products_services, function( index, value ) {
            $("#product_service_"+value).attr("checked","checked");
          });
        }

        $(".product_service_category_"+service_data).show();
        $(".list_products_service").show();
      });
  </script>
{/if}

  <script>
    $(function() {
      $("input[name='dni']").attr("type","text");
      $("input[name='dni']").attr("onkeyup","this.value=this.value.replace(/[^\\d]/,'')");
      $("input[name='optin']").parents(".form-group").hide();
      $("#mom-form").find(".custom-checkbox").parents(".form-group").hide();
      $("#mom-form").find("input[name='id_gender'][value='2']").click();
      $("#mom-form").find("input[name='id_gender']").parents(".form-group").hide();
      $("#mom-form").find(".cms-page-link").attr("href", "/content/6-terminos-y-condiciones-para-madres");
      $("#mom-form").find(".cms-page-link").html("Acepto términos y condiciones para madres");
      $("input[name='phone_main']").val("{$customer.phone_main}");
    });
  </script>
  <script type="text/javascript">
    $('#terms').click(function(){
        if($(this).is(':checked')){
            $('#save').attr("disabled", false);
        } else{
            $('#save').attr("disabled", true);
        }
    }); 

    $("#accept-terms, #terms-mom").on("click", function(){
      if ($("#accept-terms").is(":checked") && $("#terms-mom").is(":checked") && $("#fileone").get(0).files.length != 0 && $("#filetwo").get(0).files.length != 0) {
          $("#save-mom").attr("disabled", false);
        } else{
          $('#save-mom').attr("disabled", true);
        }
    });
  </script>

  {literal}
  <script>
    function validateEmail(email) {
      const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return re.test(String(email).toLowerCase());
    }
  </script>
  {/literal}

  <script>
    $(document).ready(function () {

        $('input[name ="firstname"]').focusout(function(){
          var firstname = $(this).val();
          const pattern = new RegExp('^[A-Z ]+$', 'i');

          if(!pattern.test(firstname)){
            $('div #name_failed').empty();
            $('div #name_ok').empty();
            $('input[name ="firstname"]').after('<div id="name_failed" style="color:red;">Por favor ingrese un Nombre valido</div>');
            $(this).css("border-color", "red");
          }
          else{
            $('div #name_failed').empty();
            $('div #name_ok').empty();
            $('input[name ="firstname"]').after('<div id="name_ok" style="color:green;">Nombre Valido</div>');
            $(this).css("border-color", "green");
          }
        });

        $('input[name ="lastname"]').focusout(function(){
          var lastname = $(this).val();
          const pattern = new RegExp('^[A-Z ]+$', 'i');

          if(!pattern.test(lastname)){
            $('div #lastname_failed').empty();
            $('div #lastname_ok').empty();
            $('input[name ="lastname"]').after('<div id="lastname_failed" style="color:red;">Por favor ingrese un Apellido valido</div>');
            $(this).css("border-color", "red");
          }
          else{
            $('div #lastname_failed').empty();
            $('div #lastname_ok').empty();
            $('input[name ="lastname"]').after('<div id="lastname_ok" style="color:green;">Apellido Valido</div>');
            $(this).css("border-color", "green");
          }
        });

        $('input[name ="email"]').focusout(function(){
          var email = $(this).val();

          if(!validateEmail(email)){
            $('div #email_failed').empty();
            $('div #email_ok').empty();
            $('input[name ="email"]').after('<div id="email_failed" style="color:red;">Por favor ingrese un Email valido</div>');
            $(this).css("border-color", "red");
          }
          else{
            $('div #email_failed').empty();
            $('div #email_ok').empty();
            $('input[name ="email"]').after('<div id="email_ok" style="color:green;">Email Valido</div>');
            $(this).css("border-color", "green");
          }
        });

        $("#fileone").change(function(){
          $("#fileone-name").text(this.files[0].name);
        });

        $("#filetwo").change(function(){
          $("#filetwo-name").text(this.files[0].name);
        });

        $("#filetree").change(function(){
          $("#filetree-name").text(this.files[0].name);
        });

        $("#filefour").change(function(){
          $("#filefour-name").text(this.files[0].name);
        });

        $("#service").change(function(){
          $(".products_service").hide();
          $(".products_service").removeAttr('checked');

          $(".product_service_category_"+$("#service").val()).show();
          
          $(".list_products_service").show();
        });

        $(".card_mom").find("select[name='typedni'] option[value='Pasaporte']").remove();

        var initial_block_phone_main = $("#block-phone-main");
        initial_block_phone_main.clone().insertAfter("#block_fields_user>.form-group:nth-last-child(3)");
        initial_block_phone_main.remove();

        if ( $('.alert:not(.js-error)').length && $('.alert-success').length < 1 ) {
          $("#general_error").show();
        }

    });
  </script>
{/block}