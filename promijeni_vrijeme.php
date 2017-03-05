<?php
//Skripta za promjenu vremena.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

$baza = new Baza();
session_start();

if (!isset($_SESSION['tip_korisnik']) || $_SESSION['tip_korisnik'] != 3) {
    header("Location:zabrana.php");
}
$tip = $_SESSION['tip_korisnik'];
?>
<!DOCTYPE html>
<html>
    <head>
        <title>E-Režije</title>
        <meta name="author" content="Helena Kišiček">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="./css/hkisicek1.css">
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

                <h4>Prvo unesi pomak <a href="http://barka.foi.hr/WebDiP/pomak_vremena/vrijeme.html" target="_blank" >ovdje</a>. Zatim potvrdi.</h4>


                <a class="button tiny" href="izmjena.php">Potvrda</a>


                <?php
                echo ispisi();
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
