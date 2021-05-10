use mydb; 
delimiter $$

drop procedure if exists author$$ 
create procedure author()
begin
select Імя from Автор; 
end$$
#call author();

drop procedure if exists author_century$$ 
create procedure author_century(in n int) 
begin
select Імя from Автор where Століття = n; 
end$$
#call author_century(19);

drop procedure if exists country$$ 
create procedure country(in t text) 
begin
select Імя from Автор where Країна=t; 
end$$
#call country('Україна');

drop procedure if exists author_genre$$ 
create procedure author_genre(in t text) 
begin
select DISTINCT Автор.Імя from Автор, Постановка 
where Постановка.idАвтор=Автор.idАвтор and Постановка.Жанр = t; 
end$$
#call author_genre('Комедія');

drop procedure if exists author_genre_played$$ 
create procedure author_genre_played(in t text) 
begin
select DISTINCT Автор.Імя from Автор, Постановка, Вистави 
where Постановка.idАвтор=Автор.idАвтор and Постановка.Жанр = t and Постановка.idПостановка=Вистави.idПостановка 
and to_days(now())- to_days(Вистави.Дата) >=0;
end$$
#call author_genre_played('Комедія');

drop procedure if exists author_period$$ 
create procedure author_period( in b date, in e date) begin
select DISTINCT Автор.Імя from Автор, Постановка, Вистави 
where Постановка.idАвтор=Автор.idАвтор and Постановка.idПостановка=Вистави.idПостановка and Вистави.Дата between b and e;
end$$
call author_period('2000.05.07','2020.06.06'); 
#Task4-----------------------------------------------------------
