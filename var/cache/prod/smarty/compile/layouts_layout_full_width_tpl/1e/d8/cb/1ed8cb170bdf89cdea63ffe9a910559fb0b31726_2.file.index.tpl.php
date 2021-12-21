<?php
/* Smarty version 3.1.33, created on 2021-12-20 22:05:15
  from 'C:\xampp\htdocs\masmadres\themes\RoyalFood\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_61c1446b2c8fd2_13963298',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1ed8cb170bdf89cdea63ffe9a910559fb0b31726' => 
    array (
      0 => 'C:\\xampp\\htdocs\\masmadres\\themes\\RoyalFood\\templates\\index.tpl',
      1 => 1591240614,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_61c1446b2c8fd2_13963298 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_12439053761c1446b2a8e73_95538309', 'page_content_container');
?>

	
	
<?php $_smarty_tpl->inheritance->endChild($_smarty_tpl, 'page.tpl');
}
/* {block 'page_content_top'} */
class Block_157246691761c1446b2a9f02_52259132 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
}
}
/* {/block 'page_content_top'} */
/* {block 'hook_home'} */
class Block_51668963161c1446b2c69a6_51271482 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

            <?php echo $_smarty_tpl->tpl_vars['HOOK_HOME']->value;?>

          <?php
}
}
/* {/block 'hook_home'} */
/* {block 'page_content'} */
class Block_73924147161c1446b2c5fc4_68339243 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

          <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_51668963161c1446b2c69a6_51271482', 'hook_home', $this->tplIndex);
?>

     <?php
}
}
/* {/block 'page_content'} */
/* {block 'page_content_container'} */
class Block_12439053761c1446b2a8e73_95538309 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'page_content_container' => 
  array (
    0 => 'Block_12439053761c1446b2a8e73_95538309',
  ),
  'page_content_top' => 
  array (
    0 => 'Block_157246691761c1446b2a9f02_52259132',
  ),
  'page_content' => 
  array (
    0 => 'Block_73924147161c1446b2c5fc4_68339243',
  ),
  'hook_home' => 
  array (
    0 => 'Block_51668963161c1446b2c69a6_51271482',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

<section id="content" class="page-home">
	<div class="container"> 
		<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_157246691761c1446b2a9f02_52259132', 'page_content_top', $this->tplIndex);
?>

	</div>
	
	<section class="cz-hometabcontent">
		<div class="container"> 
				<h2 class="h1 products-section-title text-uppercase"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>"Summer's Best",'d'=>'Shop.Theme.Global'),$_smarty_tpl ) );?>
</h2>
				<div class="tabs">
					<ul id="home-page-tabs" class="nav nav-tabs clearfix">
						<li class="nav-item">
							<a data-toggle="tab" href="#featureProduct" class="nav-link active" data-text="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Featured products','d'=>'Shop.Theme.Global'),$_smarty_tpl ) );?>
">
								<span><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Featured','d'=>'Shop.Theme.Global'),$_smarty_tpl ) );?>
</span>
							</a>
						</li>
						<li class="nav-item">
							<a data-toggle="tab" href="#newProduct" class="nav-link" data-text="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'New products','d'=>'Shop.Theme.Global'),$_smarty_tpl ) );?>
">
								<span><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Latest','d'=>'Shop.Theme.Global'),$_smarty_tpl ) );?>
</span>
							</a>
						</li>
						<li class="nav-item">
							<a data-toggle="tab" href="#bestseller" class="nav-link" data-text="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Best Sellers','d'=>'Shop.Theme.Global'),$_smarty_tpl ) );?>
">
								<span><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Best Sellers','d'=>'Shop.Theme.Global'),$_smarty_tpl ) );?>
</span>
							</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="featureProduct" class="cz_productinner tab-pane active">	
							<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayCzFeature'),$_smarty_tpl ) );?>

						</div>
						<div id="newProduct" class="cz_productinner tab-pane">
							<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayCzNew'),$_smarty_tpl ) );?>

						</div>
						<div id="bestseller" class="cz_productinner tab-pane">
							<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayCzBestseller'),$_smarty_tpl ) );?>

						</div>
					</div>					
				</div>
			</div>
	</section>
	
	 <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_73924147161c1446b2c5fc4_68339243', 'page_content', $this->tplIndex);
?>

	
</section>
<?php
}
}
/* {/block 'page_content_container'} */
}
