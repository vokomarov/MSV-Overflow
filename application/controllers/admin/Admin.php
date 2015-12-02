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
        $this->load->model('question_model');
        $this->load->model('answer_model');
    }

    public function index()
    {
        $last_questions = $this->question_model->get_sort_questions('created_at', 'desc', 3);
        $questions_count = $this->question_model->get_all_count();
        $users = $this->user_model->getMostPopular(3);
        $users_count = $this->user_model->getAllCount();
        $last_answer = $this->answer_model->get_last(3);
        $answers_count = $this->answer_model->get_all_count();
        $this->tpl->set('users', $users);
        $this->tpl->set('users_count', $users_count);
        $this->tpl->set('last_questions', $last_questions);
        $this->tpl->set('questions_count', $questions_count);
        $this->tpl->set('last_answers', $last_answer);
        $this->tpl->set('answers_count', $answers_count);
        $this->tpl->compile('admin/dashboard.tpl');
    }

    public function setting(){

        if(!$this->user_model->checkUserGroup('1')){
            redirect('/', 'location', 301);
        }

        $this->tpl->compile('admin/setting.tpl');
    }
}