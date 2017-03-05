<?php
//Skripta za pregled adresa.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

$vrijeme = azuriraj();
session_start();
$baza = new Baza();
if (!isset($_SESSION['tip_korisnik']) && $_SESSION['tip_korisnik'] != 3) {
    header("Location:zabrana.php");
}
$tip = $_SESSION['tip_korisnik'];
$ID_korisnik = $_SESSION['ID_korisnik'];

$dnevnikInsert = "insert into Dnevnik values(default,'pregled_adresa.php','SELECT * FROM Poslovnica;','$vrijeme',null,2);";
$baza->updateDB($dnevnikInsert);

$upit = "SELECT * from Poslovnica";
$rezultat = $baza->selectDB($upit);

$tablica = "<table id='adrese' ><thead><tr>"
        . "<th>Država</th>"
        . "<th>Grad</th>"
        . "<th>Ulica</th>"
        . "<th>Broj</th>"
        . "<th>Radnja</th>"
        . "<th>Ustanova</th></thead>";

while ($rez = $rezultat->fetch_array()) {
    $ID_adresa = $rez['ID_poslovnica'];
    $FK_ustanova = $rez['FK_ustanova'];
    $tablica.="<tr><td>";
    $tablica.=$rez['Drzava'];
    $tablica.="</td><td>";
    $tablica.=$rez['Grad'];
    $tablica.="</td><td>";
    $tablica.=$rez['Ulica'];
    $tablica.="</td><td>";
    $tablica.=$rez['Broj'];
    $tablica.="</td><td>";

    $upit1 = "SELECT * FROM Ustanova WHERE ID_ustanova='$FK_ustanova';";
    $rezultat1 = $baza->selectDB($upit1);
    while ($rez1 = $rezultat1->fetch_array()) {
        $tablica.=$rez1['Naziv'];
    }
    $tablica.="</td>";
    $tablica.="<td><a href=\"azuriraj_adresa.php?adresa=" . $ID_adresa . "\">Ažuriraj</a></td>";
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
                <?php
                echo $tablica;
                if (isset($_SESSION['tip_korisnik']) && $_SESSION['tip_korisnik'] == 3) {
                    $link = "<a href=\"upload_csvA.php\">Popuni CVS datotekom</a><br/>";
                    echo $link;
                    $link = "<a href=\"nova_adresa.php\">Dodaj novu</a>";
                    echo $link;
                }
                ?>
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
