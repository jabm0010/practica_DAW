/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Juan Béjar
 * Created: 31-mar-2018
 */



DROP TABLE cliente_cliente;
DROP TABLE cliente_videojuego;
DROP TABLE Videojuegos;
DROP TABLE Cliente;
DROP TABLE Roles;

CREATE TABLE Cliente (
id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
nombre VARCHAR(25) NOT NULL,
correo VARCHAR(100) NOT NULL UNIQUE,
biografia VARCHAR(500),
pwd VARCHAR(25) NOT NULL,
online BOOLEAN,
CONSTRAINT nombre_l CHECK (LENGTH(nombre) > 2),
CONSTRAINT cliente_pk PRIMARY KEY (id)

);

create table Roles (
   correo VARCHAR(100) not null UNIQUE,
   rol VARCHAR(50) not null
 );


CREATE TABLE Videojuegos (
videojuegoID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
nombreVideojuego VARCHAR(50) NOT NULL,
desarrollador VARCHAR(50),
publicador VARCHAR(50),
precio FLOAT(5),
promocionado BOOLEAN,
enOferta BOOLEAN,
descuento INTEGER,
numVentas INTEGER,
CONSTRAINT videojuegos_pk PRIMARY KEY (videojuegoID)
);


CREATE TABLE cliente_cliente (
cli_id1 INTEGER NOT NULL,
cli_id2 INTEGER NOT NULL,
CONSTRAINT cliente1_fk  FOREIGN KEY (cli_id1) REFERENCES cliente,
CONSTRAINT cliente2_fk  FOREIGN KEY (cli_id2) REFERENCES cliente,
CONSTRAINT cc_pk PRIMARY KEY(cli_id1,cli_id2)
);

CREATE TABLE cliente_videojuego (
cli_id INTEGER NOT NULL,
cli_vjid INTEGER NOT NULL,
estado VARCHAR(40),
CONSTRAINT cliente_fk FOREIGN KEY(cli_id) REFERENCES cliente,
CONSTRAINT videojuego_fk FOREIGN KEY(cli_vjid) REFERENCES videojuegos,
CONSTRAINT cv_pk PRIMARY KEY(cli_id,cli_vjid)

);


--Inserción de usuarios
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('usuario','usuario@gmail.com','Esta es mi biografía','usuario',true);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('AntonioRe', 'antonio99@gmail.com', 'Hola!', '1234', false);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('Pepe1997', 'pepepepe@gmail.com', 'Hola!', 'abcd', false);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('Maria23', 'maria@gmail.com', 'Hola!', 'b', false);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('Pilar', 'pilar@gmail.com', 'Hola!', 'e', false);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('Paquita', 'paquita@gmail.com', 'Hola!', 'd',true);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('miguel', 'f@gmail.com', 'Hola!', 'f',true);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('luis', 'e@gmail.com', 'Hola!', 'e',true);

--Inserción roles
insert into Roles values ('usuario@gmail.com','USUARIOS');
insert into Roles values ('antonio99@gmail.com','USUARIOS');
insert into Roles values('b@gmail.com','USUARIOS');






-- Inserción amigos

insert into cliente_cliente(cli_id1,cli_id2) VALUES (1,5);
insert into cliente_cliente(cli_id1,cli_id2) VALUES (1,6);
insert into cliente_cliente(cli_id1,cli_id2) VALUES (1,7);

insert into cliente_cliente(cli_id1,cli_id2) VALUES (4,5);
insert into cliente_cliente(cli_id1,cli_id2) VALUES (4,6);
insert into cliente_cliente(cli_id1,cli_id2) VALUES (4,7);





--Inserción de videojuegos

insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio,PROMOCIONADO,ENOFERTA,DESCUENTO,NUMVENTAS) VALUES ('Overwatch', 'Blizzard', 'Blizzard',39.99,true,false,0,1300);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio,PROMOCIONADO,ENOFERTA,DESCUENTO,NUMVENTAS) VALUES ('Bioshock Infinite', '2K', 'Irrational Games',19.99,true,false,0,300);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio,PROMOCIONADO,ENOFERTA,DESCUENTO,NUMVENTAS) VALUES ('Dark Souls III', 'Bandai Namco', 'From Software',49.99,true,false,0,500);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio,PROMOCIONADO,ENOFERTA,DESCUENTO,NUMVENTAS) VALUES ('Sid Meier Civilization VI', 'Firaxis', 'Firaxis',39.99,false,true,20,200);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio,PROMOCIONADO,ENOFERTA,DESCUENTO,NUMVENTAS) VALUES ('Doom', 'Bethesda', 'id Software',49.99,false,false,0,400);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio,PROMOCIONADO,ENOFERTA,DESCUENTO,NUMVENTAS) VALUES ('Hollow Knight', 'Team Cherry', 'Team Cherry',14.99,false,true,30,200);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio,PROMOCIONADO,ENOFERTA,DESCUENTO,NUMVENTAS) VALUES ('PUBG', 'PUBG Corporation', 'Bluehole',19.99,false,true,30,2000);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio,PROMOCIONADO,ENOFERTA,DESCUENTO,NUMVENTAS) VALUES ('NieR Automata', 'Square Enix', 'Platinum Games',39.99,false,false,0,250);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio,PROMOCIONADO,ENOFERTA,DESCUENTO,NUMVENTAS) VALUES ('The Witcher 3', 'Bandai Namco', 'CD Projekt',39.99,false,true,20,800);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio,PROMOCIONADO,ENOFERTA,DESCUENTO,NUMVENTAS) VALUES ('Cuphead', 'Microsoft', 'Studio MDHR',19.99,false,false,0,400);




--Insercion valores relacion cliente-videojuego
insert into CLIENTE_VIDEOJUEGO(cli_id,cli_vjid,estado) VALUES (1,3,'Desinstalado');
insert into CLIENTE_VIDEOJUEGO(cli_id,cli_vjid,estado) VALUES (1,4,'Pendiente de actualización');
insert into CLIENTE_VIDEOJUEGO(cli_id,cli_vjid,estado) VALUES (1,7,'Instalado');
