DROP TABLE Zwiazek_Malzenski;
DROP TABLE Osoba;
DROP TABLE Miejscowosc;

CREATE TABLE Miejscowosc (
       Id_Miejscowosci      INTEGER NOT NULL,
       Nazwa                VARCHAR2(80) NULL
);

CREATE UNIQUE INDEX XPKMiejscowosc ON Miejscowosc
(
       Id_Miejscowosci
);


ALTER TABLE Miejscowosc
       ADD  ( PRIMARY KEY (Id_Miejscowosci) ) ;


CREATE TABLE Osoba (
       Pesel                CHAR(11) NOT NULL,
       Imie                 VARCHAR2(30) NULL,
       Nazwisko             VARCHAR2(40) NULL,
       Data_Urodzenia       DATE NULL,
       Miejsce_Urodzenia    INTEGER NULL,
       Data_Zgonu           DATE NULL,
       Matka                CHAR(11) NULL,
       Ojciec               CHAR(11) NULL,
       Plec                 VARCHAR2(20) NULL
);

CREATE UNIQUE INDEX XPKOsoba ON Osoba
(
       Pesel
);


ALTER TABLE Osoba
       ADD  ( PRIMARY KEY (Pesel) ) ;


CREATE TABLE Zwiazek_Malzenski (
       Id_Zwiazku           INTEGER NOT NULL,
       Id_Miejscowosci      INTEGER NULL,
       Data_Zawarcia_Zwiazku DATE NOT NULL,
       Data_Wygasniecia_Zwiazku DATE NULL,
       Powod_Wygasniecia_Zwiazku VARCHAR2(80) NULL,
       Maz                  CHAR(11) NULL,
       Zona                 CHAR(11) NULL
);

CREATE UNIQUE INDEX XPKZwiazek_Malzenski ON Zwiazek_Malzenski
(
       Id_Zwiazku
);


ALTER TABLE Zwiazek_Malzenski
       ADD  ( PRIMARY KEY (Id_Zwiazku) ) ;


ALTER TABLE Osoba
       ADD  ( FOREIGN KEY (Ojciec)
                             REFERENCES Osoba ) ;


ALTER TABLE Osoba
       ADD  ( FOREIGN KEY (Matka)
                             REFERENCES Osoba ) ;


ALTER TABLE Osoba
       ADD  ( FOREIGN KEY (Miejsce_Urodzenia)
                             REFERENCES Miejscowosc ) ;


ALTER TABLE Zwiazek_Malzenski
       ADD  ( FOREIGN KEY (Id_Miejscowosci)
                             REFERENCES Miejscowosc ) ;


ALTER TABLE Zwiazek_Malzenski
       ADD  ( FOREIGN KEY (Maz)
                             REFERENCES Osoba ) ;


ALTER TABLE Zwiazek_Malzenski
       ADD  ( FOREIGN KEY (Zona)
                             REFERENCES Osoba ) ;

Insert into Miejscowosc values(1, 'Warszawa');
Insert into Miejscowosc values(2, 'Otwock');
Insert into Miejscowosc values(3, 'Lublin');
Insert into Miejscowosc values(4, 'Krakow');
Insert into Miejscowosc values(5, 'Wegrow');
Insert into Miejscowosc values(6, 'Mokobody');
Insert into Miejscowosc values(7, 'Czaple');
Insert into Miejscowosc values(8, 'Malbork');
Insert into Miejscowosc values(9, 'Sulejowek');

Insert into Osoba values('12345678901', 'Wanda', 'Zielonogorska', TO_DATE('20-05-1918', 'DD-MM-YYYY'), 5, TO_DATE('16-11-1994', 'DD-MM-YYYY'), null, null,'K');
Insert into Osoba values('12345678902', 'Jan', 'Zielonogorski', TO_DATE('18-04-1911', 'DD-MM-YYYY'), 5, TO_DATE('25-09-1995', 'DD-MM-YYYY'), null, null,'M');
Insert into Osoba values('12345678903', 'Anna', 'Chelmska', TO_DATE('18-01-1950', 'DD-MM-YYYY'), 5, null,'12345678901', '12345678902','K');
Insert into Osoba values('12345678904', 'Jozef', 'Chelmski', TO_DATE('19-03-1944', 'DD-MM-YYYY'), 5, null, null, null,'M');
Insert into Osoba values('12345678905', 'Agnieszka', 'Chelmska-Krakowska', TO_DATE('23-01-1973', 'DD-MM-YYYY'), 2,null, '12345678903', '12345678904','K');
Insert into Osoba values('12345678906', 'Justyna', 'Chelmska-Kaliska', TO_DATE('19-08-1980', 'DD-MM-YYYY'), 1, null, '12345678903', '12345678904','K');
Insert into Osoba values('12345678907', 'Kazimierz', 'Zielonogorski', TO_DATE('21-12-1955', 'DD-MM-YYYY'), 5, null,'12345678901', '12345678902','M');
Insert into Osoba values('12345678908', 'Stanislaw', 'Zielonogorski', TO_DATE('21-12-1941', 'DD-MM-YYYY'), 5, null,'12345678901', '12345678902','M');
Insert into Osoba values('12345678909', 'Barbara', 'Zielonogorska', TO_DATE('21-04-1955', 'DD-MM-YYYY'), 6, null,null, null, 'K');
Insert into Osoba values('12345678910', 'Jadwiga', 'Zielonogorska', TO_DATE('11-11-1944', 'DD-MM-YYYY'), 7, null,null, null, 'K');
Insert into Osoba values('12345678911', 'Krzysztof', 'Krakowski', TO_DATE('30-06-1969', 'DD-MM-YYYY'), 3, null,null, null, 'M');
Insert into Osoba values('12345678912', 'Andrzej', 'Kaliski', TO_DATE('31-07-1981', 'DD-MM-YYYY'), 8, null,null, null, 'M');

Drop Sequence Seq_Zwiazek;
Create Sequence Seq_Zwiazek;

Insert into Zwiazek_malzenski values(SEQ_Zwiazek.nextval, 5, TO_DATE('12-04-1939', 'DD-MM-YYYY'),TO_DATE('16-11-1994', 'DD-MM-YYYY'),'Zgon','12345678902','12345678901');
Insert into Zwiazek_malzenski values(SEQ_Zwiazek.nextval, 5, TO_DATE('12-04-1971', 'DD-MM-YYYY'),NULL,NULL,'12345678904','12345678903');
Insert into Zwiazek_malzenski values(SEQ_Zwiazek.nextval, 5,TO_DATE('23-02-1970', 'DD-MM-YYYY'),NULL,NULL,'12345678908','12345678910');
Insert into Zwiazek_malzenski values(SEQ_Zwiazek.nextval, 5,TO_DATE('20-01-1979', 'DD-MM-YYYY'),NULL,NULL,'12345678907','12345678909');
Insert into Zwiazek_malzenski values(SEQ_Zwiazek.nextval, 9,TO_DATE('21-04-2007', 'DD-MM-YYYY'),NULL,NULL,'12345678911','12345678905');
Insert into Zwiazek_malzenski values(SEQ_Zwiazek.nextval, 9,TO_DATE('21-02-2009', 'DD-MM-YYYY'),NULL,NULL,'12345678912','12345678906');

commit;
