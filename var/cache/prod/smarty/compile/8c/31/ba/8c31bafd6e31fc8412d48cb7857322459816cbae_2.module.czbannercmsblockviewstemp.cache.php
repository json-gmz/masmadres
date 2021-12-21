<?php
/* Smarty version 3.1.33, created on 2021-12-20 22:05:14
  from 'module:czbannercmsblockviewstemp' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_61c1446a9e2e25_26032485',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8c31bafd6e31fc8412d48cb7857322459816cbae' => 
    array (
      0 => 'module:czbannercmsblockviewstemp',
      1 => 1602132554,
      2 => 'module',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_61c1446a9e2e25_26032485 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->compiled->nocache_hash = '46981678961c1446a96cac2_55821436';
?>

<div id="czbannercmsblock" class="block czbanners"> 
	<div class="czbanner_container container">
		<?php echo $_smarty_tpl->tpl_vars['czbannercmsblockinfos']->value['text'];?>

	</div> 
</div>
<?php }
}
