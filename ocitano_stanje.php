<?php
//Skripta za evidentiranje ocitavanja.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$baza = new Baza();
$greska = "";
if (!isset($_SESSION['tip_korisnik']) || $_SESSION['tip_korisnik'] < 2) {
    header("Location:zabrana.php");
}
$tip = $_SESSION['tip_korisnik'];
$moderator = $_SESSION['ID_korisnik'];
$rezervacija = "";

$upit = "SELECT * FROM Rezervacija WHERE Status=1;";
$rezultat = $baza->selectDB($upit);
while ($rez = $rezultat->fetch_array()) {
    $rezervacija_id = $rez['ID_rezervacija'];

    $rezervacija .= "<option value='$rezervacija_id'>$rezervacija_id</option>";
    $rezervacija .= "<br>";
}
if (isset($_POST['dodaj'])) {

    $rezervacija = $_POST['rezervacija'];
    $stanje = $_POST['stanje'];

    $upit1 = "INSERT INTO Ocitano_stanje VALUES (default,'$stanje',0,'$rezervacija');";
    $baza->updateDB($upit1);

    $upit2 = "UPDATE Rezervacija SET Status=2 WHERE ID_rezervacija='$rezervacija';";
    $baza->updateDB($upit2);

    header("Location:pregled_ocitanja.php");
}
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
                <div class="large-11 large-offset-1 columns" style="color: #ff2121; font-size: 14px;">
                    <?php echo $greska; ?>
                </div> 
                <div id="inputForma">
                    <form name="novo_ocitanje" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">

                        <label for="rezervacija">Rezervacija: </label><br/>
                        <select id="rezervacija_select" required="" name="rezervacija"><?php echo $rezervacija; ?></select><br>

                        <label id="stanje" for="cijena">Stanje: </label><br/>
                        <input type="number" step="0.01" name="stanje" min="0" id="stanje" required="" /><br/>


                        <input id="submit" name="dodaj" type="submit" value="Dodaj očitanje" class="gumb">


                    </form>
                </div>
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
