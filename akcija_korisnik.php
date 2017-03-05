<?php

//Skripta za blokiranje ili otkljucavanje korisnickog racuna.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");

$vrijeme = azuriraj();
session_start();
$baza = new Baza();

//Blokiranje racuna.
if (isset($_GET['korisnikB'])) {
    $ID_korisnik = $_GET['korisnikB'];

    $upit = "UPDATE Korisnik set Status=3 WHERE ID_korisnik='$ID_korisnik'";
    $baza->updateDB($upit);

    $dnevnikInsert = "insert into Dnevnik values(default,'akcija_korisnik.php','UPDATE Korisnik SET Status=3;','$vrijeme',$ID_korisnik,2);";
    $baza->updateDB($dnevnikInsert);

    $vrijeme = azuriraj();
    header("Location:pregled_korisnika.php");
}

//Otkljucavanje racuna.
if (isset($_GET['korisnikO'])) {
    $ID_korisnik = $_GET['korisnikO'];

    $upit = "UPDATE Korisnik set Status=1 WHERE ID_korisnik='$ID_korisnik'";
    $baza->updateDB($upit);

    $dnevnikInsert = "insert into Dnevnik values(default,'akcija_korisnik.php','UPDATE Korisnik SET Status=1;','$vrijeme',$ID_korisnik,2);";
    $baza->updateDB($dnevnikInsert);

    header("Location:pregled_korisnika.php");
}
?>