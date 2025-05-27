

CREATE PROCEDURE listeCommande()
BEGIN
    SELECT * FROM entcom;
END;

CALL listeCommande();
