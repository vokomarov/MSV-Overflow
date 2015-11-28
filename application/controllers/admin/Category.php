<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Category extends CI_Controller{

    public function __construct(){
        parent::__construct();
        if(!$this->user_model->is_logged || !$this->user_model->checkUserGroup('1,2')){
            redirect('/', 'location', 301);
        }
        $this->load->model('category_model');
    }

    //list all question
    public function index()
    {
        $categories = $this->category_model->getList();
        $this->tpl->set('categories', $categories);
        $this->tpl->compile('admin/category/index.tpl');
    }

    public function add(){
        $categories = $this->category_model->getList();
        $this->tpl->set('categories', $categories);
        if($this->input->post('action') == 'add'){
            $this->load->library('form_validation');
            $data = array(
                'name' => $this->input->post('name'),
                'slug' => $this->input->post('slug'),
                'parent_id' => $this->input->post('parent_id')
            );
            $this->form_validation->set_data($data);
            if($this->form_validation->run('new_category') == false){
                $this->tpl->set('error', validation_errors());
            }else{
                $this->category_model->add($data);
                redirect('/admin/category', 'location', 301);
                die;
            }
        }
        $this->tpl->compile('admin/category/add.tpl');
    }

    public function edit($id = false){
        $categories = $this->category_model->getList();
        $this->tpl->set('categories', $categories);

        if($this->input->post('action') == 'edit'){
            $this->load->library('form_validation');
            $data = array(
                'id'=>$id,
                'name' => $this->input->post('name'),
                'slug' => $this->input->post('slug'),
                'parent_id' => $this->input->post('parent_id')
            );
            $this->form_validation->set_data($data);
            if($this->form_validation->run('edit_category') == false){
                $this->tpl->set('error', validation_errors());
            }else{
                $this->category_model->edit($data);
            }
        }

        $category = $this->category_model->getById($id);
        $this->tpl->set('category', $category);
        $this->tpl->compile('admin/category/edit.tpl');
    }

    public function remove($id = false){
        if($id){
            $this->category_model->remove($id);
            redirect('/admin/category', 'location', 301);
        }
        return false;
    }
}