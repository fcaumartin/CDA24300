-- Active: 1745413199417@@127.0.0.1@3306@cp
drop trigger maj_total;
drop trigger maj_total2;
drop trigger maj_total3;

CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; 
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=tot-(tot*(remise/100)) WHERE id=id_c; 
    END;

CREATE TRIGGER maj_total2 AFTER UPDATE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; 
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=tot-(tot*(remise/100)) WHERE id=id_c; 
    END;

    CREATE TRIGGER maj_total3 AFTER DELETE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = OLD.id_commande; 
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=tot-(tot*(remise/100)) WHERE id=id_c; 
    END;


select * from lignedecommande where id_commande=3;
select * from commande where id=3;
insert into lignedecommande 
    (id_commande, id_produit, quantite, prix)
values (3, 3, 1, 10);