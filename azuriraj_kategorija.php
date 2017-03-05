<?php
//Skripta za azuriranje kategorija.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$baza = new Baza();
$vrijeme = azuriraj();

if (!isset($_SESSION['tip_korisnik']) || $_SESSION['tip_korisnik'] < 2) {
    header("Location:zabrana.php");
}
$greska = "";
$tip = $_SESSION['tip_korisnik'];
$moderator = $_SESSION['ID_korisnik'];
$ID_kategorija = $_GET['kategorija'];
$ustanova = "";
$dnevnikID = $_SESSION['ID_korisnik'];

$upit = "SELECT * FROM Moderator_ustanova WHERE FK_moderator='$moderator';";
$rezultat = $baza->selectDB($upit);
while ($rez = $rezultat->fetch_array()) {
    $ustanova_id = $rez['FK_ustanova'];
    $upit2 = "SELECT Naziv FROM Ustanova WHERE ID_ustanova='$ustanova_id';";
    $rezultat2 = $baza->selectDB($upit2);
    $rez2 = $rezultat2->fetch_array();
    $naziv = $rez2['Naziv'];
    $ustanova .= "<option value='$ustanova_id'>$naziv</option>";
    $ustanova .= "<br>";
}

if (isset($_POST['dodaj'])) {

    $vrijeme = azuriraj();
    $ID_korisnik = $_SESSION['ID_korisnik'];
    $ID_kategorija = $_GET['kategorija'];
    $kategorija = $_POST['kategorija'];
    $cijena = $_POST['cijena'];
    $jedinica = $_POST['jedinica'];
    $ustanova = $_POST['ustanova'];
    $datum = $_POST['datum'];
    $opis = $_POST['opis'];
    $idUst = $_POST['ustanova'];

    $update3 = "UPDATE Kategorija_ocitavanja SET Naziv='$kategorija',Cijena='$cijena',Jedinica='$jedinica',Datum='$datum',Opis='$opis',Status=0,FK_moderator='$moderator',FK_ustanova='$ustanova' WHERE ID_kategorija=$ID_kategorija;";
    $baza->updateDB($update3);

    $dnevnikInsert = "insert into Dnevnik values(default,'azuriraj_kategorija.php','$update3','$vrijeme','$dnevnikID',2);";
    $baza->updateDB($dnevnikInsert);

    header("Location:popis_kategorija.php?ustanova=$ustanova");
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
        <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.6/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js" ></script>
        <script src="http://datatables.net/download/build/nightly/jquery.dataTables.js"></script>
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
                <div class="large-11 large-offset-1 columns" style="color: #ff2121; font-size: 14px;">
                    <?php echo $greska; ?>
                </div> 
                <div id="inputForma">
                    <form name="nova_kategorija" method="POST" action="<?php echo "azuriraj_kategorija.php?kategorija=$ID_kategorija"; ?>">

                        <label id="kategorija" for="jedinica">Kategorija: </label><br/>
                        <select id="kategorija" name="kategorija" required="">
                            <option value="dnevna" >dnevna</option>
                            <option value="noćna">noćna</option>
                            <option value="vikend">vikend</option>
                            <option value="blagdanska">blagdanska</option>
                            <option value="velika blagdanska">velika blagdanska</option>
                            <option value="ostalo">ostalo</option>
                        </select><br/><br/>

                        <label id="cijena" for="cijena">Cijena: </label><br/>
                        <input type="number" step="0.01" name="cijena" min="0" id="cijena" required="" /><br/>

                        <label id="jedinica" for="jedinica">Jedinica: </label><br/>
                        <select id="jedinica" name="jedinica" required="">
                            <option value="kn/kWh" >kn/kWh</option>
                            <option value="kn/m3">kn/m3</option>
                        </select>
                        <br/><br/>

                        <label for="datum">Datum: </label><br/>
                        <input type="date" name="datum" required=""/><br/>

                        <label id="opis" for="opis">Opis: </label><br/>
                        <input type="text" name="opis"/><br/>

                        <label for="ustanova">Ustanova: </label><br/>
                        <select id="ustanova_select" name="ustanova" required=""><?php echo $ustanova; ?></select><br>

                        <input id="submit" name="dodaj" type="submit" value="Dodaj kategoriju" class="gumb">


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