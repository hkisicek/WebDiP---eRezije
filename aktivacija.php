<?php
//Skripta za aktivaciju korisnickog racuna.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");


$greska = "";
$baza = new Baza();
$vrijeme = azuriraj();
$kod = $_REQUEST["kod"];
$upit = "SELECT Ime, Prezime, Vrijeme FROM Korisnik WHERE Kod='$kod'; ";
$rezultat = $baza->selectDB($upit);

if ($rezultat) {
    $rez = $rezultat->fetch_array();
    $ime = $rez['Ime'];
    $prezime = $rez['Prezime'];

    $vrijemeReg = $rez['Vrijeme'];
    $sustav_vrijeme = azuriraj();

    $vrijeme1 = strtotime($sustav_vrijeme);
    $vrijeme2 = strtotime($vrijemeReg);

    $razlika = $vrijeme1 - $vrijeme2;

    if ($razlika < 12 * 3600) {
        $update = "UPDATE Korisnik SET Status = 1 WHERE Kod='$kod'; ";
        $baza->updateDB($update);
        $greska.="Aktivirali ste korisnicki racun!";

        $dnevnikInsert = "insert into Dnevnik values(default,'aktivacija.php','UPDATE Korisnik SET Status;','$vrijeme',null,3);";
        $baza->updateDB($dnevnikInsert);
    } else {
        $greska.="Aktivacijski kod je istekao! Za pomoc se obratite administratoru!";
    }
} else {
    $greska.="Kod ne postoji u bazi!";
}
?>
<!DOCTYPE html>
<!--
Početak projekta iz kolegija Web dizajn i programiranje.
Datum:1.6.2016.
-->
<html>
    <head>
        <title>E-Režije</title>
        <meta name="author" content="Helena Kišiček">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="./css/hkisicek1.css">
        <meta charset="UTF-8">
    </head>
    <body>
        <header id="header">
            <p>E-Režije</p>
            <a class="strana" href="index.php" style="">Povratak na početnu</a>
        </header>


        <div id="omotac">
            <ul class="topnav">
                <li></li>
            </ul>


            <section id="sadrzaj">
                <article id="greska"><?php echo $greska; ?> </article>

            </section>
        </div>
        <footer id="footer">
            <address>
                Kontaktirajte me na: <br>
                <a class="strana" href="mailto:hkisicek@foi.hr">Helena Kišiček</a>
            </address>
            <p><small>&copy; Sva prava pridržana, Web dizajn i programiranje, 2016</small></p>

        </footer>
    </body>
</html>
