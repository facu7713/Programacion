<?php
$host="localhost";
$usuario="root";
$pass="";
$bd="abdkiosco";
//vrea la conexion a la BD
$conex=new mysqli($host,$usuario,$pass,$bd);
//verifica la conexión
if($conex->connect_error){
    die("erorr en la conexión!".$conex->connect_error);
} 
?>