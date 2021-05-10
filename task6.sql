use mydb; 
delimiter $$

drop procedure if exists role$$ create procedure role(in t text) begin
declare c, min,max int default 0;
declare r, age, age1 int default 0; declare sex, tembr , height text default '';
select idРоль into r from Роль where Роль.Імя=t; 
select Стать into sex from Роль where Роль.Імя=t;
select Вік into age from Роль where Роль.Імя=t;
select Зріст into height from Роль where Роль.Імя=t;
select if(age<20, 20, age) into age1;
select
case
when height='Високий' then 184
when height='Середній' then 174
when height='Низький' then 164
end
into max;
select Тембр into tembr from Роль where Роль.Імя=t;
select t as Імя, age as 'Вік',sex as 'Стать', tembr as 'Тембр', height as 'Зріст' union
select Персонал.ПІБ, Персонал.Вік, Персонал.Стать, Актор.Тембр,
convert(Актор.Зріст, char) from Персонал, Актор 
where Персонал.idПерсонал=Актор.idПерсонал and Персонал.Стать=sex and Персонал.Вік=age1 
and Актор.Тембр=tembr and Актор.Зріст between (max-10) and max;
end$$
#call role('Бертран'); 
#Task6-------------------------------------------------------
