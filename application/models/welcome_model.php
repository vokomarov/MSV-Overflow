<?php
/**
 * Created by PhpStorm.
 * User: Олександр
 * Date: 08.11.2015
 * Time: 13:04
 */
class Welcome_model extends CI_Model{

    public function get_questions()
    {
        $query = $this->db->order_by('created_at', 'desc');
        $query = $this->db->limit(10);
        $query = $this->db->get('questions');
        return $query->result_array();

    }
}