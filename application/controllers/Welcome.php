<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('welcome_model');
    }
	public function index()
	{
        $data['question_item']=$this->welcome_model->get_questions();
        //if (empty($data['question_item']))
        //{
        //    show_404();
        //}
        $this->tpl->set($data,'index.tpl');
		$this->tpl->compile('index.tpl');
	}
}
