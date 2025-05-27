-- Active: 1745413199417@@127.0.0.1@3306@hotel
drop trigger insert_station;

CREATE TRIGGER insert_station AFTER INSERT ON station
    FOR EACH ROW 
    BEGIN
        DECLARE altitude INT;
        SET altitude = NEW.sta_altitude;
        IF altitude<1000 THEN 
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion altitude !';
        END IF;
    END;


insert into station (sta_nom, sta_altitude) values ('test', 200);