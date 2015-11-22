<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

    public $user_list_array;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('welcome_model');
        $this->load->model('user_info_model');
    }

    public function index()
    {
        $data['question_item'] = $this->welcome_model->get_questions();
        if (empty($data['question_item'])) {
            show_404();
        }

        if (!empty($data['question_item'])) {
            $i = 0;
            foreach ($data['question_item'] as $row) {
                $this->user_list_array[$i++] = $row['user_id'];
            }
            $data['question_users'] = $this->user_info_model->get_list_users($this->user_list_array);
        }

        $this->tpl->assign($data, 'index.tpl');
        $this->tpl->compile('index.tpl');
    }

    public function show_404(){
        $this->tpl->compile('404.tpl');
    }
}
