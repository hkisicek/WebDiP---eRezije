<?php
//Skripta za pregled korisnika.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$baza = new Baza();
$vrijeme = azuriraj();
if (!isset($_SESSION['tip_korisnik'])) {
    header("Location:zabrana.php");
} else {
    $tip = $_SESSION['tip_korisnik'];
}
$korisnikID = $_SESSION['ID_korisnik'];

$upit = "SELECT * FROM Korisnik;";
$rezultat = $baza->selectDB($upit);

$dnevnikInsert = "insert into Dnevnik values(default,'pregled_korisnika.php','SELECT * FROM Korisnik;','$vrijeme',$korisnikID,2);";
$baza->updateDB($dnevnikInsert);

$tablica = "";
$tablica .= "<table id = 'korisnici'><thead><tr>"
        . "<th>Ime</th>"
        . "<th>Prezime</th>"
        . "<th>E-mail</th>"
        . "<th>Korisničko ime</th>"
        . "<th>Lozinka</th>"
        . "<th>Ulica</th>"
        . "<th>Grad</th>"
        . "<th>Telefon</th>"
        . "<th>Vrijeme</th>"
        . "<th>Status</th>"
        . "<th>Tip korisnika</th>"
        . "<th>Radnja</th>"
        . "<th>Radnja</th>"
        . "</tr></thead><tbody>";

while ($rez = $rezultat->fetch_array()) {
    $ID_korisnik = $rez['ID_korisnik'];
    $tablica.="<tr><td>";
    $tablica.=$rez['Ime'];
    $tablica.="</td><td>";
    $tablica.=$rez['Prezime'];
    $tablica.="</td><td>";
    $tablica.=$rez['Email'];
    $tablica.="</td><td>";
    $tablica.=$rez['Korisnicko_ime'];
    $tablica.="</td><td>";
    $tablica.=$rez['Lozinka'];
    $tablica.="</td><td>";
    $tablica.=$rez['Ulica'];
    $tablica.="</td><td>";
    $tablica.=$rez['Grad'];
    $tablica.="</td><td>";
    $tablica.=$rez['Telefon'];
    $tablica.="</td><td>";
    $tablica.=$rez['Vrijeme'];
    $tablica.="</td><td>";
    $tablica.=$rez['Status'];
    $tablica.="</td><td>";
    $tablica.=$rez['FK_tip'];
    if (isset($_SESSION['tip_korisnik']) && $_SESSION['tip_korisnik'] == 3) {
        $tablica.="</td><td>";
        $tablica.="<a href=akcija_korisnik.php?korisnikB=" . $ID_korisnik . ">Blokiraj</a>";
        $tablica.="</td><td>";
        $tablica.="<a href=akcija_korisnik.php?korisnikO=" . $ID_korisnik . ">Otključaj</a>";
    }
    $tablica.="</td></tr>";
}

$tablica.="</tbody></table>";
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


        </footer>
    </body>
</html>