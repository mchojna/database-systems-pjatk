DROP TABLE Zwiazek_Malzenski;
DROP TABLE Osoba;
DROP TABLE Miejscowosc;

CREATE TABLE Miejscowosc (
       Id_Miejscowosci      INT PRIMARY KEY,
       Nazwa                VARCHAR(80) NULL
);

CREATE TABLE Osoba (
       Pesel                CHAR(11) PRIMARY KEY,
       Imie                 VARCHAR(30) NULL,
       Nazwisko             VARCHAR(40) NULL,
       Data_Urodzenia       DATETIME NULL,
       Miejsce_Urodzenia    INT NULL REFERENCES Miejscowosc,
       Data_Zgonu           DATETIME NULL,
       Matka                CHAR(11) NULL REFERENCES Osoba,
       Ojciec               CHAR(11) NULL REFERENCES Osoba,
       Plec                 VARCHAR(20) NULL
);

CREATE TABLE Zwiazek_Malzenski (
       Id_Zwiazku           INT PRIMARY KEY,
       Id_Miejscowosci      INT NULL REFERENCES Miejscowosc,
       Data_Zawarcia_Zwiazku DATETIME NOT NULL,
       Data_Wygasniecia_Zwiazku DATETIME NULL,
       Powod_Wygasniecia_Zwiazku VARCHAR(80) NULL,
       Maz                  CHAR(11) NULL REFERENCES Osoba,
       Zona                 CHAR(11) NULL REFERENCES Osoba
);



Insert into Miejscowosc values(1, 'Warszawa');
Insert into Miejscowosc values(2, 'Otwock');
Insert into Miejscowosc values(3, 'Lublin');
Insert into Miejscowosc values(4, 'Krakw');
Insert into Miejscowosc values(5, 'Wegrow');
Insert into Miejscowosc values(6, 'Mokobody');
Insert into Miejscowosc values(7, 'Czaple');

Insert into Osoba values('12345678901', 'Wanda', 'Zielonogorska', '20-MAY-18', 5, null, null, null,'K');
Insert into Osoba values('12345678902', 'Jan', 'Zielonogorski', '18-APR-11', 5, null, null, null,'M');
Insert into Osoba values('12345678903', 'Anna', 'Chemska', '18-JAN-50', 5, null,'12345678901', '12345678902','K');
Insert into Osoba values('12345678904', 'Jzef', 'Chemski', '19-MAR-44', 5, null, null, null,'M');
Insert into Osoba values('12345678905', 'Agnieszka', 'Chemska', '23-JAN-73', 2,null, '12345678903', '12345678904','K');
Insert into Osoba values('12345678906', 'Justyna', 'Chemska', '19-SEP-80', 1, null, '12345678903', '12345678904','K');
Insert into Osoba values('12345678907', 'Kazimierz', 'Zielonogorski', '21-DEC-55', 5, null,'12345678901', '12345678902','M');
Insert into Osoba values('12345678908', 'Stanisaw', 'Zielonogorski', '21-DEC-41', 5, null,'12345678901', '12345678902','M');
Insert into Osoba values('12345678909', 'Barbara', 'Zielonogorska', '21-APR-55', 6, null,null, null, 'K');
Insert into Osoba values('12345678910', 'Jadwiga', 'Zielonogorska', '11-NOV-44', 7, null,null, null, 'K');
Insert into Osoba values('12345678911', 'Marian', 'Jablonowski', '24-NOV-77', 3, null,null, null, 'M');


Insert into Zwiazek_malzenski values(1, 5, '12-APR-71',NULL,NULL,'12345678904','12345678903');
Insert into Zwiazek_malzenski values(2, 5,'23-FEB-70',NULL,NULL,'12345678908','12345678910');
Insert into Zwiazek_malzenski values(3, 5,'20-JUN-79',NULL,NULL,'12345678907','12345678909');
Insert into Zwiazek_malzenski values(4, 1,'25-DEC-03',NULL,NULL,'12345678905','12345678911');

