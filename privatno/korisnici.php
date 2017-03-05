<?php
include_once ("../okviri/baza_class.php");
include_once ("../okviri/izbornik.php");

session_start();
$baza = new Baza();
if (!isset($_SESSION['tip_korisnik'])) {
    $tip = 0;
} else {
    $tip = $_SESSION['tip_korisnik'];
}

$upit = "SELECT * FROM Korisnik;";
$rezultat = $baza->selectDB($upit);

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
        . "</tr></thead>";

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
        <link rel="stylesheet" type="text/css" href="../css/hkisicek1.css">
        <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.6/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="http://datatables.net/download/build/nightly/jquery.dataTables.js"></script>
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script src="./js/sort.js"></script>
        <meta charset="UTF-8">
    </head>
    <body>
        <header id="header">
            <p>E-Režije</p>
            <a class="strana" href="../index.php" style="">Povratak na početnu</a>  
        </header>
        <div id="omotac">
            <ul class="topnav">  
                <li class="icon">
                    <a href="javascript:void(0);" onclick="pokaziIzbornik()">&#8801;</a>
                </li>
            </ul>


            <section id="sadrzaj">
                <?php echo $tablica; ?>

            </section>
        </div>
        <footer id="footer">
            Kontaktirajte me na: <br>
            <a class="strana" href="mailto:hkisicek@foi.hr">Helena Kišiček</a>
        </address>
        <p><small>&copy; Sva prava pridržana, Web dizajn i programiranje, 2016</small></p>

    </footer>
</body>
</html>