<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once( "smarty/Smarty.class.php" );

class Tpl extends Smarty{

    /**
     * Base constructor
     */
    function __construct(){

        parent::__construct();

        $this->left_delimiter = '{';
        $this->right_delimiter = '}';
        $this->setTemplateDir(FCPATH .'public');
        $this->setCompileDir(APPPATH . 'cache');
        $this->setCacheDir(APPPATH . 'cache');
        $this->caching = false;

        //set global template variable
        $this->set("template", BASE_URL . "/public");
        $this->set("base", BASE_URL . "/");

    }

    /**
     * Assign template variable with real data
     *
     * @param $name string - template variable name
     * @param $value - value for this variable
     */
    public function set($name, $value){
        $this->assign($name, $value);
    }

    /**
     * Show the compiled template
     *
     * @param $module string - name of template
     */
    public function compile($module){
        $this->display($module);
    }

    /**
     * Get compiled template html string
     * @param $module string - name of template
     * @return string - compiled html
     */
    public function get($module){
        return $this->fetch($module);
    }

}

$tpl = new Tpl();