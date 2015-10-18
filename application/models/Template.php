<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Template extends CI_Model{

    public function __construct()
    {
        parent::__construct();

        //determiner for current page detection in templates
        switch($this->router->fetch_class()){
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