DROP DATABASE IF EXISTS nikoartz;
DROP USER IF EXISTS 'usuario_prueba'@'%';
DROP USER IF EXISTS 'usuario_prueba'@'localhost';
DROP USER IF EXISTS 'usuario_reportes'@'%';
DROP USER IF EXISTS 'usuario_reportes'@'localhost';

CREATE DATABASE nikoartz CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE nikoartz;

CREATE USER 'usuario_prueba'@'%' IDENTIFIED BY 'Usuar1o_Clave.';
CREATE USER 'usuario_prueba'@'localhost' IDENTIFIED BY 'Usuar1o_Clave.';

CREATE USER 'usuario_reportes'@'%' IDENTIFIED BY 'Usuar1o_Reportes.';
CREATE USER 'usuario_reportes'@'localhost' IDENTIFIED BY 'Usuar1o_Reportes.';

GRANT ALL PRIVILEGES ON nikoartz.* TO 'usuario_prueba'@'%';
GRANT ALL PRIVILEGES ON nikoartz.* TO 'usuario_prueba'@'localhost';

GRANT SELECT ON nikoartz.* TO 'usuario_reportes'@'%';
GRANT SELECT ON nikoartz.* TO 'usuario_reportes'@'localhost';

FLUSH PRIVILEGES;

CREATE TABLE rol (
  idRol INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  PRIMARY KEY (idRol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE usuario (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  idRol INT NOT NULL,
  username VARCHAR(20) NOT NULL,
  password VARCHAR(512) NOT NULL,
  nombre VARCHAR(20) NULL,
  apellido VARCHAR(30) NULL,
  correo VARCHAR(75) NULL,
  telefono VARCHAR(15) NULL,
  activo BOOLEAN,
  PRIMARY KEY (idUsuario),
  CONSTRAINT fk_usuario FOREIGN KEY (idRol) REFERENCES rol (idRol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE wallpaper (
  idWallpaper INT NOT NULL AUTO_INCREMENT,
  nombreWallpaper VARCHAR(512) NOT NULL,
  descripcion VARCHAR(512) NOT NULL,
  PRIMARY KEY (idWallpaper)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha DATE,
  total DOUBLE,
  estado INT,
  PRIMARY KEY (id_factura),
  CONSTRAINT fk_factura_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (idUsuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE constante (
  id_constante INT AUTO_INCREMENT NOT NULL,
  atributo VARCHAR(25) NOT NULL,
  valor VARCHAR(150) NOT NULL,
  PRIMARY KEY (id_constante)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE role (
  rol VARCHAR(20),
  PRIMARY KEY (rol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE ruta (
  id_ruta INT AUTO_INCREMENT NOT NULL,
  patron VARCHAR(255) NOT NULL,
  rol_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_ruta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE ruta_permit (
  id_ruta INT AUTO_INCREMENT NOT NULL,
  patron VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_ruta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE estuche (
  id BIGINT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  descripcion VARCHAR(255),
  imagen_url VARCHAR(255),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO role (rol) VALUES ('ADMIN'), ('VENDEDOR'), ('USER');

INSERT INTO usuario (idUsuario, idRol, username, password, activo) VALUES
(11101, 3,  'RolexGG', 'BAMB1Y7', TRUE),
(11102, 5,  'CandiceIs', 'BTBCRT', TRUE),
(11103, 4,  'Polybus', '9N1N6', TRUE),
(11104, 9,  'Dyrhxh', '98N1Y81', TRUE),
(11105, 10, 'Epitome', 'H31UI3', TRUE),
(11106, 1,  'Calydon', 'HWYIQI', TRUE),
(11107, 6,  'fyahay', 'SSGNWY8S', TRUE),
(11108, 7,  'ZynDahaad', 'GntYg', TRUE),
(11109, 8,  'RyukiAHA', 'JSNSIN', TRUE),
(11110, 11, 'JoeyG', 'DNYAA#', TRUE);

INSERT INTO wallpaper (idWallpaper, nombreWallpaper, descripcion) VALUES
(2011 ,'Heraldo', 'Las alas no siempre son una buena señal'),
(2012 ,'Final', 'Todo camino tiene su finañ, algunos llevan a la perdicion'),
(2013 ,'Bestias', 'La humanidad siempre ha relacionado conceptos a la fauna de nuestro mundo'),
(2014 ,'Extremos', 'Hay absolutos, ¿pero que tan comunes son?'),
(2015 ,'Raices', 'Todo, sentiente o no, tiene su fuente'),
(2016 ,'Hambruna', 'Que desperdicio puede crear la vida'),
(2017 ,'Corporeal', 'La forma que toman los seres puede variar'),
(2018 ,'Oceano', 'Algunas cosas se alargan a mas de lo que se puede ver'),
(2019 ,'Mal', 'Despues de todo, nuestra naturaleza humana tiene sus problemas'),
(2020 ,'Transcendencia', 'Uno debe estar listo para dejar todo atras'),
(2021 ,'Bestias (Alternativo)', 'La humanidad siempre ha relacionado conceptos a la fauna de nuestro mundo');

INSERT INTO constante (atributo, valor) VALUES 
('dominio','localhost'),
('certificado','c:/cert'),
('dolar','520.75'),
('paypal.client-id','AUjOjw5Q1I0QLTYjbvRS0j4Amd8xrUU2yL9UYyb3TOTcrazzd3G3lYRc6o7g9rOyZkfWEj2wxxDi0aRz'),
('paypal.client-secret','EMdb08VRlo8Vusd_f4aAHRdTE14ujnV9mCYPovSmXCquLjzWd_EbTrRrNdYrF1-C4D4o-57wvua3YD2u'),
('paypal.mode','sandbox'),
('urlPaypalCancel','http://localhost/payment/cancel'),
('urlPaypalSuccess','http://localhost/payment/success');

INSERT INTO ruta (patron, rol_name) VALUES 
('/producto/nuevo', 'ADMIN'),
('/producto/guardar', 'ADMIN'),
('/producto/modificar/**', 'ADMIN'),
('/producto/eliminar/**', 'ADMIN'),
('/categoria/nuevo', 'ADMIN'),
('/categoria/guardar', 'ADMIN'),
('/categoria/modificar/**', 'ADMIN'),
('/categoria/eliminar/**', 'ADMIN'),
('/usuario/**', 'ADMIN'),
('/constante/**', 'ADMIN'),
('/role/**', 'ADMIN'),
('/usuario_role/**', 'ADMIN'),
('/ruta/**', 'ADMIN'),
('/producto/listado', 'VENDEDOR'),
('/categoria/listado', 'VENDEDOR'),
('/pruebas/**', 'VENDEDOR'),
('/reportes/**', 'VENDEDOR'),
('/facturar/carrito', 'USER'),
('/payment/**', 'USER');

INSERT INTO ruta_permit (patron) VALUES 
('/'),
('/index'),
('/errores/**'),
('/carrito/**'),
('/registro/**'),
('/fav/**'),
('/js/**'),
('/webjars/**');

INSERT INTO estuche (nombre, precio, descripcion, imagen_url) VALUES
('EleganceShield', 15.00, 'Estuche elegante y seguro.', '/img/case1.png'),
('ArmorX', 20.00, 'Protección extra fuerte.', '/img/case2.png'),
('SlimGuard', 12.50, 'Delgado y ligero.', '/img/case3.png');
