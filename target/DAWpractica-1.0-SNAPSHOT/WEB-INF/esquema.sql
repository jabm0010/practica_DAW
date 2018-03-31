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

CREATE TABLE Cliente (
id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
nombre VARCHAR(25) NOT NULL,
correo VARCHAR(100) NOT NULL,
biografia VARCHAR(500),
pwd VARCHAR(25) NOT NULL,
online BOOLEAN,
CONSTRAINT cliente_pk PRIMARY KEY (id)

);

CREATE TABLE Videojuegos (
videojuegoID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
nombreVideojuego VARCHAR(50) NOT NULL,
desarrollador VARCHAR(50),
publicador VARCHAR(50),
precio FLOAT(5),
CONSTRAINT videojuegos_pk PRIMARY KEY (videojuegoID)
);


CREATE TABLE cliente_cliente (
cli_id1 INTEGER NOT NULL,
cli_id2 INTEGER NOT NULL,
CONSTRAINT cliente1_fk  FOREIGN KEY (cli_id1) REFERENCES cliente,
CONSTRAINT cliente2_fk  FOREIGN KEY (cli_id2) REFERENCES cliente
);

CREATE TABLE cliente_videojuego (
cli_id INTEGER NOT NULL,
cli_vjid INTEGER NOT NULL,
CONSTRAINT cliente_fk FOREIGN KEY(cli_id) REFERENCES cliente,
CONSTRAINT videojuego_fk FOREIGN KEY(cli_vjid) REFERENCES videojuegos

);


--Inserción de usuarios
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('usuario','usuario@gmail.com','Esta es mi biografía','usuario',true);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('AntonioRe', 'antonio99@gmail.com', 'Hola!', '1234', false);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('Pepe1997', 'pepepepe@gmail.com', 'Hola!', 'abcd', false);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('b', 'b@gmail.com', 'Hola!', 'b', false);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('e', 'c@gmail.com', 'Hola!', 'e', false);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('Jose', 'd@gmail.com', 'Hola!', 'd',true);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('miguel', 'f@gmail.com', 'Hola!', 'f',true);
insert into Cliente (nombre,correo,biografia,pwd,online) VALUES ('luis', 'e@gmail.com', 'Hola!', 'e',true);

-- Inserción amigos

insert into cliente_cliente(cli_id1,cli_id2) VALUES (1,5);
insert into cliente_cliente(cli_id1,cli_id2) VALUES (1,6);
insert into cliente_cliente(cli_id1,cli_id2) VALUES (1,7);




--Inserción de videojuegos

insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Age of Empires II', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Assassin´s Creed I', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Assassin´s Creed II', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Assassin´s Creed III', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Bioshock', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Bioshock 2', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Bioshock Infinite', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Borderlands', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Borderlands 2', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Dark Souls', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Dark Souls II', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Dark Souls III', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('DOOM', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Fallout 1', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Fallout 2', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Fallout 3', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Fallout 4', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Fallout: New Vegas', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Far Cry 1', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Far Cry 2', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Far Cry 3', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Far Cry 4', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Half Life', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Half Life 2', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Metro 2033', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Metro 2034', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('TES: Skyrim', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Portal', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Portal 2', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('Tomb Raider', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('The Witcher', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('The Witcher 2', 'a', 'b',49.99);
insert into Videojuegos (nombreVideojuego,desarrollador,publicador,precio) VALUES ('The Witcher 3', 'a', 'b',49.99);

