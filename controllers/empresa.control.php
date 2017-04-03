<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
  require_once("libs/template_engine.php");
  require_once("models/empresa.model.php");
  require_once("models/roles.model.php");
  function run(){

    if(mw_estaLogueado()){
      $datos = array();
      $datos["mostrarErrores"] = false;
      $datos["errores"] = array();
      $datos["txtNombre"]="";
      $datos["txtRepresentante"] = "";
      $datos["txtComercial"]="";
      $datos["txtRTN"]="";

      if(isset($_POST["btnGuardar"])){
          if(empty($_POST["txtNombre"])){
           $errores[] = "El nombre empresa es requerido";
            redirectWithMessage("El nombre empresa es requerido");
        }

         if(empty($_POST["txtRepresentante"])){
           $errores[] = "El nombre representante es requerido.";
           redirectWithMessage("El nombre representante es requerido");
        }

        if(empty($_POST["txtComercial"])){
           $errores[] = "El nombre comercial es requerido.";
           redirectWithMessage("El nombre comercial es requerido");
        }

        if(empty($_POST["txtRTN"])){
           $errores[] = "El RTN es requerido";
           redirectWithMessage("El RTN es requerido");

        }

        // Si el array $errores está vacío, se aceptan los datos y se asignan a variables
        if(empty($errores)){
         $datos["txtNombre"]=filtrado($_POST["txtNombre"]);
         $datos["txtRepresentante"]=filtrado($_POST["txtRepresentante"]);
         $datos["txtComercial"]=filtrado($_POST["txtComercial"]);
         $datos["txtRTN"]=filtrado($_POST["txtRTN"]);

        }

            insertarEmpresa(filtrado($_POST["txtNombre"]),filtrado($_POST["txtRepresentante"]),filtrado($_POST["txtComercial"]),filtrado($_POST["txtRTN"]));
            redirectWithMessage("Empresa,Guardada Exitosamente ","index.php?page=listadoEmpresa");
      }
        if (isset($_POST["btnCancelar"])) {
            header("Location:index.php?page=listadoEmpresa");
        }

      renderizar("empresa",$datos);
    }else {
      mw_redirectToLogin("page=login2");
    }
  }
  run();
?>
