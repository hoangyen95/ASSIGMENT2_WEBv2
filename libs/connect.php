<?php

//$conn = null;


  $server = "localhost";
  $username = "root";
  $password = "";
  $database = "webdata5";

  global $conn;
  $conn  = mysqli_connect($server, $username, $password, $database);

  if(!$conn) {
    die(mysqli_connect_error());
  }









// function close(){
//   global $conn;
//   if($conn){
//     mysqli_close($conn);
//     echo "yep";
//   }
// }
// close();


?>