use mydb; 
delimiter $$
drop procedure if exists personal$$ 
create procedure personal()
begin
select idПерсонал as 'id' , ПІБ from Персонал; end$$
#call personal();

drop procedure if exists actors$$ 
create procedure actors()
begin
select Актор.idАктор as 'id', Персонал.ПІБ from Актор, Персонал where Актор.idПерсонал = Персонал.idПерсонал;
end$$
#call actors();

drop procedure if exists musicians$$ 
create procedure musicians()
begin
select Персонал.ПІБ from Персонал, ІншийПерсонал 
where Персонал.idПерсонал=ІншийПерсонал.idПерсонал and ІншийПерсонал.Спеціалізація='Музикант';
end$$
#call musicians();

drop procedure if exists experience$$ 
create procedure experience()
begin
select ПІБ , Стаж from Персонал; end$$
#call experience();

drop procedure if exists sex$$ 
create procedure sex(in s text) 
begin
select ПІБ, Стать from Персонал 
where Персонал.Стать=s; end$$
#call sex('чол');
#------------------------------
drop procedure if exists bidth_year$$ 
create procedure bidth_year()
begin
select ПІБ, Вік as 'Рік_народження' from Персонал;
UPDATE Персонал SET Вік = 2020 - Рік_народження; #потом нужно вызвать isp()
end$$
#call bidth_year();
drop procedure if exists isp$$ 
create procedure isp()
begin
UPDATE Персонал SET Вік = 2020 - Вік; 
end$$
#----------------------------------
drop procedure if exists age$$ 
create procedure age(in n int) 
begin
select ПІБ, Вік from Персонал 
where Персонал.Вік=n; 
end$$
#call age(25);
drop procedure if exists salary$$ 
create procedure salary(in n int) 
begin
select ПІБ, Зарплата from Персонал 
where Персонал.Зарплата=n; end$$
#call salary(10000);
# Task1 finished ----------------------------------------------------------
