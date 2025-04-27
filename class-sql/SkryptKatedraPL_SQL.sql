CREATE TABLE Katedra (IdKatedra Int Primary Key,
					Katedra Varchar(64) NOT NULL,
					IdOsoba Int);
ALTER TABLE Katedra ADD CONSTRAINT fk_osoba_katedra
FOREIGN KEY (IdOsoba) References Dydaktyk; /*kierownik katedry*/

ALTER TABLE Katedra ADD Constraint UQ_KatedraName UNIQUE (Katedra);
ALTER TABLE Dydaktyk ADD IdKatedra INT;
ALTER TABLE Dydaktyk ADD Constraint fk_katedra_osoba
Foreign Key (IdKatedra)References Katedra; --zatrudnienie

INSERT INTO Katedra (IdKatedra, Katedra)
SELECT NVL(Max(IdKatedra), 0) + 1, 'Baz danych' FROM Katedra;
INSERT INTO Katedra (IdKatedra, Katedra)
SELECT NVL(Max(IdKatedra), 0) + 1, 'Sztucznej inteligencji' FROM Katedra;
INSERT INTO Katedra (IdKatedra, Katedra)
SELECT NVL(Max(IdKatedra), 0) + 1, 'Inżynierii oprogramowania' FROM Katedra;
INSERT INTO Katedra (IdKatedra, Katedra)
SELECT NVL(Max(IdKatedra), 0) + 1, 'Multimediów' FROM Katedra;

UPDATE Katedra SET IdOsoba =
	(SELECT IdOsoba
	FROM Osoba
	WHERE Nazwisko = 'Dynia' AND Imie = 'Domicella')
WHERE Katedra = 'Baz danych';

UPDATE Katedra SET IdOsoba =
	(SELECT IdOsoba
	FROM Osoba
	WHERE Nazwisko = 'Agrest' AND Imie = 'Archibald')
WHERE Katedra = 'Inżynierii oprogramowania';
