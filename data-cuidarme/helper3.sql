-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Paises'
-- 
-- ---

DROP TABLE IF EXISTS `Paises`;

CREATE TABLE `Paises` (
  `id_pais` VARCHAR(45),
  PRIMARY KEY (`id_pais`)
);

-- ---
-- Table 'Ubicacion'
-- 
-- ---

DROP TABLE IF EXISTS `Ubicacion`;

CREATE TABLE `Ubicacion` (
  `id_pais` VARCHAR(45),
  `ciudad` VARCHAR(45) NOT NULL,
  `localidad` VARCHAR(45) NULL,
  PRIMARY KEY (`ciudad`, `localidad`, `id_pais`)
);


-- ---
-- Table 'Helpers'
-- Datos de las niñeras
-- ---

DROP TABLE IF EXISTS `Helpers`;
		
CREATE TABLE `Helpers` (
  `id_helper` INTEGER NOT NULL AUTO_INCREMENT,
  `fecha_alta` DATE NOT NULL,
  `user_facebook` VARCHAR(45) NOT NULL,
  `documento_tipo` INT NOT NULL,
  `documento_nro` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono_movil` INTEGER NOT NULL,
  `telefono_fijo` INTEGER,
  `domicilio` VARCHAR(255) NOT NULL,
  `id_pais` VARCHAR(45) NOT NULL,
  `ciudad_Ubicacion` VARCHAR(45) NOT NULL,
  `localidad_Ubicacion` VARCHAR(45) NULL,
  `zipcode` INTEGER,
  PRIMARY KEY (`id_helper`)
);

-- ---
-- Table 'Familia'
-- datos de los padres
-- ---

DROP TABLE IF EXISTS `Familias`;
		
CREATE TABLE `Familias` (
  `id_familia` INTEGER NULL AUTO_INCREMENT,
  `fecha_alta` DATE NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono_movil` INTEGER,
  `telefono_fijo` INTEGER NOT NULL,
  `ser_contactado` BOOLEAN DEFAULT NULL,
  `credito_fecha` DATE NULL DEFAULT NULL,
  `credito_cantidad` INTEGER NULL DEFAULT NULL,
  `domicilio` VARCHAR(45) NOT NULL,
  `id_pais` VARCHAR(45),
  `ciudad_Ubicacion` VARCHAR(45) NOT NULL,
  `localidad_Ubicacion` VARCHAR(45),
  `zipcode` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id_familia`)
);

-- ---
-- Table 'Habilidades_Helpers'
-- 
-- ---

DROP TABLE IF EXISTS `Habilidades_Helpers`;
		
CREATE TABLE `Habilidades_Helpers` (
  `id_helper` INTEGER NOT NULL,
  `presentacion` VARCHAR(300),
  `carrera` VARCHAR(50), 
  `universidad` VARCHAR(100),
  `arte` VARCHAR(50),
  `cocina` BOOLEAN DEFAULT NULL,
  `primeros_auxilios` BOOLEAN DEFAULT NULL,
  `asistencia_escolar` BOOLEAN DEFAULT NULL
);

-- ---
-- Table 'Experiencias_familias'
-- 
-- ---

DROP TABLE IF EXISTS `Experiencias_familias`;
		
CREATE TABLE `Experiencias_familias` (
  `id_helper` INTEGER NOT NULL,
  `id_familia` INTEGER NOT NULL,
  `fecha_contacto` DATE NOT NULL,
  `experiencia` BOOLEAN DEFAULT NULL,
  `comentarios` VARCHAR(400) NULL,
  PRIMARY KEY (`id_helper`, `id_familia`, `fecha_contacto`)
);

-- ---
-- Table 'Idiomas'
-- 
-- ---

DROP TABLE IF EXISTS `Idiomas`;
		
CREATE TABLE `Idiomas` (
  `id_idioma` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_idioma`)
);

-- ---
-- Table 'Disponibilidad_helper'
-- 
-- ---

DROP TABLE IF EXISTS `Disponibilidad_helper`;
		
CREATE TABLE `Disponibilidad_helper` (
  `id_helper` INTEGER NOT NULL,
  `dia_disponible` VARCHAR(10) NOT NULL,
  `hora_desde` TINYINT(2) NOT NULL,
  `hora_hasta` TINYINT(2) NOT NULL
);

-- ---
-- Table 'Idioma_helpers'
-- 
-- ---

DROP TABLE IF EXISTS `Idioma_helpers`;
		
CREATE TABLE `Idioma_helpers` (
  `id_helper` INTEGER,
  `id_idioma` VARCHAR(20)
);

-- ---
-- Creacion de Foreign Key
-- ---
ALTER TABLE `Helpers` ADD FOREIGN KEY (id_pais) REFERENCES `Paises` (`id_pais`);
ALTER TABLE `Familias` ADD FOREIGN KEY (id_pais) REFERENCES Paises(id_pais);
ALTER TABLE `Habilidades_Helpers` ADD FOREIGN KEY (id_helper) REFERENCES Helpers(id_helper);
ALTER TABLE `Experiencias_familias` ADD FOREIGN KEY (id_helper) REFERENCES Helpers(id_helper);
ALTER TABLE `Experiencias_familias` ADD FOREIGN KEY (id_familia) REFERENCES Familias(id_familia);
ALTER TABLE `Disponibilidad_helper` ADD FOREIGN KEY (id_helper) REFERENCES Helpers(id_helper);
ALTER TABLE `Idioma_helpers` ADD FOREIGN KEY (id_helper) REFERENCES Helpers(id_helper);
ALTER TABLE `Idioma_helpers` ADD FOREIGN KEY (id_idioma) REFERENCES Idiomas(id_idioma);
ALTER TABLE `Ubicacion` ADD FOREIGN KEY (id_pais) REFERENCES Paises(id_pais);


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
-- ('');
