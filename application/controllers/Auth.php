<?php
/**
 * Created by PhpStorm.
 * User: Олександр
 * Date: 01.10.2015
 * Time: 8:06
 */
defined('BASEPATH') OR exit('No direct script access allowed');
class Auth extends CI_Controller{

    public function index()
    {
        $this->load->helper('url');
        redirect('/', 'location', 301);
    }

    public function checkLogin(){
        $return = array();
        $inputLogin = $this->input->post('data');

        if($inputLogin){
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
        $inputEmail = $this->input->post('data');

        if($inputEmail){
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