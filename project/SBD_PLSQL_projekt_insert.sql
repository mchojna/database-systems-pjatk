-- Table: Adres
INSERT ALL
    INTO Adres (id_adresu, miasto, ulica, nr_ulicy, nr_budynku, nr_lokalu, kod_pocztowy) VALUES (1, 'Warszawa', 'Marszalkowska', '12A', '5', '2', '00-001')
    INTO Adres (id_adresu, miasto, ulica, nr_ulicy, nr_budynku, nr_lokalu, kod_pocztowy) VALUES (2, 'Krakow', 'Florianska', '45', '10', '3', '30-002')
    INTO Adres (id_adresu, miasto, ulica, nr_ulicy, nr_budynku, nr_lokalu, kod_pocztowy) VALUES (3, 'Lodz', 'Piotrkowska', '150', '20', NULL, '90-003')
    INTO Adres (id_adresu, miasto, ulica, nr_ulicy, nr_budynku, nr_lokalu, kod_pocztowy) VALUES (4, 'Wroclaw', 'Swidnicka', '32B', '15', '7', '50-004')
    INTO Adres (id_adresu, miasto, ulica, nr_ulicy, nr_budynku, nr_lokalu, kod_pocztowy) VALUES (5, 'Poznan', 'Polwiejska', '5', '2A', NULL, '60-005')
SELECT 1 FROM DUAL;

-- Table: Osoba
INSERT ALL
    INTO Osoba (id_osoby, imie, nazwisko) VALUES (1, 'Jan', 'Kowalski')
    INTO Osoba (id_osoby, imie, nazwisko) VALUES (2, 'Anna', 'Nowak')
    INTO Osoba (id_osoby, imie, nazwisko) VALUES (3, 'Piotr', 'Wisniewski')
    INTO Osoba (id_osoby, imie, nazwisko) VALUES (4, 'Katarzyna', 'Wojcik')
    INTO Osoba (id_osoby, imie, nazwisko) VALUES (5, 'Tomasz', 'Krawczyk')
    INTO Osoba (id_osoby, imie, nazwisko) VALUES (6, 'Maria', 'Kaminska')
    INTO Osoba (id_osoby, imie, nazwisko) VALUES (7, 'Michal', 'Lewandowski')
    INTO Osoba (id_osoby, imie, nazwisko) VALUES (8, 'Zofia', 'Dabrowska')
    INTO Osoba (id_osoby, imie, nazwisko) VALUES (9, 'Lukasz', 'Zielinski')
    INTO Osoba (id_osoby, imie, nazwisko) VALUES (10, 'Aleksandra', 'Szymanska')
SELECT 1 FROM DUAL;

-- Table: Klient
INSERT ALL
    INTO Klient (id_klienta, nr_pesel, nr_dowodu_osobistego, id_adresu) VALUES (1, '90010112345', 'ABC123456', 1)
    INTO Klient (id_klienta, nr_pesel, nr_dowodu_osobistego, id_adresu) VALUES (2, '85051567890', 'DEF987654', 2)
    INTO Klient (id_klienta, nr_pesel, nr_dowodu_osobistego, id_adresu) VALUES (3, '92030354321', 'GHI456789', 3)
    INTO Klient (id_klienta, nr_pesel, nr_dowodu_osobistego, id_adresu) VALUES (4, '87070711223', 'JKL654321', 4)
    INTO Klient (id_klienta, nr_pesel, nr_dowodu_osobistego, id_adresu) VALUES (5, '95021234567', 'MNO321654', 5)
SELECT 1 FROM DUAL;

-- Table: Pracownik
INSERT ALL
    INTO Pracownik (id_pracownika, data_zatrudnienia, id_kierownika) VALUES (6, TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL)
    INTO Pracownik (id_pracownika, data_zatrudnienia, id_kierownika) VALUES (7, TO_DATE('2022-06-15', 'YYYY-MM-DD'), 6)
    INTO Pracownik (id_pracownika, data_zatrudnienia, id_kierownika) VALUES (8, TO_DATE('2021-09-30', 'YYYY-MM-DD'), 7)
    INTO Pracownik (id_pracownika, data_zatrudnienia, id_kierownika) VALUES (9, TO_DATE('2022-11-20', 'YYYY-MM-DD'), 6)
    INTO Pracownik (id_pracownika, data_zatrudnienia, id_kierownika) VALUES (10, TO_DATE('2020-04-05', 'YYYY-MM-DD'), 8)
SELECT 1 FROM DUAL;

-- Table: Forma_kontatku
INSERT ALL
    INTO Forma_kontatku (id_formy_kontatku, nazwa) VALUES (1, 'Telefon')
    INTO Forma_kontatku (id_formy_kontatku, nazwa) VALUES (2, 'E-mail')
    INTO Forma_kontatku (id_formy_kontatku, nazwa) VALUES (3, 'SMS')
    INTO Forma_kontatku (id_formy_kontatku, nazwa) VALUES (4, 'Chat')
    INTO Forma_kontatku (id_formy_kontatku, nazwa) VALUES (5, 'List')
SELECT 1 FROM DUAL;

