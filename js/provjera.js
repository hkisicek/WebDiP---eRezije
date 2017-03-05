$('registracija.php').ready(function () {

    validno0 = /^[a-zšđžčć]+$/;
    validno1 = /^[a-zA-Z0-9_-]{3,15}$/;
    validno2 = /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    validno3 = /^([a-zA-Z0-9@*#]{5,15})$/;
    validno4 = /^([0-9]{6,12})$/;

    $("#ime").focusout(function (event) {
        var ime = $("#ime").val();
        if (!validno0.test(ime)) {
            $("#ime").css("box-shadow", "0 0 5px red");
            $("#ime").focus();
            $("#imeg").html("Ime nije ispravno uneseno! ");
            $("#imeg").css("color", "red");
        } else {
            $("#ime").css("box-shadow", "0 0 5px green");
            $("#imeg").html("Ime");
            $("#imeg").css("color", "green");
        }
    });

    $("#prezime").focusout(function (event) {
        var prezime = $("#prezime").val();
        if (!validno0.test(prezime)) {
            $("#prezime").css("box-shadow", "0 0 5px red");
            $("#prezime").focus();
            $("#prezimeg").html("Prezime nije ispravno uneseno! ");
            $("#prezimeg").css("color", "red");
        } else {
            $("#prezime").css("box-shadow", "0 0 5px green");
            $("#prezimeg").html("Prezime");
            $("#prezimeg").css("color", "green");
        }
    });

    $("#email").focusout(function (event) {
        var email = $("#email").val();
        if (!validno2.test(email)) {
            $("#email").css("box-shadow", "0 0 5px red");
            $("#email").focus();
            $("#emailg").html("Email nije ispravno unesen! ");
            $("#emailg").css("color", "red");
        } else {
            $("#email").css("box-shadow", "0 0 5px green");
            $("#emailg").html("Email:");
            $("#emailg").css("color", "green");
        }
    });


    $("#lozinka").focusout(function (event) {
        var lozinka = $("#lozinka").val();
        if (!validno3.test(lozinka)) {
            $("#lozinka").css("box-shadow", "0 0 5px red");
            $("#lozinka").focus();
            $("#lozinkag").html("Lozinka nije ispravno unesena! ");
            $("#lozinkag").css("color", "red");
        } else {
            $("#lozinka").css("box-shadow", "0 0 5px green");
            $("#lozinkag").html("Lozinka:");
            $("#lozinkag").css("color", "green");
        }
    });

    $("#ponovljena").focusout(function (event) {
        var lozinka = $("#lozinka").val();
        var ponovljena = $("#ponovljena").val();
        if (lozinka != ponovljena) {
            $("#ponovljena").css("box-shadow", "0 0 5px red");
            $("#ponovljena").focus();
            $("#ponovljenag").html("Lozinke se ne poklapaju! ");
            $("#ponovljenag").css("color", "red");
        } else {
            $("#ponovljena").css("box-shadow", "0 0 5px green");
            $("#ponovljenag").html("Ponovite lozinku:");
            $("#ponovljenag").css("color", "green");
        }
    });

    $("#ulica").focusout(function (event) {
        if (!$("#ulica").val()) {
            $("#ulica").css("box-shadow", "0 0 5px red");
            $("#ulica").focus();
            $("#ulicag").html("Ulica nije ispravno unesena! ");
            $("#ulicag").css("color", "red");
        } else {
            $("#ulica").css("box-shadow", "0 0 5px green");
            $("#ulicag").html("Ulica:");
            $("#ulicag").css("color", "green");
        }

    });
    

    $("#grad").focusout(function (event) {
        if (!$("#grad").val()) {
            $("#grad").css("box-shadow", "0 0 5px red");
            $("#grad").focus();
            $("#gradg").html("Grad nije ispravno unesen! ");
            $("#gradg").css("color", "red");
        } else {
            $("#grad").css("box-shadow", "0 0 5px green");
            $("#gradg").html("Grad:");
            $("#gradg").css("color", "green");
        }

    });

    $("#telefon").focusout(function (event) {
        var telefon = $("#telefon").val();
        if (!validno4.test(telefon)) {
            $("#telefon").css("box-shadow", "0 0 5px red");
            $("#telefon").focus();
            $("#telefong").html("Telefon nije ispravno unesen! ");
            $("#telefong").css("color", "red");
        } else {
            $("#telefon").css("box-shadow", "0 0 5px green");
            $("#telefong").html("Telefon:");
            $("#telefong").css("color", "green");
        }
    });
    
        $("#korisnicko_ime").focusout(function (event) {
        var korisnicko_ime = $("#korisnicko_ime").val();
        if (!validno1.test(korisnicko_ime)) {
            $("#korisnicko_ime").css("box-shadow", "0 0 5px red");
            $("#korisnicko_ime").focus();
            $("#korisnicko_imeg").html("Korisničko ime nije ispravno uneseno! ");
            $("#korisnicko_imeg").css("color", "red");
        }
        else{
        $.ajax({
            type: 'GET',
            url: "korisnicko.php",
            dataType: 'json',
            data: {
                'korisnicko_ime': korisnicko_ime
            },
            success: function (data) {
                if (data.ima) {
                    $("#korisnicko_ime").css("box-shadow", "0 0 5px red");
                    $("#korisnicko_ime").focus();
                    $("#korisnicko_imeg").html("Korisničko ime je zauzeto! ");
                    $("#korisnicko_imeg").css("color", "red");
                } else {
                    $("#korisnicko_ime").css("box-shadow", "0 0 5px green");
                    $("#korisnicko_imeg").html("Korisničko ime:");
                    $("#korisnicko_imeg").css("color", "green");
                }
            },
            error:function(data){
                console.log("Greska");
                console.log(data);
            }
        
        });
    }
    });

    var gradovi = new Array();
    $.getJSON("gradovi.json", function (data) {
        $.each(data, function (key, val) {
            console.log(val);
            gradovi.push(val);
        });
    });

    $("#grad").autocomplete({
        source: gradovi
    });


});