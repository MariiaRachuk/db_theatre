use Treatre_db;
delimiter $$

drop procedure if exists performance$$ 
create procedure performance() begin
declare c int default 0;
select count(idПостановка) into c from Постановка;
select Назва from Постановка 
union select concat('Разом:', convert(c, char));
end$$
#call performance();

drop procedure if exists season$$
create procedure season(in t text) begin
declare c int default 0;
select count(idВистави) into c from Вистави where Вистави.Сезон=t and (to_days(now())-to_days(Вистави.Дата)) >=0;
select Постановка.Назва , Вистави.Дата from Постановка, Вистави 
where Вистави.Сезон=t and Постановка.idПостановка=Вистави.idПостановка and to_days(now())- to_days(Вистави.Дата) >=0
union select 'Разом:', c; 
end$$
#call season('Осінь');

drop procedure if exists played$$ 
create procedure played()
begin
declare c int default 0;
select count(idВистави) into c from Вистави where to_days(now())-to_days(Вистави.Дата) >=0;
select Постановка.Назва , Вистави.Дата from Постановка, Вистави
where Постановка.idПостановка=Вистави.idПостановка and to_days(now())- to_days(Вистави.Дата) >=0
union select 'Разом:', c;
end$$
#call played();

drop procedure if exists genre$$ 
create procedure genre(in t text) 
begin
declare c int default 0;
select count(Постановка.idПостановка) into c from Постановка, Вистави
where Постановка.idПостановка=Вистави.idПостановка and Постановка.Жанр=t and to_days(now())-to_days(Вистави.Дата) >=0;
select Назва from Постановка, Вистави 
where Постановка.idПостановка=Вистави.idПостановка and Постановка.Жанр=t and to_days(now())-to_days(Вистави.Дата) >=0
union select concat('Разом:', convert(c,char)); end$$
call genre('Трагедія');

drop procedure if exists played_period$$
create procedure played_period(in b date, in e date) 
begin
declare c int default 0;
select count(idВистави) into c from Вистави where Дата between b and e; 
select Постановка.Назва, Вистави.Дата from Постановка, Вистави
where Вистави.Дата between b and e and Постановка.idПостановка=Вистави.idПостановка
union select 'Разом:', c;
end$$
call played_period('2020.06.01', '2021.06.06'); 
#Task2------------------------------------------------------------
