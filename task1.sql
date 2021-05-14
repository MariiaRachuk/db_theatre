use Treatre_db; 
delimiter $$
drop procedure if exists personal$$ 
create procedure personal()
begin
select idПерсонал as 'id' , ПІБ from Персонал 
union select 'Разом', count(idПерсонал) from Персонал;
end$$
#call personal();

drop procedure if exists actors$$ 
create procedure actors()
begin
select Актор.idАктор as 'id', Персонал.ПІБ from Актор, Персонал 
where Актор.idПерсонал = Персонал.idПерсонал
union select 'Разом', count(idАктор) from Актор;
end$$
#call actors();

drop procedure if exists musicians$$ 
create procedure musicians()
begin
declare c int default 0;
select count(idІншийПерсонал) into c from ІншийПерсонал where
ІншийПерсонал.Спеціалізація='Музикант';
select Персонал.ПІБ from Персонал, ІншийПерсонал where
Персонал.idПерсонал=ІншийПерсонал.idПерсонал and ІншийПерсонал.Спеціалізація='Музикант'
union select concat('Разом:', convert(c, char)); 
end$$
#call musicians();

drop procedure if exists experience$$ 
create procedure experience()
begin
select ПІБ , Стаж from Персонал; 
end$$
#call experience();

drop procedure if exists sex$$ 
create procedure sex(in s text) 
begin
declare c int default 0;
select count(idПерсонал) into c from Персонал 
where Персонал.Стать=s; select ПІБ, Стать from Персонал 
where Персонал.Стать=s
union select 'Разом', c;
end$$
#call sex('чол');

drop procedure if exists age$$ 
create procedure age(in n int) 
begin
declare c int default 0;
select count(idПерсонал) into c from Персонал where Персонал.Вік=n ; 
select ПІБ, Вік from Персонал where Персонал.Вік=n
union select 'Разом', c;
end$$
#call age(25);

drop procedure if exists salary$$ 
create procedure salary(in n int) 
begin
declare c int default 0;
select count(idПерсонал) into c from Персонал where Персонал.Зарплата=n ; 
select ПІБ, Зарплата from Персонал where Персонал.Зарплата=n
union select 'Разом', c;
end$$
#call salary(10000);
# Task1 finished ----------------------------------------------------------
