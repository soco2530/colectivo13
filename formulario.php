<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>colectivo la tortuga</title>
</head>
<body>
    
<h1>INTRODUCE TUS DATOS </h1>
<form action= "<?php echo $_SERVER['PHP_SELF']; ?> " method="post">
	<table>
		<tr>
			<td class="izq">
				Login:</td><td class="der"><input type="text" name="login"></td></tr>
				<tr><td class="izq">Password:<td class="der"><input type="password" name="password"></td></tr>
				<tr><td colspan="2"><input type="submit" name="enviar" value="LOGIN"></td></tr></table>
</form>
    
</body>
</html>