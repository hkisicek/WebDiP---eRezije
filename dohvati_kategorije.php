<?php

include_once ("okviri/baza_class.php");

$baza = new Baza();

//if (isset($_POST['ustanova'])) {
    $ustanova = 3;
    $upit = "SELECT Naziv FROM Kategorija_ocitavanja where FK_ustanova = 3;";
    $rezultat = $baza->selectDB($upit);
    if ($rezultat->num_rows != 0) {
        $rez = $rezultat->fetch_array();
    } else {
        echo 'Greska!';
    }
    echo json_encode($rez);
//} else {
//    echo 'nest fali';
//}
?>