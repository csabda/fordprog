%baseclass-preinclude <iostream>

%lsp-needed

%token INT
%token MAIN
%token KEZDES
%token VEGE
%token EGESZ 
%token LOGIKAI
%token HA
%token KULONBEN
%token AMIG
%token OLVAS
%token IR
%token KIMENET
%token BEMENET
%token PONTOSVESSZO
%token ERTEKADAS
%token BALZAROJEL
%token JOBBZAROJEL
%token SZAM
%token IGAZ
%token HAMIS
%token AZONOSITO

%left VAGY
%left ES
%left NEM
%left EGYENLO
%left KISEBB NAGYOBB
%left PLUSZ MINUSZ
%left SZORZAS OSZTAS MARADEK

%%

start:
    INT MAIN BALZAROJEL JOBBZAROJEL KEZDES deklaraciok utasitasok VEGE
    {
        std::cout << "start -> INT MAIN BALZAROJEL JOBBZAROJEL KEZDES deklaraciok utasitasok VEGE" << std::endl;
    }
;

deklaraciok:
    // ures
    {
        std::cout << "deklaraciok -> epszilon" << std::endl;
    }
|
    deklaracio deklaraciok
    {
        std::cout << "deklaraciok -> deklaracio deklaraciok" << std::endl;
    }
;

deklaracio:
    EGESZ AZONOSITO PONTOSVESSZO
    {
        std::cout << "deklaracio -> EGESZ AZONOSITO PONTOSVESSZO" << std::endl;
    }
|
    LOGIKAI AZONOSITO PONTOSVESSZO
    {
        std::cout << "deklaracio -> LOGIKAI AZONOSITO PONTOSVESSZO" << std::endl;
    }
;

utasitasok:
    utasitas
    {
        std::cout << "utasitasok -> utasitas" << std::endl;
    }
|
    utasitas utasitasok
    {
        std::cout << "utasitasok -> utasitas utasitasok" << std::endl;
    }
;

utasitas:
    ertekadas
    {
        std::cout << "utasitas -> ertekadas" << std::endl;
    }
|
    be
    {
        std::cout << "utasitas -> be" << std::endl;
    }
|
    ki
    {
        std::cout << "utasitas -> ki" << std::endl;
    }
|
    elagazas
    {
        std::cout << "utasitas -> elagazas" << std::endl;
    }
|
    ciklus
    {
        std::cout << "utasitas -> ciklus" << std::endl;
    }
;

ertekadas:
    AZONOSITO ERTEKADAS kifejezes PONTOSVESSZO
    {
        std::cout << "ertekadas -> AZONOSITO ERTEKADAS kifejezes PONTOSVESSZO" << std::endl;
    }
;

be:
    BEMENET OLVAS AZONOSITO PONTOSVESSZO
    {
        std::cout << "be -> BEMENET OLVAS AZONOSITO PONTOSVESSZO" << std::endl;
    }
;

ki:
    KIMENET IR kifejezes PONTOSVESSZO
    {
        std::cout << "ki -> KIMENET IR kifejezes PONTOSVESSZO" << std::endl;
    }
;

elagazas:
    HA BALZAROJEL kifejezes JOBBZAROJEL KEZDES utasitasok VEGE
    {
        std::cout << "elagazas -> HA BALZAROJEL kifejezes JOBBZAROJEL KEZDES utasitasok VEGE" << std::endl;
    }
|
    HA BALZAROJEL kifejezes JOBBZAROJEL KEZDES utasitasok VEGE KULONBEN KEZDES utasitasok VEGE
    {
        std::cout << "elagazas -> HA BALZAROJEL kifejezes JOBBZAROJEL KEZDES utasitasok VEGE KULONBEN KEZDES utasitasok VEGE" << std::endl;
    }
;

ciklus:
    AMIG BALZAROJEL kifejezes JOBBZAROJEL KEZDES utasitasok VEGE
    {
        std::cout << "ciklus -> AMIG BALZAROJEL kifejezes JOBBZAROJEL KEZDES utasitasok VEGE" << std::endl;
    }
;

kifejezes:
    SZAM
    {
        std::cout << "kifejezes -> SZAM" << std::endl;
    }
|
    IGAZ
    {
        std::cout << "kifejezes -> IGAZ" << std::endl;
    }
|
    HAMIS
    {
        std::cout << "kifejezes -> HAMIS" << std::endl;
    }
|
    AZONOSITO
    {
        std::cout << "kifejezes -> AZONOSITO" << std::endl;
    }
|
    kifejezes PLUSZ kifejezes
    {
        std::cout << "kifejezes -> kifejezes PLUSZ kifejezes" << std::endl;
    }
|
    kifejezes MINUSZ kifejezes
    {
        std::cout << "kifejezes -> kifejezes MINUSZ kifejezes" << std::endl;
    }
|
    kifejezes SZORZAS kifejezes
    {
        std::cout << "kifejezes -> kifejezes SZORZAS kifejezes" << std::endl;
    }
|
    kifejezes OSZTAS kifejezes
    {
        std::cout << "kifejezes -> kifejezes OSZTAS kifejezes" << std::endl;
    }
|
    kifejezes MARADEK kifejezes
    {
        std::cout << "kifejezes -> kifejezes MARADEK kifejezes" << std::endl;
    }
|
    kifejezes KISEBB kifejezes
    {
        std::cout << "kifejezes -> kifejezes KISEBB kifejezes" << std::endl;
    }
|
    kifejezes NAGYOBB kifejezes
    {
        std::cout << "kifejezes -> kifejezes NAGYOBB kifejezes" << std::endl;
    }
|
    kifejezes EGYENLO kifejezes
    {
        std::cout << "kifejezes -> kifejezes EGYENLO kifejezes" << std::endl;
    }
|
    kifejezes ES kifejezes
    {
        std::cout << "kifejezes -> kifejezes ES kifejezes" << std::endl;
    }
|
    kifejezes VAGY kifejezes
    {
        std::cout << "kifejezes -> kifejezes VAGY kifejezes" << std::endl;
    }
|
    NEM kifejezes
    {
        std::cout << "kifejezes -> NEM kifejezes" << std::endl;
    }
|
    BALZAROJEL kifejezes JOBBZAROJEL
    {
        std::cout << "kifejezes -> BALZAROJEL kifejezes JOBBZAROJEL" << std::endl;
    }
;
