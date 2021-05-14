use Treatre_db; 
delimiter $$
drop procedure if exists tickets$$ 
create procedure tickets()
begin
select Постановка.Назва, count(Каса.idВистави)as 'К-ть проданих квтиків',
Вистави.Дата from Каса, Вистави, Постановка 
where Вистави.idВистави=Каса.idВистави and Вистави.idПостановка=Постановка.idПостановка
group by Каса.idВистави; 
end$$
#call tickets();

drop procedure if exists tickets_performance$$ 
create procedure tickets_performance(in t text) 
begin
select t as 'Назва', count(Каса.idВистави) as 'К-ть проданих квтиків', Вистави.Дата 
from Каса, Вистави, Постановка where Постановка.Назва=t
and Постановка.idПостановка=Вистави.idПостановка and Вистави.idВистави=Каса.idВистави 
group by Каса.idВистави; 
end$$
#call tickets_performance('Корсиканка');

drop procedure if exists tickets_period$$
create procedure tickets_period(in b date, in e date) 
begin
select Постановка.Назва, count(Каса.idВистави) as 'К-ть проданих квтиків',
Вистави.Дата as 'Дата вистави' from Постановка, Каса, Вистави 
where Каса.Дата between b and e and Постановка.idПостановка=Вистави.idПостановка 
and Вистави.idВистави=Каса.idВистави
group by Каса.idВистави;
end$$
#call tickets_period('2020-06-02', '2020-06-03'); 
#Task11----------------------------------------------