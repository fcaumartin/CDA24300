-- Active: 1745413199417@@127.0.0.1@3306@papyrus
drop table article_commande;
create table article_commande (
    codart CHAR(4),
    qte int,
    `date` date
);

drop trigger trigger1;

CREATE TRIGGER trigger1 AFTER UPDATE ON produit
    FOR EACH ROW
    BEGIN
        DECLARE c_a char(4);
        DECLARE s_a int;
        DECLARE s_p int;
        DECLARE encours int;
        SET c_a = OLD.codart;
        SET s_p = NEW.stkphy;
        SET s_a = (select stkale from produit where codart=c_a);
        SET encours = (select sum(qte) from article_commande where codart=c_a);
        IF encours is null THEN
            SET encours=0;
        END IF;
        IF s_p<s_a THEN
            insert into article_commande (codart, qte, `date`) 
            values (c_a, (s_a-s_p)-(encours), NOW());
        END IF;
    END;


update produit set stkphy=10 where codart='B001';


select * from article_commande;