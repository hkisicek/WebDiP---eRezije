<?php
//Skripta za prijavu.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

$baza = new Baza();
$greska = "";
$tip = 0;
session_start();
$vrijeme = azuriraj();

if (!isset($_SERVER["HTTPS"]) || strtolower($_SERVER["HTTPS"]) != "on") {
    $adresa = 'https://' . $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
    header("Location: $adresa");
    exit();
}
if (isset($_SESSION['tip_korisnik'])) {
    header("Location:index.php");
}

if (isset($_COOKIE['kolacic_korisnici']))
    $user_name = $_COOKIE['kolacic_korisnici'];
if (!isset($_COOKIE['kolacic_korisnici']))
    $user_name = '';

if (isset($_POST["prijava"])) {
    $korisnicko_ime = $_POST["korisnicko_ime"];
    $lozinka = $_POST["lozinka"];

    $upit = "SELECT * FROM Korisnik WHERE Korisnicko_ime='" . $korisnicko_ime . "'";
    $rezultat = $baza->selectDB($upit);
    if ($rezultat->num_rows == 1) {
        $rez = $rezultat->fetch_array();

        $korID = $rez['ID_korisnik'];
        $korIme = $rez['Ime'];
        $korPrezime = $rez['Prezime'];
        $korEmail = $rez['Email'];
        $korLoz = $rez['Lozinka'];
        $korStatus = $rez['Status'];
        $korTip = $rez['FK_tip'];
        $korNeuspjeh = $rez['Neuspjelo'];

        if ($korStatus == 3) {

            $greska.="Vaš račun je zaključan. Za pomoć se obratite administratoru.";
        } elseif ($korStatus == 0) {

            $greska.="Morate aktivirati svoj korisnički račun!";
        } elseif ($lozinka != $korLoz) {
            $greska.="Pogrešna lozinka!";
            $korNeuspjeh++;

            $upit = "UPDATE Korisnik SET Neuspjelo='$korNeuspjeh' WHERE ID_korisnik='$korID';";
            $baza->updateDB($upit);

            //Zakljucavanje racuna.
            if ($korNeuspjeh == 4) {
                $upit = "UPDATE Korisnik SET Status='3' WHERE ID_korisnik='$korID';";
                $baza->updateDB($upit);

                $dnevnikInsert = "insert into Dnevnik values(default,'prijava.php',$upit,'$vrijeme',null,2);";
                $baza->updateDB($dnevnikInsert);
            }
        } else {

            $_SESSION['ID_korisnik'] = $korID;
            $_SESSION['tip_korisnik'] = $korTip;
            $_SESSION['korisnicko'] = $korisnicko_ime;
            $_SESSION['status'] = $korStatus;
            $_SESSION['email'] = $korEmail;

            $vrijeme = azuriraj();
            $upit = "INSERT INTO Prijava VALUES (null,'$vrijeme','$korID');";
            $baza->updateDB($upit);

            $dnevnikInsert = "insert into Dnevnik values(default,'prijava.php',null,'$vrijeme',$korID,1);";
            $baza->updateDB($dnevnikInsert);

            //Postavljanje kolacica.
            if (isset($_POST['zapamti_me'])) {
                setcookie('kolacic_korisnici', $korisnicko_ime, time() + 1800);
            }

            if (!isset($_POST['zapamti_me'])) {
                setcookie('kolacic_korisnici', $korisnicko_ime, time() - 1800);
            }

            header("Location:http://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x038/index.php");
        }
    } else {
        $greska.="Unijeli ste nepostojeće korisničko ime";
    }
}

//Generiranje nove lozinke.
if (isset($_POST['zaboravljeno'])) {

    $korisnicko = $_POST['korisnicko_ime'];

    $upit = "SELECT * FROM Korisnik WHERE '$korisnicko'=Korisnicko_ime;";
    $rezultat = $baza->selectDB($upit);
    $rez = $rezultat->fetch_array();
    $IDKor = $rez['ID_korisnik'];
    $mail = $rez['Email'];


    $znakovi = 'qaywsxedcrfvtgbzhnujmikolp123456789$%&/?-_*QAYWSXEDCRFVTGBZHNUJMIKOLP';
    $lozinka = '';
    for ($i = 0; $i < 10; $i++) {
        $lozinka.=$znakovi[rand(0, 35)];
    }
    $update = "UPDATE Korisnik SET Lozinka='$lozinka' WHERE Korisnicko_ime='$korisnicko';";
    $baza->updateDB($update);

    $dnevnikInsert = "insert into Dnevnik values(default,'prijava.php',$update,'$vrijeme','$IDKor',2);";
    $baza->updateDB($dnevnikInsert);

    $sadrzaj = "Postovani, generirana Vam je nova lozinka za Vas korisnicki racun. Lozinka: $lozinka";
    mail($mail, 'E-Rezije-zaboravljena lozinka', $sadrzaj);
}
?>
<!DOCTYPE html>
<!--
Skripta za prijavu.
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
            <?php
            if (isset($_SESSION['ID_korisnik'])) {
                echo "Prijavljeni ste kao " . $_SESSION['korisnicko'];
            }
            ?>
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
                    <form name="prijava" method="POST" action="<?php echo $_SERVER['PHP_SELF'] ?>">
                        <label id="korisnicko_imeg" for="korisnicko_ime">Korisničko ime: </label><br/>
                        <input type="text" name="korisnicko_ime" id="korisnicko_ime" size="20" maxlength="50" required="" value="<?php echo $user_name ?>"/><br/>

                        <label id="lozinkag" for="lozinka">Lozinka: </label><br/>
                        <input type="password" name="lozinka" id="lozinka" size="20" maxlength="50"/><br/>

                        <label for="zapamti_me">Zapamti me</label>
                        <input id="zapamti" type="checkbox" name="zapamti_me" value="1">

                        <input id="submit" name="prijava" type="submit" value="Prijavi se" class="gumb">

                        <input id="zaboravljeno" name="zaboravljeno" type="submit" value="Zaboravljena lozinka?" class="gumb">

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
