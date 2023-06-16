-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab8
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab8
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab8` DEFAULT CHARACTER SET utf8 ;
USE `lab8` ;

-- -----------------------------------------------------
-- Table `lab8`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`status` (
  `idstatus` INT NOT NULL AUTO_INCREMENT,
  `statuscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idstatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab8`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`usuarios` (
  `id_usuarios` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  `apellido` VARCHAR(200) NOT NULL,
  `edad` INT NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `especialidad` VARCHAR(100) NOT NULL,
  `contrasenia` VARCHAR(200) NOT NULL,
  `status_idstatus` INT NOT NULL,
  PRIMARY KEY (`id_usuarios`),
  INDEX `fk_usuarios_status1_idx` (`status_idstatus` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_status1`
    FOREIGN KEY (`status_idstatus`)
    REFERENCES `lab8`.`status` (`idstatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab8`.`empresa_seguro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`empresa_seguro` (
  `idempresa_seguro` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idempresa_seguro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab8`.`mis_viajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`mis_viajes` (
  `id_mis_viajes` INT NOT NULL,
  `fecha_reserva` DATE NOT NULL,
  `fecha_viaje` DATE NOT NULL,
  `ciudad_origen` VARCHAR(100) NOT NULL,
  `ciudad_destino` VARCHAR(100) NOT NULL,
  `empresa_seguro_idempresa_seguro` INT NOT NULL,
  `usuarios_id_usuarios` INT NOT NULL,
  `costo_total` DOUBLE NOT NULL,
  PRIMARY KEY (`id_mis_viajes`),
  INDEX `fk_viajes_empresa_seguro1_idx` (`empresa_seguro_idempresa_seguro` ASC) VISIBLE,
  INDEX `fk_viajes_usuarios1_idx` (`usuarios_id_usuarios` ASC) VISIBLE,
  CONSTRAINT `fk_viajes_empresa_seguro1`
    FOREIGN KEY (`empresa_seguro_idempresa_seguro`)
    REFERENCES `lab8`.`empresa_seguro` (`idempresa_seguro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_viajes_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `lab8`.`usuarios` (`id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
