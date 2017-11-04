<?php
	//PHP Web Service Azure 
	 header('Content-Type: application/json'); //establece el formato json como formato a devolver
	 header("Access-Control-Allow-Origin: *");
	 header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
	
	$username="xxx"; //nombre de usuario 
	$password="xxx";	//contraseña
	$hostname="xxx"; //nombre de host
	
	$dbhandle=mysql_connect($hostname, $username, $password)
	or die("No es posible conectarse a MySQL");
	$seleccion=mysql_select_db("notas_materias") //nombre de la base de datos
	or die("Base de datos no disponible");
	
	function mostrar_registros($detalle){	//funcion para mostrar los registros
		$consulta=mysql_query("SELECT * FROM ".$detalle);	
		while($fila=mysql_fetch_assoc($consulta)){
			$registros[]=$fila;
		}
		return $registros;
	}	
	//Programación de las peticiones al web service
	if($_GET['peticion']=='general'){ //verbo GET
		$resultados=mostrar_registros($_GET['detalle']);
	}else{
		header('HTTP/1.1 405 Method Not Allowed');
		exit;
	}
	echo json_encode($resultados); //codificación del resultado en formato json
?>
