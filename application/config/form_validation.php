<?php
/**
 * Validation form rules
 *
 * @syntax
 * array(
 *     'controller/method' => array(
 *         array(
 *             'field' => 'field_name',
 *             'label' => 'field_label',
 *             'rules' => 'required',
 *         ),
 *     )
 * )
 */

$config = array(
    'auth/register' => array(
        array(
            'field' => 'name',
            'label' => 'Name',
            'rules' => 'alpha_numeric_spaces'
        ),
        array(
            'field' => 'login',
            'label' => 'Login',
            'rules' => 'required|alpha_dash|min_length[3]|max_length[12]|is_unique[users.login]'
        ),
        array(
            'field' => 'email',
            'label' => 'Email',
            'rules' => 'required|valid_email|is_unique[users.email]'
        ),
        array(
            'field' => 'password',
            'label' => 'Password',
            'rules' => 'required|alpha_dash|min_length[3]|max_length[12]'
        ),
        array(
            'field' => 'cpassword',
            'label' => 'Confirm password',
            'rules' => 'required|matches[password]'
        ),
    ),
    'auth/login'=> array(
        array(
            'field' => 'login',
            'label' => 'Login',
            'rules' => 'required'
        ),
        array(
            'field' => 'password',
            'label' => 'Password',
            'rules' => 'required'
        ),
    ),
    'login' => array(
        array(
            'field' => 'login',
            'label' => 'Login',
            'rules' => 'is_unique[users.login]'
        )
    ),
    'email' => array(
        array(
            'field' => 'email',
            'label' => 'Email',
            'rules' => 'is_unique[users.email]'
        )
    )
);