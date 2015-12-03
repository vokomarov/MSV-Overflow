<?php
/**
 * Created by PhpStorm.
 * User: Олександр
 * Date: 24.10.2015
 * Time: 15:46
 */
class UserProfile extends CI_Controller{
    /**
     * User Profile Page for this controller.
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
    public $base_url = "";
    public function __construct()
    {
        parent::__construct();
        $this->load->model('question_model');
        $this->load->model('answer_model');
        $this->load->model('user_model');
        $this->base_url = base_url();
    }

    public function index($user_id)
    {
        $data['user_info'] = $this->user_model->getUserById($user_id);

        if (!empty($data['user_info'])) {
            $data['number_answers'] = $this->answer_model->get_num_answers_by_user_id($user_id);
            $data['number_questions'] = $this->question_model->get_num_questions_by_user_id($user_id);

            if ($user_id == $this->user_model->logged_user['id']) {
                $data['user_questions'] = $this->question_model->get_questions_by_user_id($user_id);
                $data['user_answers'] = $this->answer_model->get_answers_by_user_id($user_id);

                foreach ($data['user_answers'] as &$row) {
                    $question = $this->question_model->get_question_by_id($row['question_id']);
                    $row['question_title'] = $question['title'];
                }
                $data['base_url'] = $this->base_url;
                $this->tpl->set($data, 'user/user_profile.tpl');
                $this->tpl->compile('user/user_profile.tpl');
            } else {
                $this->tpl->set($data, 'user/user_info.tpl');
                $this->tpl->compile('user/user_info.tpl');
            }
        } else {
            $this->show_404();
        }
    }
    public function add_question()
    {
        $title = $this->input->post('title');
        $question = $this->input->post('question');
        $tags = $this->input->post('tags');
        $user_id = $this->user_model->logged_user['id'];

        $data = array(
            'title' => $title,
            'content' => $question,
            'tags' => $tags,
            'user_id' => $user_id,
        );
        $new_question_id = $this->question_model->add_question($data);
        if($new_question_id !== false){
            echo json_encode($this->question_model->get_question_by_id($new_question_id));
        }
        else {
            echo false;
        }
    }

    public function delete_question() {
        $question_id = $this->input->post('id');
        $result = $this->question_model->delete_question($question_id);
        if($result != false){
            echo $result;
        }
        else{
            echo false;
        }
    }

    /*public function update_data($user_id) {
        $this->data['user_info'] = $this->user_model->getUserById($user_id);
        $this->data['number_answers'] = $this->answer_model->get_num_answers_by_user_id($user_id);
        $this->data['number_questions'] = $this->question_model->get_num_questions_by_user_id($user_id);
        $this->data['user_questions'] = $this->question_model->get_questions_by_user_id($user_id);
        $this->data['user_answers'] = $this->answer_model->get_answers_by_user_id($user_id);
        foreach ($this->data['user_answers'] as &$row) {
            $question = $this->question_model->get_question_by_id($row['question_id']);
            $row['question_title'] = $question['title'];
        }
        return
    }*/
    public function show_404()
    {
        $this->tpl->compile('404.tpl');
    }
}