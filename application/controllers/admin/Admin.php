<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Class Admin
 *
 * @permission
 * -Dashboard   - 1,2
 * -Setting     - 1
 */
class Admin extends CI_Controller{

    public function __construct(){
        parent::__construct();
        if(!$this->user_model->is_logged || !$this->user_model->checkUserGroup('1,2')){
            redirect('/', 'location', 301);
        }
    }

    public function index()
    {
        $this->tpl->compile('admin/dashboard.tpl');
    }

    public function setting(){

        if(!$this->user_model->checkUserGroup('1')){
            redirect('/', 'location', 301);
        }

        $this->tpl->compile('admin/setting.tpl');
    }
}