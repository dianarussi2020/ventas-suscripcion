 <?php
 	require_once "../controladores/usuarios.controlador.php";
 	require_once "../modelos/usuarios.modelo.php";
	class TablaUsuarios{
	 	public function mostrarTabla(){
	 		$item = null;
			$valor = null;
			$usuarios = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

			if(count($usuarios) == 0){
				echo '{ "data":[]}';
				return;
			}
			$datosJson = '{"data":['; 

			foreach ($usuarios as $key => $value) {
				if($value["perfil"] != "admin"){

					/*FOTO USUARIO*/
					if($value["foto"] == ""){
						$foto = "<img src='vistas/img/usuarios/default/default.png' class='img-fluid rounded-circle' width='30px'>";
					}else{
						$foto = "<img src='".$value["foto"]."' class='img-fluid rounded-circle' width='30px'>";
					}
					/*SUSCRIPCION*/
					if($value["suscripcion"] == 0){
						$suscripcion = "<button type='button' class='btn btn-danger btn-sm'>Inactiva</button>";
					}else{
						$suscripcion = "<button type='button' class='btn btn-success btn-sm'>Activa</button>";
					}
					$datosJson .= '[
						"'.$key.'",
				      	"'.$foto.'",
				      	"'.$value["nombre"].'",
					    "'.$value["email"].'",
					    "'.$value["pais"].'",
				      	"'.$suscripcion.'",
				      	"'.$value["id_suscripcion"].'",
					    "'.$value["ciclo_pago"].'",
				      	"'.$value["enlace_afiliado"].'",
				      	"'.$value["patrocinador"].'",
					    "'.$value["paypal"].'",
						"'.$value["fecha"].'",
						"'.$value["vencimiento"].'"
					],';
				}				
			}
			$datosJson = substr($datosJson, 0, -1);
			$datosJson .= ']}';
			echo $datosJson;
	 	}
	}
	$activarTabla = new TablaUsuarios();
	$activarTabla->mostrarTabla();
?>