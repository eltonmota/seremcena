<?php

/**
 * Controller Galeria
 * @author Elton Fabiano da Mota
 * @copyright Color Pix
 */

require '../Models/ModelGaleria.php';
require '../Views/ViewGaleria.php';

class ControllerGaleria
{
	/**
	 * this model set instance 
	 * of class ModelProdutos
	 */
	public $model;

	/**
	 * this model set instance 
	 * of class ViewProdutos
	 */
	public $view;

	/**
	 * this Res receive response 
	 * of the models
	 */
	public $Res;

	/**
	 * this Res receive response 
	 * of the models
	 */
	public $Res2;

	/**
	 * this Out set response 
	 * for browser.
	 */
	public $Out;

	/**
	 * this IdGaleria set ID 
	 * for galeria.
	 */
	public $IdGaleria;

	public function __construct()
	{
		$this->model = new ModelGaleria();
		$this->view  = new ViewGaleria();
	}

	public function getSubMenuGaleria(array $id)
	{
		$this->IdGaleria = $this->model->getIdGaleria($id['id']);
		$this->Res  = $this->model->getSubMenu($id['id']);
		$i = 0;
		foreach ($this->Res as $value) {
			
			$this->Res2[$i]['GSM_ID'] = $value['GSM_ID'];
			$this->Res2[$i]['GSM_DESC'] = $value['GSM_DESC'];
			$child = $this->model->getChild($value['GSM_ID']);
			if (is_array($child)){
				$this->Res2[$i]['CHILD'] = $child;
			}
			$i++;

		}
		$this->Out  = $this->view->getSubmenu($this->Res2, $this->IdGaleria["GSM_ID"]);
		$this->Res  = $this->model->getGaleria($this->IdGaleria['GSM_ID']);
		$this->Out .= $this->view->getGaleria($this->Res);
		return $this->Out;

	}

	public function getGaleria(array $id)
	{
		$this->Res = $this->model->getGaleria($id['id']);
		$this->Out = $this->view->changeGaleria($this->Res);
		return $this->Out;
	}
}