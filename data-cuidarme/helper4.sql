-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Helpers'
-- Datos de las niñeras
-- ---

DROP TABLE IF EXISTS `Helpers`;
		
CREATE TABLE `Helpers` (
  `id_helper` INTEGER NOT NULL AUTO_INCREMENT,
  `fecha_alta` DATE NOT NULL,
  `user_facebook` VARCHAR NOT NULL,
  `documento_tipo` INTEGER NOT NULL DEFAULT 66666666,
  `documento_nro` INTEGER NOT NULL DEFAULT 666666666,
  `nombre` VARCHAR(45) NOT NULL DEFAULT 'NULL',
  `apellido` VARCHAR(45) NOT NULL DEFAULT 'NULL',
  `correo` VARCHAR(45) NOT NULL DEFAULT 'NULL',
  `telefono_movil` INTEGER NOT NULL DEFAULT 666666666666,
  `telefono_fijo` INTEGER NOT NULL DEFAULT 666666666666,
  `domicilio` VARCHAR(255) NOT NULL DEFAULT 'NULL',
  `pais_Paises` VARCHAR(45) NOT NULL DEFAULT 'NULL',
  `ciudad_Ubicacion` VARCHAR(45) NOT NULL DEFAULT 'NULL',
  `localidad_Ubicacion` VARCHAR(45) NOT NULL DEFAULT 'NULL',
  `zipcode` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id_helper`)
) COMMENT 'Datos de las niñeras';

-- ---
-- Table 'Familia'
-- datos de los padres
-- ---

DROP TABLE IF EXISTS `Familia`;
		
CREATE TABLE `Familia` (
  `id_familia` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `fecha_alta` DATE NOT NULL DEFAULT ' CURRENT_TIMESTAMP',
  `nombre` VARCHAR(45) NOT NULL DEFAULT 'NULL',
  `apellido` VARCHAR(45) NOT NULL DEFAULT 'NULL',
  `correo` VARCHAR(45) NOT NULL DEFAULT 'NULL',
  `telefono_movil` INTEGER NOT NULL DEFAULT NULL,
  `telefono_fijo` INTEGER NOT NULL DEFAULT NULL,
  `ser_contactado` BINARY NOT NULL DEFAULT 'NULL',
  `credito_fecha` DATE NULL DEFAULT NULL,
  `credito_cantidad` INTEGER NULL DEFAULT NULL,
  `domicilio` VARCHAR(45) NOT NULL DEFAULT 'NULL',
  `pais_Paises` VARCHAR(45) NULL DEFAULT NULL,
  `ciudad_Ubicacion` VARCHAR(45) NOT NULL DEFAULT 'NULL',
  `localidad_Ubicacion` VARCHAR(45) NULL DEFAULT NULL,
  `zipcode` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id_familia`)
) COMMENT 'datos de los padres';

-- ---
-- Table 'Habilidades_Helpers'
-- 
-- ---

DROP TABLE IF EXISTS `Habilidades_Helpers`;
		
CREATE TABLE `Habilidades_Helpers` (
  `id_helper_Helpers` INTEGER NOT NULL DEFAULT NULL,
  `presentacion` MEDIUMTEXT(300) NULL DEFAULT NULL,
  `carrera` VARCHAR(50) NULL DEFAULT NULL,
  `universidad` VARCHAR(100) NULL DEFAULT NULL,
  `arte` VARCHAR(50) NULL DEFAULT NULL,
  `cocina` BINARY NULL DEFAULT NULL,
  `primeros_auxilios` BINARY NULL DEFAULT NULL,
  `asistencia_escolar` BINARY NULL DEFAULT NULL,
  PRIMARY KEY (`id_helper_Helpers`)
);

-- ---
-- Table 'Experiencias_familias'
-- 
-- ---

DROP TABLE IF EXISTS `Experiencias_familias`;
		
CREATE TABLE `Experiencias_familias` (
  `id_helper_Helpers` INTEGER NOT NULL DEFAULT NULL,
  `id_familia_Familia` INTEGER NULL DEFAULT NULL,
  `fecha_contacto` DATE NOT NULL DEFAULT 'NULL',
  `experiencia` INTEGER(1) NOT NULL DEFAULT NULL,
  `comentarios` MEDIUMTEXT(400) NULL DEFAULT NULL,
  PRIMARY KEY (`id_helper_Helpers`, `id_familia_Familia`, `fecha_contacto`)
);

-- ---
-- Table 'Idiomas'
-- 
-- ---

DROP TABLE IF EXISTS `Idiomas`;
		
CREATE TABLE `Idiomas` (
  `idioma` VARCHAR(20) NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`idioma`)
);

-- ---
-- Table 'Disponibilidad_helper'
-- 
-- ---

DROP TABLE IF EXISTS `Disponibilidad_helper`;
		
CREATE TABLE `Disponibilidad_helper` (
  `id_helper_Helpers` INTEGER NOT NULL DEFAULT NULL,
  `dia_disponible` VARCHAR(10) NOT NULL DEFAULT 'NULL',
  `hora_desde` TINYINT(2) NOT NULL DEFAULT NULL,
  `hora_hasta` TINYINT NOT NULL DEFAULT NULL,
  PRIMARY KEY ()
);

