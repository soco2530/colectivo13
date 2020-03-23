<?php
session_start();
include "admin/database.php";
$db = new Database();
$con = $db->connect();
if (isset($_POST["nombres"])) {

	$nombres = $_POST["nombres"];
	$apellidos = $_POST["apellidos"];
	$email = $_POST['email'];
	$clave = $_POST['clave'];
	$repassword = $_POST['repassword'];
	$telefono = $_POST['telefono'];
	$direccion = $_POST['direccion'];
	$documento = $_POST['documento'];
	$razonsocial = $_POST['razon_social'];
	$name = "/^[a-zA-Z ]+$/";
	$emailValidation = "/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9]+(\.[a-z]{2,4})$/";
	$number = "/^[0-9]+$/";

if(empty($nombres) || empty($apellidos) || empty($email) || empty($clave) || empty($repassword) ||
	empty($telefono) || empty($direccion) || empty($documento) || empty($razonsocial)){

		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><b>PLease Fill all fields..!</b>
			</div>
		";
		exit();
	} else {
		if(!preg_match($name,$nombres)){
		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>this $nombres is not valid..!</b>
			</div>
		";
		exit();
	}
	if(!preg_match($name,$apellidos)){
		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>this $apellidos is not valid..!</b>
			</div>
		";
		exit();
	}
	if(!preg_match($emailValidation,$email)){
		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>El $email no es valido!</b>
			</div>
		";
		exit();
	}
	if(strlen($clave) < 5 ){
		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>La clave tiene que se mayor a 5 digitos</b>
			</div>
		";
		exit();
	}
	if(strlen($repassword) < 5 ){
		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>La clave tiene que se mayor a 5 digitos</b>
			</div>
		";
		exit();
	}
	if($clave != $repassword){
		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>
				La contraseña no es la misma</b>
			</div>
		";
	}
	if(!preg_match($number,$telefono)){
		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>Mobile number $telefono is not valid</b>
			</div>
		";
		exit();
	}
	if(!(strlen($telefono) == 9)){
		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>Numero telefonico tiene que se 9 digitos</b>
			</div>
		";
		exit();
	}
	//existing email address in our database
	$sql = "SELECT * FROM colaboradores WHERE email = '$email' LIMIT 1" ;
	$check_query = mysqli_query($con,$sql);
	$count_email = mysqli_num_rows($check_query);
	if($count_email > 0){
		echo "
			<div class='alert alert-danger'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>
				La dirección de correo electrónico ya está registrado. Pruebe con otra dirección de correo electrónico</b>
			</div>
		";
		exit();
	} else {
		$clave = md5($clave);
		$sql = "INSERT INTO colaboradores
		(idcolaborador, nombre, apellidos, email,
		clave, telefono, direccion, dni, Razonsocil, fecharegistro)
		VALUES (NULL, '$nombres', '$apellidos', '$email',
		'$clave', '$telefono', '$direccion', '$documento', '$razonsocial', now())";
		$run_query = mysqli_query($con,$sql);
		$_SESSION["uid"] = mysqli_insert_id($con);
		$_SESSION["name"] = $nombres;
		$ip_add = getenv("REMOTE_ADDR");
		$sql = "UPDATE cart SET user_id = '$_SESSION[uid]' WHERE ip_add='$ip_add' AND user_id = -1";
		if(mysqli_query($con,$sql)){
			echo "register_success";
			exit();
		}
	}
	}

}
?>
