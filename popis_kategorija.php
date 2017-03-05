<?php
//Skripta za ispis kategorija.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$baza = new Baza();
$vrijeme = azuriraj();

if (!isset($_GET['ustanova'])) {
    header("Location:zabrana.php");
}

$ustanova = $_GET['ustanova'];

if (isset($_SESSION['tip_korisnik'])) {
    $tip = $_SESSION['tip_korisnik'];
} else {
    $tip = 0;
}

$upit1 = "select * from Kategorija_ocitavanja where FK_ustanova='$ustanova'";
$rezultat1 = $baza->selectDB($upit1);

$upit2 = "select * from Kategorija_ocitavanja where FK_ustanova='$ustanova' order by ID_kategorija limit 3;";
$rezultat2 = $baza->selectDB($upit2);

$dnevnikInsert = "insert into Dnevnik values(default,'popis_kategorija.php','SELECT * FROM Kategorija;','$vrijeme',null,2);";
$baza->updateDB($dnevnikInsert);

$tablica = "<table id='kategorije' ><thead><tr><th>Naziv</th><th>Cijena</th><th>Jedinica</th><th>Datum</th><th>Opis</th><th>Radnja</th><th>Radnja</th></tr></thead>";
if (isset($_SESSION['tip_korisnik'])) {
    while ($rez1 = $rezultat1->fetch_array()) {
        $ID_kategorija = $rez1['ID_kategorija'];

        $ID_korisnik = $_SESSION['ID_korisnik'];
        $dnevnikInsert = "insert into Dnevnik values(default,'popis_kategorija.php','SELECT * FROM Kategorija;','$vrijeme',$ID_korisnik,2);";
        $baza->updateDB($dnevnikInsert);

        $naziv = $rez1['Naziv'];
        $tablica.="<tr><td>";
        $tablica.=$rez1[1];
        $tablica.="</td><td>";
        $tablica.=$rez1[2];
        $tablica.="</td><td>";
        $tablica.=$rez1[3];
        $tablica.="</td><td>";
        $tablica.=$rez1[4];
        $tablica.="</td><td>";
        $tablica.=$rez1[5];
        $tablica.="</td><td>";
        $tablica.="<a href=\"lajkovi.php?lajkK=" . $naziv . "&ustanova=" . $ustanova . "\">Sviđa mi se</a><br/><a href=\"lajkovi.php?dislajkU=" . $naziv . "&ustanova=" . $ustanova . "\">Ne sviđa mi se</a>";
        $tablica.="</td>";
        if ($_SESSION['tip_korisnik'] > 1) {
            $tablica.="<td><a href=\"azuriraj_kategorija.php?kategorija=" . $ID_kategorija . "\">Ažuriraj</a></td>";
        } else {
            $tablica.="<td>-</td></tr>";
        }
    }
} else {
    while ($rez2 = $rezultat2->fetch_array()) {
        $ID_kategorija = $rez2['ID_kategorija'];
        $naziv = $rez2['Naziv'];
        $tablica.="<tr><td>";
        $tablica.=$rez2[1];
        $tablica.="</td><td>";
        $tablica.=$rez2[2];
        $tablica.="</td><td>";
        $tablica.=$rez2[3];
        $tablica.="</td><td>";
        $tablica.=$rez2[4];
        $tablica.="</td><td>";
        $tablica.=$rez2[5];
        $tablica.="</td><td>-</td><td>-</td></tr>";
    }
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
                <?php echo $tablica; ?>
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
