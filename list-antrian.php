<?php

include('connection.php');

session_start();

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Antree - Daftar Antrian</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="style.css" rel="stylesheet">
    <link href="http://fonts.cdnfonts.com/css/sf-pro-display" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a49a4a7eca.js" crossorigin="anonymous"></script>
    <script src="jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
</head>

<body>

    <?php
    if (isset($_SESSION['success'])) {
        echo '<div class="alert alert-success">' . $_SESSION['success'] . '</div>';
        unset($_SESSION['success']);
    } elseif (isset($_SESSION['salah_ekstensi'])) {
        echo '<div class="alert alert-danger">' . $_SESSION['salah_ekstensi'] . '</div>';
        unset($_SESSION['salah_ekstensi']);
    } elseif (isset($_SESSION['successUploadYes'])) {
        echo '<div class="alert alert-success">' . $_SESSION['successUploadYes'] . '</div>';
        unset($_SESSION['successUploadYes']);
    } elseif (isset($_SESSION['successUploadNo'])) {
        echo '<div class="alert alert-danger">' . $_SESSION['successUploadNo'] . '</div>';
        unset($_SESSION['successUploadNo']);
    } elseif (isset($_SESSION['successEditYes'])) {
        echo '<div class="alert alert-success">' . $_SESSION['successEditYes'] . '</div>';
        unset($_SESSION['successEditYes']);
    } elseif (isset($_SESSION['successEditNo'])) {
        echo '<div class="alert alert-danger">' . $_SESSION['successEditNo'] . '</div>';
        unset($_SESSION['successEditNo']);
    }

    ?>
    <!-- Navbar -->

    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <nav class="nav nav-pills nav-fill">
                <a href="#"><img src="logo/antree-brand.png" alt="logo-antree" height="32px" class="pt-1 me-4 ms-3"></a>
                <a class="nav-link text-warning" aria-current="page" href="#">Dashboard</a>
                <a class="nav-link active bg-warning text-dark" href="#">Antrian</a>
                <a class="nav-link text-warning" href="#">Data Customer</a>
                <a class="nav-link text-white-50 disabled" href="#" tabindex="-1" aria-disabled="true">Dokumentasi</a>
            </nav>
        </div>
    </nav>

    <!-- End Navbar -->

    <!-- Content -->
    <div class="container-fluid">
        <div class="row mx-auto mt-3 bg-warning p-2 rounded">
            <h2 class="text-center" style="font-weight: bold;">Daftar Antrian</h2>
        </div>
        <div class="my-4">
            <a type="button" class="btn btn-warning" href="form-daftar.php"><i class="fa-solid fa-plus"></i><span
                    class="px-2">Tambah
                    Antrian</span></a>
        </div>
        <form>
        <div class="form-row">
            <div class="col-md-3">
                <label for="kategori">
                    <h5 class="text-center">Kategori</h5>
                </label>
                <select class="form-control form-inline" id="kategori" name="kategori">
                    <option value="">- Pilih Kategori -</option>
                    <?php 
                        $query = "SELECT * FROM data_produk";
                        $result = mysqli_query($connect, $query);

                        while ($row = mysqli_fetch_array($result)) {
                            echo '<option value="' . $row['id_produk'] . '">' . $row['nama_produk'] . '</option>';
                        }
                    ?>
                </select>
            </div>
        </form>

        <div class="table-responsive my-3">
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Sales</th>
                    <th scope="col">Kata Kunci </th>
                    <th scope="col">Pekerjaan</th>
                    <th scope="col">Start</th>
                    <th scope="col">Deadline</th>
                    <th scope="col">Workshop</th>
                    <th scope="col" class="text-center">File</th>
                    <th scope="col">Status</th>
                    <th scope="col" class="text-center">Opsi</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Query Antrian
                $sql = "SELECT * FROM data_antrian ORDER BY no_antrian DESC";
                $query = mysqli_query($connect, $sql);


                while ($result = mysqli_fetch_array($query)) {
                    echo '<tr>';

                    $kodeAntrian = preg_replace("/[^a-zA-Z0-9]/", "", $result['tanggal_antrian']);
                    $kodeAntrian = $kodeAntrian . "-" . $result['no_antrian'];

                    echo '<td>' . $kodeAntrian . '</td>';
                    echo '<td>' . $result['nama_sales'] . '</td>';
                    echo '<td>' . $result['keyword_stempel'] . '</td>';
                    echo '<td>' . $result['nama_pekerjaan'] . '</td>';
                    echo '<td>' . $result['mulai_kerja'] . '</td>';
                    echo '<td>' . $result['selesai_kerja'] . '</td>';
                    echo '<td>' . $result['tempat_workshop'] . '</td>';

                    echo '<td class="text-center">';
                    if ($result['file_desain'] == "") {
                        echo "<a href='edit-file.php?no_antrian=" . $result['no_antrian'] . "' type='button' class='btn btn-primary btn-sm'><i class='fa-solid fa-circle-arrow-up'></i><span class='mx-2'>Upload</span></a>";
                    } else {
                        echo "<a href='file/" . $result['file_desain'] . "' type='button' class='btn btn-primary btn-sm'><i class='fa-solid fa-circle-down'></i><span class='mx-2'>Download</span></a>";
                    }
                    echo '</td>';

                    echo '<td>';
                    if ($result['status_antrian'] == 3) {
                        echo '<span class="badge bg-success text-light">Selesai</span>';
                    } else if ($result['status_antrian'] == 2) {
                        echo '<span class="badge bg-warning text-dark">Proses</span>';
                    } else if ($result['status_antrian'] == 1) {
                        echo '<span class="badge bg-danger text-light">Belum</span>';
                    }
                    echo '</td>';

                    echo '<td class="text-center">';
                    echo '<a href="edit-antrian.php?no_antrian=' . $result['no_antrian'] . '" class="btn btn-warning btn-sm mx-1">Edit</a>';
                    echo '<a href="delete-antrian.php?no_antrian=' . $result['no_antrian'] . '" class="btn btn-danger btn-sm mx-1">Delete</a>';
                    echo '</td>';
                    echo '</tr>';
                }
                ?>
            </tbody>
        </table>
        </div>
        <p>Total Antrian : <?php echo mysqli_num_rows($query) ?></p>
    </div>
    <!-- End Content -->


</body>

</html>
