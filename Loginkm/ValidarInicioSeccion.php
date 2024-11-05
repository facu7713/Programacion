<?php
//Se crean y usan variables de secion 
session_start();
require_once "conexion.php";
$dni_usu=$_POST["dni"];//se guarda el dni enviado del formuliario
$clave_usu=$_POST["clave"];//se guarda la clave enviado del formulario
$tipo_usu=$_POST["tipo"];//se guarda el perfil enviada del formulario
$sql="SELECT * FROM usuario WHERE dni='$dni_usu' and clave='$clave_usu' and tipo_usuario='$tipo_usu'";
//Se ejecuta la consulta
$result=$conex->query($sql);
if($result->num_rows>0){
    $fila=$result->fetch_assoc();
    if($fila["tipo_usuario"]=="cliente"){
        $_SESSION["dnicli"]=$fila["dni"];
        $_SESSION["nombreCompletoCli"]=$fila["nombre"]." ".$fila["apellido"];
    }
    if($fila["tipo_usuario"]=="administrador"){
        $_SESSION["dniadm"]=$fila["dni"];
        $_SESSION["nombreCompletoAdm"]=$fila["nombre"]." ".$fila["apellido"];
    }
    header("location:ingresar.php?mensaje=ok");
}else{
    header("location:ingresar.php?mensaje=error");
}
?>