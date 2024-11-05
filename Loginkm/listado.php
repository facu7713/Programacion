<?php
session_start();
if(!isset($_SESSION["dniadm"]) && !isset($_SESSION["dnicli"])){
    header("location:index.php");
}elseif(isset($_SESSION["dniadm"])){
    header("location:inicio_administrador.php");
}
require_once "conexion.php";
require_once "f_paginacionfuntion.php";
$cantamx=contar_registros($conex);
if(!isset($_GET['pg'])){
    $pag=0;
    $result=registros_porpagina($conex,$pag);
}else{
    $pag=$_GET['pg'];
    $result=registros_porpagina($conex,$pag);
}
/*$sql="SELECT * FROM productos";
$result = $conex->query($sql);*/
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sitio Web</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
 
 
      <?php
        include('header.php');

      ?>
      
            
    
   <!-- Index.php contiene la página Inicial de un Sitio Web--> 

      
  <section>
  
  <div class="container text-center">
        <div class="text-center mt-5 mb-3"><h3>Listado de Productos</h3></div>
        
        <table class="table table-striped table-hover">


            <thead>
                <tr>
                <th scope="col">ID Producto</th>
                <th scope="col">Nombre</th>
                <th scope="col">Precio</th>
                <th scope="col">Fecha Alta</th>
                <th scope="col">Stock</th>
                </tr>
            </thead>
        
            <?php

            // Se evalúa si el resultado de la consulta es mayor a cero
            if ($result->num_rows>0){

            ?>

            <tbody>

            <?php

                /* Mientras existan resultados mayores a cero se guardan en un arreglo asociativo llamado $fila */

                While ($fila=$result->fetch_assoc()){
    
            ?>
               <tr>
                    
               <th scope="row"><?php echo $fila["idProducto"]; ?></th>
               <td><?php echo $fila["nombre"]; ?></td>
               <td><?php echo $fila["precio"]; ?></td>
               <td><?php echo $fila["fecha_alta"]; ?></td>
               <td><?php echo $fila["existencia"]; ?></td>
               </tr>
                

            <?php
            // Cierra el While
            }
            ?>         
            
            </tbody>
      
       </table></div>
       <ul class="pagination justify-content-center">
        <?php
        $itemxpag=ceil($cantamx/5);
        for($i=0;$i<$itemxpag;$i++){
            echo"<li class='page-item'><a class='page-link' href='listado.php?pg=".$i."'>".($i+1)."</a></li>";
        }
        ?>
       </ul>

	   <?php

	    }else{

          // Si el resultado de la consulta es cero 

          echo "</table></div>";
          echo "<div class='container text-center lead my-3 py-3'><div class='alert alert-danger my-5 py-4'><p><em>No existen Productos! </em></p></div></div>";
         }
	   ?>  

  </section>

  <?php
    include('footer.php');
  ?>
   
   <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>