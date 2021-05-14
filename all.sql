-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Treatre_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Treatre_db` ;

-- -----------------------------------------------------
-- Schema Treatre_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Treatre_db` DEFAULT CHARACTER SET utf8 ;
USE `Treatre_db` ;

-- -----------------------------------------------------
-- Table `Treatre_db`.`Персонал`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`Персонал` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`Персонал` (
  `IdПерсонал` INT NOT NULL,
  `ПІБ` VARCHAR(45) NULL DEFAULT NULL,
  `Зарплата` INT NULL DEFAULT NULL,
  `Стаж` INT NULL DEFAULT NULL,
  `Стать` VARCHAR(45) NULL DEFAULT NULL,
  `Вік` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IdПерсонал`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Treatre_db`.`ІншийПерсонал`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`ІншийПерсонал` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`ІншийПерсонал` (
  `IdІншийПерсонал` INT NOT NULL,
  `Спеціалізація` VARCHAR(45) NULL DEFAULT NULL,
  `IdПерсонал` INT NOT NULL,
  PRIMARY KEY (`IdІншийПерсонал`),
  INDEX `fk_ІншийПерсонал_Персонал1_idx` (`IdПерсонал` ASC) VISIBLE,
  CONSTRAINT `fk_ІншийПерсонал_Персонал1`
    FOREIGN KEY (`IdПерсонал`)
    REFERENCES `Treatre_db`.`Персонал` (`IdПерсонал`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Treatre_db`.`Автор`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`Автор` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`Автор` (
  `IdАвтор` INT NOT NULL,
  `Імя` VARCHAR(45) NULL DEFAULT NULL,
  `Країна` VARCHAR(45) NULL DEFAULT NULL,
  `Століття` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IdАвтор`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Treatre_db`.`Актор`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`Актор` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`Актор` (
  `IdАктор` INT NOT NULL,
  `Зріст` INT NULL DEFAULT NULL,
  `Тембр` VARCHAR(45) NULL DEFAULT NULL,
  `IdПерсонал` INT NOT NULL,
  PRIMARY KEY (`IdАктор`),
  INDEX `fk_Актор_Персонал1_idx` (`IdПерсонал` ASC) VISIBLE,
  CONSTRAINT `fk_Актор_Персонал1`
    FOREIGN KEY (`IdПерсонал`)
    REFERENCES `Treatre_db`.`Персонал` (`IdПерсонал`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Treatre_db`.`Постановник`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`Постановник` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`Постановник` (
  `IdПостановник` INT NOT NULL,
  `Спеціалізація` VARCHAR(45) NULL DEFAULT NULL,
  `IdПерсонал` INT NOT NULL,
  PRIMARY KEY (`IdПостановник`),
  INDEX `fk_Постановник_Персонал1_idx` (`IdПерсонал` ASC) VISIBLE,
  CONSTRAINT `fk_Постановник_Персонал1`
    FOREIGN KEY (`IdПерсонал`)
    REFERENCES `Treatre_db`.`Персонал` (`IdПерсонал`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Treatre_db`.`Постановка`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`Постановка` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`Постановка` (
  `IdПостановка` INT NOT NULL,
  `Назва` VARCHAR(45) NULL DEFAULT NULL,
  `Жанр` VARCHAR(45) NULL DEFAULT NULL,
  `ВіковаКатегорія` VARCHAR(45) NULL DEFAULT NULL,
  `РікНаписання` INT NULL DEFAULT NULL,
  `Премєра` DATE NULL DEFAULT NULL,
  `IdАвтор` INT NOT NULL,
  `Режисер` INT NOT NULL,
  `Художник` INT NOT NULL,
  `Дирижер` INT NOT NULL,
  PRIMARY KEY (`IdПостановка`),
  INDEX `fk_Постановка_Автор1_idx` (`IdАвтор` ASC) VISIBLE,
  INDEX `fk_Постановка_Постановник1_idx` (`Режисер` ASC) VISIBLE,
  INDEX `fk_Постановка_Постановник2_idx` (`Художник` ASC) VISIBLE,
  INDEX `fk_Постановка_Постановник3_idx` (`Дирижер` ASC) VISIBLE,
  CONSTRAINT `fk_Постановка_Автор1`
    FOREIGN KEY (`IdАвтор`)
    REFERENCES `Treatre_db`.`Автор` (`IdАвтор`),
  CONSTRAINT `fk_Постановка_Постановник1`
    FOREIGN KEY (`Режисер`)
    REFERENCES `Treatre_db`.`Постановник` (`IdПостановник`),
  CONSTRAINT `fk_Постановка_Постановник2`
    FOREIGN KEY (`Художник`)
    REFERENCES `Treatre_db`.`Постановник` (`IdПостановник`),
  CONSTRAINT `fk_Постановка_Постановник3`
    FOREIGN KEY (`Дирижер`)
    REFERENCES `Treatre_db`.`Постановник` (`IdПостановник`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Treatre_db`.`Вистави`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`Вистави` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`Вистави` (
  `IdВистави` INT NOT NULL,
  `Дата` DATE NULL DEFAULT NULL,
  `Час` VARCHAR(45) NULL DEFAULT NULL,
  `Премєра` VARCHAR(45) NULL DEFAULT NULL,
  `Сезон` VARCHAR(45) NULL DEFAULT NULL,
  `IdПостановка` INT NOT NULL,
  PRIMARY KEY (`IdВистави`),
  INDEX `fk_Вистави_Постановка1_idx` (`IdПостановка` ASC) VISIBLE,
  CONSTRAINT `fk_Вистави_Постановка1`
    FOREIGN KEY (`IdПостановка`)
    REFERENCES `Treatre_db`.`Постановка` (`IdПостановка`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Treatre_db`.`Гастролі`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`Гастролі` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`Гастролі` (
  `Початок` DATE NULL DEFAULT NULL,
  `Кінець` DATE NULL DEFAULT NULL,
  `IdПерсонал` INT NOT NULL,
  `IdПостановка` INT NOT NULL,
  INDEX `fk_Гастролі_Персонал1_idx` (`IdПерсонал` ASC) VISIBLE,
  INDEX `fk_Гастролі_Постановка1_idx` (`IdПостановка` ASC) VISIBLE,
  CONSTRAINT `fk_Гастролі_Персонал1`
    FOREIGN KEY (`IdПерсонал`)
    REFERENCES `Treatre_db`.`Персонал` (`IdПерсонал`),
  CONSTRAINT `fk_Гастролі_Постановка1`
    FOREIGN KEY (`IdПостановка`)
    REFERENCES `Treatre_db`.`Постановка` (`IdПостановка`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Treatre_db`.`Роль`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`Роль` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`Роль` (
  `IdРоль` INT NOT NULL,
  `Імя` VARCHAR(45) NULL DEFAULT NULL,
  `ГоловнаРоль` VARCHAR(45) NULL DEFAULT NULL,
  `Зріст` VARCHAR(45) NULL DEFAULT NULL,
  `Вік` INT NULL DEFAULT NULL,
  `Стать` VARCHAR(45) NULL DEFAULT NULL,
  `Тембр` VARCHAR(45) NULL DEFAULT NULL,
  `IdПостановка` INT NOT NULL,
  PRIMARY KEY (`IdРоль`),
  INDEX `fk_Роль_Постановка1_idx` (`IdПостановка` ASC) VISIBLE,
  CONSTRAINT `fk_Роль_Постановка1`
    FOREIGN KEY (`IdПостановка`)
    REFERENCES `Treatre_db`.`Постановка` (`IdПостановка`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Treatre_db`.`ЗіграніРолі`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`ЗіграніРолі` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`ЗіграніРолі` (
  `Дублер` INT NULL DEFAULT NULL,
  `IdВистави` INT NOT NULL,
  `IdРоль` INT NOT NULL,
  `IdАктор` INT NOT NULL,
  INDEX `fk_ЗіграніРолі_Вистави_idx` (`IdВистави` ASC) VISIBLE,
  INDEX `fk_ЗіграніРолі_Роль1_idx` (`IdРоль` ASC) VISIBLE,
  INDEX `fk_ЗіграніРолі_Актор1_idx` (`IdАктор` ASC) VISIBLE,
  CONSTRAINT `fk_ЗіграніРолі_Актор1`
    FOREIGN KEY (`IdАктор`)
    REFERENCES `Treatre_db`.`Актор` (`IdАктор`),
  CONSTRAINT `fk_ЗіграніРолі_Вистави`
    FOREIGN KEY (`IdВистави`)
    REFERENCES `Treatre_db`.`Вистави` (`IdВистави`),
  CONSTRAINT `fk_ЗіграніРолі_Роль1`
    FOREIGN KEY (`IdРоль`)
    REFERENCES `Treatre_db`.`Роль` (`IdРоль`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Treatre_db`.`Каса`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`Каса` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`Каса` (
  `IdКаса` INT NOT NULL,
  `Ряд` INT NULL DEFAULT NULL,
  `Місце` INT NULL DEFAULT NULL,
  `Ціна` INT NULL DEFAULT NULL,
  `Дата` DATE NULL DEFAULT NULL,
  `IdВистави` INT NOT NULL,
  PRIMARY KEY (`IdКаса`),
  INDEX `fk_Каса_Вистави1_idx` (`IdВистави` ASC) VISIBLE,
  CONSTRAINT `fk_Каса_Вистави1`
    FOREIGN KEY (`IdВистави`)
    REFERENCES `Treatre_db`.`Вистави` (`IdВистави`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Treatre_db`.`Конкурс`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`Конкурс` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`Конкурс` (
  `Назва` VARCHAR(45) NOT NULL,
  `Дата` DATE NULL DEFAULT NULL,
  `Звання` VARCHAR(45) NULL DEFAULT NULL,
  `IdАктор` INT NOT NULL,
  INDEX `fk_Конкурс_Актор1_idx` (`IdАктор` ASC) VISIBLE,
  CONSTRAINT `fk_Конкурс_Актор1`
    FOREIGN KEY (`IdАктор`)
    REFERENCES `Treatre_db`.`Актор` (`IdАктор`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Treatre_db`.`Училище`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`Училище` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`Училище` (
  `idУчилище` INT NOT NULL,
  `Назва` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idУчилище`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Treatre_db`.`студент`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatre_db`.`студент` ;

CREATE TABLE IF NOT EXISTS `Treatre_db`.`студент` (
  `IdCтудент` INT NOT NULL,
  `IdУчилище` INT NOT NULL,
  `IdАктор` INT NOT NULL,
  PRIMARY KEY (`IdCтудент`),
  INDEX `fk_студент_Училище1_idx` (`IdУчилище` ASC) VISIBLE,
  INDEX `fk_студент_Актор1_idx` (`IdАктор` ASC) VISIBLE,
  CONSTRAINT `fk_студент_Актор1`
    FOREIGN KEY (`IdАктор`)
    REFERENCES `Treatre_db`.`Актор` (`IdАктор`),
  CONSTRAINT `fk_студент_Училище1`
    FOREIGN KEY (`IdУчилище`)
    REFERENCES `Treatre_db`.`Училище` (`idУчилище`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `Treatre_db` ;

-- -----------------------------------------------------
-- procedure actor_regiser
-- -----------------------------------------------------

USE `Treatre_db`;
DROP procedure IF EXISTS `Treatre_db`.`actor_regiser`;

DELIMITER $$
USE `Treatre_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actor_regiser`(in t text, in g text)
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure money_for_performance
-- -----------------------------------------------------

USE `Treatre_db`;
DROP procedure IF EXISTS `Treatre_db`.`money_for_performance`;

DELIMITER $$
USE `Treatre_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `money_for_performance`(in t text)
begin
select Постановка.Назва as 'Назва', count(Каса.idВистави) as 'К-ть проданих квтиків', sum(Каса.Ціна) as 'Виручені кошти', Вистави.Дата 
from Постановка, Вистави, Каса where Постановка.Назва =t
and Постановка.idПостановка=Вистави.idПостановка and Вистави.idВистави=Каса.idВистави 
group by Каса.idВистави union
select 'Усього:', count(Каса.idВистави) as 'К-ть проданих квтиків', sum(Каса.Ціна) , '' from Постановка, Вистави, Каса 
where Постановка.Назва = t and Постановка.idПостановка=Вистави.idПостановка and Вистави.idВистави=Каса.idВистави;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure money_for_period
-- -----------------------------------------------------

USE `Treatre_db`;
DROP procedure IF EXISTS `Treatre_db`.`money_for_period`;

DELIMITER $$
USE `Treatre_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `money_for_period`(in b date, in e date)
begin
select Постановка.Назва, sum(Каса.Ціна) as 'Виручені кошти' , Вистави.Дата from Каса, Вистави, Постановка 
where Каса.Дата between b
and e and Постановка.idПостановка=Вистави.idПостановка and Вистави.idВистави=Каса.idВистави
group by Каса.idВистави union
select 'Усього:', sum(Каса.Ціна) as 'Виручені кошти', ' ' from Каса 
where Каса.Дата between b and e;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure performance_list
-- -----------------------------------------------------

USE `Treatre_db`;
DROP procedure IF EXISTS `Treatre_db`.`performance_list`;

DELIMITER $$
USE `Treatre_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `performance_list`(in t text)
begin
declare n , p int default 0;
select idПостановка into n from Постановка 
where Постановка.Назва=t; select idВистави into p from Вистави 
where idПостановка= n limit 1; select "Дата Прем'єри", Премєра from Постановка 
where Постановка.Назва=t union
select "Режисер", Персонал.ПІБ from Постановник, Персонал, Постановка
where Постановник.idПерсонал=Персонал.idПерсонал and Постановка.Режисер=Постановник.idПостановник 
and Постановка.idПостановка=n union select "Художник", Персонал.ПІБ 
from Постановник, Персонал, Постановка where Постановник.idПерсонал=Персонал.idПерсонал 
and Постановка.Художник=Постановник.idПостановник and Постановка.idПостановка=n union
select "Дирижер", Персонал.ПІБ from Постановник, Персонал, Постановка
where Постановник.idПерсонал=Персонал.idПерсонал and
Постановка.Дирижер=Постановник.idПостановник and Постановка.idПостановка=n union
select Роль.Імя, Персонал.ПІБ from Роль, ЗіграніРолі, Актор, Персонал 
where ЗіграніРолі.idВистави=p and ЗіграніРолі.Дублер=0 and ЗіграніРолі.idРоль=Роль.idРоль 
and ЗіграніРолі.idАктор=Актор.idАктор and Актор.idПерсонал=Персонал.idПерсонал;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure place
-- -----------------------------------------------------

USE `Treatre_db`;
DROP procedure IF EXISTS `Treatre_db`.`place`;

DELIMITER $$
USE `Treatre_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `place`()
begin
declare t int default 0;
select idВистави into t from Вистави order by idВистави desc limit 1; 
select Постановка.Назва as 'Назва', (10 - count(Каса.idВистави)) as 'Кількість вільних місць', Вистави.Дата as 'Дата'
from Каса,Вистави, Постановка 
where Постановка.idПостановка=Вистави.idПостановка and Вистави.idВистави=Каса.idВистави
group by Каса.idВистави union
select 'Усього:' , (t*10-count(idКаса)),'' from Каса; 
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure place_performance
-- -----------------------------------------------------

USE `Treatre_db`;
DROP procedure IF EXISTS `Treatre_db`.`place_performance`;

DELIMITER $$
USE `Treatre_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `place_performance`(in t text)
begin
select t as 'Назва', (10 - count(Каса.idВистави)) as 'Кількість вільних місць',
Вистави.Дата from Каса,Вистави, Постановка 
where Постановка.Назва=t
and Постановка.idПостановка=Вистави.idПостановка and Вистави.idВистави=Каса.idВистави
group by Каса.idВистави;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure role_actor
-- -----------------------------------------------------

USE `Treatre_db`;
DROP procedure IF EXISTS `Treatre_db`.`role_actor`;

DELIMITER $$
USE `Treatre_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `role_actor`(in t text)
begin
declare r, k int default 0;
select idПерсонал into r from Персонал where ПІБ=t;
select idАктор into k from Актор where Актор.idПерсонал=r; 
select Роль.Імя as 'Роль' from ЗіграніРолі, Роль 
where ЗіграніРолі.idАктор=k and ЗіграніРолі.idРоль=Роль.idРоль; 
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure role_genre
-- -----------------------------------------------------

USE `Treatre_db`;
DROP procedure IF EXISTS `Treatre_db`.`role_genre`;

DELIMITER $$
USE `Treatre_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `role_genre`(in t text, in g text)
begin
declare r, k int default 0;
select idПерсонал into r from Персонал where ПІБ=t;
select idАктор into k from Актор where Актор.idПерсонал=r;
select Роль.Імя as 'Роль' from ЗіграніРолі, Роль , Вистави, Постановка
where ЗіграніРолі.idАктор=k and ЗіграніРолі.idРоль=Роль.idРоль and ЗіграніРолі.idВистави=Вистави.idВистави and
Вистави.idПостановка=Постановка.idПостановка and Постановка.Жанр= g;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure role_period
-- -----------------------------------------------------

USE `Treatre_db`;
DROP procedure IF EXISTS `Treatre_db`.`role_period`;

DELIMITER $$
USE `Treatre_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `role_period`(in t text, in b date, in e date)
begin
declare r, k int default 0;
select idПерсонал into r from Персонал where ПІБ=t;
select idАктор into k from Актор where Актор.idПерсонал=r; 
select Роль.Імя as 'Роль' from ЗіграніРолі, Роль , Вистави where
ЗіграніРолі.idАктор=k and ЗіграніРолі.idРоль=Роль.idРоль 
and ЗіграніРолі.idВистави=Вистави.idВистави and Вистави.Дата between b and e;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure tickets
-- -----------------------------------------------------

USE `Treatre_db`;
DROP procedure IF EXISTS `Treatre_db`.`tickets`;

DELIMITER $$
USE `Treatre_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tickets`()
begin
select Постановка.Назва, count(Каса.idВистави)as 'К-ть проданих квтиків',
Вистави.Дата from Каса, Вистави, Постановка 
where Вистави.idВистави=Каса.idВистави and Вистави.idПостановка=Постановка.idПостановка
group by Каса.idВистави; 
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure tickets_performance
-- -----------------------------------------------------

USE `Treatre_db`;
DROP procedure IF EXISTS `Treatre_db`.`tickets_performance`;

DELIMITER $$
USE `Treatre_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tickets_performance`(in t text)
begin
select t as 'Назва', count(Каса.idВистави) as 'К-ть проданих квтиків', Вистави.Дата 
from Каса, Вистави, Постановка where Постановка.Назва=t
and Постановка.idПостановка=Вистави.idПостановка and Вистави.idВистави=Каса.idВистави 
group by Каса.idВистави; 
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure tickets_period
-- -----------------------------------------------------

USE `Treatre_db`;
DROP procedure IF EXISTS `Treatre_db`.`tickets_period`;

DELIMITER $$
USE `Treatre_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tickets_period`(in b date, in e date)
begin
select Постановка.Назва, count(Каса.idВистави) as 'К-ть проданих квтиків',
Вистави.Дата as 'Дата вистави' from Постановка, Каса, Вистави 
where Каса.Дата between b and e and Постановка.idПостановка=Вистави.idПостановка 
and Вистави.idВистави=Каса.idВистави
group by Каса.idВистави;
end$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Treatre_db`.`Персонал`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (1, 'Петров А.О.', 10000, 2, 'чол', 25);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (2, 'Иванова В.Є.', 12000, 5, 'жін', 33);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (3, 'Сидоров П.Д.', 10000, 1, 'чол', 22);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (4, 'Жук Ф.О.', 18000, 20, 'чол', 52);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (5, 'Прищепа М.О.', 15000, 7, 'чол', 37);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (6, 'Вишневська Я.Р.', 10000, 1, 'жін', 20);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (7, 'Башкіров І.Ф.', 25000, 15, 'чол', 47);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (8, 'Раскевич Ж.М.', 16200, 3, 'жін', 26);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (9, 'Седих А.Є.', 15000, 3, 'жін', 26);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (10, 'Порохницький Н.О.', 18000, 6, 'чол', 29);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (11, 'Пасічний П.П.', 10000, 1, 'чол', 19);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (12, 'Носов І.Р.', 10000, 30, 'чол', 62);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (13, 'Пахарь І.О.', 17500, 5, 'жін', 25);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (14, 'Гужевський М.О.', 20000, 10, 'чол', 40);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (15, 'Калуж П.Р.', 13000, 2, 'чол', 23);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (16, 'Авдієнко В.О', 10000, 2, 'чол', 20);
INSERT INTO `Treatre_db`.`Персонал` (`IdПерсонал`, `ПІБ`, `Зарплата`, `Стаж`, `Стать`, `Вік`) VALUES (17, 'Клавдій Я.В.', 10000, 1, 'жін', 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Treatre_db`.`ІншийПерсонал`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`ІншийПерсонал` (`IdІншийПерсонал`, `Спеціалізація`, `IdПерсонал`) VALUES (1, 'Музикант', 3);
INSERT INTO `Treatre_db`.`ІншийПерсонал` (`IdІншийПерсонал`, `Спеціалізація`, `IdПерсонал`) VALUES (2, 'Адміністратор', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Treatre_db`.`Автор`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`Автор` (`IdАвтор`, `Імя`, `Країна`, `Століття`) VALUES (1, 'Іржі_Губач', 'Чехія', 19);
INSERT INTO `Treatre_db`.`Автор` (`IdАвтор`, `Імя`, `Країна`, `Століття`) VALUES (2, 'Гоголь', 'Україна', 20);
INSERT INTO `Treatre_db`.`Автор` (`IdАвтор`, `Імя`, `Країна`, `Століття`) VALUES (3, 'Карпенко-Карий', 'Україна', 20);
INSERT INTO `Treatre_db`.`Автор` (`IdАвтор`, `Імя`, `Країна`, `Століття`) VALUES (4, 'Булгаков', 'Росія', 19);
INSERT INTO `Treatre_db`.`Автор` (`IdАвтор`, `Імя`, `Країна`, `Століття`) VALUES (5, 'Жолі', 'Франція', 20);
INSERT INTO `Treatre_db`.`Автор` (`IdАвтор`, `Імя`, `Країна`, `Століття`) VALUES (6, 'Бенавенте', 'Іспанія', 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Treatre_db`.`Актор`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`Актор` (`IdАктор`, `Зріст`, `Тембр`, `IdПерсонал`) VALUES (1, 184, 'Баритон', 1);
INSERT INTO `Treatre_db`.`Актор` (`IdАктор`, `Зріст`, `Тембр`, `IdПерсонал`) VALUES (2, 165, 'Сопрано', 2);
INSERT INTO `Treatre_db`.`Актор` (`IdАктор`, `Зріст`, `Тембр`, `IdПерсонал`) VALUES (3, 177, 'Бас', 4);
INSERT INTO `Treatre_db`.`Актор` (`IdАктор`, `Зріст`, `Тембр`, `IdПерсонал`) VALUES (4, 166, 'Тенор', 11);
INSERT INTO `Treatre_db`.`Актор` (`IdАктор`, `Зріст`, `Тембр`, `IdПерсонал`) VALUES (5, 199, 'Бас', 12);
INSERT INTO `Treatre_db`.`Актор` (`IdАктор`, `Зріст`, `Тембр`, `IdПерсонал`) VALUES (6, 155, 'Контральто', 13);
INSERT INTO `Treatre_db`.`Актор` (`IdАктор`, `Зріст`, `Тембр`, `IdПерсонал`) VALUES (7, 175, 'Баритон', 14);
INSERT INTO `Treatre_db`.`Актор` (`IdАктор`, `Зріст`, `Тембр`, `IdПерсонал`) VALUES (8, 178, 'Баритон', 15);
INSERT INTO `Treatre_db`.`Актор` (`IdАктор`, `Зріст`, `Тембр`, `IdПерсонал`) VALUES (11, 189, 'Бас', 16);
INSERT INTO `Treatre_db`.`Актор` (`IdАктор`, `Зріст`, `Тембр`, `IdПерсонал`) VALUES (15, 167, 'Сопрано', 17);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Treatre_db`.`Постановник`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`Постановник` (`IdПостановник`, `Спеціалізація`, `IdПерсонал`) VALUES (1, 'Дирижер', 9);
INSERT INTO `Treatre_db`.`Постановник` (`IdПостановник`, `Спеціалізація`, `IdПерсонал`) VALUES (2, 'Художник', 6);
INSERT INTO `Treatre_db`.`Постановник` (`IdПостановник`, `Спеціалізація`, `IdПерсонал`) VALUES (3, 'Дирижер', 7);
INSERT INTO `Treatre_db`.`Постановник` (`IdПостановник`, `Спеціалізація`, `IdПерсонал`) VALUES (4, 'Режисер', 8);
INSERT INTO `Treatre_db`.`Постановник` (`IdПостановник`, `Спеціалізація`, `IdПерсонал`) VALUES (5, 'Режисер', 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Treatre_db`.`Постановка`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`Постановка` (`IdПостановка`, `Назва`, `Жанр`, `ВіковаКатегорія`, `РікНаписання`, `Премєра`, `IdАвтор`, `Режисер`, `Художник`, `Дирижер`) VALUES (1, 'Корсиканка', 'Комедія', '6+', 1920, '2015-03-01', 1, 5, 2, 1);
INSERT INTO `Treatre_db`.`Постановка` (`IdПостановка`, `Назва`, `Жанр`, `ВіковаКатегорія`, `РікНаписання`, `Премєра`, `IdАвтор`, `Режисер`, `Художник`, `Дирижер`) VALUES (2, 'Сто_Тисяч', 'Комедія', '18+', 1988, '2019-04-02', 2, 4, 2, 1);
INSERT INTO `Treatre_db`.`Постановка` (`IdПостановка`, `Назва`, `Жанр`, `ВіковаКатегорія`, `РікНаписання`, `Премєра`, `IdАвтор`, `Режисер`, `Художник`, `Дирижер`) VALUES (3, 'Мертві_Душі', 'Трагедія', '12+', 2001, '2019-05-03', 3, 4, 2, 3);
INSERT INTO `Treatre_db`.`Постановка` (`IdПостановка`, `Назва`, `Жанр`, `ВіковаКатегорія`, `РікНаписання`, `Премєра`, `IdАвтор`, `Режисер`, `Художник`, `Дирижер`) VALUES (4, 'Назва4', 'Комедія', '6+', 1988, '2005-06-08', 4, 5, 2, 1);
INSERT INTO `Treatre_db`.`Постановка` (`IdПостановка`, `Назва`, `Жанр`, `ВіковаКатегорія`, `РікНаписання`, `Премєра`, `IdАвтор`, `Режисер`, `Художник`, `Дирижер`) VALUES (5, 'Назва5', 'Драма', '12+', 1788, '2020-06-03', 5, 5, 2, 3);
INSERT INTO `Treatre_db`.`Постановка` (`IdПостановка`, `Назва`, `Жанр`, `ВіковаКатегорія`, `РікНаписання`, `Премєра`, `IdАвтор`, `Режисер`, `Художник`, `Дирижер`) VALUES (6, 'Назва6', 'Трагедія', '18+', 1967, '2020-06-04', 6, 5, 2, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Treatre_db`.`Вистави`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`Вистави` (`IdВистави`, `Дата`, `Час`, `Премєра`, `Сезон`, `IdПостановка`) VALUES (1, '2021-06-01', '18:00', '1', 'Літо', 1);
INSERT INTO `Treatre_db`.`Вистави` (`IdВистави`, `Дата`, `Час`, `Премєра`, `Сезон`, `IdПостановка`) VALUES (2, '2020-06-02', '19:00', '0', 'Літо', 2);
INSERT INTO `Treatre_db`.`Вистави` (`IdВистави`, `Дата`, `Час`, `Премєра`, `Сезон`, `IdПостановка`) VALUES (3, '2021-06-03', '20:00', '0', 'Літо', 3);
INSERT INTO `Treatre_db`.`Вистави` (`IdВистави`, `Дата`, `Час`, `Премєра`, `Сезон`, `IdПостановка`) VALUES (4, '2001-06-06', '13:00', '0', 'Літо', 3);
INSERT INTO `Treatre_db`.`Вистави` (`IdВистави`, `Дата`, `Час`, `Премєра`, `Сезон`, `IdПостановка`) VALUES (5, '2020-06-06', '12:00', '0', 'Літо', 3);
INSERT INTO `Treatre_db`.`Вистави` (`IdВистави`, `Дата`, `Час`, `Премєра`, `Сезон`, `IdПостановка`) VALUES (6, '2019-06-01', '20:00', '1', 'Літо', 4);
INSERT INTO `Treatre_db`.`Вистави` (`IdВистави`, `Дата`, `Час`, `Премєра`, `Сезон`, `IdПостановка`) VALUES (7, '2020-05-04', '13:00', '0', 'Літо', 5);
INSERT INTO `Treatre_db`.`Вистави` (`IdВистави`, `Дата`, `Час`, `Премєра`, `Сезон`, `IdПостановка`) VALUES (8, '2020-10-10', '11:00', '0', 'Осінь', 6);
INSERT INTO `Treatre_db`.`Вистави` (`IdВистави`, `Дата`, `Час`, `Премєра`, `Сезон`, `IdПостановка`) VALUES (9, '2020-09-09', '12:00', '0', 'Осінь', 2);
INSERT INTO `Treatre_db`.`Вистави` (`IdВистави`, `Дата`, `Час`, `Премєра`, `Сезон`, `IdПостановка`) VALUES (10, '2020-07-01', '13:00', '0', 'Літо', 1);
INSERT INTO `Treatre_db`.`Вистави` (`IdВистави`, `Дата`, `Час`, `Премєра`, `Сезон`, `IdПостановка`) VALUES (11, '2021-07-01', '13:00', '1', 'Літо', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Treatre_db`.`Гастролі`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`Гастролі` (`Початок`, `Кінець`, `IdПерсонал`, `IdПостановка`) VALUES ('2020-05-05', '2020-05-12', 1, 1);
INSERT INTO `Treatre_db`.`Гастролі` (`Початок`, `Кінець`, `IdПерсонал`, `IdПостановка`) VALUES ('2020-05-15', '2020-05-22', 2, 2);
INSERT INTO `Treatre_db`.`Гастролі` (`Початок`, `Кінець`, `IdПерсонал`, `IdПостановка`) VALUES ('2020-05-05', '2020-05-12', 11, 1);
INSERT INTO `Treatre_db`.`Гастролі` (`Початок`, `Кінець`, `IdПерсонал`, `IdПостановка`) VALUES ('2020-04-01', '2020-04-12', 12, 3);
INSERT INTO `Treatre_db`.`Гастролі` (`Початок`, `Кінець`, `IdПерсонал`, `IdПостановка`) VALUES ('2020-04-01', '2020-04-12', 15, 3);
INSERT INTO `Treatre_db`.`Гастролі` (`Початок`, `Кінець`, `IdПерсонал`, `IdПостановка`) VALUES ('2020-05-05', '2020-05-12', 6, 1);
INSERT INTO `Treatre_db`.`Гастролі` (`Початок`, `Кінець`, `IdПерсонал`, `IdПостановка`) VALUES ('2020-05-15', '2020-05-22', 7, 2);
INSERT INTO `Treatre_db`.`Гастролі` (`Початок`, `Кінець`, `IdПерсонал`, `IdПостановка`) VALUES ('2020-04-01', '2020-04-12', 8, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Treatre_db`.`Роль`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`Роль` (`IdРоль`, `Імя`, `ГоловнаРоль`, `Зріст`, `Вік`, `Стать`, `Тембр`, `IdПостановка`) VALUES (1, 'Жозефіна', '1', 'Середній', 25, 'жін', 'Сопрано', 1);
INSERT INTO `Treatre_db`.`Роль` (`IdРоль`, `Імя`, `ГоловнаРоль`, `Зріст`, `Вік`, `Стать`, `Тембр`, `IdПостановка`) VALUES (2, 'Бертран', '0', 'Високий', 25, 'чол', 'Баритон', 1);
INSERT INTO `Treatre_db`.`Роль` (`IdРоль`, `Імя`, `ГоловнаРоль`, `Зріст`, `Вік`, `Стать`, `Тембр`, `IdПостановка`) VALUES (3, 'Герасим', '1', 'Середній', 35, 'чол', 'Бас', 2);
INSERT INTO `Treatre_db`.`Роль` (`IdРоль`, `Імя`, `ГоловнаРоль`, `Зріст`, `Вік`, `Стать`, `Тембр`, `IdПостановка`) VALUES (4, 'Параска', '1', 'Низький', 35, 'жін', 'Сопрано', 2);
INSERT INTO `Treatre_db`.`Роль` (`IdРоль`, `Імя`, `ГоловнаРоль`, `Зріст`, `Вік`, `Стать`, `Тембр`, `IdПостановка`) VALUES (5, 'Мотря', '0', 'Середній', 25, 'жін', 'Сопрано', 2);
INSERT INTO `Treatre_db`.`Роль` (`IdРоль`, `Імя`, `ГоловнаРоль`, `Зріст`, `Вік`, `Стать`, `Тембр`, `IdПостановка`) VALUES (6, 'Плюшкін', '0', 'Середній', 40, 'чол', 'Бас', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Treatre_db`.`ЗіграніРолі`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`ЗіграніРолі` (`Дублер`, `IdВистави`, `IdРоль`, `IdАктор`) VALUES (0, 1, 1, 2);
INSERT INTO `Treatre_db`.`ЗіграніРолі` (`Дублер`, `IdВистави`, `IdРоль`, `IdАктор`) VALUES (1, 2, 2, 1);
INSERT INTO `Treatre_db`.`ЗіграніРолі` (`Дублер`, `IdВистави`, `IdРоль`, `IdАктор`) VALUES (0, 1, 3, 3);
INSERT INTO `Treatre_db`.`ЗіграніРолі` (`Дублер`, `IdВистави`, `IdРоль`, `IdАктор`) VALUES (0, 4, 4, 6);
INSERT INTO `Treatre_db`.`ЗіграніРолі` (`Дублер`, `IdВистави`, `IdРоль`, `IdАктор`) VALUES (0, 2, 5, 5);
INSERT INTO `Treatre_db`.`ЗіграніРолі` (`Дублер`, `IdВистави`, `IdРоль`, `IdАктор`) VALUES (0, 3, 6, 1);
INSERT INTO `Treatre_db`.`ЗіграніРолі` (`Дублер`, `IdВистави`, `IdРоль`, `IdАктор`) VALUES (1, 3, 5, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Treatre_db`.`Каса`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (1, 3, 1, 400, '2020-06-01', 1);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (2, 4, 2, 110, '2020-06-01', 1);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (3, 1, 6, 200, '2020-06-02', 2);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (4, 2, 4, 200, '2020-06-03', 3);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (5, 6, 1, 150, '2020-06-01', 1);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (6, 6, 1, 200, '2020-06-02', 2);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (7, 4, 2, 200, '2020-06-02', 2);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (8, 3, 5, 300, '2020-06-03', 3);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (9, 3, 1, 250, '2020-06-01', 1);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (10, 1, 5, 100, '2020-06-02', 2);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (11, 2, 4, 170, '2020-06-03', 3);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (12, 6, 5, 170, '2020-06-03', 3);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (13, 4, 3, 100, '2020-06-03', 1);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (14, 4, 8, 100, '2020-09-09', 2);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (15, 2, 7, 100, '2020-09-09', 2);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (16, 3, 1, 200, '2001-06-06', 4);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (17, 3, 1, 200, '2020-06-06', 5);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (18, 1, 1, 100, '2020-10-10', 6);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (19, 1, 1, 200, '2019-06-01', 7);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (20, 1, 1, 200, '2020-07-01', 8);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (21, 1, 1, 200, '2020-09-09', 9);
INSERT INTO `Treatre_db`.`Каса` (`IdКаса`, `Ряд`, `Місце`, `Ціна`, `Дата`, `IdВистави`) VALUES (22, 1, 1, 200, '2020-06-04', 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Treatre_db`.`Конкурс`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`Конкурс` (`Назва`, `Дата`, `Звання`, `IdАктор`) VALUES ('Кращий_актор', '2020-05-05', 'Заслужений_артист', 1);
INSERT INTO `Treatre_db`.`Конкурс` (`Назва`, `Дата`, `Звання`, `IdАктор`) VALUES ('Кращий_бас', '2020-05-06', 'Народний_співак', 3);
INSERT INTO `Treatre_db`.`Конкурс` (`Назва`, `Дата`, `Звання`, `IdАктор`) VALUES ('Кращий_актор', '2020-05-10', 'Народний_артист', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Treatre_db`.`Училище`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`Училище` (`idУчилище`, `Назва`) VALUES (1, 'Коледж театру і кіно');
INSERT INTO `Treatre_db`.`Училище` (`idУчилище`, `Назва`) VALUES (2, 'Університет театру');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Treatre_db`.`студент`
-- -----------------------------------------------------
START TRANSACTION;
USE `Treatre_db`;
INSERT INTO `Treatre_db`.`студент` (`IdCтудент`, `IdУчилище`, `IdАктор`) VALUES (1, 1, 11);
INSERT INTO `Treatre_db`.`студент` (`IdCтудент`, `IdУчилище`, `IdАктор`) VALUES (2, 2, 15);

COMMIT;

