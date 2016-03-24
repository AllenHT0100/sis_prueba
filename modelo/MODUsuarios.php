<?php
/**
*@package pXP
*@file gen-MODUsuarios.php
*@author  (admin)
*@date 23-03-2016 22:52:33
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUsuarios extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUsuarios(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='tn.ft_usuarios_sel';
		$this->transaccion='TN_USU_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_usuario','int4');
		$this->captura('nombre','varchar');
		$this->captura('loguin','varchar');
		$this->captura('password','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUsuarios(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='tn.ft_usuarios_ime';
		$this->transaccion='TN_USU_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('nombre','nombre','varchar');
		$this->setParametro('loguin','loguin','varchar');
		$this->setParametro('password','password','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUsuarios(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='tn.ft_usuarios_ime';
		$this->transaccion='TN_USU_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_usuario','id_usuario','int4');
		$this->setParametro('nombre','nombre','varchar');
		$this->setParametro('loguin','loguin','varchar');
		$this->setParametro('password','password','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUsuarios(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='tn.ft_usuarios_ime';
		$this->transaccion='TN_USU_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_usuario','id_usuario','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>