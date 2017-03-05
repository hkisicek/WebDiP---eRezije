<?php

//Skripta za odjavu sa sustava.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");

$baza = new Baza();
$greska = "";

session_start();
if (!isset($_SESSION['tip_korisnik'])) {
    header("Location:zabrana.php");
    
} else {
    session_destroy();
    header("Location:prijava.php");
}
?>