-- foreign keys
ALTER TABLE Klient
    DROP CONSTRAINT Klient_Adres;

ALTER TABLE Klient
    DROP CONSTRAINT Klient_Osoba;

ALTER TABLE Kontakt
    DROP CONSTRAINT Kontakt_Forma_kontatku;

ALTER TABLE Kontakt
    DROP CONSTRAINT Kontakt_Klient;

ALTER TABLE Kontakt
    DROP CONSTRAINT Kontakt_Pracownik;

ALTER TABLE Numer_telefonu
    DROP CONSTRAINT Numer_telefonu_Klient;

ALTER TABLE Oferta
    DROP CONSTRAINT OPN_Kontakt;

ALTER TABLE Oferta
    DROP CONSTRAINT OPN_Numer_telefonu;

ALTER TABLE Oferta
    DROP CONSTRAINT OPN_Pakiet;

ALTER TABLE Pracownik
    DROP CONSTRAINT Pracownik_Osoba;

ALTER TABLE Pracownik
    DROP CONSTRAINT Pracownik_Pracownik;

ALTER TABLE Umowa
    DROP CONSTRAINT Umowa_OPN;

ALTER TABLE Zgoda_klient
    DROP CONSTRAINT Zgoda_klient_Klient;

ALTER TABLE Zgoda_klient
    DROP CONSTRAINT Zgoda_klient_ZM;

-- tables
DROP TABLE Adres;

DROP TABLE Forma_kontatku;

DROP TABLE Klient;

DROP TABLE Kontakt;

DROP TABLE Numer_telefonu;

DROP TABLE Oferta;

DROP TABLE Osoba;

DROP TABLE Pakiet;

DROP TABLE Pracownik;

DROP TABLE Umowa;

DROP TABLE Zgoda_klient;

DROP TABLE Zgoda_marketingowa;

-- Table: Adres
CREATE TABLE Adres (
    id_adresu integer  NOT NULL,
    miasto varchar2(20)  NOT NULL,
    ulica varchar2(20)  NOT NULL,
    nr_ulicy varchar2(10)  NOT NULL,
    nr_budynku varchar2(10)  NOT NULL,
    nr_lokalu varchar2(10)  NULL,
    kod_pocztowy char(6)  NOT NULL,
    CONSTRAINT Adres_pk PRIMARY KEY (id_adresu)
) ;

-- Table: Osoba
CREATE TABLE Osoba (
    id_osoby integer  NOT NULL,
    imie varchar2(40)  NOT NULL,
    nazwisko varchar2(40)  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (id_osoby)
) ;

-- Table: Klient
CREATE TABLE Klient (
    id_klienta integer  NOT NULL,
    nr_pesel char(11)  NOT NULL,
    nr_dowodu_osobistego char(9)  NOT NULL,
    id_adresu integer  NOT NULL,
    CONSTRAINT Klient_pk PRIMARY KEY (id_klienta)
) ;

-- Table: Pracownik
CREATE TABLE Pracownik (
    id_pracownika integer  NOT NULL,
    data_zatrudnienia date  NOT NULL,
    id_kierownika integer  NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY (id_pracownika)
) ;

-- Table: Forma_kontatku
CREATE TABLE Forma_kontatku (
    id_formy_kontatku integer  NOT NULL,
    nazwa varchar2(30)  NOT NULL,
    CONSTRAINT Forma_kontatku_pk PRIMARY KEY (id_formy_kontatku)
) ;

-- Table: Kontakt
CREATE TABLE Kontakt (
    id_kontatku integer  NOT NULL,
    id_klienta integer  NOT NULL,
    id_pracownika integer  NOT NULL,
    data_kontaktu timestamp  NOT NULL,
    id_formy_kontatku integer  NOT NULL,
    CONSTRAINT Kontakt_pk PRIMARY KEY (id_kontatku)
) ;

-- Table: Numer_telefonu
CREATE TABLE Numer_telefonu (
    nr_telefonu char(9)  NOT NULL,
    id_klienta integer  NOT NULL,
    CONSTRAINT Numer_telefonu_pk PRIMARY KEY (nr_telefonu)
) ;

-- Table: Oferta
CREATE TABLE Oferta (
    id_oferty integer  NOT NULL,
    id_kontatku integer  NOT NULL,
    id_pakietu integer  NOT NULL,
    nr_telefonu char(9)  NOT NULL,
    CONSTRAINT Oferta_pk PRIMARY KEY (id_oferty)
) ;

-- Table: Pakiet
CREATE TABLE Pakiet (
    id_pakietu integer  NOT NULL,
    nazwa varchar2(20)  NOT NULL,
    cena number(6,2)  NOT NULL,
    liczba_minut integer  NOT NULL,
    liczba_smsow integer  NOT NULL,
    ilosc_danych integer  NOT NULL,
    CONSTRAINT Pakiet_pk PRIMARY KEY (id_pakietu)
) ;

