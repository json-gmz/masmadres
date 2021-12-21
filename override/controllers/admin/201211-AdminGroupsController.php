<?php

class AdminGroupsController extends AdminGroupsControllerCore
{
    public function renderView()
    {
        $this->context = Context::getContext();
        if (!($group = $this->loadObject(true))) {
            return;
        }

        $this->tpl_view_vars = array(
            'language' => $this->context->language,
            'customerList' => $this->renderCustomersList($group),
        );

        return parent::renderView();
    }

	protected function renderCustomersList($group)
    {
        $genders = array(0 => '?');
        $genders_icon = array('default' => 'unknown.gif');
        foreach (Gender::getGenders() as $gender) {
            /* @var Gender $gender */
            $genders_icon[$gender->id] = '../genders/' . (int) $gender->id . '.jpg';
            $genders[$gender->id] = $gender->name;
        }
        $this->table = 'customer_group';
        $this->lang = false;
        $this->list_id = 'customer_group';
        $this->actions = array();
        $this->addRowAction('view');
        $this->addRowAction('edit');
        $this->identifier = 'id_customer';
        $this->bulk_actions = false;
        $this->list_no_link = true;
        $this->explicitSelect = true;

        $this->fields_list = (array(
            'id_customer' => array(
                'title' => $this->trans('ID', array(), 'Admin.Global'),
                'align' => 'center',
                'filter_key' => 'c!id_customer',
                'class' => 'fixed-width-xs',
            ),
            'firstname' => array(
                'title' => $this->trans('First name', array(), 'Admin.Global'),
                'maxlength' => 30,
            ),
            'lastname' => array(
                'title' => $this->trans('Last name', array(), 'Admin.Global'),
                'maxlength' => 30,
            ),
            'email' => array(
                'title' => $this->trans('Email address', array(), 'Admin.Global'),
                'filter_key' => 'c!email',
                'orderby' => true,
                'maxlength' => 50,
            ),
            'service' => array(
                'title' => $this->trans('Service', array(), 'Admin.Global'),
                'filter_key' => 'l!name',
                'orderby' => true,
                'maxlength' => 50,
            ),
            'date_add' => array(
                'title' => $this->trans('Registration date', array(), 'Admin.Shopparameters.Feature'),
                'type' => 'date',
                'class' => 'fixed-width-md',
                'align' => 'center',
            ),
            'active' => array(
                'title' => $this->trans('Enabled', array(), 'Admin.Global'),
                'align' => 'center',
                'class' => 'fixed-width-sm',
                'type' => 'bool',
                'search' => false,
                'orderby' => false,
                'filter_key' => 'c!active',
                'callback' => 'printOptinIcon',
            ),
        ));

        $this->_select = 'c.*, l.name AS service, a.id_group';
        $this->_join = 'LEFT JOIN `' . _DB_PREFIX_ . 'customer` c ON (a.`id_customer` = c.`id_customer`) 
                        LEFT JOIN `' . _DB_PREFIX_ . 'category_lang` l ON (c.`service` = l.`id_category` AND l.`id_lang` = '.(int) $this->context->language->id.')';
        $this->_where = 'AND a.`id_group` = ' . (int) $group->id . ' AND c.`deleted` != 1';
        $this->_where .= Shop::addSqlRestriction(Shop::SHARE_CUSTOMER, 'c');

        self::$currentIndex = self::$currentIndex . '&id_group=' . (int) $group->id . '&viewgroup';

        $this->processFilter();

        return parent::renderList();
    }

	public function displayViewLink($token, $id)
    {
        $tpl = $this->createTemplate('helpers/list/list_action_view.tpl');
        if (!array_key_exists('View', self::$cache_lang)) {
            self::$cache_lang['View'] = $this->trans('View', array(), 'Admin.Actions');
        }

        $href = self::$currentIndex . '&' . $this->identifier . '=' . $id . '&update' . $this->table . '&token=' . ($token != null ? $token : $this->token);

        if ($this->display == 'view') {
            $href = Context::getContext()->link->getAdminLink('AdminCustomers', true, [], [
                'id_customer' => $id,
                'viewcustomer' => 1,
                'back' => urlencode($href),
            ]);
        }

        $tpl->assign(array(
            'href' => $href,
            'action' => self::$cache_lang['View'],
            'id' => $id,
        ));

        return $tpl->fetch();
    }
}