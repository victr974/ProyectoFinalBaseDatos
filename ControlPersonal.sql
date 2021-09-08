
CREATE DATABASE `ControlPersonal`;
USE `ControlPersonal` ;

-- -----------------------------------------------------
-- Table `ControlPersonal`.`Asigna`
-- -----------------------------------------------------
CREATE TABLE `Asigna` (
  `CodigoAsigna` INT NOT NULL,
  `CodPersona` VARCHAR(45) NULL,
  `CodDep` VARCHAR(45) NULL,
  `CodPuesto` VARCHAR(45) NULL,
  `FechaAsigna` TIMESTAMP NULL,
  `FechincioLa` TIMESTAMP NULL,
  PRIMARY KEY (`CodigoAsigna`));


-- -----------------------------------------------------
-- Table `ControlPersonal`.`Puesto`
-- -----------------------------------------------------
CREATE TABLE  `Puesto` (
  `CodPuesto` INT NOT NULL,
  `NombrePuesto` VARCHAR(45) NULL,
  `Descrip` VARCHAR(45) NULL,
  `SueldoBase` VARCHAR(45) NULL,
  `Bono` VARCHAR(45) NULL,
  `Bonificación` VARCHAR(45) NULL,
  `Asigna_CodigoAsigna` INT NOT NULL,
  PRIMARY KEY (`CodPuesto`),
  FOREIGN KEY (`Asigna_CodigoAsigna`)
  REFERENCES  `Asigna` (`CodigoAsigna`) ON DELETE CASCADE);



-- -----------------------------------------------------
-- Table `ControlPersonal`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE  `Departamento` (
  `CodDepto` INT NOT NULL,
  `NombreDepto` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  `CantEmpleados` VARCHAR(45) NULL,
  `Asigna_CodigoAsigna` INT NOT NULL,
  PRIMARY KEY (`CodDepto`),
  FOREIGN KEY (`Asigna_CodigoAsigna`)
  REFERENCES  `Asigna` (`CodigoAsigna`)
   ON DELETE CASCADE
	);
 


-- -----------------------------------------------------
-- Table `ControlPersonal`.`Personal`
-- -----------------------------------------------------
CREATE TABLE  `Personal` (
  `CodPersonal` INT NOT NULL,
  `Nombres` VARCHAR(45) NULL,
  `Apellidos` VARCHAR(45) NULL,
  `Correo` VARCHAR(45) NULL,
  `FechaNacimiento` TIMESTAMP NULL,
  `Puesto_CodPuesto` INT NOT NULL,
  `Departamento_CodDepto` INT NOT NULL,
  `Asigna_CodigoAsigna` INT NOT NULL,
  PRIMARY KEY (`CodPersonal`),
  FOREIGN KEY (`Puesto_CodPuesto`)
  REFERENCES `Puesto` (`CodPuesto`) ON DELETE CASCADE,
  FOREIGN KEY (`Departamento_CodDepto`)
  REFERENCES `Departamento` (`CodDepto`) ON DELETE CASCADE,
  FOREIGN KEY (`Asigna_CodigoAsigna`)
  REFERENCES  `Asigna` (`CodigoAsigna`) ON DELETE CASCADE);


