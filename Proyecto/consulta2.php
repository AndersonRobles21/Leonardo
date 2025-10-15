<html>
	<html>
	<head>
		<title>Consultar usuarios</title>
		<meta charset="UTF-8" />
		<style>
			body{
				background :  lightblue;
				color :  black;
				font-family :  Arial;
				font-size :  20px;
				text-align :  center;
				 }
			th{
				border : 5px solid gray;
				background :  yellow;
                text-shadow: black;  
                width: 10%;
				 }
				 button{
			margin: 10px;
			padding: 10px;
			border-radius: 10px;
			border: none;
			font-size: 15px;
			background-color: black;
		}
	    </style>
	</head>
	<body>
	<?php

		include 'conexion2.php'; 
		
		$consulta = $conexion2 -> query("SELECT nombre,Edad,Fecha,VIP,Provincia,Ciudad_De_Origen,Direccion,Telefono FROM compania") or die ("Ha fallado la conexión");
			while ( $registro = $consulta -> fetch_assoc() ) {
				echo '<table>'.
				"<th>nombre</th>
				 <th>Edad</th>
				 <th>Fecha</th>
				 <th>VIP</th>
				 <th>Provincia</th>
				 <th>Ciudad_De_Origen</th>
				 <th>Direccion</th>
				 <th>Telefono</th>".

				"<tr>".
				"<td>".$registro['nombre']."</td>".
				"<td>".$registro['Edad']."</td>".
				"<td>".$registro['Fecha']."</td>".
				"<td>".$registro['VIP']."</td>".
				"<td>".$registro['Provincia']."</td>".
				"<td>".$registro['Ciudad_De_Origen']."</td>".
				"<td>".$registro['Direccion']."</td>".
				"<td>".$registro['Telefono']."</td>".
			    "</tr>".
			    "</table>";
               }
			    $conexion2=null;
	?>

	<br>
    	<button><a href="./eliminar2.php">Eliminar</a></button>
		<button><a href="./actualizar4.php">Modificar</a></button>
		<button><a href="./form.html">Inicio</a></button>
	</body>
	</html>