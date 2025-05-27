create view vue1
as
select e.*, l.derliv, l.codart, l.qtecde, l.priuni
from entcom e
join ligcom l on e.numcom=l.numcom; 


drop view vue1;

select qtecde, codart, priuni from vue1 where qtecde>1000;