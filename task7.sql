use Treatre_db; 
delimiter $$
drop procedure if exists rankk$$ 
create procedure rankk()
begin
select Персонал.ПІБ, Конкурс.Звання from Персонал, Актор, Конкурс 
where Конкурс.idАктор=Актор.idАктор and Актор.idПерсонал=Персонал.idПерсонал;
end$$
#call rankk();

drop procedure if exists rank_period$$
create procedure rank_period(in b date, in e date) 
begin
select Персонал.ПІБ, Конкурс.Дата from Персонал, Актор, Конкурс where
Конкурс.idАктор=Актор.idАктор and Актор.idПерсонал=Персонал.idПерсонал 
and Конкурс.Дата between b and e;
end$$
#call rank_period('2019.01.01', '2020.05.09');

drop procedure if exists rank_getted$$ 
create procedure rank_getted(in t text) 
begin
select Персонал.ПІБ, Конкурс.Звання from Персонал, Актор, Конкурс 
where Конкурс.idАктор=Актор.idАктор and Актор.idПерсонал=Персонал.idПерсонал and Назва=t;
end$$
#call rank_getted('Кращий_актор');

drop procedure if exists sex_rank$$ 
create procedure sex_rank(in t text) 
begin
select Персонал.ПІБ, Конкурс.Назва, Конкурс.Звання from Персонал, Актор, Конкурс 
where Конкурс.idАктор=Актор.idАктор and Актор.idПерсонал=Персонал.idПерсонал and Персонал.Стать=t; 
end$$
#call sex_rank('чол');

drop procedure if exists rank_age$$
create procedure rank_age(in n int)
begin
select Персонал.ПІБ, Конкурс.Звання from Персонал,
Актор, Конкурс where Конкурс.idАктор=Актор.idАктор 
and Актор.idПерсонал=Персонал.idПерсонал and Персонал.Вік=n; 
end$$
#call rank_age(25);
 #Task7-----------------------------------
