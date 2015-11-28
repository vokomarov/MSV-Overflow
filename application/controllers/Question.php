<?php
/**
 * Created by PhpStorm.
 * User: Олександр
 * Date: 24.10.2015
 * Time: 15:46
 */
class Question extends CI_Controller{
    /**
     * Question Page for this controller.
     *
     * Maps to the following URL
     * 		http://example.com/index.php/welcome
     *	- or -
     * 		http://example.com/index.php/welcome/index
     *	- or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see http://codeigniter.com/user_guide/general/urls.html
     */
    public $user_list_array;
    public $user_id = 0;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('question_model');
        $this->load->model('answer_model');
        $this->load->model('user_model');

    }

    public function index($question_id)
    {
        $this->question_model->set_number_question_view($question_id);
        $data['current_question'] = $this->question_model->get_question_by_id($question_id);
        $data['answers_question'] = $this->answer_model->get_answers_by_question_id($question_id);

        if(empty($data['current_question'])) {
            show_404();
        }
        else {
            $this->user_id = $data['current_question']['user_id'];
            $data['question_user'] = $this->user_model->getUserById($this->user_id);

            foreach ($data['answers_question'] as &$row) {
                $user_info = $this->user_model->getUserById($row['user_id']);
                $row['user_id'] = $user_info['id'];
                $row['user_name'] = $user_info['fname'];
                $row['user_karma'] = $user_info['karma'];
            }
        }

        $this->tpl->set($data, 'question.tpl');
        $this->tpl->compile('question.tpl');
    }

}