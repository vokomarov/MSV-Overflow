<?php
/**
 * Created by PhpStorm.
 * User: Олександр
 * Date: 28.11.2015
 * Time: 20:59
 */
class Answer_model extends CI_Model
{
    /**
     *  Get answers by question id
     *
     * @param int $id
     * @return string
     */
    public function get_answers_by_question_id($id)
    {
        if ($id != false) {
            $query = $this->db->get_where('answers', array('question_id' => $id));
            return $query->result_array();
        } else {
            return false;
        }
    }

    /**
     *  Get answers by user_id
     *
     * @param int $id
     * @return string
     */
    public function get_answers_by_user_id($user_id)
    {
        if ($user_id != false) {
            $query = $this->db->get_where('answers', array('user_id' => $user_id));
            return $query->result_array();
        } else {
            return false;
        }
    }

    /**
     *  Get number answers by user_id
     *
     * @param int $id
     * @return int
     */
    public function get_num_answers_by_user_id($user_id)
    {
        return count($this->get_answers_by_user_id($user_id));
    }

    /**
     *  Get number answers by question id
     *
     * @param int $id
     * @return int
     */
    public function  get_num_answers_by_question_id($id)
    {
        if ($id != false) {
            $query = $this->db->get_where('answers', array('question_id' => $id));
            return $query->num_rows();
        } else {
            return false;
        }
    }
}