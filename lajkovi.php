<?php

//Skripta za evidentiranje sviđa mi se/ ne sviđa mi se opcije.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");

session_start();
$baza = new Baza();
$vrijeme = azuriraj();

if (!isset($_SESSION['ID_korisnik'])) {
    header("Location:zabrana.php");
}
$korisnik = $_SESSION['ID_korisnik'];

$dnevnikInsert = "insert into Dnevnik values(default,'lajkovi.php','INSERT INTO Lajkovi;','$vrijeme',$korisnik,3);";
$baza->updateDB($dnevnikInsert);

if (isset($_GET['lajkU'])) {
    $ustanova = $_GET['lajkU'];
    //$ID_ustanova = $_GET['ustanova'];

    $upit = "INSERT INTO Lajkovi VALUES (default,'$ustanova',null,'$vrijeme',1,0,'$korisnik');";
    $baza->updateDB($upit);
    header("Location:popis_ustanova.php");
} elseif (isset($_GET['dislajkU'])) {
    $ustanova = $_GET['dislajkU'];

    $upit = "INSERT INTO Lajkovi VALUES (default,'$ustanova',null,'$vrijeme',0,1,'$korisnik');";
    $baza->updateDB($upit);
    header("Location:popis_ustanova.php");
} elseif (isset($_GET['lajkK'])) {
    $kategorija = $_GET['lajkK'];
    $ustanovaID = $_GET['ustanova'];
    $upit = "INSERT INTO Lajkovi VALUES (default,null,'$kategorija','$vrijeme',1,0,'$korisnik');";
    $baza->updateDB($upit);
    header("Location:popis_kategorija.php?ustanova=$ustanovaID");
} elseif (isset($_GET['dislajkK'])) {
    $kategorija = $_GET['dislajkK'];
    $ustanovaID = $_GET['ustanova'];
    $upit = "INSERT INTO Lajkovi VALUES (default,null,'$kategorija','$vrijeme',0,1,'$korisnik');";
    $baza->updateDB($upit);
    header("Location:popis_kategorija.php?ustanova=$ustanovaID");
}
?>

