DROP TABLE Ksiazki;
DROP TABLE Zakupy;
DROP TABLE Czytelnicy;

CREATE TABLE Ksiazki (Kid int, Tytul varchar2(64), Autor varchar2(64), Dziedzina varchar2(64));
CREATE TABLE Czytelnicy  (Cid int, Imie varchar2(64), Nazwisko varchar2(64), Adres varchar2(64));
CREATE TABLE Zakupy (Kid int, Cid int, Cena number(6,2));

INSERT INTO Ksiazki VALUES(1, 'Programowanie w Javie', 'Gdañski', 'Informatyka');
INSERT INTO Ksiazki VALUES(2, 'SQL w 21 dni', 'Zielonogórski',  'Informatyka');
INSERT INTO Ksiazki VALUES(3, 'Analiza matematyczna w zadaniach', 'Krysicki', 'Matematyka');
INSERT INTO Ksiazki VALUES(4, 'Kolokwium, czyli horror w pigu³ce ', 'Poznañski', 'Literatura obyczajowa');
INSERT INTO Ksiazki VALUES(5, 'Programowanie w jezyku PL/SQL', 'Gdañski',  'Bazy danych');
INSERT INTO Ksiazki VALUES(6, 'Psychologia i zycie', 'Zimbardo',  'Psychologia kliniczna');
INSERT INTO Ksiazki VALUES(7, 'Jak przetrwac zajecia z sieci komputerowych', 'Krakowski',  'Sieci komputerowe');

INSERT INTO Czytelnicy VALUES(1, 'Zofia', 'Abacka', 'Polna 34');
INSERT INTO Czytelnicy VALUES(2, 'Stanis³aw', 'Babacki', 'Leœna 15');
INSERT INTO Czytelnicy VALUES(3, 'Celina', 'Cabacka', 'Borowikowa 2');
INSERT INTO Czytelnicy VALUES(4, 'Dariusz', 'Dabacki', 'Polna 34');

INSERT INTO Zakupy VALUES(1, 1, 23.4);
INSERT INTO Zakupy VALUES(2, 1, 15.6);
INSERT INTO Zakupy VALUES(2, 2, 112.0);
INSERT INTO Zakupy VALUES(1, 3, 78.4);
INSERT INTO Zakupy VALUES(3, 3, 23.8);
INSERT INTO Zakupy VALUES(3, 1, 21.8);
INSERT INTO Zakupy VALUES(4, 1, 98.0);
INSERT INTO Zakupy VALUES(4, 2, 34.2);
INSERT INTO Zakupy VALUES(4, 3, 11.1);
INSERT INTO Zakupy VALUES(5, 1, 32.0);
INSERT INTO Zakupy VALUES(5, 2, 33.2);
INSERT INTO Zakupy VALUES(5, 3, 37.1);
INSERT INTO Zakupy VALUES(6, 1, 67.0);
INSERT INTO Zakupy VALUES(6, 3, 65.1);
INSERT INTO Zakupy VALUES(7, 1, 101.0);

