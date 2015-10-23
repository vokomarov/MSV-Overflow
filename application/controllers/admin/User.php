<?php defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller{

    //list all question
    public function index()
    {
        $this->tpl->compile('admin/user/index.tpl');
    }

    public function add(){
        $this->tpl->compile('admin/user/add.tpl');
    }

    public function edit($id = false){
        $this->tpl->compile('admin/user/edit.tpl');
    }
}