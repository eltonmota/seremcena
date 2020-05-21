<?php

require '../Library/Db/Db.php';

/**
* Loop para insert das galerias.
*/

class InsertImagens extends Db
{

	public $sql;
	public $res;
	
	function __construct()
	{
		self::connect();
	}

	public function insertIMG($id, $dir, $qty)
	{
		for ($i=1; $i <= $qty; $i++) {

			$this->sql = "insert into galeria_imagens (gim_gsm_id, gim_dir, gim_image) values (".$id.", '".$dir."', '".$i."')";
			$this->Res = self::$conn->query($this->sql)->fetchAll(PDO::FETCH_ASSOC);
		}
		return;
	}
}

$obj = new InsertImagens();

if ($_POST){
	$action = $obj->insertIMG($_POST['id'], $_POST['dir'], $_POST['qty']);
}

?>
<!DOCTYPE html>
<html>
<body>
<form name="insIMG" action="" method="post">
	<input type="text" name="qty" placeholder="QTY">
	<input type="text" name="id" placeholder="ID">
	<input type="text" name="dir" placeholder="DIR">
	<input type="submit" name="submit" value="Run">
        <input type="file">
</form>
</body>
</html>

