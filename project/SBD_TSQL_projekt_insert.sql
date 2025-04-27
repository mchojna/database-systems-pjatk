-- Table: Adres
INSERT INTO Adres (id_adresu, miasto, ulica, nr_ulicy, nr_budynku, nr_lokalu, kod_pocztowy) VALUES (1, 'Warszawa', 'Marszalkowska', '12A', '5', '2', '00-001');
INSERT INTO Adres (id_adresu, miasto, ulica, nr_ulicy, nr_budynku, nr_lokalu, kod_pocztowy) VALUES (2, 'Krakow', 'Florianska', '45', '10', '3', '30-002');
INSERT INTO Adres (id_adresu, miasto, ulica, nr_ulicy, nr_budynku, nr_lokalu, kod_pocztowy) VALUES (3, 'Lodz', 'Piotrkowska', '150', '20', NULL, '90-003');
INSERT INTO Adres (id_adresu, miasto, ulica, nr_ulicy, nr_budynku, nr_lokalu, kod_pocztowy) VALUES (4, 'Wroclaw', 'Swidnicka', '32B', '15', '7', '50-004');
INSERT INTO Adres (id_adresu, miasto, ulica, nr_ulicy, nr_budynku, nr_lokalu, kod_pocztowy) VALUES (5, 'Poznan', 'Polwiejska', '5', '2A', NULL, '60-005');

-- Table: Osoba
INSERT INTO Osoba (id_osoby, imie, nazwisko) VALUES (1, 'Jan', 'Kowalski');
INSERT INTO Osoba (id_osoby, imie, nazwisko) VALUES (2, 'Anna', 'Nowak');
INSERT INTO Osoba (id_osoby, imie, nazwisko) VALUES (3, 'Piotr', 'Wisniewski');
INSERT INTO Osoba (id_osoby, imie, nazwisko) VALUES (4, 'Katarzyna', 'Wojcik');
INSERT INTO Osoba (id_osoby, imie, nazwisko) VALUES (5, 'Tomasz', 'Krawczyk');
INSERT INTO Osoba (id_osoby, imie, nazwisko) VALUES (6, 'Maria', 'Kaminska');
INSERT INTO Osoba (id_osoby, imie, nazwisko) VALUES (7, 'Michal', 'Lewandowski');
INSERT INTO Osoba (id_osoby, imie, nazwisko) VALUES (8, 'Zofia', 'Dabrowska');
INSERT INTO Osoba (id_osoby, imie, nazwisko) VALUES (9, 'Lukasz', 'Zielinski');
INSERT INTO Osoba (id_osoby, imie, nazwisko) VALUES (10, 'Aleksandra', 'Szymanska');

-- Table: Klient
INSERT INTO Klient (id_klienta, nr_pesel, nr_dowodu_osobistego, id_adresu) VALUES (1, '90010112345', 'ABC123456', 1);
INSERT INTO Klient (id_klienta, nr_pesel, nr_dowodu_osobistego, id_adresu) VALUES (2, '85051567890', 'DEF987654', 2);
INSERT INTO Klient (id_klienta, nr_pesel, nr_dowodu_osobistego, id_adresu) VALUES (3, '92030354321', 'GHI456789', 3);
INSERT INTO Klient (id_klienta, nr_pesel, nr_dowodu_osobistego, id_adresu) VALUES (4, '87070711223', 'JKL654321', 4);
INSERT INTO Klient (id_klienta, nr_pesel, nr_dowodu_osobistego, id_adresu) VALUES (5, '95021234567', 'MNO321654', 5);

