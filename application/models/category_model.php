<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Category_model extends CI_Model{

	private $table = 'category';

	public function getList(){
		$categories = $this->db->get($this->table);
		return $categories->result_array();
	}

	public function getById($id){
		if($id){
			$category = $this->db->get_where($this->table, array('id'=>$id));
			return current($category->result_array());
		}
		return false;
	}

	public function getBySlug($slug){
		if($slug){
			$category = $this->db->get_where($this->table, array('slug'=>$slug));
			return current($category->result_array());
		}
		return false;
	}

	public function add($data){
		if($data && isset($data['name'])){
			$name = $data['name'];
			$slug = $data['slug'];
			$parent_id = isset($data['parent_id'])?intval($data['parent_id'],10):0;
			if($this->db->insert($this->table, array(
				'name' => $name,
				'slug' => $slug,
				'parent_id' => $parent_id
			))){
				return true;
			}
		}
		return false;
	}

	public function edit($data){
		if($data && isset($data['name'])){
			$id = $data['id'];
			$name = $data['name'];
			$slug = $data['slug'];
			$parent_id = isset($data['parent_id'])?intval($data['parent_id'],10):0;
			if($this->db->update($this->table, array(
				'name' => $name,
				'slug'  => $slug,
				'parent_id' => $parent_id
			), array(
				'id' => $id
			))){
				return true;
			}
		}
		return false;
	}

	public function remove($id){
		if($id){
			return $this->db->delete($this->table, array('id'=>$id));
		}
		return false;
	}
}