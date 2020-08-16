<?php

/**
 * Donations Manager
 * @author Elton Fabiano da Mota
 * @copyright Color Pix
 */

require __DIR__ . '/../Library/Db/Db.php';

class DonationsManager extends Db
{
    /**
     * Constructor
     */
	function __construct()
	{		
		self::connect();
    }

    /**
     * Reserve Increment Id
     * @param string
     */
    protected function reserveIncrementId($incrementId)
    {
        $query = self::$conn->prepare("INSERT INTO doacoes (increment_id) VALUES ('$incrementId')");
        $query->execute();
        return $this;
    }

    /**
     * Save Donations
     * @param array $data
     * @return string
     */
    public function save($data)
    {
        $query = self::$conn->query(
            'INSERT INTO doacoes (increment_id, valor, nome, email, documento, due_date) VALUES ("' .$data['increment_id']. '", ' .(float)$data['valor']. ', "' .$data['nome']. '", "' .$data['email']. '", "' .$data['documento']. '", "' .$data['due_date']. '")'       
        );
        return true;
    }
}
