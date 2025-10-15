<?php
// asigna variables a los valores capturados por el metodo POST
    $nombre= $_POST['nombre'];
    $Edad= $_POST['Edad'];
    $Fecha=$_POST['Fecha'];
    $VIP= $_POST['VIP'];
    $Provincia= $_POST['Provincia'];
    $Ciudad= $_POST['Ciudad_De_Origen'];
    $Direccion= $_POST['Direccion'];
    $Telefono= $_POST['Telefono'];

// confirma que la conexion este correcta
        include 'conexion2.php';

// genere el insert para el envio de los valores asigandos en las variables a la tabla de la BD
        $consulta = $conexion2 -> query("INSERT INTO compania(nombre,Edad,Fecha,VIP,Provincia,Ciudad_De_Origen,Direccion,Telefono) VALUES ('$_REQUEST[nombre]','$_REQUEST[Edad]','$_REQUEST[Fecha]','$_REQUEST[VIP]','$_REQUEST[Provincia]','$_REQUEST[Ciudad_De_Origen]','$_REQUEST[Direccion]','$_REQUEST[Telefono]')");

        echo "correcto";
?>