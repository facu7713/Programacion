<?php
function contar_registros($conex){
    $sql="SELECT COUNT(idProducto) AS cantidad_total FROM productos";
    $result=$conex->query($sql);
    $fila=$result->fetch_assoc();
    return $fila['cantidad_total'];
}
function registros_porpagina($conex,$pag){
    $sql="SELECT * FROM productos ORDER BY idProducto LIMIT ".($pag*5)." ,5";
    $result=$conex->query($sql);
    return $result;
}
?>