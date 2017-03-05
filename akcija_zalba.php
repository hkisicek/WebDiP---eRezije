<?php

//Skripta za prihvacanje ili odbijanje zalbi.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$greska = "";
$baza = new Baza();
$vrijeme = azuriraj();

if (!isset($_SESSION['tip_korisnik']) || $_SESSION['tip_korisnik'] < 2) {
    header("Location:zabrana.php");
}
$dnevnikID=$_SESSION['ID_korisnik'];
$dnevnikInsert = "insert into Dnevnik values(default,'akcija_zalba.php','UPDATE Zalba SET Status=1;','$vrijeme',$dnevnikID,3);";
$baza->updateDB($dnevnikInsert);

if (isset($_GET['racun'])) {
    $zalba = $_GET['zalba'];
    $upit = "UPDATE Zalba SET Status=1 WHERE ID_zalba='$zalba'; ";
    $baza->updateDB($upit);
    header("Location:popis_zalbi.php");
}

if (isset($_GET['racunN'])) {
    $ID_racun = $_GET['racunN'];
    $zalba = $_GET['zalbaN'];
    $upit = "UPDATE Zalba SET Status=1 WHERE ID_zalba='$zalba'; ";
    $baza->updateDB($upit);

    $update1 = "UPDATE Racun SET Status=2 WHERE ID_racun='$ID_racun';";
    $baza->updateDB($update);


    header("Location:ocitano_stanje.php");
}
?>