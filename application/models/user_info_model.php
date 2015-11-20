<?php
/**
 * Created by PhpStorm.
 * User: Олександр
 * Date: 17.11.2015
 * Time: 20:03
 */
class User_info_model extends CI_Model
{
    public function get_user($user_id)
    {
        if ($user_id != false) {
            $query = $this->db->get_where('users', array('id' => $user_id));
            return $query->row_array();
        } else {
            return false;
        }
    }
    public function get_list_users($answers_user_id)
    {
        if ($answers_user_id != false) {
            $query= $this->db->where_in('id',$answers_user_id);
            $query= $this->db->from('users');
            $query = $this->db->get();
            return $query->result_array();
        } else {
            return false;
        }
    }
}