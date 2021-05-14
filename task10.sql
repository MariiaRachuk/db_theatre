use Treatre_db; 
delimiter $$

drop procedure if exists role_actor$$ 
create procedure role_actor(in t text) 
begin
declare r, k int default 0;
select idПерсонал into r from Персонал where ПІБ=t;
select idАктор into k from Актор where Актор.idПерсонал=r; 
select Роль.Імя as 'Роль' from ЗіграніРолі, Роль 
where ЗіграніРолі.idАктор=k and ЗіграніРолі.idРоль=Роль.idРоль; 
end$$
#call role_actor('Иванова В.Є.');

drop procedure if exists role_period$$
create procedure role_period(in t text, in b date, in e date) 
begin
declare r, k int default 0;
select idПерсонал into r from Персонал where ПІБ=t;
select idАктор into k from Актор where Актор.idПерсонал=r; 
select Роль.Імя as 'Роль' from ЗіграніРолі, Роль , Вистави where
ЗіграніРолі.idАктор=k and ЗіграніРолі.idРоль=Роль.idРоль 
and ЗіграніРолі.idВистави=Вистави.idВистави and Вистави.Дата between b and e;
end$$
#call role_period('Иванова В.Є.', '2020.06.01', '2020.06.02'); #+1day

drop procedure if exists role_genre$$
create procedure role_genre(in t text, in g text) 
begin
declare r, k int default 0;
select idПерсонал into r from Персонал where ПІБ=t;
select idАктор into k from Актор where Актор.idПерсонал=r;
select Роль.Імя as 'Роль' from ЗіграніРолі, Роль , Вистави, Постановка
where ЗіграніРолі.idАктор=k and ЗіграніРолі.idРоль=Роль.idРоль and ЗіграніРолі.idВистави=Вистави.idВистави and
Вистави.idПостановка=Постановка.idПостановка and Постановка.Жанр= g;
end$$
#call role_genre('Иванова В.Є.', 'Комедія');#Трагедія

drop procedure if exists actor_regiser$$
create procedure actor_regiser(in t text, in g text) 
begin
declare k int default 0;
select idАктор into k from Актор, Персонал 
where Персонал.ПІБ=t and Актор.idПерсонал=Персонал.idПерсонал;
select distinct(Роль.Імя) as 'Роль' from ЗіграніРолі, Роль , Вистави, Постановка, Постановник, Персонал 
where Персонал.ПІБ=g and Постановник.idПерсонал=Персонал.idПерсонал 
and Постановка.Режисер=Постановник.idПостановник and ЗіграніРолі.idАктор=k
and ЗіграніРолі.idВистави=Вистави.idВистави and Вистави.idПостановка=Постановка.idПостановка 
and ЗіграніРолі.idРоль=Роль.idРоль;
end$$
call actor_regiser('Иванова В.Є.','Порохницький Н.О.'); 
#Task10------------------------------------------------------------------
