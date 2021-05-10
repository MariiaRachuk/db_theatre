use mydb; 
delimiter $$

drop procedure if exists performance_genre$$ 
create procedure performance_genre(in t text) 
begin
select Назва from Постановка 
where Постановка.Жанр=t; 
end$$
#call performance_genre('Комедія');

drop procedure if exists performance_author$$ 
create procedure performance_author(in a text) 
begin
select Постановка.Назва from Постановка, Автор 
where Постановка.idАвтор = Автор.idАвтор and Автор.Імя=a;
end$$
#call performance_author('Гоголь');

drop procedure if exists performance_country$$ 
create procedure performance_country(in t text) 
begin
select Постановка.Назва from Постановка, Автор 
where Постановка.idАвтор=Автор.idАвтор and Автор.Країна=t; 
end$$
#call performance_country('Україна');

drop procedure if exists performance_century$$
create procedure performance_century(in n int)
begin
select Назва from Постановка 
where Постановка.РікНаписання between 100*(n-1) and 100*n;
end$$
#call performance_century(20);

drop procedure if exists first_performance$$
create procedure first_performance(in b date, in e date) 
begin
select Назва, Премєра from Постановка 
where Постановка.Премєра between b and e;
end$$

#call first_performance('2016.01.01','2021.01.01'); 
#Task5---------------------------------------------------------
