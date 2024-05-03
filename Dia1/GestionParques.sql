create database GestionParques;
USE GestionParques ;

CREATE TABLE IF NOT EXISTS area_parque (
   idArea_parque  INT NOT NULL AUTO_INCREMENT,
   nombre  VARCHAR(45) NOT NULL,
   extension  DOUBLE NOT NULL,
   idparque  INT NOT NULL,
  PRIMARY KEY ( idArea_parque ));


CREATE TABLE IF NOT EXISTS d_has_parque (
   idDep_parque  INT NOT NULL AUTO_INCREMENT,
   idDepartamento  INT NULL DEFAULT NULL,
   idparque  INT NULL DEFAULT NULL,
  PRIMARY KEY ( idDep_parque ));



CREATE TABLE IF NOT EXISTS entidad (
   idEntidad  INT NOT NULL AUTO_INCREMENT,
   nombre  VARCHAR(45) NOT NULL,
  PRIMARY KEY ( idEntidad ));


CREATE TABLE IF NOT EXISTS departamento (
   idDepartamento  INT NOT NULL AUTO_INCREMENT,
   idEntidad  INT NOT NULL,
  PRIMARY KEY ( idDepartamento));




CREATE TABLE IF NOT EXISTS entrada (
   idEntrada  INT NOT NULL AUTO_INCREMENT,
   numEntrada  INT NOT NULL,
   ubicacion  VARCHAR(45) NOT NULL,
   idparque  INT NOT NULL,
  PRIMARY KEY ( idEntrada ));


CREATE TABLE IF NOT EXISTS especie (
   idEspecie  INT NOT NULL AUTO_INCREMENT,
   demCientifica  VARCHAR(45) NOT NULL,
   demVulgar  VARCHAR(45) NOT NULL,
   numInventario  INT NOT NULL,
   idArea_parque  INT NOT NULL,
   tipoEspecie  INT NOT NULL,
  PRIMARY KEY ( idEspecie ));

CREATE TABLE IF NOT EXISTS gestion_trabajador (
   idGestion_Trabajador  INT NOT NULL AUTO_INCREMENT,
   Entrada_Parque  VARCHAR(45) NOT NULL,
   idTrabajador  INT NOT NULL,
   idArea_parque  INT NOT NULL,
  PRIMARY KEY ( idGestion_Trabajador ));


CREATE TABLE IF NOT EXISTS parques(
   idParques  INT NOT NULL AUTO_INCREMENT,
   nombre  VARCHAR(45) NOT NULL,
   fecha  DATETIME NOT NULL,
  PRIMARY KEY ( idParques ));


CREATE TABLE IF NOT EXISTS telefono (
   idTelefono  INT NOT NULL AUTO_INCREMENT,
   numFijo  INT NOT NULL,
   numMovil  INT NOT NULL,
   idTrabajador  INT NOT NULL,
  PRIMARY KEY ( idTelefono ));


CREATE TABLE IF NOT EXISTS tipo_especie (
   idTipoEspecie  INT NOT NULL AUTO_INCREMENT,
   descripcion  VARCHAR(20) NOT NULL,
  PRIMARY KEY ( idTipoEspecie ));


CREATE TABLE IF NOT EXISTS trabajador (
   idTrabajador  INT NOT NULL AUTO_INCREMENT,
   nombre  VARCHAR(45) NOT NULL,
   cedula  INT NOT NULL,
   dirreccion  VARCHAR(45) NOT NULL,
   sueldo  DOUBLE NOT NULL,
   idparque  INT NOT NULL,
  PRIMARY KEY ( idTrabajador ));

ALTER TABLE departamento
ADD CONSTRAINT `idEntidad`
  FOREIGN KEY (`idEntidad`)
  REFERENCES entidad(idEntidad);


ALTER TABLE d_has_parque
ADD CONSTRAINT `IdDEpartametno`
  FOREIGN KEY (`idDepartamento`)
  REFERENCES `GestionParques`.`departamento` (`idDepartamento`);


ALTER TABLE `GestionParques`.`d_has_parque` 
ADD CONSTRAINT `idParque`
  FOREIGN KEY (`idparque`)
  REFERENCES `GestionParques`.`parques` (`idParques`);
  
ALTER TABLE `GestionParques`.`area_parque` 
ADD CONSTRAINT `IdParques`
  FOREIGN KEY (`idparque`)
  REFERENCES `GestionParques`.`parques` (`idParques`);
  
ALTER TABLE `GestionParques`.`especie`
ADD CONSTRAINT `IdAreaParque`
  FOREIGN KEY (`idArea_parque`)
  REFERENCES `GestionParques`.area_parque (idArea_parque);
  
ALTER TABLE `GestionParques`.especie
ADD CONSTRAINT idTipoEspecie
  FOREIGN KEY (tipoEspecie)
  REFERENCES tipo_especie (idTipoEspecie);
  
ALTER TABLE `GestionParques`.trabajador
ADD CONSTRAINT idparqueT
  FOREIGN KEY (idparque)
  REFERENCES parques (idParques);
  
ALTER TABLE `GestionParques`.telefono
ADD CONSTRAINT idTrabajador
  FOREIGN KEY (idTrabajador)
  REFERENCES trabajador (idTrabajador);
  
  ALTER TABLE `GestionParques`.entrada
ADD CONSTRAINT idparqueEn
  FOREIGN KEY (idParque)
  REFERENCES parques (idParques);

  ALTER TABLE `GestionParques`.gestion_trabajador
ADD CONSTRAINT idTrabajadorGe
  FOREIGN KEY (idTrabajador)
  REFERENCES trabajador (idTrabajador);
  
    ALTER TABLE `GestionParques`.gestion_trabajador
ADD CONSTRAINT idArea_parqueGes
  FOREIGN KEY (idArea_parque)
  REFERENCES area_parque (idArea_parque);
