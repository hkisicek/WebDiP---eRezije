<?php

//Skripta za kreiranje pdf dokumenata.

include_once ("okviri/baza_class.php");
include_once ("vanjske/fpdf.php");

$baza = new Baza();

if (isset($_GET['statistikaU'])) {
    $pdf = new FPDF('P', 'mm', 'A4');
    $pdf->AddPage();
    $pdf->SetFont('Arial', 'I', 16);
    $pdf->Cell(0, 10, 'Statistika ustanova', 0, 1, 'C');
    $pdf->Cell(0, 10, '', 0, 1, 'C');

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->Cell(30, 5, 'Ustanova', 1, 0, 'C');
    $pdf->Cell(37, 5, 'Lajkovi', 1, 0, 'C');
    $pdf->Cell(30, 5, 'Dislajkovi', 1, 0, 'C');
    $pdf->Ln();

    $pdf->SetFont('Arial', 'I', 8);
    $upit = "SELECT  `Ustanova` , SUM(  `Like` ) , SUM(  `Dislike` ) 
FROM  `Lajkovi` 
WHERE  `Ustanova` IS NOT NULL 
GROUP BY  `Ustanova` ;";
    $rezultat = $baza->selectDB($upit);

    while ($rez = $rezultat->fetch_array()) {
        $pdf->Cell(30, 5, $rez[0], 1, 0, 'C');
        $pdf->Cell(37, 5, $rez[1], 1, 0, 'C');
        $pdf->Cell(30, 5, $rez[2], 1, 0, 'C');
        $pdf->Ln();
    }

    $pdf->Output('D', 'StatistikaU.pdf', true);
}

if (isset($_GET['statistikaK'])) {
    $pdf = new FPDF('P', 'mm', 'A4');
    $pdf->AddPage();
    $pdf->SetFont('Arial', 'I', 16);
    $pdf->Cell(0, 10, 'Statistika kategorije', 0, 1, 'C');
    $pdf->Cell(0, 10, '', 0, 1, 'C');

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->Cell(30, 5, 'Kategorija', 1, 0, 'C');
    $pdf->Cell(37, 5, 'Lajkovi', 1, 0, 'C');
    $pdf->Cell(30, 5, 'Dislajkovi', 1, 0, 'C');
    $pdf->Ln();

    $pdf->SetFont('Arial', 'I', 8);
    $upit = "SELECT  `Kategorija_ocitavanja` , SUM(  `Like` ) , SUM(  `Dislike` ) 
FROM  `Lajkovi` 
WHERE  `Kategorija_ocitavanja` IS NOT NULL 
GROUP BY  `Kategorija_ocitavanja` ;";
    $rezultat = $baza->selectDB($upit);

    while ($rez = $rezultat->fetch_array()) {
        $pdf->Cell(30, 5, $rez[0], 1, 0, 'C');
        $pdf->Cell(37, 5, $rez[1], 1, 0, 'C');
        $pdf->Cell(30, 5, $rez[2], 1, 0, 'C');
        $pdf->Ln();
    }

    $pdf->Output('D', 'StatistikaK.pdf', true);
}

if (isset($_GET['statistikaS'])) {
    $pdf = new FPDF('P', 'mm', 'A4');
    $pdf->AddPage();
    $pdf->SetFont('Arial', 'I', 16);
    $pdf->Cell(0, 10, 'Statistika skripte', 0, 1, 'C');
    $pdf->Cell(0, 10, '', 0, 1, 'C');

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->Cell(110, 5, 'Skripta', 1, 0, 'C');
    $pdf->Cell(0, 5, 'Posjeta', 1, 0, 'C');
    $pdf->Ln();

    $pdf->SetFont('Arial', 'I', 8);
    $upit = "SELECT `Skripta`,count(`Skripta`) from Dnevnik where `Skripta` is not null group by `Skripta`;";
    $rezultat = $baza->selectDB($upit);

    while ($rez = $rezultat->fetch_array()) {
        $pdf->Cell(110, 5, $rez[0], 1, 0, 'C');
        $pdf->Cell(0, 5, $rez[1], 1, 0, 'C');
        $pdf->Ln();
    }

    $pdf->Output('D', 'StatistikaS.pdf', true);
}

if (isset($_GET['statistikA'])) {
    $pdf = new FPDF('P', 'mm', 'A4');
    $pdf->AddPage();
    $pdf->SetFont('Arial', 'I', 16);
    $pdf->Cell(0, 10, 'Statistika upiti', 0, 1, 'C');
    $pdf->Cell(0, 10, '', 0, 1, 'C');

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->Cell(110, 5, 'Upit', 1, 0, 'C');
    $pdf->Cell(0, 5, 'Broj izvrsavanja', 1, 0, 'C');
    $pdf->Ln();

    $pdf->SetFont('Arial', 'I', 8);
    $upit = "SELECT `Upit`,count(`Upit`) from Dnevnik where `Upit` is not null group by `Upit`;";
    $rezultat = $baza->selectDB($upit);

    while ($rez = $rezultat->fetch_array()) {
        $pdf->Cell(110, 5, $rez[0], 1, 0, 'C');
        $pdf->Cell(0, 5, $rez[1], 1, 0, 'C');
        $pdf->Ln();
    }

    $pdf->Output('D', 'StatistikA.pdf', true);
}
?>