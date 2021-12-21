<?php
/* Smarty version 3.1.33, created on 2021-12-20 22:05:14
  from 'module:czparallaxcmsblockviewste' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_61c1446acf5925_09121674',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4820d528e634f30c6a151de05035b312c99a1211' => 
    array (
      0 => 'module:czparallaxcmsblockviewste',
      1 => 1602132555,
      2 => 'module',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_61c1446acf5925_09121674 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->compiled->nocache_hash = '20728154761c1446acf2d82_55615652';
?>

<div id="czparallaxcmsblock" class="block czparallax">
	<div class="parallax czparallax_1" data-source-url="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['image_url']->value, ENT_QUOTES, 'UTF-8');?>
/parallax-bg.jpg">
		<div class="parallax_container container">
			<?php echo $_smarty_tpl->tpl_vars['czparallaxcmsblockinfos']->value['text'];?>

		</div>
	</div>
</div>
<?php }
}
