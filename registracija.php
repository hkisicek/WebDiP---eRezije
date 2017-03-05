<?php
//Skripta za registraciju

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

$greska = "";
$baza = new Baza();

if (!isset($_SESSION['tip_korisnik'])) {
    $tip = 0;
} else {
    $tip = $_SESSION['tip_korisnik'];
}

//Validacija s posluziteljske strane
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $korIme = $_POST['ime'];
    $korPrezime = $_POST['prezime'];
    $korEmail = $_POST['email'];
    $korisnickoIme = $_POST['korisnicko_ime'];
    $korLozinka = $_POST['lozinka'];
    $korPLozinka = $_POST['ponovljena'];
    $korUlica = $_POST['ulica'];
    $korGrad = $_POST['grad'];
    $korTelefon = $_POST['telefon'];
    $captcha = $_POST['g-recaptcha-response'];

    if ($korIme == "" || $korPrezime == "" || $korisnickoIme == "" || $korLozinka == "" ||
            $korPLozinka == "" || $korUlica == "" || $korGrad == "" || $korTelefon == "" || $korEmail == "") {
        $greska .="Nisu ispunjena sva polja!<br/>";
    }


    if (!preg_match("/^[a-zA-Z]{1,15}$/", $korIme)) {
        $greska.="Ime mora biti u sljedećem rasponu znakova: 1-15 !<br/>";
    }

    if (!preg_match("/^[a-zA-Z0-9_-]{3,15}$/", $korisnickoIme)) {
        $greska.="Korisničko ime može samo sadržavati mala i velika slova, brojeve te posebne znakove (-,_)!<br/>";
    }

    if ($korLozinka != $korPLozinka) {
        $greska.="Lozinka i potvrda lozinke moraju biti identične!<br/>";
    }

    if (!preg_match("/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/", $korEmail)) {
        $greska.="Email je neispravnog formata!<br/>";
    }

    if (!preg_match("/^([a-zA-Z0-9@*#]{5,15})$/", $korLozinka)) {
        $greska.="Lozinka može samo sadržavati mala i velika slova, brojeve, te posebne znakove (@,*,#)!<br/>";
    }

    if (!preg_match("/^([0-9]{6,12})$/", $korTelefon)) {
        $greska.="Pogrešan format broja telefona!<br/>";
    }

    if (!$captcha) {
        $greska .= "reCaptcha nije ispunjen!<br/>";
    }

    if ($greska == "") {

        //Provjera emaila.

        $upitEmail = "SELECT * FROM Korisnik WHERE Email='" . $korEmail . "';";
        $rezultatE = $baza->selectDB($upitEmail);

        if ($rezultatE->num_rows != 0) {
            $greska.="Zauzeta email adresa!";
        } else {

            $vrijemeregistracije = azuriraj();
            $kod = sha1(time() . $korisnickoIme);
            $upitUnos = "INSERT INTO" . " Korisnik VALUES
           (NULL, '$korIme', '$korPrezime', '$korEmail', '$korisnickoIme', '$korLozinka', '$korUlica', '$korGrad','$korTelefon', '$vrijemeregistracije','$kod', '0', '0','1');";
            $baza->updateDB($upitUnos);

            $dnevnikInsert = "insert into Dnevnik values(default,'registracija.php','$upitUnos','$vrijemeregistracije',null,1);";
            $baza->updateDB($dnevnikInsert);

            $adresa = $korEmail;
            $naslov = "Aktivacija korisnickog racuna!";
            $poruka = "Postovani, aktivirajte svoj korisnicki racun putem prilozenog linka:" . "<a href=\"http://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x038/aktivacija.php?kod=$kod\">";
            mail($adresa, $naslov, $poruka);
        }
    }
}
?>
<!DOCTYPE html>
<!--
Skripta za registraciju.
Datum:1.6.2016.
-->
<html>
    <head>
        <title>E-Režije</title>
        <meta name="author" content="Helena Kišiček">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/hkisicek1.css" />
        <script src='https://www.google.com/recaptcha/api.js'></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> 
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        <script src="js/provjera.js"></script>
        <script src="js/izbornik.js"></script>

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
                <article id="greska"><?php echo $greska; ?> </article>
                <div id="inputForma">
                    <form id="forma" method="post" action="registracija.php">
                        <label id="imeg" for="ime"> Ime: </label><br/>
                        <input type="text" name="ime" id="ime" placeholder="Vaše ime" size="20" maxlength="50" /><br/>

                        <label id="prezimeg" for="prezime"> Prezime: </label><br/>
                        <input type="text" name="prezime" id="prezime" placeholder="Vaše prezime" size="20" maxlength="50" /><br/>

                        <label id="emailg" for="email">Email: </label><br/>
                        <input type="text" name="email" id="email" placeholder="Vaš email" size="20" maxlength="50" /><br/>

                        <label id="korisnicko_imeg" for="korisnicko_ime">Korisničko ime: </label><br/>
                        <input type="text" name="korisnicko_ime" id="korisnicko_ime" placeholder="Željeno ime" size="20" maxlength="50" /><br/>

                        <label id="lozinkag" for="lozinka">Lozinka: </label><br/>
                        <input type="password" name="lozinka" id="lozinka" placeholder="Lozinka" size="20" maxlength="50" /><br/>

                        <label id="ponovljenag" for="ponovljena">Ponovite lozinku: </label><br/>
                        <input type="password" name="ponovljena" id="ponovljena" placeholder="Potvrda lozinke" size="20" maxlength="50" /><br/>

                        <label id="ulicag" for="ulica">Ulica i broj: </label><br/>
                        <input type="text" name="ulica" id="ulica" placeholder="Vaša ulica" /><br/>

                        <label id="gradg" for="grad">Općina ili grad: </label><br/>
                        <input type="text" name="grad" id="grad" placeholder="Grad ili općina" /><br/>

                        <label id="telefong" for="telefon">Telefon (bez razmaka): </label><br/>
                        <input type="text" name="telefon" id="telefon" placeholder="Broj telefona" /><br/>



                        <div class="g-recaptcha" data-sitekey="6LehtCETAAAAACbJzi8yV92hFEVeH5-lzpuMRPaG"></div>
                        <input id="submit" type="submit" value="Registriraj se" class="gumb">
                    </form>
                </div>
                <br/><br/><br/>
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


