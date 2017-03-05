<?php
//Skripta za ispis statistike kategorija.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$baza = new Baza();
$vrijeme = azuriraj();
$tip = $_SESSION['tip_korisnik'];
$korisnikID = $_SESSION['ID_korisnik'];
$tablica1 = "<table id='statistikaK'><thead><tr><th>Kategorija_ocitavanja</th><th>Sviđa mi se</th><th>Ne sviđa mi se</th></tr></thead>";

$dnevnikInsert = "insert into Dnevnik values(default,'statistikaK.php','SELECT * FROM Lajkovi;','$vrijeme',$korisnikID,3);";
$baza->updateDB($dnevnikInsert);

$upit3 = "select distinct `Kategorija_ocitavanja` from Lajkovi where `Kategorija_ocitavanja` is not null;";
$rezultat3 = $baza->selectDB($upit3);
while ($rez3 = $rezultat3->fetch_array()) {
    $tablica1.="<tr><td>";
    $tablica1.=$rez3[0];
    $tablica1.="</td><td>";

    $upit4 = "SELECT sum(`Like`) from Lajkovi where `Kategorija_ocitavanja`='$rez3[0]';";
    $rezultat4 = $baza->selectDB($upit4);
    $rez4 = $rezultat4->fetch_array();

    $tablica1.= $rez4[0];
    $tablica1.="</td><td>";

    $upit5 = "SELECT sum(`Dislike`) from Lajkovi where `Kategorija_ocitavanja`='$rez3[0]';";
    $rezultat5 = $baza->selectDB($upit5);
    $rez5 = $rezultat5->fetch_array();

    $tablica1.=$rez5[0];
    $tablica1.="</td></tr>";
}
$tablica1.="</table>";
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
            </p>

        </header>
        <div id="omotac">
            <ul class="topnav">
                <?php echo kreirajIzbornik($tip); ?> 
                <li class="icon">
                    <a href="javascript:void(0);" onclick="pokaziIzbornik()">&#8801;</a>
                </li>
            </ul>


            <section id="sadrzaj">
                <a href="statistikaU.php">Ustanove</a>
                <?php
                if ($_SESSION['tip_korisnik'] == 3) {
                    echo "<a href='statistikaS.php'></a>";
                }
                ?>
                <?php
                echo $tablica1;
                ?>
                <a href="javascript:window.print()">Print</a>
                <a href="pdf.php?statistikaK=1">PDF</a>
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
