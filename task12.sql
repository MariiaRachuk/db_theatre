use mydb; 
delimiter $$
drop procedure if exists money_for_performance$$ 
create procedure money_for_performance(in t text) 
begin
select Постановка.Назва as 'Назва', count(Каса.idВистави) as 'К-ть проданих квтиків', sum(Каса.Ціна) as 'Виручені кошти', Вистави.Дата 
from Постановка, Вистави, Каса where Постановка.Назва =t
and Постановка.idПостановка=Вистави.idПостановка and Вистави.idВистави=Каса.idВистави 
group by Каса.idВистави union
select 'Усього:', count(Каса.idВистави) as 'К-ть проданих квтиків', sum(Каса.Ціна) , '' from Постановка, Вистави, Каса 
where Постановка.Назва = t and Постановка.idПостановка=Вистави.idПостановка and Вистави.idВистави=Каса.idВистави;
end$$
#call money_for_performance('Корсиканка');

drop procedure if exists money_for_period$$
create procedure money_for_period(in b date, in e date) 
begin
select Постановка.Назва, sum(Каса.Ціна) as 'Виручені кошти' , Вистави.Дата from Каса, Вистави, Постановка 
where Каса.Дата between b
and e and Постановка.idПостановка=Вистави.idПостановка and Вистави.idВистави=Каса.idВистави
group by Каса.idВистави union
select 'Усього:', sum(Каса.Ціна) as 'Виручені кошти', ' ' from Каса 
where Каса.Дата between b and e;
end$$
#call money_for_period('2020-06-02', '2020-06-03');# do 2020-08-03 
#Task12---------------------------------------------------------------