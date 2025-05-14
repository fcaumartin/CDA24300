select *
from entcom
join fournis on entcom.numfou=fournis.numfou;


-- Quelles sont les commandes du fournisseur 09120
select *
from entcom
where numfou=9120;


-- Afficher le code des fournisseurs pour lesquels des commandes ont été passées
select distinct numfou
from entcom;

-- Afficher le nombre de commandes fournisseurs passées, et le nombre de fournisseur concernés
select count(*) 'commandes', count(distinct numfou) as 'fournisseurs' 
from entcom;

-- Editer les produits ayant un stock inférieur ou égal au stock d'alerte et dont la quantité annuelle est inférieure à 1000
select *
from produit
where stkphy <= stkale and qteann<1000;

-- Quels sont les fournisseurs situés dans les départements 75 78 92 77
select *
from fournis
where posfou like '92%' or posfou like '75%' or posfou like '77%' or posfou like '78%';

select * 
from fournis
where SUBSTR(posfou, 1, 2) in ('92', '77', '75', '78');


-- Quelles sont les commandes passées au mois de mars et avril 
select *
from entcom
where MONTH(datcom) BETWEEN 3 and 4;


-- Quelles sont les commandes du jour qui ont des observations particulières ?
select * 
from entcom
where obscom != '' and datcom=NOW()
;

select * 
from entcom
where obscom != '' 
  and 
DAY(datcom)=DAY(NOW()) 
  AND
MONTH(datcom)=MONTH(NOW()) 
  AND
YEAR(datcom)=YEAR(NOW())
;


select * 
from entcom
where obscom != '' 
  and 
CAST(datcom AS date)=CAST(NOW() AS date);

select * 
from entcom
where obscom != '' 
  and 
DATE(datcom)=DATE(NOW());



select NOW();



select * 
from entcom
where obscom is not null;

select * 
from entcom
where obscom is null;

select * 
from entcom
where obscom = '';

-- Lister le total de chaque commande par total décroissant
select numcom, count(*), sum(priuni*qtecde) as 'total'
from ligcom
GROUP BY numcom
ORDER BY 3 DESC;


-- Lister les commandes dont le total est supérieur à 1 000 000€ ; 
-- on exclura dans le calcul du total les articles commandés en quantité supérieure ou égale à 1000
select numcom, count(*), sum(priuni*qtecde) as 'total'
from ligcom
where qtecde<1000
GROUP BY numcom
HAVING sum(priuni*qtecde)> 10000
ORDER BY 3 DESC;



-- Lister les commandes par nom fournisseur
select nomfou, numcom, datcom
from entcom
join fournis on fournis.numfou=entcom.numfou;


--Sortir les produits des commandes ayant le mot "urgent' en observation?
-- (Afficher le numéro de commande, le nom du fournisseur, le libellé du produit et le sous total = quantité commandée * Prix unitaire)
select e.numcom, f.nomfou, p.libart, l.qtecde*l.priuni
from entcom e
join ligcom l on e.numcom=l.numcom
join produit p on p.codart=l.codart
join fournis f on f.numfou=e.numfou
where obscom like '%urgent%';