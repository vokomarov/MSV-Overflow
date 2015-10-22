<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Template extends CI_Model{

    public function __construct()
    {
        parent::__construct();

        //associated controller, method with real name in template
        $named = array(
            'admin' => array(
                'index' => 'Dashboard',
                'categories' => 'All categories',
                'add_category' => 'Add category',

            ),
            'welcome' => 'MSV Overflow'

        );
        $this->tpl->set('menu', $named);

        //determiner for current page detection in templates
        $current_controller = $this->router->fetch_class();
        $this->tpl->set('current_controller', $current_controller);

        $current_method = $this->router->fetch_method();
        $this->tpl->set('current_method', $current_method);

        switch($current_controller){
            case 'admin':
                $this->tpl->set('is_admin', 1);
                break;
            case 'welcome':
                $this->tpl->set('is_home', 1);
                break;
            default:
                break;
        }
    }

}