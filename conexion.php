<?php
	define('DB_HOST','localhost');
	define('DB_USER','tasks-app');
	define('DB_PASS','tasks-app');
	define('DB_NAME','tasks-app');
	# conectare la base de datos
    $con=@mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    if(!$con){
        die("imposible conectarse: ".mysqli_error($con));
    }
    if (@mysqli_connect_errno()) {
        die("Conexión falló: ".mysqli_connect_errno()." : ". mysqli_connect_error());
    }
    mysqli_set_charset($con,"utf8");
?>