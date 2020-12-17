<?php
session_start();

$db_host = "localhost:3308";
$db_user = "mirim";
$db_password = "1234";
$db_name = "mirim";


$con = new mysqli($db_host, $db_user, $db_password, $db_name); // 데이터베이스 접속

if ($con->connect_errno) { 
    echo"<script>window.alert('디비연결실패');</script>";
    die('Connection Error : '.$con->connect_error);
} // 오류가 있으면 오류 메세지 출력

$id = $_POST['id'];
$pw = $_POST['pw'];

$query = "select * from user where id='$id' and pw='$pw'";
$result = mysqli_query($con , $query);
$row = mysqli_fetch_array($result);

if($id==$row['id']&&$pw==$row['pw']){
    $_SESSION['id'] = $row['id'];
    $_SESSION['name'] = $row['name'];
    echo "<script>location .href='index.html'</script>";
}
else{
    echo"<script>window.alert('invalid username or password');</script>";
    echo "<script>location.herf='login.php';</script>";
}

?>