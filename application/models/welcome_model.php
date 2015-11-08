<?php
/**
 * Created by PhpStorm.
 * User: Олександр
 * Date: 08.11.2015
 * Time: 13:04
 */
class Welcome_model extends CI_Model{

    public function get_questions(){
        $query = $this->db->get('questions');
        return $query->result_array();
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