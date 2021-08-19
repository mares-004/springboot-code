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
-- Table `sura`.`ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sura`.`ordenes` (
  `idOrden` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(1) NOT NULL,
  `fecha_entrega` DATETIME NOT NULL,
  PRIMARY KEY (`idOrden`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sura`.`parametros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sura`.`parametros` (
  `idParam` INT NOT NULL AUTO_INCREMENT,
  `idTipo` INT NULL DEFAULT NULL,
  `idMaterial` INT NULL DEFAULT NULL,
  `iCantidad` INT NULL DEFAULT NULL,
  `iDias` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idParam`),
  INDEX `idTipo` (`idTipo` ASC) VISIBLE,
  INDEX `idMaterial` (`idMaterial` ASC) VISIBLE,
  CONSTRAINT `parametros_ibfk_1`
    FOREIGN KEY (`idTipo`)
    REFERENCES `sura`.`construcciones` (`idTipo`),
  CONSTRAINT `parametros_ibfk_2`
    FOREIGN KEY (`idMaterial`)
    REFERENCES `sura`.`materiales` (`idMaterial`))
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
  `idOrden` INT NULL DEFAULT NULL,
  `corx` INT NULL DEFAULT NULL,
  `cory` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idSol`),
  INDEX `idOrden` (`idOrden` ASC) VISIBLE,
  CONSTRAINT `solicitudes_ibfk_1`
    FOREIGN KEY (`idTipo`)
    REFERENCES `sura`.`construcciones` (`idTipo`),
  CONSTRAINT `solicitudes_ibfk_2`
    FOREIGN KEY (`idRol`)
    REFERENCES `sura`.`roles` (`idRol`),
  CONSTRAINT `solicitudes_ibfk_5`
    FOREIGN KEY (`idOrden`)
    REFERENCES `sura`.`ordenes` (`idOrden`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