-- Table: Pracownik
INSERT INTO Pracownik (id_pracownika, data_zatrudnienia, id_kierownika) VALUES (6, CONVERT(DATE, '2023-01-01'), NULL);
INSERT INTO Pracownik (id_pracownika, data_zatrudnienia, id_kierownika) VALUES (7, CONVERT(DATE, '2022-06-15'), 6);
INSERT INTO Pracownik (id_pracownika, data_zatrudnienia, id_kierownika) VALUES (8, CONVERT(DATE, '2021-09-30'), 7);
INSERT INTO Pracownik (id_pracownika, data_zatrudnienia, id_kierownika) VALUES (9, CONVERT(DATE, '2022-11-20'), 6);
INSERT INTO Pracownik (id_pracownika, data_zatrudnienia, id_kierownika) VALUES (10, CONVERT(DATE, '2020-04-05'), 8);

-- Table: Forma_kontatku
INSERT INTO Forma_kontatku (id_formy_kontatku, nazwa) VALUES (1, 'Telefon');
INSERT INTO Forma_kontatku (id_formy_kontatku, nazwa) VALUES (2, 'E-mail');
INSERT INTO Forma_kontatku (id_formy_kontatku, nazwa) VALUES (3, 'SMS');
INSERT INTO Forma_kontatku (id_formy_kontatku, nazwa) VALUES (4, 'Chat');
INSERT INTO Forma_kontatku (id_formy_kontatku, nazwa) VALUES (5, 'List');

-- Table: Kontakt
INSERT INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (1, 1, 6, CONVERT(DATETIME, '2024-01-01 10:00:00'), 1);
INSERT INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (2, 2, 6, CONVERT(DATETIME, '2024-02-02 12:30:00'), 3);
INSERT INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (3, 3, 7, CONVERT(DATETIME, '2024-02-03 14:00:00'), 1);
INSERT INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (4, 4, 6, CONVERT(DATETIME, '2024-04-04 15:45:00'), 2);
INSERT INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (5, 5, 10, CONVERT(DATETIME, '2024-01-05 09:15:00'), 1);
INSERT INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (6, 1, 8, CONVERT(DATETIME, '2024-05-06 11:30:00'), 3);
INSERT INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (7, 2, 9, CONVERT(DATETIME, '2024-06-07 13:00:00'), 3);
INSERT INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (8, 3, 9, CONVERT(DATETIME, '2024-01-08 16:30:00'), 2);
INSERT INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (9, 4, 10, CONVERT(DATETIME, '2024-11-09 10:45:00'), 1);
INSERT INTO Kontakt (id_kontatku, id_klienta, id_pracownika, data_kontaktu, id_formy_kontatku) VALUES (10, 5, 8, CONVERT(DATETIME, '2024-08-10 12:00:00'), 1);

-- Table: Numer_telefonu
INSERT INTO Numer_telefonu (nr_telefonu, id_klienta) VALUES ('123456789', 1);
INSERT INTO Numer_telefonu (nr_telefonu, id_klienta) VALUES ('987654321', 2);
INSERT INTO Numer_telefonu (nr_telefonu, id_klienta) VALUES ('123123123', 3);
INSERT INTO Numer_telefonu (nr_telefonu, id_klienta) VALUES ('234234234', 4);
INSERT INTO Numer_telefonu (nr_telefonu, id_klienta) VALUES ('345345345', 5);

-- Table: Pakiet
INSERT INTO Pakiet (id_pakietu, nazwa, cena, liczba_minut, liczba_smsow, ilosc_danych) VALUES (1, 'Pakiet A', 29.99, 100, 50, 5);
INSERT INTO Pakiet (id_pakietu, nazwa, cena, liczba_minut, liczba_smsow, ilosc_danych) VALUES (2, 'Pakiet B', 49.99, 300, 150, 15);
INSERT INTO Pakiet (id_pakietu, nazwa, cena, liczba_minut, liczba_smsow, ilosc_danych) VALUES (3, 'Pakiet C', 69.99, 500, 250, 25);
INSERT INTO Pakiet (id_pakietu, nazwa, cena, liczba_minut, liczba_smsow, ilosc_danych) VALUES (4, 'Pakiet D', 89.99, 1000, 500, 50);
INSERT INTO Pakiet (id_pakietu, nazwa, cena, liczba_minut, liczba_smsow, ilosc_danych) VALUES (5, 'Pakiet E', 109.99, 1500, 1000, 100);

