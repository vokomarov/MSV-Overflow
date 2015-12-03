<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Authorisation model
 */

class User_model extends CI_Model{

    private $table = 'users';
    public $is_logged = false;
    public $logged_user;

    public $groups = array(
        1 => 'Admin',
        2 => 'Moder',
        3 => 'User',
        4 => 'Banned'
    );

    public function __construct(){
        parent::__construct();

        $cook = get_cookie('authorised');

        $is_logged = $this->session->userdata('is_logged');
        $user_id = $this->session->userdata('user_id');

        if(($is_logged === null || !$is_logged) && $cook !== null){
            $this->load->library('encrypt');
            $user_id = $this->encrypt->decode($cook);
        }

        if($user_id !== null){
            $user = $this->db->get_where($this->table, array('id' => $user_id), 1)->result_array();
            if(count($user) === 1){
                $this->is_logged = true;
                $this->logged_user = current($user);
            }
        }

        $this->tpl->registerPlugin("block","is_group", array($this, "is_group"));
        $this->tpl->registerPlugin("block","is_not_group", array($this, "is_not_group"));

    }

    public function add($data = false){
        if($data !== false){
            $name = $data['name'];
            $login = $data['login'];
            $email = $data['email'];
            $password = $this->hashPassword($data['password']);
            $group = $data['group'];

            if($this->db->insert($this->table, array(
                'login' => $login,
                'password' => $password,
                'fname' => $name,
                'email' => $email,
                'karma' => 0,
                'group' => intval($group, 10),
                'created_at' => date("Y-m-d H:i:s")
            ))){
                $this->db->select_max('id');
                $query = $this->db->get($this->table);
                if($query){
                    $new_user = $query->result_array();

                    if(count($new_user) == 1){
                        $new_user = current($new_user);
                    }

                    if(isset($new_user['id'])){
                        return $new_user['id'];
                    }
                }
            }else{
                return false;
            };
        }
        return false;
    }

    /**
     * Update user fields
     *
     * @param array $data
     * @return bool
     */
    public function update($data){
        if($data){
            $password = $this->hashPassword($data['password']);
            $name = $data['name'];
            $email = $data['email'];
            $group = $data['group'];
            return $this->db->update($this->table, array(
                'fname' => $name,
                'password' => $password,
                'email' => $email,
                'group' => $group
            ), array(
                'id' => $data['id']
            ));
        }
        return false;
    }

    /**
     * Register new user
     *
     * @param array $data
     * @return bool|object
     */
    public function register($data){
        if($data !== false){
            $login = $data['login'];
            $password = $this->hashPassword($data['password']);
            $name = $data['name'];
            $email = $data['email'];
            $time = date("Y-m-d H:i:s");

            $data = array(
                'login' => $login,
                'password' => $password,
                'fname' => $name,
                'email' => $email,
                'karma' => 0,
                'group' => 3,
                'created_at' => $time
            );
            return $this->db->insert($this->table, $data);
        }
        return false;
    }

    /**
     * Authorize user on session, and cookies
     *
     * @param string $login
     * @param string $pass
     * @param bool|false $forever
     *
     * @return bool|User
     */
    public function authorize($login, $pass, $forever = false){
        if(!empty($login) && !empty($pass)){

            // try with login
            $user = $this->db->get_where($this->table, array('login'=>$login), 1)->result_array();

            if(count($user) !== 1){

                // try with email
                $user = $this->db->get_where($this->table, array('email'=>$login), 1)->result_array();

                if(count($user) !== 1){
                    return false;
                }
            }
            $user = $user[0];

            // found user $user
            // check password
            if(strcmp($this->hashPassword($pass), $user['password']) === 0){
                // user valid - authorise

                $this->is_logged = true;
                $this->logged_user = $user;

                // set session
                $this->session->set_userdata(array(
                    'is_logged' => true,
                    'user_id'   => $user['id']
                ));

                // set cookie if need
                if($forever){
                    $this->load->library('encrypt');
                    $hash = $this->encrypt->encode($user['id']);
                    set_cookie('authorised', $hash, 604800);
                }

                return $this->logged_user;
            }
        }
        return false;
    }

    /**
     * Unautorize user
     *
     * @return bool
     */
    public function logout(){
        delete_cookie('authorised');
        $this->session->unset_userdata('user_id');
        $this->session->set_userdata('is_logged', false);
        return true;
    }

