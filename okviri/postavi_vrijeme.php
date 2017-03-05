<?php

include_once ("okviri/baza_class.php");

function dohvati() {

    $url = "http://barka.foi.hr/WebDiP/pomak_vremena/pomak.php?format=xml";

    if (!($fp = fopen($url, 'r'))) {
        echo "Greska: Nije moguce otvoriti datoteku!";
        exit;
    }

    $xml_string = fread($fp, 10000);
    fclose($fp);

    $doc = new DOMDocument;
    $doc->loadXML($xml_string);

    $param = $doc->getElementsByTagName('pomak');
    $sat=0;
    foreach ($param as $para){
        $sat=$para->nodeValue;
    }
    return $sat;
}

function spremi() {
    $baza = new Baza();
    $sat = dohvati();
    $upit = "UPDATE Pomak SET pomak='$sat'; ";
    if (!$baza->updateDB($upit)) {
        echo "Greska: Nije moguce izvrsiti upit!";
    }
}

function ispisi() {
    $baza = new Baza();
    $server_vrijeme = time();
    $upit = "SELECT pomak FROM Pomak;";
    $rezultat = $baza->selectDB($upit);
    $red = $rezultat->fetch_array();
    $server_vrijeme = time();
    $sustav_vrijeme = $server_vrijeme + ($red[0] * 60 * 60);
    echo "Vrijeme servera: " . date('d.m.Y H:i', $server_vrijeme) . "<br>";
    echo "Vrijeme sustava: " . date('d.m.Y H:i', $sustav_vrijeme);
}

function azuriraj(){
    $baza=new Baza();
    $upit="SELECT * FROM Pomak;";
    $rezultat=$baza->selectDB($upit);
    $rez=$rezultat->fetch_array();
    $vrijeme=  time();
    $sustav_vrijeme=date("Y-m-d H:i:s",$vrijeme+($rez['pomak']*3600));
    return $sustav_vrijeme;
}

?>
