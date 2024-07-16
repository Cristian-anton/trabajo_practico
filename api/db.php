<?php
$servername="localhost";
$username="root";
$password="";
$dbname="documentales_cac";

try
{
    $conn = new PDO("mysql:host=$servername;dbname=$dbname",$username,$password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //echo "conexion exitosa....";
}
catch(PDOException $e)
{
    echo "Conexion no valida".$e->getMessage();
}

?>