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

Drop Sequence Seq_Miejscowosc;
Create Sequence Seq_Miejscowosc;
Insert into Miejscowosc values(Seq_Miejscowosc.NextVal, 'Warszawa');
Insert into Miejscowosc values(Seq_Miejscowosc.NextVal, 'Otwock');
Insert into Miejscowosc values(Seq_Miejscowosc.NextVal, 'Lublin');
Insert into Miejscowosc values(Seq_Miejscowosc.NextVal, 'Krakow');
Insert into Miejscowosc values(Seq_Miejscowosc.NextVal, 'Wegrow');
Insert into Miejscowosc values(Seq_Miejscowosc.NextVal, 'Mokobody');
Insert into Miejscowosc values(Seq_Miejscowosc.NextVal, 'Czaple');

select * from Osoba;
Insert into Osoba values('12345678901', 'Wanda', 'Zielonogorska', to_date('20-05-1918', 'DD-MM-YY'), 5, null, null, null,'K');
Insert into Osoba values('12345678902', 'Jan', 'Zielonogorski', to_date('18-04-1911', 'DD-MM-YY'), 5, null, null, null,'M');
Insert into Osoba values('12345678903', 'Anna', 'CheLmska', to_date('18-01-1950', 'DD-MM-YY'), 5, null,'12345678901', '12345678902','K');
Insert into Osoba values('12345678904', 'JOzef', 'CheLmski', to_date('19-03-1944', 'DD-MM-YY'), 5, null, null, null,'M');
Insert into Osoba values('12345678905', 'Agnieszka', 'CheLmska', to_date('23-01-1973', 'DD-MM-YY'), 2,null, '12345678903', '12345678904','K');
Insert into Osoba values('12345678906', 'Justyna', 'Chelmska', to_date('19-08-1980', 'DD-MM-YY'), 1, null, '12345678903', '12345678904','K');
Insert into Osoba values('12345678907', 'Kazimierz', 'Zielonogorski', to_date('21-12-55', 'DD-MM-YY'), 5, null,'12345678901', '12345678902','M');
Insert into Osoba values('12345678908', 'Stanislaw', 'Zielonogorski', to_date('21-12-1941', 'DD-MM-YY'), 5, null,'12345678901', '12345678902','M');
Insert into Osoba values('12345678909', 'Barbara', 'Zielonogorska', to_date('21-04-1955', 'DD-MM-YY'), 6, null,null, null, 'K');
Insert into Osoba values('12345678910', 'Jadwiga', 'Zielonogorska', to_date('11-11-1944', 'DD-MM-YY'), 7, null,null, null, 'K');
Insert into Osoba values('12345678911', 'Marian', 'Jablonowski', to_date('24-11-1977', 'DD-MM-YY'), 3, null,null, null, 'M');

Drop Sequence Seq_Zwiazek;
Create Sequence Seq_Zwiazek;
Insert into Zwiazek_malzenski values(SEQ_Zwiazek.nextval, 5, to_date('12-04-1971', 'DD-MM-YY'),NULL,NULL,'12345678904','12345678903');
Insert into Zwiazek_malzenski values(SEQ_Zwiazek.nextval, 5,to_date('23-02-1970', 'DD-MM-YY'),NULL,NULL,'12345678908','12345678910');
Insert into Zwiazek_malzenski values(SEQ_Zwiazek.nextval, 5,to_date('20-01-1979', 'DD-MM-YY'),NULL,NULL,'12345678907','12345678909');
Insert into Zwiazek_malzenski values(SEQ_Zwiazek.nextval, 1,to_date('25-12-1903', 'DD-MM-YY'),NULL,NULL,'12345678905','12345678911');

commit;