<?php
/* Smarty version 3.1.33, created on 2021-12-20 22:05:18
  from 'C:\xampp\htdocs\masmadres\themes\RoyalFood\templates\_partials\header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_61c1446eacf308_99457773',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '911e154adba79d3bb5712af31ba9f9f2abb48da7' => 
    array (
      0 => 'C:\\xampp\\htdocs\\masmadres\\themes\\RoyalFood\\templates\\_partials\\header.tpl',
      1 => 1617407511,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:../maps/modal.tpl' => 1,
  ),
),false)) {
function content_61c1446eacf308_99457773 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, false);
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_164865472561c1446eab94e4_20688025', 'header_banner');
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_128059276961c1446eabc879_20032532', 'header_nav');
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_50527486861c1446eac9328_72228538', 'header_top');
}
/* {block 'header_banner'} */
class Block_164865472561c1446eab94e4_20688025 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'header_banner' => 
  array (
    0 => 'Block_164865472561c1446eab94e4_20688025',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

  <div class="header-banner">
    <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayBanner'),$_smarty_tpl ) );?>

  </div>
<?php
}
}
/* {/block 'header_banner'} */
/* {block 'header_nav'} */
class Block_128059276961c1446eabc879_20032532 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'header_nav' => 
  array (
    0 => 'Block_128059276961c1446eabc879_20032532',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

<?php echo '<script'; ?>
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"><?php echo '</script'; ?>
>
<nav class="header-nav">
	<div class="container">
			<input type="hidden" value="<?php ob_start();
echo htmlspecialchars($_smarty_tpl->tpl_vars['customer']->value['id_default_group'], ENT_QUOTES, 'UTF-8');
$_prefixVariable1 = ob_get_clean();
echo htmlspecialchars($_prefixVariable1, ENT_QUOTES, 'UTF-8');?>
" id="id_group" />
			<?php if ($_smarty_tpl->tpl_vars['customer']->value['id_default_group'] != 10) {?>
	        	<div class="address-nav">
	        		<?php if ($_COOKIE['address'] == '' || $_COOKIE['stratum'] == '') {?>
	        			<div id="select-address" class="address-block">Seleccionar ubicación <i style="font-size:24px" class="fa">&#xf041;</i></div>
	        		<?php } else { ?>
	        			<div id="change-address" class="address-block"><?php echo htmlspecialchars($_COOKIE['address'], ENT_QUOTES, 'UTF-8');?>
 <i style="font-size:24px" class="fa">&#xf041;</i></div>
	        		<?php }?>
	        	</div>
	        <?php }?>
					<div class="left-nav">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayNav1'),$_smarty_tpl ) );?>

			</div>
			
			<div class="right-nav">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayNav2'),$_smarty_tpl ) );?>

			</div>
				
		        <?php echo '<script'; ?>
> $(".address-block").on("click", function() { startModalAddress(true); }); <?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
>
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
        <?php echo '</script'; ?>
>
	</div>
</nav>
<nav class="header-nav" id="nav-message-alert">
	<center>
		<i class="fa fa-exclamation-circle"></i>
		Recuerda cerrar tu sesión cuando no estés trabajando, así, evitaremos incumplirle a nuestros clientes
		<i class="fa fa-exclamation-circle"></i>
	</center>
</nav>
<?php
}
}
/* {/block 'header_nav'} */
/* {block 'header_top'} */
class Block_50527486861c1446eac9328_72228538 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'header_top' => 
  array (
    0 => 'Block_50527486861c1446eac9328_72228538',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<div class="header-top">
		<div class="container">
			<div class="header_logo">
				<a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['urls']->value['base_url'], ENT_QUOTES, 'UTF-8');?>
">
				<img class="logo img-responsive" src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['logo'], ENT_QUOTES, 'UTF-8');?>
" alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['name'], ENT_QUOTES, 'UTF-8');?>
">
				</a>
			</div>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayTop'),$_smarty_tpl ) );?>

			
		</div>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayNavFullWidth'),$_smarty_tpl ) );?>

	</div>
	<input id="customerLoggedId" name="customerLoggedId" type="hidden" value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['customer']->value['id'], ENT_QUOTES, 'UTF-8');?>
" />
	<?php $_smarty_tpl->_subTemplateRender('file:../maps/modal.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
/* {/block 'header_top'} */
}