    /**
     * Make hash from string
     *
     * @param string $pass
     * @return string
     */
    public function hashPassword($pass){
        $this->load->helper('security');
        return do_hash($pass);
    }

    /**
     * Get all users, by limit and offset
     *
     * @param int $limit
     * @param int $offset
     * @return array
     */
    public function getUsers($limit = 0, $offset = 0){
        $query = $this->db->get($this->table, $limit, $offset);
        return $this->usersQueries($query);
    }

    /**
     * Get user by ID
     *
     * @param int|string $id
     * @return array|bool
     */
    public function getUserById($id){
        if(intval($id, 10) > 0){
            $query = $this->db->get_where($this->table, array('id'=>$id), 1);
            return $this->usersQueries($query);
        }else{
            return false;
        }
    }

    /**
     * Get user by login
     *
     * @param string $login
     * @return array|bool
     */
    public function getUserByLogin($login){
        if($login != ''){
            $query = $this->db->get_where($this->table, array('login'=>$login), 1);
            return $this->usersQueries($query);
        }else{
            return false;
        }
    }

    /**
     * Get user by email
     *
     * @param string $email
     * @return array|bool
     */
    public function getUserByEmail($email){
        if($email != ''){
            $query = $this->db->get_where($this->table, array('email'=>$email), 1);
            return $this->usersQueries($query);
        }else{
            return false;
        }
    }

    public function getMostPopular($limit = 0){
        $query = $this->db->order_by('karma', 'DESC');
        $query = $this->db->get($this->table, $limit);
        return $this->usersQueries($query);
    }

    public function getAllCount(){
        return $this->db->count_all($this->table);
    }

    /**
     * Run build CI_Query
     *
     * @param CI_DB_result|object $query
     * @return bool|array
     */
    private function usersQueries($query){
        if(!is_null($query)){
            try{
                $users = $query->result_array();
                if(is_array($users) && count($users) > 0){
                    if(count($users) == 1){
                        return current($users);
                    }else{
                        return $users;
                    }
                }else{
                    return false;
                }
            }catch(Exception $e){
                return false;
            }
        }else{
            return false;
        }
    }

    /**
     * Delete user by ID
     *
     * @param int|string $id
     * @return bool
     */
    public function deleteUser($id){
        if($id){
            return $this->db->delete($this->table, array('id'=>$id));
        }
        return false;
    }

    /**
     * Return group name
     *
     * @param int $id
     * @return string|bool
     */
    public function getGroupNameById($id){
        $intid = intval($id, 10);
        return isset($this->groups[$intid])?$this->groups[$intid]:false;
    }

    /**
     * Smarty custom plugin
     * Verify current user group in templates
     * If current user in group 1 or 2 then he can see text between tags
     * Example: {is_group groups="1,2"}Admin,Moder{/is_group}
     *
     * @name is_group
     * @param string $params
     * @param string $content
     * @return null|string
     */
    public function is_group($params, $content){
        if(isset($params['groups'])){
            if($this->checkUserGroup($params['groups'])){
                return $content;
            }else{
                return NULL;
            }
        }else{
            return $content;
        }
    }
    public function is_not_group($params, $content){
        if(isset($params['groups'])){
            if(!$this->checkUserGroup($params['groups'])){
                return $content;
            }else{
                return NULL;
            }
        }else{
            return $content;
        }
    }


    /**
     * Check user group
     *
     * @param array $needle - string like "2,4,6,1"
     * @return bool
     */
    public function checkUserGroup($needle){
        if(!isset($this->logged_user['group'])){
            return false;
        }
        $groups = explode(',', $needle);
        $group = $this->logged_user['group'];
        if(in_array($group, $groups)){
            return true;
        }else{
            return false;
        }
    }

    /**
     * Ban user by id
     *
     * @param string $id
     * @return bool|object
     */
    public function banById($id){
        if($id){
            return $this->db->update($this->table, array(
                'group' => '4'
            ), array(
                'id' => $id
            ));
        }
        return false;
    }

    /**
     * Clear ban user by id
     *
     * @param string $id
     * @return bool|object
     */
    public function unBanById($id){
        if($id){
            return $this->db->update($this->table, array(
                'group' => '3'
            ), array(
                'id' => $id
            ));
        }
        return false;
    }
}