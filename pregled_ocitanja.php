<?php
//Skripta za pregled ocitanja.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$baza = new Baza();
$vrijeme = azuriraj();


if (!isset($_SESSION['tip_korisnik']) || $_SESSION['tip_korisnik'] < 2) {
    header("Location:zabrana.php");
}
$tip = $_SESSION['tip_korisnik'];
$korisnikID = $_SESSION['ID_korisnik'];
$tablica = "<table id='ocitanja' ><thead><tr><th>Id očitanog stanja</th><th>Stanje</th><th>Id rezervacije</th><th>Radnja</th></tr></thead>";

$upit = "SELECT * FROM Ocitano_stanje WHERE Status=0;";
$rezultat = $baza->selectDB($upit);

$dnevnikInsert = "insert into Dnevnik values(default,'pregled_ocitanja.php','SELECT * FROM Ocitano_stanje;','$vrijeme',$korisnikID,2);";
$baza->updateDB($dnevnikInsert);

while ($rez = $rezultat->fetch_array()) {
    $id_stanje = $rez['ID_stanje'];
    $stanje = $rez['Stanje'];
    $rezervacija = $rez['FK_rezervacija'];
    $tablica .="<tr><td>$id_stanje</td><td>$stanje</td><td>$rezervacija</td>";

    $tablica.="<td><a href=\"novi_racun.php?rezervacija=" . $rezervacija . "&stanje=" . $stanje . "\">Kreiraj račun</a></td></tr>";
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
                <?php echo $tablica;
                ?>

                <input type="button" onclick="location.href = 'ocitano_stanje.php';" value="Dodaj očitavanje" />
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
