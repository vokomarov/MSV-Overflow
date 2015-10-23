<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Category extends CI_Controller{

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