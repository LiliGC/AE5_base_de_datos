# AE5 MÓDULO 5 BASE DE DATOS RELACIONES

***Grupo 1:Alberto Briones, Liliana Garmendia, Diego González*** 

##PROBLEMA

La empresa “Te lo Vendo” es un emprendimiento de un grupo de jóvenes, quienes necesitan vender sus productos en línea. Actualmente toman sus pedidos vía telefónica y a través del correo electrónico. Al no existir un sistema centralizado para los pedidos, es complejo tener control oportuno de las entregas, lo que genera que en algunos casos no se concreten algunos pedidos.
Una opción propuesta es manejar una planilla de cálculo para el registro de los pedidos y realización de seguimiento. Si bien es factible su uso, a medida que se agreguen nuevos clientes el archivo irá creciendo, y será complejo mantener la integridad entre los datos, impidiendo relacionarlos adecuadamente.

##SOLUCIÓN

Dados los antecedentes anteriores, es necesario desarrollar una solución tecnológica que cubra los procesos de negocio descritos y que proponga una mejora en la gestión, el control, la seguridad, y disponibilidad de información para el negocio y sus clientes. El sistema debe permitir presentar productos, tomar pedidos y hacer seguimiento de estos y la gestión de clientes.

###DESARROLLO

####Parte 1: Crear entorno de trabajo
*Crear una base de datos
*Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.

####Parte 2: Crear dos tablas.
*La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).
*La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).

####Parte 3: Modificación de la tabla
*Modifique el UTC por defecto.Desde UTC-3 a UTC-2.

####Parte 4: Creación de registros.
*Para cada tabla crea 8 registros.

####Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?

####Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono, correo electronico).

####Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.
