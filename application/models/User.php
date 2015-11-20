<?php
/**
 * Authorisation model
 */

class User extends CI_Model{

    private $table = 'users';
    public $is_logged = false;
    public $logged_user;

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

    }

    public function register($data = false){
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

    public function hashPassword($pass){
        $this->load->helper('security');
        return do_hash($pass);
    }
}