-- Table: Oferta
INSERT INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (1, 1, 1, '123456789');
INSERT INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (2, 2, 2, '987654321');
INSERT INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (3, 3, 2, '123123123');
INSERT INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (4, 4, 3, '234234234');
INSERT INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (5, 5, 1, '345345345');
INSERT INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (6, 6, 1, '123456789');
INSERT INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (7, 7, 3, '987654321');
INSERT INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (8, 8, 2, '123123123');
INSERT INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (9, 9, 3, '234234234');
INSERT INTO Oferta (id_oferty, id_kontatku, id_pakietu, nr_telefonu) VALUES (10, 10, 1, '345345345');

-- Table: Umowa
INSERT INTO Umowa (id_umowy, id_oferty, data_rozpoczecia, data_zakonczenia) VALUES (1, 1, CONVERT(DATE, '2024-01-01'), CONVERT(DATE, '2025-01-01'));
INSERT INTO Umowa (id_umowy, id_oferty, data_rozpoczecia, data_zakonczenia) VALUES (2, 3, CONVERT(DATE, '2024-02-01'), CONVERT(DATE, '2025-02-01'));
INSERT INTO Umowa (id_umowy, id_oferty, data_rozpoczecia, data_zakonczenia) VALUES (3, 5, CONVERT(DATE, '2024-03-01'), CONVERT(DATE, '2025-03-01'));
INSERT INTO Umowa (id_umowy, id_oferty, data_rozpoczecia, data_zakonczenia) VALUES (4, 7, CONVERT(DATE, '2024-04-01'), CONVERT(DATE, '2025-04-01'));
INSERT INTO Umowa (id_umowy, id_oferty, data_rozpoczecia, data_zakonczenia) VALUES (5, 9, CONVERT(DATE, '2024-05-01'), CONVERT(DATE, '2025-05-01'));

-- Table: Zgoda_marketingowa
INSERT INTO Zgoda_marketingowa (id_zgody, nazwa_zgody, opis) VALUES (1, 'Newsletter', 'Zgoda na otrzymywanie newslettera.');
INSERT INTO Zgoda_marketingowa (id_zgody, nazwa_zgody, opis) VALUES (2, 'SMS Marketing', 'Zgoda na otrzymywanie ofert SMS.');
INSERT INTO Zgoda_marketingowa (id_zgody, nazwa_zgody, opis) VALUES (3, 'Telefoniczna oferta', 'Zgoda na kontakt telefoniczny w celach marketingowych.');

-- Table: Zgoda_klient
INSERT INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (1, 1, 1, CONVERT(DATE, '2024-01-01'), CONVERT(DATE, '2024-12-31'));
INSERT INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (2, 1, 2, CONVERT(DATE, '2024-01-01'), CONVERT(DATE, '2024-12-31'));
INSERT INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (3, 2, 2, CONVERT(DATE, '2024-03-01'), CONVERT(DATE, '2025-03-31'));
INSERT INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (4, 3, 1, CONVERT(DATE, '2024-04-01'), CONVERT(DATE, '2025-04-30'));
INSERT INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (5, 4, 2, CONVERT(DATE, '2024-04-01'), CONVERT(DATE, '2025-03-31'));
INSERT INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (6, 4, 3, CONVERT(DATE, '2024-04-01'), CONVERT(DATE, '2025-04-30'));
INSERT INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (7, 5, 1, CONVERT(DATE, '2024-05-01'), CONVERT(DATE, '2025-05-31'));
INSERT INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (8, 5, 2, CONVERT(DATE, '2024-05-01'), CONVERT(DATE, '2025-05-31'));
INSERT INTO Zgoda_klient (id_zgody_klienta, id_klienta, id_zgody, data_rozpoczecia, data_zakonczenia) VALUES (9, 5, 3, CONVERT(DATE, '2024-05-01'), CONVERT(DATE, '2025-05-31'));
