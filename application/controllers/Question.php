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
    public function __construct()
    {
        parent::__construct();
        $this->load->model('question_model');
    }
    public function view($question_id){
        $data['current_question']=$this->question_model->get_question($question_id);
        if (empty($data['current_question']))
        {
            show_404();
        }
        $user_id=$data['current_question']['user_id'];
        $data['user']=$this->question_model->get_user($user_id);
        $this->tpl->set($data,'question.tpl');
        $this->tpl->compile('question.tpl');
    }

}