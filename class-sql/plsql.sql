CREATE TABLE Wlasciciel (
    Wid NUMBER PRIMARY KEY,
    Imie VARCHAR2(50),
    Nazwisko VARCHAR2(50),
    Adres VARCHAR2(100)
);

CREATE TABLE Media (
    Mid NUMBER PRIMARY KEY,
    Rodzaj VARCHAR2(50)
);

CREATE TABLE Oplata (
    Wid NUMBER,
    Mid NUMBER,
    DataOd DATE,
    DataDo DATE,
    DataWplaty DATE,
    Kwota NUMBER(10, 2),
    CONSTRAINT PK_Oplata PRIMARY KEY (Wid, Mid, DataOd),
    CONSTRAINT FK_Oplata_Wlasciciel FOREIGN KEY (Wid) REFERENCES Wlasciciel(Wid),
    CONSTRAINT FK_Oplata_Media FOREIGN KEY (Mid) REFERENCES Media(Mid)
);

-- ZAD1
CREATE OR REPLACE PROCEDURE WstawWlasciciela (v_imie VARCHAR, v_nazwisko VARCHAR, v_adres VARCHAR) AS
v_wid NUMBER;
v_istnieje INTEGER := 0;
BEGIN
    SELECT NVL(MAX(Wid) + 1, 0) INTO v_wid FROM Wlasciciel;
    
    SELECT COUNT(*) INTO v_istnieje FROM Wlasciciel
    WHERE Imie = v_imie AND Nazwisko = v_nazwisko AND Adres = v_adres;
    
    IF v_istnieje = 0 THEN
        INSERT INTO Wlasciciel (Wid, Imie, Nazwisko, Adres)
        VALUES (v_wid, v_imie, v_nazwisko, v_adres);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Osoba o zadanych atrybutach juz istnieje.');
    END IF;
END;

-- ZAD2
CREATE OR REPLACE PROCEDURE PokazOplacaneMedia (v_imie VARCHAR, v_nazwisko VARCHAR, v_adres VARCHAR) AS

CURSOR v_media IS SELECT DISTINCT M.Rodzaj FROM Media M
INNER JOIN Oplata O ON O.Mid = M.Mid
INNER JOIN Wlasciciel W ON O.Wid = W.Wid
WHERE W.Imie = v_imie AND W.Nazwisko = v_nazwisko AND W.Adres = v_adres;

v_ile_po_czasie INTEGER;

CURSOR v_srednia_opoznienia IS SELECT M.Rodzaj, AVG(O.DataWplaty - O.DataDo) Srednia FROM Media M
INNER JOIN Oplata O ON O.Mid = M.Mid
INNER JOIN Wlasciciel W ON O.Wid = W.Wid
WHERE W.Imie = v_imie AND W.Nazwisko = v_nazwisko AND W.Adres = v_adres AND O.DataWplaty > O.DataDo
GROUP BY M.Rodzaj;

v_istnieje INT := 0;
v_po_terminie INT := 0;


BEGIN
    SELECT COUNT(*) INTO v_istnieje FROM Wlasciciel W
    WHERE W.Imie = v_imie AND W.Nazwisko = v_nazwisko AND W.Adres = v_adres; 

    IF v_istnieje <> 0 THEN
        DBMS_OUTPUT.PUT_LINE('Rodzaje mediow: ');
        FOR v_medium IN v_media LOOP
            DBMS_OUTPUT.PUT_LINE('-' || v_medium.Rodzaj);
        END LOOP;
        
        SELECT COUNT(*) INTO v_po_terminie FROM Media M
        INNER JOIN Oplata O ON O.Mid = M.Mid
        INNER JOIN Wlasciciel W ON O.Wid = W.Wid
        WHERE W.Imie = v_imie AND W.Nazwisko = v_nazwisko AND W.Adres = v_adres AND O.DataWplaty > O.DataDo;
        
        IF v_po_terminie = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Osoba o zadanych atrybutach placi wszystkie rachunki w terminie.');
        ELSE
            SELECT COUNT(*) INTO v_ile_po_czasie FROM Media M
            INNER JOIN Oplata O ON O.Mid = M.Mid
            INNER JOIN Wlasciciel W ON O.Wid = W.Wid
            WHERE W.Imie = v_imie AND W.Nazwisko = v_nazwisko AND W.Adres = v_adres AND O.DataWplaty > O.DataDo;
            DBMS_OUTPUT.PUT_LINE('Liczba rachunkow oplaconych po terminie:  ' || v_ile_po_czasie);
    
            FOR v_opoznienie IN v_srednia_opoznienia LOOP
                DBMS_OUTPUT.PUT_LINE('Medium: ' || v_opoznienie.Rodzaj || ' Srednie opoznienie: ' || v_opoznienie.Srednia);
                END LOOP;
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Osoba o zadanych atrybutach nie istnieje.');
    END IF;
END;

-- ZAD3
CREATE OR REPLACE TRIGGER SprawdzDateOdDo 
BEFORE INSERT OR UPDATE
ON Oplata
FOR EACH ROW
BEGIN
    IF :NEW.DataDo < :NEW.DataOd THEN
        RAISE_APPLICATION_ERROR(-20100, 'Data do musi być późniejsza niż data od.');
    END IF;
    
    IF :NEW.DataWplaty < :NEW.DataOd THEN
        RAISE_APPLICATION_ERROR(-20101, 'Data wpłaty musi być późniejsza niż data od.');
    END IF;
END;

-- ZAD4
CREATE OR REPLACE TRIGGER ZaktualizujMedia
AFTER UPDATE
ON Media
FOR EACH ROW
BEGIN
    IF :OLD.Mid <> :NEW.Mid THEN
        UPDATE Oplata 
        SET Mid = :NEW.Mid
        WHERE Mid = :OLD.Mid;
    END IF;
END;
