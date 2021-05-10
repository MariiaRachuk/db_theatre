use mydb; 
delimiter $$
drop procedure if exists performance$$ 
create procedure performance(in t text) 
begin
select Постановка.Назва , Вистави.Дата from Постановка, Вистави 
where Вистави.Сезон=t and Постановка.idПостановка=Вистави.idПостановка;
end$$
#call performance('Літо');

drop procedure if exists played$$ 
create procedure played()
begin
select Постановка.Назва , Вистави.Дата from Постановка, Вистави 
where Постановка.idПостановка=Вистави.idПостановка and to_days(now())-to_days(Вистави.Дата) >=0; 
end$$
#call played();

drop procedure if exists genre$$ 
create procedure genre(in t text) 
begin
select Назва from Постановка, Вистави 
where Постановка.idПостановка=Вистави.idПостановка and Постановка.Жанр=t
and to_days(now())-to_days(Вистави.Дата) >=0;
end$$
#call genre('Комедія');

drop procedure if exists played_period$$
create procedure played_period(in b date, in e date) 
begin
select Постановка.Назва, Вистави.Дата from Постановка, Вистави 
where Вистави.Дата between b and e and Постановка.idПостановка=Вистави.idПостановка;
end$$
#call played_period('2000.06.01', '2020.06.06'); 
#Task2------------------------------------------------------------
