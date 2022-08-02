<?php

session_start();

if(!isset($_SESSION['login'])){
    header('location:login.php');
    exit;
}

include('connection.php');

if (isset($_POST['daftar'])) {
    $noAntrian = $_POST['noAntrian'];
    $sales = $_POST['isSales'];
    $keyword = $_POST['keywordStamp'];
    $pekerjaan = $_POST['whatJob'];
    $desainer = $_POST['isDesainer'];
    $operator = $_POST['isOperator'];
    $finishing = implode(",", $_POST['isFinishing']);
    $workshop = $_POST['whereWorkshop'];
    $qc = $_POST['isQC'];
    $stsAntrian = 1;

    //Tanggal dan No. Antrian
    $mulai = $_POST['startJob'];

    $selesai = $_POST['finishJob'];

    $tanggal = $_POST['tanggal'];

    //File Upload
    $namafile = $_FILES['uFile']['name'];
    $ukuranfile = $_FILES['uFile']['size'];

    if ($ukuranfile > 20971520) {
        header('location: list-antrian.php?pesan=size');
    } else {
        if ($namafile != "") {
            $izinEkstensi = array('cdr', 'pdf', 'ai');
            $pisahEkstensi = explode('.', $namafile);
            $ekstensi = strtolower(end($pisahEkstensi));

            $file_tmp = $_FILES['uFile']['tmp_name'];
            $namaEnc = md5(uniqid(rand()));

            $namaFileBaru = $namaEnc . '-' . $namafile;

            if (in_array($ekstensi, $izinEkstensi) === true) {
                move_uploaded_file($file_tmp, 'file/' . $namaFileBaru);

                $sql = "INSERT INTO data_antrian (tanggal_antrian, no_antrian, nama_sales, keyword_stempel, nama_pekerjaan, mulai_kerja, selesai_kerja, tempat_workshop, nama_desainer, nama_operator, nama_finishing, nama_qc, file_desain, status_antrian) VALUES ('$tanggal', '$noAntrian', '$sales', '$keyword', '$pekerjaan', '$mulai', '$selesai', '$workshop', '$desainer', '$operator', '$finishing', '$qc', '$namaFileBaru', '$stsAntrian');";
                $query = mysqli_query($connect, $sql);

                if ($query) {
                    $_SESSION['success'] = 'Data berhasil ditambahkan!';
                    header('location: list-antrian.php');
                } else {
                    $_SESSION['success'] = 'Data gagal ditambahkan!';
                    header('location: list-antrian.php');
                }
            } else {
                $_SESSION['salah_ekstensi'] = 'Upload file sesuai ekstensi!';
                header('location: list-antrian.php');
            }
        } elseif ($namafile == "") {
            $_SESSION['kosong'] = 'Mohon maaf, file tidak boleh kosong!';
            header('location: list-antrian.php?pesan=kosong');
        }
    }
}