-- Table: Kontakt
INSERT ALL
    INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (1, 1, 6, TO_TIMESTAMP('2024-01-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1)
    INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (2, 2, 6, TO_TIMESTAMP('2024-02-02 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 3)
    INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (3, 3, 7, TO_TIMESTAMP('2024-02-03 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1)
    INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (4, 4, 6, TO_TIMESTAMP('2024-04-04 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 2)
    INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (5, 5, 10, TO_TIMESTAMP('2024-01-05 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 1)
    INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (6, 1, 8, TO_TIMESTAMP('2024-05-06 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 3)
    INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (7, 2, 9, TO_TIMESTAMP('2024-06-07 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3)
    INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (8, 3, 9, TO_TIMESTAMP('2024-01-08 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2)
    INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (9, 4, 10, TO_TIMESTAMP('2024-11-09 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 1)
    INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (10, 5, 8, TO_TIMESTAMP('2024-08-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1)
SELECT 1 FROM DUAL;

-- Table: Numer_telefonu
INSERT ALL
    INTO Numer_telefonu (nr_telefonu, id_klienta) VALUES ('123456789', 1)
    INTO Numer_telefonu (nr_telefonu, id_klienta) VALUES ('987654321', 2)
    INTO Numer_telefonu (nr_telefonu, id_klienta) VALUES ('123123123', 3)
    INTO Numer_telefonu (nr_telefonu, id_klienta) VALUES ('234234234', 4)
    INTO Numer_telefonu (nr_telefonu, id_klienta) VALUES ('345345345', 5)
SELECT 1 FROM DUAL;

-- Table: Pakiet
INSERT ALL
    INTO Pakiet (id_pakietu, nazwa, cena, liczba_minut, liczba_smsow, ilosc_danych) VALUES (1, 'Pakiet A', 29.99, 100, 50, 5)
    INTO Pakiet (id_pakietu, nazwa, cena, liczba_minut, liczba_smsow, ilosc_danych) VALUES (2, 'Pakiet B', 49.99, 300, 150, 15)
    INTO Pakiet (id_pakietu, nazwa, cena, liczba_minut, liczba_smsow, ilosc_danych) VALUES (3, 'Pakiet C', 69.99, 500, 250, 25)
    INTO Pakiet (id_pakietu, nazwa, cena, liczba_minut, liczba_smsow, ilosc_danych) VALUES (4, 'Pakiet D', 89.99, 1000, 500, 50)
    INTO Pakiet (id_pakietu, nazwa, cena, liczba_minut, liczba_smsow, ilosc_danych) VALUES (5, 'Pakiet E', 109.99, 1500, 1000, 100)
SELECT 1 FROM DUAL;

-- Table: Oferta
INSERT ALL
    INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (1, 1, 1, '123456789')
    INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (2, 2, 2, '987654321')
    INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (3, 3, 2, '123123123')
    INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (4, 4, 3, '234234234')
    INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (5, 5, 1, '345345345')
    INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (6, 6, 1, '123456789')
    INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (7, 7, 3, '987654321')
    INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (8, 8, 2, '123123123')
    INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (9, 9, 3, '234234234')
    INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (10, 10, 1, '345345345')
SELECT 1 FROM DUAL;

-- Table: Umowa
INSERT ALL
    INTO Umowa (id_umowy, id_oferty, data_rozpoczecia, data_zakonczenia) VALUES (1, 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'))
    INTO Umowa (id_umowy, id_oferty, data_rozpoczecia, data_zakonczenia) VALUES (2, 3, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-01', 'YYYY-MM-DD'))
    INTO Umowa (id_umowy, id_oferty, data_rozpoczecia, data_zakonczenia) VALUES (3, 5, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2025-03-01', 'YYYY-MM-DD'))
    INTO Umowa (id_umowy, id_oferty, data_rozpoczecia, data_zakonczenia) VALUES (4, 7, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2025-04-01', 'YYYY-MM-DD'))
    INTO Umowa (id_umowy, id_oferty, data_rozpoczecia, data_zakonczenia) VALUES (5, 9, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2025-05-01', 'YYYY-MM-DD'))
SELECT 1 FROM DUAL;

-- Table: Zgoda_marketingowa
INSERT ALL
    INTO Zgoda_marketingowa (id_zgody, nazwa_zgody, opis) VALUES (1, 'Newsletter', 'Zgoda na otrzymywanie newslettera.')
    INTO Zgoda_marketingowa (id_zgody, nazwa_zgody, opis) VALUES (2, 'SMS Marketing', 'Zgoda na otrzymywanie ofert SMS.')
    INTO Zgoda_marketingowa (id_zgody, nazwa_zgody, opis) VALUES (3, 'Telefoniczna oferta', 'Zgoda na kontakt telefoniczny w celach marketingowych.')
SELECT 1 FROM DUAL;

-- Table: Zgoda_klient
INSERT ALL
    INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (1, 1, 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'))
    INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (2, 1, 2, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'))
    INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (3, 2, 2, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2025-03-31', 'YYYY-MM-DD'))
    INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (4, 3, 1, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2025-04-30', 'YYYY-MM-DD'))
    INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (5, 4, 2, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2025-03-31', 'YYYY-MM-DD'))
    INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (6, 4, 3, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2025-04-30', 'YYYY-MM-DD'))
    INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (7, 5, 1, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2025-05-31', 'YYYY-MM-DD'))
    INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (8, 5, 2, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2025-05-31', 'YYYY-MM-DD'))
    INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (9, 5, 3, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2025-05-31', 'YYYY-MM-DD'))
SELECT 1 FROM DUAL;
