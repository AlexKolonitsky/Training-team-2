-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Schema hr_application
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hr_application` ;

-- -----------------------------------------------------
-- Schema hr_application
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hr_application` DEFAULT CHARACTER SET utf8 ;
USE `hr_application` ;

-- -----------------------------------------------------
-- Table `hr_application`.`vacancies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hr_application`.`vacancies` ;

CREATE TABLE IF NOT EXISTS `hr_application`.`vacancies` (
  `ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `JOB_TITLE` VARCHAR(255) NOT NULL ,
  `FIRST_NAME` VARCHAR(255) NOT NULL ,
  `LAST_NAME` VARCHAR(255) NOT NULL ,
  `STATUS` VARCHAR(255) NOT NULL ,
  `EMAIL` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

INSERT INTO `vacancies` (`JOB_TITLE`, `FIRST_NAME`, `LAST_NAME`, `STATUS`, `EMAIL`)
VALUES 
('Java Developer', 'Mohammed', 'Smith', 'Accept', 'some@gmail.com'), ('Java Developer', 'EVIE', 'Hoggarth', 'Accept', 'some@gmail.com'),
('Java Developer', 'George', 'Hoggarth', 'Accept', 'some@gmail.com'), ('Java Developer', 'Alexandr', 'Hoggarth', 'Accept', 'some@gmail.com'),
('Java Developer', 'George', 'Aldridge', 'Accept', 'some@mail.ru'), ('Java Developer', 'Joshua', 'Jenkin', 'Reject', 'some@mail.ru'),
('Java Developer', 'Alexandr', 'Holmes', 'Reject', 'some@mail.ru'), ('Java Developer', 'Joshua', 'Holmes', 'Reject', 'some@mail.ru'),
('Java Developer', 'Alexandr', 'Jacobson', 'Reject', 'some@gmail.com'), ('Java Developer', 'Tonny', 'Holmes', 'Reject', 'some@gmail.com'),
('Java Developer', 'Tonny', 'Hoggarth', 'Reject', 'some@gmail.com'), ('Java Developer', 'Tonny', 'Hoggarth', 'Accept', 'some@mail.ru'),
('Java Developer', 'Tonny', 'Hoggarth', 'Accept', 'some@mail.ru'), ('Java Developer', 'Tonny', 'Hoggarth', 'Reject', 'some@gmail.com'),
('Java Developer', 'Tonny', 'Adamson', 'Reject', 'some@gmail.com'), ('Java Developer', 'John', 'Adamson', 'Reject', 'some@gmail.com'),
('Java Developer', 'John', 'Aldridge', 'Accept', 'some@gmail.com'), ('Java Developer', 'John', 'Jenkin', 'Accept', 'some@mail.ru'),
('Java Developer', 'John', 'Adamson', 'Reject', 'some@mail.ru'), ('Java Script Developer', 'John', 'Adamson', 'Reject', 'some@mail.ru'),
('Java Script Developer', 'John', 'Adamson', 'Accept', 'some@gmail.com'), ('Java Script Developer', 'John', 'Adamson', 'Accept', 'some@gmail.com'),
('Java Script Developer', 'John', 'Adamson', 'Accept', 'some@gmail.com'), ('Java Script Developer', 'John', 'Adamson', 'Accept', 'some@gmail.com'),
('Java Script Developer', 'John', 'Holmes', 'Accept', 'some@gmail.com'), ('Java Script Developer', 'Henry', 'Aldridge', 'Accept', 'some@mail.ru'),
('Java Script Developer', 'Henry', 'Jenkin', 'Reject', 'some@mail.ru'), ('Java Script Developer', 'Ivan', 'Adamson', 'Reject', 'some@gmail.com'),
('Java Script Developer', 'Henry', 'Adamson', 'Reject', 'some@gmail.com'), ('Java Script Developer', 'Ivan', 'Adamson', 'Accept', 'some@gmail.com'),
('Java Script Developer', 'Henry', 'Adamson', 'Accept', 'some@gmail.com'), ('Java Script Developer', 'Ivan', 'Holmes', 'Accept', 'some@gmail.com'),
('Java Script Developer', 'Evgenii', 'Aldridge', 'Accept', 'some@mail.ru'), ('Java Script Developer', 'Evgenii', 'Aldridge', 'Accept', 'some@mail.ru'),
('Java Script Developer', 'Evgenii', 'Adamson', 'Accept', 'some@gmail.com'), ('Java Script Developer', 'Evgenii', 'Adamson', 'Accept', 'some@gmail.com'),
('Java Script Developer', 'Evgenii', 'Adamson', 'Reject', 'some@gmail.com'), ('Java Script Developer', 'Evgenii', 'Jenkin', 'Reject', 'some@gmail.com'),
('C++ Developer', 'Mohammed', 'Jenkin', 'Accept', 'some@mail.ru'), ('C++ Developer', 'Mohammed', 'Aldridge', 'Accept', 'some@mail.ru'),
('C++ Developer', 'Anna', 'Adamson', 'Accept', 'some@gmail.com'), ('C++ Developer', 'Anna', 'Adamson', 'Accept', 'some@gmail.com'),
('C++ Developer', 'Mohammed', 'Adamson', 'Reject', 'some@gmail.com'), ('C++ Developer', 'Anna', 'Holmes', 'Reject', 'some@mail.ru'),
('C++ Developer', 'Anna', 'Jacobson', 'Reject', 'some@mail.ru'), ('C++ Developer', 'Mohammed', 'Addington', 'Accept', 'some@inbox.ru'),
('C++ Developer', 'Anna', 'Addington', 'Accept', 'some@gmail.com'), ('C++ Developer', 'Mohammed', 'Addington', 'Accept', 'some@gmail.com'),
('C++ Developer', 'Sienna', 'Addington', 'Accept', 'some@gmail.com'), ('C++ Developer', 'Sienna', 'Addington', 'Accept', 'some@gmail.com'),
('C++ Developer', 'Daisy', 'Addington', 'Reject', 'some@inbox.ru'), ('C++ Developer', 'Daisy', 'Albertson', 'Reject', 'some@inbox.ru'),
('C++ Developer', 'Tomara', 'Jenkin', 'Accept', 'some@gmail.com'), ('C++ Developer', 'Mohammed', 'Aldridge', 'Accept', 'some@gmail.com'),
('C++ Developer', 'Tomara', 'Jenkin', 'Reject', 'some@gmail.com'), ('C++ Developer', 'Tomara', 'Albertson', 'Reject', 'some@gmail.com'),
('C++ Developer', 'Tomara', 'Holmes', 'Reject', 'some@inbox.ru'), ('C++ Developer', 'Tomara', 'Jacobson', 'Accept', 'some@inbox.ru'),
('C++ Developer', 'Mohammed', 'Albertson', 'Accept', 'some@inbox.ru'), ('C++ Developer', 'Ethan', 'Albertson', 'Accept', 'some@gmail.com'),
('C++ Developer', 'Svetlana', 'Albertson', 'Accept', 'some@inbox.ru'), ('C++ Developer', 'Ethan', 'Aldridge', 'Accept', 'some@inbox.ru'),
('C++ Developer', 'Ethan', 'Jenkin', 'Reject', 'some@inbox.ru'), ('C++ Developer', 'Ethan', 'Anderson', 'Reject', 'some@gmail.com'),
('Project Manager', 'Mohammed', 'Anderson', 'Reject', 'some@inbox.ru'), ('Project Manager', 'Veronika', 'Aldridge', 'Accept', 'some@inbox.ru'),
('Project Manager', 'Veronika', 'Anderson', 'Accept', 'some@inbox.ru'), ('Project Manager', 'Veronika', 'Anderson', 'Reject', 'some@inbox.ru'),
('Project Manager', 'Veronika', 'Jenkin', 'Reject', 'some@gmail.com'), ('Project Manager', 'Veronika', 'Holmes', 'Reject', 'some@inbox.ru'),
('Project Manager', 'Janny', 'Aldridge', 'Accept', 'some@inbox.ru'), ('Project Manager', 'Janny', 'Anderson', 'Reject', 'some@gmail.com'),
('Project Manager', 'Janny', 'Anderson', 'Reject', 'some@gmail.com'), ('Project Manager', 'Janny', 'Anderson', 'Reject', 'some@gmail.com'),
('Project Manager', 'Denis', 'Jenkin', 'Reject', 'some@gmail.com'), ('Project Manager', 'Denis', 'Aldridge', 'Accept', 'some@yandex.ru'),
('Project Manager', 'Vitaly', 'Jenkin', 'Reject', 'some@yandex.ru'), ('Project Manager', 'Vitaly', 'Anderson', 'Reject', 'some@yandex.ru'),
('Project Manager', 'Nika', 'Jenkin', 'Reject', 'some@yandex.ru'), ('Project Manager', 'Nika', 'Aldridge', 'Accept', 'some@gmail.com'),
('Project Manager', 'Nika', 'Anderson', 'Reject', 'some@yandex.ru'), ('Project Manager', 'Nika', 'Holmes', 'Reject', 'some@yandex.ru'),
('Project Manager', 'Arthur', 'Aldridge', 'Reject', 'some@yandex.ru'), ('Project Manager', 'Arthur', 'Alsopp', 'Reject', 'some@gmail.com'),
('Project Manager', 'Arthur', 'Jenkin', 'Accept', 'some@yandex.ru'), ('Human Resource', 'Arthur', 'Jenkin', 'Reject', 'some@yandex.ru'),
('Human Resource', 'Arthur', 'Holmes', 'Reject', 'some@yandex.ru'), ('Human Resource', 'Arthur', 'Jenkin', 'Reject', 'some@gmail.com'),
('Human Resource', 'Daniil', 'Alsopp', 'Reject', 'some@yandex.ru'), ('Human Resource', 'Daniil', 'Alsopp', 'Accept', 'some@yandex.ru'),
('Human Resource', 'Daniil', 'Aldridge', 'Reject', 'some@gmail.com'), ('Human Resource', 'Daniil', 'Aldridge', 'Reject', 'some@gmail.com'),
('Human Resource', 'Daniil', 'Aldridge', 'Reject', 'some@gmail.com'), ('Java Script Developer', 'Evgenii', 'Holmes', 'Reject', 'some@gmail.com');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
