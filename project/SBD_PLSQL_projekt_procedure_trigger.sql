SET SERVEROUTPUT ON

-- 1. PROCEDURA: GENEROWANIE RAPORTU ZGOD MARKETINGOWYCH
CREATE OR REPLACE PROCEDURE RAPORT_ZGOD_MARKETINGOWYCH AS
    v_aktywnych NUMBER;
    v_nieaktywnych NUMBER;
BEGIN
    SELECT COUNT(*) 
    INTO v_aktywnych
    FROM Zgoda_klient
    WHERE data_zakonczenia > SYSDATE;

    SELECT COUNT(*) 
    INTO v_nieaktywnych
    FROM Zgoda_klient
    WHERE data_zakonczenia <= SYSDATE;

    DBMS_OUTPUT.PUT_LINE('AKTYWNE UMOWY: ' || v_aktywnych);
    DBMS_OUTPUT.PUT_LINE('NIEAKTYWNE UMOWY: ' || v_nieaktywnych);
END;

-- 2. PROCEDURE: LICZENIE AKTYWNYCH UMOW KLIENTOW
CREATE OR REPLACE PROCEDURE LICZBA_AKTYWNYCH_UMOW AS
    CURSOR UMOWY_CURSOR IS
        SELECT KL.ID_KLIENTA, COUNT(*) AS LICZBA_AKTYWNYCH_UMOW
        FROM UMOWA UM
        INNER JOIN OFERTA OE ON OE.ID_OFERTY = UM.ID_OFERTY
        INNER JOIN NUMER_TELEFONU NT ON NT.NR_TELEFONU = OE.NR_TELEFONU
        INNER JOIN KLIENT KL ON KL.ID_KLIENTA = NT.ID_KLIENTA
        WHERE UM.DATA_ZAKONCZENIA > SYSDATE
        GROUP BY KL.ID_KLIENTA
        ORDER BY KL.ID_KLIENTA ASC;

    v_id_klienta KLIENT.ID_KLIENTA%TYPE;
    v_liczba_umow NUMBER;
BEGIN
    OPEN UMOWY_CURSOR;

    LOOP
        FETCH UMOWY_CURSOR INTO v_id_klienta, v_liczba_umow;

        EXIT WHEN UMOWY_CURSOR%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('KLIENT ' || v_id_klienta || ' MA ' || v_liczba_umow || ' AKTYWNYCH UMOW');
    END LOOP;

    CLOSE UMOWY_CURSOR;
END;

-- 3. PROCEDURA: ZAKTUALIZOWANIE NR DOWODU OSOBISTEGO KLIENTA
CREATE OR REPLACE PROCEDURE AKTUALIZUJ_NR_DOWODU_KLIENTA(
    p_id_klienta IN KLIENT.ID_KLIENTA%TYPE,
    p_nowy_nr_dowodu IN VARCHAR2
) IS
BEGIN
    UPDATE KLIENT
    SET NR_DOWODU_OSOBISTEGO = p_nowy_nr_dowodu
    WHERE ID_KLIENTA = p_id_klienta;
END;

-- 1. WYZWALACZ: POWIADOMIENIE O PRZEKROCZENIU MAKSYMALNEJ CENY PAKIETU
CREATE OR REPLACE TRIGGER POWIADOMIENIE_O_PRZEKROCZENIU_CENY
BEFORE INSERT ON PAKIET
FOR EACH ROW
BEGIN
    IF :NEW.CENA > 1000 THEN
        RAISE_APPLICATION_ERROR(-20001, 'CENA PAKIETU NIE MOZE PRZEKRACZAC 1000 ID: ' || :NEW.ID_PAKIETU);
    END IF;
END POWIADOMIENIE_O_PRZEKROCZENIU_CENY;


-- 2. WYZWALACZ: ZAPOBIEGANIE USUWANIU KLIENTOW Z AKTYWNYMI UMOWAMI
CREATE OR REPLACE TRIGGER ZAPOBIEGANIE_USUWANIU_KLIENTA
BEFORE DELETE ON KLIENT
FOR EACH ROW
DECLARE
    v_aktywne_umowy NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_aktywne_umowy
    FROM UMOWA UM
    INNER JOIN OFERTA OE ON OE.ID_OFERTY = UM.ID_OFERTY
    INNER JOIN NUMER_TELEFONU NT ON NT.NR_TELEFONU = OE.NR_TELEFONU
    INNER JOIN KLIENT KL ON KL.ID_KLIENTA = NT.ID_KLIENTA
    WHERE KL.ID_KLIENTA = :OLD.ID_KLIENTA AND UM.DATA_ZAKONCZENIA > SYSDATE;

    IF v_aktywne_umowy > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'KLIENT ' || :OLD.ID_KLIENTA || ' MA AKTYWNE UMOWY');
    END IF;
END;

-- 3. WYZWALACZ: AUTOMATYCZNE UZUPELNIENIE DATY ZATRUDNIENIA PRACOWNIKA
CREATE OR REPLACE TRIGGER UZUPELNIENIE_DATY_ZATRUDNIENIA
BEFORE INSERT ON PRACOWNIK
FOR EACH ROW
BEGIN
    IF :NEW.DATA_ZATRUDNIENIA IS NULL THEN
        :NEW.DATA_ZATRUDNIENIA := SYSDATE;
    END IF;
END;
