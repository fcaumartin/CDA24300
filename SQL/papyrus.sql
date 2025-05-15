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



-- Lister le nom des fournisseurs susceptibles de livrer au moins un article
select distinct f.nomfou
from ligcom l
join entcom e on e.numcom=l.numcom
join fournis f on f.numfou=e.numfou
where l.qtecde>l.qteliv;


select nomfou from fournis where numfou in (
  select numfou from entcom where numcom in (
    select numcom from ligcom where qtecde>qteliv
  )
);



-- Lister les commandes (Numéro et date) dont le fournisseur est celui de la commande 70210 
select * from entcom where numfou in (
  select numfou from entcom where numcom=70210
);

select e1.*
from entcom e1
join entcom e2 on e1.numfou=e2.numfou
where e2.numcom=70210;


-- Dans les articles susceptibles d’être vendus, lister les articles moins chers (basés sur Prix1) que le moins cher des rubans (article dont le premier caractère commence par R). On affichera le libellé de l’article et prix1
select p.libart, v.prix1
from vente v
join produit p on v.codart=p.codart
where prix1<=(
  select min(prix1) from vente where codart like 'r%'
);




-- Editer la liste des fournisseurs susceptibles de livrer les produits dont le stock est inférieur ou égal à 150 % du stock d'alerte. La liste est triée par produit puis fournisseur
select p.libart, f.nomfou
from produit p
join ligcom l on l.codart=p.codart
join entcom e on e.numcom=l.numcom
join fournis f on f.numfou=e.numfou
where l.qtecde>l.qteliv and p.stkphy<(p.stkale*1.5)
order by 1 ASC, 2 ASC;



-- Éditer la liste des fournisseurs susceptibles de livrer les produit dont le stock est inférieur ou égal à 150 % du stock d'alerte et un délai de livraison d'au plus 30 jours. La liste est triée par fournisseur puis produit
select p.libart, f.nomfou
from produit p
join ligcom l on l.codart=p.codart
join entcom e on e.numcom=l.numcom
join fournis f on f.numfou=e.numfou
join vente v on v.codart=p.codart and v.numfou=f.numfou
where l.qtecde>l.qteliv and p.stkphy<(p.stkale*1.5) and v.delliv<=30
order by 1 ASC, 2 ASC;



-- Avec le même type de sélection que ci-dessus, sortir un total des stocks par fournisseur trié par total décroissant
select f.nomfou, sum(p.stkphy)
from produit p
join ligcom l on l.codart=p.codart
join entcom e on e.numcom=l.numcom
join fournis f on f.numfou=e.numfou
where l.qtecde>l.qteliv
group by f.nomfou;


-- En fin d'année, sortir la liste des produits dont la quantité réellement commandée dépasse 90% de la quantité annuelle prévue

select p.codart, sum(l.qtecde), p.qteann
from produit p
join ligcom l on l.codart=p.codart
group by p.codart
having sum(l.qtecde)>(p.qteann*0.9);





-- Calculer le chiffre d'affaire par fournisseur pour l'année 93 sachant que les prix indiqués sont hors taxes et que le taux de TVA est 20%.

select f.nomfou, sum(l.qtecde*priuni) * 1.2
from fournis f
join entcom e on e.numfou=f.numfou
join ligcom l on l.numcom=e.numcom
where YEAR(e.datcom)=2020
group by f.nomfou
order by 2 desc;


-- Existe-t-il des lignes de commande non cohérentes avec les produits vendus par les fournisseurs. ?
select e.numfou, l.codart from ligcom l join entcom e on l.numcom=e.numcom
EXCEPT
select numfou, codart from vente;


