<?php

//Skripta za rezervacije.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");

session_start();
$baza = new Baza();
$greska = "";
$vrijeme = azuriraj();

if (!isset($_SESSION['tip_korisnik']) || $_SESSION['tip_korisnik'] < 2) {
    header("Location:zabrana.php");
}

$dnevnikID=$_SESSION['ID_korisnik'];

if (isset($_GET['potvrdi'])) {
    $ID_rezervacija = $_GET['potvrdi'];
    $email = $_GET['email'];
    $ID_korisnik = $_SESSION['ID_korisnik'];

    $select1 = "SELECT * FROM Rezervacija WHERE ID_rezervacija='$ID_rezervacija';";
    $rezultat = $baza->selectDB($select1);
    $rez = $rezultat->fetch_array();
    $datum = $rez['Datum'];

    $dnevnikInsert = "insert into Dnevnik values(default,'akcija_rezervacija.php','SELECT * FROM Rezervacija;','$vrijeme',$dnevnikID,3);";
    $baza->updateDB($dnevnikInsert);

    $upit = "UPDATE Rezervacija SET Status=1 WHERE ID_rezervacija='$ID_rezervacija';";
    $baza->updateDB($upit);

    $poruka = "Postovani, Vasa rezervacija na datum $datum je odobrena!";
    $adresa = $email;
    $naslov = "Rezervacija odobrena!";
    mail($adresa, $naslov, $poruka);

    header("Location:pregled_rezervacija.php");
}

if (isset($_GET['odbij'])) {
    $ID_rezervacija = $_GET['odbij'];
    $email = $_GET['email'];

    $select1 = "SELECT * FROM Rezervacija WHERE ID_rezervacija='$ID_rezervacija';";
    $rezultat = $baza->selectDB($select1);
    $rez = $rezultat->fetch_array();
    $datum = $rez['Datum'];

    $dnevnikInsert = "insert into Dnevnik values(default,'akcija_korisnik.php','SELECT * FROM Rezervacija;','$vrijeme',$dnevnikID,2);";
    $baza->updateDB($dnevnikInsert);

    $upit = "UPDATE Rezervacija SET Status=3 WHERE ID_rezervacija='$ID_rezervacija';";
    $baza->updateDB($upit);

    $poruka = "Postovani, Vasa rezervacija na datum $datum je odbijena!";
    $adresa = $email;
    $naslov = "Rezervacija odbijena!";
    mail($adresa, $naslov, $poruka);

    header("Location:pregled_rezervacija.php");
}
?>
