<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Question extends CI_Controller{

    //list all question
    public function index()
    {
        $this->tpl->compile('admin/question/index.tpl');
    }

    public function add($id = false){

    }

    public function remove($id = false){

    }
}