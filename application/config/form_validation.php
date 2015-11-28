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
    'register' => array(
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
    'update_user' => array(
        array(
            'field' => 'name',
            'label' => 'Name',
            'rules' => 'alpha_numeric_spaces'
        ),
        array(
            'field' => 'email',
            'label' => 'Email',
            'rules' => 'required|valid_email'
        ),
        array(
            'field' => 'password',
            'label' => 'Password',
            'rules' => 'alpha_dash|min_length[3]|max_length[12]'
        ),
        array(
            'field' => 'cpassword',
            'label' => 'Confirm password',
            'rules' => 'matches[password]'
        )
    ),
    'auth'=> array(
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
    ),
    'new_category' => array(
        array(
            'field' => 'name',
            'label' => 'Name',
            'rules' => 'required|alpha_numeric_spaces'
        ),
        array(
            'field' => 'slug',
            'label' => 'Slug',
            'rules' => 'required|regex_match[/^[a-z0-9-]+$/]'
        )
    ),
    'edit_category' => array(
        array(
            'field' => 'name',
            'label' => 'Name',
            'rules' => 'required|alpha_numeric_spaces'
        ),
        array(
            'field' => 'slug',
            'label' => 'Slug',
            'rules' => 'required|regex_match[/^[a-z0-9-]+$/]|is_unique[category.slug]'
        )
    )
);