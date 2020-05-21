<?php

/**
 * Autoload
 */

require "../Controllers/".$_POST['control'].".php";

/**
* Controle de Requisição "Request"
*/

class Request
{
	public static $acao;

	public static function uri(array $values)
		{
			$inst = new $values['control']();
			self::$acao = $inst->$values['method'](array_slice($values, 2));

			return self::$acao;
		}

	}

$res = Request::uri($_POST);
echo $res;