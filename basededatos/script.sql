-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sura
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sura
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sura` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `sura` ;

-- -----------------------------------------------------
-- Table `sura`.`construcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sura`.`construcciones` (
  `idTipo` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del tipo de construcción',
  `Tipo` VARCHAR(45) NOT NULL COMMENT 'Nombre del tipo de construcción',
  PRIMARY KEY (`idTipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sura`.`materiales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sura`.`materiales` (
  `idMaterial` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del material',
  `Material` VARCHAR(45) NOT NULL COMMENT 'Nombre del material',
  PRIMARY KEY (`idMaterial`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Tabla de materiales';


-- -----------------------------------------------------
-- Table `sura`.`parametros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sura`.`parametros` (
  `idParam` INT NOT NULL AUTO_INCREMENT,
  `idCons` INT NOT NULL,
  `cantCE` INT NOT NULL,
  `cantGR` INT NOT NULL,
  `cantAR` INT NOT NULL,
  `cantMA` INT NOT NULL,
  `cantAD` INT NOT NULL,
  `nroDias` INT NOT NULL COMMENT 'Número de días en que se demora la construcción',
  PRIMARY KEY (`idParam`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sura`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sura`.`roles` (
  `idRol` INT NOT NULL AUTO_INCREMENT COMMENT 'identificador del rol',
  `Rol` VARCHAR(45) NOT NULL COMMENT 'Nombre del rol',
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sura`.`solicitudes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sura`.`solicitudes` (
  `idSol` INT NOT NULL AUTO_INCREMENT,
  `idTipo` INT NOT NULL,
  `idRol` INT NOT NULL,
  `corX` INT NOT NULL,
  `corY` INT NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `FECHA_ENTREGA` DATETIME NOT NULL,
  PRIMARY KEY (`idSol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
