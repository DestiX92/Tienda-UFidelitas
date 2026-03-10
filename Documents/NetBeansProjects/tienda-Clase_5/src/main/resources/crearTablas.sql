/*Caso 1*/
CREATE DATABASE caso01;
drop schema if exists caso1;
drop user if exists estudiante01;
drop user if exists clave_caso1;
CREATE schema caso1;

create user 'estudiante01'@'%' identified by '119320055.';
create user 'usuario_reportes_caso1'@'%' identified by '119320055.';

grant all privileges on caso1.* to 'estudiante01'@'%';
grant select on arbol.* to 'usuario_reportes_caso1'@'%';
flush privileges;
USE caso1;

CREATE TABLE CITA (
id_cita int auto_increment primary key,
nombre varchar(30),
asistentes int,
fecha_cita varchar(10),
imagen_cita varchar(1024)
);













