<?php
include "admin/database.php";
$db = new Database();
$con = $db->connect();

session_start();

#Login script is begin here
#If user given credential matches successfully with the data available in database then we will echo string login_success
#login_success string will go back to called Anonymous funtion $("#login").click()

if(isset($_POST["email"]) && isset($_POST["password"])){

	$email = mysqli_real_escape_string($con,$_POST["email"]);
	$password = md5($_POST["password"]);
	$sql = "SELECT * FROM colaboradores WHERE email = '$email' AND clave = '$password'";
	$run_query = mysqli_query($con,$sql);
	$count = mysqli_num_rows($run_query);
	//if user record is available in database then $count will be equal to 1
	if($count == 1){
		$row = mysqli_fetch_array($run_query);
		$_SESSION["uid"] = $row["idcolaborador"];
		$_SESSION["name"] = $row["nombre"];
		$ip_add = getenv("REMOTE_ADDR");
		mysqli_free_result($run_query);
		//we have created a cookie in login_form.php page so if that cookie is available means user is not login
			if (isset($_COOKIE["product_list"])) {
				$p_list = stripcslashes($_COOKIE["product_list"]);
				//here we are decoding stored json product list cookie to normal array
				$product_list = json_decode($p_list,true);
				for ($i=0; $i < count($product_list); $i++) {

					//After getting user id from database here we are checking user cart item if there is already product is listed or not
					$verify_cart = "SELECT id FROM cart WHERE user_id = $_SESSION[uid] AND p_id = ".$product_list[$i];
					$result  = mysqli_query($con,$verify_cart);
					if(mysqli_num_rows($result) < 1){
						//if user is adding first time product into cart we will update user_id into database table with valid id
						$update_cart = "UPDATE cart SET user_id = '$_SESSION[uid]' WHERE ip_add = '$ip_add' AND user_id = -1";
						mysqli_query($con,$update_cart);
					}else{
						//if already that product is available into database table we will delete that record
						$delete_existing_product = "DELETE FROM cart WHERE user_id = -1 AND ip_add = '$ip_add' AND p_id = ".$product_list[$i];
						mysqli_query($con,$delete_existing_product);
					}
				}

				mysqli_free_result($result);

				// Crear pedido
				$ps = mysqli_stmt_init($con);
				mysqli_stmt_prepare($ps, "INSERT INTO pedidos (idcliente, fechaRegistro, estado) VALUES(?, NOW(), 'A')");
	      mysqli_stmt_bind_param($ps, 'i', $_SESSION["uid"]);

	      if(mysqli_stmt_execute($ps)){
	        $lastId = mysqli_insert_id($con);
	      }else{
	        return ['status'=> 303, 'message'=> 'Failed to run query'];
	      }
				mysqli_stmt_free_result($ps);
				mysqli_stmt_close($ps);

				//Crear detalles pedido
				$ps = mysqli_stmt_init($con);
				mysqli_stmt_prepare($ps, "INSERT INTO detalle_pedido (idproducto, idpedido, cantidad, subtotal) VALUES(?, ?, ?, ?)");

				$p_list = stripcslashes($_COOKIE["product_list"]);
				$q_list = stripcslashes($_COOKIE["quantity_list"]);
				//here we are decoding stored json product list cookie to normal array
				$product_list = json_decode($p_list,true);
				$quantity_list = json_decode($q_list,true);

				$productos = $product_list;
				$cantidades = $quantity_list;

	      for($i = 0; $i < count($productos); $i++){
	        $idProducto = intval($productos[$i]);

	        $q = mysqli_query($con, "SELECT * FROM producto WHERE idproducto = '$idProducto' LIMIT 1");

					$num_rows = mysqli_num_rows($q);
					$idpedido = $lastId;

	        if ($num_rows > 0) {
	          while($row = mysqli_fetch_assoc($q)){
	            $precio = $row['precio'];
	            $cantidad = $cantidades[$i];
	            $subtotal = $precio * $cantidades[$i];

							mysqli_stmt_bind_param($ps, 'iiid', $idProducto, $idpedido, $cantidad, $subtotal);
	            if(mysqli_stmt_execute($ps)){
							}else{
				        return ['status'=> 303, 'message'=> 'Failed to run query'];
				      }
	          }
	        }
	      }
				//here we are destroying user cookie
				setcookie("product_list","",strtotime("-1 day"),"/");
				setcookie("quantity_list","",strtotime("-1 day"),"/");
				//if user is logging from after cart page we will send cart_login
				mysqli_query($con, "DELETE FROM cart");
				echo "cart_login";
				exit();
			}
			//if user is login from page we will send login_success
			echo "login_success";
			exit();
		}else{
			echo "<span style='color:red;'>Please register before login..!</span>";
			exit();
		}
}
?>
