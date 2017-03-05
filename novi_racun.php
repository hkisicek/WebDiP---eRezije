<?php
//Skripta za kreiranje racuna.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$baza = new Baza();
$greska = "";


if (!isset($_SESSION['tip_korisnik']) || $_SESSION['tip_korisnik'] < 2 || !isset($_GET['rezervacija'])) {
    header("Location:zabrana.php");
}
$vrijeme = azuriraj();
$dnevnikID = $_SESSION['ID_korisnik'];

$tip = $_SESSION['tip_korisnik'];
$vrijeme = azuriraj();
$moderator = $_SESSION['ID_korisnik'];


$ID_rezervacija = $_GET['rezervacija'];
$stanje = $_GET['stanje'];

$upit1 = "SELECT * FROM Rezervacija WHERE ID_rezervacija='$ID_rezervacija';";
$rezultat = $baza->selectDB($upit1);
$rez = $rezultat->fetch_array();
$ID_korisnik = $rez['FK_korisnik'];
$kategorija = $rez['FK_kategorija'];

$upit2 = "SELECT * FROM Kategorija_ocitavanja WHERE ID_kategorija='$kategorija';";
$rezultat2 = $baza->selectDB($upit2);
$rez2 = $rezultat2->fetch_array();
$ustanova = $rez2['FK_ustanova'];
$cijenaJ = $rez2['Cijena'];

$upit3 = "SELECT * FROM Ustanova WHERE ID_ustanova='$ustanova'";
$rezultat3 = $baza->selectDB($upit3);
$rez3 = $rezultat3->fetch_array();
$energent = $rez3['Energent'];

$upit4 = "SELECT * FROM Racun WHERE FK_korisnik='$ID_korisnik' AND Usluga='$energent' ORDER BY ID_racun ASC LIMIT 1;";
$rezultat4 = $baza->selectDB($upit4);

if ($rezultat4->num_rows == 0) {
    $potrosnja = $stanje;
    $cijena = $potrosnja * $cijenaJ;
}
if ($rezultat4->num_rows != 0) {
    $rez4 = $rezultat4->fetch_array();
    $stanje1 = $rez4['Stanje'];
    $potrosnja = $stanje - $stanje1;
    $cijena = $potrosnja * $cijenaJ;
}


if (isset($_POST['dodaj'])) {
    $ID_rezervacija = $_GET['rezervacija'];
    if (isset($_POST['stanje'])) {
        $stanje = $_POST['stanje'];
    }
    if (isset($_POST['potrosnja'])) {
        $potrosnja = $_POST['potrosnja'];
    }
    if (isset($_POST['cijena'])) {
        $cijena = $_POST['cijena'];
    }
    $dnevnikInsert = "insert into Dnevnik values(default,'novi_racun.php','INSERT INTO Racun;','$vrijeme',$dnevnikID,2);";
    $baza->updateDB($dnevnikInsert);

    $insert = "INSERT INTO Racun VALUES (default,'$energent','$stanje','$potrosnja','$cijena','$vrijeme',0,'$ID_rezervacija','$moderator','$ID_korisnik');";
    $baza->updateDB($insert);
    $update = "UPDATE Rezervacija SET Status=4 WHERE ID_rezervacija='$ID_rezervacija';";
    $baza->updateDB($update);
    $update1 = "UPDATE Ocitano_stanje SET Status=1 WHERE FK_rezervacija='$ID_rezervacija';";
    $baza->updateDB($update1);

    header("Location:pregled_ocitanja.php");
}
?>
<!DOCTYPE html>
<!--
Skripta za unos novih kategorija.
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
                    <form name="nova_kategorija" method="POST" action="<?php echo "novi_racun.php?rezervacija=$ID_rezervacija&stanje=$stanje"; ?>">

                        <label id="usluga" for="usluga">Usluga: </label><br/>
                        <select id="usluga" name="usluga" required="">
                            <option value="struja" >očitanje struje</option>
                            <option value="plin">očitanje plina</option>
                            <option value="voda">očitanje vode</option>
                        </select>
                        <br/><br/>

                        <label id="stanje" for="stanje">Stanje: </label><br/>
                        <input type="number" step="0.01" name="stanje" min="0" id="stanje" required="" disabled="" value="<?php echo $stanje; ?>" /><br/>

                        <label id="potrosnja" for="potrosnja">Potrošnja: </label><br/>
                        <input type="number" step="0.01" name="potrosnja" min="0" id="potrosnja" required="" disabled="" value="<?php echo $potrosnja; ?>" /><br/>

                        <label id="cijena" for="cijena">Cijena: </label><br/>
                        <input type="number" step="0.01" name="cijena" min="0" id="cijena" required="" disabled="" value="<?php echo $cijena; ?>" /><br/>

                        <input id="submit" name="dodaj" type="submit" value="Kreiraj račun" class="gumb">


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