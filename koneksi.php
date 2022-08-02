<?php

$connect = mysqli_connect('localhost', 'root', '', 'belajar');

if (!$connect) {
    exit("Tidak Berasil Terhubung ke Database");
}