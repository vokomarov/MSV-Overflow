<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

    public $user_list_array;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('question_model');
        $this->load->model('answer_model');
        $this->load->model('user_model');
    }

    public function index()
    {
        $data['question_item'] = $this->question_model->get_sort_questions('created_at','desc',10);

        if (empty($data['question_item'])) {
            show_404();
        }
        else {
            foreach ($data['question_item'] as &$row) {
                $row['num'] = $this->answer_model->get_num_answers_by_question_id($row['id']);
                $user_info = $this->user_model->getUserById($row['user_id']);
                $row['user_id'] = $user_info['id'];
                $row['user_name'] = $user_info['fname'];
            }
        }

        $this->tpl->set($data, 'index.tpl');
        $this->tpl->compile('index.tpl');
    }

    public function show_404(){
        $this->tpl->compile('404.tpl');
    }
}