-- Table: Umowa
CREATE TABLE Umowa (
    id_umowy integer  NOT NULL,
    id_oferty integer  NOT NULL,
    data_rozpoczecia date  NOT NULL,
    data_zakonczenia date  NOT NULL,
    CONSTRAINT Umowa_pk PRIMARY KEY (id_umowy)
) ;

-- Table: Zgoda_marketingowa
CREATE TABLE Zgoda_marketingowa (
    id_zgody integer  NOT NULL,
    nazwa_zgody varchar2(30)  NOT NULL,
    opis varchar2(120)  NOT NULL,
    CONSTRAINT Zgoda_marketingowa_pk PRIMARY KEY (id_zgody)
) ;

-- Table: Zgoda_klient
CREATE TABLE Zgoda_klient (
    id_zgody_klienta integer  NOT NULL,
    id_klienta integer  NOT NULL,
    id_zgody integer  NOT NULL,
    data_rozpoczecia date  NOT NULL,
    data_zakonczenia date  NOT NULL,
    CONSTRAINT Zgoda_klient_pk PRIMARY KEY (id_zgody_klienta)
) ;

-- foreign keys
-- Reference: Klient_Adres (table: Klient)
ALTER TABLE Klient ADD CONSTRAINT Klient_Adres
    FOREIGN KEY (id_adresu)
    REFERENCES Adres (id_adresu);

-- Reference: Klient_Osoba (table: Klient)
ALTER TABLE Klient ADD CONSTRAINT Klient_Osoba
    FOREIGN KEY (id_klienta)
    REFERENCES Osoba (id_osoby);

-- Reference: Kontakt_Forma_kontatku (table: Kontakt)
ALTER TABLE Kontakt ADD CONSTRAINT Kontakt_Forma_kontatku
    FOREIGN KEY (id_formy_kontatku)
    REFERENCES Forma_kontatku (id_formy_kontatku);

-- Reference: Kontakt_Klient (table: Kontakt)
ALTER TABLE Kontakt ADD CONSTRAINT Kontakt_Klient
    FOREIGN KEY (id_klienta)
    REFERENCES Klient (id_klienta);

-- Reference: Kontakt_Pracownik (table: Kontakt)
ALTER TABLE Kontakt ADD CONSTRAINT Kontakt_Pracownik
    FOREIGN KEY (id_pracownika)
    REFERENCES Pracownik (id_pracownika);

-- Reference: Numer_telefonu_Klient (table: Numer_telefonu)
ALTER TABLE Numer_telefonu ADD CONSTRAINT Numer_telefonu_Klient
    FOREIGN KEY (id_klienta)
    REFERENCES Klient (id_klienta);

-- Reference: OPN_Kontakt (table: Oferta)
ALTER TABLE Oferta ADD CONSTRAINT OPN_Kontakt
    FOREIGN KEY (id_kontatku)
    REFERENCES Kontakt (id_kontatku);

-- Reference: OPN_Numer_telefonu (table: Oferta)
ALTER TABLE Oferta ADD CONSTRAINT OPN_Numer_telefonu
    FOREIGN KEY (nr_telefonu)
    REFERENCES Numer_telefonu (nr_telefonu);

-- Reference: OPN_Pakiet (table: Oferta)
ALTER TABLE Oferta ADD CONSTRAINT OPN_Pakiet
    FOREIGN KEY (id_pakietu)
    REFERENCES Pakiet (id_pakietu);

-- Reference: Pracownik_Osoba (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Osoba
    FOREIGN KEY (id_pracownika)
    REFERENCES Osoba (id_osoby);

-- Reference: Pracownik_Pracownik (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Pracownik
    FOREIGN KEY (id_kierownika)
    REFERENCES Pracownik (id_pracownika);

-- Reference: Umowa_OPN (table: Umowa)
ALTER TABLE Umowa ADD CONSTRAINT Umowa_OPN
    FOREIGN KEY (id_oferty)
    REFERENCES Oferta (id_oferty);

-- Reference: Zgoda_klient_Klient (table: Zgoda_klient)
ALTER TABLE Zgoda_klient ADD CONSTRAINT Zgoda_klient_Klient
    FOREIGN KEY (id_klienta)
    REFERENCES Klient (id_klienta);

-- Reference: Zgoda_klient_ZM (table: Zgoda_klient)
ALTER TABLE Zgoda_klient ADD CONSTRAINT Zgoda_klient_ZM
    FOREIGN KEY (id_zgody)
    REFERENCES Zgoda_marketingowa (id_zgody);
