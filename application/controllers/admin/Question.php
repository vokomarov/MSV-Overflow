<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Question extends CI_Controller{

    public function __construct(){
        parent::__construct();
        $this->load->model('question_model');
    }

    //list all question
    public function index()
    {
        $questions = $this->question_model->get_sort_questions('created_at','desc');
        $this->tpl->set('questions', $questions);
        $this->tpl->compile('admin/question/index.tpl');
    }


}