drop table if exists estado;
drop table if exists paga;
drop table if exists aluga;
drop table if exists reserva;
drop table if exists oferta;
drop table if exists posto;
drop table if exists espaco;
drop table if exists fiscaliza;
drop table if exists arrenda;
drop table if exists alugavel;
drop table if exists edificio;
drop table if exists fiscal;
drop table if exists user;

CREATE TABLE reserva (
numero varchar(255) NOT NULL UNIQUE,
primary key(numero));

CREATE TABLE user (
nif varchar(9) NOT NULL UNIQUE,
nome varchar(80) NOT NULL,
telefone varchar(26) NOT NULL,
primary key(nif));


CREATE TABLE fiscal (
id integer NOT NULL UNIQUE,
empresa varchar (255) NOT NULL,
primary key (id));

CREATE TABLE edificio (
morada varchar(255) NOT NULL UNIQUE,
primary key (morada));

CREATE TABLE alugavel(
morada varchar(255) NOT NULL,
codigo varchar(255) NOT NULL,
foto varchar(255)  NOT NULL,
primary key (morada, codigo),
foreign key (morada) references edificio (morada));

CREATE TABLE arrenda (
morada varchar(255) NOT NULL,
codigo varchar(255) NOT NULL,
nif varchar (9) NOT NULL,
primary key (morada, codigo),
foreign key (morada, codigo) references alugavel (morada, codigo),
foreign key (nif) references user(nif));

CREATE TABLE fiscaliza (
id intger  NOT NULL,
morada varchar(255) NOT NULL,
codigo varchar(255) NOT NULL,
primary key (id, morada, codigo),
foreign key (id) references fiscal (id),
foreign key (morada, codigo) references arrenda (morada, codigo));
 
CREATE TABLE Espaco (
morada varchar(255) NOT NULL,
codigo varchar(255) NOT NULL,
primary key (morada, codigo),
foreign key (morada, codigo) references alugavel (morada, codigo));

CREATE TABLE posto (
morada varchar(255) NOT NULL,
codigo varchar(255) NOT NULL,
codigo_espaco varchar(255) NOT NULL,
primary key (morada, codigo),
foreign key (morada, codigo) references alugavel(morada, codigo),
foreign key (morada, codigo_espaco) references espaco(morada, codigo));

CREATE TABLE oferta (
morada varchar(255) NOT NULL,
codigo varchar(255) NOT NULL,
data_inicio date NOT NULL,
data_fim date NOT NULL,
tarifa numeric(19,4) NOT NULL,
primary key (morada, codigo, data_inicio),
foreign key (morada, codigo) references alugavel(morada, codigo))
ON DELETE CASCADE;

CREATE TABLE aluga (
morada varchar(255) NOT NULL,
codigo varchar(255) NOT NULL,
data_inicio date NOT NULL,
nif varchar(9) NOT NULL,
numero varchar(255) NOT NULL,
primary key (morada, codigo, data_inicio, nif, numero),
foreign key (morada, codigo, data_inicio) references oferta(morada, codigo, data_inicio),
foreign key (nif) references user (nif),
foreign key (numero) references reserva(numero));

CREATE TABLE paga (
numero varchar(255) NOT NULL UNIQUE,
data timestamp NOT NULL,
metodo varchar (255),
primary key (numero),
foreign key (numero) references reserva(numero));

CREATE TABLE estado (
numero varchar(255) NOT NULL UNIQUE,
timestamp timestamp NOT NULL,
estado varchar(255) NOT NULL,
primary key (numero, time_stamp),
foreign key (numero) references reserva(numero));
