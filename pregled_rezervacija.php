<?php
//Skripta za pregled rezervacija.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

$vrijeme = azuriraj();
session_start();
$baza = new Baza();

if (!isset($_SESSION['tip_korisnik']) || $_SESSION['tip_korisnik'] < 2) {
    header("Location:zabrana.php");
}
$tip = $_SESSION['tip_korisnik'];
$korisnikID = $_SESSION['ID_korisnik'];

$tablica = "<table id='rezervacije' ><thead><tr><th>Id rezervacije</th><th>Datum rezerviranja</th><th>Korisnik</th><th>Kategorija</th><th>Datum očitavanja</th><th>Radnja</th></thead>";

$dnevnikInsert = "insert into Dnevnik values(default,'pregled_rezervacija.php','SELECT * FROM Rezervacija;','$vrijeme',$korisnikID,2);";
$baza->updateDB($dnevnikInsert);

$upit = "SELECT * FROM Rezervacija WHERE Status=0;";
$rezultat = $baza->selectDB($upit);
while ($rez = $rezultat->fetch_array()) {
    $ID_rezervacija = $rez['ID_rezervacija'];
    $DatumRez = $rez['Datum'];
    $FK_korisnik = $rez['FK_korisnik'];
    $FK_kategorija = $rez['FK_kategorija'];

    $upit1 = "SELECT * FROM Korisnik WHERE Id_korisnik='$FK_korisnik';";
    $rezultat1 = $baza->selectDB($upit1);
    $rez1 = $rezultat1->fetch_array();
    $ime = $rez1['Ime'];
    $prezime = $rez1['Prezime'];
    $imeiprezime = $ime . " " . $prezime;
    $email = $rez1['Email'];

    $upit2 = "SELECT * FROM Kategorija_ocitavanja WHERE ID_kategorija='$FK_kategorija';";
    $rezultat2 = $baza->selectDB($upit2);
    $rez2 = $rezultat2->fetch_array();
    $naziv = $rez2['Naziv'];
    $datum = $rez2['Datum'];

    $tablica .="<tr><td>$ID_rezervacija</td><td>$DatumRez</td><td>$imeiprezime</td><td>$naziv</td><td>$datum</td><td><a href=\"akcija_rezervacija.php?potvrdi=" . $ID_rezervacija . "&email=" . $email . "\">Potvrdi</a><br/><a href=\"akcija_rezervacija.php?odbij=" . $ID_rezervacija . "&email=" . $email . "\">Odbij</a></td>";
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
                $link = "<a href=\"nova_rezervacija.php\">Nova rezervacija</a>";
                echo $link;
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