-- ---
-- Table 'Idioma_helpers'
-- 
-- ---

DROP TABLE IF EXISTS `Idioma_helpers`;
		
CREATE TABLE `Idioma_helpers` (
  `id_helper_Helpers` INTEGER NOT NULL DEFAULT NULL,
  `idioma_Idiomas` VARCHAR(20) NOT NULL DEFAULT 'NULL',
  PRIMARY KEY ()
);

-- ---
-- Table 'Ubicacion'
-- 
-- ---

DROP TABLE IF EXISTS `Ubicacion`;
		
CREATE TABLE `Ubicacion` (
  `pais_Paises` VARCHAR(45) NULL DEFAULT NULL,
  `ciudad` VARCHAR(45) NOT NULL DEFAULT 'NULL',
  `localidad` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ciudad`, `localidad`, `pais_Paises`)
);

-- ---
-- Table 'Paises'
-- 
-- ---

DROP TABLE IF EXISTS `Paises`;
		
CREATE TABLE `Paises` (
  `pais` VARCHAR(45) NOT NULL AUTO_INCREMENT DEFAULT 'NULL',
  PRIMARY KEY (`pais`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Helpers` ADD FOREIGN KEY (pais_Paises) REFERENCES `Paises` (`pais`);
ALTER TABLE `Helpers` ADD FOREIGN KEY (ciudad_Ubicacion) REFERENCES `Ubicacion` (`ciudad`);
ALTER TABLE `Helpers` ADD FOREIGN KEY (localidad_Ubicacion) REFERENCES `Ubicacion` (`localidad`);
ALTER TABLE `Familia` ADD FOREIGN KEY (pais_Paises) REFERENCES `Paises` (`pais`);
ALTER TABLE `Familia` ADD FOREIGN KEY (ciudad_Ubicacion) REFERENCES `Ubicacion` (`ciudad`);
ALTER TABLE `Familia` ADD FOREIGN KEY (localidad_Ubicacion) REFERENCES `Ubicacion` (`localidad`);
ALTER TABLE `Habilidades_Helpers` ADD FOREIGN KEY (id_helper_Helpers) REFERENCES `Helpers` (`id_helper`);
ALTER TABLE `Experiencias_familias` ADD FOREIGN KEY (id_helper_Helpers) REFERENCES `Helpers` (`id_helper`);
ALTER TABLE `Experiencias_familias` ADD FOREIGN KEY (id_familia_Familia) REFERENCES `Familia` (`id_familia`);
ALTER TABLE `Disponibilidad_helper` ADD FOREIGN KEY (id_helper_Helpers) REFERENCES `Helpers` (`id_helper`);
ALTER TABLE `Idioma_helpers` ADD FOREIGN KEY (id_helper_Helpers) REFERENCES `Helpers` (`id_helper`);
ALTER TABLE `Idioma_helpers` ADD FOREIGN KEY (idioma_Idiomas) REFERENCES `Idiomas` (`idioma`);
ALTER TABLE `Ubicacion` ADD FOREIGN KEY (pais_Paises) REFERENCES `Paises` (`pais`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Helpers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Familia` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Habilidades_Helpers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Experiencias_familias` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Idiomas` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Disponibilidad_helper` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Idioma_helpers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Ubicacion` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Paises` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Helpers` (`id_helper`,`fecha_alta`,`user_facebook`,`documento_tipo`,`documento_nro`,`nombre`,`apellido`,`correo`,`telefono_movil`,`telefono_fijo`,`domicilio`,`pais_Paises`,`ciudad_Ubicacion`,`localidad_Ubicacion`,`zipcode`) VALUES
-- ('','','','','','','','','','','','','','','');
-- INSERT INTO `Familia` (`id_familia`,`fecha_alta`,`nombre`,`apellido`,`correo`,`telefono_movil`,`telefono_fijo`,`ser_contactado`,`credito_fecha`,`credito_cantidad`,`domicilio`,`pais_Paises`,`ciudad_Ubicacion`,`localidad_Ubicacion`,`zipcode`) VALUES
-- ('','','','','','','','','','','','','','','');
-- INSERT INTO `Habilidades_Helpers` (`id_helper_Helpers`,`presentacion`,`carrera`,`universidad`,`arte`,`cocina`,`primeros_auxilios`,`asistencia_escolar`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `Experiencias_familias` (`id_helper_Helpers`,`id_familia_Familia`,`fecha_contacto`,`experiencia`,`comentarios`) VALUES
-- ('','','','','');
-- INSERT INTO `Idiomas` (`idioma`) VALUES
-- ('');
-- INSERT INTO `Disponibilidad_helper` (`id_helper_Helpers`,`dia_disponible`,`hora_desde`,`hora_hasta`) VALUES
-- ('','','','');
-- INSERT INTO `Idioma_helpers` (`id_helper_Helpers`,`idioma_Idiomas`) VALUES
-- ('','');
-- INSERT INTO `Ubicacion` (`pais_Paises`,`ciudad`,`localidad`) VALUES
-- ('','','');
-- INSERT INTO `Paises` (`pais`) VALUES
