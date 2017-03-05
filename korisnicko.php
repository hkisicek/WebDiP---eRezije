<?php

//Skripta za kreiranje json datoteke s informacijom o zauzetosti korisnickog imena.

include_once("okviri/baza_class.php");

$baza = new Baza();

if (isset($_GET['korisnicko_ime'])) {
    $korisnicko_ime = $_GET['korisnicko_ime'];
    $upit = "SELECT * FROM Korisnik where Korisnicko_ime = '$korisnicko_ime'";
    $rezultat = $baza->selectDB($upit);
    if ($rezultat->num_rows != 0) {
        $zauzeto['ima'] = true;
    } 
    else {
        $zauzeto['ima']=false;
    }
    echo json_encode($zauzeto);
    
}
else
{
    echo 'Pogreska!';
}
?>