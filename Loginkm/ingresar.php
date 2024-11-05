<?php
session_start();
if(isset($_SESSION["dniadm"]) || isset($_SESSION["dnicli"])){
  if(isset($_SESSION["dnicli"])){
    header("location:inicio_cliente.php");
  }else{
    header("location:inicio_administrador.php");
  }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Cursos de Capacitación</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
 
 
   <?php
     
     include('header.php');

   ?>
      
           
    
   <!-- Index.php contiene un Formulario de Registro de Cursos de Capacitación--> 

   
   
  <section>
   
  
  <div class="container mt-2 mb-5">
  <div class="text-center mt-5 mb-2"><h2>Inicio de Sesión</h2></div>	
  	
  <form class="row g-3" method="post" action="ValidarInicioSeccion.php">

  <div class="col-12">
    <label for="dni" class="form-label">* DNI usuario:</label>
    <input type="text" class="form-control" name="dni" id="dni" placeholder="Ingrese 8 Dígitos numéricos">
    <label for="clave" class="form-label">* Clave:</label>
    <input type="text" class="form-control" name="clave" id="clave" placeholder="Ingresa Contrseña de al menos 8 caracteres">
    <label for="tipo" class="form-label">* Perfil:</label>
    <select class="form-select" aria-label="Disabled select example" name="tipo" id="tipo">
    <option selected>Selecciona tu perfil</option>
    <option value="cliente">cliente</option>
    <option value="administrador">administrador</option>
</select>
  </div>
  <div class="col-12 text-center">
    <button type="submit" class="btn btn-primary" name="enviar" id="enviar">Ingresar</button>
  </div>
  </form>
  <?php
  //Evalua si existe mensaje enviado del archivo ValidarInicioSeccion.php
  if(isset($_GET["mensaje"])){
    if($_GET["mensaje"]=="ok"){
      if(isset($_SESSION["dnicli"])){
        header("location:inicio_cliente.php");
      }
      if(isset($_SESSION["dniadm"])){
        header("location:inicio_administrador.php");
      }
    }else{
      echo"<div class='alert alert-danger text-center mt-2'>Datos de Accso Incorrectos!</div>";
    }
  }
  ?>
  </section>

  <?php
    include('footer.php');
  ?>
   
   <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>