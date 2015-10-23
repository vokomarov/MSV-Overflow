<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller{



    public function index()
    {
        $this->tpl->compile('admin/dashboard.tpl');
    }

    public function setting(){
        $this->tpl->compile('admin/setting.tpl');
    }
}