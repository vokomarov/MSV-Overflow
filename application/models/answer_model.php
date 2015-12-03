<?php
/**
 * Created by PhpStorm.
 * User: Олександр
 * Date: 28.11.2015
 * Time: 20:59
 */
class Answer_model extends CI_Model
{

    private $table = 'answers';

    /**
     *  Get answer by id
     *
     * @param int $id
     * @return string
     */
    public function get_answers_by_id($id)
    {
        if ($id != false) {
            $query = $this->db->get_where($this->table, array('id' => $id));
            return $query->row_array();
        } else {
            return false;
        }
    }

    /**
     *  Get answers by question id
     *
     * @param int $id
     * @return string
     */
    public function get_answers_by_question_id($id)
    {
        if ($id != false) {
            $query = $this->db->get_where($this->table, array('question_id' => $id));
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
            $query = $this->db->get_where($this->table, array('user_id' => $user_id));
            return $query->result_array();
        } else {
            return false;
        }
    }

    /**
     *  Get number answers by user_id
     *
     * @param array $data
     * @return bool|int
     */
    public function get_num_answers_by_user_id($user_id)
    {
        if ($user_id != false) {
            return count($this->get_answers_by_user_id($user_id));
        }
        else {
            return false;
        }
    }

    /**
     *  Get number answers by question
     *
     * @param array $data
     * @return bool|int
     */
    public function get_num_answers_by_question_id($question_id)
    {
        if ($question_id != false) {
            return count($this->get_answers_by_question_id($question_id));
        }
        else {
            return false;
        }
    }

    /**
     *  Add new answer
     *
     * @param int $id
     * @return int
     */
    public function add_new_answer($data = false)
    {
        if ($data !== false) {
            $content = $data['content'];
            $user_id = $data['user_id'];
            $question_id = $data['question_id'];
            if($this->db->insert($this->table, array(
                'content' => $content,
                'user_id' => $user_id,
                'question_id' => $question_id,
                'created_at' => date("Y-m-d H:i:s")
            ))) {
                $this->db->select_max('id');
                $query = $this->db->get($this->table);
                if($query){
                    $new_answer = $query->result_array();

                    if(count($new_answer) == 1){
                        $new_answer = current($new_answer);
                    }

                    if(isset($new_answer['id'])){
                        return $new_answer['id'];
                    }
                }
            }
        } else {
            return false;
        }
    }

    /**
     *  Delete answer
     *
     * @param int $question_id
     * @return bool
     */

    public  function delete_answer($answer_id = false){
        if($answer_id != false){
            return $this->db->delete($this->table,array('id'=>$answer_id));
        }
        else {
            return false;
        }
    }
}