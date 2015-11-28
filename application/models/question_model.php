<?php
/**
 * Created by PhpStorm.
 * User: Олександр
 * Date: 01.11.2015
 * Time: 9:47
 */
class Question_model extends CI_Model{

    /**
     *  Set number question view
     *
     * @param int $id
     */
    public function set_number_question_view($question_id)
    {
        if ($question_id != false) {
            $this->db->query('UPDATE questions SET views = views+1 WHERE id = '.$question_id);
        }
        else {
            return false;
        }
    }

    /**
     * Get sort questions
     *
     * @param string $sort_column
     * @param string $sort_method
     * @param int $number_row
     * @return string
     */
    public function get_sort_questions($sort_column = 'created_at', $sort_method = 'desc', $number_row = 10)
    {
        $query = $this->db->order_by($sort_column, $sort_method);
        $query = $this->db->limit($number_row);
        $query = $this->db->get('questions');
        return $query->result_array();
    }

    /**
     *  Get question by ID
     *
     * @param int $id
     * @return string
     */
    public function get_question_by_id($id)
    {
        if ($id != false) {
            $query = $this->db->get_where('questions', array('id' => $id));
            return $query->row_array();
        } else {
            return false;
        }
    }

    /**
     *  Get question by user id
     *
     * @param int $user_id
     * @return string
     */
    public function get_questions_by_user_id($user_id)
    {
        if ($user_id != false) {
            $query = $this->db->get_where('questions', array('user_id' => $user_id));
            return $query->result_array();
        } else {
            return false;
        }
    }
    /**
     *  Get number question by user id
     *
     * @param int $user_id
     * @return int
     */
    public function get_num_questions_by_user_id($user_id)
    {
        return count($this->get_questions_by_user_id($user_id));
    }
    

}