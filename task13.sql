use Treatre_db; 
delimiter $$
drop procedure if exists place$$ 
create procedure place()
begin
declare t int default 0;
select idВистави into t from Вистави order by idВистави desc limit 1; 
select Постановка.Назва as 'Назва', (10 - count(Каса.idВистави)) as 'Кількість вільних місць', Вистави.Дата as 'Дата'
from Каса,Вистави, Постановка 
where Постановка.idПостановка=Вистави.idПостановка and Вистави.idВистави=Каса.idВистави
group by Каса.idВистави union
select 'Усього:' , (t*10-count(idКаса)),'' from Каса; 
end$$
#call place();

drop procedure if exists place_performance$$ 
create procedure place_performance(in t text) 
begin
select t as 'Назва', (10 - count(Каса.idВистави)) as 'Кількість вільних місць',
Вистави.Дата from Каса,Вистави, Постановка 
where Постановка.Назва=t
and Постановка.idПостановка=Вистави.idПостановка and Вистави.idВистави=Каса.idВистави
group by Каса.idВистави;
end$$
#call place_performance('Корсиканка');

#Task13--------