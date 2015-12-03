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
    public $user_id = 0;
    public $base_url = "";
    public $question_id = 0;
    public function __construct()
    {
        parent::__construct();
        $this->load->model('question_model');
        $this->load->model('answer_model');
        $this->load->model('user_model');
        $this->base_url = base_url();
    }

    public function index($question_id)
    {
        $this->question_model->set_number_question_view($question_id);
        $data['current_question'] = $this->question_model->get_question_by_id($question_id);
        $data['answers_question'] = $this->answer_model->get_answers_by_question_id($question_id);

        if(!empty($data['current_question'])) {

            $this->user_id = $data['current_question']['user_id'];
            $data['question_user'] = $this->user_model->getUserById($this->user_id);

            $data['current_question']['labels'] = explode(",",$data['current_question']['tags']);
            $data['logged_user'] = $this->user_model->logged_user['id'];
            foreach ($data['answers_question'] as &$row) {
                $user_info = $this->user_model->getUserById($row['user_id']);
                $row['user_name'] = $user_info['fname'];
                $row['user_karma'] = $user_info['karma'];
            }
            $data['base_url'] = $this->base_url;
            $this->tpl->set($data, 'question.tpl');
            $this->tpl->compile('question.tpl');
        }
        else {
            $this->show_404();
        }
    }

    public function add_comment(){
        $user_id = $this->user_model->logged_user['id'];
        $question_id = $this->input->post('question_id');
        $content = $this->input->post('content');

        $data = array(
            'content' => $content,
            'user_id' => $user_id,
            'question_id' => $question_id
        );
        $new_answer_id = $this->answer_model->add_new_answer($data);
        if($new_answer_id != false){
            $data = $this->answer_model->get_answers_by_id($new_answer_id);

            $user_info = $this->user_model->getUserById($data['user_id']);
            $data['user_name'] = $user_info['fname'];
            $data['user_karma'] = $user_info['karma'];
            echo json_encode($data);
        }
        else {
            echo false;
        }
    }

    public function delete_answer() {
        $answer_id = $this->input->post('id');
        $result = $this->answer_model->delete_answer($answer_id);
        if($result != false){
            echo $result;
        }
        else{
            echo false;
        }
    }

    public function show_404()
    {
        $this->tpl->compile('404.tpl');
    }

}