<?php defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller{

    //list all question
    public function index()
    {
        $users = $this->user_model->getUsers();
        $this->tpl->set('users', $users);
        $this->tpl->set('group', $this->user_model->groups);
        $this->tpl->compile('admin/user/index.tpl');
    }

    public function add(){
        if($this->input->post('action') == 'add'){
            $this->load->library('form_validation');
            $data = array(
                'name'  => $this->input->post('name'),
                'login'  => $this->input->post('login'),
                'email' => $this->input->post('email'),
                'password' => $this->input->post('password'),
                'cpassword' => $this->input->post('cpassword'),
                'group' => $this->input->post('group')
            );
            $this->form_validation->set_data($data);
            if($this->form_validation->run('register') == false){
                $this->tpl->set('error', validation_errors());
            }else{
                $new_user = $this->user_model->add($data);
                if($new_user){
                    redirect('/admin/user/'.$new_user, 'location', 301);
                }else{
                    $this->tpl->set('error', 'Unknown error. Try again');
                }
            }

        }
        $this->tpl->compile('admin/user/add.tpl');
    }

    public function show($id = false){
        if($id){
            $user = $this->user_model->getUserById($id);
            if($user){
                $this->tpl->set('user', $user);
                $this->tpl->set('group', $this->user_model->groups);
                $this->tpl->compile('admin/user/edit.tpl');
                die;
            }
        }
        redirect('/admin/user', 'location', 301);
    }

    public function edit($id = false){
        if($id){

            if($this->input->post('action') == 'update'){
                $name = $this->input->post('name');
                $email = $this->input->post('email');
                $pass = $this->input->post('password');
                $cpass = $this->input->post('cpassword');
                $group = intval($this->input->post('group'), 10);

                $this->load->library('form_validation');

                $this->form_validation->set_data(array(
                    'name' => $name,
                    'email' => $email,
                    'password' => $pass,
                    'cpassword' => $cpass
                ));

                if($this->form_validation->run('update_user') == false){
                    $this->tpl->set('error', validation_errors());
                }else{
                    $this->user_model->update(array(
                        'id' => $id,
                        'name' => $name,
                        'email' => $email,
                        'password' => $pass,
                        'group' => $group
                    ));
                }

            }

            $user = $this->user_model->getUserById($id);
            if($user){

                $this->tpl->set('user', $user);
                $this->tpl->set('group', $this->user_model->groups);
                $this->tpl->set('edit', 1);
                $this->tpl->compile('admin/user/edit.tpl');
                die;
            }
        }
        redirect('/admin/user', 'location', 301);

    }

    public function remove($id = false){
        if($id){
            $this->user_model->deleteUser($id);
        }
        redirect('/admin/user', 'location', 301);
    }
}