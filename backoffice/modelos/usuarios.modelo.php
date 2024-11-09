  <?php
require_once "conexion.php";
class ModeloUsuarios{
	// Registro de usuarios
	static public function mdlRegistroUsuario($tabla, $datos){
		$sql = "INSERT INTO $tabla(perfil, nombre, email, password, suscripcion, verificacion,email_encriptado, enlace_afiliado, patrocinador) VALUES (:perfil, :nombre, :email, :password, :suscripcion, :verificacion,  :email_encriptado, :enlace_afiliado, :patrocinador)";
		$stmt = Conexion::conectar()->prepare($sql);
		$stmt->bindParam(":perfil", $datos["perfil"], PDO::PARAM_STR);
		$stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(":email", $datos["email"], PDO::PARAM_STR);
		$stmt->bindParam(":password", $datos["password"], PDO::PARAM_STR);
		$stmt->bindParam(":suscripcion", $datos["suscripcion"], PDO::PARAM_STR);
		$stmt->bindParam(":verificacion", $datos["verificacion"], PDO::PARAM_STR);
		$stmt->bindParam(":email_encriptado", $datos["email_encriptado"], PDO::PARAM_STR);
		$stmt->bindParam(":enlace_afiliado", $datos["enlace_afiliado"], PDO::PARAM_STR);
		$stmt->bindParam(":patrocinador", $datos["patrocinador"], PDO::PARAM_STR);

		if ($stmt->execute()) {
			return "OK";
		}else{
			return print_r(Conexion::conectar()->errorInfo());
		}
		$stmt->close();
		$stmt = null;
	}

	// Mostrar usuarios
	static public function mdlMostrarUsuarios($tabla, $item, $valor){
		if($item != null && $valor !=null)
		{
			$query = "SELECT * FROM $tabla WHERE $item = :$item";
			$stmt = Conexion::conectar()->prepare($query);
			$stmt->bindParam(":".$item, $valor, PDO::PARAM_STR);
			$stmt -> execute();
			return $stmt ->fetch();
		}else{
			$query = "SELECT * FROM $tabla";
			$stmt = Conexion::conectar()->prepare($query);
			$stmt -> execute();
			return $stmt ->fetchAll();
		}
		$stmt->close();
		$stmt = null;
	}

	// Actualizar usuario
	static public function mdlActualizarUsuario($tabla, $id, $item, $valor){
		$query = "UPDATE $tabla SET $item = :$item WHERE id_usuario =:id_usuario";
		$stmt = Conexion::conectar()->prepare($query);
		$stmt->bindParam(":".$item, $valor, PDO::PARAM_STR);
		$stmt->bindParam(":id_usuario",$id, PDO::PARAM_STR);
		if($stmt -> execute()){
			return "OK";
		}else{
			return print_r(Conexion::conectar()->errorInfo());
		}
		$stmt->close();
		$stmt = null;
	}
}
?>
