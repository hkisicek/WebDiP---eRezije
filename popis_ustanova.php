<?php
//Skripta za ispis ustanova.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$baza = new Baza();

$vrijeme = azuriraj();
$upit = "SELECT * FROM Ustanova;";
$rezultat = $baza->selectDB($upit);

if (isset($_SESSION['tip_korisnik'])) {
    $tip = $_SESSION['tip_korisnik'];
    $ID_korisnik = $_SESSION['ID_korisnik'];

    $dnevnikInsert = "insert into Dnevnik values(default,'popis_ustanova.php','$upit','$vrijeme','$ID_korisnik',2);";
    $baza->updateDB($dnevnikInsert);
} else {
    $tip = 0;
    $dnevnikInsert = "insert into Dnevnik values(default,'popis_ustanova.php','$upit','$vrijeme',0,2);";
    $baza->updateDB($dnevnikInsert);
}

$tablica = "<table id='ustanove' ><thead><tr><th>Naziv ustanove</th><th>Energent</th><th>Radnja</th><th>Radnja</th></tr></thead>";

while ($rez = $rezultat->fetch_array()) {
    $ustanova = $rez['ID_ustanova'];
    $naziv = $rez['Naziv'];
    $tablica .="<tr><td>";
    $tablica .="<a href=\"popis_kategorija.php?ustanova=" . $ustanova . "\">" . $naziv . "</a>";
    $tablica .="</td><td>";
    $tablica.=$rez['Energent'];
    $tablica.="</td>";
    if ($tip != 0) {
        $tablica.="<td><a href=\"lajkovi.php?lajkU=" . $naziv . "&korisnik=" . $ID_korisnik . "\">Sviđa mi se</a><br/><a href=\"lajkovi.php?dislajkU=" . $naziv . "&korisnik=" . $ID_korisnik . "\">Ne sviđa mi se</a></td>";
    }
    if ($tip == 3) {
        $tablica.="<td><a href=\"azuriraj_ustanova.php?ustanova=" . $ustanova . "\">Ažuriraj</a></td>";
    } elseif ($tip == 1 || $tip == 2) {
        $tablica.="<td>-</td>";
    } else {
        $tablica.="<td>-</td><td>-</td>";
    }
}
$tablica.="</tr></table>";
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
                    $link = "<a href=\"upload_csvU.php\">Popuni CVS datotekom</a><br/>";
                    echo $link;

                    $link = "<a href=\"nova_ustanova.php\">Dodaj novu</a>";
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
