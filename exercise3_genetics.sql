-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `idGene` INT NOT NULL,
  `Genename` VARCHAR(45) NULL,
  `Genestart` VARCHAR(45) NULL,
  `Geneend` VARCHAR(45) NULL,
  `Genedescr` VARCHAR(45) NULL,
  `Geneaffectedgene` VARCHAR(45) NULL,
  `Genechromosome` VARCHAR(45) NULL,
  PRIMARY KEY (`idGene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `Patientname` VARCHAR(45) NOT NULL,
  `Patientsyndrom` VARCHAR(45) NOT NULL,
  `Patientage` VARCHAR(45) NULL,
  `Gene_idGene` INT NOT NULL,
  PRIMARY KEY (`idPatient`),
  INDEX `fk_Patient_Gene1_idx` (`Gene_idGene` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_Gene1`
    FOREIGN KEY (`Gene_idGene`)
    REFERENCES `mydb`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient_has_Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient_has_Gene` (
  `Patient_idPatient` INT NOT NULL,
  `Gene_idGene` INT NOT NULL,
  PRIMARY KEY (`Patient_idPatient`, `Gene_idGene`),
  INDEX `fk_Patient_has_Gene_Gene1_idx` (`Gene_idGene` ASC) VISIBLE,
  INDEX `fk_Patient_has_Gene_Patient_idx` (`Patient_idPatient` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_has_Gene_Patient`
    FOREIGN KEY (`Patient_idPatient`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_has_Gene_Gene1`
    FOREIGN KEY (`Gene_idGene`)
    REFERENCES `mydb`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
