<?php
// variables de conexion
		$servidor='localhost';
		$basedatos='almacen';
		$usuario='root';
		$contrasena='';

$conexion2 = new mysqli($servidor,$usuario,$contrasena,$basedatos);
// validacion de variables para conectarnos
			if ($conexion2->connect_errno)
			{
				echo"error de conexion verifique sus datos ";
			}
			else 
			{
				echo "<h1>Has agregado un nuevo usuario</h1>";
			}
?>
<style>
body{
	background-color: rgba(187, 139, 139, 1);
	color: black;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 20px;
	margin-top: 70px;
}
button, input[type='submit']{
	background-color: #fff;
	color: #ff3a3a;
	border: none;
	border-radius: 10px;
	padding: 10px 25px;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	margin: 10px;
}
button:hover, input[type='submit']:hover{
	background-color: #ff3a3a;
	color: #fff;
}
a {
	text-decoration: none;
	color: inherit;
}
</style>

<button><a href="./consulta2.php">Consultar</a></button>