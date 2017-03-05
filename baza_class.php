<?php

class Baza {

    const server = "localhost";
    const baza = "WebDiP2015x038";
    const korisnik = "WebDiP2015x038";
    const lozinka = "admin_HvTP";

    function spojiDB() {
        $mysqli = new mysqli(self::server, self::korisnik, self::lozinka, self::baza);
        if ($mysqli->connect_errno) {
            $poruka = "GRESKA: BAZA -> Neuspjesno spajanje na bazu: " . $mysqli->connect_errno . ", " . $mysqli->connect_error;
            echo $poruka;
        }
        return $mysqli;
    }

    function selectDB($upit) {
        $veza = self::spojiDB();
        $rezultat = $veza->query($upit) or trigger_error("Greska kod upita {$upit} - " .
                        "Greska: " . $veza->error . " " . E_USER_ERROR);
        if (!$rezultat) {
            $rezultat = null;
        }
        $veza->close();
        return $rezultat;
    }

    function updateDB($upit) {
        $veza = self::spojiDB();
        if ($rezultat = $veza->query($upit)) {
            $veza->close();
            return $rezultat;
        } else {
            $veza->close();
            return null;
        }
    }

}

?>