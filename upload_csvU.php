<?php
//Skripta za ucitavanje csv datoteke.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$greska = "";
$baza = new Baza();
$vrijeme = azuriraj();

if (!isset($_SESSION['tip_korisnik']) && $_SESSION['tip_korisnik'] != 3) {
    header("Location:zabrana.php");
}
$tip = $_SESSION['tip_korisnik'];
$dnevnikID = $_SESSION['ID_korisnik'];

if (isset($_POST['submit'])) {
    $userfile = $_FILES['datoteka']['tmp_name'];
    $userfile_name = $_FILES['datoteka']['name'];
    $userfile_size = $_FILES['datoteka']['size'];
    $userfile_type = $_FILES['datoteka']['type'];
    $userfile_error = $_FILES['datoteka']['error'];
    if ($userfile_error > 0) {
        echo 'Problem: ';
        switch ($userfile_error) {
            case 1: $greska.="Datoteka je prevelika!";
                break;
            case 2: $greska.="Datoteka je prevelika!";
                break;
            case 3: $greska.="Datoteka je djelomično učitana!";
                break;
            case 4: $greska.="Datoteka nije učitana";
                break;
        }
        exit;
    }
    if ($userfile_type != 'application/vnd.ms-excel' && $userfile_type != 'text/cvs') {
        $greska.= 'Problem: datoteka nije csv/ text' . $userfile_type;
        exit;
    }
    $upfile = 'uploads/' . $userfile_name;
    if (is_uploaded_file($userfile)) {
        if (!move_uploaded_file($userfile, $upfile)) {
            $greska.= 'Problem: Datoteka se ne može premjestiti.';
            exit;
        }
    } else {
        $greska.="Problem: Nije moguće učitati datoteku. Naziv datoteke: " . $userfile_name;
        exit;
    }
    $greska.="Datoteka je uspješno učitana";
    if ($userfile_name) {
        $dat = fopen($upfile, "r");

        while (($red = fgetcsv($dat, 1000, ";")) !== FALSE) {

            $upit = "INSERT INTO Ustanova VALUES ('$red[0]','$red[1]','$red[2]');";
            $baza->updateDB($upit);
        }
        $dnevnikInsert = "insert into Dnevnik values(default,'upload_cdvU.php','INSERT INTO Ustanova;','$vrijeme',$dnevnikID,2);";
        $baza->updateDB($dnevnikInsert);
        fclose($dat);
        header("Location:popis_ustanova.php");
    }
}
?>
<!DOCTYPE html>
<!--
Skripta za popunjavanje ustanova csv datotekom.
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
                    <form action="upload_csvU.php" method="post" enctype="multipart/form-data">

                        <label for="file">Priložite datoteku:</label><br/>
                        <input type="file" name="datoteka" id="datoteka" required="">
                        <input type="submit" value="Pohrani" name="submit">
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