<?php
//Skripta za kreiranje zalbi.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$baza = new Baza();
$greska = "";
$racun = "";

if (!isset($_SESSION['tip_korisnik']) || $_SESSION['tip_korisnik'] == 2) {
    header("Location:zabrana.php");
}
$tip = $_SESSION['tip_korisnik'];
$ID_korisnik = $_SESSION['ID_korisnik'];

$upit = "SELECT * FROM Racun WHERE FK_korisnik='$ID_korisnik'";
$rezultat = $baza->selectDB($upit);
while ($rez = $rezultat->fetch_array()) {
    $ID_racun = $rez['ID_racun'];
    $racun .= "<option value='$ID_racun'>$ID_racun</option>";
    $racun .= "<br>";
}

if (isset($_POST['submit'])) {
    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 1;
    $imageFileType = pathinfo($target_file, PATHINFO_EXTENSION);

    if (isset($_POST["submit"])) {
        $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
        if ($check !== false) {

            $uploadOk = 1;
        } else {
            $greska.= "Niste postavili sliku.";
            $uploadOk = 0;
        }
    }

    if ($_FILES["fileToUpload"]["size"] > 500000) {
        $greska.= "Vaša je slika prevelika.";
        $uploadOk = 0;
    }

    if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif") {
        $greska.= "Dozvoljeni su samo sljedeći formati: JPG, JPEG, PNG & GIF.";
        $uploadOk = 0;
    }

    if ($uploadOk == 0) {
        $greska.= "Vaš upload nije uspio.";
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {

            header("Location:nova_zalba.php");
        } else {
            $greska.= "Pojavila se greška.";
        }
    }

    $racunID = $_POST['racun'];
    $opis = $_POST['opis'];
    $vrijeme = azuriraj();

    $dnevnikInsert = "insert into Dnevnik values(default,'nova_zalba.php','INSERT INTO Zalba;','$vrijeme',$ID_korisnik,2);";
    $baza->updateDB($dnevnikInsert);

    $insert = "INSERT INTO Zalba VALUES (default,0,'$vrijeme','$opis','$target_file','$racunID');";
    $baza->updateDB($insert);
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
                    <form action="nova_zalba.php" method="post" enctype="multipart/form-data">

                        <label for="racun">Odaberite račun na koji se žalite: </label><br/>
                        <select id="racun_select" name="racun"><?php echo $racun; ?></select><br>
                        <label for="opis">Razlog žalbe:</label><br/>
                        <input type="text" required="" name="opis"/><br/>
                        <label for="file">Priložite sliku stvarnog stanja:</label><br/>
                        <input type="file" name="fileToUpload" id="fileToUpload" required="">
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