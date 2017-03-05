<?php

//Skripta za izmjenu vremena.

include_once ("okviri/baza_class.php");
include_once ("okviri/postavi_vrijeme.php");
spremi();
header("Location:promijeni_vrijeme.php");

?>
