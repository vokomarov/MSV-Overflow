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
    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        $this->load->model('question_model');
    }
    public function index($user_id)
    {
        $data['user_questions'] = $this->question_model->get_questions_by_user_id($user_id);

        $this->tpl->set($data,'user_profile.tpl');
        $this->tpl->compile('user_profile.tpl');
    }
}