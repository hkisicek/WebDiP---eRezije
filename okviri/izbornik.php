<?php

function kreirajIzbornik($tip) {
    $izbornik = "";
    switch ($tip) {
        case 0:
            $izbornik = "<li> <a href=\"index.php\">Početna</a></li>"
                    . "<li><a href=\"popis_ustanova.php\">Popis ustanova</a></li>"
                    . "<li><a href=\"prijava.php\">Prijava</a></li>"
                    . "<li><a href=\"registracija.php\">Registracija</a></li>"
                    . "<li><a href=\"dokumentacija.html\">Dokumentacija</a></li>"
                    . "<li><a href=\"o_autoru.html\">O autoru</a></li>";
            break;
        case 1:
            $izbornik = "<li> <a href=\"index.php\">Početna</a></li>"
                    . "<li><a href=\"nova_rezervacija.php\">Nova rezervacija</a></li>"
                    . "<li><a href=\"pregled_racuna.php\">Pregled računa</a></li>"
                    . "<li><a href=\"nova_zalba.php\">Nova žalba</a></li>"
                    . "<li><a href=\"popis_ustanova.php\">Popis ustanova</a></li>";

            break;
        case 2:
            $izbornik = "<li> <a href=\"index.php\">Početna</a></li>"
                    . "<li><a href=\"nova_kategorija.php\">Nova kategorija</a></li>"
                    . "<li><a href=\"pregled_rezervacija.php\">Pregled rezervacija</a></li>"
                    . "<li><a href=\"pregled_ocitanja.php\">Pregled očitanja</a></li>"
                    . "<li><a href=\"popis_zalbi.php\">Popis žalbi</a></li>"
                    . "<li><a href=\"galerija.php\">Galerija</a></li>"
                    . "<li><a href=\"statistikaU.php\">Statistika</a></li>";
            break;
        case 3:
            $izbornik = "<li> <a href=\"index.php\">Početna</a></li>"
                    . "<li><a href=\"nova_ustanova.php\">Nova ustanova</a></li>"
                    . "<li><a href=\"nova_adresa.php\">Nova adresa</a></li>"
                    . "<li><a href=\"popis_ustanova.php\">Popis ustanova</a></li>"
                    . "<li><a href=\"pregled_adresa.php\">Pregled adresa</a></li>"
                    . "<li><a href=\"pregled_ocitanja.php\">Pregled očitanja</a></li>"
                    . "<li><a href=\"pregled_rezervacija.php\">Pregled rezervacija</a></li>"
                    . "<li><a href=\"pregled_racuna.php\">Pregled računa</a></li>"
                    . "<li><a href=\"popis_zalbi.php\">Popis žalbi</a></li>"
                    . "<li><a href=\"pregled_korisnika.php\">Pregled korisnika</a></li>"
                    . "<li><a href=\"statistikaS.php\">Statistika</a></li>"
                    . "<li><a href=\"promijeni_vrijeme.php\">Promijeni vrijeme</a></li>"
                    . "<li><a href=\"dnevnik.php\">Dnevnik</a></li>";
            ;


            break;
    }
    return $izbornik;
}
