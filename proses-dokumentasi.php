<?php

session_start();

if(!isset($_SESSION['login'])){
    header('location:login.php');
    exit;
}

include('connection.php');
if (isset($_POST['submitDocs'])) {

    $id = $_POST['antrian'];

    $namafile = $_FILES['uDocs']['name'];
    $ukuranfile = $_FILES['uDocs']['size'];

    print_r($namafile);

    if ($ukuranfile > 52428800) {
        header('location: list-antrian.php?pesan=size');
    }
    if ($namafile != "") {
        $izinEkstensi = array('jpg', 'png');
        $pisahEkstensi = explode('.', $namafile);
        $ekstensi = strtolower(end($pisahEkstensi));

        $file_tmp = $_FILES['uDocs']['tmp_name'];
        $namaEnc = md5(rand(5, 11));

        $namaFileBaru = $namaEnc . '-' . $namafile;

        if (in_array($ekstensi, $izinEkstensi) === true) {
            //----------------------------------------
            move_uploaded_file($file_tmp, 'dokumentasi/' . $namaFileBaru);

            $sql = "UPDATE data_antrian SET file_dokumentasi='$namaFileBaru' WHERE no_antrian='$id'";
            $query = mysqli_query($connect, $sql);

            if ($query) {
                header('location: list-antrian.php?pesan=fileberhasil');
            } else {
                print_r(mysqli_error($connect));
            }
        } else {
            header('location: list-antrian.php?pesan=salahekstensi');
        }
    } else {
        header('location: list-antrian.php?pesan=filekosong');
    }
}