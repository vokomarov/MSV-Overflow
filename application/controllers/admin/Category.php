<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Category extends CI_Controller{

    public function __construct(){
        parent::__construct();
        if(!$this->user_model->is_logged || !$this->user_model->checkUserGroup('1,2')){
            redirect('/', 'location', 301);
        }
    }

    //list all question
    public function index()
    {
        $this->tpl->compile('admin/category/index.tpl');
    }

    public function add(){
        $this->tpl->compile('admin/category/add.tpl');
    }

    public function edit($id = false){
        $this->tpl->compile('admin/category/edit.tpl');
    }
}