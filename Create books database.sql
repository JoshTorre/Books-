-- MySQL Script generated by MySQL Workbench
-- Mon Feb 19 15:49:33 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema books
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `books` ;

-- -----------------------------------------------------
-- Schema books
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `books` DEFAULT CHARACTER SET utf8 ;
USE `books` ;

-- -----------------------------------------------------
-- Table `books`.`authors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`authors` ;

CREATE TABLE IF NOT EXISTS `books`.`authors` (
  ` id` INT NOT NULL,
  `author_name` VARCHAR(45) NULL,
  PRIMARY KEY (` id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`books`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`books` ;

CREATE TABLE IF NOT EXISTS `books`.`books` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `authors_ id` INT NOT NULL,
  PRIMARY KEY (`id`, `authors_ id`),
  INDEX `fk_books_authors_idx` (`authors_ id` ASC) VISIBLE,
  CONSTRAINT `fk_books_authors`
    FOREIGN KEY (`authors_ id`)
    REFERENCES `books`.`authors` (` id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`users` ;

CREATE TABLE IF NOT EXISTS `books`.`users` (
  `id` INT NOT NULL,
  `first name` VARCHAR(45) NULL,
  `last name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`favorites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`favorites` ;

CREATE TABLE IF NOT EXISTS `books`.`favorites` (
  `books_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  INDEX `fk_books_has_users_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_books_has_users_books1_idx` (`books_id` ASC) VISIBLE,
  CONSTRAINT `fk_books_has_users_books1`
    FOREIGN KEY (`books_id`)
    REFERENCES `books`.`books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_has_users_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `books`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
