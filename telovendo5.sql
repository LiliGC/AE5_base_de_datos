#AE5 GRUPAL BASE DE DATOS-GRUPO 1: Alberto Briones, Liliana Garmendia, Diego González

#Parte 1: Crear entorno de trabajo

#Crear una base de datos
CREATE DATABASE telovendo5;

#Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.
CREATE USER 'admin_telovendo5'@'localhost' IDENTIFIED BY 'ae5_bd_grupal';
GRANT ALL PRIVILEGES ON telovendo5 TO 'admin_telovendo5'@'localhost';
FLUSH PRIVILEGES; 

#Seleccion de la base de datos

USE telovendo5;

#Parte 2: Crear dos tablas.


#La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).
CREATE TABLE usuarios(
	id_usuario TINYINT auto_increment NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    contraseña VARCHAR(12) NOT NULL,
    zona_horaria TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE current_timestamp,
    género VARCHAR(10) NOT NULL,
    teléfono_contacto VARCHAR(12) NOT NULL,
    PRIMARY KEY(id_usuario)
);

#La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).
CREATE TABLE fecha_hora_ingreso(
	id_ingreso TINYINT NOT NULL,
	id_usuario TINYINT auto_increment NOT NULL,
    fecha_hora_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE current_timestamp,
    PRIMARY KEY(id_ingreso, fecha_hora_ingreso),
    CONSTRAINT FK_idusuariofechahora FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);


#Parte 3: Modificación de la tabla
SHOW TABLES;

#Modifique el UTC por defecto.Desde UTC-3 a UTC-2.

#Pruebas para cambiar hora
SELECT UTC_TIMESTAMP;
SELECT convert_tz(UTC_timestamp(), '+00:00','-03:00');
SELECT convert_tz(UTC_timestamp(), '+00:00','-02:00');
SELECT NOW();

#UTC-3
select convert_tz(CURRENT_TIMESTAMP(),'+00:00','+01:00');
#UTC-2
select convert_tz(CURRENT_TIMESTAMP(),'+00:00','+02:00');


select convert_tz(fecha_hora_ingreso,'+00:00','+02:00') from fecha_hora_ingreso;


SET NEW.zona_horaria= convert_tz(zona_horaria,'+00:00','+02:00');

CREATE TRIGGER actualizarzona_horaria
BEFORE UPDATE ON usuarios
FOR EACH ROW
SET NEW.zona_horaria =convert_tz(zona_horaria,'+00:00','+02:00');

#Modificación de la tabla de UTC-4 (actual) a UTC-2
SET SQL_SAFE_UPDATES = 0;
UPDATE usuarios SET zona_horaria = convert_tz(current_timestamp(),'+00:00','+02:00');
SELECT *FROM usuarios;

SET SQL_SAFE_UPDATES = 0;
UPDATE fecha_hora_ingreso SET fecha_hora_ingreso = convert_tz(current_timestamp(),'+00:00','+02:00');
SELECT *FROM fecha_hora_ingreso;

#Parte 4: Creación de registros.

#Para cada tabla crea 8 registros.

#Tabla usuarios

INSERT INTO usuarios(id_usuario, nombre, apellido, contraseña, zona_horaria, género, teléfono_contacto)
		VALUES(1, "Arturo", "Chacón", "aE@io23-64nP",current_timestamp(), "masculino", "+5697245720"),
              (2, "Michelle", "Soto", "Epi@kj286-4P",current_timestamp(), "femenino","+569542305" ),
			  (3, "Rodrigo", "Tello","Dr@ty56-11P",current_timestamp(), "masculino", "+5697231102"),
			  (4, "Guillermo", "Toribio","lE7io23h-3a",current_timestamp(), "masculino", "+5697120358"),
              (5, "Andrea", "Dietz","Oa@io364P",current_timestamp(),"femenino", "+5697354215"),
              (6, "Antonio", "Cid","Ec-@o23641" ,current_timestamp(), "masculino", "+5697231103"),
			  (7, "Andrés", "Benítez","AE@jk8764n" ,current_timestamp(),"masculino", "+5697120359"),
              (8, "Fernanda", "Barrera","K7@e42664m" ,current_timestamp(),"femenino", "+5697354211");

select * from usuarios;

select convert_tz(CURRENT_TIMESTAMP(),'+00:00','+02:00') as zona_horaria from usuarios;

#Tabla fecha_hora_ingreso

INSERT INTO fecha_hora_ingreso(id_ingreso,id_usuario,fecha_hora_ingreso)
		VALUES(1,1,current_timestamp()),
              (2,2,current_timestamp()),
			  (3,3,current_timestamp()),
			  (4,4,current_timestamp()),
              (5,5,current_timestamp()),
              (6,6,current_timestamp()),
			  (7,7,current_timestamp()),
              (8,8,current_timestamp());

select * from fecha_hora_ingreso;

#Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?


#Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono, correo electronico).

CREATE TABLE Contactos(
	id_contacto TINYINT auto_increment NOT NULL,
    teléfono_contacto VARCHAR(12) NOT NULL,
    correo_electrónico varchar(25) NOT NULL,
    PRIMARY KEY(id_contacto),
	CONSTRAINT FK_idusuariocontactos FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

#Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.

ALTER TABLE contactos
ADD CONSTRAINT fk_teléfonocontactos FOREIGN KEY (teléfono_contacto) REFERENCES usuarios(teléfono_contacto);

