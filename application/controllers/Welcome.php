<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
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
}
