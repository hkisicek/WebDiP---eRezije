<?php
//Skripta za prikaz galerije slika.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
include_once ("okviri/izbornik.php");

session_start();
$baza = new Baza();

if (isset($_SESSION['tip_korisnik'])) {
    $tip = $_SESSION['tip_korisnik'];
}

if (!isset($_SESSION['tip_korisnik'])) {
    $tip = 0;
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
        </header>

        <div id="omotac">
            <ul class="topnav">
                <?php echo kreirajIzbornik($tip); ?>
                <li class="icon">
                    <a href="javascript:void(0);" onclick="pokaziIzbornik()">&#8801;</a>
                </li>

            </ul>
            <section id="sadrzaj">
                <?php
                $folder_path = 'uploads/';
                $num_files = glob($folder_path . "*.{JPG,jpg,gif,png,bmp}", GLOB_BRACE);

                $folder = opendir($folder_path);

                if ($num_files > 0) {
                    while (false !== ($file = readdir($folder))) {
                        $file_path = $folder_path . $file;
                        $extension = strtolower(pathinfo($file, PATHINFO_EXTENSION));
                        if ($extension == 'jpg' || $extension == 'png' || $extension == 'gif' || $extension == 'bmp') {
                            ?>
                            <a href="<?php echo $file_path; ?>"><img src="<?php echo $file_path; ?>"  height="250" /></a>
                            <?php
                        }
                    }
                } else {
                    echo "Direktorij je prazan !";
                }
                closedir($folder);
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
