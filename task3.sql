use mydb; 
delimiter $$
drop procedure if exists played_genre$$ 
create procedure played_genre(in t text) 
begin
select Постановка.Назва , Вистави.Дата from Постановка, Вистави where
Постановка.idПостановка=Вистави.idПостановка and Постановка.Жанр=t
and to_days(now())-to_days(Вистави.Дата) >=0; end$$
#call played_genre('Комедія');

drop procedure if exists played_period_genre$$
create procedure played_period_genre(in b date, in e date, in t text ) 
begin
select Постановка.Назва, Вистави.Дата from Постановка, Вистави 
where Вистави.Дата between b and e and Постановка.idПостановка=Вистави.idПостановка and Постановка.Жанр=t;
end$$
call played_period_genre('2000.05.08', '2020.06.01', 'Комедія');

#Task3-----------------------------------------------------------------------------
