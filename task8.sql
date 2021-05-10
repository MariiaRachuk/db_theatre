use mydb; 
delimiter $$

drop procedure if exists tour_coming$$
create procedure tour_coming(in b date, in e date) 
begin
select Персонал.ПІБ, "Актор" from Персонал, Актор , Гастролі 
where Гастролі.idПерсонал=Персонал.idПерсонал and Персонал.idПерсонал=Актор.idПерсонал 
and Початок between b and e and
Кінець between b and e union
select Персонал.ПІБ, "Постановник" from Персонал, Постановник, Гастролі 
where Гастролі.idПерсонал=Персонал.idПерсонал and Персонал.idПерсонал=Постановник.idПерсонал 
and Початок between b and e
and Кінець between b and e;
end$$
#call tour_coming('2020-05-01', '2020-05-020');

drop procedure if exists tour_outcoming$$
create procedure tour_outcoming(in b date, in e date, in t text) 
begin
declare l int default 0;
select idПостановка into l from Постановка 
where Постановка.Назва=t; select distinct(Персонал.ПІБ), Початок, Кінець 
from Персонал, Актор, Гастролі, Постановка 
where Гастролі.idПерсонал=Персонал.idПерсонал and Персонал.idПерсонал=Актор.idПерсонал 
and Гастролі.idПостановка=l and Початок between b and e
and Кінець between b and e;
end$$
#call tour_outcoming('2020-05-01', '2020-05-020', 'Корсиканка'); 
#Task8----------------------------------------------------------------------
