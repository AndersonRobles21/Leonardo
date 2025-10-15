<html>
	<head>
		<title>Ejercicio- Update</title>
		<meta charset="UTF-8" />
	</head>
	<body>
		<?php
			include 'conexion2.php';
			$consulta = $conexion2 -> query ("UPDATE compania SET nombre = '{$_POST['nuevoNombre']}' WHERE nombre = '{$_POST['nombreOriginal']}' ") or die ("Ha fallado la conexión");
			$conexion = null;
			echo 'Todo correcto';
		?>
	</body>
</html>