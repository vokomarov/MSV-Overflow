<?php
/**
 * Created by PhpStorm.
 * User: Олександр
 * Date: 01.10.2015
 * Time: 8:06
 */
defined('BASEPATH') OR exit('No direct script access allowed');
class Auth extends CI_Controller{

    /**
     * Display login page and login user
     */
    public function login(){

        if($this->input->post('action') == 'login'){
            $this->load->library('form_validation');
            $login = $this->input->post('login');
            $pass = $this->input->post('password');
            $remember = $this->input->post('remember');

            $this->form_validation->set_data(array(
                'login' => $login,
                'password' => $pass
            ));

            if($this->form_validation->run() !== false){
                if($this->user->authorize($login, $pass, !empty($remember)) == false){
                    $this->load->helper('url');
                    redirect('/', 'location', 301);
                }
            }
            $this->tpl->set('error', 'Wrong login');
        }
        $this->tpl->compile('login.tpl');
    }

    public function logout(){
        $this->user->logout();
        $this->load->helper('url');
        redirect('/', 'location', 301);
    }

    public function register(){

        // check form data
        $allow_register = true;
        if($this->input->post('action') == 'register'){

            $this->load->library('form_validation');

            $name = $this->input->post('name');
            $login = $this->input->post('login');
            $email = $this->input->post('email');
            $pass = $this->input->post('password');
            $cpass = $this->input->post('cpassword');
            $remember = $this->input->post('agree');
            if(!empty($remember)){
                $data = array(
                    'name'  => $name,
                    'login'  => $login,
                    'email' => $email,
                    'password' => $pass,
                    'cpassword' => $cpass
                );

                $this->form_validation->set_data($data);

                if($this->form_validation->run() == false){
                    $this->tpl->set('error', validation_errors());

                }else if($this->user->register($data)){
                    $this->tpl->set('register', array(
                        'message' => 'Register user successful. Please login with your access.'));
                    $this->tpl->compile('login.tpl');
                    $allow_register = false;
                }
            }
        }

        if($allow_register) {
            $this->tpl->compile('signup.tpl');
        }
    }

    public function checkLogin(){
        $return = array();
        $this->load->library('form_validation');
        $data = array(
            'login' => $this->input->post('data')
        );
        $this->form_validation->set_data($data);

        if($this->form_validation->run('login') !== false){
            $return['status'] = 'success';
            $return['message'] = 'Your login was free';
        }else{
            $return['status'] = 'error';
            $return['message'] = 'Please, input another login';
        }

        $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode($return));
    }

    public function checkEmail(){
        $return = array();
        $this->load->library('form_validation');
        $data = array(
            'email' => $this->input->post('data')
        );
        $this->form_validation->set_data($data);

        if($this->form_validation->run('email') !== false){
            $return['status'] = 'success';
            $return['message'] = 'Your email was free';
        }else{
            $return['status'] = 'error';
            $return['message'] = 'Please, input another email';
        }

        $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode($return));
    }
}