<?php
//Skripta za kreiranje rezervacija.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$greska = "";
$baza = new Baza();
$ustanova = "";
$kategorija = "";

if (!isset($_SESSION['tip_korisnik'])) {
    header("Location:zabrana.php");
}

$tip = $_SESSION['tip_korisnik'];
$korisnik = $_SESSION['ID_korisnik'];

$upit2 = "SELECT * FROM Ustanova;";
$rezultat2 = $baza->selectDB($upit2);
while ($rez2 = $rezultat2->fetch_array()) {
    $ustanova_id = $rez2['ID_ustanova'];
    $naziv = $rez2['Naziv'];
    $ustanova .= "<option value='$ustanova_id'>$naziv</option>";
    $ustanova .= "<br>";
}
$upit3 = "SELECT * FROM Kategorija_ocitavanja;";
$rezultat3 = $baza->selectDB($upit3);
while ($rez3 = $rezultat3->fetch_array()) {
    $kategorija_id = $rez3['ID_kategorija'];
    $naziv = $rez3['Naziv'];
    $datum = $rez3['Datum'];
    $kategorija .= "<option value='$kategorija_id'>$naziv $datum</option>";
    $kategorija .= "<br>";
}
if (isset($_POST['dodaj'])) {
    $kategorijaID = $_POST['kategorija'];
    $vrijeme = azuriraj();

    $dnevnikInsert = "insert into Dnevnik values(default,'nova_rezervacija.php','INSERT INTO Rezervacija;','$vrijeme',$korisnik,2);";
    $baza->updateDB($dnevnikInsert);

    $upit4 = "INSERT INTO Rezervacija VALUES (default,'$vrijeme','0','$korisnik','$kategorijaID');";
    $baza->updateDB($upit4);

    header("Location:index.php");
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
                <div id="inputForma">
                    <form name="nova_rezervacija" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">

                        <label for="ustanova">Ustanova: </label><br/>
                        <select id="ustanova_select" name="ustanova"><?php echo $ustanova; ?></select><br>

                        <label for="kategorija">Kategorija:</label><br/>
                        <select id="kategorija_select" name="kategorija"><?php echo $kategorija; ?></select><br>


                        <input id="submit" name="dodaj" type="submit" value="Rezerviraj" class="gumb">


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
