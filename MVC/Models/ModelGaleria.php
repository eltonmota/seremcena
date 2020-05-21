<?php

/**
 * Model Galeria de Fotos
 * @author Elton Fabiano da Mota
 * @copyright Color Pix
 */

require '../Library/Db/Db.php';

class ModelGaleria extends Db
{
	
	/**
	 * this Res set response
	 * of the querie sql server 
	 * for controller
	 */
	public $Res;

	/**
     * this sql set querie sql server.
     * @type string
     * @access protected
     */
	private $sql;

	function __construct()
	{
		
		self::connect();

	}

	public function getIdGaleria($id)
	{

		if ($id == 2 || $id == 1){
			$this->sql = "SELECT B.GSM_ID FROM galeria_submenu AS A
							LEFT JOIN galeria_submenu AS B ON B.GSM_PARENT_ID = A.GSM_ID
							WHERE A.GSM_GM_ID = ".$id." ORDER BY B.GSM_ID DESC LIMIT 1";
		}else{
			$this->sql = "SELECT GSM_ID FROM galeria_submenu WHERE GSM_GM_ID = ".$id." ORDER BY GSM_ID DESC LIMIT 1";
		}
		$this->Res = self::$conn->query($this->sql)->fetchAll(PDO::FETCH_ASSOC);
		return $this->Res[0];
	}

	public function getSubMenu($id)
	{
		$this->sql = "SELECT * FROM galeria_submenu WHERE GSM_GM_ID = ".$id." AND GSM_PARENT_ID = 0 ORDER BY GSM_ID DESC";
		$this->Res = self::$conn->query($this->sql)->fetchAll(PDO::FETCH_ASSOC);
		return $this->Res;
	}

	public function getChild($id)
	{
		$this->sql = "SELECT * FROM galeria_submenu WHERE GSM_PARENT_ID = ".$id." ORDER BY GSM_ID DESC";
		$this->Res = self::$conn->query($this->sql)->fetchAll(PDO::FETCH_ASSOC);
		return $this->Res;
	}

	public function getGaleria($id)
	{
		$this->sql = "SELECT G.*, S.GSM_DESC AS DESC1, S2.GSM_DESC AS DESC2, S.GSM_PARENT_ID 
						FROM galeria_imagens G 
						JOIN galeria_submenu S ON G.GIM_GSM_ID = S.GSM_ID
						LEFT JOIN galeria_submenu S2 ON S.GSM_PARENT_ID = S2.GSM_ID
                        WHERE G.GIM_GSM_ID = ".$id." ORDER BY G.GIM_IMAGE DESC";
		$this->Res = self::$conn->query($this->sql)->fetchAll(PDO::FETCH_ASSOC);
		return $this->Res;
	}

}