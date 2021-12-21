<?php
/* Smarty version 3.1.33, created on 2021-12-20 22:05:15
  from 'C:\xampp\htdocs\masmadres\themes\RoyalFood\templates\page.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_61c1446b536c48_98240164',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f78a06383de662766591512c2ab454d606a1107f' => 
    array (
      0 => 'C:\\xampp\\htdocs\\masmadres\\themes\\RoyalFood\\templates\\page.tpl',
      1 => 1590886748,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_61c1446b536c48_98240164 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_46286382161c1446b525c77_34163444', 'content');
?>

<?php $_smarty_tpl->inheritance->endChild($_smarty_tpl, $_smarty_tpl->tpl_vars['layout']->value);
}
/* {block 'page_title'} */
class Block_185725418361c1446b528067_36099322 extends Smarty_Internal_Block
{
public $callsChild = 'true';
public $hide = 'true';
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

        <header class="page-header">
          <h1><?php 
$_smarty_tpl->inheritance->callChild($_smarty_tpl, $this);
?>
</h1>
        </header>
      <?php
}
}
/* {/block 'page_title'} */
/* {block 'page_header_container'} */
class Block_146723647461c1446b527294_72893590 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

      <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_185725418361c1446b528067_36099322', 'page_title', $this->tplIndex);
?>

    <?php
}
}
/* {/block 'page_header_container'} */
/* {block 'page_content_top'} */
class Block_121808229661c1446b530b55_75852395 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
}
}
/* {/block 'page_content_top'} */
/* {block 'page_content'} */
class Block_83015474161c1446b531a83_80935752 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

          <!-- Page content -->
        <?php
}
}
/* {/block 'page_content'} */
/* {block 'page_content_container'} */
class Block_105510290761c1446b5301b8_62290117 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

      <section id="content" class="page-content card card-block">
        <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_121808229661c1446b530b55_75852395', 'page_content_top', $this->tplIndex);
?>

        <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_83015474161c1446b531a83_80935752', 'page_content', $this->tplIndex);
?>

      </section>
    <?php
}
}
/* {/block 'page_content_container'} */
/* {block 'page_footer'} */
class Block_195697933861c1446b535163_75143704 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

          <!-- Footer content -->
        <?php
}
}
/* {/block 'page_footer'} */
/* {block 'page_footer_container'} */
class Block_20356826761c1446b534749_05491041 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

      <footer class="page-footer">
        <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_195697933861c1446b535163_75143704', 'page_footer', $this->tplIndex);
?>

      </footer>
    <?php
}
}
/* {/block 'page_footer_container'} */
/* {block 'content'} */
class Block_46286382161c1446b525c77_34163444 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'content' => 
  array (
    0 => 'Block_46286382161c1446b525c77_34163444',
  ),
  'page_header_container' => 
  array (
    0 => 'Block_146723647461c1446b527294_72893590',
  ),
  'page_title' => 
  array (
    0 => 'Block_185725418361c1446b528067_36099322',
  ),
  'page_content_container' => 
  array (
    0 => 'Block_105510290761c1446b5301b8_62290117',
  ),
  'page_content_top' => 
  array (
    0 => 'Block_121808229661c1446b530b55_75852395',
  ),
  'page_content' => 
  array (
    0 => 'Block_83015474161c1446b531a83_80935752',
  ),
  'page_footer_container' => 
  array (
    0 => 'Block_20356826761c1446b534749_05491041',
  ),
  'page_footer' => 
  array (
    0 => 'Block_195697933861c1446b535163_75143704',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>


  <section id="main">

    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_146723647461c1446b527294_72893590', 'page_header_container', $this->tplIndex);
?>


    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_105510290761c1446b5301b8_62290117', 'page_content_container', $this->tplIndex);
?>


    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_20356826761c1446b534749_05491041', 'page_footer_container', $this->tplIndex);
?>


  </section>

<?php
}
}
/* {/block 'content'} */
}
