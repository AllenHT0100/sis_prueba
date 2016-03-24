<?php
/**
*@package pXP
*@file gen-ACTUsuarios.php
*@author  (admin)
*@date 23-03-2016 22:52:33
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUsuarios extends ACTbase{    
			
	function listarUsuarios(){
		$this->objParam->defecto('ordenacion','id_usuario');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUsuarios','listarUsuarios');
		} else{
			$this->objFunc=$this->create('MODUsuarios');
			
			$this->res=$this->objFunc->listarUsuarios($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUsuarios(){
		$this->objFunc=$this->create('MODUsuarios');	
		if($this->objParam->insertar('id_usuario')){
			$this->res=$this->objFunc->insertarUsuarios($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUsuarios($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUsuarios(){
			$this->objFunc=$this->create('MODUsuarios');	
		$this->res=$this->objFunc->eliminarUsuarios($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>