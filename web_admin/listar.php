<?php
include('database.php');
$query = "SELECT * FROM comision";
$result = mysqli_query($connection, $query);

if(!$result){
    die('Query failed'.mysqli_error($connection));


}
$json = array();
while($row = mysqli_fetch_array($result)){
    $json[]=array(
        
        'descripcion'=> $row['descripcion'],
        'idcomision'=> $row['idcomision']

    );

}
$jsonstring = json_encode($json);
echo $jsonstring;
    


?>