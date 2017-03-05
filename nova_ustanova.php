<?php
//Skripta za kreiranje ustanova.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$greska = "";
$baza = new Baza();
$moderator = "";
$vrijeme = azuriraj();

if (!isset($_SESSION['tip_korisnik']) || $_SESSION['tip_korisnik'] != 3) {
    header("Location:zabrana.php");
}
$dnevnikID = $_SESSION['ID_korisnik'];
$tip = $_SESSION['tip_korisnik'];
$upit = "SELECT * FROM Korisnik WHERE FK_tip=2;";
$rezultat = $baza->selectDB($upit);
while ($rez = $rezultat->fetch_array()) {
    $ime = $rez['Ime'];
    $prezime = $rez['Prezime'];
    $id = $rez['ID_korisnik'];
    $moderator .= "<option value='$id'>$ime $prezime</option>";
    $moderator .= "<br>";
}

if (isset($_POST['dodaj'])) {
    $naziv = $_POST['ustanova_naziv'];
    $energent = $_POST['energent'];
    $moderatorID = $_POST['moderator'];

    $insert1 = "INSERT INTO Ustanova VALUES (default,'$naziv','$energent');";
    $baza->updateDB($insert1);

    $upit1 = "SELECT * FROM Ustanova WHERE Naziv='$naziv';";
    $rezultat1 = $baza->selectDB($upit1);
    $rez1 = $rezultat1->fetch_array();
    $id_ustanova = $rez1['ID_ustanova'];

    $dnevnikInsert = "insert into Dnevnik values(default,'nova_ustanova.php','INSERT INTO Ustanova;','$vrijeme',$dnevnikID,2);";
    $baza->updateDB($dnevnikInsert);

    $upit3 = "INSERT INTO Moderator_ustanova VALUES ('$moderatorID','$id_ustanova');";
    $baza->updateDB($upit3);
    $greska = $moderatorID;
    header("Location:popis_ustanova.php");
}
?>

<!DOCTYPE html>
<!--
Skripta za unos novih ustanova.)
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
                    <form name="nova_ustanova" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                        <label id="ustanova_naziv" for="ustanova_naziv">Naziv ustanove: </label><br/>
                        <input type="text" name="ustanova_naziv" id="ustanova_naziv" placeholder="" size="20" maxlength="50" required="" /><br/>
                        <label id="energent" for="energent">Energent: </label><br/>
                        <select id="energent" name="energent" required="">
                            <option value="struja" >struja</option>
                            <option value="plin">plin</option>
                            <option value="voda">voda</option>
                        </select>
                        <br/><br/>
                        <label for="moderator">Moderator: </label>
                        <select id="moderator_select" name="moderator" required=""><?php echo $moderator; ?></select><br>
                        <input id="submit" name="dodaj" type="submit" value="Dodaj ustanovu" class="gumb">
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