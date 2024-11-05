<header>

     <!-- Encabezado -->       

      <div class="my-3 ms-3"><a href="index.php"><img src="imagenes/logo.png" alt="logo" id="img1"></a><span class="ms-5">Encabezado: Logo y Titulo</span></div>
            

       <!-- Menú de Navegación -->  
      <nav class="navbar navbar-expand-md navbar-light bg-light">
      <div class="container-fluid">
    
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
       <?php
       if(!isset($_SESSION["dnicli"]) && !isset($_SESSION["dniadm"])){
       ?>
       <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="index.php">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="error404.php?pag=Institucional">Institucional</a>
        </li>
       <li class="nav-item">
          <a class="nav-link" href="error404.php?pag=Novedades">Novedades</a>
        </li>
       </ul>
        <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="error404.php?pag=Registro">Registrarme</a>
        </li>		
        <li class="nav-item">
          <a class="nav-link" href="ingresar.php">Ingresar</a>
        </li>	
        </ul>
        <?php
       }elseif(isset($_SESSION["dnicli"])){
        ?>
        <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="inicio_cliente.php">Cliente</a>
        </li>	
        </ul>
        <ul class="navbar-nav ms-auto">
          <div class="text-primary mt-2">
            <span><?php echo $_SESSION["nombreCompletoCli"]?></span>
          </div>
          <div class="nav-item ">
            <a class="nav-link" href="listado.php">Listado</a>
          </div>
        <li class="nav-item ">
          
          <a class="nav-link" href="salir.php">Salir</a>
        </li>	
        </ul>
        <?php
       }elseif(isset($_SESSION["dniadm"])){
         ?>
         <ul class="navbar-nav">
         <li class="nav-item">
           <a class="nav-link" href="inicio_administrador.php">admistrador</a>
         </li>	
         </ul>
         <ul class="navbar-nav ms-auto">
           <div class="text-primary mt-2">
             <span><?php echo $_SESSION["nombreCompletoAdm"]?></span>
           </div>
         <li class="nav-item ">
           <a class="nav-link" href="salir.php">Salir</a>
         </li>	
         </ul>
         <?php
        }
        ?>
      </div>
      </div>
      </nav>       
</header>
    
    