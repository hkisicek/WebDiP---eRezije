<?php
//Skripta za ispis podataka iz dnevnika.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();

$greska = "";
$baza = new Baza();
$vrijeme = azuriraj();

if (!isset($_SESSION['tip_korisnik']) && $_SESSION[tip_korisnik] != 3) {
    header("Location:zabrana.php");
}

$tip = $_SESSION['tip_korisnik'];
$dnevnikID = $_SESSION['ID_korisnik'];

$upit = "select * from Dnevnik";
$rezultat = $baza->selectDB($upit);

$dnevnikInsert = "insert into Dnevnik values(default,'dnevnik.php','SELECT * FROM Dnevnik;','$vrijeme',$dnevnikID,2);";
$baza->updateDB($dnevnikInsert);

$tablica = "<table id='dnevnik'><thead><tr><th>Skripta</th><th>Upit</th><th>Vrijeme</th><th>Korisnik</th><th>Vrsta</th></tr></thead>";

while ($rez = $rezultat->fetch_array()) {
    $tablica.="<tr><td>";
    $tablica.=$rez[1];
    $tablica.="</td><td>";
    $tablica.=$rez[2];
    $tablica.="</td><td>";
    $tablica.=$rez[3];
    $tablica.="</td><td>";
    $tablica.=$rez[4];
    $tablica.="</td><td>";
    $tablica.=$rez[5];
    $tablica.="</td></tr>";
}

$tablica.="</table>";
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
        <link rel="stylesheet" type="text/css" href="./css/print.css" media="print">
        <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.6/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="http://datatables.net/download/build/nightly/jquery.dataTables.js"></script>
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script src="./js/sort.js"></script>
        <script src="js/izbornik.js"></script>
        <meta charset="UTF-8">
    </head>
    <body>
        <header id="header">
            <p>E-Režije</p>
            <a class="strana" href="odjava.php" style="">Odjava</a>
            <a class="strana" href='prijava.php' style="">Prijava</a>
            <p id="prijavljeno"> <?php
                if (isset($_SESSION['ID_korisnik'])) {
                    echo "Prijavljeni ste kao " . $_SESSION['korisnicko'];
                }
                ?>
        </header>
        <div id="omotac">
            <ul class="topnav">
                <?php echo kreirajIzbornik($tip); ?>  
                <li class="icon">
                    <a href="javascript:void(0);" onclick="pokaziIzbornik()">&#8801;</a>
                </li>
            </ul>

            <section id="sadrzaj">

                <?php
                echo $tablica;
                ?>

                <a href="javascript:window.print()">Print</a>
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
