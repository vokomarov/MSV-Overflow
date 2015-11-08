<?php
/**
 * Created by PhpStorm.
 * User: Олександр
 * Date: 01.11.2015
 * Time: 9:47
 */
class Question_model extends CI_Model{

    public function get_question($id){
        if($id!=false){
            $query=$this->db->get_where('questions',array('id'=>$id));
            return $query->row_array();
        }
        else{
            return false;
        }
    }
    public function get_user($user_id){
        if($user_id!=false){
            $query=$this->db->get_where('users',array('id'=>$user_id));
            return $query->row_array();
        }
        else{
            return false;
        }
    }
}