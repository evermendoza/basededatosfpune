CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `ci` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `ci` VARCHAR(45) NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `concepto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `concepto` (
  `idconcepto` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idconcepto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `factura` (
  `idfactura` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `idcliente` INT NOT NULL,
  `fecha_emision` DATE NULL,
  `fecha_vencimieto` DATE NULL,
  `periodo` DATE NULL,
  `condicion` TEXT NULL,
  `sub_total` DOUBLE NULL,
  `total` DOUBLE NULL,
  PRIMARY KEY (`idfactura`, `idusuario`, `idcliente`),
  INDEX `fk_factura_usuario1_idx` (`idusuario` ASC) VISIBLE,
  INDEX `fk_factura_cliente1_idx` (`idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_factura_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_cliente1`
    FOREIGN KEY (`idcliente`)
    REFERENCES `cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `detalle_fa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `detalle_fa` (
  `iddetalle_fa` INT NOT NULL,
  `idfactura` INT NOT NULL,
  `idconcepto` INT NOT NULL,
  `exentas` DOUBLE NULL,
  `iva_5` DOUBLE NULL,
  `iva_10` DOUBLE NULL,
  `lectura_actual` DOUBLE NULL,
  `lectura_anterior` DOUBLE NULL,
  `minimo` DOUBLE NULL,
  `execeso` DOUBLE NULL,
  `total_consumo` DOUBLE NULL,
  PRIMARY KEY (`iddetalle_fa`, `idfactura`, `idconcepto`),
  INDEX `fk_detalle_fa_factura_idx` (`idfactura` ASC) VISIBLE,
  INDEX `fk_detalle_fa_concepto1_idx` (`idconcepto` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_fa_factura`
    FOREIGN KEY (`idfactura`)
    REFERENCES `factura` (`idfactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_fa_concepto1`
    FOREIGN KEY (`idconcepto`)
    REFERENCES `concepto` (`idconcepto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
