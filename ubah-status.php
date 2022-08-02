<?php

session_start();

if(!isset($_SESSION['login'])){
    header('location:login.php');
    exit;
}

include('connection.php');

$id = $_GET['no_antrian'];
$sql = "SELECT * FROM data_antrian WHERE no_antrian='$id'";
$query = mysqli_query($connect, $sql);
$data = mysqli_fetch_assoc($query);

print_r($data);

if ($data['status_antrian'] == 1) {
    $status = 2;
    $sql = "UPDATE data_antrian SET status_antrian='$status' WHERE no_antrian='$id'";
    $query = mysqli_query($connect, $sql);
    if ($query) {
        header('Location: list-antrian.php');
    } else {
        die("gagal mengubah status...");
    }
} elseif ($data['status_antrian'] == 2) {
    $status = 3;
    $sql = "UPDATE data_antrian SET status_antrian='$status' WHERE no_antrian='$id'";
    $query = mysqli_query($connect, $sql);
    if ($query) {
        header('Location: list-antrian.php');
    } else {
        die("gagal mengubah status...");
    }
}