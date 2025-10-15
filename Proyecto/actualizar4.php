<html>
	<head>
		<title>Actualizar usuario</title>
		<meta charset="UTF-8" />
		<style>
            body{
                background-color: rgb(255, 58, 58);
                color: aliceblue;
                text-align: center;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 20px;
                margin-top: 70px;
            }
            input{
                margin: 10px;
                padding: 10px;
                border-radius: 10px;
                border: none;
                font-size: 15px;
            }
            select{
                margin: 10px;
                padding: 10px;
                border-radius: 10px;
                border: none;
                font-size: 15px;
            }
        </style>
	</head>
	
	<body>
		<form action="actualizar5.php" method="post">
			<select name="nombreOriginal">
			<?php
				include 'conexion2.php';
				$consulta = $conexion2 -> query ("SELECT nombre FROM compania ORDER BY nombre ASC") or die ("Ha fallado la conexión");
					while ( $registro = $consulta -> fetch_assoc()) {
						echo'<option>'.$registro['nombre'].'</option>';
					}
			?>
			</select>
			<input type="text" name="nuevoNombre" /><br/>
			<input type="submit" value="Cambiar!!" />
		</form>
	</body>
</html>